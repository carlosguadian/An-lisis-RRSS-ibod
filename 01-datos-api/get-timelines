###CARGAR LIBRERIAS####
library(rtweet)
library(tidyverse)
library(lattice)
library(udpipe)
library(magick)
library(cowplot)
library(ggimage)
library(ggplot2)
library(grid)
library(ggthemes)

###obtener timelines

tmls <- get_timelines(c('usuario1','usuario2','usuario3'), n = 3200)
write_as_csv(tmls, 'usuarios', prepend_ids = TRUE, na = "",
             fileEncoding = "UTF-8")

## plot the frequency of tweets for each user over time
tmls %>%
  dplyr::filter(created_at > "2017-10-29") %>%
  dplyr::group_by(screen_name) %>%
  ts_plot("days", trim = 1L) +
  ggplot2::geom_point() +
  ggplot2::theme_minimal() +
  ggplot2::theme(
    legend.title = ggplot2::element_blank(),
    legend.position = "bottom",
    plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frecuencia de las publicaciones en TW",
    subtitle = "Twitter status (tweet) agregados por día desde (poner fecha)",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )

#######################################

# En caso que pese mucho el archivo eliminar variables no necesarias

tmls$symbols = NULL
tmls$quoted_location = NULL
tmls$quoted_verified = NULL
tmls$quoted_user_id = NULL
tmls$quoted_status_id = NULL
tmls$reply_to_user_id =NULL
tmls$verified = NULL
tmls$mentions_user_id = NULL
tmls$retweet_status_id = NULL
tmls$urls_t.co = NULL
tmls$urls_url = NULL
tmls$media_t.co = NULL
tmls$ext_media_type = NULL
tmls$profile_url = NULL
tmls$profile_background_url = NULL
tmls$profile_banner_url = NULL
tmls$profile_image_url = NULL
tmls$protected = NULL
tmls$profile_url = NULL
tmls$geo_coords = NULL
tmls$coords_coords = NULL
tmls$bbox_coords = NULL
tmls$quote_count = NULL
tmls$reply_count = NULL
tmls$reply_to_status_id = NULL
tmls$user_id = NULL
tmls$status_id = NULL
tmls$display_text_width = NULL
tmls$media_expanded_url = NULL
tmls$media_url = NULL
tmls$media_type = NULL
tmls$ext_media_expanded_url = NULL
tmls$ext_media_t.co = NULL
tmls$ext_media_url = NULL
tmls$profile_expanded_url = NULL
tmls$urls_expanded_url = NULL
tmls$place_url = NULL


#######################################

#Comparativas y análisis timelines

#https://rpubs.com/Joaquin_AR/334526
