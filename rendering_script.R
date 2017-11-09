
library(rio)

dataset <- import("middle_east_customer_list.xlsx")

dataset$date_of_foundation <- sample(seq.Date(as.Date("1991/01/01"), 
                                              as.Date("2013/12/31"), 
                                              by = "week"),
                                     size = nrow(dataset), replace =FALSE)
# sentences from which to sample to create memo field



note <- sentences <- c("We started dealing with this company only recently. It is not in a weak position not having a large customer base. \n We usually deal with their accounting partner since no contact-person is usually available.",
                       "Recently founded company with small customer-based. \n We already experienced some not material payment delay.\n We should find a better contact-person since the currently employed is not always available.",
                       "Small company quit unknown on-the-market. \n It usually places small orders with 30 days payments schedules. \n we should reconsider agreements since an high discount value was placed given the small company dimension",
                       "We have started doing business with this company only recently. \n We usually refer to the head of the administration as contact person. They usually have one or two days of payments delay. \n contact-person unclear.",
                       "Difficult company to do business with. \n We should definitely revise agreements since an unjustified discount was accorded.",
                       "I guess this reason pertains to a relevant group since it would be otherwise a bad customer, even because we accorded and unjustified discount, really high.",
                       "This is one of our worst customer. \n It really often miss payments even if for just  a couple of days. \n We have problems finding useful contact persons. \n The only person we can have had occasion to deal with was the fiscal expert, since all other relevant person denied any kind of contact.",
                       "A really bad customer. \n We should revise the commercial agreement we made with them since a really high discount was set for them but they actually provided only small orders.",
                       "No relevant orders from this customers, we should consider to revise the agreement with them or also abandon break our relationship since they also tend to pay with some small delay.",
                       "No clear reason to keep working with them is available since they pay with always with delay and it is also difficult to keep in touch with their contact persons. \n I guess that some different reason for dealing with them is available. maybe they are part of a relevant group which on of our strategic customers.")


#defining variables to be parametrised
#for ( i in 1:nrow(dataset)){
for ( i in 1:20){
  
company_name <- dataset$company_name[i]
date_of_foundation <- dataset$date_of_foundation[i]
industry <- dataset$industry[i]
share_holders <- dataset$share_holders[i]

rmarkdown::render("template.Rmd",output_file = paste0(company_name, ".pdf"), params = list(
  company_name = company_name,
  date_of_foundation = date_of_foundation,
  industry = industry,
  share_holders = share_holders,
  note = sample(note,size = 1,replace = FALSE)
))
}


#reference for content analysis: http://tidytextmining.com/topicmodeling.html
