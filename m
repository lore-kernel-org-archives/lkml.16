Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CA1494D9;
	Sat, 28 Jun 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120971; cv=none; b=O08G1vHkPAPJrOkdsv82bv+A/aGQKkUtYSU2z5TbPaq5nf3z2239TIzPLgHCqaG0QQYf/A3c+CcvYLY6Q37zWbpWVC3RtP/7PDaDwr/zDTEGssyGTBD3gaflcljHONDBRYiSHd5zaYxF2K/0MRjZqlfcMqV3bpBoNvKW5dItjMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120971; c=relaxed/simple;
	bh=Ypz8IC0WQ6kWJ6ifXzoS95qT1PT+UG1tXVjgJx0z6wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxXzFZeguYYYDu3rUdc4DQVcsY/wvHWQYrpDs9D53mjYUhDDNi5NMwGebvvOgwJFY2V2NhkLjeFWGb6wfz0QZyUV1gsZpUOt0S+RP5gK63JGUV6pdlY3flYZHYY00GVjioELeggeyRmC3tSO455ay0oaoBnv3+NQOgTEdaRl52U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIagB7q2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIagB7q2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751120971; x=1782656971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ypz8IC0WQ6kWJ6ifXzoS95qT1PT+UG1tXVjgJx0z6wA=;
  b=mIagB7q2vx1GPz/gRZXGlCe333L94vYiJG6U3dHgFcCaumWz1xcfZczu
   QLFRTw3+h2XHx23wjl/peJo20Wd5FdlEUhu9o3WLRT1OQcVHrElJlP69J
   QeEtvUaqIAWyAZXUT2THCH+CyS9ANbL3ENqVlibknClioeWMji+Af/zMY
   fRijqtNPFX0VPcmOoLZuO/UrHiF3S1TmH/zGyJU0UZOMckJIRhyVaUwIx
   cSaQMT3cu/j1yShM52J0lxQ0psVUVSLvQNeEX3Vv94QvCZcRH6T95uvYo
   Q8SLzrMAcS25uucp79QfpKbjvxSInjDitKNkSvDDy8/h0LdkUUSmZmi7s
   A==;
X-CSE-ConnectionGUID: zlKLzPDbR+WsllHnPH8ILw==
X-CSE-MsgGUID: HQf0wbI/SO+DUMQIrBDewA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64466446"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="64466446"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:29:29 -0700
X-CSE-ConnectionGUID: gMWJbyT6QEO4lAfQvVx2Bw==
X-CSE-MsgGUID: 8sRXDiwWRweoATfN5/zrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152433805"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Jun 2025 07:29:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVWYV-000X6s-0K;
	Sat, 28 Jun 2025 14:29:23 +0000
Date: Sat, 28 Jun 2025 22:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <202506282233.n54Z23oc-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on ecb259c4f70dd5c83907809f45bf4dc6869961d7]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/firmware-arm_scmi-imx-Add-documentation-for-MISC_BOARD_INFO/20250627-140736
base:   ecb259c4f70dd5c83907809f45bf4dc6869961d7
patch link:    https://lore.kernel.org/r/20250627-sm-misc-api-v1-v1-7-2b99481fe825%40nxp.com
patch subject: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
config: x86_64-buildonly-randconfig-005-20250627 (https://download.01.org/0day-ci/archive/20250628/202506282233.n54Z23oc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282233.n54Z23oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506282233.n54Z23oc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/imx/sm-misc.c: In function 'syslog_show':
   drivers/firmware/imx/sm-misc.c:58:18: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      58 |         syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
         |                  ^~~~~~~
         |                  mm_alloc
>> drivers/firmware/imx/sm-misc.c:58:16: warning: assignment to 'struct scmi_imx_misc_syslog *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      58 |         syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
         |                ^
   drivers/firmware/imx/sm-misc.c:64:17: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      64 |                 kfree(syslog);
         |                 ^~~~~
   drivers/firmware/imx/sm-misc.c: In function 'system_info_show':
>> drivers/firmware/imx/sm-misc.c:97:14: warning: assignment to 'struct scmi_imx_misc_system_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      97 |         info = kmalloc(sizeof(*info), GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors


vim +58 drivers/firmware/imx/sm-misc.c

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
    64			kfree(syslog);
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
