Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CC5219A97
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788126; cv=none; b=OSKTEiDMWY71kLDigRCD0Qf6wCMoXyv1QJMbFlX8qGvko5nWjdfZZZSWd9yhYcolqxldwVKaYJYD9L7YEVD0Vb+B21gEY1m14TblLHsUoVajOl2H5zSChVB6krm34T0iUKK0tnkqRHk1esSLAlppJ+FNiBs1VsUEwhNB9164adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788126; c=relaxed/simple;
	bh=qAn2gavUN3kjKs6JO64H2BBeRbzexvhd1YVTNaubjzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZYutg18YbLKIpuA9n7Z18tMUYGCN8UcJdic3y74G2X1EhywD3EpuATl0V3kbNDBt10zf9nvdKKZsP7QKfyIX6DA9B9skLgiblwgp7C7krJ6/RhHJ5kghstrmslb8k5qJEuhituZoorhLnfmlHdp5rtxd9mDBjta6Sryx7xlLQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVRMdqp2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVRMdqp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744788125; x=1776324125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qAn2gavUN3kjKs6JO64H2BBeRbzexvhd1YVTNaubjzI=;
  b=kVRMdqp286P2KXgINdb8JLBKSwZ+F+rQ1drFHT+BaMYYY+lw5+/izNk+
   97nqEXPCTGKoYxOF/QvDWTbjDnAUkmHzTLGy+X9LorPJ5+rMVIvS7kL+7
   zpNSm7LiMIkFUCGC8DHLmMYVkdnCdoM49NkTL/oAoMqyuC/9la3AWE6DD
   AFpjKuFHJrCIaTKrcNguGlQEYzCzW+qjp91twZ3vociy0SsoAn3fmA1Od
   BpCznC5Pua57Gz9R1vgg0aHcGkIcf7FH3aCC3C3oWHP2/YpNv90RAxlFb
   UF8yovp8kSskNVMVgSqUaSF3oZlhbEbgXfM7GQGFG56oGUbvmnbui0bZj
   g==;
X-CSE-ConnectionGUID: 4lepfI9IQsyLWrq5jerx2Q==
X-CSE-MsgGUID: zWQ2MB0dSjqyuAAiO4+ByQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57710815"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="57710815"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:22:04 -0700
X-CSE-ConnectionGUID: 3TFzByauSvC4oLtQb8L1ew==
X-CSE-MsgGUID: XssrkKJcSbyndgCPf4z/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135418907"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2025 00:22:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4x5r-000JFE-1G;
	Wed, 16 Apr 2025 07:21:59 +0000
Date: Wed, 16 Apr 2025 15:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before
 restoring vmemmap
Message-ID: <202504161523.M2CmTjsj-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20250416 (https://download.01.org/0day-ci/archive/20250416/202504161523.M2CmTjsj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161523.M2CmTjsj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161523.M2CmTjsj-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb_vmemmap.c: In function 'hugetlb_vmemmap_restore_folio':
>> mm/hugetlb_vmemmap.c:506:9: error: implicit declaration of function 'set_hugetlb_cgroup' [-Werror=implicit-function-declaration]
     506 |         set_hugetlb_cgroup(folio, TAIL_MAPPING);
         |         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
