Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C724888D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027414; cv=none; b=nP7iXVEpGBcLeYPtKPXBAGqj/fOKJ0F633ycasjSSaT0Pi3SSWgb0RX9LAizdVqBAtR2hFFkJjSOy/aQ7/UKkEgjPRGnoCbews9T8KSXlykIUJ13Apd8NR48q/+FanE4PvoZ1XGEAFAwG7chn+cIQxRNL9LNIfRokym647GIJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027414; c=relaxed/simple;
	bh=rQdEHuve06/HByvBcIzeFfwJ+bNO/a8E1n7x9H/xF4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQl7INM7FOWyPyjDCO4oWzwCZy77fUW86g/A9MrEiJ6MBMuCCQGzKcj51DIznf7iCaJLDo73nX0iBwYHlsy1cWwtmY3V5nI967enyT7bhsxav4vbhMw/TGBpDrflaC2nRg49dDPGZ7ZB2BsYRvDvkD0jLKdT664orbeizl4tcm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQH5P1nh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQH5P1nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744027412; x=1775563412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rQdEHuve06/HByvBcIzeFfwJ+bNO/a8E1n7x9H/xF4Y=;
  b=BQH5P1nh5QXPiCTGMIsO0WNAs4EyNhL+nsv4erixAyPMb0YhZgQ1BI30
   z5GLwTNr6pRblwCnqWdMChpyfi2SqzqqOydird2xUV7vU/b/x1kWq/VAY
   3Kr53CzMmIulW7XqprJUAyBfXZ/f8aVpyaIJdgIhV1nSj/mpM8V+7XbIZ
   0xJor9ghfqu5bgO8eKfQ9eq3PG62VWVuasghIJWmkTVSuokMdoVyEm/tn
   FKX3JuduZJ87pWdyinuEKvQovdLH91hCEl7bXhOnJr34pKuibRSRDMvOY
   VGs/6bJglT1r8o+mESAy1oVp2IErrGs+/sWe9ih1veoRVuF8N2ahiREUZ
   g==;
X-CSE-ConnectionGUID: T/j8HxeASIOLWfTPHe0X7w==
X-CSE-MsgGUID: p9ezgJIUS+i7RPw7JkFE+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45500971"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45500971"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:03:32 -0700
X-CSE-ConnectionGUID: 4a4RBE4jTLS4IEiYA6c3bQ==
X-CSE-MsgGUID: /Pso3oEuRhKUBn4d8GjLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132075591"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Apr 2025 05:03:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1lCJ-0003NJ-35;
	Mon, 07 Apr 2025 12:03:27 +0000
Date: Mon, 7 Apr 2025 20:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: kernel/time/hrtimer.c:369:18: sparse: sparse: dereference of noderef
 expression
Message-ID: <202504071931.vOVl13tt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: 04257da0c99c9d4ff7c5bb93046482e1f7d34938 hrtimers: Make callback function pointer private
date:   2 days ago
config: i386-randconfig-r123-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071931.vOVl13tt-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071931.vOVl13tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071931.vOVl13tt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/hrtimer.c:369:18: sparse: sparse: dereference of noderef expression

vim +369 kernel/time/hrtimer.c

237fc6e7a35076f kernel/hrtimer.c Thomas Gleixner   2008-04-30  366  
997772884036e6e kernel/hrtimer.c Stanislaw Gruszka 2011-03-07  367  static void *hrtimer_debug_hint(void *addr)
997772884036e6e kernel/hrtimer.c Stanislaw Gruszka 2011-03-07  368  {
997772884036e6e kernel/hrtimer.c Stanislaw Gruszka 2011-03-07 @369  	return ((struct hrtimer *) addr)->function;
997772884036e6e kernel/hrtimer.c Stanislaw Gruszka 2011-03-07  370  }
997772884036e6e kernel/hrtimer.c Stanislaw Gruszka 2011-03-07  371  

:::::: The code at line 369 was first introduced by commit
:::::: 997772884036e6e121de39322179989154437d9f debugobjects: Add hint for better object identification

:::::: TO: Stanislaw Gruszka <sgruszka@redhat.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
