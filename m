Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A319DF9A;
	Sat, 26 Apr 2025 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745676313; cv=none; b=kGsPCZ2IJmZpFK506fgmAmwm+vc3l0LfCBfdmReGyb9L0wH4Xx2GjCRZO4Y6Okyy1xWMPCdH6pDGYGg1RodgY2jeeYcY1KkDCZd2zxDd0sa8SbmnPZkowgaP2z1Ww89dN5dZ3Bsph/0LHZJC5VC1CWGBwuk/LeMFpi68yhyKSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745676313; c=relaxed/simple;
	bh=4+YbDbrGVbTcVZXLZ9dgDnxjuRt9ZCVK58u0i2ZzWYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPNXrWaYOvDeKfjcc8r0w8AihbAbwvb/2sWgFog7GUOCqYRpWWyEJEzHAiXOk0iWvaCO2LZWPrreplw+2nsJChPvdwl3FF2my3zPW0OudvhabzlGCoj/+ylMPCx7l+StLCbVIrv1Oxfllv9RHg5o/0SU545uTD7UYWEkucS1CC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsFTZcKc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsFTZcKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745676311; x=1777212311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+YbDbrGVbTcVZXLZ9dgDnxjuRt9ZCVK58u0i2ZzWYs=;
  b=JsFTZcKchGRKObh7hfM62xlQBUwsad9AwTSvf1abbiZpca2zqHV1Bl0n
   K1I6pdtmOhZrPJZW2umjx3u3wSL5W0g10UTa2IbDAT7+dAnOdCdesld9S
   clcoDIYSL4AgXaZksV44ENEyWoK5nJo8mxCenRwCCN4omBIknUK66FSBW
   8OboQ3ae5dhea8hyUYTsLmK36WfoErkxul+D1zVTKh4mUFGVvdCYxQ+C8
   3XEc56Sr0pRoaLGrLhzuVM/vZsuGfIZh/I8eoCAHdADeHwpHRstenzLOF
   kbctBJ0wxmcoR/lAALgPpFo/8MCh0gcjLVmm0lnZNuFACQlO8W4h9inLY
   g==;
X-CSE-ConnectionGUID: AaDbeS7RTC2SPTFBATLqNw==
X-CSE-MsgGUID: dskZVps0QnayHUDoos6CLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="58687126"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="58687126"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 07:05:10 -0700
X-CSE-ConnectionGUID: 5wt15beaR2ePFfsRsw4AAQ==
X-CSE-MsgGUID: 7tbyT3ixSLCWh5zNawQEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="134107856"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Apr 2025 07:05:08 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8g9R-0005qx-2k;
	Sat, 26 Apr 2025 14:05:05 +0000
Date: Sat, 26 Apr 2025 22:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>, linux-doc@vger.kernel.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c:79:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504262246.HqBWltOk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 08502cebee7c54d58fee0a54a98064dade4cc4de drm/amd/display: Add DCN401 dependant changes for DMCUB
date:   1 year ago
config: sparc64-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262246.HqBWltOk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262246.HqBWltOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262246.HqBWltOk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c:79: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                    * Timeout covers both the ACK and the wait
   drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c:283: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * outbox1 wptr register is accessed without locks (dal & dc)
   drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c:292: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * outbox1 rptr register is accessed without locks (dal & dc)


vim +79 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c

70839da6360500 Aurabindo Pillai 2024-04-19   62  
70839da6360500 Aurabindo Pillai 2024-04-19   63  void dmub_dcn401_reset(struct dmub_srv *dmub)
70839da6360500 Aurabindo Pillai 2024-04-19   64  {
70839da6360500 Aurabindo Pillai 2024-04-19   65  	union dmub_gpint_data_register cmd;
70839da6360500 Aurabindo Pillai 2024-04-19   66  	const uint32_t timeout = 30;
70839da6360500 Aurabindo Pillai 2024-04-19   67  	uint32_t in_reset, scratch, i;
70839da6360500 Aurabindo Pillai 2024-04-19   68  
70839da6360500 Aurabindo Pillai 2024-04-19   69  	REG_GET(DMCUB_CNTL2, DMCUB_SOFT_RESET, &in_reset);
70839da6360500 Aurabindo Pillai 2024-04-19   70  
70839da6360500 Aurabindo Pillai 2024-04-19   71  	if (in_reset == 0) {
70839da6360500 Aurabindo Pillai 2024-04-19   72  		cmd.bits.status = 1;
70839da6360500 Aurabindo Pillai 2024-04-19   73  		cmd.bits.command_code = DMUB_GPINT__STOP_FW;
70839da6360500 Aurabindo Pillai 2024-04-19   74  		cmd.bits.param = 0;
70839da6360500 Aurabindo Pillai 2024-04-19   75  
70839da6360500 Aurabindo Pillai 2024-04-19   76  		dmub->hw_funcs.set_gpint(dmub, cmd);
70839da6360500 Aurabindo Pillai 2024-04-19   77  
70839da6360500 Aurabindo Pillai 2024-04-19   78  		/**
70839da6360500 Aurabindo Pillai 2024-04-19  @79  		 * Timeout covers both the ACK and the wait
70839da6360500 Aurabindo Pillai 2024-04-19   80  		 * for remaining work to finish.
70839da6360500 Aurabindo Pillai 2024-04-19   81  		 *
70839da6360500 Aurabindo Pillai 2024-04-19   82  		 * This is mostly bound by the PHY disable sequence.
70839da6360500 Aurabindo Pillai 2024-04-19   83  		 * Each register check will be greater than 1us, so
70839da6360500 Aurabindo Pillai 2024-04-19   84  		 * don't bother using udelay.
70839da6360500 Aurabindo Pillai 2024-04-19   85  		 */
70839da6360500 Aurabindo Pillai 2024-04-19   86  
70839da6360500 Aurabindo Pillai 2024-04-19   87  		for (i = 0; i < timeout; ++i) {
70839da6360500 Aurabindo Pillai 2024-04-19   88  			if (dmub->hw_funcs.is_gpint_acked(dmub, cmd))
70839da6360500 Aurabindo Pillai 2024-04-19   89  				break;
70839da6360500 Aurabindo Pillai 2024-04-19   90  		}
70839da6360500 Aurabindo Pillai 2024-04-19   91  
70839da6360500 Aurabindo Pillai 2024-04-19   92  		for (i = 0; i < timeout; ++i) {
70839da6360500 Aurabindo Pillai 2024-04-19   93  			scratch = dmub->hw_funcs.get_gpint_response(dmub);
70839da6360500 Aurabindo Pillai 2024-04-19   94  			if (scratch == DMUB_GPINT__STOP_FW_RESPONSE)
70839da6360500 Aurabindo Pillai 2024-04-19   95  				break;
70839da6360500 Aurabindo Pillai 2024-04-19   96  		}
70839da6360500 Aurabindo Pillai 2024-04-19   97  
70839da6360500 Aurabindo Pillai 2024-04-19   98  		/* Force reset in case we timed out, DMCUB is likely hung. */
70839da6360500 Aurabindo Pillai 2024-04-19   99  	}
70839da6360500 Aurabindo Pillai 2024-04-19  100  
70839da6360500 Aurabindo Pillai 2024-04-19  101  	REG_UPDATE(DMCUB_CNTL2, DMCUB_SOFT_RESET, 1);
70839da6360500 Aurabindo Pillai 2024-04-19  102  	REG_UPDATE(DMCUB_CNTL, DMCUB_ENABLE, 0);
70839da6360500 Aurabindo Pillai 2024-04-19  103  	REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 1);
70839da6360500 Aurabindo Pillai 2024-04-19  104  	REG_WRITE(DMCUB_INBOX1_RPTR, 0);
70839da6360500 Aurabindo Pillai 2024-04-19  105  	REG_WRITE(DMCUB_INBOX1_WPTR, 0);
70839da6360500 Aurabindo Pillai 2024-04-19  106  	REG_WRITE(DMCUB_OUTBOX1_RPTR, 0);
70839da6360500 Aurabindo Pillai 2024-04-19  107  	REG_WRITE(DMCUB_OUTBOX1_WPTR, 0);
70839da6360500 Aurabindo Pillai 2024-04-19  108  	REG_WRITE(DMCUB_OUTBOX0_RPTR, 0);
70839da6360500 Aurabindo Pillai 2024-04-19  109  	REG_WRITE(DMCUB_OUTBOX0_WPTR, 0);
70839da6360500 Aurabindo Pillai 2024-04-19  110  	REG_WRITE(DMCUB_SCRATCH0, 0);
70839da6360500 Aurabindo Pillai 2024-04-19  111  
70839da6360500 Aurabindo Pillai 2024-04-19  112  	/* Clear the GPINT command manually so we don't reset again. */
70839da6360500 Aurabindo Pillai 2024-04-19  113  	cmd.all = 0;
70839da6360500 Aurabindo Pillai 2024-04-19  114  	dmub->hw_funcs.set_gpint(dmub, cmd);
70839da6360500 Aurabindo Pillai 2024-04-19  115  }
70839da6360500 Aurabindo Pillai 2024-04-19  116  

:::::: The code at line 79 was first introduced by commit
:::::: 70839da6360500a82e4d5f78499284474cbed7c1 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
