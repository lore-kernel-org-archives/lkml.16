Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475D14F90
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744911139; cv=none; b=AM19Q4+Rc/VeOTkzs6BsH0lQvvny/cqttkgdvyiidzU693wjGNHVYTf0OPxfmxCFsTN1GRGD3O+ZNPUo2oLmAB8dgq9VdhJHUmXeieKFDU03p4L0TYiXeUk3nYjm7Rlp928xwPny9+VGIsYlSXqzGPZdSUS/j48dVANtigmjbRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744911139; c=relaxed/simple;
	bh=L8zYV5TNnFGOd7vlMx9E0q1H4hv3xsODxRHGyPyrxcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+AIp78RUb6X1HtV89vhR9CW5wLeLv7ecV6d3zQDn+Z3LVPiyRAk+SkA2gASYg7tEoKMPOaTSvvyd8nHRhrUoUpYvpOBKen5rRWiOU0Xw6/vMyUkARmLRjET1poJXQFy3giSmnJpsrrcguhGHwr0XMHOiLWpP6ibLJjBQexrxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQjFV7ZQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQjFV7ZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744911137; x=1776447137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8zYV5TNnFGOd7vlMx9E0q1H4hv3xsODxRHGyPyrxcc=;
  b=SQjFV7ZQpP5deHeW+vw8q6vaVnKgTPyAvn522Yf+IN18a1x0AB4ToQlL
   3oJYwu4kA89oYOksrG/nTVHPT/YBjYBNkNiSshEYFl7f4uU+vHvxpLTCb
   3GgRcmPSQO5al28vfagzgqddlTv8qqbXGwBfa/owMog/pkm8/A8GCLZfW
   a0Vic0wLvGtOLJRk4U9FBIKiUsKV1K0Nif0QpfUvt6RPZ+PjSzSgmbBfy
   bZJ3tRMBZV/kdn+NQ4Q3e2WZ1iZODyCjendNvv/ahxqgVPg5vXa0eUHm/
   5k0iPGUsjyD1+PDilhuu9WYKFk4Vm8Hqg6uMxfnuGelYkZVbLj8yfHBsp
   w==;
X-CSE-ConnectionGUID: J6kKC+iNQJ6XWRwDTLvIBQ==
X-CSE-MsgGUID: fYhc99r1SGeKR8BN+kzK8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57889661"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57889661"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:32:14 -0700
X-CSE-ConnectionGUID: 9N2okqOWQ+2EgokY1XmETQ==
X-CSE-MsgGUID: ZmCH0iexT5Sw79g5H686Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135717839"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2025 10:32:07 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5T5p-0000Zw-0f;
	Thu, 17 Apr 2025 17:32:05 +0000
Date: Fri, 18 Apr 2025 01:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
Message-ID: <202504180138.vMkVoVLq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cfb2e2c57aef75a414c0f18445c7441df5bc13be
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   7 months ago
config: sparc64-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_LDB-0-0 (https://download.01.org/0day-ci/archive/20250418/202504180138.vMkVoVLq-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250418/202504180138.vMkVoVLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180138.vMkVoVLq-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_LDB
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
