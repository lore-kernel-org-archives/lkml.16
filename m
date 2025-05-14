Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DA2288526
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245962; cv=none; b=XDE4rCWNJUEZddXIjREO5JXqgBGp+lty/gVzt3XbAr4TGZR0Gr9zZVJyvb23iMQT3mL9kTLdZ4W64lJ0psVxSpK31eaVYfKJyI3NZqos3nU14Ok76Qu+3B0tft3EackF15EULYRkBvgyvxW5pmnm0kU9hYFjQD6U/Sxo1CLzu3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245962; c=relaxed/simple;
	bh=GEKPumGScBWRdlK4SUgH+x7/oCYWLU3GFMKiFt58UsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUmJK3WfeA//KhUtEuFOBSoUQBVZFhrphc8WYqEwoBEDfvVVENI0ZEPcHERpzKWmWg6R4A6MV6BrR2Y9PfpvmVT3tsSOMlNdK9ipdFcmnUAqh838qVM0LJHzvPsACmiGRVTEzkLHn5v1hgwvh/owHDr+P3AbVGFFiAGTfQitSFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEhVRif9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEhVRif9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747245960; x=1778781960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GEKPumGScBWRdlK4SUgH+x7/oCYWLU3GFMKiFt58UsY=;
  b=dEhVRif9neZo01sbyUMvqCxVCX9fQ7CQptriU0rWZbRFHh2MpDeKIXKY
   nlze6hsh8OVpTEgU26z6LQQdV3KRztXhJXzB66eO9iFhNyQhpwZHvK9sN
   poPhGrgo/Gumt/JbcXbqeSmAWrBlf+LXYEABzyl/BPr12YwKyktmCYiVV
   Wg2jKiWLuFD8dtM/o8GWPw0077252aGYB4/5SkyYOoqJLZfTRvWbbyXNi
   W/f4qgfyCGj4tZJO9dxw+B1fXsmq2IA2K0vZ2S+AMi8g3oCfDVgGlbonH
   ihh9MRNWCJ09d9NhDDz5CQQz7rwyXu2KLmfbt2GdFtZOZ2Tx4mICNoKXY
   g==;
X-CSE-ConnectionGUID: ZvmYo4r0QbCLb32WbjlENA==
X-CSE-MsgGUID: Uc0fjvdvRLqcJIzDGnoDDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60494943"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="60494943"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 11:06:00 -0700
X-CSE-ConnectionGUID: y+pe5xMtTOS9NMA+ok9bAQ==
X-CSE-MsgGUID: p4WyJRwIQS2NZJvfykgOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="143002401"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2025 11:05:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFGUN-000HQl-2P;
	Wed, 14 May 2025 18:05:55 +0000
Date: Thu, 15 May 2025 02:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 1/2] genirq: Add kunit tests for depth counts
Message-ID: <202505150113.w3vVNU6s-lkp@intel.com>
References: <20250513224402.864767-2-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513224402.864767-2-briannorris@chromium.org>

Hi Brian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Norris/genirq-Add-kunit-tests-for-depth-counts/20250514-065050
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250513224402.864767-2-briannorris%40chromium.org
patch subject: [PATCH 1/2] genirq: Add kunit tests for depth counts
config: alpha-kismet-CONFIG_SMP-CONFIG_IRQ_KUNIT_TEST-0-0 (https://download.01.org/0day-ci/archive/20250515/202505150113.w3vVNU6s-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250515/202505150113.w3vVNU6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150113.w3vVNU6s-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SMP when selected by IRQ_KUNIT_TEST
   WARNING: unmet direct dependencies detected for SMP
     Depends on [n]: ALPHA_SABLE [=n] || ALPHA_RAWHIDE [=n] || ALPHA_DP264 [=n] || ALPHA_WILDFIRE [=n] || ALPHA_TITAN [=n] || ALPHA_GENERIC [=n] || ALPHA_SHARK [=n] || ALPHA_MARVEL [=n]
     Selected by [y]:
     - IRQ_KUNIT_TEST [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
