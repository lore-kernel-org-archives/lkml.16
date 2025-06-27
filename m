Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC624DD13
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012618; cv=none; b=PpXOOvVcKAlbqmq0xV6ww0GB+O71FmZxl4w4jrFCGswo0+S89TwuAMe4gv7M25qwvPSxuAhSv93zGkUanortd21olKVr0RQqZuGhloQqC2JQgRbmXzcOIN+4vZCD5Ui4wtauK8crwg7JwG2MbiCU29YK0XcHKheoeVoI+qkdlqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012618; c=relaxed/simple;
	bh=9rQ3tqqqZ3QnZXp5IXhr5nd7+dKtIKHu0b6YklZDxRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWjcadIOVLKigq7fjq08nHKbW2CgTIl1OiyYp0f9IrXRUVxm4laHLeASkZEQJxg7FCUQPq6Y/rpvbqe9aIWFRQ/a1buig19aRvk1stg/YO/fLoxmUZHtDRHlEGyGd68FOTyKAPxS1aOrWD/F+BfMU5Hlf3g/HwxdqSVo0VMI3s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZEqoSwD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZEqoSwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751012614; x=1782548614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rQ3tqqqZ3QnZXp5IXhr5nd7+dKtIKHu0b6YklZDxRg=;
  b=aZEqoSwDosmKOlCuTsnSnaBeZh9di+LjDCYhEc8iKKG3ZDTDZiXJguVg
   FJ4DP/gMFJwc+9O4pigxbtd/WxWnh8pQrDHuHpJJGIyEv1I03w9cOtg3C
   emfVpb2vmf1f8KGjPUj8NdkVCDdJ1h3BAyUdQCh1KARCe5btnIcWg6SbZ
   qAJRhkZqh8ZVdAEOmY8GREozK3ODrvFDPS70gG2XTrFyifCAalQE1G0U6
   sLuGGjVebiaP5W51EtC50+Rd6NSpE8o0FEdKcGE2id4Sp2lDgZVvTuwAX
   j2Cwj0TGXgdxvsoJ7uBjFcQ28nK8TFU2sn49LpOhxNxYNlVu3TFADxgOM
   Q==;
X-CSE-ConnectionGUID: 5nio5ohYTcSFSER2XXq3eQ==
X-CSE-MsgGUID: 1SKLSa34QTaqtnpNcoHEUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64760907"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64760907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:23:34 -0700
X-CSE-ConnectionGUID: dObNU+UMROOljaeXyXdv+A==
X-CSE-MsgGUID: ofICGqSOSTSWx0iYPAVrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183784778"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 01:23:33 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV4Ms-0000dn-1F;
	Fri, 27 Jun 2025 08:23:30 +0000
Date: Fri, 27 Jun 2025 10:23:13 +0200
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: include/asm-generic/io.h:549:31: warning: performing pointer
 arithmetic on a null pointer has undefined behavior
Message-ID: <202506271049.MtzHqdSd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f2a71a99ebd5dfaa7948a2e9c59eae94b741bd8
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   8 weeks ago
config: um-randconfig-2006-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271049.MtzHqdSd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271049.MtzHqdSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271049.MtzHqdSd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 21.0.0
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   549 |         val = __raw_readb(PCI_IOBASE + addr);
   |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
   |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
   |                                                   ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
   |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
   |                                                   ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
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
   12 warnings generated.
>> clang diag: include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> clang diag: include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> clang diag: include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
   --> rust/kernel/block/mq/operations.rs:15:33
   |
   15 | use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Ordering};
   |                                 ^^^^^^^^^^^^^^---------
   |                                 |             |
   |                                 |             help: a similar name exists in the module: `AtomicU32`
   |                                 no `AtomicU64` in `sync::atomic`


vim +549 include/asm-generic/io.h

3f7e212df82ca0 Arnd Bergmann   2009-05-13  534  
9216efafc52ff9 Thierry Reding  2014-10-01  535  /*
9216efafc52ff9 Thierry Reding  2014-10-01  536   * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
9216efafc52ff9 Thierry Reding  2014-10-01  537   * implemented on hardware that needs an additional delay for I/O accesses to
9216efafc52ff9 Thierry Reding  2014-10-01  538   * take effect.
9216efafc52ff9 Thierry Reding  2014-10-01  539   */
9216efafc52ff9 Thierry Reding  2014-10-01  540  
f009c89df79abe John Garry      2020-03-28  541  #if !defined(inb) && !defined(_inb)
f009c89df79abe John Garry      2020-03-28  542  #define _inb _inb
6f043e75744596 Niklas Schnelle 2024-10-24  543  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  544  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  545  {
87fe2d543f8173 Sinan Kaya      2018-04-05  546  	u8 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  547  
87fe2d543f8173 Sinan Kaya      2018-04-05  548  	__io_pbr();
87fe2d543f8173 Sinan Kaya      2018-04-05 @549  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon     2019-02-22  550  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  551  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  552  }
6f043e75744596 Niklas Schnelle 2024-10-24  553  #else
6f043e75744596 Niklas Schnelle 2024-10-24  554  u8 _inb(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  555  	__compiletime_error("inb()) requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  556  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  557  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  558  

:::::: The code at line 549 was first introduced by commit
:::::: 87fe2d543f817300e13f0ea683f38c122737856e io: change inX() to have their own IO barrier overrides

:::::: TO: Sinan Kaya <okaya@codeaurora.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
