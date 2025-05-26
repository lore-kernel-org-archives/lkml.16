Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB5A28E5EE
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516606; cv=none; b=iTAg2MOMBuMRG3PWe8wANBVNZghA+IWWlyiubgJo4kKAUQS8lJ8qU9MsZPVAdX4SfnqlU/oWplY3XhtkYXNgeXQqkzIIva7hAWn7seUogu3eZbM0jWfsYfXNKj+BcZLr9y6dATxKm2KmM07YXobst+f1kHXlWyBSCdq8DSxz7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516606; c=relaxed/simple;
	bh=a5P0gjL8Vo5KhlId+oMX9JsVNueZoptKbI4BdgfocF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+bJkuv6466WctDGBOkEpiRitQlrCJPZaxwsSxxAehXLWpkXqHme8vaRxEMDmdoCy3QL4bvi0OwsQpEdRB0UWKzzUHab+UgtFs2IM2RgUP+IzLGknER7SdmORrjhm5g3WUuIqXAEKLl4ilFqtcafmJAENF73FEmWqyg1ynod2gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckWi9FuQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckWi9FuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516605; x=1780052605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a5P0gjL8Vo5KhlId+oMX9JsVNueZoptKbI4BdgfocF0=;
  b=ckWi9FuQrknmdsncpHxlfqYsAkJF+ClOPntVdQSlnK7yyjVHP39XjN1m
   r+V7cQdmew97/IZ1z+iq0sa8nhFE0wpOBcidqT2Hs6cxiVtYFG+UHqS8f
   0GX42uiXm5E/r2kAuDcZH53mwci/UZH46pk62HWRZdNslGWvHVn7GLjKT
   rPYO3oYbsF+ttc4UtQ0iknI4Ym6TJiQjZ6UjrCdan7BXei2nRT2mo/pJw
   7g52KRvqknKpGX7FOXmJh99uHn2o+D3VRf/I90yPDqvnQl2Vk2j6VVlsM
   RB3Iyljpj4U+Aj6MrUC65ArNrkt+3Z9QElFpQVh6i0raxo7Q7gvJfHr96
   Q==;
X-CSE-ConnectionGUID: XfheHlfKQVeKGNKorH1erQ==
X-CSE-MsgGUID: howsLqpPRmGlqtUcfG/kMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60830497"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="60830497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:25 -0700
X-CSE-ConnectionGUID: o0aJREnsTGuTgMvnT4VpSQ==
X-CSE-MsgGUID: 7+jSCsvTRDK+7087BF/e4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="143864674"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 04:03:23 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2f-0000hF-11;
	Thu, 29 May 2025 11:03:21 +0000
Date: Tue, 27 May 2025 01:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: include/linux/ftrace.h:138:9: warning: returning 'int' from a
 function with return type 'struct pt_regs *' makes pointer from integer
 without a cast
Message-ID: <202505270110.axfo7Wl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
commit: 7caa9765465f60b6d88e22264892cee12d971888 ftrace: riscv: move from REGS to ARGS
date:   1 year ago
config: riscv-randconfig-2001-20250514 (https://download.01.org/0day-ci/archive/20250527/202505270110.axfo7Wl5-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270110.axfo7Wl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270110.axfo7Wl5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   include/linux/ftrace.h: In function 'ftrace_get_regs':
   include/linux/ftrace.h:138:9: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=implicit-function-declaration]
     return arch_ftrace_get_regs(fregs);
            ^~~~~~~~~~~~~~~~~~~~
            ftrace_get_regs
>> include/linux/ftrace.h:138:9: warning: returning 'int' from a function with return type 'struct pt_regs *' makes pointer from integer without a cast [-Wint-conversion]
     return arch_ftrace_get_regs(fregs);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=145074831
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=145074831
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=145074831
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=145074831
   make: Target 'prepare' not remade because of errors.


vim +138 include/linux/ftrace.h

d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  132) 
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  133) static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  134) {
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  135) 	if (!fregs)
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  136) 		return NULL;
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  137) 
02a474ca266a47 Steven Rostedt (VMware  2020-10-27 @138) 	return arch_ftrace_get_regs(fregs);
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  139) }
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  140) 

:::::: The code at line 138 was first introduced by commit
:::::: 02a474ca266a47ea8f4d5a11f4ffa120f83730ad ftrace/x86: Allow for arguments to be passed in to ftrace_regs by default

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
