data "template_file" "dask-bootstrap" {
  template = "${file("${path.module}/files/bootstrap.tpl")}"

  vars = {
    command = "${var.command}"
    conda_env = "${var.conda_env}"
    docker_port_args = "${var.docker_port_args}"
  }
}
