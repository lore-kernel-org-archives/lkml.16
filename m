Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228C30E82F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750448169; cv=none; b=RFwMpTKFxolPJnYZSsnHochqzT77s731HSuMeKMEdI5z0wzsNScVWqqt9wse7VmG/k3MIh0PsjYU2ncSU9q/1PlYLGldS/j/FqpD7CD+ahsWVatVN+mh0NQoKFbM1a1752vyAFA0QsgisFlAgp4jrjuv6WAP83xwZrfc/KWlMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750448169; c=relaxed/simple;
	bh=8U0ApAmF5qQnF/Hc87FkoU72bmbRHVKky63vgfV7N5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNpLGT17h/pg+6HHDMz0SFIYvW/JHCFc3JLu9Hu1zpY33Ay+VWv9Yyi4uuu+rcBKKgKUTLhZPzE+X+gf1YWeYZ4gHptou5mShIlejIBKcbKpvkT/Et8kheC3nfWtJw4u+EvGoZaWGBxe+AcaNNOhv3cJg2Ax4rftmihI3+LWquY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CP5qdagT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CP5qdagT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750448166; x=1781984166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8U0ApAmF5qQnF/Hc87FkoU72bmbRHVKky63vgfV7N5s=;
  b=CP5qdagTc0T7bgp0IJObXGB+Vj/XkpcWXf7FHNdxUEodLgzNhYeRPzNT
   Ck09YIeMmRcMAEN29XagNpbk3u7aHNVExsfDxTh/L6zER+MWEkbpUrQPD
   FjXoDJ/f6OZdVGg7s0//pP+FTOhFMAH/icuriMVT3gp9S81oP2V0q+FUK
   td9x9YhoDDIvUZLsyeC5322phJ6mQNwT/Qml/w08xeaF2G1h9EmjmG8oP
   UOHWOUSaP+XeqooFehRbN/b5DTqM+pw3v8xWnAAuiqmFsVlh3mTNfZc2h
   QnUp6YvsSvpD/4MNlUlI9aCFoUw9m03eiWtk86drBqWA32SGBcRsGJ4a1
   g==;
X-CSE-ConnectionGUID: tK8uFejxSZmNSh5inRUIrg==
X-CSE-MsgGUID: 9upjRQfqSTiUmRvHLXvX4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63404313"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="63404313"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 12:36:05 -0700
X-CSE-ConnectionGUID: NUv5Vzu4SV+K2m1kfwhYqQ==
X-CSE-MsgGUID: +UYhgqZcTqKvo2GUGOcCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="150423021"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jun 2025 12:36:03 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uShWq-000M6A-0I;
	Fri, 20 Jun 2025 19:36:00 +0000
Date: Sat, 21 Jun 2025 03:35:58 +0800
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
Subject: Re: [PATCH v5 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function
 support
Message-ID: <202506210343.XCHkzorp-lkp@intel.com>
References: <174677c13e41140e19a62dd01b9502aaa7fae669.1750301674.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174677c13e41140e19a62dd01b9502aaa7fae669.1750301674.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8ffcb7560b4a15faf821df95e3ab532b2b020f8c]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250620-100856
base:   8ffcb7560b4a15faf821df95e3ab532b2b020f8c
patch link:    https://lore.kernel.org/r/174677c13e41140e19a62dd01b9502aaa7fae669.1750301674.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v5 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250621/202506210343.XCHkzorp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210343.XCHkzorp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210343.XCHkzorp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/ls2k-bmc-core.c: In function 'ls2k_bmc_pcie_is_connected':
>> drivers/mfd/ls2k-bmc-core.c:156:16: error: implicit declaration of function 'pci_iomap'; did you mean 'pcim_iomap'? [-Wimplicit-function-declaration]
     156 |         base = pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
         |                ^~~~~~~~~
         |                pcim_iomap
>> drivers/mfd/ls2k-bmc-core.c:156:14: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     156 |         base = pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
         |              ^
   In file included from include/linux/io.h:12,
                    from include/linux/iopoll.h:14,
                    from drivers/mfd/ls2k-bmc-core.c:17:
>> arch/sh/include/asm/io.h:122:21: error: implicit declaration of function 'pci_iounmap'; did you mean 'pcim_iounmap'? [-Wimplicit-function-declaration]
     122 | #define pci_iounmap pci_iounmap
         |                     ^~~~~~~~~~~
   drivers/mfd/ls2k-bmc-core.c:167:17: note: in expansion of macro 'pci_iounmap'
     167 |                 pci_iounmap(parent, base);
         |                 ^~~~~~~~~~~
   drivers/mfd/ls2k-bmc-core.c: In function 'ls2k_bmc_pdata_initial':
   drivers/mfd/ls2k-bmc-core.c:350:15: error: implicit declaration of function 'acpi_register_gsi' [-Wimplicit-function-declaration]
     350 |         irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
         |               ^~~~~~~~~~~~~~~~~
   drivers/mfd/ls2k-bmc-core.c:377:9: error: implicit declaration of function 'acpi_unregister_gsi'; did you mean 'arch_unregister_cpu'? [-Wimplicit-function-declaration]
     377 |         acpi_unregister_gsi(gsi);
         |         ^~~~~~~~~~~~~~~~~~~
         |         arch_unregister_cpu
   drivers/mfd/ls2k-bmc-core.c: At top level:
   drivers/mfd/ls2k-bmc-core.c:481:1: warning: data definition has no type or storage class
     481 | module_pci_driver(ls2k_bmc_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/mfd/ls2k-bmc-core.c:481:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
   drivers/mfd/ls2k-bmc-core.c:481:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/mfd/ls2k-bmc-core.c:475:26: warning: 'ls2k_bmc_driver' defined but not used [-Wunused-variable]
     475 | static struct pci_driver ls2k_bmc_driver = {
         |                          ^~~~~~~~~~~~~~~


vim +156 drivers/mfd/ls2k-bmc-core.c

   150	
   151	static bool ls2k_bmc_pcie_is_connected(struct pci_dev *parent, struct ls2k_bmc_pdata *priv)
   152	{
   153		void __iomem *base;
   154		int sts, ret;
   155	
 > 156		base = pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
   157		if (!base)
   158			return false;
   159	
   160		writel(readl(base + LS7A_PCIE_PORT_CTL0) | LS2K_BMC_PCIE_LTSSM_ENABLE,
   161		       base + LS7A_PCIE_PORT_CTL0);
   162	
   163		ret = readl_poll_timeout_atomic(base + LS7A_PCIE_PORT_STS1, sts,
   164						(sts & LS2K_BMC_PCIE_LTSSM_STS) == LS2K_BMC_PCIE_CONNECTED,
   165						LS2K_BMC_PCIE_DELAY_US, LS2K_BMC_PCIE_TIMEOUT_US);
   166		if (ret) {
   167			pci_iounmap(parent, base);
   168			dev_err(priv->dev, "PCIE train failed status=0x%x\n", sts);
   169			return false;
   170		}
   171	
   172		pci_iounmap(parent, base);
   173		return true;
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
