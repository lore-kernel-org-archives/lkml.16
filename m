Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F863F9FB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 21:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751318049; cv=none; b=m1IBH+E8UnmbMhGwl+uBHBMQ8laGH73FZZA2TC1zYoIRHrkn0THteZz2qRzhudJVGdOg72rlZM84aCuhNsivl4woNttGP4C4aeW2btWxoJuP59rgeYe4K71XqtYTppggKhb+zy+I2QW022by7fMyHkXAwDQASb7nuK4emUrdwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751318049; c=relaxed/simple;
	bh=Oem9gVaCMugCQKw5c3QDMFahemyBDeKiILu5oDJgMfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u//6Ji39fr31tCwkwZZgKNvrddURDZXgzMM+g/dy0qmRLb5tfHx68wgSUFbBwIUW0ZPYinr5u/rcIXivgRMWvVurf1HrpNl+QnRlBnwQ9xUMSPYuF9IMB/q+TCGdVI+LYpXGmSM/w409dRiZwoN63hdBRJ3O7ayZ+UsZtalaFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlVbsGjb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlVbsGjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751318047; x=1782854047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oem9gVaCMugCQKw5c3QDMFahemyBDeKiILu5oDJgMfY=;
  b=JlVbsGjb8z2PRQoyUv9Z2iSCTlGM8dwNgbiN6by4VCJtS3JPCctjvG25
   FP4MgtjG6b8V68ie5WIFMFYE6uIYpUSKJmR9p/qwUUvgKTsk08+LFLsFi
   ruLbhj0KLJKRFRTjEqtipccYbaxm0yZNCy8CsW5SuQuh2d53uZkbPnbge
   HKNU+TqNjEkpbStupx94rsR0k/GJDye2KOAGNH9nAzf1uaWk8YYIRpKO5
   u0vuoJrbzhx14nEYL6Yj7cnVLS8QuckpU3gFTwxhyaOa2LDu6VeeSlVKa
   dOZM5vzYT5q3xtOfovDsvO4lfLWtGMhH22uJiQAjM2/w12jn1WMyKDcxy
   g==;
X-CSE-ConnectionGUID: ZyVrEg9lS0KsyE59WXJxVg==
X-CSE-MsgGUID: +4sV2OV7S4iLxK3sYFMlIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="56178301"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="56178301"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:14:06 -0700
X-CSE-ConnectionGUID: HNRVKyphSqym/21dQ/hOTg==
X-CSE-MsgGUID: bxf7WQ6WQ3WemoV6BjhQaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="157842977"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jun 2025 14:14:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWLpC-000ZN4-1n;
	Mon, 30 Jun 2025 21:14:02 +0000
Date: Tue, 1 Jul 2025 05:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: atags_to_fdt.c:undefined reference to `stackleak_track_stack'
Message-ID: <202507010513.Wna5VLE6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jinjie,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
commit: 2335c9cb831faba1a4efcc612886073b6f175fe4 ARM: 9407/1: Add support for STACKLEAK gcc plugin
date:   12 months ago
config: arm-randconfig-002-20250701 (https://download.01.org/0day-ci/archive/20250701/202507010513.Wna5VLE6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010513.Wna5VLE6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010513.Wna5VLE6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arm-linux-gnueabi-ld: DWARF error: could not find abbrev number 13
   arch/arm/boot/compressed/atags_to_fdt.o: in function `merge_fdt_bootargs':
>> atags_to_fdt.c:(.text+0x9c): undefined reference to `stackleak_track_stack'
   arm-linux-gnueabi-ld: arch/arm/boot/compressed/atags_to_fdt.o: in function `atags_to_fdt':
   atags_to_fdt.c:(.text+0x158): undefined reference to `stackleak_track_stack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
