# Ejemplo de uso

## Objetivo

Este módulo crea un Application Load Balancer público, su grupo de seguridad, el target group y el listener HTTP. También asocia la instancia EC2 al target group para distribuir tráfico hacia el servidor web.

## Uso

Úsalo cuando ya tengas una VPC, dos subredes públicas y una instancia EC2 funcionando. El módulo necesita los IDs de la VPC, de ambas subredes públicas y del EC2 que recibirá el tráfico.

```hcl
module "alb" {
	source             = "github.com/miguelh612/terraform-aws-alb-AUY1105-mv?ref=v1.0.2"
	vpc_id             = module.vpc.vpc_id
	public_subnet_id   = module.vpc.public_subnet_id
	public_subnet_2_id = module.vpc.public_subnet_2_id
	ec2_instance_id    = module.ec2.ec2_instance_id
}
```

El módulo expone el DNS público del balanceador en `alb_dns_name`, útil para verificar el acceso a la aplicación.
