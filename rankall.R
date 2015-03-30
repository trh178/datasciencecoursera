rankall <- function(outcome, num = "best") {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(!is.element(outcome, c("heart attack", "heart failure", "pneumonia")))
        stop("invalid outcome")
    
    rel.data <- data.frame("state" = data$State, 
                           "hospital" = data$Hospital.Name, 
                           "heart.attack" = suppressWarnings(as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)), 
                           "heart.failure" = suppressWarnings(as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)), 
                           "pneumonia" = suppressWarnings(as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)))
    
    outcome <- gsub(" ", ".", outcome)
    ordered <- rel.data[with(rel.data, order(state, rel.data[[outcome]], hospital, na.last=NA)),]
    states <- levels(rel.data$state)
    vals <- sapply(states, function(s) {
        obs <- ordered[ordered$state == s,]
        if(num == "best") num = 1
        if(num == "worst") num = nrow(obs)
        obs$hospital[num]
    })
    data.frame(state = states, hospital = vals)
}
