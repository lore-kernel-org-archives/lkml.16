Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50F1917F9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744597785; cv=none; b=C4LZI1yLBtFXnT9aOPvO5F51VGzld2F8VnGaWZPcEhuEGSPElUKEW2zb4kMWrbL96S0ModctkUXjYx7MYyXNif4bbLE1uYUova4cdV9+BckO+FnQoxF/Hm7HWA++HSnUTdhAUUmdxLT0O1Obw57SIXqg/HF3VE31CznIuJt4yjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744597785; c=relaxed/simple;
	bh=Ij3M9xTV2cJVyqoJpwuWnj7OztPPD/2nBy+flsgK+Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WQYu9Ze+hEEzGa666hDhB6PtBCyWIe9Rn/71iJHAMKTwOyQ34bWfEiLQuvKp9o25KO5HWL5LzHqclx4NxM45GoGVCswc4svSouY/pljkYNPZSnQ/dY/ZVFSGt342/Mq/xXjon+nIqivf2BL//6AyEu3k6YlRI3hScaRvUbDgiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEMgK4R8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEMgK4R8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744597783; x=1776133783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ij3M9xTV2cJVyqoJpwuWnj7OztPPD/2nBy+flsgK+Ds=;
  b=EEMgK4R8jeR4DHJrlNrl92z+YcalZl78kCxXPEnfgda7RzQ0h0YM9vzX
   Pk38nIhFZNgtq39dsT8AuYCwnlAuxJuim/pWnlvMaYgC2goAk5ZoBUNYt
   voIjSVjAhcQAD9nEZpWmNDDPPc/FphVLieWWmXLqe/kQwdEr1jnV5ba3Q
   fWDKEA+sxSA80X6N8HL2l8sX+CbLEL8fVTWbk77/QIc5LcgX5FoPelbc5
   2qC0sX/AURvsDbhmhN0/NqW3krp8eGNBz48YOxsLMRdN381oWIXg6CVGw
   YQwo0QkoHgFnGybOjA4DMJUneQBsIuTARdTkILWPWRLrbRwMlJ6lxMdGq
   A==;
X-CSE-ConnectionGUID: YoyrL5XxSLmakxByykrOkw==
X-CSE-MsgGUID: esyImdHvTh6VQsPgk1dcYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49856893"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49856893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 19:29:43 -0700
X-CSE-ConnectionGUID: CZ7wq4IxSSqXlqfmrW3ZDQ==
X-CSE-MsgGUID: sSzqAEDsSo2Y0d/+IGNPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134763487"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Apr 2025 19:29:41 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u49Zr-000DCh-0N;
	Mon, 14 Apr 2025 02:29:39 +0000
Date: Mon, 14 Apr 2025 10:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:x86/alternatives 38/58] arch/x86/um/../kernel/module.c:209:
 undefined reference to `smp_text_poke_sync_each_cpu'
Message-ID: <202504141003.kc69fVoj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/alternatives
head:   af8967158f9ad759a93e8e7a933c10e7cbb01ba2
commit: 6e4955a9d73ebdc8496e6bff7f6d2bf83c01959f [38/58] x86/alternatives: Rename 'text_poke_sync()' to 'smp_text_poke_sync_each_cpu()'
config: um-defconfig (https://download.01.org/0day-ci/archive/20250414/202504141003.kc69fVoj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141003.kc69fVoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141003.kc69fVoj-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/x86/kernel/module.o: in function `apply_relocate_add':
>> arch/x86/um/../kernel/module.c:209: undefined reference to `smp_text_poke_sync_each_cpu'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +209 arch/x86/um/../kernel/module.c

   188	
   189	static int write_relocate_add(Elf64_Shdr *sechdrs,
   190				      const char *strtab,
   191				      unsigned int symindex,
   192				      unsigned int relsec,
   193				      struct module *me,
   194				      bool apply)
   195	{
   196		int ret;
   197		bool early = me->state == MODULE_STATE_UNFORMED;
   198		void *(*write)(void *, const void *, size_t) = memcpy;
   199	
   200		if (!early) {
   201			write = text_poke;
   202			mutex_lock(&text_mutex);
   203		}
   204	
   205		ret = __write_relocate_add(sechdrs, strtab, symindex, relsec, me,
   206					   write, apply);
   207	
   208		if (!early) {
 > 209			smp_text_poke_sync_each_cpu();
   210			mutex_unlock(&text_mutex);
   211		}
   212	
   213		return ret;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
