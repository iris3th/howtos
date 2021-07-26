resource "aws_instance" "k8s-instance-master" {
  ami                     = "ami-08bac620dc84221eb"
  instance_type           = "t2.micro"
  key_name                = "k8s-hw-key"
  vpc_security_group_ids  = [aws_security_group.k8s.id]
  availability_zone       = var.az_2
  subnet_id               = var.subnet-id-internal-1b
  source_dest_check       = false

  tags = {
    Name               = "k8s-hw-master"
    Environment        = "k8s"
    Role               = "master"
  }
}

resource "aws_instance" "k8s-instance-worker" {
  ami                     = "ami-08bac620dc84221eb"
  instance_type           = "t2.micro"
  key_name                = "k8s-hw-key"
  vpc_security_group_ids  = [aws_security_group.k8s.id]
  availability_zone       = var.az_1
  subnet_id               = var.subnet-id-internal-1a
  source_dest_check       = false

  tags = {
    Name               = "k8s-hw-worker"
    Environment        = "k8s"
    Role               = "worker"
  }
}
