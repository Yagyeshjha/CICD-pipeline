resource "aws_instance" "example" {
    ami           = "ami-0f918f7e67a3323f0"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
}
