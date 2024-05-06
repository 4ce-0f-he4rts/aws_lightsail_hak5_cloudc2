resource "aws_lightsail_instance_public_ports" "this" {
  instance_name     = aws_lightsail_instance.this.name
  port_info {
    cidrs       = var.aws_lightsail_instance_public_ports.port_22.cidrs
    ipv6_cidrs  = var.aws_lightsail_instance_public_ports.port_22.ipv6_cidrs
    protocol    = "tcp" 
    from_port   = 22
    to_port     = 22
  }
  port_info {
    cidrs       = var.aws_lightsail_instance_public_ports.port_2022.cidrs
    ipv6_cidrs  = var.aws_lightsail_instance_public_ports.port_2022.ipv6_cidrs    
    protocol    = "tcp" 
    from_port   = 2022
    to_port     = 2022
  }
  port_info {
    cidrs       = var.aws_lightsail_instance_public_ports.port_80.cidrs
    ipv6_cidrs  = var.aws_lightsail_instance_public_ports.port_80.ipv6_cidrs   
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }
  port_info {
    cidrs       = var.aws_lightsail_instance_public_ports.port_8080.cidrs
    ipv6_cidrs  = var.aws_lightsail_instance_public_ports.port_8080.ipv6_cidrs    
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
  }
  port_info {
    cidrs       = var.aws_lightsail_instance_public_ports.port_443.cidrs
    ipv6_cidrs  = var.aws_lightsail_instance_public_ports.port_443.ipv6_cidrs  
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }
}