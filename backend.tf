terraform { 
  cloud { 
    
    organization = "daniel-vsln" 

    workspaces { 
      name = "devops-course-tfe" 
    } 
  } 
}