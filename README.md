# Hybrid Site-to-Site VPN (On-Prem Firewall ↔ AWS)

## Overview
This project demonstrates the design and implementation of a secure
site-to-site IPsec VPN between an on-premises firewall and AWS VPC
using Terraform.

## Architecture
- On-Prem Network: 172.16.0.0/16
- AWS VPC: 10.100.0.0/16
- VPN Type: IPsec (Static Routing)

## Components
- AWS VPC
- Private Subnets
- Virtual Private Gateway
- Customer Gateway
- Site-to-Site VPN
- Route Tables

## Security Considerations
- No NAT over VPN
- Least-privilege routing
- Strong encryption (AES-256 / SHA-256)
- Tunnel monitoring enabled

## Routing Design
- On-Prem routes to AWS via IPsec tunnel
- AWS route table entries pointing to VPN gateway

## Terraform Usage
terraform init
terraform plan
terraform apply

## Firewall Configuration
Sample Palo Alto firewall configuration is provided for reference,
including IKE and IPsec parameters.

## Challenges & Notes
- MTU and MSS considerations for VPN traffic
- Tunnel failover handling
- Scalability considerations for multi-site expansion
