#!/bin/bash

# sql="select ParameterValue from ConfigParameter where ParameterName = 'Report.ConfigTime';"
#sql="select IF(count(Id) IS NULL, 0, count(Id)) as c from Agent where PlatformFee != 0;"
#sql="SHOW COLUMNS FROM \`Promotion\` LIKE 'AddTime';"
#sql="select @@session.time_zone;"
#sql="select ParameterValue from ConfigParameter where ParameterName = 'Member.Mail.Control'"
#sql="select promotionId, MappingKey from PromotionCalculate group by promotionId, MappingKey HAVING count(0) > 1"
#sql="SELECT count(0) from PromotionSchedule where Jobs = 1 and status = 1 and YEAR(LastRunTime) = YEAR(now())"
# 查詢前後台支援的語系
#sql="select '前台' as type, count(0), GROUP_CONCAT(Lang) from (SELECT * from Language where Status = 1) t group by t.Status union all select '後台' as type, count(0), GROUP_CONCAT(Lang) from (SELECT * from Language where MemberSiteStatus = 1) t group by t.Status"
# 查詢目前活動統計中的Task數量(Promotion * Platform * GameKindCode)
#sql="select count(0) CalculateJobs from PromotionCalculate where CalculateTime > Date(NOW())"
#sql="select (select count(0) from (select distinct promotionId from PromotionCalculate where CalculateTime > Date(NOW())) t) as ActivePromotionCount, count(0) ActiveCalculateJobs, (select count(0) from Member) as AllMemberCount, (select count(0) from PromotionJoin where Clear != 1 and promotionId in (select * from (select distinct promotionId from PromotionCalculate where CalculateTime > Date(NOW())) t)) as JoinPromotionMemberCount from PromotionCalculate where CalculateTime > Date(NOW())"
#sql="select count(*) from AppDevice where BestToken IS NOT NULL"
#
#sql="select ParameterValue from ConfigParameter where ParameterName = 'Member.Bank.Quantity'"

#sql="select Jobs, Status, LastRunTime from PromotionSchedule where promotionId = (select distinct PromotionId from PromotionTag where Tag like '%Tiger%')"
#sql="select count(*) as Calculate, (select count(distinct promotionId) from PromotionCalculate) promotionCount from PromotionCalculate where CalculateTime >= DATE_ADD(NOW(), interval -1 day);"
#sql="select ClearType, count(*) from PromotionJoin group by ClearType;"
sql='select * from AppVersion where OS = 0 And `Release` = 1 order by id desc limit 1'

if [ ! -z "$1" ]; then
  sql="$1"
fi
echo "query: ${sql}\n"
## ====================================================================================================

domain=()
site=()
tz=()

# CNY
domain+=("dbr.weinasi88.cc") site+=("wn") tz+=("+08:00")
# THB
domain+=("dbr.infi888.me") site+=("inf") tz+=("+07:00")
domain+=("dbr.smallwhitelion.com") site+=("h9") tz+=("+07:00")
domain+=("dbr.wsnoble168.com") site+=("ws") tz+=("+07:00")
domain+=("dbr.wwlucksite.com") site+=("wwl") tz+=("+07:00")
domain+=("dbr.luk666.me") site+=("l6") tz+=("+07:00")
domain+=("dbr.sands3.com") site+=("s9") tz+=("+07:00")
domain+=("dbr.s99thai.net") site+=("si") tz+=("+07:00")
domain+=("dbr.pay6996.com") site+=("pa") tz+=("+07:00")
domain+=("dbr.chokdee777.vip") site+=("cd7") tz+=("+07:00")
domain+=("dbr.gembet99.live") site+=("gb9") tz+=("+07:00")
domain+=("dbr.yingpla999.com") site+=("yp") tz+=("+07:00")
domain+=("dbr.gxyback.com") site+=("gxy") tz+=("+07:00")
domain+=("dbr.tigerii.net") site+=("tgi") tz+=("+07:00")
domain+=("dbr.dada99th.com") site+=("d9t") tz+=("+07:00")
domain+=("dbr.dd99bo.bet") site+=("dd99") tz+=("+07:00")
domain+=("dbr.mamabet555.com") site+=("cb5") tz+=("+07:00")
domain+=("dbr.huc855.com") site+=("huc") tz+=("+07:00")
domain+=("dbr.sbfplay111.com") site+=("sbf") tz+=("+07:00")
domain+=("dbr.12wwmm99.com") site+=("12ww") tz+=("+07:00")
domain+=("dbr.caramel138.com") site+=("ho") tz+=("+07:00")
domain+=("dbr.g8back.com") site+=("g8") tz+=("+07:00")
domain+=("dbr.svbwc.com") site+=("bwc") tz+=("+07:00")
domain+=("dbr.ocmsdemo.com") site+=("odthb") tz+=("+07:00")
# domain+=("dbr.pnx555.net") site+=("pnx") tz+=("+07:00") # 暫時關閉 20201126
domain+=("dbr.ezyserv1.com") site+=("ezb") tz+=("+07:00")
domain+=("dbr.intplutus.com") site+=("jp89") tz+=("+07:00")
domain+=("dbr.aloha234.me") site+=("alh") tz+=("+07:00")
domain+=("dbr.fafa89.me") site+=("fa89") tz+=("+07:00")
domain+=("dbr.wstar99.asia") site+=("ws9") tz+=("+07:00")
# INR
domain+=("dbr.jeet55.net") site+=("jw") tz+=("+08:00") # 早期建置用 +0800
# domain+=("dbr.win7699.com") site+=("gb") tz+=("+05:30") # 關站 20201109
# domain+=("dbr.goaadmin.com") site+=("gw") tz+=("+05:30") # 關站 20201109
# domain+=("dbr.betpal247.com") site+=("bp") tz+=("+05:30") # 暫時關閉 20201126
domain+=("dbr.esball777.net") site+=("esb") tz+=("+05:30")
domain+=("dbr.thiswin111.com") site+=("tw") tz+=("+05:30")
domain+=("dbr.v15a63t.com") site+=("ccx") tz+=("+05:30")
# VND
domain+=("dbr.betnokia.com") site+=("bv") tz+=("+07:00")
domain+=("dbr.vnwin77.com") site+=("xda") tz+=("+07:00")
domain+=("dbr.wstar77.asia") site+=("ws7") tz+=("+07:00")
# MMK
domain+=("dbr.innlay789.com") site+=("in") tz+=("+06:30")
domain+=("dbr.fortune234.me") site+=("ft") tz+=("+06:30")
domain+=("dbr.kyatadmin777.com") site+=("7k") tz+=("+06:30")
domain+=("dbr.mmk959.com") site+=("mk1") tz+=("+06:30")
domain+=("dbr.lucky7yangon.com") site+=("l7") tz+=("+06:30")
domain+=("dbr.ktgslot.com") site+=("ba9") tz+=("+06:30")
# BDT
domain+=("dbr.ibetplus.net") site+=("jwb") tz+=("+06:00")
# MYR
domain+=("dbr.wstar88.asia") site+=("ws8") tz+=("+08:00")
# MXN
domain+=("dbr.betlion.bet") site+=("bl") tz+=("-05:00")
# GBP
domain+=("dbr.cybersino.net") site+=("iom") tz+=("+00:00")

# TC
#domain+=("dbr.adminspbet99.com") site+=("sb") tz+=("+07:00")
# domain+=("dbr.sbobetauto.net") site+=("bo")
# domain+=("dbr.servwin168.com") site+=("w98")
# domain+=("dbr.wopg168.com") site+=("pg")
# domain+=("dbr.0x88f.com") site+=("88f")
# domain+=("dbr.moneycenterthailand-admin.com") site+=("mct")
# domain+=("dbr.ufabetauto.vip") site+=("uf")
# domain+=("dbr.spvegas168.com") site+=("sp168")
# domain+=("dbr.grandbet999.com") site+=("gd")
# domain+=("dbr.richaswserver.com") site+=("aw")
# domain+=("dbr.paotang88.com") site+=("pt8")
# domain+=("dbr.serverclub789.online") site+=("c7")

endIndex=$(((${#domain[@]}) - 1))
echo "total: ${endIndex}"
for x in $(seq 0 1 ${endIndex}); do
  db[x]="${site[x]}_ocms_v2"
  user[x]="ocmsrd_${site[x]}"
  password[x]="ocmsrd_${site[x]}"
  sessionTz[x]="${tz[x]}" # default +07:00

  if [ "${site[x]}" == 'jw' ]; then password[x]="65bwHEKj2GWEPRUZSYGc4ejJ"; fi
  if [ "${site[x]}" == 'sb' ]; then
    user[x]="ocmsrd"
    password[x]="ocmsrd"
    db[x]="ocms_v2"
  fi
done

for x in $(seq 0 ${endIndex}); do
  export MYSQL_PWD="${password[x]}"
  # -p${password[x]} # mysql: [Warning] Using a password on the command line interface can be insecure.
  # -N Do not write column names in results
  # -A This has the same effect as --skip-auto-rehash. See the description for --auto-rehash.
  tzSql="set @@session.time_zone = '${sessionTz[x]}';"
  #sqlString="select '${site[x]}' as site, t.* from (${sql}) t;"
  #result=$(mysql -N -A -h${domain[x]} -u${user[x]} -t -D${db[x]} -e"${tzSql}${sqlString}")
  result=$(mysql -N -A -h${domain[x]} -u${user[x]} -B -D${db[x]} -e"${tzSql}${sql}")
  echo "${site[x]}\t${result}"
done
