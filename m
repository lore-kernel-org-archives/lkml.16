Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B9218593
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747347633; cv=none; b=DTeFAkfJIUc+OyDqUi+2kRftV2guJ78oV4iVwSig921+a+EP6zMK1twv+RaTRvIEOZiXOlzrwQ+uiGjplvx9MpSOiVmN9Z7aFiY1o/a8Z5O0QHjvWNDOlwWUs8TIErYsWtuLFq6bgguJI8b0djagBXNrOgRrIQ/VbyQ/sfOYedM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747347633; c=relaxed/simple;
	bh=8zNoaA7Fiehsj/vnC6Gwn3zvk4qINoWhnug44tgqCJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+AAv10reFKoXkiybuLGlxVu0Z3bmrd7wTcJv+l0AZRllJdIjuqeKF6f8RpXa/gwNGLbg9IAbomE2g8rjKz9HdfLf1Sf/oJxYxXvzcoiSly3aydVjkcX/W5FWx9cf6tnEjNuD2zkJMDrD2OIC2V4o15Tk9Ii9URNxl/PlVyGLww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daGN+awk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daGN+awk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747347632; x=1778883632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zNoaA7Fiehsj/vnC6Gwn3zvk4qINoWhnug44tgqCJ0=;
  b=daGN+awkAxjjpL5S5/oKrCfwnaXn2gxk2G8KCsD3rUKhWodWj2GKxA3B
   o+4Ppr0mIJXjbm3zOakdElhImyn+wnLUqw435TxzA9uk8VPVQ6iGrXsoG
   NrlBXWK4Xvk8Or1+LGOZ3sCp6JD3LsIcxICbxzLty6EauOUq9noMCdwl/
   jM3AkOTTwBDVkC18udJJVAiNTbBlPd3jMHgoDI9U7rbonc21z/APa3IC2
   dcizz6jmalH5YOXUrE1F69xjq3XBVqJgTlBT1/ORg3hr75n1T/S0uoZgu
   nodGx2oC1D/SNMxuau6y5xDd5b9IYBy81/fRBgLPBXBfj0+sXZ5xaKQ/i
   A==;
X-CSE-ConnectionGUID: Q4AA7xngRnC4ME+bTTWQnw==
X-CSE-MsgGUID: iq4Zy6dxRfCQ1fImPBvG+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48561604"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="48561604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 15:20:31 -0700
X-CSE-ConnectionGUID: mVd3tXRjSaiqGAGNGp5D3g==
X-CSE-MsgGUID: M5m+sniQQhW6ZJDxdaENbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138406430"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2025 15:20:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFgwG-000Ind-1z;
	Thu, 15 May 2025 22:20:28 +0000
Date: Fri, 16 May 2025 06:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arm-linux-gnueabi-ld: error: .tmp_vmlinux1.btf.o is already in final
 BE8 format
Message-ID: <202505160647.ZJxuP2IQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fee3e843b309444f48157e2188efa6818bae85cf
commit: b1a9a5e04767e2a78783e19c9e55c25812ceccc3 kbuild: merge temporary vmlinux for BTF and kallsyms
date:   10 months ago
config: arm-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505160647.ZJxuP2IQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160647.ZJxuP2IQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160647.ZJxuP2IQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: error: .tmp_vmlinux1.btf.o is already in final BE8 format
   arm-linux-gnueabi-ld: failed to merge target specific data of file .tmp_vmlinux1.btf.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
