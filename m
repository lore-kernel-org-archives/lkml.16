Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78183188715
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 05:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747545844; cv=none; b=iOn1zTuCpsmCyewAQ3kZzndN/6GrapGNWxRmQX87eSKNaPySDZDP7r+AyMxa+eGPQyazMiAap5FZWN2jm8BCxud5MgADQS216GIPle6rz53jNJuj3rLElXQaZGrG34lbjaUNacuc6cxOT1YEXUsDh1xtPg3FG+8cJq+WZHapQQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747545844; c=relaxed/simple;
	bh=QEn3NUGeStN9ihHdR7pciRyEMTXinS7QnBWZVdLbeZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZ1ZVkdr3VUsK56VWGql7dVCNTZYmGt/6T1UeM9waUmkv1H/nZirtj7mjmbloY5mEhSedVNkwEPu/qMlExIrEX/FyKdpvllBXwEoVZlDmsgGDgsu/5kHj5YPN0o9G2yVYt5MBhUZpBhBnz01d8fcx8yE/yvf76XZuD42CxwKpHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfnJu0q6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfnJu0q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747545843; x=1779081843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QEn3NUGeStN9ihHdR7pciRyEMTXinS7QnBWZVdLbeZM=;
  b=QfnJu0q6RxRlyfQQfJMYO29/ayaivT+F9XVYd3564aWm+kQ8xiB2kLvF
   E3zKJho2YJxNnmjCQq+oHT/WIoEhscfz7wo4mrkJ0mkEnZAnoIyOJsmNK
   rmDLCNQIGDxIhNtDhPOKTqK6+vCg+E9SyqNd/B0/yKlfCJMzrgVnzGYn0
   OC4Rku69dmdc0m9pHNuf3XJ84UC0JMKXjnlJ4daD0w27zsdtJEJr9go6l
   32UxYdjyfQhvyiOKWshEQjA6MgztNcunjTndkqjLl7So8Os14mHAg8dEn
   raylmmtrBFWtLQtPDojWOEVsLcFtnbUezbEMTulNeuPtgIew82FZhWCWT
   w==;
X-CSE-ConnectionGUID: q/glBqmORYi8tfcpdvRozA==
X-CSE-MsgGUID: aH2MKxJdQQek57Rw6h8kHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="59700910"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="59700910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 22:24:02 -0700
X-CSE-ConnectionGUID: yRIS3bhXTo+Tw/8YAmBZFQ==
X-CSE-MsgGUID: XkduK6kTTnCv6/JOIKS8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="138971031"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2025 22:23:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGWV9-000Ke7-0x;
	Sun, 18 May 2025 05:23:55 +0000
Date: Sun, 18 May 2025 13:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Juan Yescas <jyescas@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	tjmercier@google.com, isaacmanjarres@google.com,
	kaleshsingh@google.com, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v5] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Message-ID: <202505181321.IBrAyg7D-lkp@intel.com>
References: <20250516232341.659513-1-jyescas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516232341.659513-1-jyescas@google.com>

Hi Juan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm-Add-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250517-072434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250516232341.659513-1-jyescas%40google.com
patch subject: [PATCH v5] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
config: i386-randconfig-r073-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181321.IBrAyg7D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181321.IBrAyg7D-lkp@intel.com/

smatch warnings:
mm/compaction.c:849 skip_isolation_on_order() warn: always true condition '(order >= (((((22 - 12))) < ((0))) ?(((22 - 12))):((0)))) => (s32min-s32max >= 0)'
mm/page_alloc.c:730 __del_page_from_free_list() warn: always true condition '(order >= (((((22 - 12))) < ((0))) ?(((22 - 12))):((0)))) => (0-u32max >= 0)'
mm/page_alloc.c:679 __add_to_free_list() warn: always true condition '(order >= (((((22 - 12))) < ((0))) ?(((22 - 12))):((0)))) => (0-u32max >= 0)'
mm/page_alloc.c:704 move_to_free_list() warn: always true condition '(order >= (((((22 - 12))) < ((0))) ?(((22 - 12))):((0)))) => (0-u32max >= 0)'
mm/page_alloc.c:2036 should_try_claim_block() warn: always true condition '(order >= (((((22 - 12))) < ((0))) ?(((22 - 12))):((0)))) => (0-u32max >= 0)'
mm/page_alloc.c:2043 should_try_claim_block() warn: always true condition '(order >= (((((22 - 12))) < ((0))) ?(((22 - 12))):((0))) / 2) => (0-u32max >= 0)'
mm/page_alloc.c:2112 try_to_claim_block() warn: always true condition '(current_order >= (((((22 - 12))) < ((0))) ?(((22 - 12))):((0)))) => (s32min-s32max >= 0)'
mm/page_alloc.c:2192 __rmqueue_claim() warn: unsigned 'order' is never less than zero.
mm/page_alloc.c:3200 reserve_highatomic_pageblock() warn: unsigned 'order' is never less than zero.
mm/page_alloc.c:3273 unreserve_highatomic_pageblock() warn: unsigned 'order' is never less than zero.

vim +849 mm/compaction.c

748446bb6b5a93 Mel Gorman 2010-05-24  825  
ee6f62fd34f0bb Zi Yan     2024-02-20  826  /**
ee6f62fd34f0bb Zi Yan     2024-02-20  827   * skip_isolation_on_order() - determine when to skip folio isolation based on
ee6f62fd34f0bb Zi Yan     2024-02-20  828   *			       folio order and compaction target order
ee6f62fd34f0bb Zi Yan     2024-02-20  829   * @order:		to-be-isolated folio order
ee6f62fd34f0bb Zi Yan     2024-02-20  830   * @target_order:	compaction target order
ee6f62fd34f0bb Zi Yan     2024-02-20  831   *
ee6f62fd34f0bb Zi Yan     2024-02-20  832   * This avoids unnecessary folio isolations during compaction.
ee6f62fd34f0bb Zi Yan     2024-02-20  833   */
ee6f62fd34f0bb Zi Yan     2024-02-20  834  static bool skip_isolation_on_order(int order, int target_order)
ee6f62fd34f0bb Zi Yan     2024-02-20  835  {
ee6f62fd34f0bb Zi Yan     2024-02-20  836  	/*
ee6f62fd34f0bb Zi Yan     2024-02-20  837  	 * Unless we are performing global compaction (i.e.,
ee6f62fd34f0bb Zi Yan     2024-02-20  838  	 * is_via_compact_memory), skip any folios that are larger than the
ee6f62fd34f0bb Zi Yan     2024-02-20  839  	 * target order: we wouldn't be here if we'd have a free folio with
ee6f62fd34f0bb Zi Yan     2024-02-20  840  	 * the desired target_order, so migrating this folio would likely fail
ee6f62fd34f0bb Zi Yan     2024-02-20  841  	 * later.
ee6f62fd34f0bb Zi Yan     2024-02-20  842  	 */
ee6f62fd34f0bb Zi Yan     2024-02-20  843  	if (!is_via_compact_memory(target_order) && order >= target_order)
ee6f62fd34f0bb Zi Yan     2024-02-20  844  		return true;
ee6f62fd34f0bb Zi Yan     2024-02-20  845  	/*
ee6f62fd34f0bb Zi Yan     2024-02-20  846  	 * We limit memory compaction to pageblocks and won't try
ee6f62fd34f0bb Zi Yan     2024-02-20  847  	 * creating free blocks of memory that are larger than that.
ee6f62fd34f0bb Zi Yan     2024-02-20  848  	 */
ee6f62fd34f0bb Zi Yan     2024-02-20 @849  	return order >= pageblock_order;
ee6f62fd34f0bb Zi Yan     2024-02-20  850  }
ee6f62fd34f0bb Zi Yan     2024-02-20  851  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
