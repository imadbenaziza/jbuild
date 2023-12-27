def pipelineContext = [:]
node {

   
	 def IMAGE="imad'sDockerImage:version-${env.BUILD_ID}"

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
					docker.withRegistry('jenkinsimad.azurecr.io', 'ACR credentials') {
							img.push 'latest'
              img.push()
					}
		}
 
}

