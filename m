Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2123AB85
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750309336; cv=none; b=lHEVVEINXn8EaKvC8VqEYdZZmj89M04W626GIactkicmHwdpELtxrlVz6FavydGXzmWCIw38RVW/7hg8wrbXg14uQugO02nMDANcIV88bfjI+u/pdWrNiCR39RVopuFUYWEittxhDV90Ic9lkSWpeYqr4NZByuvmAC1pV1AaEWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750309336; c=relaxed/simple;
	bh=9x7iMBy5QnGQ2vLlvKMD1QiBOUQXCh07F6RetP68VRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oBE4f2dMKrRbv5dJiNZg+wEdro/a7wtisXT5n2wc+VUFeK+mwu2FJJht+iZS5kyA7UJYk4BsksVboMNvQY6UHSxI3CKXPsIS41Z/yYJJcsRLvd15aUkrNUUoYLsFxgVz0z5Lx2j5gkSPDvFv2lofX+8KWjcQDnGWNp7S2kkVvnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWVdXBRH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWVdXBRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750309335; x=1781845335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9x7iMBy5QnGQ2vLlvKMD1QiBOUQXCh07F6RetP68VRY=;
  b=IWVdXBRHzcPFuJ23oYLCPO6346F0K4w9CCuu6ZRzi3KPPHWU947+nIHX
   n6gZrEd5KrJt3YQVFPHgPttvA9TKn2fyyXaSER4XvrCUsULz514BRTHl4
   nC73rhh0RNkLhGJUVuQ4PUKDpGbO1ZwLv/giZx6kobHR0+vHnXKfec42A
   KzZR0a3EqP/F8JxJkOHtlhXFJtNeZu3hM1Ux8aL5XsEt9PFCT5yt5hdmY
   aIT3KSCMoPyGn35CZl9nGE7nYRAyE05NEsHemtz8yhamUTFNR3HKLZbNj
   qrZO3IfwKtqu49MTLSHqDsMINWeDom82wE7YPywqSWhFnPutnD+rFu8DB
   Q==;
X-CSE-ConnectionGUID: u8ltDbHnSEyzpfI/YRGyTA==
X-CSE-MsgGUID: 3TawHXCSQGW5wpQuPmEMXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="55181252"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="55181252"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:02:14 -0700
X-CSE-ConnectionGUID: BvCfa9TfTWq40CIerBDo4Q==
X-CSE-MsgGUID: 8dyxdArPSsu74t9GX88vWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="181520076"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jun 2025 22:02:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS7Pe-000KPo-1R;
	Thu, 19 Jun 2025 05:02:10 +0000
Date: Thu, 19 Jun 2025 13:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/staging/gpib/eastwood/fluke_gpib.c:1013:21: error: call to
 undeclared function 'ioremap'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202506191259.pBMukkCC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fb4d33ab452ea254e2c319bac5703d1b56d895bf
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   8 months ago
config: s390-randconfig-r132-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191259.pBMukkCC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250619/202506191259.pBMukkCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191259.pBMukkCC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/gpib/eastwood/fluke_gpib.c:10:
   In file included from drivers/staging/gpib/eastwood/fluke_gpib.h:9:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/staging/gpib/eastwood/fluke_gpib.c:10:
   In file included from drivers/staging/gpib/eastwood/fluke_gpib.h:9:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/staging/gpib/eastwood/fluke_gpib.c:10:
   In file included from drivers/staging/gpib/eastwood/fluke_gpib.h:9:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not used [-Wunused-but-set-variable]
     196 |         struct nec7210_priv *nec_priv;
         |                              ^
>> drivers/staging/gpib/eastwood/fluke_gpib.c:1013:21: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1013 |         nec_priv->iobase = ioremap(e_priv->gpib_iomem_res->start,
         |                            ^
   drivers/staging/gpib/eastwood/fluke_gpib.c:1013:19: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    1013 |         nec_priv->iobase = ioremap(e_priv->gpib_iomem_res->start,
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1014 |                                    resource_size(e_priv->gpib_iomem_res));
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/eastwood/fluke_gpib.c:1050:33: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    1050 |         e_priv->write_transfer_counter = ioremap(e_priv->write_transfer_counter_res->start,
         |                                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1051 |                                                  resource_size(e_priv->write_transfer_counter_res));
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings and 3 errors generated.


vim +/ioremap +1013 drivers/staging/gpib/eastwood/fluke_gpib.c

55936779f49612 Dave Penkler 2024-09-18   973  
55936779f49612 Dave Penkler 2024-09-18   974  static int fluke_attach_impl(gpib_board_t *board, const gpib_board_config_t *config,
55936779f49612 Dave Penkler 2024-09-18   975  			     unsigned int handshake_mode)
55936779f49612 Dave Penkler 2024-09-18   976  {
55936779f49612 Dave Penkler 2024-09-18   977  	struct fluke_priv *e_priv;
55936779f49612 Dave Penkler 2024-09-18   978  	struct nec7210_priv *nec_priv;
55936779f49612 Dave Penkler 2024-09-18   979  	int isr_flags = 0;
55936779f49612 Dave Penkler 2024-09-18   980  	int retval;
55936779f49612 Dave Penkler 2024-09-18   981  	int irq;
55936779f49612 Dave Penkler 2024-09-18   982  	struct resource *res;
55936779f49612 Dave Penkler 2024-09-18   983  	dma_cap_mask_t dma_cap;
55936779f49612 Dave Penkler 2024-09-18   984  
55936779f49612 Dave Penkler 2024-09-18   985  	if (!fluke_gpib_pdev) {
55936779f49612 Dave Penkler 2024-09-18   986  		pr_err("No gpib platform device was found, attach failed.\n");
55936779f49612 Dave Penkler 2024-09-18   987  		return -ENODEV;
55936779f49612 Dave Penkler 2024-09-18   988  	}
55936779f49612 Dave Penkler 2024-09-18   989  
55936779f49612 Dave Penkler 2024-09-18   990  	retval = fluke_generic_attach(board);
55936779f49612 Dave Penkler 2024-09-18   991  	if (retval)
55936779f49612 Dave Penkler 2024-09-18   992  		return retval;
55936779f49612 Dave Penkler 2024-09-18   993  
55936779f49612 Dave Penkler 2024-09-18   994  	e_priv = board->private_data;
55936779f49612 Dave Penkler 2024-09-18   995  	nec_priv = &e_priv->nec7210_priv;
55936779f49612 Dave Penkler 2024-09-18   996  	nec_priv->offset = fluke_reg_offset;
55936779f49612 Dave Penkler 2024-09-18   997  	board->dev = &fluke_gpib_pdev->dev;
55936779f49612 Dave Penkler 2024-09-18   998  
55936779f49612 Dave Penkler 2024-09-18   999  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 0);
55936779f49612 Dave Penkler 2024-09-18  1000  	if (!res) {
55936779f49612 Dave Penkler 2024-09-18  1001  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource for cb7210 gpib\n");
55936779f49612 Dave Penkler 2024-09-18  1002  		return -ENODEV;
55936779f49612 Dave Penkler 2024-09-18  1003  	}
55936779f49612 Dave Penkler 2024-09-18  1004  
55936779f49612 Dave Penkler 2024-09-18  1005  	if (request_mem_region(res->start,
55936779f49612 Dave Penkler 2024-09-18  1006  			       resource_size(res),
55936779f49612 Dave Penkler 2024-09-18  1007  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 Dave Penkler 2024-09-18  1008  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 Dave Penkler 2024-09-18  1009  		return -ENXIO;
55936779f49612 Dave Penkler 2024-09-18  1010  	}
55936779f49612 Dave Penkler 2024-09-18  1011  	e_priv->gpib_iomem_res = res;
55936779f49612 Dave Penkler 2024-09-18  1012  
55936779f49612 Dave Penkler 2024-09-18 @1013  	nec_priv->iobase = ioremap(e_priv->gpib_iomem_res->start,
55936779f49612 Dave Penkler 2024-09-18  1014  				   resource_size(e_priv->gpib_iomem_res));
55936779f49612 Dave Penkler 2024-09-18  1015  	pr_info("gpib: iobase %lx remapped to %p, length=%d\n",
55936779f49612 Dave Penkler 2024-09-18  1016  		(unsigned long)e_priv->gpib_iomem_res->start,
55936779f49612 Dave Penkler 2024-09-18  1017  		nec_priv->iobase, (int)resource_size(e_priv->gpib_iomem_res));
55936779f49612 Dave Penkler 2024-09-18  1018  	if (!nec_priv->iobase) {
55936779f49612 Dave Penkler 2024-09-18  1019  		dev_err(&fluke_gpib_pdev->dev, "Could not map I/O memory\n");
55936779f49612 Dave Penkler 2024-09-18  1020  		return -ENOMEM;
55936779f49612 Dave Penkler 2024-09-18  1021  	}
55936779f49612 Dave Penkler 2024-09-18  1022  
55936779f49612 Dave Penkler 2024-09-18  1023  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 1);
55936779f49612 Dave Penkler 2024-09-18  1024  	if (!res) {
55936779f49612 Dave Penkler 2024-09-18  1025  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource for gpib dma port\n");
55936779f49612 Dave Penkler 2024-09-18  1026  		return -ENODEV;
55936779f49612 Dave Penkler 2024-09-18  1027  	}
55936779f49612 Dave Penkler 2024-09-18  1028  	if (request_mem_region(res->start,
55936779f49612 Dave Penkler 2024-09-18  1029  			       resource_size(res),
55936779f49612 Dave Penkler 2024-09-18  1030  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 Dave Penkler 2024-09-18  1031  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 Dave Penkler 2024-09-18  1032  		return -ENXIO;
55936779f49612 Dave Penkler 2024-09-18  1033  	}
55936779f49612 Dave Penkler 2024-09-18  1034  	e_priv->dma_port_res = res;
55936779f49612 Dave Penkler 2024-09-18  1035  
55936779f49612 Dave Penkler 2024-09-18  1036  	res = platform_get_resource(fluke_gpib_pdev, IORESOURCE_MEM, 2);
55936779f49612 Dave Penkler 2024-09-18  1037  	if (!res) {
55936779f49612 Dave Penkler 2024-09-18  1038  		dev_err(&fluke_gpib_pdev->dev, "Unable to locate mmio resource for write transfer counter\n");
55936779f49612 Dave Penkler 2024-09-18  1039  		return -ENODEV;
55936779f49612 Dave Penkler 2024-09-18  1040  	}
55936779f49612 Dave Penkler 2024-09-18  1041  
55936779f49612 Dave Penkler 2024-09-18  1042  	if (request_mem_region(res->start,
55936779f49612 Dave Penkler 2024-09-18  1043  			       resource_size(res),
55936779f49612 Dave Penkler 2024-09-18  1044  			       fluke_gpib_pdev->name) == NULL) {
55936779f49612 Dave Penkler 2024-09-18  1045  		dev_err(&fluke_gpib_pdev->dev, "cannot claim registers\n");
55936779f49612 Dave Penkler 2024-09-18  1046  		return -ENXIO;
55936779f49612 Dave Penkler 2024-09-18  1047  	}
55936779f49612 Dave Penkler 2024-09-18  1048  	e_priv->write_transfer_counter_res = res;
55936779f49612 Dave Penkler 2024-09-18  1049  
55936779f49612 Dave Penkler 2024-09-18  1050  	e_priv->write_transfer_counter = ioremap(e_priv->write_transfer_counter_res->start,
55936779f49612 Dave Penkler 2024-09-18  1051  						 resource_size(e_priv->write_transfer_counter_res));
55936779f49612 Dave Penkler 2024-09-18  1052  	pr_info("gpib: write transfer counter %lx remapped to %p, length=%d\n",
55936779f49612 Dave Penkler 2024-09-18  1053  		(unsigned long)e_priv->write_transfer_counter_res->start,
55936779f49612 Dave Penkler 2024-09-18  1054  		e_priv->write_transfer_counter,
55936779f49612 Dave Penkler 2024-09-18  1055  		(int)resource_size(e_priv->write_transfer_counter_res));
55936779f49612 Dave Penkler 2024-09-18  1056  	if (!e_priv->write_transfer_counter) {
55936779f49612 Dave Penkler 2024-09-18  1057  		dev_err(&fluke_gpib_pdev->dev, "Could not map I/O memory\n");
55936779f49612 Dave Penkler 2024-09-18  1058  		return -ENOMEM;
55936779f49612 Dave Penkler 2024-09-18  1059  	}
55936779f49612 Dave Penkler 2024-09-18  1060  
55936779f49612 Dave Penkler 2024-09-18  1061  	irq = platform_get_irq(fluke_gpib_pdev, 0);
55936779f49612 Dave Penkler 2024-09-18  1062  	pr_info("gpib: irq %d\n", irq);
55936779f49612 Dave Penkler 2024-09-18  1063  	if (irq < 0) {
55936779f49612 Dave Penkler 2024-09-18  1064  		dev_err(&fluke_gpib_pdev->dev, "fluke_gpib: request for IRQ failed\n");
55936779f49612 Dave Penkler 2024-09-18  1065  		return -EBUSY;
55936779f49612 Dave Penkler 2024-09-18  1066  	}
55936779f49612 Dave Penkler 2024-09-18  1067  	retval = request_irq(irq, fluke_gpib_interrupt, isr_flags, fluke_gpib_pdev->name, board);
55936779f49612 Dave Penkler 2024-09-18  1068  	if (retval) {
55936779f49612 Dave Penkler 2024-09-18  1069  		dev_err(&fluke_gpib_pdev->dev,
55936779f49612 Dave Penkler 2024-09-18  1070  			"cannot register interrupt handler err=%d\n",
55936779f49612 Dave Penkler 2024-09-18  1071  			retval);
55936779f49612 Dave Penkler 2024-09-18  1072  		return retval;
55936779f49612 Dave Penkler 2024-09-18  1073  	}
55936779f49612 Dave Penkler 2024-09-18  1074  	e_priv->irq = irq;
55936779f49612 Dave Penkler 2024-09-18  1075  
55936779f49612 Dave Penkler 2024-09-18  1076  	dma_cap_zero(dma_cap);
55936779f49612 Dave Penkler 2024-09-18  1077  	dma_cap_set(DMA_SLAVE, dma_cap);
55936779f49612 Dave Penkler 2024-09-18  1078  	e_priv->dma_channel = dma_request_channel(dma_cap, gpib_dma_channel_filter, NULL);
55936779f49612 Dave Penkler 2024-09-18  1079  	if (!e_priv->dma_channel) {
55936779f49612 Dave Penkler 2024-09-18  1080  		pr_err("fluke_gpib: failed to allocate a dma channel.\n");
55936779f49612 Dave Penkler 2024-09-18  1081  		// we don't error out here because unaccel interface will still
55936779f49612 Dave Penkler 2024-09-18  1082  		// work without dma
55936779f49612 Dave Penkler 2024-09-18  1083  	}
55936779f49612 Dave Penkler 2024-09-18  1084  
55936779f49612 Dave Penkler 2024-09-18  1085  	return fluke_init(e_priv, board, handshake_mode);
55936779f49612 Dave Penkler 2024-09-18  1086  }
55936779f49612 Dave Penkler 2024-09-18  1087  

:::::: The code at line 1013 was first introduced by commit
:::::: 55936779f4961299efa99a6843c8ff3b019d3858 staging: gpib: Add Fluke cda based cards GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
