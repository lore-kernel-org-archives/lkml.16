Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C08266565;
	Tue, 20 May 2025 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734747; cv=none; b=EXFmnMovImvBc2bsd6nwVcI+fTivqkbJZAtSnGuLN/eIacokN+l95oD5mKqyKX3VzQewEHvy+/UjDLQQup4vT8QSSbb3xevbV6PQiOHILaPioOD7nZVqmoED6T5k6V6Dz/GAIzkC1yWS0zwKHTlDrstUvkfX/kJk2yx2agOroTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734747; c=relaxed/simple;
	bh=h/h0dnmW+e8eb7BpFrGOs6KEuwxdMkbEf18N/8+UCyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiaqIcSOL+AN8tA/rC4hFQswJIYXjBxyrjOgZOARaNdA+BWkF5Is7AhEijvuZVrWjIkypetqsfP3P/3q1cX/vUHU9QIDwKIW382rjZaoz76FxRlqmts1UQ+sE/5Z7oYc6Md3Hj5dh34sdFoMNlsvJCk8g/qJlwmyJo8RaD4IqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCf4FFuy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCf4FFuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747734745; x=1779270745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h/h0dnmW+e8eb7BpFrGOs6KEuwxdMkbEf18N/8+UCyU=;
  b=eCf4FFuyCc+i+bVcUb/wsKzac3ST57HGtcOpmqlpYq+PnR5U+K0C46QW
   +B7yU8kRw2wseBSfVZeGXF2EqJ64I3wfzK0IhraJ1cy7o9s6gASjgv6w8
   HNWW5gm8H30JymFj10LjTkKJCkwNABiJYdgHVFs8wBf1fp1zp5mgYK+t4
   cTRdis7xovowyWhtySKVxvmebjON2vZ/jxI+jyrI9Lfqr6hpz05vOoRlp
   nQtoJg5zb6KiH3asl/4f9ZU2KY21AtIUlWuz1KJsgzSa7lM7/Ec3zvUrr
   h0EHnkQwc7e2Ey5LVmI/izz83f+k0l4ejPwA8ME5j2rU8cBDlK1ZJKWsR
   A==;
X-CSE-ConnectionGUID: SvDaUKMRQfmhJxkyKstojA==
X-CSE-MsgGUID: Wcqsk+zTSTKo688DNqI8fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49760568"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49760568"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:52:23 -0700
X-CSE-ConnectionGUID: 3qIB5naYSh6wPginL6Csgw==
X-CSE-MsgGUID: 2CquOxyBQUSUf7T5Q6efTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="170531758"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2025 02:52:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHJdv-000MPc-23;
	Tue, 20 May 2025 09:52:15 +0000
Date: Tue, 20 May 2025 17:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, david@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
	ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
	jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com, Usama Arif <usamaarif642@gmail.com>
Subject: Re: [PATCH v3 1/7] mm: khugepaged: extract vm flag setting outside
 of hugepage_madvise
Message-ID: <202505201734.8Fyk3qKi-lkp@intel.com>
References: <20250519223307.3601786-2-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519223307.3601786-2-usamaarif642@gmail.com>

Hi Usama,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-khugepaged-extract-vm-flag-setting-outside-of-hugepage_madvise/20250520-063452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250519223307.3601786-2-usamaarif642%40gmail.com
patch subject: [PATCH v3 1/7] mm: khugepaged: extract vm flag setting outside of hugepage_madvise
config: s390-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201734.8Fyk3qKi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201734.8Fyk3qKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201734.8Fyk3qKi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/khugepaged.c:359:20: error: use of undeclared identifier 'vma'
     359 |                 if (mm_has_pgste(vma->vm_mm))
         |                                  ^
   1 error generated.


vim +/vma +359 mm/khugepaged.c

b46e756f5e4703 Kirill A. Shutemov 2016-07-26  348  
d2a8f83f11a4ba Usama Arif         2025-05-19  349  int hugepage_set_vmflags(unsigned long *vm_flags, int advice)
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  350  {
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  351  	switch (advice) {
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  352  	case MADV_HUGEPAGE:
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  353  #ifdef CONFIG_S390
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  354  		/*
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  355  		 * qemu blindly sets MADV_HUGEPAGE on all allocations, but s390
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  356  		 * can't handle this properly after s390_enable_sie, so we simply
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  357  		 * ignore the madvise to prevent qemu from causing a SIGSEGV.
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  358  		 */
b46e756f5e4703 Kirill A. Shutemov 2016-07-26 @359  		if (mm_has_pgste(vma->vm_mm))
d2a8f83f11a4ba Usama Arif         2025-05-19  360  			return -EPERM;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  361  #endif
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  362  		*vm_flags &= ~VM_NOHUGEPAGE;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  363  		*vm_flags |= VM_HUGEPAGE;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  364  		break;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  365  	case MADV_NOHUGEPAGE:
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  366  		*vm_flags &= ~VM_HUGEPAGE;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  367  		*vm_flags |= VM_NOHUGEPAGE;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  368  		/*
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  369  		 * Setting VM_NOHUGEPAGE will prevent khugepaged from scanning
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  370  		 * this vma even if we leave the mm registered in khugepaged if
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  371  		 * it got registered before VM_NOHUGEPAGE was set.
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  372  		 */
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  373  		break;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  374  	}
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  375  
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  376  	return 0;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  377  }
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  378  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
