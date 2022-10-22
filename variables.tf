variable "aws_region" {
  default = "us-east-1"
}

variable "cluster-name" {
  default = "gourmeal-node"
  type    = string
}
variable "key_pair_name" {
  default = "eks"
}
variable "eks_node_instance_type" {
  default = "t2.medium"
}