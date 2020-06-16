# set the option hooks for exercises
#

local_env <- new.env()
local_env$instructor <- "hello"
local_env$key <- "1w3fEld2rZlR_6FuzvkA-viOLBA5JdqD3xHl-LuLX3-Y"
.onLoad <- function(libname, pkgname) {
  where <- dir(path=system.file("raw/", package = "basket"),
               pattern = "^lo",
               full.names = TRUE)
   local_env$.locale <- read.csv(
     where,
     stringsAsFactors = FALSE
    )
}
