#!/usr/bin/env Rscript

.map2color = function(x,pal,limits=NULL){
	if (is.null(limits)) limits=range(x)
	pal[findInterval(x,seq(limits[1],limits[2],length.out=length(pal)+1), all.inside=TRUE)]
}

#' Simple macaque brain plot
#'
#' This function plots data onto a simple macaque brain.
#' 
#' @param values Vector of values to be plotted. Names are optional and should correspond with region names. If names are not provided, `regions` must be provided.
#' @param regions Vector of region names. Should be the same length as `values`. Required if `values` is an unnamed vector.
#' @param base_image Base image to be used. Currently, only the default `"chiou&decasien2022"` is supported.
#' @param color If `TRUE`, `values` are interpreted as color values to be plotted.
#' @param color.family Source of color palettes. Should be one of `c("brewer", "viridis")`.
#' @param color.theme Specific palette supported by one of the `color.family` sources.
#' @param color.limits Limits for the color range. It `NULL`, limits will be calculated from the data.
#' @param legend If `TRUE`, a legend will be included.
#' @param legend.title Custom title for the legend. Ignored if `legend` is not `TRUE`.
#' @param labels If `TRUE`, brain regions are labeled.
#' @return A ggplot object.
#' @export
plot_brain = function(
	values=NULL,
	regions=NULL,
	base_image=NULL,
	color=NULL,
	color.family=c('viridis','brewer'),
	color.theme=NULL,
	color.limits=NULL,
	legend=FALSE,
	labels=FALSE,
	legend.title=NULL
) {
	suppressMessages(require(svgtools,warn.conflicts=FALSE))
	suppressMessages(require(xml2,warn.conflicts=FALSE))
	suppressMessages(require(purrr,warn.conflicts=FALSE))
	suppressMessages(require(ggplot2,warn.conflicts=FALSE))
	suppressMessages(require(svgparser,warn.conflicts=FALSE))
	
	if (is.null(values)) stop('"values" must not be NULL!')
	if (is.null(regions) && is.null(names(values))) stop('Either "values" must be a named vector or "regions" must be provided.')
	if (!is.null(regions) && (length(regions) %% length(values)) != 0) stop('Length of "regions" and "values" does not conform.')
	if (is.null(regions)) regions = names(values)
	
	if (any(c('character','factor','ordered','logical') %in% class(values))) {
		if (!is.null(color) && color) {
			colors = values
		} else {
			color.family = intersect(color.family,c('brewer'))[1]
			if (color.family == 'brewer') {
				suppressMessages(require(RColorBrewer,warn.conflicts=FALSE))
				if (is.null(color.theme)) color.theme = 'Set3'
				if (!color.theme %in% c('Accent','Dark2','Paired','Pastel1','Pastel2','Set1','Set2','Set3'))
					stop('"color.theme" must be one of c("Accent","Dark2","Paired","Pastel1","Pastel2","Set1","Set2","Set3")')
				colors = suppressWarnings(RColorBrewer::brewer.pal(length(unique(values)),name=color.theme))
				names(colors) = unique(values)
				colors = colors[values]
			}
		}
	} else if (any(c('numeric','integer') %in% class(values))) {
		if (!is.null(color.limits) && length(color.limits) != 2 && !class(color.limits) %in% c('integer','numeric')) stop('"color.limits" must be "integer" or "numeric" class of length 2')

		color.family = intersect(color.family,c('brewer','viridis'))[1]
		if (color.family == 'brewer') {
			suppressMessages(require(RColorBrewer,warn.conflicts=FALSE))
			if (is.null(color.theme)) color.theme = 'PuBu'
			if (!color.theme %in% c('Blues','BuGn','BuPu','GnBu','Greens','Greys','Oranges','OrRd','PuBu','PuBuGn','PuRd','Purples','RdPu','Reds','YlGn','YlGnBu','YlOrBr','YlOrRd','BrBG','PiYG','PRGn','PuOr','RdBu','RdGy','RdYlBu','RdYlGn','Spectral'))
				stop('"color.theme" must be one of c("Blues","BuGn","BuPu","GnBu","Greens","Greys","Oranges","OrRd","PuBu","PuBuGn","PuRd","Purples","RdPu","Reds","YlGn","YlGnBu","YlOrBr","YlOrRd","BrBG","PiYG","PRGn","PuOr","RdBu","RdGy","RdYlBu","RdYlGn","Spectral")')
			colors = .map2color(values,RColorBrewer::brewer.pal(9,name=color.theme),limits=color.limits)
		} else if (color.family == 'viridis') {
			suppressMessages(require(viridis,warn.conflicts=FALSE))
			if (is.null(color.theme)) color.theme = 'viridis'
			if (!color.theme %in% c('magma','A','inferno','B','plasma','C','viridis','D','cividis','E','rocket','F','mako','G','turbo','H'))
				stop('"color.theme" must be one of c("magma","A","inferno","B","plasma","C","viridis","D","cividis","E","rocket","F","mako","G","turbo","H")')
			colors = .map2color(values,viridis::viridis_pal(option=color.theme)(255),limits=color.limits)
		}
	} else {
		stop('"values" must be one of c("integer","numeric","logical","character","factor")')
	}
	names(colors) = regions
	
	if (is.null(base_image) || base_image == 'chiou&decasien2022') {
		svg = system.file('macaque_brain.svg',package='macaquesimplebrain')
	} else {
		stop('"chiou&decasien2022" is currently the only supported base image')
	}
	xml = svgtools::read_svg(svg)
	
	these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@class="',i,'"]'))),collapse='|'))
	
	purrr::walk2(these.nodes, colors[xml2::xml_attr(these.nodes,'class')], ~xml2::xml_set_attr(.x, 'fill', .y))
	purrr::walk2(these.nodes, 'inline', ~xml2::xml_set_attr(.x, 'display', .y))
	
	these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@class="label-',i,'"]'))),collapse='|'))
	purrr::walk2(these.nodes, if(labels) '#000' else 'none', ~xml2::xml_set_attr(.x, 'fill', .y))
	purrr::walk2(these.nodes, if(labels) 'inline' else 'none', ~xml2::xml_set_attr(.x, 'display', .y))
	these.nodes = xml2::xml_find_all(xml,paste(unlist(lapply(regions,function(i) paste0('//*[@id="path-',i,'"]'))),collapse='|'))
	purrr::walk2(these.nodes, if(labels) '#000' else 'none', ~xml2::xml_set_attr(.x, 'stroke', .y))
	purrr::walk2(these.nodes, if(labels) 'inline' else 'none', ~xml2::xml_set_attr(.x, 'display', .y))
	
	g = svgparser::read_svg(toString(xml))
	
	if (any(c('character','factor','ordered','logical') %in% class(values))) {
		if (legend) {
			if (!is.null(color) && color) {
				p = ggplot(data=data.frame(x=(0:(length(regions)-1))/(length(regions)-1),y=(0:(length(regions)-1))/(length(regions)-1),regions,values=regions,colors),aes(x,y)) + geom_polygon(mapping=aes(fill=values),alpha=0,show.legend=TRUE) + scale_fill_manual(values=colors)
			} else {
				legend.colors = unique(data.frame(values,colors))$colors
				names(legend.colors) = unique(data.frame(values,colors))$values
				p = ggplot(data=data.frame(x=(0:(length(regions)-1))/(length(regions)-1),y=(0:(length(regions)-1))/(length(regions)-1),regions,values,colors),aes(x,y)) + geom_polygon(mapping=aes(fill=values),alpha=0,show.legend=TRUE) + scale_fill_manual(values=legend.colors)
			}
		} else {
			p = ggplot() + geom_blank(mapping=aes(fill=values),show.legend=FALSE) + scale_fill_manual(values=colors)
		}
	} else if (any(c('numeric','integer') %in% class(values))) {
		if (color.family == 'brewer') {
			p = ggplot() + geom_blank(mapping=aes(fill=if (!is.null(color.limits)) color.limits else values),show.legend=TRUE) + scale_fill_gradientn(colors=RColorBrewer::brewer.pal(9,name=color.theme))
		} else if (color.family == 'viridis') {
			p = ggplot() + geom_blank(mapping=aes(fill=if (!is.null(color.limits)) color.limits else values),show.legend=TRUE) + scale_fill_viridis(option=color.theme)
		}
	}
	p = p + annotation_custom(g,xmin=0,xmax=1.25,ymin=0,ymax=1)
	if (legend) {
		if (any(c('character','factor','ordered','logical') %in% class(values))) {
			p = p + theme_void(base_size=24) + theme(legend.position='right',legend.margin=margin(r = 0.25, unit='in')) + guides(fill=guide_legend(position='right',override.aes=list(alpha=1)))
			if (!is.null(legend.title)) p + labs(fill=legend.title) else p
		} else {
			p = p + theme_void(base_size=24) + theme(legend.margin=margin(r = 0.25, unit='in'))
			if (!is.null(legend.title)) p + labs(fill=legend.title) else p
		}
	} else {
		p + theme_void(base_size=24) + theme(legend.position='none')
	}
}