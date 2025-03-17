#' @title 関数のタイトル
#' @description 関数の説明
#' @param None
#' @return preprocessed data
#' @export
#'
probabilistic_reversal_learning_csv_preprocess <- function(data_name){
  # read data
  data <- read.csv(data_name)
  # delete columns with missing values in variable "left_right_s1"
  data_rm_unnecessary_rows <- subset(data, !is.na(left_right_s1))
  # make new variable
  data_rm_unnecessary_rows$left_s1 <- 2 - data_rm_unnecessary_rows$left_right_s1
  data_rm_unnecessary_rows$response_selected_s1 <- ifelse(data_rm_unnecessary_rows$selected_img == "s1.svg", 1, 2)
  data_rm_unnecessary_rows$reward <- ifelse(data_rm_unnecessary_rows$reward_given == "reward.svg", 1, 0)
  data_rm_unnecessary_rows$trial <- 1:nrow(data_rm_unnecessary_rows)
  # select variables
  data_preprocessed <- data_rm_unnecessary_rows[, c("trial","left_s1",'reward_s1',"response_selected_s1","rt","reward")]
  return(data_preprocessed)
}
