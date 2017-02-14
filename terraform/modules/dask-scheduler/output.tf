output "private_ip" {
  value = "${aws_instance.dask-scheduler.private_ip}"
}

output "public_ip" {
  value = "${aws_instance.dask-scheduler.public_ip}"
}
