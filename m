Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69254433D9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745789846; cv=none; b=BEuXT2Z7Q532ic0V+3sLJndAWo6ya8ux3xizXG7SHmGdlrMlypqQMZkjMqokrx/8piomziY0996oN+E1dTThLZABkMsa0HZh5kKKsxjST6DKMHTZt4iJ13fBGrRh/j33meW+0qKT9HyESU7os3YqgMdywKhrs94KNZojysphcLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745789846; c=relaxed/simple;
	bh=4/N/81IEoXrJM9MBN/nJeS0up7G3RDxRZwPnPkRY+3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIQs/A71uMPITL/HM6vylNlRmoJuBqFZUBp+wMhO3ONS8/l7yR9fFJ0XYCaiTS/sVER6Rbb0Kxocak8x1jvxL5Rsl6OfLjwq72R8kz4FyMT0HOLKCbOCl/c2wVnTD0QRKZYO7Ap5HdKjOrwaXZmkmEotv5j+pEn83elC7DNNDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1xgdtkc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1xgdtkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745789843; x=1777325843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4/N/81IEoXrJM9MBN/nJeS0up7G3RDxRZwPnPkRY+3I=;
  b=Q1xgdtkceTN+w4luVSdlk+/UOUHjXId+DBbv5FA8fB5ESLwHBs2M3rfy
   3d1nudGU3aPfICQdU0w8wJJ01kfUAYSX92qYCJhzB40iYvxF0U/p6NeNg
   NB1raheyP/oViDKKyLOYRS4kUVm58bTq3d0MhVwj17G9t5J1KD8ZxlePR
   yDLXiFuRm8cZOOI2Aa6in1RoMAi63bp2cB9DrhDSMwlDIsMf2SeGp1xG/
   fX1QAIoHXZEBzU52waUW1Z8Iryi1U5v5Rtpjnsrrjdj6mDdawLcF6KpzG
   N7J/F4l5BEbB5ytLG8vhG08H4NtWB3IKI/B0p3gHuoU26vfUvSNN8VJJS
   Q==;
X-CSE-ConnectionGUID: CrCUVtGgRyWSA8cQf73dKA==
X-CSE-MsgGUID: MKbSmDK/SXyWB4v3PhYxVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="34986294"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="34986294"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 14:37:22 -0700
X-CSE-ConnectionGUID: VoaLz8KeSD2MI1YZQyFxQQ==
X-CSE-MsgGUID: dm4W74+/R+SIZyn3OWmSmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="156575098"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Apr 2025 14:37:20 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u99gb-0006TV-1S;
	Sun, 27 Apr 2025 21:37:17 +0000
Date: Mon, 28 Apr 2025 05:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org, Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 5/6] mm: move folio_index to mm/swap.h and remove no
 longer needed helper
Message-ID: <202504280515.4WwtyfOc-lkp@intel.com>
References: <20250427185908.90450-6-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427185908.90450-6-ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/fuse-drop-usage-of-folio_index/20250428-030234
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250427185908.90450-6-ryncsn%40gmail.com
patch subject: [PATCH 5/6] mm: move folio_index to mm/swap.h and remove no longer needed helper
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250428/202504280515.4WwtyfOc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504280515.4WwtyfOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504280515.4WwtyfOc-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page-writeback.c: In function '__folio_mark_dirty':
>> mm/page-writeback.c:2767:50: error: implicit declaration of function 'folio_index'; did you mean 'folio_inode'? [-Wimplicit-function-declaration]
    2767 |                 __xa_set_mark(&mapping->i_pages, folio_index(folio),
         |                                                  ^~~~~~~~~~~
         |                                                  folio_inode
--
   mm/gup.c: In function 'memfd_pin_folios':
>> mm/gup.c:3652:49: error: implicit declaration of function 'folio_index'; did you mean 'folio_inode'? [-Wimplicit-function-declaration]
    3652 |                                     next_idx != folio_index(fbatch.folios[i]))
         |                                                 ^~~~~~~~~~~
         |                                                 folio_inode


vim +2767 mm/page-writeback.c

b9ea25152e5636 Konstantin Khlebnikov   2015-04-14  2742  
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2743) /*
dc6e0ae5b1700c Kemeng Shi              2024-04-25  2744   * Mark the folio dirty, and set it dirty in the page cache.
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2745)  *
203a3151661611 Matthew Wilcox (Oracle  2021-05-04  2746)  * If warn is true, then emit a warning if the folio is not uptodate and has
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2747)  * not been truncated.
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2748)  *
a8cd9d4ce35eae Shakeel Butt            2024-10-24  2749   * It is the caller's responsibility to prevent the folio from being truncated
a8cd9d4ce35eae Shakeel Butt            2024-10-24  2750   * while this function is in progress, although it may have been truncated
3d84d897920c75 Matthew Wilcox (Oracle  2024-04-16  2751)  * before this function is called.  Most callers have the folio locked.
3d84d897920c75 Matthew Wilcox (Oracle  2024-04-16  2752)  * A few have the folio blocked from truncation through other means (e.g.
3d84d897920c75 Matthew Wilcox (Oracle  2024-04-16  2753)  * zap_vma_pages() has it mapped and is holding the page table lock).
3d84d897920c75 Matthew Wilcox (Oracle  2024-04-16  2754)  * When called from mark_buffer_dirty(), the filesystem should hold a
3d84d897920c75 Matthew Wilcox (Oracle  2024-04-16  2755)  * reference to the buffer_head that is being marked dirty, which causes
3d84d897920c75 Matthew Wilcox (Oracle  2024-04-16  2756)  * try_to_free_buffers() to fail.
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2757)  */
203a3151661611 Matthew Wilcox (Oracle  2021-05-04  2758) void __folio_mark_dirty(struct folio *folio, struct address_space *mapping,
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2759) 			     int warn)
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2760) {
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2761) 	unsigned long flags;
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2762) 
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2763) 	xa_lock_irqsave(&mapping->i_pages, flags);
203a3151661611 Matthew Wilcox (Oracle  2021-05-04  2764) 	if (folio->mapping) {	/* Race with truncate? */
203a3151661611 Matthew Wilcox (Oracle  2021-05-04  2765) 		WARN_ON_ONCE(warn && !folio_test_uptodate(folio));
203a3151661611 Matthew Wilcox (Oracle  2021-05-04  2766) 		folio_account_dirtied(folio, mapping);
203a3151661611 Matthew Wilcox (Oracle  2021-05-04 @2767) 		__xa_set_mark(&mapping->i_pages, folio_index(folio),
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2768) 				PAGECACHE_TAG_DIRTY);
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2769) 	}
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2770) 	xa_unlock_irqrestore(&mapping->i_pages, flags);
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2771) }
6e1cae881a0646 Matthew Wilcox (Oracle  2021-06-28  2772) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
