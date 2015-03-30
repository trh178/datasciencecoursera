rankhospital <- function(state, outcome, num = "best") {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(!is.element(state, data$State))
        stop("invalid state")
    
    if(!is.element(outcome, c("heart attack", "heart failure", "pneumonia")))
        stop("invalid outcome")
    
    rel.data <- data.frame("state" = data$State, 
                           "hospital" = data$Hospital.Name, 
                           "heart.attack" = suppressWarnings(as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)), 
                           "heart.failure" = suppressWarnings(as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)), 
                           "pneumonia" = suppressWarnings(as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)))
    
    state.data <- rel.data[rel.data$state == state,]
    outcome <- gsub(" ", ".", outcome)
    ordered <- state.data[with(state.data, order(state.data[[outcome]], hospital, na.last=NA)),]

    if(num == "best") num = 1
    if(num == "worst") num = nrow(ordered)
    
    as.character(ordered[num,]$hospital)
}
