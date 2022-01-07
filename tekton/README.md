# Sysdig Secure Image Scanning for Tekton / OpenShift Pipelines

Task and Pipeline definitions in this directory perform an S2I build.

See subdirectory "buildFromDockerfile" for a Dockerfile build.

The only difference is the build task used in the Pipeline.

## Preparation
 - Get Sysdig API token from the Sysdig UI
   
   This is available in the Sysdig UI under Settings (select the circle with your initials in lower right)
   in the first settings screen (User Profile) in the section Sysdig Secure API

 - Edit sysdigSecureSecret.yaml to include base64 encoded Sysdig token
   - 
 - Edit sysdigScanTask.yaml to add your proxy server URL (or remove these lines)
   - 
 - Edit sysdigPipelineRun.yaml to specify the OpenShift project name in the image URL
   - 
   - default is "hello"
 

Setup:
 - oc new-project hello
 - oc apply -f sysdigSecureSecret.yaml
 - oc apply -f sysdigScanTask.yaml
 - oc apply -f sysdigSecurePipeline.yaml

Run Pipeline
 - oc create -f sysdigPipelineRun.yaml

