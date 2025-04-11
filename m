Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6279F1C8639
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363677; cv=none; b=hNFAC9FGgr2MsRw2vf34Q5+x88ckT+Z8DXAA6sTwZniPQ5WsgrmZ1etx4VQG9FPJj1uDAxEs+Ak1Vn+U7RllYMlRt9BKtCKeUfOZWSl6hxpMXljcs8DTdW0ANfreKZm0YpCuhbuDWY4mbRm37kNvlGnssXPteF76raGRt9D5hDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363677; c=relaxed/simple;
	bh=UiQBPl/K/qgihIAKV8+hDqx22u4OxQn/u+bdxrbMV14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBaDOcg79xFtzCZ1UKH9Q+wbmFajL/6Gc5JKy01kdAA0R0ZEX+soV8HohJL1wRBgOpQjgQTwe63kytHnj+GsAqGaHpeiLX/IVXpu6w2ZiVy4/Gaf9h4EGvw8wzRqfE/FItP2ce5EqHlE06LeEHuaBcwgjiZXd5YHD8YtSK7nfcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0FkkPnP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0FkkPnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744363676; x=1775899676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UiQBPl/K/qgihIAKV8+hDqx22u4OxQn/u+bdxrbMV14=;
  b=B0FkkPnPE1SdBSPrYSYd4RT0owipgEhoBJa8yyU+Re+gyawGBdscY8aI
   GHIiujenMdD4ScZBYyifQJKFwv59IWCZEWXFvUflwhbMibh15sLngd07O
   mY0GrXNkzVVOjVxEtZXhN+kFw/Q2kebnFS6mLbPr9zSxeeV+Z+B9lYewZ
   BWgXk9xqwi4g/807YsVPcM72bWzAVl8cYrnqGH61y4L3aptKs2cr+df/J
   rxxPrh2ZdnnYS2iIX93jF86vDnJqjJMvcGa8fm8GsW55YDjW3pLK0cwjq
   x40iDZxY6j/GdD2XS+AfU77PzPjNQZ1gnx4ASAASGNxzp4k1DF1zHf1zJ
   w==;
X-CSE-ConnectionGUID: CRrYbPTxQdKE5LTdtLZ3Sw==
X-CSE-MsgGUID: cf9URXITT1eK45uY4vq/iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45814633"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45814633"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:27:54 -0700
X-CSE-ConnectionGUID: 8cW71r+tRgKR66Frnxa7tw==
X-CSE-MsgGUID: p32CSjJKTJGhD3PH1/xmkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="160118272"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Apr 2025 02:27:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Aft-000B02-0n;
	Fri, 11 Apr 2025 09:27:49 +0000
Date: Fri, 11 Apr 2025 17:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gabriele Monaco <gmonaco@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <202504111714.VH8TJ92G-lkp@intel.com>
References: <20250410065446.57304-2-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410065446.57304-2-gmonaco@redhat.com>

Hi Gabriele,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3b07108ada81a8ebcebf1fe61367b4e436c895bd]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/timers-Exclude-isolated-cpus-from-timer-migation/20250410-145629
base:   3b07108ada81a8ebcebf1fe61367b4e436c895bd
patch link:    https://lore.kernel.org/r/20250410065446.57304-2-gmonaco%40redhat.com
patch subject: [PATCH] timers: Exclude isolated cpus from timer migation
config: hexagon-randconfig-002-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111714.VH8TJ92G-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111714.VH8TJ92G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111714.VH8TJ92G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   1 warning generated.
--
   In file included from drivers/spi/spi-pic32-sqi.c:9:
   In file included from include/linux/clk.h:14:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   drivers/spi/spi-pic32-sqi.c:673:34: warning: unused variable 'pic32_sqi_of_ids' [-Wunused-const-variable]
     673 | static const struct of_device_id pic32_sqi_of_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/spi/spi-orion.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:19:
   In file included from include/linux/topology.h:33:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   drivers/spi/spi-orion.c:614:34: warning: unused variable 'orion_spi_of_match_table' [-Wunused-const-variable]
     614 | static const struct of_device_id orion_spi_of_match_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/spi/spi-pic32.c:9:
   In file included from include/linux/clk.h:14:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   drivers/spi/spi-pic32.c:850:34: warning: unused variable 'pic32_spi_of_match' [-Wunused-const-variable]
     850 | static const struct of_device_id pic32_spi_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/spi/spi-armada-3700.c:11:
   In file included from include/linux/clk.h:14:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   drivers/spi/spi-armada-3700.c:806:34: warning: unused variable 'a3700_spi_dt_ids' [-Wunused-const-variable]
     806 | static const struct of_device_id a3700_spi_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/spi/spi-rockchip.c:7:
   In file included from include/linux/clk.h:14:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   drivers/spi/spi-rockchip.c:1024:34: warning: unused variable 'rockchip_spi_dt_match' [-Wunused-const-variable]
    1024 | static const struct of_device_id rockchip_spi_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/spi/spi-s3c64xx.c:8:
   In file included from include/linux/clk.h:14:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   drivers/spi/spi-s3c64xx.c:1644:34: warning: unused variable 's3c64xx_spi_dt_match' [-Wunused-const-variable]
    1644 | static const struct of_device_id s3c64xx_spi_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/spi/spi-meson-spifc.c:8:
   In file included from include/linux/clk.h:14:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   drivers/spi/spi-meson-spifc.c:423:34: warning: unused variable 'meson_spifc_dt_match' [-Wunused-const-variable]
     423 | static const struct of_device_id meson_spifc_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
>> include/linux/timer.h:196:83: warning: non-void function does not return a value [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         |                                                                                   ^
   1 warning generated.


vim +196 include/linux/timer.h

   192	
   193	#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
   194	extern int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask);
   195	#else
 > 196	static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
   197	#endif
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
