Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE627462
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738284603; cv=none; b=gRvA5G6kihZmAMil5BXQjMrmK4x+qXdE0dX7TmT3lHpt6YcZ4AnY7foy99Q0dFWEHCJvosxy9zKDigEGRChW1k+kr+JqaFxLF1QPvdOZ7cBWoXsQuez19o5ZiRmMJw5hHvTsAmlaSYes4KX4ipbYOSgbeSD9R8Go7slAzC9bUP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738284603; c=relaxed/simple;
	bh=GC0sS/ll7FXWrYk9wniRzbBVRTEj5hUDuN763X+smOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBgrVFk+ZHG8luR0XlOYDridv38I+D68ngvdqHwslqg3uzwFHAVgJgu2ua8LPDX3GLor/wm4W+WHUO6eRfSU7RjbSd+K/jiSucCLwgmU4pKdJ0JFT6kmjy7mXvfkphqp0aNac5V8pHVM5BHSfb5Uj1Pb3vcJ50IYNcammgAC/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmqZ2njT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmqZ2njT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738284601; x=1769820601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GC0sS/ll7FXWrYk9wniRzbBVRTEj5hUDuN763X+smOE=;
  b=PmqZ2njTjYdo4i42LoisI+ER8KH6nlgjoEZnTb+3dAIFqS7bEPYgxvU2
   Lt+RVMLBqFFS/gdiIb3J37FT1mXOoJ6q0LoPDB1WSYWFxnOW74gi3TPYV
   qhDjW3tt22bcoA+J7fjL6uiGt8As4OStgpx2MxMVER3bukKphgL0QdmH6
   kk7byq7Rzl4ueghUxiCfUlWS2fnsPAmOjiDsgIk69Hq3SeJjyPFw4OnA0
   tB1O4j1Hk/Yf0ZHj0VYR3DeV+VuRm3r9dBvlt5RkgAKz0fNFjVH54LuCj
   JltSagDBbYFwspZuwQG/ejC7p8eoaKX8O53SNJrWGFSjVKzNbL3ZCdV4Z
   w==;
X-CSE-ConnectionGUID: 37i2KVINSGKngW6KXrj3wQ==
X-CSE-MsgGUID: 1J1mMxFdT9qmAcNDysN1vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56397270"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="56397270"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 16:50:00 -0800
X-CSE-ConnectionGUID: r8ZTEX0XSDasLbs+cUvFIw==
X-CSE-MsgGUID: edMp/LNAQIidQ7j1T2Rg8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140374296"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2025 16:48:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdfD6-000lbv-1P;
	Fri, 31 Jan 2025 00:48:40 +0000
Date: Fri, 31 Jan 2025 08:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v3] riscv: Add runtime constant support
Message-ID: <202501310838.EJsvg1L1-lkp@intel.com>
References: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-Add-runtime-constant-support/20250129-040853
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250128-runtime_const_riscv-v3-1-11922989e2d3%40rivosinc.com
patch subject: [PATCH v3] riscv: Add runtime constant support
config: riscv-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501310838.EJsvg1L1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310838.EJsvg1L1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310838.EJsvg1L1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/dcache.c:29:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/dcache.c:29:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/dcache.c:29:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/dcache.c:29:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/dcache.c:29:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> fs/dcache.c:112:9: warning: unused variable '__tmp' [-Wunused-variable]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/runtime-const.h:13:21: note: expanded from macro 'runtime_const_ptr'
      13 |         typeof(sym) __ret, __tmp;                               \
         |                            ^~~~~
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
   arch/riscv/include/asm/runtime-const.h:14:13: note: expanded from macro 'runtime_const_ptr'
      14 |         asm_inline("1:\t"                                       \
         |                    ^
   <inline asm>:1:25: note: instantiated into assembly here
       1 |         1:      .option push.option norvclui    s2,0x89abd
         |                                     ^
>> fs/dcache.c:112:9: error: invalid operand for instruction
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:17:26: note: expanded from macro 'runtime_const_ptr'
      17 |                 "lui    %[__ret],0x89abd\n\t"                   \
         |                                           ^
   <inline asm>:2:10: note: instantiated into assembly here
       2 |         addi    s2,-0x211
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:18:26: note: expanded from macro 'runtime_const_ptr'
      18 |                 "addi   %[__ret],-0x211\n\t"                    \
         |                                          ^
   <inline asm>:3:26: note: instantiated into assembly here
       3 |         .option pop.pushsection runtime_ptr_dentry_hashtable,"a"
         |                                 ^
>> fs/dcache.c:112:9: error: .popsection without corresponding .pushsection
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:21:18: note: expanded from macro 'runtime_const_ptr'
      21 |                 ".long 1b - .\n\t"                              \
         |                                ^
   <inline asm>:5:13: note: instantiated into assembly here
       5 |         .popsection
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:14:13: note: expanded from macro 'runtime_const_ptr'
      14 |         asm_inline("1:\t"                                       \
         |                    ^
   <inline asm>:1:25: note: instantiated into assembly here
       1 |         1:      .option push.option norvclui    a0,0x89abd
         |                                     ^
>> fs/dcache.c:112:9: error: invalid operand for instruction
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:17:26: note: expanded from macro 'runtime_const_ptr'
      17 |                 "lui    %[__ret],0x89abd\n\t"                   \
         |                                           ^
   <inline asm>:2:10: note: instantiated into assembly here
       2 |         addi    a0,-0x211
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:18:26: note: expanded from macro 'runtime_const_ptr'
      18 |                 "addi   %[__ret],-0x211\n\t"                    \
         |                                          ^
   <inline asm>:3:26: note: instantiated into assembly here
       3 |         .option pop.pushsection runtime_ptr_dentry_hashtable,"a"
         |                                 ^
>> fs/dcache.c:112:9: error: .popsection without corresponding .pushsection
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:21:18: note: expanded from macro 'runtime_const_ptr'
      21 |                 ".long 1b - .\n\t"                              \
         |                                ^
   <inline asm>:5:13: note: instantiated into assembly here
       5 |         .popsection
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:14:13: note: expanded from macro 'runtime_const_ptr'
      14 |         asm_inline("1:\t"                                       \
         |                    ^
   <inline asm>:1:25: note: instantiated into assembly here
       1 |         1:      .option push.option norvclui    a5,0x89abd
         |                                     ^
>> fs/dcache.c:112:9: error: invalid operand for instruction
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:17:26: note: expanded from macro 'runtime_const_ptr'
      17 |                 "lui    %[__ret],0x89abd\n\t"                   \
         |                                           ^
   <inline asm>:2:10: note: instantiated into assembly here
       2 |         addi    a5,-0x211
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:18:26: note: expanded from macro 'runtime_const_ptr'
      18 |                 "addi   %[__ret],-0x211\n\t"                    \
         |                                          ^
   <inline asm>:3:26: note: instantiated into assembly here
       3 |         .option pop.pushsection runtime_ptr_dentry_hashtable,"a"
         |                                 ^
>> fs/dcache.c:112:9: error: .popsection without corresponding .pushsection
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:21:18: note: expanded from macro 'runtime_const_ptr'
      21 |                 ".long 1b - .\n\t"                              \
         |                                ^
   <inline asm>:5:13: note: instantiated into assembly here
       5 |         .popsection
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:14:13: note: expanded from macro 'runtime_const_ptr'
      14 |         asm_inline("1:\t"                                       \
         |                    ^
   <inline asm>:1:25: note: instantiated into assembly here
       1 |         1:      .option push.option norvclui    a1,0x89abd
         |                                     ^
>> fs/dcache.c:112:9: error: invalid operand for instruction
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:17:26: note: expanded from macro 'runtime_const_ptr'
      17 |                 "lui    %[__ret],0x89abd\n\t"                   \
         |                                           ^
   <inline asm>:2:10: note: instantiated into assembly here
       2 |         addi    a1,-0x211
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:18:26: note: expanded from macro 'runtime_const_ptr'
      18 |                 "addi   %[__ret],-0x211\n\t"                    \
         |                                          ^
   <inline asm>:3:26: note: instantiated into assembly here
       3 |         .option pop.pushsection runtime_ptr_dentry_hashtable,"a"
         |                                 ^
>> fs/dcache.c:112:9: error: .popsection without corresponding .pushsection
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:21:18: note: expanded from macro 'runtime_const_ptr'
      21 |                 ".long 1b - .\n\t"                              \
         |                                ^
   <inline asm>:5:13: note: instantiated into assembly here
       5 |         .popsection
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:14:13: note: expanded from macro 'runtime_const_ptr'
      14 |         asm_inline("1:\t"                                       \
         |                    ^
   <inline asm>:1:25: note: instantiated into assembly here
       1 |         1:      .option push.option norvclui    a0,0x89abd
         |                                     ^
>> fs/dcache.c:112:9: error: invalid operand for instruction
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:17:26: note: expanded from macro 'runtime_const_ptr'
      17 |                 "lui    %[__ret],0x89abd\n\t"                   \
         |                                           ^
   <inline asm>:2:10: note: instantiated into assembly here
       2 |         addi    a0,-0x211
         |                    ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:18:26: note: expanded from macro 'runtime_const_ptr'
      18 |                 "addi   %[__ret],-0x211\n\t"                    \
         |                                          ^
   <inline asm>:3:26: note: instantiated into assembly here
       3 |         .option pop.pushsection runtime_ptr_dentry_hashtable,"a"
         |                                 ^
   fs/dcache.c:112:9: error: .popsection without corresponding .pushsection
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:21:18: note: expanded from macro 'runtime_const_ptr'
      21 |                 ".long 1b - .\n\t"                              \
         |                                ^
   <inline asm>:5:13: note: instantiated into assembly here
       5 |         .popsection
         |                    ^
   fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:14:13: note: expanded from macro 'runtime_const_ptr'
      14 |         asm_inline("1:\t"                                       \
         |                    ^
   <inline asm>:1:25: note: instantiated into assembly here
       1 |         1:      .option push.option norvclui    s2,0x89abd
         |                                     ^
   fs/dcache.c:112:9: error: invalid operand for instruction
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:17:26: note: expanded from macro 'runtime_const_ptr'
      17 |                 "lui    %[__ret],0x89abd\n\t"                   \
         |                                           ^
   <inline asm>:2:10: note: instantiated into assembly here
       2 |         addi    s2,-0x211
         |                    ^
   fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'arch', 'relax' or 'norelax' [-Winline-asm]
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:18:26: note: expanded from macro 'runtime_const_ptr'
      18 |                 "addi   %[__ret],-0x211\n\t"                    \
         |                                          ^
   <inline asm>:3:26: note: instantiated into assembly here
       3 |         .option pop.pushsection runtime_ptr_dentry_hashtable,"a"
         |                                 ^
   fs/dcache.c:112:9: error: .popsection without corresponding .pushsection
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^
   arch/riscv/include/asm/runtime-const.h:21:18: note: expanded from macro 'runtime_const_ptr'
      21 |                 ".long 1b - .\n\t"                              \
         |                                ^
   <inline asm>:5:13: note: instantiated into assembly here
       5 |         .popsection
         |                    ^
   20 warnings and 12 errors generated.


vim +/__tmp +112 fs/dcache.c

ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  109  
e60cc61153e61e Linus Torvalds  2024-06-10  110  static inline struct hlist_bl_head *d_hash(unsigned long hashlen)
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  111  {
e78298556ee5d8 Linus Torvalds  2024-06-04 @112  	return runtime_const_ptr(dentry_hashtable) +
e78298556ee5d8 Linus Torvalds  2024-06-04  113  		runtime_const_shift_right_32(hashlen, d_hash_shift);
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  114  }
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  115  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
