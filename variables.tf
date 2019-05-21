variable "region" {
  default = "asia-northeast1"
}

variable "region_zone" {
  default = "asia-northeast1-a"
}

variable "XXX_ssh_keys" {
  type = "string"

  default = <<EOF
# ŒöŠJŒ®‹LÚ
ssh-rsa AAAAB11111111111111111119999
EOF
}
