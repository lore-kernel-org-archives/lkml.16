Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF361DE3D2
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739109416; cv=none; b=RytRtVjvwuKZceRJfJS0PRSH05KpP5XAaLWWNu9xzgEaobjvSyHuKoNxbrgD9ncrNh6Gawxc270DgPLEOfZdAaCWktclAGlfD6muRYIPtgM5tAS1KUi7kMK2FEHTbMgmqV1y1lU8RESWZkjO6FFtS78G1RWzitHsNnKiJgxLvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739109416; c=relaxed/simple;
	bh=T3dvdEJKtegPtpiJchkTYBuDLXqLmV3QJgfeNnChzz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdbMdkxXGnt1W7UQKceYCDRiyX0GtxOGrifUUp6Nijz+kdJqcGKo7bDWUlBg1bsLlBIJgdcjDR50VF1j8i53JdeA+apGahAz4vHnosqJKaysQFUFAu8smlllWFRHQocemB1ekchrJBoTQu6wze9+QVnKWHSAQN/RqFlBkU1OvGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8xZJtwe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8xZJtwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739109415; x=1770645415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3dvdEJKtegPtpiJchkTYBuDLXqLmV3QJgfeNnChzz8=;
  b=n8xZJtwec0geZf6XlHvui01oWK1HDByrYZhPlp1AW/TXIGKTs2lQHpe/
   GpMWO/NTH2CFOrL7ETebfsXn9SSQEFd2TjySj0JZ7H6NIVhOhBd1vRFLr
   mBLuHfiLJhfCHU9mq2eD/gF/VSjiQti5ijEZC+IR9kBsahtFsKW0KOgnj
   AbihwLuk4reBMbzgL8AKXKEcNYGGUWkd6VshhiYvd3RrLqQTTKpmDw/xh
   VIO+C20NLOga3xUBuY0bHvE/6uOzh32K7f7sUo04NIxBRHyqOEkBlmZfB
   m5CbvJ0YowWdkNCm51J2S8+4/fq+6yXA8O9Ag9yCnxafzbzIjuKJGZHJU
   w==;
X-CSE-ConnectionGUID: fvS+ygAsQXW3NiVb+p0xWg==
X-CSE-MsgGUID: 9KKQf+/8Q76yZINYHX5IHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39960041"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39960041"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 05:56:54 -0800
X-CSE-ConnectionGUID: cN5WI4zWQjKqNjFFvsPBTQ==
X-CSE-MsgGUID: kBCqIGCiSx+h/fc1DGz68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="112588510"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Feb 2025 05:56:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th7nl-0011X3-31;
	Sun, 09 Feb 2025 13:56:49 +0000
Date: Sun, 9 Feb 2025 21:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Wende Tan <twd2.me@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: ld.lld: error: vmlinux.o:(.debug_frame+0x2b7884): relocation
 R_RISCV_SET32 out of range: 2158664622 is not in
Message-ID: <202502092134.1ptPMAu1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9946eaf552b194bb352c2945b54ff98c8193b3f1
commit: 021d23428bdbae032294e8f4a29cb53cb50ae71c RISC-V: build: Allow LTO to be selected
date:   1 year, 1 month ago
config: riscv-randconfig-r133-20250208 (https://download.01.org/0day-ci/archive/20250209/202502092134.1ptPMAu1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502092134.1ptPMAu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502092134.1ptPMAu1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.42) is being placed in '.bss..L_MergedGlobals.42'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.23) is being placed in '.bss..L_MergedGlobals.23'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.4) is being placed in '.bss..L_MergedGlobals.4'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.49) is being placed in '.bss..L_MergedGlobals.49'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.39) is being placed in '.bss..L_MergedGlobals.39'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.16) is being placed in '.bss..L_MergedGlobals.16'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.15) is being placed in '.bss..L_MergedGlobals.15'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.40) is being placed in '.bss..L_MergedGlobals.40'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.25) is being placed in '.bss..L_MergedGlobals.25'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.51) is being placed in '.bss..L_MergedGlobals.51'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.72) is being placed in '.bss..L_MergedGlobals.72'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.38) is being placed in '.bss..L_MergedGlobals.38'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.47) is being placed in '.bss..L_MergedGlobals.47'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.20) is being placed in '.bss..L_MergedGlobals.20'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.26) is being placed in '.bss..L_MergedGlobals.26'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.18) is being placed in '.bss..L_MergedGlobals.18'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.113) is being placed in '.bss..L_MergedGlobals.113'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.45) is being placed in '.bss..L_MergedGlobals.45'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.34) is being placed in '.bss..L_MergedGlobals.34'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.55) is being placed in '.bss..L_MergedGlobals.55'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.30) is being placed in '.bss..L_MergedGlobals.30'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.81) is being placed in '.bss..L_MergedGlobals.81'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.12) is being placed in '.bss..L_MergedGlobals.12'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.24) is being placed in '.bss..L_MergedGlobals.24'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.32) is being placed in '.bss..L_MergedGlobals.32'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.52) is being placed in '.bss..L_MergedGlobals.52'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.41) is being placed in '.bss..L_MergedGlobals.41'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.46) is being placed in '.bss..L_MergedGlobals.46'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.10) is being placed in '.bss..L_MergedGlobals.10'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.22) is being placed in '.bss..L_MergedGlobals.22'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.8) is being placed in '.bss..L_MergedGlobals.8'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.37) is being placed in '.bss..L_MergedGlobals.37'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.86) is being placed in '.bss..L_MergedGlobals.86'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.85) is being placed in '.bss..L_MergedGlobals.85'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.99) is being placed in '.bss..L_MergedGlobals.99'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.54) is being placed in '.bss..L_MergedGlobals.54'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.36) is being placed in '.bss..L_MergedGlobals.36'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.62) is being placed in '.bss..L_MergedGlobals.62'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.13) is being placed in '.bss..L_MergedGlobals.13'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals) is being placed in '.bss..L_MergedGlobals'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.27) is being placed in '.bss..L_MergedGlobals.27'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.31) is being placed in '.bss..L_MergedGlobals.31'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.21) is being placed in '.bss..L_MergedGlobals.21'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.11) is being placed in '.bss..L_MergedGlobals.11'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.43) is being placed in '.bss..L_MergedGlobals.43'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.6) is being placed in '.bss..L_MergedGlobals.6'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.98) is being placed in '.bss..L_MergedGlobals.98'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.61) is being placed in '.bss..L_MergedGlobals.61'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.35) is being placed in '.bss..L_MergedGlobals.35'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.14) is being placed in '.bss..L_MergedGlobals.14'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.57) is being placed in '.bss..L_MergedGlobals.57'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.44) is being placed in '.bss..L_MergedGlobals.44'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.29) is being placed in '.bss..L_MergedGlobals.29'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.19) is being placed in '.bss..L_MergedGlobals.19'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.1) is being placed in '.bss..L_MergedGlobals.1'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.7) is being placed in '.bss..L_MergedGlobals.7'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.9) is being placed in '.bss..L_MergedGlobals.9'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.33) is being placed in '.bss..L_MergedGlobals.33'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.17) is being placed in '.bss..L_MergedGlobals.17'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.104) is being placed in '.bss..L_MergedGlobals.104'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.3) is being placed in '.bss..L_MergedGlobals.3'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.28) is being placed in '.bss..L_MergedGlobals.28'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.5) is being placed in '.bss..L_MergedGlobals.5'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.42) is being placed in '.bss..L_MergedGlobals.42'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.23) is being placed in '.bss..L_MergedGlobals.23'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.4) is being placed in '.bss..L_MergedGlobals.4'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.49) is being placed in '.bss..L_MergedGlobals.49'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.39) is being placed in '.bss..L_MergedGlobals.39'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.16) is being placed in '.bss..L_MergedGlobals.16'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.15) is being placed in '.bss..L_MergedGlobals.15'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.40) is being placed in '.bss..L_MergedGlobals.40'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.25) is being placed in '.bss..L_MergedGlobals.25'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.51) is being placed in '.bss..L_MergedGlobals.51'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.72) is being placed in '.bss..L_MergedGlobals.72'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.38) is being placed in '.bss..L_MergedGlobals.38'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.47) is being placed in '.bss..L_MergedGlobals.47'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.20) is being placed in '.bss..L_MergedGlobals.20'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.26) is being placed in '.bss..L_MergedGlobals.26'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.18) is being placed in '.bss..L_MergedGlobals.18'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.113) is being placed in '.bss..L_MergedGlobals.113'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.45) is being placed in '.bss..L_MergedGlobals.45'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.34) is being placed in '.bss..L_MergedGlobals.34'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.55) is being placed in '.bss..L_MergedGlobals.55'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.30) is being placed in '.bss..L_MergedGlobals.30'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.81) is being placed in '.bss..L_MergedGlobals.81'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.12) is being placed in '.bss..L_MergedGlobals.12'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.24) is being placed in '.bss..L_MergedGlobals.24'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.32) is being placed in '.bss..L_MergedGlobals.32'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.52) is being placed in '.bss..L_MergedGlobals.52'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.41) is being placed in '.bss..L_MergedGlobals.41'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.46) is being placed in '.bss..L_MergedGlobals.46'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.10) is being placed in '.bss..L_MergedGlobals.10'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.22) is being placed in '.bss..L_MergedGlobals.22'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.8) is being placed in '.bss..L_MergedGlobals.8'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.37) is being placed in '.bss..L_MergedGlobals.37'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.86) is being placed in '.bss..L_MergedGlobals.86'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.85) is being placed in '.bss..L_MergedGlobals.85'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.99) is being placed in '.bss..L_MergedGlobals.99'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.54) is being placed in '.bss..L_MergedGlobals.54'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.36) is being placed in '.bss..L_MergedGlobals.36'
>> ld.lld: error: vmlinux.o:(.debug_frame+0x2b7884): relocation R_RISCV_SET32 out of range: 2158664622 is not in [-2147483648, 2147483647]
   >>> referenced by delay.c; consider recompiling with -fdebug-types-section to reduce size of debug sections

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
