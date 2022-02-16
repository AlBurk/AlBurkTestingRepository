variable codebuild_project_name {
  type        = string
  default     = ""
  description = "Name of your codebuild project"
}


variable project_description {
  type        = string
  default     = ""
  description = "Project description"
}

variable code_build_service_role_arn {
  type        = string
  default     = "arn:aws:iam::id:role/name-of-the-role"
  description = "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account."
}

variable github_repository {
  type        = string
  default     = ""
  description = "Your github repository"
}

variable branch_name {
  type        = string
  default     = null
  description = "Branch name to use"
}

variable buildspec_file {
  type        = string
  default     = ""
  description = "Buildspec file path"
}

variable "tags" {
    type = map
    default = {}
}

variable create_webhook {
  default     = false
}

variable vpc_id {
  type        = string
  default     = ""
  description = "VPC ID"
}

variable aws_subnets {
  default     = "[]"
  description = "Subnet ID"
}

variable aws_security_groups {
  default     = "[]"
  description = "Security group ID"
}

variable vpc_subnet_sg_options {
  type        = bool
  default     = false
  description = "This codebuild using VPC subnet and SG configuration?"
}

variable clone_depth {
  default     = 1
    description = "Branch depth to use 1 or 0-Full"
}

variable create_webhook_with_filters {
  default     = false
  description = "Create Source filter on event."
}

variable type1 {
  default     = "HEAD_REF"
  description = "Create Source filter on event."
}

variable pattern1 {
  default     = ""
  description = "Create Source filter patern."
}

variable type2 {
  default     = "EVENT"
  description = "Create Source filter on event."
}

variable pattern2 {
  default     = "PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED, PULL_REQUEST_REOPENED"
  description = "Create Source filter patern."
}

variable images {
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
  description = "CodeBuild Image"
}

