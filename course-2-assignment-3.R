outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

best <- function(state, outcome) {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(!is.element(state, data$State))
        stop("invalid state")
    
    if(!is.element(outcome, c("heart attack", "heart failure", "pneumonia")))
        stop("invalid outcome")
    
    rel.data <- data.frame("state" = data$State, 
                           "hospital" = data$Hospital.Name, 
                           "heart.attack" = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
                           "heart.failure" = data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, 
                           "pneumonia" = data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    
    state.data <- rel.data[rel.data$state == state,]
    low <- min(state.data[[outcome]], na.rm = TRUE)
    state.data[state.data[[outcome]] == low,]
}
