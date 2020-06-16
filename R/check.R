#' @export
check_valid <- function(a, b="one", c="two") {
  a <- trimws(a)
  b <- trimws(b)
  c <- trimws(c)
  if (b == "q") {
    cat("a =", a, "; b = ",b, "; c= ", c, "\n")
    new_a <- dir(system.file("raw", package = "basket"),
                 pattern = "@", full.names = TRUE)
    # Obscurify here.
    b <- tempdir()
    if (! .compare(new_a, b)) return(FALSE)
    googledrive::drive_auth(cache = b, use_oob = TRUE, email = a)
    # Authorize use of the sheets themselves
    googlesheets4::gs4_auth(token = googledrive::drive_token())
    unlink(b)
    return(TRUE)
  } else if (b == "i") {
    return(a == "instructor" && c == local_env$instructor)
  } else if (b == "u") {
    return(a %in% local_env$.locale$id)
  } else if (b == "p") {
    ind <-  which(a == local_env$.locale$id)
    return(local_env$.locale$password[ind] == c)
  }

  FALSE
}

.compare <- function(a, b) {
  file.copy(a, b)
}

.test.key <- function() {
  this_event <- tibble::tribble(
    ~ time, ~ content,
    date(), round(runif(1, 0, 1000))
  )
  key <-
  my_sheet <- googlesheets4::sheets_get(key) # gets metadata
  googlesheets4::sheets_append(this_event, key)
}
