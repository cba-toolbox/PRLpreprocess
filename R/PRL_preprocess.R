#' @title preprocess for CSV file of PRL task
#' @description preprocess for CSV file of PRL task
#' @importFrom utils read.csv
#' @param name_of_csv_file name of files of data
#' @return preprocessed data
#'          trial: 1,2,3...
#'          choice: 1=select S1, 2=select S2
#'          rt: response time
#'          reward: reward
#' @examples # PRL_preprocess_csv("data.csv")
#' @export
PRL_preprocess_csv <- function(name_of_csv_file){
  # read data
  data <- read.csv(name_of_csv_file)
  # delete columns with missing values in variable "left_right_s1"
  data_rm_unnecessary_rows <- subset(data, !is.na(left_right_s1))
  # make new variable
  data_rm_unnecessary_rows$trial <- 1:nrow(data_rm_unnecessary_rows)
  data_rm_unnecessary_rows$choice <- ifelse(data_rm_unnecessary_rows$selected_img == "s1.svg", 1, 2)
  data_rm_unnecessary_rows$reward <- ifelse(data_rm_unnecessary_rows$reward_given == "reward.svg", 1, 0)
  # select variables
  data_preprocessed <- data_rm_unnecessary_rows[, c("trial","choice","rt","reward")]
  return(data_preprocessed)
}
