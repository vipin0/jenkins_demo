pipeline{
    agent any

    stages{
        stage("build"){
            steps{
                echo "Build stage."
            }
        }
        stage("test"){
            steps{
                echo "test stage."
            }
        }
        stage("deploy"){
            steps{
                echo "Deploy stage."
            }
        }
    }
    post{
        always{
            echo "Post Build stage."
            emailext attachLog: true, body: '', subject: 'Build Status', to: 'vipin6673@gmail.com'
        }
    }
}
