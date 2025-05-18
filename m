Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784B7E1
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747566388; cv=none; b=c9NOkkwK2G+1rqJkJTgobDdZy1LlPBgkcbXq0yvts+ZnCrhZik1KP+4HSSI+TIlbkDB8lHIVdmwOMeKlvgw3JcTeZ33vVxoeXLgiUudoU5hgl1HFYMUDcwbSGBqSkJpnxdi1QZraAbYMBd60akFDAE4PMEi4XEspE6kLXY6gEXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747566388; c=relaxed/simple;
	bh=QWfnSdl856Z85mwypJieipjFXF993YS5KqHAE1cyjNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNxQiBRg+xX4Ys3ktZCTGkpdqwS7aJ20wSX/DAfGXzUm1wsQhP0d0wPFCi2uGHowQLNbbcFcIYQ32sArWsR8qesVhTFXQBostAbFLatSztHrQiYZ1KZKe7Uu/7f3Kxp10XzchH9YLAEph02d1D6UZHKrGl+XQ1fvo7kzrApna8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTRaJzqQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTRaJzqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747566386; x=1779102386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QWfnSdl856Z85mwypJieipjFXF993YS5KqHAE1cyjNY=;
  b=OTRaJzqQvrFtVf02zct49oy44ApjHt6dQb5nhW4+vQFysnwyeBjwTKuW
   Cy6yprgtE2yDtUYPYBoIQjiAp2D2JY/hKtD0iPVNxc7e8ieDPhOnaL07U
   LravCvbzPDgXkWzSM0dmmruGyW+9pOpNJVghkkctox2//FAbiVD3FPpD2
   2DT227KyWC17lsQ/rJeS6d3NUnHaYVKEj8CKC4pJ57mT0UyA0/ATEe0ZU
   RMVBbrN1R23fqUSZ2EEUOt/MBcQe6qZi3tgiITmXj5qqGVOnOT0XZnkv1
   E6tiNOthzsYfOF7VE0Jhbai9cs3tjuEQWody3K52ZqKuhnNMgyMR/TnaD
   w==;
X-CSE-ConnectionGUID: JuZ/glaRSeWvT1VDHlV3yg==
X-CSE-MsgGUID: yOmwPjDsQjuyY8zDkmLOgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="66889556"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="66889556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 04:06:26 -0700
X-CSE-ConnectionGUID: 5hAveNSLTxGHSRCzB/L7Jw==
X-CSE-MsgGUID: c7CUmisQQLu/ruOrK1t6HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="138854444"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2025 04:06:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGbqV-000KlT-2U;
	Sun, 18 May 2025 11:06:19 +0000
Date: Sun, 18 May 2025 19:05:43 +0800
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
Message-ID: <202505181825.FdKgAQ16-lkp@intel.com>
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
config: i386-randconfig-r072-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181825.FdKgAQ16-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181825.FdKgAQ16-lkp@intel.com/

smatch warnings:
mm/compaction.c:302 pageblock_skip_persistent() warn: always true condition '(compound_order(page) >= (((((22 - 12))) < ((0))) ?(((22 - 12))):((0)))) => (0-u32max >= 0)'
mm/page_alloc.c:618 compaction_capture() warn: unsigned 'order' is never less than zero.

vim +302 mm/compaction.c

9721fd82351d47a Baolin Wang     2023-06-14  289  
21dc7e023611fbc David Rientjes  2017-11-17  290  /*
2271b016bf368d1 Hui Su          2020-12-14  291   * Compound pages of >= pageblock_order should consistently be skipped until
b527cfe5bc23208 Vlastimil Babka 2017-11-17  292   * released. It is always pointless to compact pages of such order (if they are
b527cfe5bc23208 Vlastimil Babka 2017-11-17  293   * migratable), and the pageblocks they occupy cannot contain any free pages.
21dc7e023611fbc David Rientjes  2017-11-17  294   */
b527cfe5bc23208 Vlastimil Babka 2017-11-17  295  static bool pageblock_skip_persistent(struct page *page)
21dc7e023611fbc David Rientjes  2017-11-17  296  {
b527cfe5bc23208 Vlastimil Babka 2017-11-17  297  	if (!PageCompound(page))
21dc7e023611fbc David Rientjes  2017-11-17  298  		return false;
b527cfe5bc23208 Vlastimil Babka 2017-11-17  299  
b527cfe5bc23208 Vlastimil Babka 2017-11-17  300  	page = compound_head(page);
b527cfe5bc23208 Vlastimil Babka 2017-11-17  301  
b527cfe5bc23208 Vlastimil Babka 2017-11-17 @302  	if (compound_order(page) >= pageblock_order)
21dc7e023611fbc David Rientjes  2017-11-17  303  		return true;
b527cfe5bc23208 Vlastimil Babka 2017-11-17  304  
b527cfe5bc23208 Vlastimil Babka 2017-11-17  305  	return false;
21dc7e023611fbc David Rientjes  2017-11-17  306  }
21dc7e023611fbc David Rientjes  2017-11-17  307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
