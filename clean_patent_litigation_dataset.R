##########################
# Clean litigation dataset 
##########################


load(fjc_matched_litigants_file)
fjc_matched_litigants = fjc_matched_litigants %>% 
  relocate(fjc_firm_name, df_firm_name, nber_firm_name,ee_name,Company.Name,parent_company_name.x, parent_company_name.y, ticker_name,NBER_matched_ind,CIQ_matched_ind,USPTO_matched_ind, nber_name.y, nber_name.x, parent_id, pdpco)


# redundant columns - consolidate 
#   e.g nber_name.x, nber_name.y


fjc_matched_litigants = fjc_matched_litigants %>% 
  mutate(parent_company_name = ifelse(!is.na(parent_company_name.x), parent_company_name.x, parent_company_name.y)) %>%
  mutate(nber_name = ifelse(!is.na(nber_name.x), nber_name.x, nber_name.y)) %>%
  mutate(nber_name = ifelse(!is.na(nber_name.x), nber_name.x, nber_name.y)) %>%
  mutate(permno = ifelse(!is.na(permno.x), permno.x, permno.y)) %>%
  rename(similarityNBER = similarity.x) %>%
  rename(similarityCIQ = similarity.y)  %>%
  rename(lcs_sim_NBER = lcs_sim.x) %>%
  rename(lcs_sim_CIQ = lcs_sim.y)  %>%
  rename(lcs_sim_USPTO = lcs_sim)  

fjc_matched_litigants = fjc_matched_litigants %>% select(-nber_name.x, -nber_name.y, -permno.x,-permno.y)

##################
# merge fjc identified participants, back with the patent litigation cases
##################


