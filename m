Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397F79450
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 00:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743639189; cv=none; b=IqIJuqtOzvNUbO4abCGG7wMgxTDtICf3b1a81r3ogJ/7YlAzoYqYMUfb9j2yoxZJGkyO+pwx9GjLt+UU0JcQ2lKQwkNswxa9KqRQFw9qCbhnHFrOFiQWDopFchxnB8IOibPHK7E4AGzGWNsiElxqjPyNYUeMriUBtXqtbRAuqeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743639189; c=relaxed/simple;
	bh=W7+SBiatRAtjmUljTkkT7alatlE4Y4bCiwLl8PaOB8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UpWASEP1Ziw0P955ED9MNgHi0Yu1KHSkI2iQvGTvZYtVBY04QvI/3ZxxrWcUbt00M3D8B6zvi9mNV9uWEP0FKtoOyyCDzWD+59ijfT/ZYMERqXcvsaH25EVxRUSvrga1SWfDMV64b/NXxN/wr5Bcyp5qn78VO4uAeiTgWmwT9nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1REhMol; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1REhMol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743639187; x=1775175187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W7+SBiatRAtjmUljTkkT7alatlE4Y4bCiwLl8PaOB8Q=;
  b=a1REhMolJT/wWvzAwBvKmg2IKMOjq7ttJz5TAKkJxR5+kokB/BDtcxys
   l6YbguxFRt1pe2EzruS8YGi7W3nO+GedjHv8eU3PoCG/RdYs3mgLEXPUV
   kOTbgA2pTK3By4sWYJ6dSI+jVvEC+rZH3u/ZD/wmvhxZAPKnU4gXfT7Lm
   NAGypbXQg1WguD7l+WLDgDH9nE3mUsY18a5j72JNK8Oty7To+otu05QRC
   WBq7wVY77WrKdGVs6OEBAa2uQxHvh8BxmrNtVJbl4j8X8SwSZ5L2AzLMx
   N9fgk9nOimkUVNXVxLGxggEkTwdTW5u8dxsNWOv6PUHV/saMK6yYaYvoQ
   A==;
X-CSE-ConnectionGUID: RkYw57gGRT6T/DLnBtqHmw==
X-CSE-MsgGUID: D/5L+UBdTiGbYfUBOyyq+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44176736"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="44176736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 17:13:07 -0700
X-CSE-ConnectionGUID: 8ATRVow4Rh6e1ji4eQ9lUw==
X-CSE-MsgGUID: L6mdSNooTjqmFoBgGl/IhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="126749326"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Apr 2025 17:13:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u08CY-000B7E-1v;
	Thu, 03 Apr 2025 00:12:59 +0000
Date: Thu, 3 Apr 2025 08:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/mm 7/9] arch/x86/include/asm/mwait.h:30:15: error: invalid
 operand for instruction
Message-ID: <202504030802.2lEVBSpN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Uros,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
head:   6c921984e75c78e1c509d99b8cde04f1eadd46fb
commit: cd3b85b27542968198e3d588a2bc0591930ee2ee [7/9] x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>
config: x86_64-buildonly-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504030802.2lEVBSpN-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030802.2lEVBSpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030802.2lEVBSpN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/process.c:36:
>> arch/x86/include/asm/mwait.h:30:15: error: invalid operand for instruction
      30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
         |                      ^
   <inline asm>:1:16: note: instantiated into assembly here
       1 |         monitor %rax, %ecx, %edx
         |                       ^~~~~
   In file included from arch/x86/kernel/process.c:36:
>> arch/x86/include/asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
      95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
         |                      ^
   <inline asm>:1:7: note: instantiated into assembly here
       1 |         sti; mwait %eax, %ecx
         |              ^
   2 errors generated.


vim +30 arch/x86/include/asm/mwait.h

    27	
    28	static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
    29	{
  > 30		asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
    31	}
    32	
    33	static __always_inline void __monitorx(const void *eax, u32 ecx, u32 edx)
    34	{
    35		/* "monitorx %eax, %ecx, %edx;" */
    36		asm volatile(".byte 0x0f, 0x01, 0xfa;"
    37			     :: "a" (eax), "c" (ecx), "d"(edx));
    38	}
    39	
    40	static __always_inline void __mwait(u32 eax, u32 ecx)
    41	{
    42		mds_idle_clear_cpu_buffers();
    43	
    44		asm volatile("mwait %0, %1" :: "a" (eax), "c" (ecx));
    45	}
    46	
    47	/*
    48	 * MWAITX allows for a timer expiration to get the core out a wait state in
    49	 * addition to the default MWAIT exit condition of a store appearing at a
    50	 * monitored virtual address.
    51	 *
    52	 * Registers:
    53	 *
    54	 * MWAITX ECX[1]: enable timer if set
    55	 * MWAITX EBX[31:0]: max wait time expressed in SW P0 clocks. The software P0
    56	 * frequency is the same as the TSC frequency.
    57	 *
    58	 * Below is a comparison between MWAIT and MWAITX on AMD processors:
    59	 *
    60	 *                 MWAIT                           MWAITX
    61	 * opcode          0f 01 c9           |            0f 01 fb
    62	 * ECX[0]                  value of RFLAGS.IF seen by instruction
    63	 * ECX[1]          unused/#GP if set  |            enable timer if set
    64	 * ECX[31:2]                     unused/#GP if set
    65	 * EAX                           unused (reserve for hint)
    66	 * EBX[31:0]       unused             |            max wait time (P0 clocks)
    67	 *
    68	 *                 MONITOR                         MONITORX
    69	 * opcode          0f 01 c8           |            0f 01 fa
    70	 * EAX                     (logical) address to monitor
    71	 * ECX                     #GP if not zero
    72	 */
    73	static __always_inline void __mwaitx(u32 eax, u32 ebx, u32 ecx)
    74	{
    75		/* No MDS buffer clear as this is AMD/HYGON only */
    76	
    77		/* "mwaitx %eax, %ebx, %ecx;" */
    78		asm volatile(".byte 0x0f, 0x01, 0xfb;"
    79			     :: "a" (eax), "b" (ebx), "c" (ecx));
    80	}
    81	
    82	/*
    83	 * Re-enable interrupts right upon calling mwait in such a way that
    84	 * no interrupt can fire _before_ the execution of mwait, ie: no
    85	 * instruction must be placed between "sti" and "mwait".
    86	 *
    87	 * This is necessary because if an interrupt queues a timer before
    88	 * executing mwait, it would otherwise go unnoticed and the next tick
    89	 * would not be reprogrammed accordingly before mwait ever wakes up.
    90	 */
    91	static __always_inline void __sti_mwait(u32 eax, u32 ecx)
    92	{
    93		mds_idle_clear_cpu_buffers();
    94	
  > 95		asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
