Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C018A6DB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745098406; cv=none; b=XO5v01qZpToK21zjH4awqsh+KZuq5flIOaNl2mIIpnZqX9jmBsYlhoBVLPNNZdLH2oD7rfyHMlHaKfytaduJoWKcvfc7duZ30huU0CNJiXe2E/LyNGElMtXkwkHcSKDiNiNMr4Jbgy6JViuluOIHabDGULq54zH/eB+Kb9r6XCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745098406; c=relaxed/simple;
	bh=QtIwGyomjEuL3r0x9FOf6UhZiKeWvwxz379zkMc//Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iAMxqQT6BvNbQFxhFZqsqr5X9iGJsW9Q4cd/tq+imRsePjEiH08Dyj9mcH18aZNWxSZS02PNZUb1R6aMuKISd/6PR20QudquvRorqlQDlch3BkPN3rKRxcvn5avvFaFTAkRYHLVeCniJEYvK08gfHoXTFGrbRDmu5XIWLVczouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ygv2ta7c; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ygv2ta7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745098404; x=1776634404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QtIwGyomjEuL3r0x9FOf6UhZiKeWvwxz379zkMc//Cs=;
  b=Ygv2ta7cajoZc4kf5kiifm/q13GHqNm1CzYgrYkmDz7CNVxLxlM2VAOs
   KRptmUcquAJ4zu3QjRTkcnuU11+xWjeC3A9/ob1ZiE8RcImE4D3uVTBfz
   Eh2qcR90sAy5X/dQBHMpUWyMHF4ypSvFWvS1SFkaZzaUVCuZu4UWE2NQu
   nyrWtdUYsrP7ltrFy0CoqvJe0NMzsOJFANvH7Hvm7cw1Z10ShD9d2NuNo
   08Iyt0msHYkC9YVacECUenJG4R0XmGLMHI2lL144tGDpf7m3Sc+YztHSm
   uP28cOEMyo9F4hA2GB5jCmHjBLVR5MERUZH+tPtmVY6oaIyliE0uo//VO
   g==;
X-CSE-ConnectionGUID: gqsqrYvKSKCAhscIkQOeDQ==
X-CSE-MsgGUID: 0H3zoRatR06qDdAqV43f/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46856606"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46856606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 14:33:23 -0700
X-CSE-ConnectionGUID: 9WAPb7y+QyKPpWjWiGV/wQ==
X-CSE-MsgGUID: tS5fM2jLQCqupp0Lu3s5lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131246632"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Apr 2025 14:33:22 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6FoO-0004Cg-00;
	Sat, 19 Apr 2025 21:33:20 +0000
Date: Sun, 20 Apr 2025 05:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: arch/x86/include/asm/msr.h:122: undefined reference to
 `__tracepoint_read_msr'
Message-ID: <202504200509.VkJqF0j3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1ca0f935a126950c2f0b305a50f31f3b00542b0d
commit: 4a8840af5f53f2902eba91130fae650879f18e7a tracepoints: Use new static branch API
date:   6 months ago
config: um-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200509.VkJqF0j3-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200509.VkJqF0j3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200509.VkJqF0j3-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `cs5536_init_one':
>> arch/x86/include/asm/msr.h:122: undefined reference to `__tracepoint_read_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:123: undefined reference to `do_trace_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `native_read_msr':
>> arch/x86/include/asm/msr.h:122: undefined reference to `__tracepoint_read_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:123: undefined reference to `do_trace_read_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:122: undefined reference to `__tracepoint_read_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:123: undefined reference to `do_trace_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `native_write_msr':
>> arch/x86/include/asm/msr.h:149: undefined reference to `__tracepoint_write_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:150: undefined reference to `do_trace_write_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `cs5536_set_dmamode':
>> arch/x86/include/asm/msr.h:122: undefined reference to `__tracepoint_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `native_write_msr':
>> arch/x86/include/asm/msr.h:149: undefined reference to `__tracepoint_write_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:150: undefined reference to `do_trace_write_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `cs5536_set_dmamode':
   arch/x86/include/asm/msr.h:123: undefined reference to `do_trace_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `native_read_msr':
>> arch/x86/include/asm/msr.h:122: undefined reference to `__tracepoint_read_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:123: undefined reference to `do_trace_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `native_write_msr':
>> arch/x86/include/asm/msr.h:149: undefined reference to `__tracepoint_write_msr'
>> /usr/bin/ld: arch/x86/include/asm/msr.h:150: undefined reference to `do_trace_write_msr'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +122 arch/x86/include/asm/msr.h

c996f3802006a5 arch/x86/include/asm/msr.h Borislav Petkov           2018-03-01  108  
c996f3802006a5 arch/x86/include/asm/msr.h Borislav Petkov           2018-03-01  109  #define native_wrmsr(msr, low, high)			\
c996f3802006a5 arch/x86/include/asm/msr.h Borislav Petkov           2018-03-01  110  	__wrmsr(msr, low, high)
c996f3802006a5 arch/x86/include/asm/msr.h Borislav Petkov           2018-03-01  111  
c996f3802006a5 arch/x86/include/asm/msr.h Borislav Petkov           2018-03-01  112  #define native_wrmsrl(msr, val)				\
c996f3802006a5 arch/x86/include/asm/msr.h Borislav Petkov           2018-03-01  113  	__wrmsr((msr), (u32)((u64)(val)),		\
c996f3802006a5 arch/x86/include/asm/msr.h Borislav Petkov           2018-03-01  114  		       (u32)((u64)(val) >> 32))
c996f3802006a5 arch/x86/include/asm/msr.h Borislav Petkov           2018-03-01  115  
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  116  static inline unsigned long long native_read_msr(unsigned int msr)
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  117  {
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  118  	unsigned long long val;
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  119  
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  120  	val = __rdmsr(msr);
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  121  
fdb46faeab2f3f arch/x86/include/asm/msr.h Steven Rostedt (VMware    2020-09-25 @122) 	if (tracepoint_enabled(read_msr))
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20 @123  		do_trace_read_msr(msr, val, 0);
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  124  
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  125  	return val;
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  126  }
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  127  
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  128  static inline unsigned long long native_read_msr_safe(unsigned int msr,
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  129  						      int *err)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  130  {
c210d24986dc19 include/asm-x86/msr.h      Glauber de Oliveira Costa 2008-01-30  131  	DECLARE_ARGS(val, low, high);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  132  
d52a7344bdfa9c arch/x86/include/asm/msr.h Peter Zijlstra            2021-11-10  133  	asm volatile("1: rdmsr ; xor %[err],%[err]\n"
d52a7344bdfa9c arch/x86/include/asm/msr.h Peter Zijlstra            2021-11-10  134  		     "2:\n\t"
d52a7344bdfa9c arch/x86/include/asm/msr.h Peter Zijlstra            2021-11-10  135  		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_RDMSR_SAFE, %[err])
08970fc4e03857 include/asm-x86/msr.h      H. Peter Anvin            2008-08-25  136  		     : [err] "=r" (*err), EAX_EDX_RET(val, low, high)
d52a7344bdfa9c arch/x86/include/asm/msr.h Peter Zijlstra            2021-11-10  137  		     : "c" (msr));
fdb46faeab2f3f arch/x86/include/asm/msr.h Steven Rostedt (VMware    2020-09-25  138) 	if (tracepoint_enabled(read_msr))
7f47d8cc039f87 arch/x86/include/asm/msr.h Andi Kleen                2015-12-01  139  		do_trace_read_msr(msr, EAX_EDX_VAL(val, low, high), *err);
c210d24986dc19 include/asm-x86/msr.h      Glauber de Oliveira Costa 2008-01-30  140  	return EAX_EDX_VAL(val, low, high);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  141  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  142  
b2c5ea4f759190 arch/x86/include/asm/msr.h Wanpeng Li                2016-11-07  143  /* Can be uninlined because referenced by paravirt */
5d07c2cc1962fa arch/x86/include/asm/msr.h Borislav Petkov           2016-11-02  144  static inline void notrace
5d07c2cc1962fa arch/x86/include/asm/msr.h Borislav Petkov           2016-11-02  145  native_write_msr(unsigned int msr, u32 low, u32 high)
b2c5ea4f759190 arch/x86/include/asm/msr.h Wanpeng Li                2016-11-07  146  {
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  147  	__wrmsr(msr, low, high);
a585df8edabdb4 arch/x86/include/asm/msr.h Borislav Petkov           2017-01-20  148  
fdb46faeab2f3f arch/x86/include/asm/msr.h Steven Rostedt (VMware    2020-09-25 @149) 	if (tracepoint_enabled(write_msr))
7f47d8cc039f87 arch/x86/include/asm/msr.h Andi Kleen                2015-12-01 @150  		do_trace_write_msr(msr, ((u64)high << 32 | low), 0);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  151  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner           2007-10-23  152  

:::::: The code at line 122 was first introduced by commit
:::::: fdb46faeab2f3fa2b43a55059b33b8f98b2e1442 x86: Use tracepoint_enabled() for msr tracepoints instead of open coding it

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
