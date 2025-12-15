pipeline {
    agent {
        docker {
            image 'ruby:2.3.0'
            args '-u root:root'
        }
    }

    environment {
        RAILS_ENV = 'test'
        POSTGRES_HOST = 'localhost'
        POSTGRES_USER = 'postgres'
        POSTGRES_PASSWORD = 'postgres'
        POSTGRES_DB = 'travis_ci_test'
        REDIS_URL = 'redis://localhost:6379/0'
        BUNDLE_PATH = 'vendor/bundle'
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timeout(time: 30, unit: 'MINUTES')
        timestamps()
    }

    stages {
        stage('Setup') {
            steps {
                echo 'Installing system dependencies...'
                sh '''
                    apt-get update -qq
                    apt-get install -y -qq postgresql-client nodejs
                '''

                echo 'Installing Ruby dependencies...'
                sh '''
                    gem install bundler --no-document
                    bundle install --jobs=4 --retry=3 --path=${BUNDLE_PATH}
                '''
            }
        }

        stage('Database Setup') {
            steps {
                echo 'Configuring database...'
                sh 'cp config/database.yml.travis config/database.yml'

                echo 'Setting up test database...'
                sh '''
                    bundle exec rake db:create || true
                    bundle exec rake db:migrate
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running RSpec tests...'
                sh '''
                    mkdir -p test-results
                    bundle exec rspec \
                        --format documentation \
                        --format RspecJunitFormatter \
                        --out test-results/rspec.xml
                '''
            }
        }
    }

    post {
        always {
            echo 'Publishing test results...'
            junit allowEmptyResults: true, testResults: 'test-results/*.xml'

            echo 'Cleaning up workspace...'
            cleanWs()
        }

        success {
            echo 'Build succeeded!'
        }

        failure {
            echo 'Build failed!'
        }
    }
}
