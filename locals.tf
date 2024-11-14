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
      vcs_repo_identifier = "${var.github_organization_name}/devops-course-terraform-tfe"
    }
    "devops-course-github" = {
      description         = "Here we will keep all automation about github"
      execution_mode      = "remote"
      project_id          = module.project["devops-course-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/devops-course-terraform-github"
    }
  }
}

