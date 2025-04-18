Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB78E13D52F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990246; cv=none; b=t63o77HsFynRr1gl52dXkAbUWcbwpkEqFoj+RAvT68cYvdQVKlqhqgvj2F6u6zBvgyxTcDydF5TdtZmpXArjv4PONNIaQatN974pVHs6tB5BIc/izRfbpoMsk93CpLO2muhG6tLys3jqqHNdKOhdoNdmpro48npkQ6t8QIy/Hvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990246; c=relaxed/simple;
	bh=nuvyM8ba/KNSvSEHshiPj/M6iMCDkZufAcp05tmzU2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUiKpckDxT6flHjnSwodJIntrule/wd0/DLYNnOGxr6jy4hUMHuZz+fOy9ShL5YYjmSSh83MXJU+c8Ov+2uRYF+GrTmWqcrnjZDGMmxnZrGGqmJ+LvyZY0UQfqdwU0Eg37c55uPWKDVTcamGJHbHaSmAw0VgDj49WOMeBGzQzdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHuONcdG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHuONcdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744990244; x=1776526244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nuvyM8ba/KNSvSEHshiPj/M6iMCDkZufAcp05tmzU2Y=;
  b=jHuONcdGD+O942heWiBEmMNXMMyq9C79n7tMLf4+9A8GoHS8qoTxT/V9
   oBvfdQB2pN6oSiYG2OaeGbGvVbin4A/mYxAFCV2DPrQPWC0E2+t0X7kJg
   EihUi8Z45DhKg5xZOlGQ4X/JZ7WAJJKulg0ZGEiMp9Kmd3I/OgTTQ3waU
   qxhBU509igLLr9SubmHsM1vNFxmq0zOk6SG5uMe7Sji/6gJHV7D8+51k3
   FWYbzQCeGEaZiM+/TdFtgh1Zv3TVRGAT1Tz+CaRsS4YKleDwvk0/QlazH
   JR/vZPHabwsLBzoZ+Uzn6JLwuSLVSKksxHeCzjyrV2glD0E3fSbYQE5tW
   Q==;
X-CSE-ConnectionGUID: v9x3vvfDTL2bFtsTzFz4yg==
X-CSE-MsgGUID: GQiBsgi1R9qfY9YYRLgAsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46740046"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="46740046"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 08:30:43 -0700
X-CSE-ConnectionGUID: Ka+PNSTpTje/kVVVCKwmUQ==
X-CSE-MsgGUID: +PoCNITSR8+UZvF95gi+ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="168340356"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Apr 2025 08:30:40 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5nfp-00030T-2u;
	Fri, 18 Apr 2025 15:30:37 +0000
Date: Fri, 18 Apr 2025 23:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v3] mfd: core: Support auxiliary device
Message-ID: <202504182338.SwsgSLNm-lkp@intel.com>
References: <20250418123433.2586383-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418123433.2586383-1-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes linus/master v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/mfd-core-Support-auxiliary-device/20250418-203658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250418123433.2586383-1-raag.jadav%40intel.com
patch subject: [PATCH v3] mfd: core: Support auxiliary device
config: riscv-randconfig-001-20250418 (https://download.01.org/0day-ci/archive/20250418/202504182338.SwsgSLNm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504182338.SwsgSLNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504182338.SwsgSLNm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/mfd-core.c:389:31: warning: result of comparison of constant 2147483648 with expression of type 'int' is always false [-Wtautological-constant-out-of-range-compare]
     389 |         if (dev_is_pci(parent) && id == MFD_AUX_TYPE)
         |                                   ~~ ^  ~~~~~~~~~~~~
   1 warning generated.


vim +/int +389 drivers/mfd/mfd-core.c

   384	
   385	static int mfd_add_device(struct device *parent, int id, const struct mfd_cell *cells,
   386				  struct resource *mem_base, int irq_base, struct irq_domain *domain)
   387	{
   388		/* TODO: Convert the platform device abusers and remove this flag */
 > 389		if (dev_is_pci(parent) && id == MFD_AUX_TYPE)
   390			return mfd_add_auxiliary_device(parent, id, cells, mem_base, irq_base, domain);
   391	
   392		return mfd_add_platform_device(parent, id, cells, mem_base, irq_base, domain);
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
