Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA941B3934
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916220; cv=none; b=EPRUcDMoLTpy6mseXMb/0ERQowpbN2et8pkgwZnVbujQHHP9wYLCwrO1w+Km+5DkIIUdXTRYRHleTlRB3uFWFvx7UtZjmuLhJodhCyG2McUWMEubEXcT+gfeTyFuvUgtmgugFBzRoW8DKjt+kNOyKtP9SlGo7cTebkq8+Do8EJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916220; c=relaxed/simple;
	bh=C14pC0oXB7Zebg4WCwH6Xn2IL1gFZUeYJTlBRPWxC1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwmWy6zsJlRO9hlcYXtMZ+ANfJzrmHIh552Nyf/+9YOHJ2G+PeI3Iassl6WCopq74wyrgn5Sf2ZZcl168TcZaoQbsYvXXEhpps4UkO3EolAQI9hsLI1tTTWbfEMX1r/43+eXYQh4CO9wwvXAzS4981hihd4uy0s/O2bTSUJTsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkRHpGBm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkRHpGBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744916219; x=1776452219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C14pC0oXB7Zebg4WCwH6Xn2IL1gFZUeYJTlBRPWxC1U=;
  b=mkRHpGBmxR1aDh0L/d03ICqzIa7T8WhVLkAw8VB5pPD8k2JbHUDU7Gj5
   cKL/IgnK1LTPEzPsMGNlvIB/hvI+BxGgWR08LrX4pvkLJOWxi2eXUlSHN
   KBkiX56DvCEP42L6uZGLRewKOCZQsDcQfgEtjxWt6DDIy/VGWNuROtinQ
   tV6PFHf0ltwW5Ml8XOjZ4/ZT1gHBbZik12lN5vWI2GQ7uxIO9NCcyMiD6
   5XMYgCQ7BAUJ/Lnki7M/GisLNfVFHeB5Y7mqGbroRWCBs0PcZLLzEGDj7
   4qU9CH52Xf0bA6tcveru+YZ5cqAxPSFOdIpvCvKIvjVqp+2m8kekJ9yya
   A==;
X-CSE-ConnectionGUID: AG8mFXv2RVSxelPa4B2Fzg==
X-CSE-MsgGUID: AWASkwoRSlyzhnSLJWCQiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46418700"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46418700"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:56:58 -0700
X-CSE-ConnectionGUID: Yr9HHAZLTNiJQiLQVisnrQ==
X-CSE-MsgGUID: /HieA4FmTsa+a72CRmA2Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131878701"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2025 11:56:57 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5UPu-0001qB-0t;
	Thu, 17 Apr 2025 18:56:54 +0000
Date: Fri, 18 Apr 2025 02:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
Message-ID: <202504180220.8GuWCBIw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7adf8b1afc14832de099f9e178f08f91dc0dd6d0
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   7 months ago
config: sparc64-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_PARALLEL_DISPLAY-0-0 (https://download.01.org/0day-ci/archive/20250418/202504180220.8GuWCBIw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250418/202504180220.8GuWCBIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180220.8GuWCBIw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
