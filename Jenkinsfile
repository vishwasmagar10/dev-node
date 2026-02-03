pipeline{
	agent any
	environment{
		DOCKER_CRED=credentials('dockerhub')
		IMAGE_NAME='vishwasmagar10/devops'
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
					docker.withRegistry('https://index.io/v1/','dockerhub') {
						dockerImage.push()
					}
				}
			}
		}
	}
	post{
		sucess { echo 'sucess'} }
		failure { echo 'failure'} }
	}
}
			
