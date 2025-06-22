Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C2EED7
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 03:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750561436; cv=none; b=cBn0ySQqzXKnpmT4FGNF2Bl3qwY01N9+U9DXIGa/iHscj+w37GIcJWaO2kf3XG4YIIyHgkxugznZW9SyHBoIQoEGVkKPJgyWcdXV4ZrBau14/0Q5HlwKuCNlRlC7obR2EIQ1PDihyatY+KPXyVtS3sxZ/VfCWbbWdalVP57hNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750561436; c=relaxed/simple;
	bh=eSJlNan9opXw8UQPksASqZR0q6dNXVok1hJkR4um+L8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UKQdEiMhCtU/KMmactM+tl+6icqZsTaMIWo8WlD1+o0O4dW4upJAmyQk7IRMw6q0JWp/JQ+fGIcaj5LcOE++GpS5w86cJr4+LUgoDqgswOM5EE2PqCvYWtE4ivD68mQ106BBg8M+xdDanoxqUoL0e1Nsy3W3FlBUwFQgrvDbSMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmvB/vj4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmvB/vj4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750561433; x=1782097433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eSJlNan9opXw8UQPksASqZR0q6dNXVok1hJkR4um+L8=;
  b=YmvB/vj4C6LlTjBdzvLaWx/KsBnaNOKt9XHVq4qL97BNhRzmB3wMW7dZ
   4JjtUEg5+OqySZFtcXY6mNYXzwXaq/1JwUYVH6+Nua89eLZqlIvqRnw5s
   laJZJOpwQPL1TBSzNrDXo3U596fHXPVZgUiAHawdiZh+KMg9IC5t5BWbk
   ZArFEgSal/DPTTaKv+eQktLy19/AOcXpDcIthR5qRkIOXj33kmTyUm0pc
   v0Vsg+kj/+hBk5i17DOuqo2iQ5E+KeiBiSdDrPQFX+BzLdxY9N1locckc
   pIZYV8jAMy5OE4DSfQ0S+nqXWDQYoJoPDxrpUDs/YxR7wmY+Eoq/kC034
   g==;
X-CSE-ConnectionGUID: Jx0Ql67qRs+J3j5WjS+uJA==
X-CSE-MsgGUID: UBCQb8zRTSSUGXb6pHNmjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="75321043"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="75321043"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 20:03:52 -0700
X-CSE-ConnectionGUID: fKM5K1GMQhuKr+VHCY+TGA==
X-CSE-MsgGUID: 4+vT3/6DTJahdqjikFpb6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="188486702"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jun 2025 20:03:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTAzk-000N0O-00;
	Sun, 22 Jun 2025 03:03:48 +0000
Date: Sun, 22 Jun 2025 11:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/drivers/vector_kern.c:1592:13: warning: stack frame size
 (1464) exceeds limit (1024) in 'vector_eth_configure'
Message-ID: <202506221017.WtB7Usua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   739a6c93cc755c0daf3a7e57e018a8c61047cd90
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
date:   7 weeks ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250622/202506221017.WtB7Usua-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221017.WtB7Usua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221017.WtB7Usua-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/drivers/vector_kern.c:11:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/um/drivers/vector_kern.c:11:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/um/drivers/vector_kern.c:11:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> arch/um/drivers/vector_kern.c:1592:13: warning: stack frame size (1464) exceeds limit (1024) in 'vector_eth_configure' [-Wframe-larger-than]
    1592 | static void vector_eth_configure(
         |             ^
   13 warnings generated.


vim +/vector_eth_configure +1592 arch/um/drivers/vector_kern.c

b35507a4cfb26b Anton Ivanov 2022-01-21  1591  
49da7e64f33e80 Anton Ivanov 2017-11-20 @1592  static void vector_eth_configure(
49da7e64f33e80 Anton Ivanov 2017-11-20  1593  		int n,
49da7e64f33e80 Anton Ivanov 2017-11-20  1594  		struct arglist *def
49da7e64f33e80 Anton Ivanov 2017-11-20  1595  	)
49da7e64f33e80 Anton Ivanov 2017-11-20  1596  {
49da7e64f33e80 Anton Ivanov 2017-11-20  1597  	struct vector_device *device;
49da7e64f33e80 Anton Ivanov 2017-11-20  1598  	struct net_device *dev;
49da7e64f33e80 Anton Ivanov 2017-11-20  1599  	struct vector_private *vp;
49da7e64f33e80 Anton Ivanov 2017-11-20  1600  	int err;
49da7e64f33e80 Anton Ivanov 2017-11-20  1601  
49da7e64f33e80 Anton Ivanov 2017-11-20  1602  	device = kzalloc(sizeof(*device), GFP_KERNEL);
49da7e64f33e80 Anton Ivanov 2017-11-20  1603  	if (device == NULL) {
49da7e64f33e80 Anton Ivanov 2017-11-20  1604  		printk(KERN_ERR "eth_configure failed to allocate struct "
49da7e64f33e80 Anton Ivanov 2017-11-20  1605  				 "vector_device\n");
49da7e64f33e80 Anton Ivanov 2017-11-20  1606  		return;
49da7e64f33e80 Anton Ivanov 2017-11-20  1607  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  1608  	dev = alloc_etherdev(sizeof(struct vector_private));
49da7e64f33e80 Anton Ivanov 2017-11-20  1609  	if (dev == NULL) {
49da7e64f33e80 Anton Ivanov 2017-11-20  1610  		printk(KERN_ERR "eth_configure: failed to allocate struct "
49da7e64f33e80 Anton Ivanov 2017-11-20  1611  				 "net_device for vec%d\n", n);
49da7e64f33e80 Anton Ivanov 2017-11-20  1612  		goto out_free_device;
49da7e64f33e80 Anton Ivanov 2017-11-20  1613  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  1614  
49da7e64f33e80 Anton Ivanov 2017-11-20  1615  	dev->mtu = get_mtu(def);
49da7e64f33e80 Anton Ivanov 2017-11-20  1616  
49da7e64f33e80 Anton Ivanov 2017-11-20  1617  	INIT_LIST_HEAD(&device->list);
49da7e64f33e80 Anton Ivanov 2017-11-20  1618  	device->unit = n;
49da7e64f33e80 Anton Ivanov 2017-11-20  1619  
49da7e64f33e80 Anton Ivanov 2017-11-20  1620  	/* If this name ends up conflicting with an existing registered
49da7e64f33e80 Anton Ivanov 2017-11-20  1621  	 * netdevice, that is OK, register_netdev{,ice}() will notice this
49da7e64f33e80 Anton Ivanov 2017-11-20  1622  	 * and fail.
49da7e64f33e80 Anton Ivanov 2017-11-20  1623  	 */
49da7e64f33e80 Anton Ivanov 2017-11-20  1624  	snprintf(dev->name, sizeof(dev->name), "vec%d", n);
b555cb66583e99 Tiwei Bie    2025-05-03  1625  	vector_setup_etheraddr(dev, uml_vector_fetch_arg(def, "mac"));
49da7e64f33e80 Anton Ivanov 2017-11-20  1626  	vp = netdev_priv(dev);
49da7e64f33e80 Anton Ivanov 2017-11-20  1627  
49da7e64f33e80 Anton Ivanov 2017-11-20  1628  	/* sysfs register */
49da7e64f33e80 Anton Ivanov 2017-11-20  1629  	if (!driver_registered) {
49da7e64f33e80 Anton Ivanov 2017-11-20  1630  		platform_driver_register(&uml_net_driver);
49da7e64f33e80 Anton Ivanov 2017-11-20  1631  		driver_registered = 1;
49da7e64f33e80 Anton Ivanov 2017-11-20  1632  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  1633  	device->pdev.id = n;
49da7e64f33e80 Anton Ivanov 2017-11-20  1634  	device->pdev.name = DRIVER_NAME;
49da7e64f33e80 Anton Ivanov 2017-11-20  1635  	device->pdev.dev.release = vector_device_release;
49da7e64f33e80 Anton Ivanov 2017-11-20  1636  	dev_set_drvdata(&device->pdev.dev, device);
49da7e64f33e80 Anton Ivanov 2017-11-20  1637  	if (platform_device_register(&device->pdev))
49da7e64f33e80 Anton Ivanov 2017-11-20  1638  		goto out_free_netdev;
49da7e64f33e80 Anton Ivanov 2017-11-20  1639  	SET_NETDEV_DEV(dev, &device->pdev.dev);
49da7e64f33e80 Anton Ivanov 2017-11-20  1640  
49da7e64f33e80 Anton Ivanov 2017-11-20  1641  	device->dev = dev;
49da7e64f33e80 Anton Ivanov 2017-11-20  1642  
49da7e64f33e80 Anton Ivanov 2017-11-20  1643  	*vp = ((struct vector_private)
49da7e64f33e80 Anton Ivanov 2017-11-20  1644  		{
49da7e64f33e80 Anton Ivanov 2017-11-20  1645  		.list			= LIST_HEAD_INIT(vp->list),
49da7e64f33e80 Anton Ivanov 2017-11-20  1646  		.dev			= dev,
49da7e64f33e80 Anton Ivanov 2017-11-20  1647  		.unit			= n,
49da7e64f33e80 Anton Ivanov 2017-11-20  1648  		.options		= get_transport_options(def),
49da7e64f33e80 Anton Ivanov 2017-11-20  1649  		.rx_irq			= 0,
49da7e64f33e80 Anton Ivanov 2017-11-20  1650  		.tx_irq			= 0,
49da7e64f33e80 Anton Ivanov 2017-11-20  1651  		.parsed			= def,
49da7e64f33e80 Anton Ivanov 2017-11-20  1652  		.max_packet		= get_mtu(def) + ETH_HEADER_OTHER,
49da7e64f33e80 Anton Ivanov 2017-11-20  1653  		/* TODO - we need to calculate headroom so that ip header
49da7e64f33e80 Anton Ivanov 2017-11-20  1654  		 * is 16 byte aligned all the time
49da7e64f33e80 Anton Ivanov 2017-11-20  1655  		 */
49da7e64f33e80 Anton Ivanov 2017-11-20  1656  		.headroom		= get_headroom(def),
49da7e64f33e80 Anton Ivanov 2017-11-20  1657  		.form_header		= NULL,
49da7e64f33e80 Anton Ivanov 2017-11-20  1658  		.verify_header		= NULL,
49da7e64f33e80 Anton Ivanov 2017-11-20  1659  		.header_rxbuffer	= NULL,
49da7e64f33e80 Anton Ivanov 2017-11-20  1660  		.header_txbuffer	= NULL,
49da7e64f33e80 Anton Ivanov 2017-11-20  1661  		.header_size		= 0,
49da7e64f33e80 Anton Ivanov 2017-11-20  1662  		.rx_header_size		= 0,
49da7e64f33e80 Anton Ivanov 2017-11-20  1663  		.rexmit_scheduled	= false,
49da7e64f33e80 Anton Ivanov 2017-11-20  1664  		.opened			= false,
49da7e64f33e80 Anton Ivanov 2017-11-20  1665  		.transport_data		= NULL,
49da7e64f33e80 Anton Ivanov 2017-11-20  1666  		.in_write_poll		= false,
49da7e64f33e80 Anton Ivanov 2017-11-20  1667  		.coalesce		= 2,
d47761db97d35c Anton Ivanov 2019-08-09  1668  		.req_size		= get_req_size(def),
9807019a62dc67 Anton Ivanov 2019-10-02  1669  		.in_error		= false,
9807019a62dc67 Anton Ivanov 2019-10-02  1670  		.bpf			= NULL
49da7e64f33e80 Anton Ivanov 2017-11-20  1671  	});
49da7e64f33e80 Anton Ivanov 2017-11-20  1672  
49da7e64f33e80 Anton Ivanov 2017-11-20  1673  	dev->features = dev->hw_features = (NETIF_F_SG | NETIF_F_FRAGLIST);
49da7e64f33e80 Anton Ivanov 2017-11-20  1674  	INIT_WORK(&vp->reset_tx, vector_reset_tx);
49da7e64f33e80 Anton Ivanov 2017-11-20  1675  
ce471fdbc6173e Anton Ivanov 2018-03-05  1676  	timer_setup(&vp->tl, vector_timer_expire, 0);
49da7e64f33e80 Anton Ivanov 2017-11-20  1677  
49da7e64f33e80 Anton Ivanov 2017-11-20  1678  	/* FIXME */
49da7e64f33e80 Anton Ivanov 2017-11-20  1679  	dev->netdev_ops = &vector_netdev_ops;
49da7e64f33e80 Anton Ivanov 2017-11-20  1680  	dev->ethtool_ops = &vector_net_ethtool_ops;
49da7e64f33e80 Anton Ivanov 2017-11-20  1681  	dev->watchdog_timeo = (HZ >> 1);
49da7e64f33e80 Anton Ivanov 2017-11-20  1682  	/* primary IRQ - fixme */
49da7e64f33e80 Anton Ivanov 2017-11-20  1683  	dev->irq = 0; /* we will adjust this once opened */
49da7e64f33e80 Anton Ivanov 2017-11-20  1684  
49da7e64f33e80 Anton Ivanov 2017-11-20  1685  	rtnl_lock();
49da7e64f33e80 Anton Ivanov 2017-11-20  1686  	err = register_netdevice(dev);
49da7e64f33e80 Anton Ivanov 2017-11-20  1687  	rtnl_unlock();
49da7e64f33e80 Anton Ivanov 2017-11-20  1688  	if (err)
49da7e64f33e80 Anton Ivanov 2017-11-20  1689  		goto out_undo_user_init;
49da7e64f33e80 Anton Ivanov 2017-11-20  1690  
49da7e64f33e80 Anton Ivanov 2017-11-20  1691  	spin_lock(&vector_devices_lock);
49da7e64f33e80 Anton Ivanov 2017-11-20  1692  	list_add(&device->list, &vector_devices);
49da7e64f33e80 Anton Ivanov 2017-11-20  1693  	spin_unlock(&vector_devices_lock);
49da7e64f33e80 Anton Ivanov 2017-11-20  1694  
49da7e64f33e80 Anton Ivanov 2017-11-20  1695  	return;
49da7e64f33e80 Anton Ivanov 2017-11-20  1696  
49da7e64f33e80 Anton Ivanov 2017-11-20  1697  out_undo_user_init:
49da7e64f33e80 Anton Ivanov 2017-11-20  1698  	return;
49da7e64f33e80 Anton Ivanov 2017-11-20  1699  out_free_netdev:
49da7e64f33e80 Anton Ivanov 2017-11-20  1700  	free_netdev(dev);
49da7e64f33e80 Anton Ivanov 2017-11-20  1701  out_free_device:
49da7e64f33e80 Anton Ivanov 2017-11-20  1702  	kfree(device);
49da7e64f33e80 Anton Ivanov 2017-11-20  1703  }
49da7e64f33e80 Anton Ivanov 2017-11-20  1704  

:::::: The code at line 1592 was first introduced by commit
:::::: 49da7e64f33e80edffb1a9eeb230fa4c3f42dffb High Performance UML Vector Network Driver

:::::: TO: Anton Ivanov <anton.ivanov@cambridgegreys.com>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
