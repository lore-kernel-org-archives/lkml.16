Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6EC213245
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737988; cv=none; b=ES+2N6UVkmHzVwjfkTWz7BuOZe67NOHHE581HT/gOTmZwrcAFW2qHVEdE4y0LgCX2bI/MiyoqHDcQBoWoMtEgRzdTRK7FcU9zY3MM57/gnkxi1ymtCZ80lJ8JlsX+1WpNrRudt0NOcoIDYCeTSFS1wTLwgbpmhQZxthHPIAfx7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737988; c=relaxed/simple;
	bh=i2cjHvwM0j5DhW6pIKoPa6g27lwFZDUXxHytZlZy7Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VuFRTTxykE8ZK7mcvL2EhDSCI2YGLUI7yoXRgN8RY1tqSdncOcUuRWDO5a8Sc9grJeJEqbYV4+KdbSVF7Sqve1IEfeeTZMrg+qEyCFomHvy2VPZo30lP8owF+mneJdo4V4ak4B7sEQLH0NZYGsZPVoAbX0LcfqLptBUycz6ksKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8swRIGH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8swRIGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737987; x=1779273987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2cjHvwM0j5DhW6pIKoPa6g27lwFZDUXxHytZlZy7Zw=;
  b=g8swRIGHDrsLimV6+ILwtIH+5f6K1cTzWvywGTNouqgefdgqsQM/tsCa
   3eCiL1DMYsk4if1VfeSrBwdbRxfHxz0gVBdRb9XuGzAGjOvAa/52Q7J6f
   EvpTXKUIQ6c4nwxFjrjJWP7iEmXrtLEZ0aqCU8n9bZPiUK9mMOneXSUv3
   zDxvu0RzOSfPNL9i3FwI7M6QdNl4vwetc3pHZAC/5pn1odD1loXOiWxn7
   BzqQAWT1JZI9NA/vX976uC09DHRB3XEOt0uyT0Vw5iAfIfeOpjwVGUooh
   o+eSeVSYyOFlfg9o1Z+ihow3UwRLTBOvXq/dmtIJIZU6Eg62ZM6vIM0tb
   A==;
X-CSE-ConnectionGUID: P48VnAbwQVyLzUbTuqT7ew==
X-CSE-MsgGUID: CFWV0rH3Si2+OPhkf2y7+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49820614"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49820614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:46:26 -0700
X-CSE-ConnectionGUID: Clb38QEVQw6FwCrDcOHs8Q==
X-CSE-MsgGUID: F30S+3aaRfa+VwiojHymZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139377907"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 May 2025 03:46:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHKUH-000MT3-2d;
	Tue, 20 May 2025 10:46:21 +0000
Date: Tue, 20 May 2025 18:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
Message-ID: <202505201822.CJulARXO-lkp@intel.com>
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
commit: 35727af2b15d98a2dd2811d631d3a3886111312e irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
date:   2 years, 1 month ago
config: arm-kismet-CONFIG_HAVE_ARM_SMCCC_DISCOVERY-CONFIG_ARM_GIC_V3-0-0 (https://download.01.org/0day-ci/archive/20250520/202505201822.CJulARXO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201822.CJulARXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201822.CJulARXO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
   WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY
     Depends on [n]: ARM_PSCI_FW [=n]
     Selected by [y]:
     - ARM_GIC_V3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
