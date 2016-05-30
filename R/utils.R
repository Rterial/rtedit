txt.safe_text <- function(x){
  str_in <- iconv(x, "latin1", "ASCII", sub="")  %>%  stri_enc_toutf8()
  str_in %>%
    stri_replace_all_fixed('Ã¢<U+0080><U+0093>',"'\\-'") %>%
    stri_enc_toascii %>% htmlEscape %>%
    stri_unescape_unicode %>%
    stri_replace_all_regex("\\032\\032\\032","-")%>%
    stri_replace_all_regex("\n","") %>%
    stri_trim_both
}


paste.html <- function(...){
  pure.html(paste0(...,collapse="\n"))
}


pure.html <- function (text, ...) {
  htmlText <- c(text, as.character(list(...)))
  htmlText <- paste(htmlText, collapse = " ")
  attr(htmlText, "html") <- TRUE
  class(htmlText) <- c("html", "character")
  htmlText
}


pure.js <- function(txt){
  a <- shQuote(txt)
  b <- gsub('\n', '\\\\n',a)
  return(b)
}


css.valid <- function(x){
  if(grepl('\\%$|\\%;$',x) & (x > 100)){
    "100%"
  }else if(is.numeric(x)&!grepl('px',x)){
    paste0(x,"px")
  }else{
    x
  }
}
