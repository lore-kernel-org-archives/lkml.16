Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4428369A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355569; cv=none; b=QZief62K272CI/25IfLE3V1M8UKOa772KkiAoq7HhWqF1+7ZkfSRlj+JMqjNrlYTbRRzbtyS7lwnqLGZgkZlB60C6an/tTFHK5KfoIq8s6VzzT3eIgkHbBAR0dGxi1cEprlLIjxxhZpeRd5Pe4raHWFz5iDTZAWlmJIVSjIncuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355569; c=relaxed/simple;
	bh=1bbCoIICaOjAgKM/FjPojrJuedc/KFAL+hSxDE+eY+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6jp2wEFUYfTwOe43TvpjWk48K/uVHEnehGPXcLCUuLFMQV7Cm7stITYpkKk/zXSNWTeQi4VyoH8Ib8QSbtcc+VkyrdQ31XIRksVvmipYorh9rbc7um9rkOkKNRlHfirvloM58izmTIP6mDi6M3HKysYDWitqmJ7Am3QDCVSnbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPZ9j5O3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPZ9j5O3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744355569; x=1775891569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1bbCoIICaOjAgKM/FjPojrJuedc/KFAL+hSxDE+eY+g=;
  b=SPZ9j5O3p6QXVjAh8fcAQ5JB/pVKye+BcbdKfxDUuMQ964eKWVt1SkOR
   CVJErh6nboVFxnAm4TU0N9O+qgCWzBPCOHgKi2SMgNox+EEvfC9sGfa+j
   Us/DR04h0cisJzUqVt7Xu2Glcu1h6Y3el/W6y4pprXlQwwTHLQ+1NSEWb
   TFxhZsT2LJM8PGH0TB+PtOVpzq/QRVq3ICV52h41hcyaQ/j4rRm2Sk4/W
   pU+/YRjDrkTHpXcWUG9jC5SpKFCWrzyBw8MKLwqGTkGWPpu0l3WHQjvi2
   FfUoiPaEkWpzcgcEAsyLk/a5HyCUC+0ixMcDMP0k6RUGOxmJOIrJCL2cD
   w==;
X-CSE-ConnectionGUID: pNTYAOmbQ5eM7AvjKt5Vow==
X-CSE-MsgGUID: ekCz3OaYQoePo222IbAXPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45913535"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45913535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 00:12:43 -0700
X-CSE-ConnectionGUID: ClesbpNgSmmban5dLkKaKw==
X-CSE-MsgGUID: 1Z44Zn4nTzCMFAuQPZKR9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129469542"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Apr 2025 00:12:39 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u38Z3-000Av4-1E;
	Fri, 11 Apr 2025 07:12:37 +0000
Date: Fri, 11 Apr 2025 15:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriele Monaco <gmonaco@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <202504111433.IwFLpkrz-lkp@intel.com>
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
config: csky-randconfig-001-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111433.IwFLpkrz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111433.IwFLpkrz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111433.IwFLpkrz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/csky/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/csky/kernel/asm-offsets.c:5:
   include/linux/timer.h: In function 'tmigr_isolated_exclude_cpumask':
>> include/linux/timer.h:196:1: warning: no return statement in function returning non-void [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         | ^~~~~~
--
   In file included from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/csky/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/csky/kernel/asm-offsets.c:5:
   include/linux/timer.h: In function 'tmigr_isolated_exclude_cpumask':
>> include/linux/timer.h:196:1: warning: no return statement in function returning non-void [-Wreturn-type]
     196 | static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
         | ^~~~~~


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
