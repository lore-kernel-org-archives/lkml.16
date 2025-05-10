Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38628F3
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 00:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746837198; cv=none; b=J+kN/gY1J45bYMEEVaLLxebFHCWcJyi1QPj9cOKdUAddE3Eron+qrCnXytuHF3E8zyaJ7iMYRJudRpfsZtFQW1SpVV2ocbP86CPbHhgN7h62IRM4DNtIn607CIN7ST27X583masCJTMb7YUm69RRW7U91V6GuRnELP25//0XERQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746837198; c=relaxed/simple;
	bh=68Yyo9DKhyUzGrzZE+Y1y7T4U7CvNc4zRHAS8WYlyTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unFBILg0OqJBEGfgTzToZuFmI5JSdTUDow6AGtv9MrYa5vvAH4TY9EUapLnn5eIMYqxwaCqIdVa1gyqP3zEYX8trDD1aoEW45n27tjCWTVr/3KSO2WtoUJDiN6fGC/SAWUrt4+Y+N3wv9X7JPvAXTfKvz9mNrWilqV7RooGk3fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9Tx6eg4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9Tx6eg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746837197; x=1778373197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68Yyo9DKhyUzGrzZE+Y1y7T4U7CvNc4zRHAS8WYlyTA=;
  b=g9Tx6eg4U8GYNUrh7XhqH0nbkzJE7BzSnSaMVHlDt8ldDwfhWM7p/0iK
   AytANapX801mkG3NbLYN5WyRjYthQk+O8DH3XYro1h4wyc8rfUKDJ3LkQ
   fYGGNxUm/cuBz+Iu+l4kkpApVYTp4xBu54/nO2iXL5VGUvcmwFIa4kvBA
   Yh6WewVyCd/yufOhcv4MnoURxwFHwZuH79ybAspoz3WLxfYHj3ZqnY6Y4
   Elu5M5cMF2Jf38AR4JIXZJDosknXb6DfEtjVTLZ573HV/jtaCJdns57q1
   l3Y1VeHUzces5uxS3N2QmIaMdaXlmdhO2PSBnj+iSpkINeDKRs3Fq0H7A
   g==;
X-CSE-ConnectionGUID: gd93paXsSt6yNO5sdkkIKg==
X-CSE-MsgGUID: JAzU1v1fTGGZmD/kvOeFZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48601782"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48601782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 17:33:15 -0700
X-CSE-ConnectionGUID: udVbD7UCRo2VFOAulWVHew==
X-CSE-MsgGUID: 9IROyiIJSG69s7zCGcawMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137160215"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 17:33:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDY9P-000Caz-29;
	Sat, 10 May 2025 00:33:11 +0000
Date: Sat, 10 May 2025 08:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/thermal/thermal_debugfs.c:252:59: warning: '%d' directive
 output may be truncated writing between 1 and 5 bytes into a region of size
 between 3 and 8
Message-ID: <202505100843.B3Gh1AwW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e1329d4045ca3606f9c06a8c47f62e758a09105
commit: 755113d7678681a137c330f7997ceb680adb644e thermal/debugfs: Add thermal cooling device debugfs information
date:   1 year, 4 months ago
config: csky-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250510/202505100843.B3Gh1AwW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100843.B3Gh1AwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100843.B3Gh1AwW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/thermal_debugfs.c:103:6: warning: no previous prototype for 'thermal_debug_init' [-Wmissing-prototypes]
     103 | void thermal_debug_init(void)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:329:6: warning: no previous prototype for 'thermal_debug_cdev_state_update' [-Wmissing-prototypes]
     329 | void thermal_debug_cdev_state_update(const struct thermal_cooling_device *cdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:389:6: warning: no previous prototype for 'thermal_debug_cdev_add' [-Wmissing-prototypes]
     389 | void thermal_debug_cdev_add(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:431:6: warning: no previous prototype for 'thermal_debug_cdev_remove' [-Wmissing-prototypes]
     431 | void thermal_debug_cdev_remove(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c: In function 'cdev_tt_seq_show':
>> drivers/thermal/thermal_debugfs.c:252:59: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 8 [-Wformat-truncation=]
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                                                           ^~
   drivers/thermal/thermal_debugfs.c:252:54: note: directive argument in the range [0, 65535]
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                                                      ^~~~~~~~
   drivers/thermal/thermal_debugfs.c:252:17: note: 'snprintf' output between 5 and 14 bytes into a destination of size 11
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     253 |                          entry->id >> 16, entry->id & 0xFFFF);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +252 drivers/thermal/thermal_debugfs.c

   233	
   234	static int cdev_tt_seq_show(struct seq_file *s, void *v)
   235	{
   236		struct thermal_debugfs *thermal_dbg = s->private;
   237		struct cdev_debugfs *cdev_dbg = &thermal_dbg->cdev_dbg;
   238		struct list_head *transitions = cdev_dbg->transitions;
   239		struct cdev_record *entry;
   240		int i = *(loff_t *)v;
   241	
   242		if (!i)
   243			seq_puts(s, "Transition\tOccurences\n");
   244	
   245		list_for_each_entry(entry, &transitions[i], node) {
   246			/*
   247			 * Assuming maximum cdev states is 1024, the longer
   248			 * string for a transition would be "1024->1024\0"
   249			 */
   250			char buffer[11];
   251	
 > 252			snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
   253				 entry->id >> 16, entry->id & 0xFFFF);
   254	
   255			seq_printf(s, "%-10s\t%-10llu\n", buffer, entry->count);
   256		}
   257	
   258		return 0;
   259	}
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
