# Changelog

## 18.4.0

### New

* Switch to default spamd port 11333. [Thomas Merkel]
* No syslog for spamd, use regular file in /var/log/spamd/spamd.log. [Thomas Merkel]
* No syslog for exim, use regular logfiles. [Thomas Merkel]
* Provide logadm rules for all mail services. [Thomas Merkel]

### Fix

* Disable verbose logging for clamd and disable automatically rotate. [Thomas Merkel]

## 17.4.2

### Fix

- Fix exim-cron.sh again to work with non-gnu-xargs. [Thomas Merkel]

## 17.4.1

### New

- Switch to latest core-base version. [Thomas Merkel]

### Fix

- Fix script to support non gnu-find. [Thomas Merkel]
- Exim-cron script should not fail if db folder doesn't exists. [Thomas
  Merkel]

## 17.4.0

### New

- Exim update. [Thomas Merkel]
- Version bump to 17.4.1 core-base. [Thomas Merkel]

### Changes

- Do not keep any environment variables. [Thomas Merkel]
- Verify LMTP spiped connections for 127.0.0.1 with real certificate
  hostname for mbox server. [Thomas Merkel]
- Add base64 because its required by spipe config scripts. [Thomas
  Merkel]

## 17.1.0

### New

- Version bump to 17.1 core-base. [Thomas Merkel]
- Allow overwrite by SMTP usage. [Thomas Merkel]

## 16.4.0

### New

* Support Lets Encrypt. [Thomas Merkel]
* Provide the option to use external smtp servers instead of only an remote lmtp server from core.io. [Thomas Merkel]
* Provide the option to change the mailbox delivery protocol from lmtp to smtp if required. [Thomas Merkel]

### Changes

* Fix if for `mbox_lmtp_addr`. [Thomas Merkel]
* Remove demime becauese exim is no longer compiled with WITH_OLD_DEMIME. [Thomas Merkel]
* Update to core-base 16.04 version. [Thomas Merkel]

### Other

* Fix permissions for ssl certificates. [Thomas Merkel]
* Update license file. [Thomas Merkel]
* Also allow different SMTP port if needed. [Thomas Merkel]
* Fix permission for scan-spiped script. [Thomas Merkel]
* Remove unused .gitignore file. [Thomas Merkel]
* Fix config style guide. [Thomas Merkel]

## 16.2.0

### New

* Switch to latest core-base version 16.2.2. [Thomas Merkel]
* Disabled logging for devnull-router. [Boris Poblotzki]

### Fix

* Fix loading and installation of munin plugins. [Thomas Merkel]

### Other

* Move spamd.xml to correct location. [Thomas Merkel]

## 15.1.1

### New

* Version Bump because of new mi-core base image. [Thomas Merkel]

	The new core base image contains coreutils and some other default tools
	which aren't in the minimal mibe image. They are still required for many
	scripts we're using.

## 15.1.0

### New

* Version bump to 15.1.0 release. [Thomas Merkel]
* Improved routing in case localhost is not part of available MX-Recs. [Boris Poblotzki]
* Update to new release version of mibe core image. [Thomas Merkel]

  - modify munin setup
  - use exim from pkgsrc
  - cleanup

### Fix

* Dont symlink stuff use the default mailer.conf. [Thomas Merkel]
* Fixed routing issue in case MX is secondary. [Boris Poblotzki]

### Other

* Prettified code. [Boris Poblotzki]
* Min ram need to be an int not string. [Thomas Merkel]
* Disable bayes because we don't using in on the MX server at the moment. [Thomas Merkel]

  If bayes is enabled and not used it flag also SPAM msg which aren't found
  in the bayes database with minus something.

## 14.2.12

### Other

* version bump. [Thomas Merkel]
* activate tag rewriting. [Boris Poblotzki]
* special routing for +-localpart to local domains in alias. [Boris Poblotzki]
* changed position of router. [Boris Poblotzki]
* Routing based on MX-Record after alias lookup. [Boris Poblotzki]
* spamd plugins configrured. [Boris Poblotzki]
* changed time/cron for reloading/updating spamd. [Boris Poblotzki]
* Added and tested config for URIBL. [Boris Poblotzki]
* SPF check for spamassassin in init.pre activated. [Boris Poblotzki]
* adjusted messages in smtp communication. [Boris Poblotzki]
* better handling of bounce messages. [Boris Poblotzki]

## 14.2.11

### Other

* version bump. [Thomas Merkel]
* subaddressing implemented due to chenges in redis DB. [Boris Poblotzki]
* fixes in code and readme for using IPv6. [Boris Poblotzki]
* README edited. [Boris Poblotzki]
* several fixes for using external scanhosts some minor typos removed, too. [Boris Poblotzki]
* fix some minor bugs and typos after first reprov. [Boris Poblotzki]
* mdata 20-scan-spiped.sh created. [Boris Poblotzki]
* changed exim configfiles to be able to use external scanhost. [Boris Poblotzki]
* external scanhost for exim - beginning impl. [Boris Poblotzki]
* Don't use quotation mark for add_headers option. This will create crazy results for the header and copy header options sometimes to the body. [Thomas Merkel]

## 14.2.10

### Other

* version bump. [Thomas Merkel]
* case insensitiv in alias-lookups. [Boris Poblotzki]

## 14.2.9

### Other

* added configuration for spamc for scanning at exims routingtime. [Boris Poblotzki]
* added spam check at routing time. [Boris Poblotzki]

## 14.2.8

### New

* version bump and base image update. [Thomas Merkel]

### Other

* set message size for being spamscanned to 1M. [Boris Poblotzki]
* update exim to exim-4.84. [Sebastian Wiedenroth]

    includes fix for redis logic and backported smf fix in http://mail-
    index.netbsd.org/pkgsrc-changes/2014/10/20/msg112802.html so exim does
    queue runs

* run pyzor discover only if something went wrong. [Thomas Merkel]

## 14.2.7

### New

* update to new core-base image ffefd524-4e1e-11e4-9998-bf5009186c28. [Thomas Merkel]

### Fix

* set correct bayes path. [Thomas Merkel]
* dkim support for spamd which requires p5-Mail-DKIM. [Thomas Merkel]
* be sure we have gdbm for python installed for pyzor. [Thomas Merkel]
* be sure we run pyzor discover first. [Thomas Merkel]
* logadm do not warn for empty or non existing files. [Thomas Merkel]

### Other

* be sure the home dir is set correctly for spamd. [Thomas Merkel]
* Don't scan emails for spam that are &gt;5 MB, also don't scan emails for virus &gt;25 MB. [Thomas Merkel]
* Modify condition for HELO first check. [Thomas Merkel]
* Remove &quot;failed in HELO/EHLO - Connection denied after HELO&quot; and replace it with a local warning msg in the logfile. [Thomas Merkel]

    Most mailservers didn't provide correct DNS and HELO information, so
    we need to disable it.


## 14.2.6 (2014-10-06)

### New

* update to new core-base image cd298780-4d55-11e4-addf-63835732c9d9. [Thomas Merkel]
* configure logadm. [Thomas Merkel]

### Other

* fix for administrativ mails. [Boris Poblotzki]

## 14.2.5 (2014-10-03)

### New

* version update. [Thomas Merkel]

### Fix

* change tmpdir for spamd to use disk and not memory. [Thomas Merkel]
* change clamd temp directory to /var/tmp to dont use memory for that. [Thomas Merkel]

## 14.2.4 (2014-10-02)

### New

* update to new core-base image 5f32cd38-4a1f-11e4-82e4-632b59542bc6. [Thomas Merkel]
* create cronjob for exim verify script. [Thomas Merkel]
* exim cron script to check panic log and verify database. [Thomas Merkel]
* use also syslog for logging. [Thomas Merkel]

## 14.2.3 (2014-09-28)

### New

* update to new core-base image 4771851c-473c-11e4-a5d7-2336565b77d9. [Thomas Merkel]
* new munin plugin redis_replication_status. [Thomas Merkel]

## 14.2.2 (2014-09-27)

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

