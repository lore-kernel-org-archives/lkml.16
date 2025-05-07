Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A261ADC7E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601040; cv=none; b=q2k6tFXjdpfeEpLw2VT4UTo8cGqasT19u3ttswIYbOO/Xm+by5wNWdy/tdjm/94EbQ+qihcmL32/mAa6IOjc7sbQ5yJMajEhIieKRz9mxg/ZK/0B2pk13z5kN7QiplyKrrpafQYDA+rGt5f2oYAq8TT5mENNyG8eOp6pGoB9mXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601040; c=relaxed/simple;
	bh=r55W1+Azblwt/qcrr3OwtnoxqrfaQjMZNR5YExu+2sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLDdixjCNgrU8kPCqKieZIvHY+hOqZwQGiB2GZjY6jeGnndLDKOEXWVUvkgx6kAHk+Oqw5gIge/uGF08OMZlf0vrVdzhFepOYdyjIpvmvyX9KIW1e33t4IqwEt9ztX/YQihlswfUpVyTU/RdswG5i/I4stDaAip9OoL95FMpt2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MD+NQ9Of; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MD+NQ9Of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746601039; x=1778137039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r55W1+Azblwt/qcrr3OwtnoxqrfaQjMZNR5YExu+2sg=;
  b=MD+NQ9Ofv2t/gOH3Pt8fHeA5epo5hcqPB5OU4Xiu2HiM5DocHKSm5FSj
   zllBbDK0IcOtNgx11PhouL9ieJT6Dlck/hiPAE8TJTvYwmx1IArD8h1yz
   7E7lpG65jy0dV+K9f3yTMLBy8nNZtyTmsNKuLo1hcd5NMA5Ox/1NjaMpq
   iRM4noxZJXDxSKU4Eq2VYOsWlaPj16Dm8k6/uTrnRV4LUod/hghLBX/KZ
   7DcTtXkYYUFM1o/xde464vAE+9ajOBdxZDxwaHmNXOOy8Ix9CTbcQeQWo
   rnmPGHCra7PB/SC3/9XUFWDL3frORaBZvwZizcyPvppe+Mkpjq8bWgWAw
   w==;
X-CSE-ConnectionGUID: WvsZF4LCTGiUnJfP8PsZjA==
X-CSE-MsgGUID: DWxPuiI8QcWp0AE///LUjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48429604"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48429604"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:57:19 -0700
X-CSE-ConnectionGUID: 73rnZ4X8SOWfAmRN3WWJBQ==
X-CSE-MsgGUID: JguopFDRQXm9q2aSZCS0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="139916698"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2025 23:57:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYiR-0007Ez-0K;
	Wed, 07 May 2025 06:57:15 +0000
Date: Wed, 7 May 2025 14:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dhaval Giani <dhaval.giani@amd.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Dhaval Giani (AMD)" <dhaval@gianis.ca>
Subject: Re: [PATCH 1/3] sched/fair: Introduce a new debugfs directory for
 EEVDF tests
Message-ID: <202505071441.9cwPFBsc-lkp@intel.com>
References: <20250422-b4-eevdf-tests-v1-post-v1-1-5b174f040f55@gianis.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-b4-eevdf-tests-v1-post-v1-1-5b174f040f55@gianis.ca>

Hi Dhaval,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.15-rc5 next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dhaval-Giani-AMD/sched-fair-Add-a-test-to-test-that-a-task-selected-to-run-has-positive-lag/20250423-081648
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250422-b4-eevdf-tests-v1-post-v1-1-5b174f040f55%40gianis.ca
patch subject: [PATCH 1/3] sched/fair: Introduce a new debugfs directory for EEVDF tests
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20250507/202505071441.9cwPFBsc-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071441.9cwPFBsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071441.9cwPFBsc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:71:
   kernel/sched/debug.c: In function 'sched_init_debug':
>> kernel/sched/debug.c:539:9: error: implicit declaration of function 'debugfs_eevdf_testing_init' [-Wimplicit-function-declaration]
     539 |         debugfs_eevdf_testing_init(debugfs_sched);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/debugfs_eevdf_testing_init +539 kernel/sched/debug.c

   534	
   535		debugfs_create_file("debug", 0444, debugfs_sched, NULL, &sched_debug_fops);
   536	
   537		debugfs_fair_server_init();
   538	
 > 539		debugfs_eevdf_testing_init(debugfs_sched);
   540	
   541		return 0;
   542	}
   543	late_initcall(sched_init_debug);
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
