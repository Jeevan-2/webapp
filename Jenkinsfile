pipeline {
    agent any
	
	  tools
    {
       maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/Kempegowda-bu/webapp.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn clean package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'podman build -t samplewebapp .' 
                sh 'docker tag samplewebapp kempegowda/project:latest'
                //sh 'docker tag samplewebapp kempegowda/project:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dock", url: "" ]) {
          sh  'docker push kempegowda/project:latest'
        //  sh  'docker push kempegowda/project:latest:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 kempegowda/project:latest"
 
            }
        }
 //stage('Run Docker container on remote hosts') {
             
           // steps {
               // sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
           // }
        //}
    }
	}
