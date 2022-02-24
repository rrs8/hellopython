pipeline {
    agent any

    parameters { 
        string(name: 'image_to_scan', defaultValue: 'alpine', description: 'Name of the image to scan (e.g.: alpine:latest)')
        string(name: 'http_proxy', defaultValue: '', description: 'http proxy') 
        string(name: 'https_proxy', defaultValue: '', description: 'https proxy') 
    }
    
     environment {
         SYSDIG_TOKEN=credentials('api-credentials')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh "rm -rf ${HOME}/oci-dir"
                sh "podman save --format oci-dir -o ${HOME}/oci-dir ${params.image_to_scan}"
                // sh "rm -f ${HOME}/image.tar"
                // sh "podman save -o ${HOME}/image.tar ${params.image_to_scan}"
            }
        }
        stage('Scan') {
            steps {
                sh "podman run -v ${HOME}/oci-dir:/tmp/oci-dir:Z quay.io/sysdig/secure-inline-scan:2 --sysdig-url https://us2.app.sysdig.com --sysdig-token ${SYSDIG_TOKEN_PSW} --storage-type oci-dir --storage-path /tmp/oci-dir ${params.image_to_scan}"
                // sh "podman run -v ${HOME}/image.tar:/tmp/image.tar:Z quay.io/sysdig/secure-inline-scan:2 --sysdig-url https://us2.app.sysdig.com --sysdig-token ${SYSDIG_TOKEN_PSW} --storage-type docker-archive --storage-path /tmp/image.tar ${params.image_to_scan}"
            }
        }
    }
}
