Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF85728A73F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636083; cv=none; b=sDyC+HnjgdHGXUK0su/7Y9uKVSUIjXsDcFkyOpKcsRexWzeTpoF/dbAuZsvoQx8WcoBgZqmTstGzpvdhBfZCLyRJu3QD/LxZj3tgkAjUfFMLQ9HKIjndXhoTUSCXPxmq6jtHcVVYFXGX1PfKPFWo3/a29+GfvnqJJhfNjRqzmvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636083; c=relaxed/simple;
	bh=bWuCgjApe52tcbee1hI767dDid6NpL9hvhp5c7jcVTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JgE6LuHhaAj+p3/7wuRndSUQszN85XRH7+RiMOEEnJzIsPHHbER2ZRO1hfQHf/EnwMuAsfjxygs+dT6OZTS3q1LpcXMU10+v9p78mTA+aQHjpP8NMBeF4DnYqsnp+mNfSyv+rdeL8m9Ii3DI3mkFf3pcgS4MMc/TywgVwR+o9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEu7SxF8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEu7SxF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746636080; x=1778172080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWuCgjApe52tcbee1hI767dDid6NpL9hvhp5c7jcVTk=;
  b=UEu7SxF8bxd0Jzii4tz5XMygHjLo6+QhkJQjz4A6kQ6HSUybc9li8S2a
   9FqI43YxIZYoLEMlhWsEjMvjsXrLc/mGzwDwMdAvkjN/vUYiejObcIw4l
   /45dd4cCBJzLoaO520e5At/MZZxUGJnHr0KTq97rYmZHKhdYH6zycM4/L
   /0RqR26CVPBa+KZMUcCV+ldAOjZpkReB5HbVmVyXG1pvqbULeaYwqKTDV
   tNRedo8IdHB1y/d+6zSaErtRdOTDr8o1kwQ1USoG1N13WKvaRlFeFFCVL
   2C+mOVvTXLGuMefe31DBLDPT/ACPLAS5eM2QF60f28BeeOuXLi8v8sWUQ
   w==;
X-CSE-ConnectionGUID: Apty3UX8ReKMMTearXsAJQ==
X-CSE-MsgGUID: D43OHDAVQDe8CLIxH+J/dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="36012812"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="36012812"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:41:19 -0700
X-CSE-ConnectionGUID: 71dd/4i8QfWC29XWaGV1vg==
X-CSE-MsgGUID: 1yJ3PHiERCamBSTxFOr7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136530567"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 May 2025 09:41:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uChpa-0008Av-1q;
	Wed, 07 May 2025 16:41:14 +0000
Date: Thu, 8 May 2025 00:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Xin Li (Intel)" <xin3.li@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/msr 5/19]
 drivers/accel/habanalabs/common/habanalabs_ioctl.c:326:23: error: call to
 undeclared function 'rdtsc'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202505080003.0t7ewxGp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/msr
head:   570d58b12fbf7bae0ba72d929ccf914a4df5ca7c
commit: efef7f184f2eaf29a1ca676712d0e6e851cd0191 [5/19] x86/msr: Add explicit includes of <asm/msr.h>
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505080003.0t7ewxGp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080003.0t7ewxGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080003.0t7ewxGp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:11:
   In file included from drivers/accel/habanalabs/common/habanalabs.h:11:
   In file included from include/linux/habanalabs/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
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
   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:11:
   In file included from drivers/accel/habanalabs/common/habanalabs.h:11:
   In file included from include/linux/habanalabs/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
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
   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:11:
   In file included from drivers/accel/habanalabs/common/habanalabs.h:11:
   In file included from include/linux/habanalabs/cpucp_if.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
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
>> drivers/accel/habanalabs/common/habanalabs_ioctl.c:326:23: error: call to undeclared function 'rdtsc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     326 |         time_sync.tsc_time = rdtsc();
         |                              ^
   12 warnings and 1 error generated.


vim +/rdtsc +326 drivers/accel/habanalabs/common/habanalabs_ioctl.c

52c01b0137193ab drivers/misc/habanalabs/habanalabs_ioctl.c         Moti Haimovski 2019-11-03  314  
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  315  static int time_sync_info(struct hl_device *hdev, struct hl_info_args *args)
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  316  {
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  317  	struct hl_info_time_sync time_sync = {0};
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  318  	u32 max_size = args->return_size;
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  319  	void __user *out = (void __user *) (uintptr_t) args->return_pointer;
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  320  
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  321  	if ((!max_size) || (!out))
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  322  		return -EINVAL;
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  323  
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  324  	time_sync.device_time = hdev->asic_funcs->get_device_time(hdev);
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  325  	time_sync.host_time = ktime_get_raw_ns();
0648c4d0806fe16 drivers/accel/habanalabs/common/habanalabs_ioctl.c Hen Alon       2023-08-09 @326  	time_sync.tsc_time = rdtsc();
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  327  
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  328  	return copy_to_user(out, &time_sync,
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  329  		min((size_t) max_size, sizeof(time_sync))) ? -EFAULT : 0;
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  330  }
25e7aeba601c177 drivers/misc/habanalabs/habanalabs_ioctl.c         Tomer Tayar    2020-03-31  331  

:::::: The code at line 326 was first introduced by commit
:::::: 0648c4d0806fe167fe699299573100507ae99502 accel/habanalabs: add tsc clock sampling to clock sync info

:::::: TO: Hen Alon <halon@habana.ai>
:::::: CC: Oded Gabbay <ogabbay@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
