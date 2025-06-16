
resource "aws_security_group" "instance" {
  name = "${var.cluster_name}-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb" {
  name = "${var.cluster_name}-alb"

  ingress = [
    {
      from_port   = local.http_port
      to_port     = local.http_port
      protocol    = local.tcp_protocol
      cidr_blocks = local.all_ips

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      cidr_blocks = local.all_ips
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },

    {
      cidr_blocks = local.all_ips
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      cidr_blocks = local.all_ips

      from_port   = local.any_port
      to_port     = local.any_port
      protocol    = local.any_protocol
      description = "Allow outbound requests"

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}