Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711320E021
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593183; cv=none; b=GJrvO60BNalkdh96z2I3YnFjzMgt2Rc5tD382U5+5HtHyTRkE7g+IPmBkK83JkdIp+zKr416uCz7CWbpDIoa9zLLAmmEkpU+0jC28SAVymZHQaRgUFg8juLKVFXf1ICcnI0V285uVlcuF0ACiHwtkbmgRVIhrASQxGEjIIl7RZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593183; c=relaxed/simple;
	bh=6jH5/IL8ffkIQd0Vg5++x+rxmjnm2YUzs0Ud+NSLgoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRHnntaSZQV5FZg6tz72xTqZJAnkdY5MAw0gvtEBy1pkJ+oJzDtSjbtgsN7CuRBOZ3tseYgjqXTsv1zg10NUZnj4nw2/CUPlaSj4qe6Yf8Mnx9IxhsGx/oUG/LlcvT5IV4r/M2AWdzAfZ3tdXLetr8/SGO1ZW2QPCFCKTMKsBYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=GCHrJGfM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2nchBfLO; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=NoubhwMO; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=bQmANJWM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="GCHrJGfM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2nchBfLO";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="NoubhwMO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="bQmANJWM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8F57218B1;
	Fri, 30 May 2025 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748593179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KFI5NHJKY/0el5JaAfXoAK3KyJ42W3kIxArkoFHkeyE=;
	b=GCHrJGfMBcoba5SHUiu8a5s9oGfxjILqRURdB4ap7+OUl8fjZ52bAm4kpy2tfyMHpOSkX9
	52H6A9IqNdeJbw4NMHYMVD+8g7wjC+84w8COfwqDvDBPD9kwVre+YDMnHaRcNjkS1fCp9J
	mCSqsn9bpTi7eUC+Usxb1RvKGe1zB2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748593179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KFI5NHJKY/0el5JaAfXoAK3KyJ42W3kIxArkoFHkeyE=;
	b=2nchBfLOjVdog81OpQvtjBnJjvN5xR9TRkGm7wYWna+qpuvSSf31FjwpUAYCrpJetliSmP
	KBCPBrFPeAczNoDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=NoubhwMO;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=bQmANJWM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748593178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KFI5NHJKY/0el5JaAfXoAK3KyJ42W3kIxArkoFHkeyE=;
	b=NoubhwMO2TfdQeZpMEESj8K6Sf+PFUmPcp0HeMyXRP4wGlokS/7A5TFMCOv1lRrU/0NURd
	pEicoF+iGOGCkjwSEvlW5AubJ2p3gC6hY5+GBTlBHiEayCW9najtwLPFV9BLdmeJJwM+km
	8/sL3DnGfQ2TSDqJplkD/f6QVgLn1QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748593178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KFI5NHJKY/0el5JaAfXoAK3KyJ42W3kIxArkoFHkeyE=;
	b=bQmANJWMwKsynlEa9sgLwX/C8may7pWQTpXTg8rVDLN/QfhuBUvg4y+ot5v5Ux3X/uWgEk
	DwcDZuELuHBTQJAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6EC913889;
	Fri, 30 May 2025 08:19:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2SQ8MBpqOWihXQAAD6G6ig
	(envelope-from <chrubis@suse.cz>); Fri, 30 May 2025 08:19:38 +0000
Date: Fri, 30 May 2025 10:20:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it, linux-kernel@vger.kernel.org,
	libc-alpha@sourceware.org,
	valgrind-developers@lists.sourceforge.net
Cc: lwn@lwn.net, akpm@linux-foundation.org, torvalds@linux-foundation.org
Subject: [ANNOUNCE] The Linux Test Project has been released for MAY 2025
Message-ID: <aDlqOKWSZTzGqrsN@yuki.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D8F57218B1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

Good news everyone,

the Linux Test Project test suite stable release for *May 2025* has been
released.

Since the last release 282 patches by 33 authors were merged.

Patch review is what most of the projects struggle with and LTP is no
different. If you can spare some effort helping with the patch review is more
than welcomed.

NOTABLE CHANGES
===============

* New tests
  - kvm_vmx01 test for emulated VMREAD/VMWRITE instructions
  - kvm_vmx02 test for Intel VMX virtualized APIC
  - flock07 test for EINTR error
  - move_mount03 test for mount beneath top mount
  - fanotify24 test for FAN_PRE_ACCESS and FAN_DENY_ERRNO
  - unshare03 check for EMFILE when unsharing fd would hit the limits
  - fcntl40 test fcntl F_CREATED_QUERY
  - ioctl_fiemap01 functionality test for fiemap ioctl()
  - unshare04 tests that unshare(CLONE_NEWNS) unshares CWD
  - mmap22 test for new MAP_DROPPABLE flag

* Increased coverage
  - fanotify13 test case for FAN_DELETE_SELF
  - fanotify05 test reporting overflow event with FAN_REPORT_FD_ERROR
  - fanotify21 test reporting event with RDWR fd on RO mount
  - fanotify21 test reporting fd open errors with FAN_REPORT_FD_ERROR
  - flock02 test for EWOULDBLOCK errno
  - fchownat03 more tests for invalid inputs
  - fanotify14 test invalid init flags with permission and pre-content events
  - fanotify03 test cases for permission events on children
  - pause01 tests now for more signals not just EINTR
  - setrlimit06 test resource limit64 for process

* Removed tests
  - The test_controllers.sh is now disabled when v2 hierarchy is present
  - A few old and broken tests were removed from test_controllers.sh

* kirk was updated to version 2.1 see the release notes at:
  https://github.com/linux-test-project/kirk/releases

* New test catalogue generated from test metadata is live at:
  https://linux-test-project.readthedocs.io/en/latest/users/test_catalog.html

* We have a new metadata extractor for a shell and first test that is parsed:
  https://linux-test-project.readthedocs.io/en/latest/users/test_catalog.html#vma05-sh

* A few tests have been fixed not to be miscompiled by gcc-15
  - we had problems with changes in structure zero initializations where
    suddenly anonymous unions were not zero initialized anymore
  - and also with optimzer changes that now remove malloc() + free() pairs
    if the memmory is no touched between the calls

* The tst_brk() behavior has finally been clarified and fixed, for details see
  LTP commit a1f82704c28d ("lib/tst_test.c: Fix tst_brk() handling").

* New library test now have reproducible output that leaves out data that
  change between runs from the output, it's enabled with setting env variable
  LTP_REPRODUCIBLE_OUTPUT=1

* Our github CI is now connected to patchwork and runs LTP
  compilation tests for patches:

  https://patchwork.ozlabs.org/project/ltp/list/

* The LTP_SINGLE_FS_TYPE now honors test specific filesystem skiplists and thus
  can be used for general testing. There is new variable
  TST_FORCE_SINGLE_FS_TYPE that ignores skiplists and is supposed to be used
  for test development (which was previously the case for LTP_SINGLE_FS_TYPE).

* The ipc runtest file that cointained only pipeio test was merged into
  syscalls runtest file

* The horrible mess in testcases/kernel/mem/lib/ library was untangled into
  smaller pieces

* 43 testcases were converted to the new test library

+ The usual amount of fixes and cleanups


NOTABLE CHANGES IN IMA TESTS
============================
brought to you by Petr Vorel

* Add support to load predefined example IMA policy with LTP_IMA_LOAD_POLICY=1
  environment variable.

  This allows to run tests which are otherwise skipped due required policy not
  being loaded. SUT should be rebooted after each IMA tests (unless
  CONFIG_IMA_WRITE_POLICY=y` the policy can be written only once or policies
  can influence each other).

* Added additional ToMToU and open-writer violation tests (new in kernel v6.14)

* IMA: Allow to disable LSM warnings and use it for IMA (avoid misleading warnings)

+ Add some example IMA policies


DOWNLOAD AND LINKS
==================

The latest version of the test-suite contains 3000+ tests for the Linux
and can be downloaded at:

https://github.com/linux-test-project/ltp/releases/tag/20250530

The project pages as well as GIT repository are hosted on GitHub:

https://github.com/linux-test-project/ltp

If you ever wondered how to write a LTP testcase, don't miss our developer
documentation at:

https://linux-test-project.readthedocs.io/en/latest/developers/test_case_tutorial.html

And our library API documentation at:

https://linux-test-project.readthedocs.io/en/latest/developers/api_c_tests.html

Patches, new tests, bugs, comments or questions should go to to our mailing
list at ltp@lists.linux.it.


CREDITS
=======

Many thanks to the people contributing to this release:

git shortlog -s -e -n 20250130..

    80  Petr Vorel <pvorel@suse.cz>
    25  Cyril Hrubis <chrubis@suse.cz>
    24  Ricardo B. Marlière <rbm@suse.com>
    22  Martin Doucha <mdoucha@suse.cz>
    21  Andrea Cervesato <andrea.cervesato@suse.com>
    17  Ma Xinjian via ltp <ltp@lists.linux.it>
    14  Li Wang <liwang@redhat.com>
    13  Amir Goldstein <amir73il@gmail.com>
    11  Xinjian Ma (Fujitsu) <maxj.fnst@fujitsu.com>
    10  Jan Stancek <jstancek@redhat.com>
    10  Wei Gao <wegao@suse.com>
     5  Mimi Zohar <zohar@linux.ibm.com>
     4  Shiyang Ruan <ruansy.fnst@fujitsu.com>
     3  Avinesh Kumar <akumar@suse.de>
     3  Jeff Moyer <jmoyer@redhat.com>
     2  Edward Liaw <edliaw@google.com>
     2  lufei <lufei@uniontech.com>
     1  Ajay Kaher <ajay.kaher@broadcom.com>
     1  Binh Hoang <htb511@gmail.com>
     1  Dan Carpenter <dan.carpenter@linaro.org>
     1  Jan Polensky <japo@linux.ibm.com>
     1  Jin Guojie <guojie.jin@gmail.com>
     1  John Morin <John.Morin@gd-ms.com>
     1  Li Xiaosong <rj45usb@163.com>
     1  Luiz Capitulino <luizcap@redhat.com>
     1  Ross Burton <ross.burton@arm.com>
     1  Siddhesh Poyarekar <siddhesh@gotplt.org>
     1  Stuart R. Anderson <anderson@netsweng.com>
     1  T.J. Mercier <tjmercier@google.com>
     1  Xiao Liang <xiliang@redhat.com>
     1  Zhao Mengmeng <zhaomengmeng@kylinos.cn>
     1  dy455990 <dy455990@alibaba-inc.com>
     1  wangxuewen <wangxuewen@kylinos.cn>

And also thanks to patch reviewers:

git log 20250130.. | grep -Ei '(reviewed|acked)-by:' | sed 's/.*by: //' | sort | uniq -c | sort -n -r

    108 Petr Vorel <pvorel@suse.cz>
     71 Andrea Cervesato <andrea.cervesato@suse.com>
     62 Cyril Hrubis <chrubis@suse.cz>
     53 Li Wang <liwang@redhat.com>
     11 Mimi Zohar <zohar@linux.ibm.com>
      9 Martin Doucha <mdoucha@suse.cz>
      7 Jan Stancek <jstancek@redhat.com>
      7 Ricardo B. Marlière <ricardo@marliere.net>
      6 Jan Kara <jack@suse.cz>
      5 Avinesh Kumar <akumar@suse.de>

-- 
Cyril Hrubis
chrubis@suse.cz
