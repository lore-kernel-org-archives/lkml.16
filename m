Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C828E59C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746647650; cv=none; b=gmCyAxQIB2zd6a3JsXAdVJwxo1Xs+1e/vtIFEAFWCEnkCsjI9pky9o4zybQxihbaP9W8I90HO3Gs23dgNfB3KlC5j7vR8v8DhqeTr6iUpnCbNvjw5m5K9p/hqWNm81msocUR+iUlVcLyja0R13HKGZGbWK/2vXYK66GhW+OQnyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746647650; c=relaxed/simple;
	bh=MCJ4cFKGkNplg7AD1u3cEfZhohVlx7w+y3K0gKg7Chs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7+yP+6dUyj3Dz06yB9dNmngjqeq3tT3wmMNL0AhLK8pOwhr0HGI6fP0W0XoPNXKUxfscvZaCraf/n5cD14spdmvNM3w82Ver+T+nFaF97sOKk+s4Gpb3En/ZbhiDRHusC7eODrUxFhHrNCsGFFjE7LC02VvDEM+PoMYZQSwPrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJvEKcij; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJvEKcij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746647649; x=1778183649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MCJ4cFKGkNplg7AD1u3cEfZhohVlx7w+y3K0gKg7Chs=;
  b=PJvEKcij6jcocseiwn2CDtaaLoW6qkL3BurIZLvNNgr47/wkLmqKw4VL
   3GqOEtdPCfO9Gxm0wHqgIZD3BXixY3SLy3pYRGyQxGGprZE9I2VtbSKGl
   VLmI5Ja2Yhv+yTDXIFZ9J780Y+GpzaHEkYNsrLlx84KPb6dIsXGF2oVfQ
   ZGXxkwmrYN97PxvhUx0QRVRlPZJQyqgyWv+YkQcKXfGJGt4r+Nna8C2MP
   ngwTbTIkPP49LMjXgFm/BYZ7wJh8tguJo+HxbecvU/PZEXcnamRtTAqIn
   zNf+vPfDSsSGb4Gg58AoNSDUyHq1WGfBCMY7ngW+o+bmWsRU3618s6T/s
   A==;
X-CSE-ConnectionGUID: 0Kjg5ULUTeeJggfWM8c9gg==
X-CSE-MsgGUID: gvxhP7/HScu+jAdlZWbhfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52215246"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="52215246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 12:54:08 -0700
X-CSE-ConnectionGUID: C7zOT0JZRdi5YshBseSrSA==
X-CSE-MsgGUID: XK06RouHQEGNckzXgZubBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="135935833"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2025 12:54:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCkqC-00090T-24;
	Wed, 07 May 2025 19:54:04 +0000
Date: Thu, 8 May 2025 03:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: crtstuff.c:(.text+0x7): relocation truncated to fit: R_X86_64_32S
 against `.tm_clone_table'
Message-ID: <202505080333.5jZEOjTI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
commit: 10f4c9b9a33b7df000f74fa0d896351fb1a61e6a x86/asm: Fix build of UML with KASAN
date:   1 year, 8 months ago
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250508/202505080333.5jZEOjTI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080333.5jZEOjTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080333.5jZEOjTI-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc/x86_64-linux-gnu/12/crtbegin.o: in function `deregister_tm_clones':
>> crtstuff.c:(.text+0x7): relocation truncated to fit: R_X86_64_32S against `.tm_clone_table'
   /usr/lib/gcc/x86_64-linux-gnu/12/crtbegin.o: in function `register_tm_clones':
   crtstuff.c:(.text+0x38): relocation truncated to fit: R_X86_64_32S against `.tm_clone_table'
>> collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
