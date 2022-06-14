# DDUserActivity

# Prerequisites:
Terraform. 

awscli. 

git. 

# Step 1 : clone
Clone this repository. 

# Step 2: Manual changes  
updates to ./terraform/userData/webAppInit.sh.  
  
export AWS_ACCESS_KEY_ID= **<aws_access_key>**

export AWS_SECRET_ACCESS_KEY= **<aws_secret_access_key>**

export AWS_DEFAULT_REGION= **<aws_region>**

save file. 

# step 3: provide key to access instances
Add public key to folder keys. 

# step 4: terraform 
execute terraform apply from terraform folder. 

# step 5: output
ipaddress for webserver is displayed on terraform completion. 
json data can be posted to following endpoints:  
**ipaddr:1028/profile**. 

  Mandatory field names:  
    userId:  
    attributes:  
    timeStampUTC:  
  
**ipaddr:1028/track**. 

    Mandatory field names:  
    userId:  
    events:  
  
**ipaddr:1028/alias**. 

  Mandatory field names:  
    newUserId:  
    orignialUserId:  
    timeStampUTC:  
