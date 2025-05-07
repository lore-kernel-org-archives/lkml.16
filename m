Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590A20FAA9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612250; cv=none; b=maGl4dMObHqqaMmrvAnzfS9LyUJKol0NnZWdHCtG5/GsU3YQIuslj1uNv5AOFM0Ae2I/xvkxagI7eIyF5ieMTiykZ4YzMRx3m7h7/clP7tN+lL0HN8v+vcEBj61WngRDDdmNWxr7nukxkhNDsGoCyhkpTd9LRrZRmW/eyPsKtzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612250; c=relaxed/simple;
	bh=bCOjuFO/OeJWl7EfL/BAocHP1BtkXZ438OOIHujOMIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0ApN/J85+Saw6zP0XxwU+K+hUcJdZ/LnIYXu4ltur9rNcrgx5gpZG4XoFW3/cEbykNVjKKsHx4PqgX9Mpn/GhlzWWn8goBlaCqYDhxfLuQdg0EkZMcV4LmZFMjHaVIyQA3emKMaDRX56qKiyL3P4qE55fubaeQ5hrhJ9cUTsdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIlxdgyR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIlxdgyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612249; x=1778148249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bCOjuFO/OeJWl7EfL/BAocHP1BtkXZ438OOIHujOMIY=;
  b=cIlxdgyRoZsi4n8MY/sbK0cOEK950hbeg9bbhJeGSD7MpuRUAwl7qAjZ
   xDZ+PqOTRFlm4aV853VxKPLA4ozmx5shinoJGcC+Yajj11GP63ZzTyWzO
   VO+L/DHAlF8UktvCINyussMge73iBcNvvTwe5N5KKwOGrGF8Mu5+yNlKR
   hmHaCoCwHPhPQ4mXQil5Lp1os3UNk2PmuwhhjNq/gqx73luPUJMX91cRI
   VStVA/AJmr/HZDKnbvtAyLkDHZ15LyBXJBcACN2iUGW87QqIxUrtKxEIP
   PaBAZPVWCCpJAKUE0oQfipaSPE4WguXgqwMDrUPY9hjSerMdCuIpREf74
   Q==;
X-CSE-ConnectionGUID: YaivdwxhREGi3VwPDE38tg==
X-CSE-MsgGUID: jzmXIop5R8uiJpBerZ9adg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52147985"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52147985"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:04:09 -0700
X-CSE-ConnectionGUID: 9ObRoTSVTNetRpwNKzdPuQ==
X-CSE-MsgGUID: D5EB3DOuQVSxLFoBgFSj0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136841519"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2025 03:04:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbdC-0007Yl-1T;
	Wed, 07 May 2025 10:04:02 +0000
Date: Wed, 7 May 2025 18:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Dhaval Giani (AMD)" <dhaval@gianis.ca>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dhaval Giani <dhaval.giani@amd.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Dhaval Giani (AMD)" <dhaval@gianis.ca>
Subject: Re: [PATCH 1/3] sched/fair: Introduce a new debugfs directory for
 EEVDF tests
Message-ID: <202505071739.GJbmEQJp-lkp@intel.com>
References: <20250422-b4-eevdf-tests-v1-post-v1-1-35d158254c72@gianis.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-b4-eevdf-tests-v1-post-v1-1-35d158254c72@gianis.ca>

Hi Dhaval,

kernel test robot noticed the following build errors:

[auto build test ERROR on c70fc32f44431bb30f9025ce753ba8be25acbba3]

url:    https://github.com/intel-lab-lkp/linux/commits/Dhaval-Giani-AMD/sched-fair-Introduce-a-new-debugfs-directory-for-EEVDF-tests/20250423-082221
base:   c70fc32f44431bb30f9025ce753ba8be25acbba3
patch link:    https://lore.kernel.org/r/20250422-b4-eevdf-tests-v1-post-v1-1-35d158254c72%40gianis.ca
patch subject: [PATCH 1/3] sched/fair: Introduce a new debugfs directory for EEVDF tests
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250507/202505071739.GJbmEQJp-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071739.GJbmEQJp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071739.GJbmEQJp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:71:
>> kernel/sched/debug.c:539:2: error: call to undeclared function 'debugfs_eevdf_testing_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     539 |         debugfs_eevdf_testing_init(debugfs_sched);
         |         ^
   1 error generated.


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
