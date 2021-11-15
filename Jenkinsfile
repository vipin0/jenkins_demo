pipeline{
    agent any

    stages{
        stage("build"){
            steps{
                echo "Build the php-app"
                withCredentials([
                    usernamePassword(credentialsId: 'dockerhub-repo', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')
                ]){
                    sh "docker build -t vipin0/php-app:0.1 ."
                    // don't use this
//                     sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"   
                    sh('echo $PASSWORD | docker login -u $USERNAME --password-stdin')
                    sh 'docker push vipin0/php-app:0.1'
                }
            }
        }
        stage("deploy"){
            steps{
                echo "Deploying php-app"
                withCredentials([
                    string(credentialsId: 'mysql_user', variable: 'MYSQL_USER'),
                    string(credentialsId: 'mysql_pass', variable: 'MYSQL_PASS'),
                    string(credentialsId: 'mysql_root_pass', variable: 'MYSQL_ROOT_PASS'),
                    string(credentialsId: 'mysql_db', variable: 'MYSQL_DB')
                ]){
                    sh('docker run -dp 3306 --name mysql-db -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASS -e MYSQL_USER=$MYSQL_USER -e MYSQL_PASSWORD=$MYSQL_PASS -e MYSQL_DATABASE=$MYSQL_DB -v mysql-db:/var/lib/mysql mysql')
                    sh('docker run -dp 80:80 --link mysql-db:mysql-db -e DB_SERVER=mysql-db -e DB_USER=$MYSQL_USER -e DB_PASSWORD=MYSQL_PASS -e DB_NAME=$MYSQL_DB vipin0/php-app:0.1')
                }
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
