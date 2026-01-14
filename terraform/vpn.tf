resource "aws_vpn_gateway" "vgw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "hybrid-vpn-gateway"
  }
}

resource "aws_customer_gateway" "onprem" {
  bgp_asn    = 65000
  ip_address = "203.0.113.10"  # Dummy public IP
  type       = "ipsec.1"

  tags = {
    Name = "onprem-firewall"
  }
}

resource "aws_vpn_connection" "s2s_vpn" {
  vpn_gateway_id      = aws_vpn_gateway.vgw.id
  customer_gateway_id = aws_customer_gateway.onprem.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "onprem-to-aws-vpn"
  }
}

resource "aws_vpn_connection_route" "onprem_route" {
  vpn_connection_id      = aws_vpn_connection.s2s_vpn.id
  destination_cidr_block = "172.16.0.0/16"
}

