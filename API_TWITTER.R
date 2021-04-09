# Environnement -------------------------------------------------------
rm(list=ls())
gc()

# Packages -------------------------------------------------------
suppressPackageStartupMessages({
  library(ggplot2) 
  library(dplyr)
  library(tidyr)
  library(stringi)
  library(stringr)
  library(rtweet) 
  library(tidyverse)
})


#  Tokens (tweetR) -----------------------------------------------------------------
consumer_key = ''
consumer_secret = ''
access_token = ''
access_token_secret = ''
options(httr_oauth_cache=TRUE)
setup_twitter_oauth(consumer_key = consumerKey, consumer_secret = consumerSecret,
                    access_token = accessToken, access_secret = accessSecret)


# request -----------------------------------------------------------------
## hashtags
resultsHashtag <- NULL
hashtags <- c("#SVG", "#staysafeSVG", "#volcano", "#lasoufriere", "#redalert")
for(h in 1:length(hashtags)){
  rt <- search_tweets(hashtags[h], n = 1000, include_rts = FALSE)
  resultsHashtag <- rbind(resultsHashtag, rt)
}
write.csv2(resultsHashtag, "C://GIT//LaSoufriere_SVG//results//crisis_SVG_2021_byHashtags.csv")

## timeline
tmls <- get_timelines(c("NEMOSVG","ComradeRalph","UWISeismic Research", "CultureVolcan"), n = 3200)
write.csv2(tmls, "C://GIT//LaSoufriere_SVG//results//crisis_SVG_2021_byTimeline.csv")
