def pipelineContext = [:]
node {

        def REGISTRY_NAME = 'jenkinsimad.azurecr.io'
        def REPOSITORY_NAME = 'imaddockerimage'
    	def IMAGE_TAG = "version-${env.BUILD_ID}"
    	def IMAGE = "${REGISTRY_NAME}/${REPOSITORY_NAME}:${IMAGE_TAG}"
	 

	 echo "IMAGE = $IMAGE"

    stage('Clone') {
    			checkout scm
		}

		def img = stage('Build') {
					docker.build("$IMAGE",  '.')
		}
	
		stage('Run') {
					img.withRun("--name run-$BUILD_ID -p 80:80") { c ->
						sh 'curl localhost'
          }					
		}

		stage('Push') {
					docker.withRegistry('https://jenkinsimad.azurecr.io', 'ACR') {
							img.push("${env.BUILD_ID}")
              
					}
		}
 
}

