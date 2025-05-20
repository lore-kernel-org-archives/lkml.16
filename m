Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FC25C701
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730896; cv=none; b=RKzEhhltkFZ7Qdrow2hSG+JSA5Z4U4dZ5CYBGh4+406JFgdra2+SzSUHE5/+aoqjN+bD0nj67Nsh0tgNzkSjcigAoa/K/XO1ZsjHdT7j7TYtyWZaUpU8N+EdrUVpm+FqL3L1WQ5pwKIZtSBQ2hvrWu6qMaD722Q0Vngf6cnvyg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730896; c=relaxed/simple;
	bh=W9tKgO781H8MQ5ZyOdBvQ6RtMkxiwgmIY1PLxbbWwdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ST9f69BmMr8DiH5bjW4OtYsGhUfpN6ysia2okeiVKK9lPtwoKoB1YInUWkkoHber5RyF1Qyb0lu4xehv+CXPMeZvWXrLN6mh/LJWuRs7CBBVaQSLMS8keAD6++Mif5dwQOZhrCLc0tJmY+kpyyS21yuVeLNMXlEYy1+aPKAmQLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwWAR2l8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwWAR2l8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747730896; x=1779266896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9tKgO781H8MQ5ZyOdBvQ6RtMkxiwgmIY1PLxbbWwdw=;
  b=JwWAR2l8mls+H1SMP7FivUQYeP8FiqR9YdmEaw6WxpPfeGMo11WD9W1x
   kxdg2dZdA30gXbmVyR29bOsjR7gFjSRB8pu7aBybju6zmChMJrNyhGa1K
   nZ8y1k6P92emts1ONeuGOKupnJlmGgfyrfJOVAPN0xUljQ+3CaxXDMleN
   mrvHatkRHhP/AfyEA7qQORl1KZRoC6STZvX4jwErJCImNTmbx/qSyhPFU
   VhvG5Q+4DsciB927Gn+X//yCyLqZnoA5ueLS6Nr5aYTq5hvaY+N0P8Qi8
   evjtJVuytJUGu7j06aJJNCnJqFs6vLW7MQp6FRQGy94kFZBuoOBRc0/sb
   w==;
X-CSE-ConnectionGUID: 1QbHlDl3Ryui6agBf151Vw==
X-CSE-MsgGUID: a+aZsv9OR82iIurS2QUVHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61047110"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61047110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:48:13 -0700
X-CSE-ConnectionGUID: lExXmoSpSTqP9iA08MIKCg==
X-CSE-MsgGUID: Xs5tJoQoTVyoKqZ/V81Kqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144482703"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2025 01:48:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHIds-000MLg-10;
	Tue, 20 May 2025 08:48:08 +0000
Date: Tue, 20 May 2025 16:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
Message-ID: <202505201604.mDAHIWVa-lkp@intel.com>
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
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   8 months ago
config: m68k-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_LDB-0-0 (https://download.01.org/0day-ci/archive/20250520/202505201604.mDAHIWVa-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201604.mDAHIWVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201604.mDAHIWVa-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
