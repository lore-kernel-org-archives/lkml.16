Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576F0136988
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750445102; cv=none; b=rna8P/FuJk7FwK7zuhaH/KN3Bm7TL7DG0IZtlMZ2UIM4Ii7/+az827ZYQZt4f7veoFdadSriiYenRFwST3zgZil+jWNK5AZKisQT3jKMVVxnTUdGzPkwgqxpn6ThgRrp3Zbyotj6gK3z2pZn/yXUKYih8cs/o6qiLqXTWivEF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750445102; c=relaxed/simple;
	bh=tFzOKcTfQ1YkHVKMtFqzZuzolJQlTQFSuPLWm8B24PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knD+Q2NpdanECVyz0GI18vzGsnPuSA2wGaBccg+6AuxVVvujieuV48BVUmsQPNSJc+c76bZhZMzUE/EU0Ej0YN3RwtdYDFwOY38+chzX2Fnu31DGYmJUQlhTifJMCniZsfhghWlx3Wg/7PsmIsPUT0JvW1XdX8ygrR4LkAdq/dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jv5ZMNuX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jv5ZMNuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750445102; x=1781981102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tFzOKcTfQ1YkHVKMtFqzZuzolJQlTQFSuPLWm8B24PU=;
  b=Jv5ZMNuXkma6weahfQtU4XKXwXiJ02ivaEWe7UZUhlCMe1VZ8Ftmg7Fi
   gMAOAcbJuHeqRQvQI824RitDHxfqwtOhdCcsWeUIETWerzpsFrTF9UBgK
   hVFLzv7D2njvahv2in0noaXWiD6fiTIjdVq8hQ0CbU96g/XoT6+LHctIC
   Pi+yklSIoGdSxhBn3rvgd3U0bSpE05eUJhfRza3sM8UxBgytSWbaxU6UP
   lhpeIc1apEV/5FKMVFHqSGV+U5Lg+J5g0Wh0qp9PIRwHSu1LtrRe+ddAK
   ShkoONzNHKP8poDOmidtYWh/m9p2P1uEXROrrmgTZk1vp6u2OAV5not/l
   g==;
X-CSE-ConnectionGUID: 3L/RDHbVSq2zOBNSZq+Bzg==
X-CSE-MsgGUID: 0BtvBk8ySlahRbZCT9ppWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52647017"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52647017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 11:45:01 -0700
X-CSE-ConnectionGUID: 27Peo85NRgSzNvQWq0zWuw==
X-CSE-MsgGUID: Y7tbg/eIT3yP5ZRghFZSzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="150474036"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jun 2025 11:44:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSgjO-000M4M-2S;
	Fri, 20 Jun 2025 18:44:54 +0000
Date: Sat, 21 Jun 2025 02:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v5 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core
 driver
Message-ID: <202506210231.ZWWNhofU-lkp@intel.com>
References: <82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8ffcb7560b4a15faf821df95e3ab532b2b020f8c]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250620-100856
base:   8ffcb7560b4a15faf821df95e3ab532b2b020f8c
patch link:    https://lore.kernel.org/r/82cbc8558f15981e0953ab229d2afcc5501f982c.1750301674.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v5 1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
config: x86_64-buildonly-randconfig-003-20250621 (https://download.01.org/0day-ci/archive/20250621/202506210231.ZWWNhofU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210231.ZWWNhofU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210231.ZWWNhofU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/ls2k-bmc-core.c:152:1: warning: data definition has no type or storage class
     152 | module_pci_driver(ls2k_bmc_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/ls2k-bmc-core.c:152:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Werror=implicit-int]
>> drivers/mfd/ls2k-bmc-core.c:152:1: warning: parameter names (without types) in function declaration
   drivers/mfd/ls2k-bmc-core.c:146:26: warning: 'ls2k_bmc_driver' defined but not used [-Wunused-variable]
     146 | static struct pci_driver ls2k_bmc_driver = {
         |                          ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +152 drivers/mfd/ls2k-bmc-core.c

   145	
   146	static struct pci_driver ls2k_bmc_driver = {
   147		.name = "ls2k-bmc",
   148		.id_table = ls2k_bmc_devices,
   149		.probe = ls2k_bmc_probe,
   150		.remove = ls2k_bmc_remove,
   151	};
 > 152	module_pci_driver(ls2k_bmc_driver);
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
