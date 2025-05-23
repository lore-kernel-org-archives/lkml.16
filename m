Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955729A9E1
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026897; cv=none; b=AEKS2oDwwqIqgBiIYLYdF3QuHcufJLAGFSL9iq3Z7X1oS+kycEbcBjTfbg+Mx4RQcMOapHao6ykmCqneaeE42G4gmwej+j8OnUg/EX0sClfWN17mPxyhL3kW6cxSvH2y6Up0hKWIC/wmh2PjGF7ALCxM298uan6Iay7dG4sxha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026897; c=relaxed/simple;
	bh=v6wuUWJ+W348xqte7tCyyZAdylCLnHPtZVPokniv7RA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vph3qzgZh3eBCY27oIi7SKXWz16Uk7vf8rp/maolLfat364Y4hIBrjjIaZJEl7tgjc3w4XEaA3vhbkBABmnIakbJMVk+cvXsyAbN+QveHLbh9aZV23QdltTnp+rnK6smYJk4UvLARxiXDGXPrI2OGOktmlfLCec0e1atBsDf1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QcRX6MsW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QcRX6MsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748026897; x=1779562897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6wuUWJ+W348xqte7tCyyZAdylCLnHPtZVPokniv7RA=;
  b=QcRX6MsWnyun2oacE4wvi5VkmatrNO1osVe4WWI7Vx53iv7xGRB8+R3U
   G7KMZFGGrz/DU/O5J+8GNSFAAkfScsgYQhc5WXiEvAwzKptZqPUlVjUlB
   y2rx7L4d6TZivxR2jltu2LYaRuVkWs9xxm7cOQPcW/Tko9p3/wFDuTiQk
   CQUSBW9Q/bXwMcLnos0V0sQGD3M3Atyt8/n/UVw1QhJVsAyqBMgT4cIeA
   37yGJam5EnGcRNRpsgJZaA6SIMhBE9EJFGOLX8DL3whGL35TKYJ8Wl7Iy
   YIhl6Sh+PojsF51UpuPMF31H0uBicHehvBhGBfywAW28heVFZepBcGZHG
   g==;
X-CSE-ConnectionGUID: igcw06CzQ5CZiSeK8Luj8A==
X-CSE-MsgGUID: t3tX0TzeQhGqG76hvg62Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50146261"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="50146261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 12:01:35 -0700
X-CSE-ConnectionGUID: vOBYePCRQEG5+oZNnfEVfw==
X-CSE-MsgGUID: TMzonataQoiRMPut+0zC3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="164493992"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 May 2025 12:01:33 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIXe7-0001Yk-1o;
	Fri, 23 May 2025 19:01:31 +0000
Date: Sat, 24 May 2025 03:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX
 permissions
Message-ID: <202505240339.KSGJmZ2d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7586ac7c340c3672f116052c1d150f134810965b
commit: b1a9a5e04767e2a78783e19c9e55c25812ceccc3 kbuild: merge temporary vmlinux for BTF and kallsyms
date:   10 months ago
config: um-randconfig-2006-20250515 (https://download.01.org/0day-ci/archive/20250524/202505240339.KSGJmZ2d-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240339.KSGJmZ2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240339.KSGJmZ2d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>> /usr/bin/ld: warning: .tmp_vmlinux2 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
