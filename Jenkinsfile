pipeline {
    agent { dockerfile true }
    tools {
        ansible 'ansible'
    }

    environment {
        PATH = "/tmp/.local/bin:$PATH"
    }

    stages {
        stage('Check Git Installation') {
            steps {
                sh 'git --version'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                ansiblePlaybook(
                    credentialsId: 'ssh-user', 
                    inventory: 'inventory', 
                    playbook: 'myplaybook.yml', 
                    become: true, 
                    becomeUser: 'ansibleuser'
                )
            }
        }
    }
}
