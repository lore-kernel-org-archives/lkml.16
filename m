Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3121DFD83
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743802992; cv=none; b=OO57RGuBUZP/b7cbJbGE9BYIi6wC4mzFYGz0dTIQmUjkpVU8H9mTQQBQCzrA1lXnVLRUTFZec3XVA2ZowftYB58DEtCEsHhP6Y3KyeDRSf5xTzCS15YARpc3JkFuir1vLq878lGL5WLPXF/gZVs6sONtGVAg6xATNcAH0jttZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743802992; c=relaxed/simple;
	bh=e4pH7urb+e8HJNmGmYJuHzxYUIb5p0jUr75dyQlsqHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTf+P0eGKOkjyIjIigMovbtGMZOrQnJYEIRIGbDvefZluQ6oKFsSLMYzo0Rgfw1ZcagC2UHZVSub1LuACZHBV9F8MtNStKesHYLiO8LNX9E0sZsrntbWJkpdeYcOss03L8dnyukVxDDQsiGe0kCkuUZpcQolISwQPGLO1wRS+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOWkqzTh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOWkqzTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743802988; x=1775338988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4pH7urb+e8HJNmGmYJuHzxYUIb5p0jUr75dyQlsqHE=;
  b=XOWkqzThwiY2xkBjw0bsa8q56j+VICvDT/E8sG2jPgLWXmNSXTCB5Jl0
   Tlsz7GeiQ+AYJud1R2TYp2dnOCfxpgc0u12TlPP+85To19u/FhE1Mdoca
   W3o7VoeCJfCrhUbzPmhiHp3WY18X1QNKFIv4GHNSZyw+VzM2nPWYhnhsZ
   H/UdNBvKYGi0kY5LbDFTvUw80PVTp+HxQVgSA2LGXF7/EmQRrdeHEBfKH
   Znb/i7LhhacKK8b/4xNTduFAfE67RA7nwN15JicsiqE7rpNylBLwzIi4N
   Gy1vo2RIeMRBckoYZhAieNnU2HBGT/qmlwILPlvnxY6wAcNKBfvkrD6VK
   w==;
X-CSE-ConnectionGUID: 9z7BE6lQQU607NzaNl0KdQ==
X-CSE-MsgGUID: kYZv5rUaRpqqV2nPuX9FKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45145273"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="45145273"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 14:43:08 -0700
X-CSE-ConnectionGUID: tRgMSssgQQ6mtfOWbjELGw==
X-CSE-MsgGUID: r+Ga5SsNQf6G7UEcwNE9fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="131555141"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2025 14:43:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0ooa-0001ZF-23;
	Fri, 04 Apr 2025 21:43:04 +0000
Date: Sat, 5 Apr 2025 05:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:timers/cleanups 1/11] drivers/usb/host/xhci.c:5360:23: warning:
 shift count >= width of type
Message-ID: <202504050549.Y7oahYox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
head:   b33f0e454c28ce1fd504367575accecdf4c64dc3
commit: 6bcfaeda89efec08e5fb2010927a1cf4e89f0f4d [1/11] treewide: Switch to timer_delete[_sync]()
config: i386-buildonly-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050549.Y7oahYox-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050549.Y7oahYox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050549.Y7oahYox-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci.c:1074:4: error: call to undeclared function 'timer_delele_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1074 |                         timer_delele_sync(&xhci->comp_mode_recovery_timer);
         |                         ^
   drivers/usb/host/xhci.c:1074:4: note: did you mean 'timer_delete_sync'?
   include/linux/timer.h:166:12: note: 'timer_delete_sync' declared here
     166 | extern int timer_delete_sync(struct timer_list *timer);
         |            ^
>> drivers/usb/host/xhci.c:5360:23: warning: shift count >= width of type [-Wshift-count-overflow]
    5359 |         if (HCC_64BIT_ADDR(xhci->hcc_params) &&
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5360 |                         !dma_set_mask(dev, DMA_BIT_MASK(64))) {
         |                         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/usb/host/xhci.c:5360:23: warning: shift count >= width of type [-Wshift-count-overflow]
    5359 |         if (HCC_64BIT_ADDR(xhci->hcc_params) &&
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5360 |                         !dma_set_mask(dev, DMA_BIT_MASK(64))) {
         |                         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> drivers/usb/host/xhci.c:5360:23: warning: shift count >= width of type [-Wshift-count-overflow]
    5359 |         if (HCC_64BIT_ADDR(xhci->hcc_params) &&
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5360 |                         !dma_set_mask(dev, DMA_BIT_MASK(64))) {
         |                         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   drivers/usb/host/xhci.c:5362:30: warning: shift count >= width of type [-Wshift-count-overflow]
    5362 |                 dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
         |                                            ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   4 warnings and 1 error generated.


vim +5360 drivers/usb/host/xhci.c

57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5268  
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5269  int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5270  {
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5271  	struct xhci_hcd		*xhci;
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5272  	/*
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5273  	 * TODO: Check with DWC3 clients for sysdev according to
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5274  	 * quirks
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5275  	 */
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5276  	struct device		*dev = hcd->self.sysdev;
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5277  	int			retval;
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5278  
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5279  	/* Accept arbitrarily long scatter-gather lists */
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5280  	hcd->self.sg_tablesize = ~0;
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5281  
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5282  	/* support to build packet from discontinuous buffers */
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5283  	hcd->self.no_sg_constraint = 1;
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5284  
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5285  	/* XHCI controllers don't stop the ep queue on short packets :| */
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5286  	hcd->self.no_stop_on_short = 1;
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5287  
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5288  	xhci = hcd_to_xhci(hcd);
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5289  
873f323618c202 Heiner Kallweit           2022-05-12  5290  	if (!usb_hcd_is_primary_hcd(hcd)) {
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5291  		xhci_hcd_init_usb3_data(xhci, hcd);
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5292  		return 0;
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5293  	}
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5294  
a00918d0521df1 Chris Bainbridge          2015-05-19  5295  	mutex_init(&xhci->mutex);
57f23cd0bf2f56 Heiner Kallweit           2022-05-12  5296  	xhci->main_hcd = hcd;
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5297  	xhci->cap_regs = hcd->regs;
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5298  	xhci->op_regs = hcd->regs +
b0ba9720846c98 Xenia Ragiadakou          2013-11-15  5299  		HC_LENGTH(readl(&xhci->cap_regs->hc_capbase));
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5300  	xhci->run_regs = hcd->regs +
b0ba9720846c98 Xenia Ragiadakou          2013-11-15  5301  		(readl(&xhci->cap_regs->run_regs_off) & RTSOFF_MASK);
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5302  	/* Cache read-only capability registers */
b0ba9720846c98 Xenia Ragiadakou          2013-11-15  5303  	xhci->hcs_params1 = readl(&xhci->cap_regs->hcs_params1);
b0ba9720846c98 Xenia Ragiadakou          2013-11-15  5304  	xhci->hcs_params2 = readl(&xhci->cap_regs->hcs_params2);
b0ba9720846c98 Xenia Ragiadakou          2013-11-15  5305  	xhci->hcs_params3 = readl(&xhci->cap_regs->hcs_params3);
c63d5757d0fcbc Linyu Yuan                2022-03-03  5306  	xhci->hci_version = HC_VERSION(readl(&xhci->cap_regs->hc_capbase));
b0ba9720846c98 Xenia Ragiadakou          2013-11-15  5307  	xhci->hcc_params = readl(&xhci->cap_regs->hcc_params);
04abb6de28250d Lu Baolu                  2015-10-01  5308  	if (xhci->hci_version > 0x100)
04abb6de28250d Lu Baolu                  2015-10-01  5309  		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5310  
b17a57f89f6906 Mathias Nyman             2023-02-02  5311  	/* xhci-plat or xhci-pci might have set max_interrupters already */
b17a57f89f6906 Mathias Nyman             2023-02-02  5312  	if ((!xhci->max_interrupters) ||
b17a57f89f6906 Mathias Nyman             2023-02-02  5313  	    xhci->max_interrupters > HCS_MAX_INTRS(xhci->hcs_params1))
b17a57f89f6906 Mathias Nyman             2023-02-02  5314  		xhci->max_interrupters = HCS_MAX_INTRS(xhci->hcs_params1);
b17a57f89f6906 Mathias Nyman             2023-02-02  5315  
757de492f2d571 Mathias Nyman             2016-06-01  5316  	xhci->quirks |= quirks;
4e6a1ee72b74ce Takashi Iwai              2013-12-09  5317  
9b907c91aa9452 Mathias Nyman             2023-06-02  5318  	if (get_quirks)
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5319  		get_quirks(dev, xhci);
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5320  
07f3cb7c28bf3f George Cherian            2013-07-01  5321  	/* In xhci controllers which follow xhci 1.0 spec gives a spurious
07f3cb7c28bf3f George Cherian            2013-07-01  5322  	 * success event after a short transfer. This quirk will ignore such
07f3cb7c28bf3f George Cherian            2013-07-01  5323  	 * spurious event.
07f3cb7c28bf3f George Cherian            2013-07-01  5324  	 */
07f3cb7c28bf3f George Cherian            2013-07-01  5325  	if (xhci->hci_version > 0x96)
07f3cb7c28bf3f George Cherian            2013-07-01  5326  		xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
07f3cb7c28bf3f George Cherian            2013-07-01  5327  
083ba4c46a1cdb Niklas Neronin            2024-11-06  5328  	if (xhci->hci_version == 0x95 && link_quirk) {
083ba4c46a1cdb Niklas Neronin            2024-11-06  5329  		xhci_dbg(xhci, "QUIRK: Not clearing Link TRB chain bits");
083ba4c46a1cdb Niklas Neronin            2024-11-06  5330  		xhci->quirks |= XHCI_LINK_TRB_QUIRK;
083ba4c46a1cdb Niklas Neronin            2024-11-06  5331  	}
083ba4c46a1cdb Niklas Neronin            2024-11-06  5332  
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5333  	/* Make sure the HC is halted. */
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5334  	retval = xhci_halt(xhci);
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5335  	if (retval)
cd33a32157e424 Roger Quadros             2015-05-29  5336  		return retval;
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5337  
12de0a35c996c3 Marc Zyngier              2018-05-23  5338  	xhci_zero_64b_regs(xhci);
12de0a35c996c3 Marc Zyngier              2018-05-23  5339  
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5340  	xhci_dbg(xhci, "Resetting HCD\n");
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5341  	/* Reset the internal HC memory state and registers. */
14073ce951b591 Mathias Nyman             2022-03-03  5342  	retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5343  	if (retval)
cd33a32157e424 Roger Quadros             2015-05-29  5344  		return retval;
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5345  	xhci_dbg(xhci, "Reset complete\n");
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5346  
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5347  	/*
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5348  	 * On some xHCI controllers (e.g. R-Car SoCs), the AC64 bit (bit 0)
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5349  	 * of HCCPARAMS1 is set to 1. However, the xHCs don't support 64-bit
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5350  	 * address memory pointers actually. So, this driver clears the AC64
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5351  	 * bit of xhci->hcc_params to call dma_set_coherent_mask(dev,
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5352  	 * DMA_BIT_MASK(32)) in this xhci_gen_setup().
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5353  	 */
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5354  	if (xhci->quirks & XHCI_NO_64BIT_SUPPORT)
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5355  		xhci->hcc_params &= ~BIT(0);
0a380be8233dbf Yoshihiro Shimoda         2016-04-08  5356  
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  5357  	/* Set dma_mask and coherent_dma_mask to 64-bits,
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  5358  	 * if xHC supports 64-bit addressing */
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  5359  	if (HCC_64BIT_ADDR(xhci->hcc_params) &&
c10cf1189d7659 Xenia Ragiadakou          2013-08-14 @5360  			!dma_set_mask(dev, DMA_BIT_MASK(64))) {
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5361  		xhci_dbg(xhci, "Enabling 64-bit DMA addresses.\n");
c10cf1189d7659 Xenia Ragiadakou          2013-08-14  5362  		dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
fda182d80a0bf3 Duc Dang                  2015-10-09  5363  	} else {
fda182d80a0bf3 Duc Dang                  2015-10-09  5364  		/*
fda182d80a0bf3 Duc Dang                  2015-10-09  5365  		 * This is to avoid error in cases where a 32-bit USB
fda182d80a0bf3 Duc Dang                  2015-10-09  5366  		 * controller is used on a 64-bit capable system.
fda182d80a0bf3 Duc Dang                  2015-10-09  5367  		 */
fda182d80a0bf3 Duc Dang                  2015-10-09  5368  		retval = dma_set_mask(dev, DMA_BIT_MASK(32));
fda182d80a0bf3 Duc Dang                  2015-10-09  5369  		if (retval)
fda182d80a0bf3 Duc Dang                  2015-10-09  5370  			return retval;
fda182d80a0bf3 Duc Dang                  2015-10-09  5371  		xhci_dbg(xhci, "Enabling 32-bit DMA addresses.\n");
fda182d80a0bf3 Duc Dang                  2015-10-09  5372  		dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5373  	}
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5374  
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5375  	xhci_dbg(xhci, "Calling HCD init\n");
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5376  	/* Initialize HCD and host controller data structures. */
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5377  	retval = xhci_init(hcd);
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5378  	if (retval)
cd33a32157e424 Roger Quadros             2015-05-29  5379  		return retval;
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5380  	xhci_dbg(xhci, "Called HCD init\n");
99705092a83f02 Hans de Goede             2015-01-16  5381  
873f323618c202 Heiner Kallweit           2022-05-12  5382  	if (xhci_hcd_is_usb3(hcd))
873f323618c202 Heiner Kallweit           2022-05-12  5383  		xhci_hcd_init_usb3_data(xhci, hcd);
873f323618c202 Heiner Kallweit           2022-05-12  5384  	else
873f323618c202 Heiner Kallweit           2022-05-12  5385  		xhci_hcd_init_usb2_data(xhci, hcd);
873f323618c202 Heiner Kallweit           2022-05-12  5386  
36b6857932f380 Marc Zyngier              2018-05-23  5387  	xhci_info(xhci, "hcc params 0x%08x hci version 0x%x quirks 0x%016llx\n",
99705092a83f02 Hans de Goede             2015-01-16  5388  		  xhci->hcc_params, xhci->hci_version, xhci->quirks);
99705092a83f02 Hans de Goede             2015-01-16  5389  
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5390  	return 0;
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5391  }
436e8c7d457ff4 Andrew Bresticker         2014-10-03  5392  EXPORT_SYMBOL_GPL(xhci_gen_setup);
552e0c4f12fef0 Sebastian Andrzej Siewior 2011-09-23  5393  

:::::: The code at line 5360 was first introduced by commit
:::::: c10cf1189d7659ffd7dbe488a4cee7ec0dcdd9c6 xhci: fix dma mask setup in xhci.c

:::::: TO: Xenia Ragiadakou <burzalodowa@gmail.com>
:::::: CC: Sarah Sharp <sarah.a.sharp@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
