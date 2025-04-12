Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA55333F6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744442927; cv=none; b=DbbzXJoYFfLSr11jaOte3lGLo5it87LH3ZAkbu1rX8kWqrU5XaA7MeT4VQCBVymBDuQeJx2yE0HAwLH/j2FmkSid2CAKpKs4iGpQmPqmunBcsSrMSgddtYtWy3g6l/dITQk7bAm0mMfN6dFD1Qvaepy6V+nCL+sN1TumpUKP7kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744442927; c=relaxed/simple;
	bh=SPqo/maVqrv3EOqPrlfjZlnRQMzbkmVrEpK1AqiJJqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bwg3EQpuIJxq3nayQFGo8qZe/C3qkr1qPAsD5LFxrPbJ0hNdCKjfLY/SEzDzMzBdxU+kYkq6BDE2a/cWQ3X8b5/QSG3VtQJIh/KO4zLUq6hnX+WB18Hwums2IgKAZc87J9GmWHG+dNu45fuRqXhQGjpdTDEYnxSFSC1VeaOHzGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdYIm31P; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdYIm31P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744442925; x=1775978925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SPqo/maVqrv3EOqPrlfjZlnRQMzbkmVrEpK1AqiJJqg=;
  b=FdYIm31Px1IaftIYZXvEoxOlejWH0KgTT/t3hDMGIuSbA3KndAiqfFMa
   F9o48yPtVHBOW3GOsVVvp6fg5/d3ug6p5g8EzynZHRnvz0h28F0ExBdV7
   +0p2mODbPp6D5g6MKc8fd16JUQug4BUHuDQSpBNGdLex6alBpCo5BXU+k
   n/N5NAWCKuXHfbpbqvnbISmolhYT0zTeRH1OIenu2ZQub3BHGQTzMwaKd
   SRgvYccoG6swk+Vo8jIScR0SfdKwl+8gtnIa3HSbDgny3vq0NTvvB9VLu
   VbIjTnpxWZHzndTeHbfAzAILNZooxJizy1ymBJQW9hubIHLluJWf9xE8W
   w==;
X-CSE-ConnectionGUID: sQDJfhlsSh2Ol1gLGPJbjg==
X-CSE-MsgGUID: bHjRZIrWTaGM/ZijaXGQlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46119897"
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="46119897"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 00:28:44 -0700
X-CSE-ConnectionGUID: EKB1H0y1Q0u0VFfyTiux7Q==
X-CSE-MsgGUID: 4xqNpjx8Rqaly0ZdrcQgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="129944063"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Apr 2025 00:28:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3VI9-000Bdo-0J;
	Sat, 12 Apr 2025 07:28:41 +0000
Date: Sat, 12 Apr 2025 15:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
Message-ID: <202504121542.POjGXRh2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3bde70a2c82712f05c7220b8b94fc2cbdf7fbfe0
commit: 35727af2b15d98a2dd2811d631d3a3886111312e irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
date:   2 years ago
config: arm-kismet-CONFIG_HAVE_ARM_SMCCC_DISCOVERY-CONFIG_ARM_GIC_V3-0-0 (https://download.01.org/0day-ci/archive/20250412/202504121542.POjGXRh2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250412/202504121542.POjGXRh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121542.POjGXRh2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
   WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY
     Depends on [n]: ARM_PSCI_FW [=n]
     Selected by [y]:
     - ARM_GIC_V3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
