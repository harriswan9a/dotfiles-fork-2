#alias ocms-db-tool='sh ~/Downloads/test.sh \'${sql}\' | awk \'NR<3{print $0;next}{print $0| "sort -k1,1 -n"}\''

function ocmsdb() {
  sh ~/sh/ocms-db-tool.sh $1 | awk 'NR<3{print $0;next}{print $0| "sort -k1,1 -n"}'
}


function ocmsdb_no_sort() {
  sh ~/sh/ocms-db-tool.sh $1
}

# https://goswagger.io/install.html
# docker pull quay.io/goswagger/swagger
alias swagger="docker run --rm -it  --user $(id -u):$(id -g) -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"

function gitlog() {
  since=${1:=master}
  git log --oneline "${since}...HEAD" | grep -E "(OO|OCMSV2)-[0-9]{1,5}"
}

function gitlogUrl() {
  since=${1:=master}
  git log --oneline "${since}...HEAD" | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox} -E "(OO|OCMSV2)-[0-9]{1,}" --only-matching | sort -n | uniq | xargs -I{} echo "http://jira.gpms365.net:8887/browse/{}"
}
