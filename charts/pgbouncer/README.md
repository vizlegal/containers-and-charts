# PGBouncer chart

You can find more information in the repo of which this image is based:

-  https://github.com/edoburu/docker-pgbouncer


## Install

Add our repo:

    helm repo add vl https://vizlegal.github.io/containers-and-charts/
    helm repo update
    helm install vl/pgbouncer

To configure it you can use on of these methods:

- ENV variables (see `entrypoint.sh` for detaills)
- adding `pgbouncer.ini` and `userlist.txt` in the secrets file

    kubectl create secret generic DEPLOY_NAME --namespace=NAMESPACE --from-file=pgbouncer.ini -o yaml --dry-run | tee pgbtest.yml | kubetl apply -f -
