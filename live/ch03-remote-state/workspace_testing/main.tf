provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    key = "workspaces-example/terraform.tfstate"
  }
}

resource "aws_instance" "example" {
  ami = "ami-0fb653ca2d3203ac1"
  # instance_type = "t2.micro"

  # Can control how a module behaves depending on the seleted workspace
  # Below sets instance type to t2.medium if in default workspace, else use t2.micro
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}

# Created workspaces example1 and example2, ran terraform apply 
# and observed changes in state file location in S3. Then individually
# ran terraform destroy in each workspace to remove  EC2 instances.