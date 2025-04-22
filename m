Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F1D530
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309768; cv=none; b=QnSMwwsU5EwiH/v/LtM2gVpP0YtpQMnBZnYQuwMaW7Et/pwUYSI5TBkRPNJyQpayROdt9mhq/teP5B6Qumi1xMCQ9xzIXFTE34eupAatWS6yj6fsqy+gxKX9xss+ziW1oZuQnw79tVa2AsArHxiGWizAA8QNVqw6cJXUc0H26uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309768; c=relaxed/simple;
	bh=KvPOhS69oCGL7AaNjD3lCLWnbvb8F9DwlhqTzhsBovY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ljTg6VvHsEhwxDvvA7eFMbxLE0bHV7aE4OjfCgobJc+6ZxpJ7UeoFAs6I6sHHDg4DPg4873leNEmCgWItrkgYgbG+p6leRtCnosshmOHn1bxvBdiiuLfqWzi2DYZzGlkVgT9f/aHgqN+ArXVeyVge+s4OPFLoq1HSZdU9VKw1sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieH10vtx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieH10vtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745309764; x=1776845764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KvPOhS69oCGL7AaNjD3lCLWnbvb8F9DwlhqTzhsBovY=;
  b=ieH10vtxrdbIIPv3IyV06+XTRZSCwNUpboMZSz4y5nkteSz7a6JMSfV7
   gkEri80LcT1j1lLZOmYr9G3s1jfX0Uej86g/gxWvi92gH5+ljSbGkhVIR
   Rpfz+gBowlqiR3poPySdHfVaZreioJGsggKhrzDYK/kqmJTCzPB0z8wQY
   Fu28BDguDrjNGupHY26QbdMsFbMbnFnLRIRakvtbJS+9CYhUhw/lMb2v/
   BXq1zBqc1I8FZ2VL0OBqTDNw+gQqoiScp4Zw5RpepEuC+U4WeD/Ggrvx7
   P41esp1d2Uu+zNXT2CPfb7OZppHK4VUwxMEm5by5NKYbFPZU8t2V8+Xd2
   w==;
X-CSE-ConnectionGUID: 1OBzNvKyQ+mO3IzSyArgfg==
X-CSE-MsgGUID: bV5mFfT4QbqCIaggqY59ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46091748"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="46091748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 01:16:04 -0700
X-CSE-ConnectionGUID: h9o4rEQPRWesen/87u1OYA==
X-CSE-MsgGUID: h6m6EyDeTsWXIwIA27GC6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="131947041"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2025 01:16:02 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u78nQ-0000jp-0R;
	Tue, 22 Apr 2025 08:16:00 +0000
Date: Tue, 22 Apr 2025 16:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>
Subject: mm/kmsan/hooks.c:269:14: sparse: sparse: cast removes address space
 '__user' of expression
Message-ID: <202504221600.LRuSAGXA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a33b5a08cbbdd7aadff95f40cbb45ab86841679e
commit: 3a8f6f3b469b4075919a3613e182f9a70df92d46 kmsan: enable on s390
date:   10 months ago
config: s390-randconfig-r113-20250422 (https://download.01.org/0day-ci/archive/20250422/202504221600.LRuSAGXA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250422/202504221600.LRuSAGXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504221600.LRuSAGXA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kmsan/hooks.c:269:14: sparse: sparse: cast removes address space '__user' of expression
   mm/kmsan/hooks.c:271:75: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void const *user_addr @@     got void [noderef] __user *to @@
   mm/kmsan/hooks.c:271:75: sparse:     expected void const *user_addr
   mm/kmsan/hooks.c:271:75: sparse:     got void [noderef] __user *to
   mm/kmsan/hooks.c:280:50: sparse: sparse: cast removes address space '__user' of expression
   mm/kmsan/hooks.c:306:59: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:319:79: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:325:79: sparse: sparse: Using plain integer as NULL pointer
   mm/kmsan/hooks.c:421:78: sparse: sparse: Using plain integer as NULL pointer

vim +/__user +269 mm/kmsan/hooks.c

b073d7f8aee4eb Alexander Potapenko 2022-09-15  247  
75cf0290271bf6 Alexander Potapenko 2022-09-15  248  void kmsan_copy_to_user(void __user *to, const void *from, size_t to_copy,
75cf0290271bf6 Alexander Potapenko 2022-09-15  249  			size_t left)
75cf0290271bf6 Alexander Potapenko 2022-09-15  250  {
75cf0290271bf6 Alexander Potapenko 2022-09-15  251  	unsigned long ua_flags;
75cf0290271bf6 Alexander Potapenko 2022-09-15  252  
75cf0290271bf6 Alexander Potapenko 2022-09-15  253  	if (!kmsan_enabled || kmsan_in_runtime())
75cf0290271bf6 Alexander Potapenko 2022-09-15  254  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  255  	/*
75cf0290271bf6 Alexander Potapenko 2022-09-15  256  	 * At this point we've copied the memory already. It's hard to check it
75cf0290271bf6 Alexander Potapenko 2022-09-15  257  	 * before copying, as the size of actually copied buffer is unknown.
75cf0290271bf6 Alexander Potapenko 2022-09-15  258  	 */
75cf0290271bf6 Alexander Potapenko 2022-09-15  259  
75cf0290271bf6 Alexander Potapenko 2022-09-15  260  	/* copy_to_user() may copy zero bytes. No need to check. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  261  	if (!to_copy)
75cf0290271bf6 Alexander Potapenko 2022-09-15  262  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  263  	/* Or maybe copy_to_user() failed to copy anything. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  264  	if (to_copy <= left)
75cf0290271bf6 Alexander Potapenko 2022-09-15  265  		return;
75cf0290271bf6 Alexander Potapenko 2022-09-15  266  
75cf0290271bf6 Alexander Potapenko 2022-09-15  267  	ua_flags = user_access_save();
f926e9326f3a79 Ilya Leoshkevich    2024-06-21  268  	if (!IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) ||
f926e9326f3a79 Ilya Leoshkevich    2024-06-21 @269  	    (u64)to < TASK_SIZE) {
75cf0290271bf6 Alexander Potapenko 2022-09-15  270  		/* This is a user memory access, check it. */
75cf0290271bf6 Alexander Potapenko 2022-09-15  271  		kmsan_internal_check_memory((void *)from, to_copy - left, to,
75cf0290271bf6 Alexander Potapenko 2022-09-15  272  					    REASON_COPY_TO_USER);
75cf0290271bf6 Alexander Potapenko 2022-09-15  273  	} else {
75cf0290271bf6 Alexander Potapenko 2022-09-15  274  		/* Otherwise this is a kernel memory access. This happens when a
75cf0290271bf6 Alexander Potapenko 2022-09-15  275  		 * compat syscall passes an argument allocated on the kernel
75cf0290271bf6 Alexander Potapenko 2022-09-15  276  		 * stack to a real syscall.
75cf0290271bf6 Alexander Potapenko 2022-09-15  277  		 * Don't check anything, just copy the shadow of the copied
75cf0290271bf6 Alexander Potapenko 2022-09-15  278  		 * bytes.
75cf0290271bf6 Alexander Potapenko 2022-09-15  279  		 */
75cf0290271bf6 Alexander Potapenko 2022-09-15  280  		kmsan_internal_memmove_metadata((void *)to, (void *)from,
75cf0290271bf6 Alexander Potapenko 2022-09-15  281  						to_copy - left);
75cf0290271bf6 Alexander Potapenko 2022-09-15  282  	}
75cf0290271bf6 Alexander Potapenko 2022-09-15  283  	user_access_restore(ua_flags);
75cf0290271bf6 Alexander Potapenko 2022-09-15  284  }
75cf0290271bf6 Alexander Potapenko 2022-09-15  285  EXPORT_SYMBOL(kmsan_copy_to_user);
75cf0290271bf6 Alexander Potapenko 2022-09-15  286  

:::::: The code at line 269 was first introduced by commit
:::::: f926e9326f3a79f7e01ac790e2361f44d8ca8320 kmsan: fix kmsan_copy_to_user() on arches with overlapping address spaces

:::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
