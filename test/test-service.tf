resource "aws_eks_cluster" "test-eks-eu-west-1" {
  name = "Test-EKS-Cluster"
  role_arn = aws_iam_role.testrole.arn
  vpc_config {
    subnet_ids = [ "aws_subnet.private_subnet-eu-west-12b.id", "aws_subnet.private_subnet-eu-west-14b.id", "aws_subnet.public_subnet-eu-west-11a.id", "aws_subnet.public_subnet-eu-west-13a.id" ]
    security_group_ids = [aws_security_group.test-securitygroup.id]
  }
}
resource "kubernetes_secret" "test-credentials-eu-west-1" {
  metadata {
    name = "testcredentials"
  }
  data = {
    username = base64encode("username")
    password = base64encode("password")
  }
}
resource "aws_db_subnet_group" "test_subnet_group-eu-west-1" {
  name       = "my-db-subnet-group-eu-west-1"
  subnet_ids = [ "aws_subnet.private_subnet-eu-west-12b", "aws_subnet.private_subnet-eu-west-14b", "aws_subnet.public_subnet-eu-west-11a", "aws_subnet.public_subnet-eu-west-13a"]
  description = "My DB subnet group description"
}
resource "aws_db_instance" "test-rdb-instance-eu-west-1" {
  identifier = "testinstance"
  allocated_storage = 20
  engine = "mysql"
  instance_class = "db.t2.micro"
  username = "username"
  password = "password"
  db_subnet_group_name = "my-db-subnet-group-eu-west-1"
  publicly_accessible = false
}
resource "aws_lb" "test-load-balancer-eu-west-1" {
  name = "test-load-balancer"
  subnets = [ "aws_subnet.private_subnet-eu-west-12b.id", "aws_subnet.private_subnet-eu-west-14b.id", "aws_subnet.public_subnet-eu-west-11a.id", "aws_subnet.public_subnet-eu-west-13a.id" ]
  security_groups = [ aws_security_group.test-securitygroup-eu-west-1.id ]
  load_balancer_type = "network"
}
resource "aws_launch_configuration" "test_launch_config-eu-west-1" {
  name = "test-launch-config"
  image_id = "ami-03d294e37a4820c21"
  instance_type = "t2.micro"
}
resource "aws_autoscaling_group" "test-asg-eu-west-1" {
  desired_capacity     = 3
  max_size             = 5
  min_size             = 3
  vpc_zone_identifier  = [ "aws_subnet.private_subnet-eu-west-12b.id", "aws_subnet.private_subnet-eu-west-14b.id", "aws_subnet.public_subnet-eu-west-11a.id", "aws_subnet.public_subnet-eu-west-13a.id" ]
  health_check_type    = "EC2"
  health_check_grace_period = 300
  force_delete          = true
  launch_configuration = aws_launch_configuration.test_launch_config-eu-west-1.id
  tag {
    key                 = "Name"
    value               = "Test-Instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_eks_cluster" "test-eks-ap-southeat-1" {
  name = "Test-EKS-Cluster"
  role_arn = aws_iam_role.testrole.arn
  vpc_config {
    subnet_ids = [ "aws_subnet.private_subnet-ap-southeat-12b.id", "aws_subnet.private_subnet-ap-southeat-14b.id", "aws_subnet.public_subnet-ap-southeat-11a.id", "aws_subnet.public_subnet-ap-southeat-13a.id" ]
    security_group_ids = [aws_security_group.test-securitygroup.id]
  }
}
resource "kubernetes_secret" "test-credentials-ap-southeat-1" {
  metadata {
    name = "testcredentials"
  }
  data = {
    username = base64encode("username")
    password = base64encode("password")
  }
}
resource "aws_db_subnet_group" "test_subnet_group-ap-southeat-1" {
  name       = "my-db-subnet-group-ap-southeat-1"
  subnet_ids = [ "aws_subnet.private_subnet-ap-southeat-12b", "aws_subnet.private_subnet-ap-southeat-14b", "aws_subnet.public_subnet-ap-southeat-11a", "aws_subnet.public_subnet-ap-southeat-13a"]
  description = "My DB subnet group description"
}
resource "aws_db_instance" "test-rdb-instance-ap-southeat-1" {
  identifier = "testinstance"
  allocated_storage = 20
  engine = "mysql"
  instance_class = "db.t2.micro"
  username = "username"
  password = "password"
  db_subnet_group_name = "my-db-subnet-group-ap-southeat-1"
  publicly_accessible = false
}
resource "aws_lb" "test-load-balancer-ap-southeat-1" {
  name = "test-load-balancer"
  subnets = [ "aws_subnet.private_subnet-ap-southeat-12b.id", "aws_subnet.private_subnet-ap-southeat-14b.id", "aws_subnet.public_subnet-ap-southeat-11a.id", "aws_subnet.public_subnet-ap-southeat-13a.id" ]
  security_groups = [ aws_security_group.test-securitygroup-ap-southeat-1.id ]
  load_balancer_type = "network"
}
resource "aws_launch_configuration" "test_launch_config-ap-southeat-1" {
  name = "test-launch-config"
  image_id = "ami-03d294e37a4820c21"
  instance_type = "t2.micro"
}
resource "aws_autoscaling_group" "test-asg-ap-southeat-1" {
  desired_capacity     = 3
  max_size             = 5
  min_size             = 3
  vpc_zone_identifier  = [ "aws_subnet.private_subnet-ap-southeat-12b.id", "aws_subnet.private_subnet-ap-southeat-14b.id", "aws_subnet.public_subnet-ap-southeat-11a.id", "aws_subnet.public_subnet-ap-southeat-13a.id" ]
  health_check_type    = "EC2"
  health_check_grace_period = 300
  force_delete          = true
  launch_configuration = aws_launch_configuration.test_launch_config-ap-southeat-1.id
  tag {
    key                 = "Name"
    value               = "Test-Instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}