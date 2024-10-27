pipeline {
    agent { dockerfile true }

    tools {
        git 'git'  
    }

    stages {
        stage('Check Git Installation') {
            steps {
                sh 'git --version'
            }
        }

        stage('Clone Ansible Playbook') {
            steps {
                git branch: 'master', url: 'https://github.com/nduka145/ansible-docker.git'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                ansiblePlaybook(
                    credentialsId: 'ssh-user', 
                    inventory: 'inventory', 
                    playbook: 'freestyle.yaml', 
                    become: true, 
                    becomeUser: 'root'
                )
            }
        }
    }
}
