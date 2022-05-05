variable "name" {
  description = "the name of your stack, e.g. \"demo\""
  default     = "demo-api"
}

variable "environment" {
  description = "the name of your environment, e.g. \"dev\""
  default     = "Dev"
}

variable "aws_region" {
  description = "value of the identifier of the region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "a comma-separated list of availability zones, defaults to all AZ of the region, if set to something other than the defaults, both private_subnets and public_subnets have to be defined as well"
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b"]
}

# VPC Variables
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "a list of CIDRs for private subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  default     = ["10.0.0.0/20"]
}

variable "public_subnets" {
  description = "a list of CIDRs for public subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  default     = ["10.0.16.0/20", "10.0.48.0/20"]
}

# ALB Variables
variable "health_check_path" {
  description = "Http path for task health check"
  default     = "/health"
}

variable "tsl_certificate_arn" {
  description = "The ARN of the certificate that the ALB uses for https"
  default     = "replace-with-the-value-of-The-ARN of the certificate"
}


# ECS Variables
variable "container_port" {
  description = "The port where the Docker is exposed"
  default     = 8090
}

variable "container_image" {
  type        = string
  description = "The image used to start the container. Images in the Docker Hub registry available by default"
  default     = "node-http-api:latest"
}

variable "container_cpu" {
  description = "The number of cpu units used by the task"
  default     = 256
}

variable "container_memory" {
  description = "The amount (in MiB) of memory used by the task"
  default     = 512
}

variable "service_desired_count" {
  description = "Number of tasks running in parallel"
  default     = 1
}