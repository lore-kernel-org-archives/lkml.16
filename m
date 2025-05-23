Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF6F222580
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748018310; cv=none; b=Y052z/yczU8NF8QlyaraElJNpti/Nk5SL/OAoYY/C4DUEinQdwLqvNHEFxvvKzkqx5soGXzKjR86mFbFR3+VsKOmWbzq/gyDQjbEjJhqhyhibchzIUHNwcLXQ9852aoDgeknrCVGgVG69nEY6P9tmpbr2JcwHBfbV7CfSuTmtlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748018310; c=relaxed/simple;
	bh=HrRqZ3z9algFA+rzVPcUIWUy8j5aB8T+U6MVf1o87+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jcMbZUcWTLik0Cshyz+MzT/qbeco5BAt1BVb3hEMkRlYnPlRaAQJv1RtGx7aDaAaRmgr1Vgb0QRlF+D1Lb8jeO+ohZWkZUk9REXVe9wKNcLH1kQm1O8mohl7Xv4Av5RK0ScabnpEOHOcZMXSGE0/Suril72OoCWwY2jpVLwSHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBlIl/hW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBlIl/hW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748018308; x=1779554308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrRqZ3z9algFA+rzVPcUIWUy8j5aB8T+U6MVf1o87+w=;
  b=VBlIl/hW7N/veh/mM0kvQ1rq7HIh6zW/zMok63Xkjl9i5xm5Xa9r7LrE
   YKEbrl/4iq8rzzMVK+Uhe7+9Urwxj54O0dTaer78os43GLkfuTrPzsPNV
   wBK0oCpoaVmcuWEG+D1al8qEpbthAY8YONR5Xz4UcNsdJ6tBObtKuYw6T
   XNeJ7JmXt1CHqS8G5BLQOmXFKqTldaCra0hVDwzpEUqPZdNt01gAg1YzA
   H8J3db+aRBpJ1pZtPVBIKukeyzyy8dQhJ/tt8SsmmsyDy8m1/uJgLQ73m
   GS3I2ok3Sl3iG1IAXtwuQiXqxa5flf7BPKL1eXgpQ0/G3sm6M8xrr+HFh
   g==;
X-CSE-ConnectionGUID: TYfpl9b9RCqnNVW/eQDexQ==
X-CSE-MsgGUID: WpFAsJiwREK2aOaTzWISLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67642128"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="67642128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 09:38:27 -0700
X-CSE-ConnectionGUID: ee/54DF8S/mif2719jjHJA==
X-CSE-MsgGUID: WgDBmkwsTVuUhtnD5QDUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="172106683"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 23 May 2025 09:38:25 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIVPa-0001Xz-2p;
	Fri, 23 May 2025 16:38:22 +0000
Date: Sat, 24 May 2025 00:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/kernel/um_arch.c:336:16: warning: result of comparison of
 constant 4294967296 with expression of type 'typeof (task_size)' (aka
 'unsigned long') is always false
Message-ID: <202505240038.q8Dcx2LG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d0ebc36b0b3e8486ceb6e08e8ae173aaa6d1221
commit: 830003c73d190259e45d0a99a0e3d14cb73e0af0 um: Limit TASK_SIZE to the addressable range
date:   8 months ago
config: um-randconfig-2006-20250515 (https://download.01.org/0day-ci/archive/20250524/202505240038.q8Dcx2LG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240038.q8Dcx2LG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240038.q8Dcx2LG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/kernel/um_arch.c:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
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
>> arch/um/kernel/um_arch.c:336:16: warning: result of comparison of constant 4294967296 with expression of type 'typeof (task_size)' (aka 'unsigned long') is always false [-Wtautological-constant-out-of-range-compare]
     336 |         if (task_size > (unsigned long long) PTRS_PER_PGD * PGDIR_SIZE)
         |             ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.


vim +336 arch/um/kernel/um_arch.c

   304	
   305	int __init linux_main(int argc, char **argv)
   306	{
   307		unsigned long avail, diff;
   308		unsigned long virtmem_size, max_physmem;
   309		unsigned long stack;
   310		unsigned int i;
   311		int add;
   312	
   313		for (i = 1; i < argc; i++) {
   314			if ((i == 1) && (argv[i][0] == ' '))
   315				continue;
   316			add = 1;
   317			uml_checksetup(argv[i], &add);
   318			if (add)
   319				add_arg(argv[i]);
   320		}
   321		if (have_root == 0)
   322			add_arg(DEFAULT_COMMAND_LINE_ROOT);
   323	
   324		if (have_console == 0)
   325			add_arg(DEFAULT_COMMAND_LINE_CONSOLE);
   326	
   327		host_task_size = os_get_top_address();
   328		/* reserve a few pages for the stubs */
   329		stub_start = host_task_size - STUB_DATA_PAGES * PAGE_SIZE;
   330		/* another page for the code portion */
   331		stub_start -= PAGE_SIZE;
   332		host_task_size = stub_start;
   333	
   334		/* Limit TASK_SIZE to what is addressable by the page table */
   335		task_size = host_task_size;
 > 336		if (task_size > (unsigned long long) PTRS_PER_PGD * PGDIR_SIZE)
   337			task_size = PTRS_PER_PGD * PGDIR_SIZE;
   338	
   339		/*
   340		 * TASK_SIZE needs to be PGDIR_SIZE aligned or else exit_mmap craps
   341		 * out
   342		 */
   343		task_size = task_size & PGDIR_MASK;
   344	
   345		/* OS sanity checks that need to happen before the kernel runs */
   346		os_early_checks();
   347	
   348		get_host_cpu_features(parse_host_cpu_flags, parse_cache_line);
   349	
   350		brk_start = (unsigned long) sbrk(0);
   351	
   352		/*
   353		 * Increase physical memory size for exec-shield users
   354		 * so they actually get what they asked for. This should
   355		 * add zero for non-exec shield users
   356		 */
   357	
   358		diff = UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
   359		if (diff > 1024 * 1024) {
   360			os_info("Adding %ld bytes to physical memory to account for "
   361				"exec-shield gap\n", diff);
   362			physmem_size += UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
   363		}
   364	
   365		uml_physmem = (unsigned long) __binary_start & PAGE_MASK;
   366	
   367		/* Reserve up to 4M after the current brk */
   368		uml_reserved = ROUND_4M(brk_start) + (1 << 22);
   369	
   370		setup_machinename(init_utsname()->machine);
   371	
   372		physmem_size = (physmem_size + PAGE_SIZE - 1) & PAGE_MASK;
   373		iomem_size = (iomem_size + PAGE_SIZE - 1) & PAGE_MASK;
   374	
   375		max_physmem = TASK_SIZE - uml_physmem - iomem_size - MIN_VMALLOC;
   376	
   377		if (physmem_size + iomem_size > max_physmem) {
   378			physmem_size = max_physmem - iomem_size;
   379			os_info("Physical memory size shrunk to %llu bytes\n",
   380				physmem_size);
   381		}
   382	
   383		high_physmem = uml_physmem + physmem_size;
   384		end_iomem = high_physmem + iomem_size;
   385		high_memory = (void *) end_iomem;
   386	
   387		start_vm = VMALLOC_START;
   388	
   389		virtmem_size = physmem_size;
   390		stack = (unsigned long) argv;
   391		stack &= ~(1024 * 1024 - 1);
   392		avail = stack - start_vm;
   393		if (physmem_size > avail)
   394			virtmem_size = avail;
   395		end_vm = start_vm + virtmem_size;
   396	
   397		if (virtmem_size < physmem_size)
   398			os_info("Kernel virtual memory size shrunk to %lu bytes\n",
   399				virtmem_size);
   400	
   401		os_flush_stdout();
   402	
   403		return start_uml();
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
