# Undistro Helm Charts

Undistro Official Helm Chart Repository

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```shell
helm repo add undistro https://charts.undistro.io
```

You can then run `helm search repo undistro` to see the charts.

## OCI registry

Alternatively, Undistro Helm charts are also available in an OCI registry 
and can be referenced with the `oci://` prefix, as the following example:

```shell
helm upgrade --install myrelease oci://ghcr.io/undistro/helm-charts/mychart --version 0.1.0
```

Please refer to the [official Helm documentation](https://helm.sh/docs/topics/registries/) 
for more information about OCI registries.
