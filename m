Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693FC78F4B;
	Fri, 27 Jun 2025 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751050180; cv=none; b=QCQtF0zZye4JnBEU4UTVlIGbSO3RLrhs0p5fb+fXIqBQD4vOPAJ03o0eH6bV76Wf49t53YByIcwel/yLCdsf6moA5N/rFUDozV+nDkOcsd+WFK1c7sTzY7/ycKUrhWgVwQuVWsq3s/tsBRSkOopZFheB/Q34n9ZFX52HvLUDHVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751050180; c=relaxed/simple;
	bh=narcaFjXVhe4/7r7kPhjOLSPFF8lb9hRlbz3gP5dDG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgKhLVJ9wBIAvXvGTb4QKsC7eXJhXSQ6ekaf9ZDj8A26U+tXIEL4yVcXErjElxS6csCai1ZgDrcupNeKdgTBRuRtbh+1+aWMAKd1zonIF0OtN3CdQF4TnOyXxicLm/ElZyotgsIfGfga1VbBQ8V7YT4FMPTb/GVCDCJdToZR7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agY5s/XZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agY5s/XZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751050178; x=1782586178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=narcaFjXVhe4/7r7kPhjOLSPFF8lb9hRlbz3gP5dDG0=;
  b=agY5s/XZQocy8Ex2IuFJHX0TUM4XyP1AiT6BUj1VSXRZiT2g57lYyjwU
   B/JhsHCObpsXQ+S4vGvrliVsff+pkz3kvsRrw+k0HIQ1SEo5uQbla3F2v
   Qc82jdageexcO/KZRnfvdlTwv4NUQTMXzwreUKtouCYxyj4x7rIjvzkP7
   iDONiWB5wl2U3pop+iz6alsGcuBa5qKyZzvV/o+MP2JBOzmW7TyVtNAzS
   0EyPb6l5cb2iDc1pj/8BEta6JLOXqZbSyl6XR17VaKvJhnnlPnXC4Fssy
   iYCp3E0ICtFwex1ark2x12OyAQsTIEnLsfe51CxzaTKPudKMdJhE3rH5r
   Q==;
X-CSE-ConnectionGUID: ZZAflAdaQz2obFK9MUwVSA==
X-CSE-MsgGUID: BD1XCQmaSCGw9sAx+eTDkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="78810498"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="78810498"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:49:37 -0700
X-CSE-ConnectionGUID: A7Edkv01Q/aVxm2Gt3qXJQ==
X-CSE-MsgGUID: Egm5CKSjSTaC/g/ScZ2zJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="152394717"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 11:49:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVE8h-000WTG-3D;
	Fri, 27 Jun 2025 18:49:32 +0000
Date: Sat, 28 Jun 2025 02:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	arm-scmi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <202506280217.aZih1pGT-lkp@intel.com>
References: <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on ecb259c4f70dd5c83907809f45bf4dc6869961d7]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/firmware-arm_scmi-imx-Add-documentation-for-MISC_BOARD_INFO/20250627-140736
base:   ecb259c4f70dd5c83907809f45bf4dc6869961d7
patch link:    https://lore.kernel.org/r/20250627-sm-misc-api-v1-v1-7-2b99481fe825%40nxp.com
patch subject: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
config: i386-buildonly-randconfig-001-20250628 (https://download.01.org/0day-ci/archive/20250628/202506280217.aZih1pGT-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280217.aZih1pGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280217.aZih1pGT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/imx/sm-misc.c:58:11: error: call to undeclared function 'kmalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |         syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
         |                  ^
   drivers/firmware/imx/sm-misc.c:58:11: note: did you mean 'mm_alloc'?
   include/linux/sched/mm.h:16:26: note: 'mm_alloc' declared here
      16 | extern struct mm_struct *mm_alloc(void);
         |                          ^
>> drivers/firmware/imx/sm-misc.c:58:9: error: incompatible integer to pointer conversion assigning to 'struct scmi_imx_misc_syslog *' from 'int' [-Wint-conversion]
      58 |         syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/imx/sm-misc.c:64:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      64 |                 kfree(syslog);
         |                 ^
   drivers/firmware/imx/sm-misc.c:80:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         kfree(syslog);
         |         ^
   drivers/firmware/imx/sm-misc.c:97:9: error: call to undeclared function 'kmalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      97 |         info = kmalloc(sizeof(*info), GFP_KERNEL);
         |                ^
>> drivers/firmware/imx/sm-misc.c:97:7: error: incompatible integer to pointer conversion assigning to 'struct scmi_imx_misc_system_info *' from 'int' [-Wint-conversion]
      97 |         info = kmalloc(sizeof(*info), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/sm-misc.c:127:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         kfree(info);
         |         ^
   7 errors generated.


vim +/kmalloc +58 drivers/firmware/imx/sm-misc.c

    46	
    47	static ssize_t syslog_show(struct device *device, struct device_attribute *attr,
    48				   char *buf)
    49	{
    50		struct scmi_imx_misc_sys_sleep_rec *rec;
    51		struct scmi_imx_misc_syslog *syslog;
    52		int ret;
    53		size_t len = 0;
    54	
    55		if (!ph)
    56			return 0;
    57	
  > 58		syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
    59		if (!syslog)
    60			return -ENOMEM;
    61	
    62		ret = imx_misc_ctrl_ops->misc_syslog(ph, sizeof(*syslog), syslog);
    63		if (ret) {
  > 64			kfree(syslog);
    65			return ret;
    66		}
    67	
    68		rec = &syslog->syssleeprecord;
    69	
    70		len += sysfs_emit_at(buf, len, "Wake Vector = %u\n", rec->wakesource);
    71		len += sysfs_emit_at(buf, len, "Sys sleep mode = %u\n", rec->syssleepmode);
    72		len += sysfs_emit_at(buf, len, "Sys sleep flags = 0x%08x\n", rec->syssleepflags);
    73		len += sysfs_emit_at(buf, len, "MIX power status = 0x%08x\n", rec->mixpwrstat);
    74		len += sysfs_emit_at(buf, len, "MEM power status = 0x%08x\n", rec->mempwrstat);
    75		len += sysfs_emit_at(buf, len, "PLL power status = 0x%08x\n", rec->pllpwrstat);
    76		len += sysfs_emit_at(buf, len, "Sleep latency = %u\n", rec->sleepentryusec);
    77		len += sysfs_emit_at(buf, len, "Wake latency = %u\n", rec->sleepexitusec);
    78		len += sysfs_emit_at(buf, len, "Sleep count = %u\n", rec->sleepcnt);
    79	
    80		kfree(syslog);
    81	
    82		return len;
    83	}
    84	
    85	static DEVICE_ATTR_RO(syslog);
    86	
    87	static ssize_t system_info_show(struct device *device, struct device_attribute *attr,
    88					char *buf)
    89	{
    90		struct scmi_imx_misc_system_info *info;
    91		int len = 0;
    92		int ret;
    93	
    94		if (!ph)
    95			return 0;
    96	
  > 97		info = kmalloc(sizeof(*info), GFP_KERNEL);
    98		if (!info)
    99			return -ENOMEM;
   100	
   101		ret = imx_misc_ctrl_ops->misc_discover_build_info(ph, info);
   102		if (ret)
   103			goto err;
   104	
   105		ret = imx_misc_ctrl_ops->misc_cfg_info(ph, info);
   106		if (ret)
   107			goto err;
   108	
   109		ret = imx_misc_ctrl_ops->misc_silicon_info(ph, info);
   110		if (ret)
   111			goto err;
   112	
   113		ret = imx_misc_ctrl_ops->misc_board_info(ph, info);
   114		if (ret)
   115			goto err;
   116	
   117		len += sysfs_emit_at(buf, len, "SM Version    = Build %u, Commit 08%x\n",
   118				     info->buildnum, info->buildcommit);
   119		len += sysfs_emit_at(buf, len, "SM Config     = %s, mSel=%u\n",
   120				     info->cfgname, info->msel);
   121		len += sysfs_emit_at(buf, len, "Silicon       = %s\n", info->siname);
   122		len += sysfs_emit_at(buf, len, "Board         = %s, attr=0x%08x\n",
   123				     info->brdname, info->brd_attributes);
   124	
   125		ret = len;
   126	err:
   127		kfree(info);
   128		return ret;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
