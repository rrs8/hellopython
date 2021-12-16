# Tekton for Sysdig Secure

See comments in individual files for details

Can be added directly to an OpenShift pipeline
 - oc apply -f sysdigScanTask.yaml
 - add Sysdig Secure API token using sysdig-secrets.sh
 - add the "sysdigscan" task to the openshift pipeline
 - there will be a red '!' on the sysdigscan task for a missing input
 - click on the task and set the value 'IMAGE' to the right pipeline parameter e.g. $(params.IMAGE_NAME)
   
sysdigScanTask.yaml
 - the actual tekton task to run the Sysdig Scanner
 - proxy settings and API token are for sending results to the Sysdig Secure backend
 - edit the proxy environment variables as needed, or remove them if no proxy
 - the no_proxy line must exclude any internal registry that does not go through proxy
 - for internal openshift registry, tekton supplies the docker credentials via /tekton/creds

sysdig-secrets.sh
 - required: sets the Sysdig API token so scan results can be sent to Sysdig

registry-secrets.sh
 - only needed if using an external registry (not the openshift local registry) that requires docker credentials

sysdigPipeline.sh
runSysdigPipeline.sh
 - a basic tekton pipeline to scan the image specified in sysdigPipeline.sh
 - same prerequisites as above

.work
 - working files for other pipelines, retained for reference or future use
