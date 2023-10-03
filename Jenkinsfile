pipeline {
    stages {
        stage('Jenkins Automation') {
            agent {
                label 'Jenkins_Automate'
            }
            steps {
                sh 'git clone https://github.com/NirmalKumaran-2106/StartUp-Commands'
                sh 'cd StartUp-Commands'
                sh 'sudo chmod 777 jenkins_master.sh'
                sh 'sudo rm -rf ansible_master.sh terraform_slave.sh'
                sh './jenkins_master.sh'
            }
        }
        stage('Ansible Automation') {
            agent {
                label 'Ansible_Automate'
            }
            steps {
                sh 'git clone https://github.com/NirmalKumaran-2106/StartUp-Commands'
                sh 'cd StartUp-Commands'
                sh 'sudo chmod 777 ansible_master.sh'
                sh 'sudo rm -rf terraform_slave.sh jenkins_master.sh'
                sh './ansible_master.sh'
            }
        }
        stage('Slave Automation') {
            agent {
                label 'Slave_Automate'
            }
            steps {
                sh 'git clone https://github.com/NirmalKumaran-2106/StartUp-Commands'
                sh 'cd StartUp-Commands'
                sh 'sudo chmod 777 terraform_slave.sh'
                sh 'sudo rm -rf ansible_master.sh jenkins_master.sh'
                sh './terraform_slave.sh'
            }
        }
    }
}