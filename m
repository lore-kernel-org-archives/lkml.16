Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71481FFC59
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511290; cv=none; b=eyXZK9/CtsQusP2hcm/8ITUn0bYEEE4/0uELGcxAB6IsaC1QX0DDYR9TRJAYB7L4HaUdRGq+DiTmq2oCBwM16EtZevUT2vAcYlDRJnjsi6793qV1iQ5Td1x76Avm2ihrdcwnuVGTTJCN4VAN60cHGnZHYHEWqmZ8khdl03hj5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511290; c=relaxed/simple;
	bh=kFmQptJ2um6gQpVBecE2eyF0GAIxnUceibqL3Hs0n3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bpRJeD2iH7k+yOmKmSkZG3DO3P7m3/nghmntCB3DG/uGRk9yhyh2mf4tCGqf9/0Ef+TWmQyMNmJ2riZolGm3u15TTe+eaBOdBSY6IwVpWcL5ZpyX0v334J7R/JvTgrqstGGYVxkq0ayG5kUxTlB0Ls2Xh1AHkGr0oEQ7YP6H3CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoMWjCWa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoMWjCWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751511289; x=1783047289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFmQptJ2um6gQpVBecE2eyF0GAIxnUceibqL3Hs0n3Y=;
  b=HoMWjCWa9iUCxO4UOlJiQyah8k1pQn2+aWGacHN+IASZInIenRR7t0Dv
   hHhyHVKug+QSfZLQ4SXbA9IFAeMSYIR5JdxZDiIqPooXKXVhS1so49ZFY
   7ogyaxvQYzzsGzl3Fgb3R/BJG9opab63i+59JY5RQA4H6BBoMOvCPSOJ0
   qbow2jZd5RJFeojscB3qmQ0B406zC4I/lKimQYMyWDQobfbLS+//ZYSMV
   lOAknXC9S54BuB8/XrSDdzoXTjjYRPNWHTQy9G/f12oglaq6HoTRr5MO0
   qAO8iO1HnN9MN/jculoJocZ8o7IaI93XR4+RL0Zfwe0u4XOjBBXCy8GhD
   Q==;
X-CSE-ConnectionGUID: P0oV/M/kSSKGD0idLFdArw==
X-CSE-MsgGUID: cMv1FqLNTiCe5DolpnNSmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71259634"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="71259634"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:54:19 -0700
X-CSE-ConnectionGUID: RsaEUOVmTZSxPm2nFYUumg==
X-CSE-MsgGUID: 3Zmldh7fSJyZRYZlJFDcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154990385"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jul 2025 19:54:17 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXA5W-0000OL-2e;
	Thu, 03 Jul 2025 02:54:14 +0000
Date: Thu, 3 Jul 2025 04:53:15 +0200
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: fs/fat/dir.o: warning: objtool: fat_ioctl_filldir+0x7dd: stack state
 mismatch: cfa1=4+168 cfa2=4+160
Message-ID: <202507030459.nFRTDqOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4911fb0b060899e4eebca0151eb56deb86921ec
commit: 496d2d23886436f7c651bf4c14950eb002815c61 mm: security: Check early if HARDENED_USERCOPY is enabled
date:   4 months ago
config: x86_64-buildonly-randconfig-2004-20250703 (https://download.01.org/0day-ci/archive/20250703/202507030459.nFRTDqOT-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030459.nFRTDqOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030459.nFRTDqOT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fat/dir.o: warning: objtool: fat_ioctl_filldir+0x7dd: stack state mismatch: cfa1=4+168 cfa2=4+160

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
