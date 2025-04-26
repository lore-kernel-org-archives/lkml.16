Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EC4757EA;
	Sat, 26 Apr 2025 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745691210; cv=none; b=WMXzSrkbfGjKf46dR80Us4QoOVNwobv3/OhQhGECDY5lHZShJIA9YdTsIIQBvCk+dRhb/I6RI15BtupwgimAVjb6aUhZxnvl/03DpcEJhTf/zX4wM88tqBljQQytVRAnqC7957N6Lj+r2JhnUa8jGEqj0shofproqWQf7AXbwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745691210; c=relaxed/simple;
	bh=LhE4SeXnk5k636Fq+ooPMjm/NrlC4oZZROzZSTVqIvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtQaHHDkVfJisqH2enJd0uUigdk+cellrk3ArP0jWT0IU++YFbAsZhSkvWotFo70Oe0K9FofLWrX+FkQEOf5m/+5aq2emmR5UZPaqnPPKFw8X6n+jcqtAHBXZ1sOVZes20pSl9lwnPeDFpJEdX4Tcygpxdkw+qQZyVU11DiMwtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIC0dwYr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIC0dwYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745691208; x=1777227208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LhE4SeXnk5k636Fq+ooPMjm/NrlC4oZZROzZSTVqIvs=;
  b=eIC0dwYrx584fnOqt9SSOqLjM35RC14fkB3Tv7PnYWQ12dikt3uxRdpv
   atGXDK6gITfsNlaO7Ui9kPtbkhHE0hfb9TgR/dBCtsukf/VfMUVlw2XIJ
   KGv3DNRD/sycDD+UwgxnG+nN6/L3VNKmy3HkB6luzeEbDYCz6pI/ARWXv
   y/c1ZvDl/VyEG33mDL73I4poVlmT4ay6PooALbh/3HO64igPFQIChHga3
   Zt/rqkXUk2bNLrMBSWycse/H1dJkAY9467sp8pxXszLr5V5M6R2CZoaC+
   AubbgODOuYUoCGheNRm/SkBkhsjK480sy4KtmTGdNh9fVW0jxLAS5YTIv
   g==;
X-CSE-ConnectionGUID: P5RG7YP+R8qz9tj/wi0/gw==
X-CSE-MsgGUID: pmqfjp5iQ3Gw0EN/ublVEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="49977645"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="49977645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 11:13:27 -0700
X-CSE-ConnectionGUID: OfhAktAPT46l2213WsEbAQ==
X-CSE-MsgGUID: tOiVkebtS166gX/g5t8D8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="133657364"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2025 11:13:26 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8k1j-0005wp-2V;
	Sat, 26 Apr 2025 18:13:23 +0000
Date: Sun, 27 Apr 2025 02:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	linux-doc@vger.kernel.org
Subject: drivers/net/ethernet/wangxun/libwx/wx_ptp.c:415: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504270243.xykBkzwC-lkp@intel.com>
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
commit: 2d8967e86c9b12e7b8a82a531572186b2b97e804 net: ngbe: Add support for 1PPS and TOD
date:   9 weeks ago
config: arm64-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270243.xykBkzwC-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270243.xykBkzwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270243.xykBkzwC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/wangxun/libwx/wx_ptp.c:415: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * When PPS is enabled, unmask the interrupt for the ClockOut


vim +415 drivers/net/ethernet/wangxun/libwx/wx_ptp.c

   408	
   409	static int wx_ptp_feature_enable(struct ptp_clock_info *ptp,
   410					 struct ptp_clock_request *rq, int on)
   411	{
   412		struct wx *wx = container_of(ptp, struct wx, ptp_caps);
   413	
   414		/**
 > 415		 * When PPS is enabled, unmask the interrupt for the ClockOut
   416		 * feature, so that the interrupt handler can send the PPS
   417		 * event when the clock SDP triggers. Clear mask when PPS is
   418		 * disabled
   419		 */
   420		if (rq->type != PTP_CLK_REQ_PEROUT || !wx->ptp_setup_sdp)
   421			return -EOPNOTSUPP;
   422	
   423		/* Reject requests with unsupported flags */
   424		if (rq->perout.flags & ~(PTP_PEROUT_DUTY_CYCLE |
   425					 PTP_PEROUT_PHASE))
   426			return -EOPNOTSUPP;
   427	
   428		if (rq->perout.phase.sec || rq->perout.phase.nsec) {
   429			wx_err(wx, "Absolute start time not supported.\n");
   430			return -EINVAL;
   431		}
   432	
   433		if (rq->perout.period.sec != 1 || rq->perout.period.nsec) {
   434			wx_err(wx, "Only 1pps is supported.\n");
   435			return -EINVAL;
   436		}
   437	
   438		if (rq->perout.flags & PTP_PEROUT_DUTY_CYCLE) {
   439			struct timespec64 ts_on;
   440	
   441			ts_on.tv_sec = rq->perout.on.sec;
   442			ts_on.tv_nsec = rq->perout.on.nsec;
   443			wx->pps_width = timespec64_to_ns(&ts_on);
   444		} else {
   445			wx->pps_width = 120000000;
   446		}
   447	
   448		if (on)
   449			set_bit(WX_FLAG_PTP_PPS_ENABLED, wx->flags);
   450		else
   451			clear_bit(WX_FLAG_PTP_PPS_ENABLED, wx->flags);
   452	
   453		return wx->ptp_setup_sdp(wx);
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
