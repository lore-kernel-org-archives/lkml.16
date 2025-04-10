Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F720C471
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277315; cv=none; b=qO2lagQZ7XdBcyxF7/YbyYZOrmhnqIp/jSfbo6TUNdAexDaXc7qW7Xoe3c5jbiPGX8fa/WBQAMTLHQoLodtcmXLjaMHP4afvqxHUvD80S7WAxfX+s2k9ra9HFlDYgMkuK2tF9ktZtjOHj93KqKneg/xcSz/iNFSH5z2mnfuhcDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277315; c=relaxed/simple;
	bh=grsUTpdnhqvjd0Hm7iEVppv5u0om2yQPbXAfzbCduKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGbyuc0rmMY4Yal8IHeOTA5+qOihBm8MZRJLQ0AdyNtMAC0tAgkHCx9VOoKY9GrTbUkSHxIKDSNNAH21mL5L54VtbYh5GBDTJk0iUEPMWg9okBX+WpZQc3HgD/Vbi6jjsJ0l3FjSrie7YvpU0GTReM3LM1eEk67pN51vTFBEMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaFe9/qx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaFe9/qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744277314; x=1775813314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=grsUTpdnhqvjd0Hm7iEVppv5u0om2yQPbXAfzbCduKs=;
  b=HaFe9/qxFVU9UVC2VWYrscgm76FBVLkZyfL11MeXy8qabdPVoc1PU2A7
   aX8w3Dd9+WK5xmaFAfy1tfRS6uQzJw33kEXGmlkVSAExj+GlnOVZhhDAb
   UhSFaNaO+dsdlNic7zZUlD9TtDH/+awXOre4y7gvhwj+BAqH6CPXJ1n4v
   293uliQPkkOjznuzZoz0o0K9zW/sps9PTJVceKNAOk5RcWEmrjOXfSSGw
   K90F5iYu6K3ZmogkG6r1jc2badY6oQGXBfW4enFzvaOrnl3BgVe8DClT3
   sN7Gg0mhtTjCfElVfiwr93jbSGkIy7HS8KSH2+cF7JDBj5tqgsX2NHr9V
   A==;
X-CSE-ConnectionGUID: wGCLzhLUQE+yfC4psL2ubA==
X-CSE-MsgGUID: PPGcj0kyTA+PIpV6dbAIKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57154698"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57154698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 02:28:33 -0700
X-CSE-ConnectionGUID: HTOMgKl7QMKOdgpykKC3QQ==
X-CSE-MsgGUID: aWnZQ6t4QfuhR77cbVIRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133968976"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2025 02:28:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2oCy-0009s3-03;
	Thu, 10 Apr 2025 09:28:28 +0000
Date: Thu, 10 Apr 2025 17:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: yiru zhang <yiru.zhang@mediatek.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	yiru zhang <yiru.zhang@mediatek.com>
Subject: Re: [PATCH] [Patch v2]Add ETE devarch condition in
 etm4_init_iomem_access
Message-ID: <202504101759.7Ls0Uy4o-lkp@intel.com>
References: <20250409032917.7580-1-yiru.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409032917.7580-1-yiru.zhang@mediatek.com>

Hi yiru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yiru-zhang/Add-ETE-devarch-condition-in-etm4_init_iomem_access/20250409-113037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250409032917.7580-1-yiru.zhang%40mediatek.com
patch subject: [PATCH] [Patch v2]Add ETE devarch condition in etm4_init_iomem_access
config: arm64-randconfig-002-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101759.7Ls0Uy4o-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101759.7Ls0Uy4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101759.7Ls0Uy4o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-etm4x-core.c:1144:9: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
    1143 |                 pr_warn_once("Unknown ETM architecture: %x\n",
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                         %lx
    1144 |                              devarch & ETM_DEVARCH_ID_MASK);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:659:42: note: expanded from macro 'pr_warn_once'
     659 |         printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:640:30: note: expanded from macro 'printk_once'
     640 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/once_lite.h:11:32: note: expanded from macro 'DO_ONCE_LITE'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                         ~~~~~^~~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1144 drivers/hwtracing/coresight/coresight-etm4x-core.c

  1121	
  1122	static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
  1123					   struct csdev_access *csa)
  1124	{
  1125		u32 devarch = readl_relaxed(drvdata->base + TRCDEVARCH);
  1126	
  1127		if (!is_coresight_device(drvdata->base) || !is_devtype_cpu_trace(drvdata->base))
  1128			return false;
  1129	
  1130		/*
  1131		 * All ETMs must implement TRCDEVARCH to indicate that
  1132		 * the component is an ETMv4. Even though TRCIDR1 also
  1133		 * contains the information, it is part of the "Trace"
  1134		 * register and must be accessed with the OSLK cleared,
  1135		 * with MMIO. But we cannot touch the OSLK until we are
  1136		 * sure this is an ETM. So rely only on the TRCDEVARCH.
  1137		 */
  1138		switch (devarch & ETM_DEVARCH_ID_MASK) {
  1139		case ETM_DEVARCH_ETMv4x_ARCH:
  1140		case ETM_DEVARCH_ETE_ARCH:
  1141			break;
  1142		default:
  1143			pr_warn_once("Unknown ETM architecture: %x\n",
> 1144				     devarch & ETM_DEVARCH_ID_MASK);
  1145			return false;
  1146		}
  1147		drvdata->arch = etm_devarch_to_arch(devarch);
  1148		*csa = CSDEV_ACCESS_IOMEM(drvdata->base);
  1149		return true;
  1150	}
  1151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
