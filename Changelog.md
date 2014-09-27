# Changelog

## 14.2.2

### New

* update to new core-base image 43aaede4-4622-11e4-a839-d3704910e498. [Thomas Merkel]

## 14.2.1 (2014-09-25)

### Other

* update changelog. [Thomas Merkel]
* update version number. [Thomas Merkel]
* update to new core-base image: a6fb1ff0-4333-11e4-a0e1-370c81688134. [Thomas Merkel]
* max connections set to 500. [Boris Poblotzki]
* Add dkim selector, it's easier to update to a newer key. [Thomas Merkel]

## 14.2.0 (2014-09-21)

### Other

* add changelog. [Thomas Merkel]
* fix readme and license file. [Thomas Merkel]
* cleanup configuration file to use tabs. [Thomas Merkel]
* cleanup configuration file to use tabs. [Thomas Merkel]
* update to new core-base image: 6babbf24-3765-11e4-a87a-23e846a65e81. [Thomas Merkel]
* update to new core-base image: 99c9e7ac-34ed-11e4-bdc4-236f63b1ea9d. [Thomas Merkel]
* update readme file. [Thomas Merkel]
* remove [] for spide configuration to also allow hostnames. [Thomas Merkel]
* be sure we have a valid bayes db also if we dont use it. [Thomas Merkel]
* update to new core-base image: 89402478-34cf-11e4-ac94-f3a4d047918f. [Thomas Merkel]
* update to new core-base image: aed27f7a-34c4-11e4-be6c-4392ae5601bc. [Thomas Merkel]
* update to new core-base image: 5f749f3c-335f-11e4-a952-e780d226fa57. [Thomas Merkel]
* tiny routing issue fixed. [Boris Poblotzki]
* Merge branch 'master' of github.com:skylime/mi-core-mx. [Boris Poblotzki]
* routing to mailbox AND alias. [Boris Poblotzki]
* catchall alias is no more greedy. [Boris Poblotzki]
* Merge branch 'master' of github.com:skylime/mi-core-mx. [Boris Poblotzki]
* typo in exim config. [Boris Poblotzki]
* sligly imrpovement to the commit before - aliasrouting. [Boris Poblotzki]
* fixed routing for alias to internal mail accounts. [Boris Poblotzki]
* Spam-Report-Header only if level more than 5.0. [Boris Poblotzki]
* rfc2142 localparts interpreted with ans without domains. [Boris Poblotzki]
* administrativ contact changed from list to symbol. [Boris Poblotzki]
* Merge branch 'master' of github.com:skylime/mi-core-mx. [Boris Poblotzki]

    Conflicts:         copy/opt/core/var/mdata-setup/includes/31-exim.sh

* improved mdata for exim. [Boris Poblotzki]
* mdata tuned for administrativ emailaddress. [Boris Poblotzki]
* Added router for rfc2142 localparts. [Boris Poblotzki]
* ACLs prepared for rfc2142 localparts. [Boris Poblotzki]
* update base image. [Thomas Merkel]
* add munin configuration back to customize script. [Thomas Merkel]
* remove authentication on MX server. [Thomas Merkel]
* dont use port 25 on tls_on_connect_ports. [Thomas Merkel]
* Add rblwatch/rblcheck script as pip pkg and create cronjob. [Thomas Merkel]
* fixed typo in mailrouting (transport int_smtp not found) [Boris Poblotzki]
* report_safe to 0 for X-Spam header and no bodymod. [Boris Poblotzki]
* TLS advertised on port 25. [Boris Poblotzki]
* be sure the license is correct for skylime. [Thomas Merkel]
* fixed return path rewrite wildcard and tagged aliases. [Boris Poblotzki]
* changed mailrouting for lmtp and typos. [Boris Poblotzki]
* fixed condition for return-path rewrite. [Boris Poblotzki]
* get hostname from mdata. [Boris Poblotzki]
* rename domainkey to dkim_private_key. [Thomas Merkel]
* create spamd home folder. [Thomas Merkel]
* Use SMF for exim from pkgsrc. [Thomas Merkel]
* bind on localhost. [Thomas Merkel]
* add missing redis config. [Thomas Merkel]
* update base image. [Thomas Merkel]
* remove unused scripts. [Thomas Merkel]
* fix permissions and path for ssl certificate. [Thomas Merkel]
* fix permissions and path for ssl certificate. [Thomas Merkel]
* update readme. [Thomas Merkel]
* use new exim version. [Thomas Merkel]
* remove freshclam on image build. [Thomas Merkel]
* hiredis is an official pkg now. [Thomas Merkel]
* update to version 14.2.0. [Thomas Merkel]

    * use base image * remove data that is already in base image * cleanup
    temp changelog

* add minimum ram requirement. [Sebastian Wiedenroth]
* holy munin - fixed typo. [BroSys]
* get pyzor std-server. [Boris Poblotzki]
* switch to munin community plugin repo and remove static file. [Thomas Merkel]
* move all mdata-setup for includes. [Thomas Merkel]
* use -s option for mdata enable. [Thomas Merkel]
* fix plugin check for different munin stuff. [Thomas Merkel]
* missing munin plugin variables. [Thomas Merkel]
* Add awesome fancy motd. [Thomas Merkel]
* Enable munin-node for mx server with some default and custom plugins. [Thomas Merkel]
* clean up spamassassins config. [Boris Poblotzki]
* typo in spamassassins config. [Boris Poblotzki]
* Merge branch 'master' of github.com:skylime/mi-core-mx. [Boris Poblotzki]

    Conflicts:         packages

* added pyzor for spmassassin. [Boris Poblotzki]
* fix bash code, bitches. [Thomas Merkel]
* Add exim manifest because it's missing in the pkgs. [Thomas Merkel]
* fix child manifest exec. [Thomas Merkel]
* modify cron execute. [Thomas Merkel]
* remove spamd update on customize. [Thomas Merkel]
* Be sure database for spamd and clamd exists. [Thomas Merkel]
* disable clamd and spamd update on prov state. [Thomas Merkel]
* add spamassassin pkg to be installed. [Thomas Merkel]
* remove rspamd from enable it by default. [Thomas Merkel]
* add spamassassin spamd service. [Thomas Merkel]

    * add custom spamd manifest script * create extra user for spamd *
    create cron job that run sa-update every day

* enable mdata-setup only on provisioning state. [Thomas Merkel]
* Use single file that contains the cert, key and CA as PEM format. [Thomas Merkel]

    * it's easier to handle one single file which contains all ssl
    information * create ssl in the exim folder

* update clamav database by provisioning. [Thomas Merkel]

    * the clamav database is required to run clamd * run command once
    during provisioning * TODO: cronjob is required to update the database
    sometimes

* Fix logging directory for clamav. [Thomas Merkel]

    * use /var/log/clamav for logging * add directory and setup
    permissions * change configuration file from clamd.conf

* minor changes. [Boris Poblotzki]
* Fixed mainfest and motd. [Boris Poblotzki]
* Fixed providing SSL certs via mdata. [Boris Poblotzki]
* changed domainkey handling with mdata. [Boris Poblotzki]
* Fixed mdata and package installation/configuration and README. [Boris Poblotzki]
* Zoneinits for clamav, rspamd and exim added. [Boris Poblotzki]
* Added basics like mdata-setup, spipe-conf etc by copying... [Boris Poblotzki]
* renamed exim-configs minor changes for SRS-vars. [Boris Poblotzki]
* Initial commit with basic configs for exim, rspamd and clamav. [Boris Poblotzki]
* Fixed verbage in packages file. [Derek Crudgington]
* Merge branch 'master' of github.com:joyent/mi-example. [Derek Crudgington]
* Added extra space to motd. [Derek Crudgington]
* Fixed customize. [Derek Crudgington]
* Added new packages file. [Derek Crudgington]
* Removed .gitignore from copy directory. [Derek Crudgington]
* Added var/zoneinit/includes directory. [Derek Crudgington]
* Added LICENSE and copy directory. [Derek Crudgington]
* Initial release. [Derek Crudgington]

