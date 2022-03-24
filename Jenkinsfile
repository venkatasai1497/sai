pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                sh'''rm -rf mar24
                git clone https://github.com/venkatasai1497/sai.git mar24
                '''
            }}
        stage('Git Modification Check') {
             environment {
                AN_ACCESS_KEY = credentials('gittoken')
            }
            steps {
                sh'''
                cd mar24
                ls
                git config --global user.email "venkata.sai1497@gmail.com"
                git config --global user.name "venkatasai1497" '''
                withCredentials([usernamePassword(credentialsId: 'gittoken', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                sh ' ./script3.sh '
                }}
        }
    }
}
