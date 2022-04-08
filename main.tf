provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "my-instance" {
  ami             = data.aws_ssm_parameter.ami_id.value
  subnet_id       = "subnet-086347872eb823260"
  instance_type   = "t2.micro"
  associate_public_ip_address = "true"
  availability_zone = "us-east-1f"
  vpc_security_group_ids = ["sg-06c51062474fb4ba7"]
  tags = {
    Name = "Terraform Instance"
  }
}
