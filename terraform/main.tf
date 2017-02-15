module "dask-scheduler" {
  source = "../modules/dask-scheduler"
  scheduler_name = "${var.scheduler-name}"
  environment = "${var.environment}"
  conda_env = "${var.conda_env}"
  #conda_env = "${file("env.yaml.b64")}"
}

module "dask-worker" {
  source = "../modules/dask-worker"
  scheduler_address = "${module.dask-scheduler.private_ip}"
  worker_name = "${var.worker-name}"
  environment = "personal"
  conda_env = "${var.conda_env}"
  #conda_env = "${file("env.yaml.b64")}"
}


output dask-scheduler-endpoint {
  value = "http://${module.dask-scheduler.private_ip}:8786"
}

output stats-endpoint {
  value = "http://${module.dask-scheduler.public_ip}:8787"
}
