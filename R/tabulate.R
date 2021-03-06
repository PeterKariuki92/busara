#
#--------------------------------------------------------------------------------------------------#

summary_group <- function(df,variable, group_variable, dcm = 0){
  library(dplyr);library(rlang)
  res  =  df %>% select({{group_variable}},{{variable}}) %>%
    filter(!is.na({{group_variable}})) %>%
    group_by({{group_variable}}, {{variable}}) %>%
    summarise(Total_count  =  n()) %>%
    ungroup() %>%
    group_by({{group_variable}}) %>%
    mutate(Percentage  =  round(Total_count/sum(Total_count)*100, dcm)) %>%
    as.data.frame()
  return(res)
}

#summary_group(df = diamonds,variable = cut, group_variable = color,dcm = 2)

# Display tables neatly function
# Same as table_func but this allows you to change the variable names of the table.

decorate_table <- function(tab,col_names  =  col_names){
  kableExtra::kable_styling(knitr::kable(tab,col.names  =  col_names),bootstrap_options  =  "striped", full_width  =  F)
}


#devtools::install_bitbucket(repo = "stevenndungu/busara", username = "steven.ndungu@busaracenter.org", ref = "master", quiet = FALSE, auth_user = NULL, password = "****)


#devtools::install_bitbucket(repo = "stevenndungu/busara", username = "steven.ndungu@busaracenter.org", ref = "master", quiet = FALSE, auth_user = NULL, password = "****", force = T)
