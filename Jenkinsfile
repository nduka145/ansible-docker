pipeline {
    agent { dockerfile true }
    tools {
        ansible 'ansible'
    }

    environment {
        PATH = "/home/ansibleuser/.local/bin:$PATH" // Updated to match non-root user
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
                    becomeUser: 'root', // This may still work if ansibleuser has sudo permissions
                    sudoUser: 'ansibleuser'
                )
            }
        }
    }
}
