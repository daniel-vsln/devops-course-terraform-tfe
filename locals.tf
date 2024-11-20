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
    "devops-course-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["devops-course-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/devops-course-terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["eu-central-1a", "eu-central-1c"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "devops-course"
        },
      ]
    }

    "devops-course-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["devops-course-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/devops-course-terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "bid2win.click"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "devops-course-daniel-vsln"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "devops-course"
        },
      ]
    }
    "devops-course-product-service-prod" = {
      description         = "Automation for product service resources."
      execution_mode      = "remote"
      project_id          = module.project["devops-course-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/devops-course-terraform-product-service"

      variables = [
        {
          category = "terraform"
          key      = "cluster_name"
          value    = "devops-course-daniel-vsln-prod"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
      ]
    }
  }
}

