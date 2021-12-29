#alias ocms-db-tool='sh ~/Downloads/test.sh \'${sql}\' | awk \'NR<3{print $0;next}{print $0| "sort -k1,1 -n"}\''
alias ocms-db-tool='sh ~/Downloads/test.sh "${sql}"'

function ocmsdb() {
  sh ~/sh/ocms-db-tool.sh $1 | awk 'NR<3{print $0;next}{print $0| "sort -k1,1 -n"}'
}


function ocmsdb_no_sort() {
  sh ~/sh/ocms-db-tool.sh $1
}
# runmem release/3.19 => 指定 branch 啟動前台
# runmem => 不調整 branch 啟動前台
function runmem() {
  local branch="$1"
  local template="${2:=ocms-template-style18}"
  local skin="${3:=ocms-skin-style18-blackyellow}"
  local baseUrl=/Users/harriswang/97/bitbucket/of/
  echo "${template} ${skin}"
  if [ ! -f "${baseUrl}${template}" ]; then
    cd "${baseUrl}"
    git clone "ssh://git@bitbucket.gpms365.net:7999/of/${template}.git"
  fi
  cd "${baseUrl}${template}"
  gf --all
  echo "branch: ($branch)" ;
  if ((! branch)); then
    gf --all;
    git checkout "$branch"; 
  fi
  ggpull
  if [ ! -f "${baseUrl}${skin}" ]; then
    cd "${baseUrl}"
    git clone "ssh://git@bitbucket.gpms365.net:7999/of/${skin}.git"
  fi
  cd "${baseUrl}${skin}"
  if ((! branch)); then
    gf --all;
    git checkout "$branch"; 
  fi
  ggpull;
  j ocms-mem-core;
  if ((! branch)); then
    gf --all;
    git checkout "$branch"; 
  fi
  ggpull;
  npm ci;
  npm run linkTemplate -- "/Users/harriswang/97/bitbucket/of/${template}";
  npm run linkSkin -- "/Users/harriswang/97/bitbucket/of/${skin}";
  npm run initProcess;
  npm run dev;
}

function runadmin() {
  j ocms-admin;
  ggpull;
  npm ci;
  npm run dev;
}
