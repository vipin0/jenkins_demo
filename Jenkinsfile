pipeline{
    agent any

    stages{
        stage("build"){
            steps{
                echo "Build the php-app"
                withCredentials([
                    usernamePassword(credentials:'dockerhub-repo',usernameVariable:'USERNAME',passwordVariable:'PASSWORD')
                ]){
                    sh "docker build -t vipin0/php-app:0.1 ."
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                    sh 'docker push vipin0/php-app:0.1'
                }
            }
        }
        stage("deploy"){
            steps{
               sh "docker run --rm -dp 80:80 php-app:0.1"
            }
        }
    }
    post{
        always{
            echo "Post Build stage."
            // emailext attachLog: true, body: '', subject: 'Build Status', to: 'vipin6673@gmail.com'
        }
    }
}
