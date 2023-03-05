resource "aws_security_group" "main_sg1" {
  name        = "${var.env}-sg"
  description = format("%s-sg", var.env)
  #vpc_id      = var.vpc_id
}
resource "aws_security_group_rule" "ingress" {
  count = length( var.ports ) #5
  type              = "ingress"
  to_port           = element( var.ports, count.index ) 
  protocol          = "tcp"
  from_port         = element( var.ports, count.index ) 
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main_sg1.id
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.main_sg1.id
   cidr_blocks = ["0.0.0.0/0"]
}


# count.index = go and count the index 
#count = 2
#count.index = 0, 1
#
#count = 5
#count.index = 0, 1, 2, 3, 4
