#cloud-config
runcmd:
  - 'export LC_ALL=C.UTF-8'
  - 'export LANG=C.UTF-8'
  - 'yum update -y'
  - 'yum install -y docker'
  - 'service docker start'
  - 'echo "${conda_env}" > env.yaml.b64'
  - 'python -c "import base64; base64.decode(open(\"env.yaml.b64\",\"rb\"), open(\"env.yaml\",\"w\"))"'
  - 'mkdir /env'
  - 'mv env.yaml /env'
  - 'docker run
      -d
      --restart always
      --cap-add SYS_ADMIN
      --device /dev/fuse
      --cap-add MKNOD
      --entrypoint /bin/bash
      ${docker_port_args}
      -v /env:/env
      continuumio/miniconda -c "
        ls /env && cat /env/* &&
        conda env create --name dask -f /env/env.yaml &&
        source activate dask &&
        ${command}
      "
  '
