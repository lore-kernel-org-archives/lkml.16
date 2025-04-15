Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F5F190068
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699628; cv=none; b=PmqTTViYp8mO6oznjGsU+kwhtvAnI04P2iDPwf5sCjE/ekUlNYrVALrujWaaJ5YwiwGkImpXK7VSWyP2KradmvFGU9JscAVOZvVw8+ydOVOmrC7AgWamFvssOJvBpmn8auEi3b5mUFQUmi1gliYjQff2Vy4Llfegt1mcS4nmuYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699628; c=relaxed/simple;
	bh=6tTR64EQPvbi2DJSbe3CfVvBjbA8At40asFOpUjhmt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rEqrCKlOfj2VOVShME8WMGY54PKrVhFCtHxpF/onb+01Ixcs9GkdcU2GBcNFnGaDYq4xcN6DFGQ4H8qYBwhLhTNdF5xfjGzBQVOBDNCQ3OYEC5cAZimTDId5a7eT3RBFZyNkI8dOwoTy9Ua3RlyF9P9aqWT6SUFR6TLcgUSdSPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLHcPJfn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLHcPJfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744699626; x=1776235626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6tTR64EQPvbi2DJSbe3CfVvBjbA8At40asFOpUjhmt8=;
  b=bLHcPJfnYEnwoitc32Z6pD0b9Y/fVlRbRKM/I99tYUImkdHax2WLrhGv
   lPeXf3xSYij0pUvpPR2oMMebYVJq283AyYDTyZOGPsbrY52r151s91k9p
   JxRgAJ5minPV0IQdhVIIcvo3e2LFcZ0bU/eikWk8LhAOOgH1JO5DoRaE0
   N6D+8B1Oru+UaeB+0WVdW5Eqom1EJiAHTTqzkgrl+jXV5HYRYGx6qEXTb
   ppzwA1wHNQaCUwe4Geo/tHsf/N/lD4Hfe5BGz4mIof8FSs9O9ncmaIidp
   PVrmkGh/T0MdwP7HLqhAPAYgeM5ZAmLk+gzi5q7jPTu8ynBs4BWKX9oZe
   A==;
X-CSE-ConnectionGUID: p9fnp7MISFOodLz/ciQ1Sg==
X-CSE-MsgGUID: uN8kA8joSO+/qMOTFiPTFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56370031"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="56370031"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 23:47:06 -0700
X-CSE-ConnectionGUID: nKZzEvZVRXi+H5mtiLr9Dg==
X-CSE-MsgGUID: hlQckR5uT2OvdD8USO7m3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130914300"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2025 23:47:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4a4U-000FIm-2X;
	Tue, 15 Apr 2025 06:47:02 +0000
Date: Tue, 15 Apr 2025 14:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x13e: relocation to
 !ENDBR: __cfi_machine_kexec_prepare+0x4
Message-ID: <202504151432.cBR45Uyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   834a4a689699090a406d1662b03affa8b155d025
commit: 7582b7be16d0ba90e3dbd9575a730cabd9eb852a kprobes: remove dependency on CONFIG_MODULES
date:   11 months ago
config: x86_64-buildonly-randconfig-005-20250415 (https://download.01.org/0day-ci/archive/20250415/202504151432.cBR45Uyk-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504151432.cBR45Uyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504151432.cBR45Uyk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ___bpf_prog_run+0x1be: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x13e: relocation to !ENDBR: __cfi_machine_kexec_prepare+0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
