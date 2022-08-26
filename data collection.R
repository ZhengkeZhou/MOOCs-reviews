library('rvest')
rm(list = ls())

reviews <- NULL
ratings <- NULL
day <- NULL
helpful <- NULL
reviews_urls <- NULL

for (j in 1: 26){
  url <- paste0("https://www.coursera.org/learn/google-data-analytics-capstone/reviews?page=", j)
  webpage <- read_html(url)

#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(2) > div._ng613ig.review-text > div._1qfi0x77 > div._1mzojlvw
#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(2) > div._xliqh9g.e2e-helpful-button-col > button > span
#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(25)
#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(26)
#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(2) > div._xliqh9g.e2e-helpful-button-col > button > span > span:nth-child(2)
#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(2) > div._xliqh9g.e2e-helpful-button-col > button > span > span:nth-child(2)
#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(3) > div._xliqh9g.e2e-helpful-button-col > button > span > span:nth-child(2)




 for (i in 1:26){
   node_review <- html_node(webpage, paste0 ("#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(",i,") > div._ng613ig.review-text > div.reviewText"))
   node_rating <- html_node(webpage, paste0 ("#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(",i,") > div._ng613ig.review-text > div._1qfi0x77 > div._1mzojlvw"))
   node_day <- html_node(webpage, paste0("#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(",i,") > div._ng613ig.review-text > div._1qfi0x77 > div.dateOfReview.p-x-1s.m-b-0.text-secondary.font-xs"))
   node_helpful <- html_node(webpage, paste0("#rendered-content > div > div > div._1d3lkver.CDPReviewsPage.ReviewsPage > div.rc-ReviewsContainer > div.rc-ReviewsList.m-b-3 > div:nth-child(",i,") > div._xliqh9g.e2e-helpful-button-col > button > span > span:nth-child(2)"))
  
   reviews[(j-1)*25+i] <- html_text(node_review)
   ratings[(j-1)*25+i] <- html_text(node_rating)
   day[(j-1)*25+i] <- html_text(node_day)
   helpful[(j-1)*25+i] <- html_text(node_helpful)
   reviews_urls[(j-1)*25+i]<- html_attr(node_review, 'href')
  
   print(paste0("Retrieving data of reviews ", (j-1)*25+i, ": ", reviews[(j-1)*25+i],". we are on page:",j))
}
 Sys.sleep(2)
}
collected_data_frame <- data.frame(cbind(reviews, ratings, day, helpful,  reviews_urls))
write.csv (collected_data_frame, "E:/UVA/Thesis/cousera data/data9.csv")

