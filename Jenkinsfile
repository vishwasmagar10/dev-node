pipeline{
	agent any
	environment{
		DOCKER_CRED=credentials('docker')
		IMAGE_NAME='vishwasmagar10/dev-react'
	}
	triggers{
		cron('* * * * *')
	}
	stages{
		stage("checkout"){
			steps{
				git url:'https://github.com/vishwasmagar10/dev-node',branch:'main'
			}
		}
		stage('build'){
			steps{
				script{
					dockerImage=docker.build("${IMAGE_NAME}:latest")
				}
			}
		}
		stage('push'){
			steps{
				script{
					docker.withRegistry('https://index.docker.io/v1/','docker') {
						dockerImage.push()
					}
				}
			}
		}
	}
	// post{
	// 	sucess { echo 'sucess'} 
	// 	failure { echo 'failure'} 
	// }
}
			
