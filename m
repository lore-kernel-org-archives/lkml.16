Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230681BEF71
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173379; cv=none; b=T3q2+0Xgz5upChSVKKI9fXjbIWF9+FnqXdNOWfF8ejDhQTPFKpNdPIThtLflWbip0IMFolLtSRJrXYCH5E3GkwU7KQJFKzj4oOAlzqoOdMWzLPGj/j4dC4dffCyVc8LVZhtudm9NeNQqGhQi3DgdfvfXI2Btku+4mc3eETFwMSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173379; c=relaxed/simple;
	bh=sLIPyy98uoLJ4WtcHzmV+5vbfuO7ODilL+6FT6xYmxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rX1BdQezvzj8v7Gts7y3mNixO64B+zKq7I6WXyGuWuvSeo5POkgknJyJHQ2uP2PU7VXb7A3izyAtfDDScl3RAPnLUhybjQLdDOxxawMSArz6/YVHmKJqww1fwPOxT7g1XrAva9qJ3w0c4wQ6va49XgMPzQ7VA9MQsPls1oyUPes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgCXfDBa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgCXfDBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743173378; x=1774709378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLIPyy98uoLJ4WtcHzmV+5vbfuO7ODilL+6FT6xYmxM=;
  b=jgCXfDBa9sAM0qJ/h33wITlGnt7jhCR5N0VWuPkdfiLJg4GH3ZWoEzUd
   zk4GQwDoDxqJf4/TWK4/EemKbSxLxYUPEG0QqQ6CYlYYP2vRc9KLISCdk
   UJu2JXY/wsQ9rG8RyFv6LBiU9P6Px2l6gNXzbQuHFNmgrAnHslYnIxU4P
   kG/5jR+5qn1sKHV+W2QSXiuV1lxdpuGnME3TPhVHB/EHKaBLA8NZ8uFB2
   XBB9eCOVFf52s5Fb20H0z2b6vn0GgxK7O9aBRgUKS4AE8tPKstpwxXYiE
   YVtJc6VgdQ0PjGLVvl/ZBc3INwoa2uzWEzd/pDE3XQm/a4VguoO8Dn/tG
   g==;
X-CSE-ConnectionGUID: zEXVdXBaTcO1/HPBnVRQGw==
X-CSE-MsgGUID: I+wtvtp0SG6HYtfjOZRUQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44257208"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44257208"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:49:37 -0700
X-CSE-ConnectionGUID: KRv1b+fPQ4yf6rUkGR6qjg==
X-CSE-MsgGUID: X6b86eSNSb+Od6Ldg22EGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="130676604"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Mar 2025 07:49:37 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyB1Z-0007VM-2V;
	Fri, 28 Mar 2025 14:49:33 +0000
Date: Fri, 28 Mar 2025 22:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: [tip:objtool/urgent 9/23] vmlinux.o: warning: objtool:
 cdns_mrvl_xspi_setup_clock: unexpected end of section
 .text.cdns_mrvl_xspi_setup_clock
Message-ID: <202503282236.UhfRsF3B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
head:   1c9d28fdf70d4ae3e8dfeadee982461403c6bb50
commit: c5995abe15476798b2e2f0163a33404c41aafc8f [9/23] objtool: Improve error handling
config: x86_64-randconfig-161-20250327 (https://download.01.org/0day-ci/archive/20250328/202503282236.UhfRsF3B-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282236.UhfRsF3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503282236.UhfRsF3B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cdns_mrvl_xspi_setup_clock: unexpected end of section .text.cdns_mrvl_xspi_setup_clock
>> vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
