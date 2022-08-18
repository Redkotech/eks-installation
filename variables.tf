variable "aws_region" {
  default = "us-east-1"
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}
variable "key_pair_name" {
  default = "ubuntu"
}
variable "eks_node_instance_type" {
  default = "t2.medium"
}