Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620EF25FA09
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774895; cv=none; b=ilTOtEtx741SZyrHlIaklrTp0xXSjr0uLSBCQ4jjatbYT8pscDBkP+Yn16OrKYCj8meMJmsoiHvBeSLUHZWTBAelvZ2UoKS3EcS9FacjoexoIYitrFh3QGLvKbh8faJVIv7oQEqCI0rrXh+GkN/ZSCsC2uCpfNd21m9SzFP+i0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774895; c=relaxed/simple;
	bh=mbRmEa5VFUN0fZ3VPoAhqhpVXZx6G8j8HHw1cHz1VRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUPyFQ/xHPGPmZz1oPsxE9S8KhNJ+FJUz1GLZaCGYpJP10duTy6pJ+byEpe5/zJma7lvUlTrNi1Bpwks4eF8mXjmdB7D9dHVadSCjsQqC6TPjGFdoUooYbNX9ZA4IvgS+aNyI/VvnXCT6RkUMfz91E9UUYaZIUa+U9OqcbrYroU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nve2RABy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nve2RABy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747774894; x=1779310894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mbRmEa5VFUN0fZ3VPoAhqhpVXZx6G8j8HHw1cHz1VRU=;
  b=nve2RAByW10Ypd/S9WyN6so5L4YUBYs67ZVRfNPzd8PVSV7EWf85Jbje
   GNF9CkGKUQ76//g1QhyFE4PuQbWp1BgEEzK00zBCVY0SOpOmbqdvNVroa
   a014SaT6K6nYYOuhREpSrFbTCoaB01XbVh34R34u3b58M++cfwctu3ZTS
   s0qhwyYnJQ6U1VbJ6EU+WxNN6i2VDj9YwJW44hX+y8e/KFpRINcmeF4TY
   wXjE9QiPOZiAuGGipD1YpFL0frtnFFfQO3/2Sv+qfsNJpsnRTPmT43FVw
   kKI5fWiehnovocYfFidmXrvnLS2AZ3ORcd9WDUAEovS8CLTHoZIwOJCGa
   A==;
X-CSE-ConnectionGUID: qoPzpsWJTC2leCC0F2U7vQ==
X-CSE-MsgGUID: eEdhx5j8QpWQczwkqtwBqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="61127645"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61127645"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 14:01:33 -0700
X-CSE-ConnectionGUID: 4LUSOnYXQfmtQgnwZolzkw==
X-CSE-MsgGUID: oiC0lUYhSFGiJkwXSlCkOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143805338"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 14:01:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHU5a-000NYu-18;
	Tue, 20 May 2025 21:01:30 +0000
Date: Wed, 21 May 2025 05:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: drivers/staging/gpib/tnt4882/tnt4882.o: warning: objtool:
 .altinstr_replacement+0x1e6: PUSHF stack exhausted
Message-ID: <202505210407.YppdzRt6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
commit: 84654c7f47307692d47ea914d01287c8c54b3532 wait: avoid spurious calls to prepare_to_wait_event() in ___wait_event()
date:   3 months ago
config: x86_64-buildonly-randconfig-005-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210407.YppdzRt6-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210407.YppdzRt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210407.YppdzRt6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/gpib/tnt4882/tnt4882.o: warning: objtool: .altinstr_replacement+0x1e6: PUSHF stack exhausted

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
