Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEEF22F14C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790050; cv=none; b=O6RQpvVG6bAOIiDD+Yau7G9rg/0JGNrl2U/WxshQaAb/uV30jDX7g44tlpReTyoIBWxEI1LsKuaUZ85BAh1T+NQ3q0gnVNxmN0DtOQxFdamyESCZxLEmgo3gvfvJgY8Bx31V9mNVccXX4RTxEuIfrusVLux5VoqZmqd8pwpUjHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790050; c=relaxed/simple;
	bh=M+jg169zSVo6ZismI6ncNWlx1PXdIQmNy/hfg0Q9PJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9imdWnPdzzO3zZUHS70F9quzNttNnZGmPfDT7VPmIoJG3UNW6aLQ+hvOYM8USiNYYgVnaiek7eYNVfTU+T96ReSZLdJikctLCyI+tGp/A2f84o+i8+ObsxU+uXfi+SB3CDn4fQP6cdNrR5YZraf/52x6WWQfsbrTO4u7Aqwo6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PC/sMngk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PC/sMngk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744790047; x=1776326047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M+jg169zSVo6ZismI6ncNWlx1PXdIQmNy/hfg0Q9PJQ=;
  b=PC/sMngkAdrvSQh9k0miF/lEtMEB4ZNVk590Y5O4IyqQA/PIBFiq6Z2d
   Rte8alQKLM1nAfkQRJU4CDlybW9ENlI4KoUECxJAD3Mz/Ac7ygpqsR0BA
   dMzH+0aL5E3soRgzTtS7rZg8MgoQk0ZQRZX7I2KJQdUiUCre5dSAM8rWL
   cJpxWaRWgrqgiEw0Gq98f2R3yECNMCJZh5mAGrrqKtdKHAc651o4/n+/K
   g/bo1zNMDW6l2sj0rubDyJbp9l8pBVO5w+MPR7pOrsrmm7g/PH4huzudD
   SUUYw7LH9rOCQXa2K7aiYfAQHSa7ql1S5GUaROjMN4xXGHEh0urp3vWP1
   w==;
X-CSE-ConnectionGUID: irLmjjtmRJGen8aPKc1VOg==
X-CSE-MsgGUID: WrKoN0YLTb2vi8txtc/CjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46487841"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46487841"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:54:06 -0700
X-CSE-ConnectionGUID: y+iglnNJQK6HRW0n2kQwyw==
X-CSE-MsgGUID: pi2gb3OgRoup42oW9KxnBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130891544"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Apr 2025 00:54:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4xar-000JGi-2f;
	Wed, 16 Apr 2025 07:54:01 +0000
Date: Wed, 16 Apr 2025 15:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before
 restoring vmemmap
Message-ID: <202504161522.S1qEFD4b-lkp@intel.com>
References: <20250415054705.370412-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415054705.370412-1-osalvador@suse.de>

Hi Oscar,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-hugetlb-Reset-mapping-to-TAIL_MAPPING-before-restoring-vmemmap/20250415-134835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250415054705.370412-1-osalvador%40suse.de
patch subject: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before restoring vmemmap
config: x86_64-buildonly-randconfig-006-20250416 (https://download.01.org/0day-ci/archive/20250416/202504161522.S1qEFD4b-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161522.S1qEFD4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161522.S1qEFD4b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hugetlb_vmemmap.c:506:2: error: call to undeclared function 'set_hugetlb_cgroup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     506 |         set_hugetlb_cgroup(folio, TAIL_MAPPING);
         |         ^
   1 error generated.


vim +/set_hugetlb_cgroup +506 mm/hugetlb_vmemmap.c

   488	
   489	/**
   490	 * hugetlb_vmemmap_restore_folio - restore previously optimized (by
   491	 *				hugetlb_vmemmap_optimize_folio()) vmemmap pages which
   492	 *				will be reallocated and remapped.
   493	 * @h:		struct hstate.
   494	 * @folio:     the folio whose vmemmap pages will be restored.
   495	 *
   496	 * Return: %0 if @folio's vmemmap pages have been reallocated and remapped,
   497	 * negative error code otherwise.
   498	 */
   499	int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *folio)
   500	{
   501		/*
   502		 * Before restoring vmemmap, make sure to reset mapping to TAIL_MAPPING,
   503		 * so tail pages that were reset will have the right thing after being
   504		 * restored, and the checks in free_tail_page_prepare() will pass.
   505		 */
 > 506		set_hugetlb_cgroup(folio, TAIL_MAPPING);
   507		return __hugetlb_vmemmap_restore_folio(h, folio, VMEMMAP_SYNCHRONIZE_RCU);
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
