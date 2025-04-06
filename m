Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9520133987
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743942071; cv=none; b=ICT2wstKW7noNF8c6PA2Ja2P9Vx9fdkP4xs/SRpbp/3Fgdo7KqmH/MWdtmHc+QhVrs2jlo/Ilz+wPKdpmelfHft2SmsIYewC1fIerbbAZvmvk89ZrMdmurH9riSJGcDYeG3fWpDNJyq2ut7sQh0JkrtnsmgpSl57JK9Jf07O1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743942071; c=relaxed/simple;
	bh=94r3x+l1sntU7hyQZLefUw+fmCmV/lAdFdDZcKB88T0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UlMD60tGeRODLZ16Y+GLRohwrtY1FOOrEh26i6UUvjUftZgUEbJ8zZA/O0cWTgQT7ILuyPnWzZ3vrzpxMtGh7HmA6ZW8rmvp7/HvN0xLaElk+GTxoqz0XEBn9IngkQyklwWicsawYmq6hwt88CW5zMc3cAyhs5VZVbqT7epdWpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUd7NkOR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUd7NkOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743942069; x=1775478069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=94r3x+l1sntU7hyQZLefUw+fmCmV/lAdFdDZcKB88T0=;
  b=IUd7NkOR24+gMHXZqigvuXoo1O6wxElAh248yzyKl8vo0AlsgT+FbIYC
   usCG6oAZULdOtK0URW9PO40WXPXxqKuKDCFYQpqfUcr0vHtB8xnuHHB0c
   cTCUX4OeMcERzGV1i3h71m0CEvmAJ+OvaT7EUyyepzpTXB5BtVXBCawsQ
   gQUg1qO3np0G/YVI8LTkdWudTarv0VczZXg44KV6eIYjrKSp5FDhMSVck
   2hBz9jySRfg9oVL8Y5rWfsfRn7ZnbxdbxpJ4/ncXzHNI1zDTNW7gvxfQc
   qChMm/Ykk39b0akOBqo+CiJVkgl0BOEYKfyWFopEUrSpsLwTf+ql6F2uJ
   w==;
X-CSE-ConnectionGUID: zrLNguBkT9mNdtHjb/dYxQ==
X-CSE-MsgGUID: xo1y/JlvRYWDq6a/aKgirg==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45239007"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45239007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 05:21:09 -0700
X-CSE-ConnectionGUID: ZCzvXK5JTZ+NGnu81Y+6rA==
X-CSE-MsgGUID: QY+N0yGBQOmBvRdn2epQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128222214"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 05:21:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Ozo-0002aN-1j;
	Sun, 06 Apr 2025 12:21:04 +0000
Date: Sun, 6 Apr 2025 20:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: drivers/iommu/dma-iommu.c:1776:2-3: Unneeded semicolon
Message-ID: <202504062027.LGAqKFlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f4d2ef48250ad057e4f00087967b5ff366da9f39
commit: 6aa63a4ec947f350d1a2f9f6aba8591a2455d192 iommu: Sort out domain user data
date:   12 days ago
config: arm64-randconfig-r053-20250406 (https://download.01.org/0day-ci/archive/20250406/202504062027.LGAqKFlO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504062027.LGAqKFlO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/dma-iommu.c:1776:2-3: Unneeded semicolon
   drivers/iommu/dma-iommu.c:1788:2-3: Unneeded semicolon

vim +1776 drivers/iommu/dma-iommu.c

  1766	
  1767	static size_t cookie_msi_granule(const struct iommu_domain *domain)
  1768	{
  1769		switch (domain->cookie_type) {
  1770		case IOMMU_COOKIE_DMA_IOVA:
  1771			return domain->iova_cookie->iovad.granule;
  1772		case IOMMU_COOKIE_DMA_MSI:
  1773			return PAGE_SIZE;
  1774		default:
  1775			unreachable();
> 1776		};
  1777	}
  1778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
