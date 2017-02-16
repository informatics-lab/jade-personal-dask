module "dask-scheduler" {
  source = "../modules/dask-scheduler"
  scheduler_name = "${var.scheduler-name}"
  environment = "${var.environment}"
  conda_env = "${var.conda_env}"
}

module "dask-worker" {
  source = "../modules/dask-worker"
  scheduler_address = "${module.dask-scheduler.private_ip}"
  worker_name = "${var.worker-name}"
  environment = "personal"
  conda_env = "${var.conda_env}"
  num_workers = "${var.num_workers}"
}


output dask-scheduler-endpoint {
  value = "${module.dask-scheduler.private_ip}:8786"
}

output stats-endpoint {
  value = "http://${module.dask-scheduler.public_ip}:8787"
}
