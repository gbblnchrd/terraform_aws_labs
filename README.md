# terraform_aws_labs

Following along "Terraform: Up and Running".

### Ch. 2
The general syntax for created a resource in TF:

```
resource "<PROVIDER>_<TYPE>" "<NAME>" {
    [CONFIG ...]
}
```

* PROVIDER = name of a provider (ex. AWS)
* TYPE = type of resource to create (ex. instance)
* NAME = identifier for the resource to use throughout TF code
* CONFIG = arguments specific to that resource

#### Common TF commands
`terraform init` tells Terraform to scan your code and discover what provider is used.
`terraform plan` allows you to see what TF will do before making any changes.
`terraform apply` deploys the code.

### heredoc syntax
`<<-EOF` and `EOF` are TF's heredoc syntax, which allows creating multiline strings.

### Security Groups
To allow traffic to an EC2 instance, a security group is needed. Once a security group resources is created, it must applied to an EC2 instance. Our example uses a reference expression, which allows values to be accessed from other parts of code.

`<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>`

Adding a reference like this creates an implicit dependency, thus TF must parse these dependencies to determine the appropriate order to create resources. Use `terraform graph` to show the depedency graph.

### Input Variables and the DRY Principle
DRY = Don't Repeat Yourself. Use input variables to cover this basis.

```
variable "NAME" {
    [CONFIG ...]
}
```

Common parameters to use include description, default, type, validation, and sensitive.
Variables can be placed into a string user an interpolation expression like so: `...httpd -f -p ${var.server_port} &`

Output variables can also be used to display resource attributes after tf apply. For example, to display server IPs.
`terraform output` can be used to display outputs without making changes.

```
output "<NAME>" {
    value = <VALUE>
    [CONFIG ...]
}
```