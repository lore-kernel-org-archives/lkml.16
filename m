Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68A418B492
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745287781; cv=none; b=qjs5rWNM2OPJv//dmGSEKLGqMrhobs4VqAnlIO0cXktvbwmdghq0ckE6OWtL/0bCeFpy1mqMalh//qLeHb90LXd5bZZ5+ZJS7H/XG6e2sjTaTXfOkWhoopbp0g3K7RRg7zrSpB+utaAJmxg9FZbuSJzDsmjB61Xu9E72171jxbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745287781; c=relaxed/simple;
	bh=3IPdSJ3I70j4LJHQ7iHlhoXeqRYAYXW3zl/zrWVJSrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0ag1h5cioS5JXLJ9vqJUbKGbC/lpwvccEMADBecwh/O8+R7Woamxk8EZD21szUf/hewXsctV8fnpjMKVhoCXmURmLu0i8qVdzu9rDjVICZPt/WYP3A8twRl/EHTjzhZknp3FGcqVcya8KZ1A2iCt0x8Ahx9C4LebKB1N+FKaHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3GbKhIw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3GbKhIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745287780; x=1776823780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3IPdSJ3I70j4LJHQ7iHlhoXeqRYAYXW3zl/zrWVJSrE=;
  b=W3GbKhIw7Q7iaTDIBCjIb7hZfIO3pc8N7LwgEqBd8DjSAhSc8rZY/2gO
   Wjnv+VWlXVJbq9QgU+5I8LYV8DoYGDyq4Z0JmRilXFO63BZvomFkkGQEi
   exVZDWuTks21g0Vvgd4sHsbc1A1uMz1Dk7M8+BrV/besisq0wLwsh8s7x
   abN+vP+Gy02VPUSZ4hAj1F01WIlIrzY/2x5rMF2vaWiaee0hO5tCjJv5s
   kkFQDmTLCQSTgcWvnaOJsyVuKzU+02s7FeRPcDAaaH7Ao8TAXEEC2TvDh
   DNsTMldhH6WeXOM0V/HYUMj5LyguADZf7vQcfU4sii/E+OB5MqDnp2gIL
   g==;
X-CSE-ConnectionGUID: XeDy+Tu6RYuaMJdS1BgtYw==
X-CSE-MsgGUID: MBMFpQBUSfuC3EucvpxjFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="72226427"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="72226427"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 19:09:37 -0700
X-CSE-ConnectionGUID: xul+jjYbR/SaEE/EiQltpQ==
X-CSE-MsgGUID: kTkGfurvTZ6A9/0cvpkiSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="132835551"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Apr 2025 19:09:34 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u734l-0000WZ-29;
	Tue, 22 Apr 2025 02:09:31 +0000
Date: Tue, 22 Apr 2025 10:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marwin Hormiz <marwinhormiz@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dan.carpenter@linaro.org, matchstick@neverthere.org, arnd@arndb.de,
	niharchaithanya@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marwin Hormiz <marwinhormiz@gmail.com>
Subject: Re: [PATCH 1/1] staging: gpib: gpio: Fix memory allocation style in
 gpib_bitbang.c
Message-ID: <202504220954.L1QvhSdD-lkp@intel.com>
References: <20250421184144.220972-1-marwinhormiz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421184144.220972-1-marwinhormiz@gmail.com>

Hi Marwin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Marwin-Hormiz/staging-gpib-gpio-Fix-memory-allocation-style-in-gpib_bitbang-c/20250422-024547
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250421184144.220972-1-marwinhormiz%40gmail.com
patch subject: [PATCH 1/1] staging: gpib: gpio: Fix memory allocation style in gpib_bitbang.c
config: i386-buildonly-randconfig-001-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220954.L1QvhSdD-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220954.L1QvhSdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220954.L1QvhSdD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/gpib/gpio/gpib_bitbang.c:380:29: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     380 |         dbg_printk(3, ".........." LINFMT "\n", LINVAL);
         |                                    ^~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:54:32: note: expanded from macro 'LINFMT'
      54 | #define LINFMT "DAV: %d  NRFD:%d  NDAC: %d SRQ: %d"
         |                               ~^
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:29: note: expanded from macro 'dbg_printk'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                                                  ^~~
   include/linux/dev_printk.h:171:41: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:41: note: expanded from macro 'pr_fmt'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                                         ^~~
   include/linux/dev_printk.h:139:28: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:454:7: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     454 |                            LINFMT ".\n", val, priv->dav_rx, priv->w_cnt, priv->length,
         |                            ^~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:54:32: note: expanded from macro 'LINFMT'
      54 | #define LINFMT "DAV: %d  NRFD:%d  NDAC: %d SRQ: %d"
         |                               ~^
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:29: note: expanded from macro 'dbg_printk'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                                                  ^~~
   include/linux/dev_printk.h:171:41: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:41: note: expanded from macro 'pr_fmt'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                                         ^~~
   include/linux/dev_printk.h:139:28: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:550:49: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     550 |                         dbg_printk(1, "timeout after %zu/%zu at %d " LINFMT " eoi: %d\n",
         |                                                                      ^~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:54:42: note: expanded from macro 'LINFMT'
      54 | #define LINFMT "DAV: %d  NRFD:%d  NDAC: %d SRQ: %d"
         |                                         ~^
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:29: note: expanded from macro 'dbg_printk'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                                                  ^~~
   include/linux/dev_printk.h:171:41: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:41: note: expanded from macro 'pr_fmt'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                                         ^~~
   include/linux/dev_printk.h:139:28: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:610:70: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     610 |                 dbg_printk(1, "out of order interrupt after %zu/%zu at %d cmd %d " LINFMT ".\n",
         |                                                                                    ^~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:54:32: note: expanded from macro 'LINFMT'
      54 | #define LINFMT "DAV: %d  NRFD:%d  NDAC: %d SRQ: %d"
         |                               ~^
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:29: note: expanded from macro 'dbg_printk'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                                                  ^~~
   include/linux/dev_printk.h:171:41: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:41: note: expanded from macro 'pr_fmt'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                                         ^~~
   include/linux/dev_printk.h:139:28: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:617:49: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     617 |                 dbg_printk(1, "DAV low after %zu/%zu cmd %d " LINFMT ". No action.\n",
         |                                                               ^~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:54:32: note: expanded from macro 'LINFMT'
      54 | #define LINFMT "DAV: %d  NRFD:%d  NDAC: %d SRQ: %d"
         |                               ~^
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:29: note: expanded from macro 'dbg_printk'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                                                  ^~~
   include/linux/dev_printk.h:171:41: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:28:41: note: expanded from macro 'pr_fmt'
      28 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                                         ^~~
   include/linux/dev_printk.h:139:28: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:687:50: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     687 |                 dbg_printk(1, "DAV high after %zu/%zu cmd %d " LINFMT ". No action.\n",
         |                                                                ^~~~~~
   drivers/staging/gpib/gpio/gpib_bitbang.c:54:32: note: expanded from macro 'LINFMT'
      54 | #define LINFMT "DAV: %d  NRFD:%d  NDAC: %d SRQ: %d"
         |                               ~^
   drivers/staging/gpib/gpio/gpib_bitbang.c:47:29: note: expanded from macro 'dbg_printk'
      47 |                         dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
         |                                                  ^~~
   include/linux/dev_printk.h:171:41: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)


vim +380 drivers/staging/gpib/gpio/gpib_bitbang.c

4cd654f847693c2 Dave Penkler  2024-09-18  350  
4cd654f847693c2 Dave Penkler  2024-09-18  351  /***************************************************************************
4cd654f847693c2 Dave Penkler  2024-09-18  352   *									   *
4cd654f847693c2 Dave Penkler  2024-09-18  353   * READ									   *
4cd654f847693c2 Dave Penkler  2024-09-18  354   *									   *
4cd654f847693c2 Dave Penkler  2024-09-18  355   ***************************************************************************/
4cd654f847693c2 Dave Penkler  2024-09-18  356  
aa7f3b35ac16fd4 Michael Rubin 2025-04-17  357  static int bb_read(struct gpib_board *board, u8 *buffer, size_t length,
4cd654f847693c2 Dave Penkler  2024-09-18  358  		   int *end, size_t *bytes_read)
4cd654f847693c2 Dave Penkler  2024-09-18  359  {
4cd654f847693c2 Dave Penkler  2024-09-18  360  	struct bb_priv *priv = board->private_data;
4cd654f847693c2 Dave Penkler  2024-09-18  361  	unsigned long flags;
4cd654f847693c2 Dave Penkler  2024-09-18  362  	int retval = 0;
4cd654f847693c2 Dave Penkler  2024-09-18  363  
4cd654f847693c2 Dave Penkler  2024-09-18  364  	ACT_LED_ON;
4cd654f847693c2 Dave Penkler  2024-09-18  365  	SET_DIR_READ(priv);
4cd654f847693c2 Dave Penkler  2024-09-18  366  
4cd654f847693c2 Dave Penkler  2024-09-18  367  	dbg_printk(2, "board: %p  lock %d  length: %zu\n",
4cd654f847693c2 Dave Penkler  2024-09-18  368  		   board, mutex_is_locked(&board->user_mutex), length);
4cd654f847693c2 Dave Penkler  2024-09-18  369  
4cd654f847693c2 Dave Penkler  2024-09-18  370  	priv->end = 0;
4cd654f847693c2 Dave Penkler  2024-09-18  371  	priv->count = 0;
4cd654f847693c2 Dave Penkler  2024-09-18  372  	priv->rbuf = buffer;
4cd654f847693c2 Dave Penkler  2024-09-18  373  	if (length == 0)
4cd654f847693c2 Dave Penkler  2024-09-18  374  		goto read_end;
4cd654f847693c2 Dave Penkler  2024-09-18  375  	priv->request = length;
4cd654f847693c2 Dave Penkler  2024-09-18  376  	priv->eos_check = (priv->eos_flags & REOS) == 0; /* do eos check */
4cd654f847693c2 Dave Penkler  2024-09-18  377  	priv->eos_check_8 = priv->eos_flags & BIN;	 /* over 8 bits */
4cd654f847693c2 Dave Penkler  2024-09-18  378  	priv->eos_mask_7 = priv->eos & 0x7f;		 /* with this 7 bit eos */
4cd654f847693c2 Dave Penkler  2024-09-18  379  
4cd654f847693c2 Dave Penkler  2024-09-18 @380  	dbg_printk(3, ".........." LINFMT "\n", LINVAL);
4cd654f847693c2 Dave Penkler  2024-09-18  381  
4cd654f847693c2 Dave Penkler  2024-09-18  382  	spin_lock_irqsave(&priv->rw_lock, flags);
4cd654f847693c2 Dave Penkler  2024-09-18  383  	priv->dav_mode = 1;
4cd654f847693c2 Dave Penkler  2024-09-18  384  	priv->dav_rx = 1;
4cd654f847693c2 Dave Penkler  2024-09-18  385  	ENABLE_IRQ(priv->irq_DAV, IRQ_TYPE_LEVEL_LOW);
4cd654f847693c2 Dave Penkler  2024-09-18  386  	priv->end_flag = 0;
4cd654f847693c2 Dave Penkler  2024-09-18  387  	gpiod_set_value(NRFD, 1); // ready for data
4cd654f847693c2 Dave Penkler  2024-09-18  388  	priv->r_busy = 1;
4cd654f847693c2 Dave Penkler  2024-09-18  389  	priv->phase = 100;
4cd654f847693c2 Dave Penkler  2024-09-18  390  	spin_unlock_irqrestore(&priv->rw_lock, flags);
4cd654f847693c2 Dave Penkler  2024-09-18  391  
4cd654f847693c2 Dave Penkler  2024-09-18  392  	/* wait for the interrupt routines finish their work */
4cd654f847693c2 Dave Penkler  2024-09-18  393  
4cd654f847693c2 Dave Penkler  2024-09-18  394  	retval = wait_event_interruptible(board->wait,
4cd654f847693c2 Dave Penkler  2024-09-18  395  					  (priv->end_flag || board->status & TIMO));
4cd654f847693c2 Dave Penkler  2024-09-18  396  
4cd654f847693c2 Dave Penkler  2024-09-18  397  	dbg_printk(3, "awake from wait queue: %d\n", retval);
4cd654f847693c2 Dave Penkler  2024-09-18  398  
4cd654f847693c2 Dave Penkler  2024-09-18  399  	if (retval == 0 && board->status & TIMO) {
4cd654f847693c2 Dave Penkler  2024-09-18  400  		retval = -ETIMEDOUT;
4cd654f847693c2 Dave Penkler  2024-09-18  401  		dbg_printk(1, "timeout\n");
4cd654f847693c2 Dave Penkler  2024-09-18  402  	} else if (retval) {
4cd654f847693c2 Dave Penkler  2024-09-18  403  		retval = -ERESTARTSYS;
4cd654f847693c2 Dave Penkler  2024-09-18  404  	}
4cd654f847693c2 Dave Penkler  2024-09-18  405  
4cd654f847693c2 Dave Penkler  2024-09-18  406  	DISABLE_IRQ(priv->irq_DAV);
4cd654f847693c2 Dave Penkler  2024-09-18  407  	spin_lock_irqsave(&priv->rw_lock, flags);
4cd654f847693c2 Dave Penkler  2024-09-18  408  	gpiod_set_value(NRFD, 0); // DIR_READ line state
4cd654f847693c2 Dave Penkler  2024-09-18  409  	priv->r_busy = 0;
4cd654f847693c2 Dave Penkler  2024-09-18  410  	spin_unlock_irqrestore(&priv->rw_lock, flags);
4cd654f847693c2 Dave Penkler  2024-09-18  411  
4cd654f847693c2 Dave Penkler  2024-09-18  412  read_end:
4cd654f847693c2 Dave Penkler  2024-09-18  413  	ACT_LED_OFF;
4cd654f847693c2 Dave Penkler  2024-09-18  414  	*bytes_read = priv->count;
4cd654f847693c2 Dave Penkler  2024-09-18  415  	*end = priv->end;
4cd654f847693c2 Dave Penkler  2024-09-18  416  	priv->r_busy = 0;
4cd654f847693c2 Dave Penkler  2024-09-18  417  	dbg_printk(2, "return: %d  eoi|eos: %d count: %d\n\n", retval, priv->end, priv->count);
4cd654f847693c2 Dave Penkler  2024-09-18  418  	return retval;
4cd654f847693c2 Dave Penkler  2024-09-18  419  }
4cd654f847693c2 Dave Penkler  2024-09-18  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
