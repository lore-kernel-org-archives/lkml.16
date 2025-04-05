Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229161DC070
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743843606; cv=none; b=fI872jclEA3MLgBM7DrXJJi4bTFHMUOwZA3Q74B5tdTDSt+gaKUjmlW9wjRJPG+ZtZbnQQZzO++VbFlIDCzS4Y0kG0l9nISk5cnCG3LGsHcR6rWGmpCaroSWQgOE5ZhuETnkE45QwUKXGp+QPJKxZpAgXvAggyFHdcQ+LnaUjkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743843606; c=relaxed/simple;
	bh=TKvKDAN4GsHZkJe3UwrKQKpPP0RTmrvgyn/tSmf0FqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYqonlFlsUhYntxSckv8X8ZWMjplh6Xw/HsCiQO5gdIAtyI//RAIp9hKLhexoNEZr3jc5syfFmCDIJhJYoqCQhpHY0HLv1FmZPNRH94M1MNlAPubdu6R+ju/ugu/4N7zyN9Mmf7H3AoP+UY38jfawolQmL3H/wmayMw/XT9G4D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YP61XgHa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YP61XgHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743843605; x=1775379605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKvKDAN4GsHZkJe3UwrKQKpPP0RTmrvgyn/tSmf0FqE=;
  b=YP61XgHaMHOTzWV6McbtIwa7f/w3MaY0pYUHxMtsCweaYNBj7kRArjPw
   YhboMVsePEBd1U3FruBx0dBPauOias+SVMKrqEXMXu15nCgeqHxP/6ECv
   NxSGV800t6igSoc6DVMFHapA5upHNxLDkAS1fE8mtrfgPA3BpjWdZoojv
   L/yZq6cat58Cci3tvKevn+tFN6kG2X/ZynpzlrPqIueaG96Mt6vqI36ba
   Q8DTfS/dQ6xuOS3O/0T3IwbhwNZ6Vsf8cGkNPOGSt+Slvs+Nv/vBrj+Z9
   xEY9Xp3iHp8FP1YgPfsOfUWu7zn2B1Dch5KL26LoTKAqVFx2dzyUi3UIK
   A==;
X-CSE-ConnectionGUID: /vlT8k9aSt2vL7NirVQ55w==
X-CSE-MsgGUID: jwxlnIBBSmKjStcGyaK20Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="48936694"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="48936694"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 02:00:04 -0700
X-CSE-ConnectionGUID: 6YacWV+JSdquAdD59VTQmw==
X-CSE-MsgGUID: gNjQeGu9Q5uT0E/Q+rjBDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="128357313"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Apr 2025 02:00:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0zNf-0001v3-1V;
	Sat, 05 Apr 2025 08:59:59 +0000
Date: Sat, 5 Apr 2025 16:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 PPC_RADIX_BROADCAST_TLBIE when selected by PPC_POWERNV
Message-ID: <202504051629.XUa1kN12-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a8662bcd2ff152bfbc751cab20f33053d74d0963
commit: 3d45a3d0d2e6b5cf47c6f0ab890f6ce762d9fd23 powerpc: Define config option for processors with broadcast TLBIE
date:   5 weeks ago
config: powerpc-kismet-CONFIG_PPC_RADIX_BROADCAST_TLBIE-CONFIG_PPC_POWERNV-0-0 (https://download.01.org/0day-ci/archive/20250405/202504051629.XUa1kN12-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250405/202504051629.XUa1kN12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051629.XUa1kN12-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE when selected by PPC_POWERNV
   WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
     Depends on [n]: PPC_RADIX_MMU [=n]
     Selected by [y]:
     - PPC_POWERNV [=y] && PPC64 [=y] && PPC_BOOK3S [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
