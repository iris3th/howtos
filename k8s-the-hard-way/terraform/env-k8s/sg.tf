resource "aws_security_group" "k8s" {
  name        = "${var.env}-sg-k8s"
  description = "k8s-instances"

  vpc_id = var.vpc-id-internal
  tags   = {}
}

resource "aws_security_group_rule" "k8s" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"

  security_group_id        = aws_security_group.k8s.id
  cidr_blocks       = ["80.111.74.27/32"]
}

resource "aws_security_group_rule" "k8s-1" {
  type      = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  security_group_id        = aws_security_group.k8s.id
  cidr_blocks       = ["80.111.74.27/32"]

}

resource "aws_security_group_rule" "k8s-2" {
  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"

  security_group_id        = aws_security_group.k8s.id
  cidr_blocks       = ["80.111.74.27/32"]
}

resource "aws_security_group_rule" "k8s-3" {
  type      = "ingress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"

  security_group_id = aws_security_group.k8s.id
  cidr_blocks       = ["172.31.0.0/16","192.168.0.0/16"]
}

resource "aws_security_group_rule" "k8s-5" {
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"

  security_group_id = aws_security_group.k8s.id
  cidr_blocks       = ["0.0.0.0/0"]

}
