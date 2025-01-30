Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EFA1E522
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738265913; cv=none; b=jlV8OG19H88Gsff/jo7vvSzB8RUn2w9dBwzy088A6N8ym2E69tDufCtxjhMcK1rW8RzJcTScoxaoYxkEDWKruezOq9KoeuPF+8Qsk8epbA+GvHzux0Gz+o81nQdGpD/2CroIhhiHftjJT7XmV49zByvNzART1siQXvPOT2jdVU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738265913; c=relaxed/simple;
	bh=+7fGP9GShMAdoK7fXjSbRea/KXhtyWSqOV6O1WKdfBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvnQ1VqGKjmSA48WP6wUDIfcpjKYOul+EOD304Cpsb1lyzlE9w4VuuDfY6Ha7icOxviq8tNColK1NpOcz6SazE601HQ6vhKA1a3AzCrYhJstimw00uaxjnY6ldTChhu8xSdFWctria9ZLqkLajb45Ng/IW4OQEe2I2SSGcnK9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2PWcLiA1; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WcIn2wPh; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2PWcLiA1; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=WcIn2wPh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2PWcLiA1";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WcIn2wPh";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2PWcLiA1";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WcIn2wPh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A8A5B2116E;
	Thu, 30 Jan 2025 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738265908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YuwcywBHK+9NBumtOsA7uMb8hiISXXwIDTQuXCfkjKE=;
	b=2PWcLiA1byfTAhCMeqtZGKFJxR+bncShRqp2lwumUk2CQqajsQgZ03Eq7RiX9FBvhSXOmj
	GxYzDyw49MtP+8ZamL8J4khL3ZTCh3oT7Q4J+AYCnWuCf0yN+zrsCb3foPHAHt6Wuh7KWz
	X3P8RIcqAnACF4cCFsy84kJ8ngPHkCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738265908;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YuwcywBHK+9NBumtOsA7uMb8hiISXXwIDTQuXCfkjKE=;
	b=WcIn2wPh9ABO8DEHf9o8P/D8QsfsvpSTcOoR5HUkT2fYu1Cj/f4u6IaiIN/83bmMikhyBI
	G5ztRWFUATwSgzAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=2PWcLiA1;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=WcIn2wPh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738265908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YuwcywBHK+9NBumtOsA7uMb8hiISXXwIDTQuXCfkjKE=;
	b=2PWcLiA1byfTAhCMeqtZGKFJxR+bncShRqp2lwumUk2CQqajsQgZ03Eq7RiX9FBvhSXOmj
	GxYzDyw49MtP+8ZamL8J4khL3ZTCh3oT7Q4J+AYCnWuCf0yN+zrsCb3foPHAHt6Wuh7KWz
	X3P8RIcqAnACF4cCFsy84kJ8ngPHkCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738265908;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YuwcywBHK+9NBumtOsA7uMb8hiISXXwIDTQuXCfkjKE=;
	b=WcIn2wPh9ABO8DEHf9o8P/D8QsfsvpSTcOoR5HUkT2fYu1Cj/f4u6IaiIN/83bmMikhyBI
	G5ztRWFUATwSgzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9591C1366F;
	Thu, 30 Jan 2025 19:38:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qH0yJDTVm2cHSgAAD6G6ig
	(envelope-from <chrubis@suse.cz>); Thu, 30 Jan 2025 19:38:28 +0000
Date: Thu, 30 Jan 2025 20:38:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it, linux-kernel@vger.kernel.org,
	libc-alpha@sourceware.org
Cc: lwn@lwn.net, akpm@linux-foundation.org, torvalds@linux-foundation.org
Subject: [ANNOUNCE] The Linux Test Project has been released for JANUARY 2025
Message-ID: <Z5vVMpub3x__Bj64@yuki.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: A8A5B2116E
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Good news everyone,

the Linux Test Project test suite stable release for *January 2025* has been
released.

Since the last release 236 patches by 25 authors were merged.

Patch review is what most of the projects struggle with and LTP is no
different. If you can spare some effort helping with the patch review it
is more than welcomed.

NOTABLE CHANGES
===============

* New tests

  - madvise12 Tests that MADV_GUARD_INSTALL is causing SIGSEGV on access.
  - fsplough A test that checks data integrity between reads and writes for a file.
  - landlock08 Test for landlock bind()/connect().
  - hugemmap34 Tests that kernel handles properly when stack grows into a
               hugepage segment.
  - rt_sigqueueinfo02 Tests for rt_sigqueueinfo() errors.

  - listmount04 Tests for listmout() errors.
  - listmount03 Test for EPERM on inaccesible mount point.
  - listmount02 Test for group mount IDs.
  - listmount01 Test for LSMT_ROOT.

  - statmount08 Test for EPERM on inaccesible mount point.
  - statmount07 Tests for statmount() errors.
  - statmount06 Test for STATMOUNT_FS_TYPE.
  - statmount05 Test for STATMOUNT_VFS_ROOT and STATMOUNT_MNT_POINT.
  - statmount04 Test for STATMOUNT_PROPAGATE_FROM.
  - statmount03 Test for STATMOUNT_MNT_BASIC.
  - statmount02 Test for STATMOUNT_MNT_BASIC.
  - statmount01 Test for statmount() without any flags.

  - ioctl_ficlone01 Basic test for FICLONE ioctl().
  - ioctl_ficlone02 Test for EOPNOTSUPP for usupported FS.
  - ioctl_ficlone03 Tests for FICLONE errors.

  - ioctl_ficlonerange01 Basic test for FICLONERANGE ioctl().
  - ioctl_ficlonerange02 Tests for FICLONERANGE errors.

* Increased coverage

  - getrandom05 Tests the getrandom() syscall along with the VDSO implementation.
  - landlock02 Adds landlock network coverage.

* The failure hits (possible missing kernel patches) are now disabled until the
  test library finishes intialization. This is because if we fail to set up the
  test environment we haven't had a chance to reproduce the bug.

* The test library now supports per filesystem mkfs options, mount flags and
  min_kver. This is immediatelly used by FICLONE and FICLONERANGE tests since
  the support for different filesystems was added into different kernel versions.

* Rewritten tests

  - both pty01 and ptem01 test were cleaned up and split into several tests
  - vma05.sh is a first test rewritten to the new shell test library
  - process_madvise01 now runs in memory cgroup, where we can properly control
                      memory pressure.
  - fanotify10 Now drops cache three times to make sure inode is evicted, if
               the test stil fails in certain setups, please let us know.


* Removed tests

  - logrotate_tests.sh Since logrotate has it's own testsuite it's pointless to
                       keep the broken LTP test.

* Changes in test runtime and timeout handling
  - the runtime and timeout values are now tracked separately
  - runtime is now the time limit for a loop in the main test function
  - timeout is now an safety upper limit for the test execution
  - both values are per test iteration (e.g. for a single filesystem)
  - the LTP_TIMEOUT_MUL now multiplies the safety limit
  - the LTP_RUNTIME_MUL now multiplies for how long certain test will run
  - selected (debug) kernel CONFIG_ options, if enabled now, multiply the
    test timeouts
  - many testcases that run >= 1s on a slow reference hardware (RPi zero) were
    annotated with a proper timeout
  - generally the timeout handling should just work fine (tm) without any
    user adjustenments

* Couple of fixes were applied to the test metadata extractor
  so the data in ltp.json file are now more useful

* The syscall number fallback definitions are now automatically generated from
  kernel sources.

* 20 testcases were converted to the new test library

+ The usual amount of fixes and cleanups


NOTABLE CHANGES IN NETWORK TESTS
================================
brought to you by Petr Vorel

* New nfs10.sh test data integrity over NFS (uses fsplough)
* Removed old ftp01.sh


DOWNLOAD AND LINKS
==================

The latest version of the test-suite contains 3000+ tests for the Linux
and can be downloaded at:

https://github.com/linux-test-project/ltp/releases/tag/20250130

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

git shortlog -s -e -n 20240930..

    61  Petr Vorel <pvorel@suse.cz>
    59  Andrea Cervesato <andrea.cervesato@suse.com>
    29  Cyril Hrubis <chrubis@suse.cz>
    18  Xinjian Ma (Fujitsu) <maxj.fnst@fujitsu.com>
    12  Li Wang <liwang@redhat.com>
    11  Martin Doucha <mdoucha@suse.cz>
     8  Jan Stancek <jstancek@redhat.com>
     6  Ricardo B. Marliere <rbm@suse.com>
     5  Wei Gao <wegao@suse.com>
     3  Attila Fazekas <afazekas@redhat.com>
     3  David Hildenbrand <david@redhat.com>
     3  lufei <lufei@uniontech.com>
     2  Avinesh Kumar <akumar@suse.de>
     2  Edward Liaw <edliaw@google.com>
     2  Li Zhijian <lizhijian@fujitsu.com>
     2  Ma Xinjian via ltp <ltp@lists.linux.it>
     2  Po-Hsu Lin <po-hsu.lin@canonical.com>
     1  Alessandro Carminati <acarmina@redhat.com>
     1  Ian Whitfield <ian.whitfield@canonical.com>
     1  Khem Raj <raj.khem@gmail.com>
     1  Nathaniel Manista <nathaniel@google.com>
     1  Samir Mulani <samir@linux.vnet.ibm.com>
     1  Sven Schnelle <svens@linux.ibm.com>
     1  Xiubo Li <xiubli@redhat.com>
     1  Zizhi Wo <wozizhi@huawei.com>


And also thanks to patch reviewers:

git log 20240930.. | grep -Ei '(reviewed|acked)-by:' | sed 's/.*by: //' | sort | uniq -c | sort -n -r

    107 Petr Vorel <pvorel@suse.cz>
     86 Cyril Hrubis <chrubis@suse.cz>
     31 Li Wang <liwang@redhat.com>
     12 Andrea Cervesato <andrea.cervesato@suse.com>
     11 Wei Gao <wegao@suse.com>
      9 Jan Stancek <jstancek@redhat.com>
      7 Avinesh Kumar <akumar@suse.de>
      3 Po-Hsu Lin <po-hsu.lin@canonical.com>
      2 Martin Doucha <mdoucha@suse.cz>
      2 Jan Kara <jack@suse.cz>
      1 Mimi Zohar <zohar@linux.ibm.com>
      1 Chuck Lever <chuck.lever@oracle.com>
-- 
Cyril Hrubis
chrubis@suse.cz
