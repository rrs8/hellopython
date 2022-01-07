## Sysdig Secure Image Scanning for Tekton / OpenShift Pipelines

Task and Pipeline definitions in this directory perform an S2I build.

See subdirectory "buildFromDockerfile" for a Dockerfile build.

The only difference is the build task used in the Pipeline.

### Preparation
1. Get Sysdig API token from the Sysdig UI
   * This is available in the Sysdig UI under Settings / User Profile / Sysdig Secure API
   * API token must be base64 encoded:
   `echo -n SYSDIG_API_TOKEN | base64`
   * Edit sysdigSecureSecret.yaml to include base64 encoded token

2. Configure or disable proxy server
   * Edit sysdigScanTask.yaml
   * Replace http_proxy and https_proxy values
   * If no proxy, remove these lines

3. Specify the OpenShift project name in the image repo string
   * Edit sysdigPipelineRun.yaml and modify the IMAGE_NAME parameter:
   ```
   name: IMAGE_NAME
   value: image-registry.openshift-image-registry.svc:5000/hello/hellopython
   ```
   * Replace hello with your project name

### Setup
Example using the default project hello:
```
oc new-project hello
oc apply -f sysdigSecureSecret.yaml
oc apply -f sysdigScanTask.yaml
oc apply -f sysdigSecurePipeline.yaml
```
### Run Pipeline
```
oc create -f sysdigPipelineRun.yaml
```
