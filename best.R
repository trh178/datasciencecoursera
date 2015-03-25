best <- function(state, outcome) {
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
    low <- min(state.data[[outcome]], na.rm = TRUE)
    na.omit(state.data[state.data[[outcome]] == low,])
}
