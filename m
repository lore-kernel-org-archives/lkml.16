Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F341AA782
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 20:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751140822; cv=none; b=OrbQHeog97AI/NzI6/qxZBihAoJvWJ4CPQglWKfKbg6gsD82kp0Br6zFcT2Ie/zeEOfXBuVRk1cfhVVIhmYkHqAC7B78K+90dMwjhrOLYig6nqsmUIkt0YMtos7FI/ACKu2JI1HI96zTAo/G63LpOkNlSJ7BAkfWCRlAEJ6eNCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751140822; c=relaxed/simple;
	bh=Fewzt4Fd/252fQPHl/D4J7EfWkwRKK0Pnj4XMlX3kYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oz7WeLOSlJ8+lVfJrUqDJ3pAmLC5oclQK2fvooV+bODvrTa8gtP2wzOHU4LRzDC/dymX4nAZp87nVJcfJDZ0EGysoPnH5gQDPMrvwxN8eFUfiIYxk7sXj10e4lGeiNLuFEwfxr9aBFt8vY9fxGaj0iBNF8NPuZaq+AEQ0BjPQsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLz54KrL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLz54KrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751140820; x=1782676820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fewzt4Fd/252fQPHl/D4J7EfWkwRKK0Pnj4XMlX3kYo=;
  b=eLz54KrLwdv2XpSEUFUk/7g3mU6N4alDDe8pRqvRiGC0ANspG0dBJEhS
   hoPISr17VDl0ComovZVw79guvkItwyfQfptjBalaIlkJI52tE2BZG429W
   te8C4yDBZhy68mbncn4cZ5AqEk486bnfNB1HrZzsPKtAyxJBu/JWNkU4P
   cq2QduavZjZQjdBEjd8qFlmq86wWuMdDZSlnEEV3SWv7BQ+o8PjbYTtXS
   APIxqin1Di0CUPqLfsOW2QslG9BFupAHLseH/Ta3PM0T+BhYMqyelUbSV
   Wf0TAs3qpTNlRP05SH5YsQFqCVZ62llEuUYQ456ruvY5ee9NzMoAQo/jQ
   w==;
X-CSE-ConnectionGUID: 0j8dWhH1TQ2yW/tVm98qYw==
X-CSE-MsgGUID: Pie5ReK4SgCWhsdfHG6Hiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53542038"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53542038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:00:19 -0700
X-CSE-ConnectionGUID: TMJg88XSSCmkrljpNZFSpw==
X-CSE-MsgGUID: P4b5l5eUSgGG9zKTEllA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152819619"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2025 13:00:18 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVbie-0000oV-0p;
	Sat, 28 Jun 2025 20:00:12 +0000
Date: Sat, 28 Jun 2025 21:59:49 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: kernel/fork.c:3088:2: warning: clone3() entry point is missing,
 please fix
Message-ID: <202506282120.6vRwodm3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf724ed69264719550ec4f194d3ab17b886af9a
commit: 505d66d1abfb90853e24ab6cbdf83b611473d6fc clone3: drop __ARCH_WANT_SYS_CLONE3 macro
date:   12 months ago
config: hexagon-randconfig-2002-20250626 (https://download.01.org/0day-ci/archive/20250628/202506282120.6vRwodm3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282120.6vRwodm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506282120.6vRwodm3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/fork.c:3088:2: warning: clone3() entry point is missing, please fix [-W#warnings]
    3088 | #warning clone3() entry point is missing, please fix
         |  ^
   7 warnings generated.


vim +3088 kernel/fork.c

  3068	
  3069	/**
  3070	 * sys_clone3 - create a new process with specific properties
  3071	 * @uargs: argument structure
  3072	 * @size:  size of @uargs
  3073	 *
  3074	 * clone3() is the extensible successor to clone()/clone2().
  3075	 * It takes a struct as argument that is versioned by its size.
  3076	 *
  3077	 * Return: On success, a positive PID for the child process.
  3078	 *         On error, a negative errno number.
  3079	 */
  3080	SYSCALL_DEFINE2(clone3, struct clone_args __user *, uargs, size_t, size)
  3081	{
  3082		int err;
  3083	
  3084		struct kernel_clone_args kargs;
  3085		pid_t set_tid[MAX_PID_NS_LEVEL];
  3086	
  3087	#ifdef __ARCH_BROKEN_SYS_CLONE3
> 3088	#warning clone3() entry point is missing, please fix
  3089		return -ENOSYS;
  3090	#endif
  3091	
  3092		kargs.set_tid = set_tid;
  3093	
  3094		err = copy_clone_args_from_user(&kargs, uargs, size);
  3095		if (err)
  3096			return err;
  3097	
  3098		if (!clone3_args_valid(&kargs))
  3099			return -EINVAL;
  3100	
  3101		return kernel_clone(&kargs);
  3102	}
  3103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
