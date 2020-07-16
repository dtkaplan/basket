#' A simple stress test
#'
stress_test <-
  function(email = "statprep.annie@gmail.com",
           key = "1jiV11I9tlEfAhRrkYqn6kPtkNma04TEpSCk-XMSuIRM") {
    library(basket)
    library(googlesheets4)
    basket::check_valid(email, 'q', key)

    MyData <- mosaicData::HELPrct

    for (k in 1:100) {
      ind <- ceiling(runif(1, 0, nrow(MyData)))
      df <- data.frame(iter = k, timestamp = date())
      df <- cbind(df, MyData[ind,1:16])
      googlesheets4::sheet_append(key, df)
      Sys.sleep(.1)
    }

}
