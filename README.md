# Create a personal Dask cluster for a given Conda environment
 * Work in the `env-dev` folder when running terraform.
 * Create your conda environment. You might want do something like:

 ```
 conda create -n ml  python=3.5 tensorflow keras ipykernel dask distributed -y
 ```

 * In Jade you can go into this new environment by doing the above and below in the terminal:

 ```
 bash
 source activate ml
 python -m ipykernel install --user --name ml  --display-name "Py 3.5 Keras"
 ```
* You will now have a "Py 3.5 Keras" kernel available.
* To use with this tool you're environment needs to have `dask` and `distributed` included in the conda environment.
* To use as a kernel on JADE you'll need to include ipykernel in the environment.
* Once you've set up you're environment. Export it:

```
conda env export -n ml > env.yaml
```

* This exports the 'ml' environment into the env.yaml file.
* Take the content of `env.yaml` and put it in `env.yaml` inside the `env-dev` folder
* Run `python config-to-b64.py env.yaml` which will convert the file to base64 and store in `env.yaml.b64`
* You are now ready to terraform:

```
terraform apply -var-file=dev.tfvars
```
