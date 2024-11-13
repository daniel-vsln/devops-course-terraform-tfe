locals {
  project = {
    "devops-course-project" = {
      description = "Project Description"
    }
  }

  workspace = {
    "devops-course-tfe" = {
      description    = "Workspace description"
      execution_mode = "local"
      project_id     = module.project["devops-course-project"].id
    }
  }
}

