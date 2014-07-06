#!/bin/bash
# Configure munin-node allowed connections

MUNIN_CONF='/opt/local/etc/munin/munin-node.conf'

cp ${MUNIN_CONF}.tpl ${MUNIN_CONF}
if mdata-get munin_allow 1>/dev/null 2>&1; then
	echo "# mdata-get munin_allow" >> ${MUNIN_CONF}
	for allow in $(mdata-get munin_allow); do
		echo "cidr_allow ${allow}" >> ${MUNIN_CONF}
	done
fi

if mdata-get munin_deny 1>/dev/null 2>&1; then
	echo "# mdata-get munin_deny" >> ${MUNIN_CONF}
	for deny in $(mdata-get munin_deny); do
		echo "cidr_deny ${deny}" >> ${MUNIN_CONF}
	done
fi
