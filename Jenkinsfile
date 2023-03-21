pipeline {
    agent { label 'arch' }

    stages {
        stage("Build pdf's") {
            steps {
                sh 'pacman --noconfirm -Syu && pacman --noconfirm -S ruby'
                sh 'export GEM_HOME="$(ruby -e \'puts Gem.user_dir\')"'
                sh 'export PATH="$PATH:$GEM_HOME/bin"'
                sh 'gem install asciidoctor asciidoctor-pdf rouge lapyst-rouge'
                sh 'asciidoctor -r asciidoctor-pdf -r lapyst-rouge -b pdf ./readme.adoc'
                sh 'mv readme.pdf lapyst-full-docs.pdf'
                archiveArtifacts artifacts: '*.pdf', followSymlinks: false
            }
        }
    }
}