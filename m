Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13560DCF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 03:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743823539; cv=none; b=ODvFy03YTfEoj7LynEopFIhC7G3QHdWoKBQyY9LkBL062rdu2rZPaPKENBVbK0E7UY1xPKH91GVrQXJUT7QDO9RBQyciJXHG2xO9er/HuHhkFKdfa5gX6Me85isxkmSWnJutCBcmXbtovQbUOp7nWMEsj0VDbBR48FhL7Gq3uM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743823539; c=relaxed/simple;
	bh=X01rqDU5Op3B89pGcWSLkKOSDzDTX/aGpUgeE5itfNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DDTwfG/7p1Jx3te7l65onfyr3PMH/7HxDMUUOxqGaA2SUZ+gck6vkdbV5T+WybbUHe/Jk7FX3y3WXBq40gX8gIS0PEi5/+ArOwxv/P6mAMtT+bsQvH06E+lshm/6IVvrwqfEisKKyobd0FpyDDMzJc6k0d9nq5boJQs2rAG0FEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkbPWw6C; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkbPWw6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743823537; x=1775359537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X01rqDU5Op3B89pGcWSLkKOSDzDTX/aGpUgeE5itfNc=;
  b=AkbPWw6Cmh2T3yK11avjvrkn4WbhnmHyk8xcdvv9ngmMcCdzURSbMjfL
   lPRx9LMDSX6tb2Do4eHiQhvFuQ/DgnnO9TlREgFDxHTfPetWZcT4g4f/y
   OcDwm33P5cUDpe38ach87najDoVT+BPJCgZTHXYQnz+FE5BfvjeoE76pd
   oJlgHAKz7sQck/jUrZLIRffXQXyI0zNaQl8YaH79cyIAJPt8cyJWYj9sl
   O7JiKAE9nH3p0q+TGHk0nGp+tdthXCt2jFqlxXPdmhstWqml1nfdCAJZU
   DaYpskn+duskj4QioEHml4Nci5E79JPUZqxhfdDsMgcFbpiESKD9e8P50
   w==;
X-CSE-ConnectionGUID: FXrWoNuxT+Cdc83twDuSpw==
X-CSE-MsgGUID: YDAcTDCgQh6ppST72IGjSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="67750625"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="67750625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 20:25:36 -0700
X-CSE-ConnectionGUID: xJR6rhzbT06w42Fo7qq+Mg==
X-CSE-MsgGUID: B4SVEAN6RPW54k/EaHWtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="128317345"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2025 20:25:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0uA0-0001mR-2x;
	Sat, 05 Apr 2025 03:25:32 +0000
Date: Sat, 5 Apr 2025 11:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>
Subject: kismet: WARNING: unmet direct dependencies detected for G2_DMA when
 selected by SND_AICA
Message-ID: <202504051109.Z0c2GF9q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f867ba24d3665d9ac9d9ef1f51844eb4479b291
commit: f477a538c14d07f8c45e554c8c5208d588514e98 sh: dma: fix kconfig dependency for G2_DMA
date:   4 years, 3 months ago
config: sh-kismet-CONFIG_G2_DMA-CONFIG_SND_AICA-0-0 (https://download.01.org/0day-ci/archive/20250405/202504051109.Z0c2GF9q-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250405/202504051109.Z0c2GF9q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051109.Z0c2GF9q-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for G2_DMA when selected by SND_AICA
   WARNING: unmet direct dependencies detected for G2_DMA
     Depends on [n]: SH_DREAMCAST [=y] && SH_DMA_API [=n]
     Selected by [y]:
     - SND_AICA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SUPERH [=y] && SH_DREAMCAST [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
