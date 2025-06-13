Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315317993
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818860; cv=none; b=OrcLgsM0OOMxuJyihrXaadL7ydNcAz5i135qfZRIWna1kIqM+TyX6OklzF2PFiK+KCc6ZwTSWsB3eTJlaMC4XGAwtPw/Va1nr9pHHPQEdOgYTOt1R1U/gFezsgik/j82tQQXUuDcYuN/6PtHv7wNNX9yc0oXEvTVwszls6Otqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818860; c=relaxed/simple;
	bh=+SiE5qYo2rwclNu+ZxJIlHHqot1iDNTAW/egCzsPp6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soBZF3Ieq0MZlkstTy3JVKub4s1aHkGf72jAt7mZk2f9J6FPFL60VXUW2qmkixmi1quyMuIJhkrU0EW6MH/nIqzsWt6YAiNHmUnqnnE5Onv6hT737JY8vAA2uqmR7kFj644TfA9m+SeSX+oC0ZhqSY4ivH6TVm2WOZMB2wrRJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApeBbIq7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApeBbIq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749818859; x=1781354859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+SiE5qYo2rwclNu+ZxJIlHHqot1iDNTAW/egCzsPp6c=;
  b=ApeBbIq7i/funC43jVIrHf2vja2/gapqudFPVdtWnUXEoeNFROqbSc0o
   6T9HYPRNKHL8qMk4wPdoyN6WvCidR8gbffiEgFk0WoYHbdNeGxYH+auEr
   RQmn4/eiOAv1G8uoB2E/mVADig9JNF/bNMiR0cKNoUxV/1Ozwz69mRxMD
   jOFYAEDgrapFht7wKVnsRYzmrtN9Z27tOVxgaGL0GlzoZow6HyCtRNrH8
   WpXeH7Tsn3xyP2oxfD35FI60/eemOSRDcMjSSvtYv6xqfhJZACpopMlvY
   od0y1HNUCqHfPG3ycGzgnmo0Fw+nx8Y1VRXbwJG1TA6f6LiDzI6UCFwjC
   w==;
X-CSE-ConnectionGUID: y+9dNtQbTzaHIKE5koziFQ==
X-CSE-MsgGUID: NanEXk7ZQ4O8jbkkIXuQ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="54653894"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="54653894"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:47:38 -0700
X-CSE-ConnectionGUID: lMG2YNQHSEaYooYR+Mh+1A==
X-CSE-MsgGUID: MQntdoYaQa6nq49vHo7YFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148192013"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2025 05:47:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ3oi-000Cc6-1p;
	Fri, 13 Jun 2025 12:47:32 +0000
Date: Fri, 13 Jun 2025 20:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: Re: [PATCH v3 41/44] x86/cpu: <asm/processor.h>: Do not include
 CPUID API header
Message-ID: <202506132039.imS2Pflx-lkp@intel.com>
References: <20250612234010.572636-42-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612234010.572636-42-darwi@linutronix.de>

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-S-Darwish/x86-cpuid-Remove-transitional-asm-cpuid-h-header/20250613-075051
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250612234010.572636-42-darwi%40linutronix.de
patch subject: [PATCH v3 41/44] x86/cpu: <asm/processor.h>: Do not include CPUID API header
config: i386-randconfig-004-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132039.imS2Pflx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506132039.imS2Pflx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506132039.imS2Pflx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/longrun.c: In function 'longrun_get':
>> drivers/cpufreq/longrun.c:143:9: error: implicit declaration of function 'cpuid' [-Werror=implicit-function-declaration]
     143 |         cpuid(0x80860007, &eax, &ebx, &ecx, &edx);
         |         ^~~~~
   cc1: some warnings being treated as errors


vim +/cpuid +143 drivers/cpufreq/longrun.c

^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  135  
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  136  static unsigned int longrun_get(unsigned int cpu)
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  137  {
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  138  	u32 eax, ebx, ecx, edx;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  139  
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  140  	if (cpu)
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  141  		return 0;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  142  
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16 @143  	cpuid(0x80860007, &eax, &ebx, &ecx, &edx);
2d06d8c49afdcc arch/x86/kernel/cpu/cpufreq/longrun.c  Dominik Brodowski 2011-03-27  144  	pr_debug("cpuid eax is %u\n", eax);
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  145  
48ee923a666d4c arch/x86/kernel/cpu/cpufreq/longrun.c  Dave Jones        2009-01-17  146  	return eax * 1000;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  147  }
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longrun.c Linus Torvalds    2005-04-16  148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
