pipeline{
    agent any

    stages{
        stage("build"){
            steps{
                docker build -t php-app:0.1 .
            }
        }
        stage("test"){
            steps{
                echo "test stage."
            }
        }
        stage("deploy"){
            steps{
                docker run --rm -dp 80:80 php-app:0.1
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
