pipeline {
    agent { dockerfile true }

    stages {
        stage('Clone Ansible Playbook') {
            steps {
                git branch: 'main', url: 'https://github.com/nduka145/ansible-docker.git'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                ansiblePlaybook(
                    credentialsId: 'ssh-user', 
                    installation: 'ansible', 
                    inventory: 'inventory', 
                    playbook: 'freestyle.yaml', 
                    become: true, 
                    becomeUser: 'root'
                )
            }
        }
    }
}
