locals {
  project = {
    "devops-course-project" = {
      description = "Project Description"
    }
  }

  workspace = {
    "devops-course-tfe" = {
      description         = "Workspace description"
      execution_mode      = "remote"
      project_id          = module.project["devops-course-project"].id
      vcs_repo_identifier = "daniel-vsln/devops-course-terraform-tfe"
    }
  }
}

