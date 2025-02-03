Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA093C00
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 00:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738541101; cv=none; b=gK57Hf1oUbO6uIOCV9aV3gHTolSQG2uaKK0J+VdMFYG5yPe0o5TgYcFmmT0Ht92dA2AgWkvUkGmQ19laYO69kgx9ehv1Mu/0y+FuPS9+TQEBHtHiqOTsqt6VWy4Gb0y2QhJIm7B81N/sB69j1o2ePLVZTr4uIMlgDhp7kZwv+f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738541101; c=relaxed/simple;
	bh=XBXvVyCf1KzPRU+p9gxhcyIa+rQC9zYt6WPCH7j3VEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5xVr5qwX2NPsAhkW96u0a3VPB7nkf3gJnEGjG+UQyhhuy5iDVau1kO4CwFacm12Ws47/z+jYiumFhLFAeWTdOB0+l+oqmc/MAeen16Kcr618lfb4oTKN114dyC/UFwFDBbyuSrqV/NcftCKO+2paFoYZARE9aRu/rds0QNT7UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPHVAF1n; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPHVAF1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738541100; x=1770077100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XBXvVyCf1KzPRU+p9gxhcyIa+rQC9zYt6WPCH7j3VEY=;
  b=cPHVAF1nuzmyte9tbQjcbPgh/0P5lRScSkzoGkY2LyJFHXBc+yQKDDmV
   i0waEc/KI0OGFxzHx+0PLfGzTKrSPKeGzyowh39lTGELejAxVc2Nmcxwk
   oJj9iGZ8ZHYMqWxAh5EoAScuOqoB+tXImJQ9m+MgcUH5mPMvSwzEJ9hmB
   xDT5YMm3JInYFWYPi5l0uzJK6rvvopWa0DhAL6XgNYiuXxS9dSgIMrD3N
   UziMMOS66KOZzHNGLK0mHcffAqaY1tMuyvX99grWKjoMv79y+IXMLdFrf
   nWYNpORX46bMkJXASSLm1bSKa26bOXBh76OkcngTFIP/PIhi6NeAo1ITD
   w==;
X-CSE-ConnectionGUID: eBQt7Wu4S5+qjCcDNpj5+g==
X-CSE-MsgGUID: FxHOJOTeS6O7flk6bazk9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="50021741"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="50021741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 16:04:59 -0800
X-CSE-ConnectionGUID: CzwksGh5RpCoglRxjeXcyQ==
X-CSE-MsgGUID: EK/aMxlbRoCdO5lyNVmcYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110590175"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Feb 2025 16:04:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tejxQ-000qGx-1F;
	Mon, 03 Feb 2025 00:04:56 +0000
Date: Mon, 3 Feb 2025 08:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_hvm+0x30:
 sibling call from callable instruction with modified stack frame
Message-ID: <202502030848.HTNTTuo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Juergen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d79bc8f79baacdd2549ec4af6d963ce3e69d7330
commit: b4845bb6383821a9516ce30af3a27dc873e37fd4 x86/xen: add central hypercall functions
date:   7 weeks ago
config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20250203/202502030848.HTNTTuo9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030848.HTNTTuo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030848.HTNTTuo9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_hvm+0x30: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
