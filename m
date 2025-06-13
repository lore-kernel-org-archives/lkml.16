Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A4239E85
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749856891; cv=none; b=f/DmFH8r1wNXI79XpmZu0TmYB2M6clnVR13OLgwoLyyeYerJE3qvG31zq2gEjgXiR1t24ORFMqpcsIKv1gbpsoeSV4Z1fRi+Z7aN0lcpNo4XdzPvS/76UdTcF/N1uHI+GVFmLY/++sdNwaRjfWs5y0kV9/71NPgCAu+kQMenZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749856891; c=relaxed/simple;
	bh=CkQw8hEYOjzT7iA+OJ9iPhX2fX0r83O60TEUigKhQlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AR7mhidIyzrPWUuThjX0lSP/hCEIdoKqsAt95teqZyDkUOQE7+S2aysvYb5ws1rFIdUmTNAxRFfz3VMVXoTsfC/i3P4WN8abr+zXV5p8xCncxjrbgQ0X7RTazEmY2JbZR4YGlRe6oUf9WXKkdmoBJL0jwtUrtpV0L3vABLH1Ppk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpWZehQL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpWZehQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749856890; x=1781392890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkQw8hEYOjzT7iA+OJ9iPhX2fX0r83O60TEUigKhQlg=;
  b=kpWZehQLNV6schf0GVnIFDYiYZLHDGr8ojBduzgpDL+yl1aBoqZfena+
   TnrDgMAhYQnlTJWBIsNEfz/iPWQIO6zAsX7Dtv2nldVuSVwCf/O3aeSfL
   xOkOTGm8qf4hNAwqXWVvZBKEeZD5KJ+56jGu6oezPFumrwQ+VkoOH1yJ+
   YBIABkOi0hEgBj7M3TAtyb+p20/PMUMQgUY1eCPD5zGO/l5p/BZbtZvpM
   NmtL8ADHL7BvK+xS20Xvnq/nNkdRZtXlcZrnoYK788k6f5QICNHUhn3+d
   vC9YccdBeVG94c4QV3iDxas/cpREwgqpVSTKhnm/l02pMJ/thOrK1ZwKW
   g==;
X-CSE-ConnectionGUID: FduROf89SAi+Ixl9jDQwcQ==
X-CSE-MsgGUID: UbQZ5wq1RQe6n7XYoJFQ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55883035"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="55883035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 16:21:29 -0700
X-CSE-ConnectionGUID: u8oyM5ZFQEGoSSbyTTNGGQ==
X-CSE-MsgGUID: erUIcK6iQZS5DAQFiqUFSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="153117013"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jun 2025 16:21:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQDiA-000D54-1I;
	Fri, 13 Jun 2025 23:21:26 +0000
Date: Sat, 14 Jun 2025 07:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>
Subject: drivers/char/ipmi/ipmi_watchdog.c:1251:2: warning: 'strcpy' source
 argument is the same as destination
Message-ID: <202506140756.EFXXvIP4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18531f4d1c8c47c4796289dbbc1ab657ffa063d2
commit: de6b4f99010ad22f0242f1fc0f75c0752a56e9bb s390/string: Remove strcpy() implementation
date:   6 weeks ago
config: s390-randconfig-002-20250614 (https://download.01.org/0day-ci/archive/20250614/202506140756.EFXXvIP4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140756.EFXXvIP4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140756.EFXXvIP4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/ipmi/ipmi_watchdog.c: In function 'ipmi_wdog_init':
>> drivers/char/ipmi/ipmi_watchdog.c:1251:2: warning: 'strcpy' source argument is the same as destination [-Wrestrict]
    1251 |  strcpy(preop, inval);
         |  ^~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1231:2: warning: 'strcpy' source argument is the same as destination [-Wrestrict]
    1231 |  strcpy(preaction, inval);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_watchdog.c:1207:2: warning: 'strcpy' source argument is the same as destination [-Wrestrict]
    1207 |  strcpy(action, inval);
         |  ^~~~~~~~~~~~~~~~~~~~~


vim +/strcpy +1251 drivers/char/ipmi/ipmi_watchdog.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1234  
cc4673eecdcc4a Corey Minyard  2005-11-07  1235  static int preop_op(const char *inval, char *outval)
cc4673eecdcc4a Corey Minyard  2005-11-07  1236  {
cc4673eecdcc4a Corey Minyard  2005-11-07  1237  	if (outval)
cc4673eecdcc4a Corey Minyard  2005-11-07  1238  		strcpy(outval, preop);
cc4673eecdcc4a Corey Minyard  2005-11-07  1239  
cc4673eecdcc4a Corey Minyard  2005-11-07  1240  	if (!inval)
cc4673eecdcc4a Corey Minyard  2005-11-07  1241  		return 0;
cc4673eecdcc4a Corey Minyard  2005-11-07  1242  
cc4673eecdcc4a Corey Minyard  2005-11-07  1243  	if (strcmp(inval, "preop_none") == 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1244  		preop_val = WDOG_PREOP_NONE;
cc4673eecdcc4a Corey Minyard  2005-11-07  1245  	else if (strcmp(inval, "preop_panic") == 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1246  		preop_val = WDOG_PREOP_PANIC;
cc4673eecdcc4a Corey Minyard  2005-11-07  1247  	else if (strcmp(inval, "preop_give_data") == 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1248  		preop_val = WDOG_PREOP_GIVE_DATA;
cc4673eecdcc4a Corey Minyard  2005-11-07  1249  	else
cc4673eecdcc4a Corey Minyard  2005-11-07  1250  		return -EINVAL;
cc4673eecdcc4a Corey Minyard  2005-11-07 @1251  	strcpy(preop, inval);
cc4673eecdcc4a Corey Minyard  2005-11-07  1252  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1253  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1254  

:::::: The code at line 1251 was first introduced by commit
:::::: cc4673eecdcc4a918e4d8796295d798b5e98d602 [PATCH] ipmi: watchdog parms in sysfs

:::::: TO: Corey Minyard <minyard@acm.org>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
