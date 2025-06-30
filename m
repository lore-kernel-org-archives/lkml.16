Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3106886359
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260735; cv=none; b=ThF8aau0FzHHcjhxWVnFQv43tJtl3Av9j2Lb1EqO2lYUPJxFo3Q0y+gwFnJ0XbjJLfwuZLjz6KAC5qT/5wi7SdPTkzl6CQt/MrSeiuwfzn0IKX3rxelpmiK6rpqg72mrKh6rRB12FP6oFle87cYD6L4PMrUveMrwm5FarQ5SA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260735; c=relaxed/simple;
	bh=aStqK1GA6HeCMgPP1SpWL2bIqFbZwwBQdmEDqf1lQI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/tjNgqNoicOCH+qjBuWt2t5LZIQQXeKSyGY7aqhsdt0dcww45KAmqanzE90yOYHBbNCkJh2jqfJSHHmFPBApxrpAR7bMUD44H88zSEaJ7Gui9E7rZfJlmvFKt3IeLbKE2gXuyPaGWNjd6u3JedSp/YDTkyxZ8fVaHimF0vzwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0P+N97R; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0P+N97R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751260734; x=1782796734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aStqK1GA6HeCMgPP1SpWL2bIqFbZwwBQdmEDqf1lQI4=;
  b=l0P+N97RdhbYdHshxfvo4R7JYevAAjUcE/loWZJ/ffxd7QQLYAKhsWCb
   rTR2rMzeGiXWwSrEqYRMF9/aBxtl88zGv09Ggrhm/Y+ohMhbsy5gqFmj5
   irQ5H0UHW4VrcyQ/IiH/hFXwdWAd0gK4ZUt9fnvqyPwKlq3OKIW2w58mm
   zMDDyZJRvoe23XyV01Pj7jWMwLYm0XR/hHjkvjQQA9ZdgQB9HneReFuuT
   9QZkK8s51F8dGHSkA+ajCLjaTX1Js0sSR8LKxJjpGLgYSFF58QgT/itJM
   QDEiyUcx7QmIegULV9SDVcmSlbIjZ5e2n2aFEfNTaH5DS8E2/0/6fBmBG
   A==;
X-CSE-ConnectionGUID: ATi7r2PbRcKNC3B/9X9Ybg==
X-CSE-MsgGUID: h8AWOKi9SBiJyJDUV+UCgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53599969"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53599969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 22:18:54 -0700
X-CSE-ConnectionGUID: 6UaC7HCNSLGWmPrKJL5Q/w==
X-CSE-MsgGUID: Fm4ZTnsPTkyiHXYz9JRRoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153898981"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jun 2025 22:18:52 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW6un-00013H-20;
	Mon, 30 Jun 2025 05:18:49 +0000
Date: Mon, 30 Jun 2025 07:18:31 +0200
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Colin Ian King <colin.i.king@gmail.com>
Subject: drivers/scsi/dc395x.c:2185:13: warning: variable 'fact' set but not
 used
Message-ID: <202506300705.3Sj0EHmY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
commit: 62b434b0db2cdc21d6fe978d24d8f84e473cb5e7 scsi: dc395x: Remove DEBUG conditional compilation
date:   9 weeks ago
config: loongarch-randconfig-2006-20250625 (https://download.01.org/0day-ci/archive/20250630/202506300705.3Sj0EHmY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300705.3Sj0EHmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300705.3Sj0EHmY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/dc395x.c: In function 'msgin_set_sync':
>> drivers/scsi/dc395x.c:2185:13: warning: variable 'fact' set but not used [-Wunused-but-set-variable]
    2185 |         int fact;
         |             ^~~~


vim +/fact +2185 drivers/scsi/dc395x.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2178  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2179  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2180  /* set sync transfer mode */
^1da177e4c3f41 Linus Torvalds 2005-04-16  2181  static void msgin_set_sync(struct AdapterCtlBlk *acb, struct ScsiReqBlk *srb)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2182  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2183  	struct DeviceCtlBlk *dcb = srb->dcb;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2184  	u8 bval;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @2185  	int fact;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2186  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2187  	if (srb->msgin_buf[4] > 15)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2188  		srb->msgin_buf[4] = 15;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2189  	if (!(dcb->dev_mode & NTC_DO_SYNC_NEGO))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2190  		dcb->sync_offset = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2191  	else if (dcb->sync_offset == 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2192  		dcb->sync_offset = srb->msgin_buf[4];
^1da177e4c3f41 Linus Torvalds 2005-04-16  2193  	if (srb->msgin_buf[4] > dcb->sync_offset)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2194  		srb->msgin_buf[4] = dcb->sync_offset;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2195  	else
^1da177e4c3f41 Linus Torvalds 2005-04-16  2196  		dcb->sync_offset = srb->msgin_buf[4];
^1da177e4c3f41 Linus Torvalds 2005-04-16  2197  	bval = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2198  	while (bval < 7 && (srb->msgin_buf[3] > clock_period[bval]
^1da177e4c3f41 Linus Torvalds 2005-04-16  2199  			    || dcb->min_nego_period >
^1da177e4c3f41 Linus Torvalds 2005-04-16  2200  			    clock_period[bval]))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2201  		bval++;
62b434b0db2cdc Oliver Neukum  2025-04-28  2202  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2203  	srb->msgin_buf[3] = clock_period[bval];
^1da177e4c3f41 Linus Torvalds 2005-04-16  2204  	dcb->sync_period &= 0xf0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2205  	dcb->sync_period |= ALT_SYNC | bval;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2206  	dcb->min_nego_period = srb->msgin_buf[3];
^1da177e4c3f41 Linus Torvalds 2005-04-16  2207  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2208  	if (dcb->sync_period & WIDE_SYNC)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2209  		fact = 500;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2210  	else
^1da177e4c3f41 Linus Torvalds 2005-04-16  2211  		fact = 250;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2212  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2213  	if (!(srb->state & SRB_DO_SYNC_NEGO)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2214  		/* Reply with corrected SDTR Message */
^1da177e4c3f41 Linus Torvalds 2005-04-16  2215  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2216  		memcpy(srb->msgout_buf, srb->msgin_buf, 5);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2217  		srb->msg_count = 5;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2218  		DC395x_ENABLE_MSGOUT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2219  		dcb->sync_mode |= SYNC_NEGO_DONE;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2220  	} else {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2221  		if ((dcb->sync_mode & WIDE_NEGO_ENABLE)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2222  		    && !(dcb->sync_mode & WIDE_NEGO_DONE)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2223  			build_wdtr(acb, dcb, srb);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2224  			DC395x_ENABLE_MSGOUT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2225  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2226  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2227  	srb->state &= ~SRB_DO_SYNC_NEGO;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2228  	dcb->sync_mode |= SYNC_NEGO_DONE | SYNC_NEGO_ENABLE;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2229  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2230  	reprogram_regs(acb, dcb);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2231  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2232  

:::::: The code at line 2185 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
