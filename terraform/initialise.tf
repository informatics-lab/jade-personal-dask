# Initialise environment specific variables that will be set in that envs .tfvars

variable "scheduler-name" {}

variable "worker-name" {}

variable "environment" {}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "conda_env" {}

variable "num_workers" {
  default = 1
}
