resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
#resource "aws_route" "to_onprem" {
#  route_table_id         = aws_route_table.private_rt.id
#  destination_cidr_block = "172.16.0.0/16"
#  gateway_id             = aws_vpn_gateway.vgw.id
#}
#
