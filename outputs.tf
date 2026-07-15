#output "ec2_public_ip" {
 # value = aws_instance.my_instance[*].public_ip   #[*] stand for multiple instance create & without [*] single instance  }
#}
#output "ec2_public_dns" {
 # value = aws_instance.my_instance[*].public_dns            # single instance createoutput
 # }


#output "ec2_private_ip" {
 # value = aws_instance.my_instance[*].private_ip          #[*] stand for multiple instance create
 # }

output "ec2_public_ip" {
  value = [ for instance in aws_instance.my_instance : instance.public_ip ]
}