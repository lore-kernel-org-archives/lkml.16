Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A113042AB0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 01:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804023; cv=none; b=UznE3UvXBKtV+HR6oUqwVSDeKLH/8W+51QtNF+lqbpYm/CYDYttWGEq1xs/IJkBBqoC0cZVpIaKvtUTRFoZ9lY9IoZr6qmo3h9dOsmbofp/plnmc7ZuP1xemkIPcGoenRzMZljAmn8LqEr8cBTMfdwFgbpW0cGuZFQYNtHh9+h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804023; c=relaxed/simple;
	bh=N9j+LnoWnXkXLj+vcCOoYJNwC5VYSgQCGoI8fIkpbdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P86G/RGM/0pLnEuNdss5Rt37b2K2TV2f5xfAB+upE5hvbHjW1+xEbvm6MgDc9HKnbs7gs4Co/TrpZbPQ7Cwh3Q3XSUIZuiZqfoMpwftpBmLssLNUOVveTCr2PIUPjRlx4KekwmgQyuh29Ys8Rt84l+MKIqCV3MWZHf6LI4VkQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfFAhSEZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfFAhSEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745804022; x=1777340022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9j+LnoWnXkXLj+vcCOoYJNwC5VYSgQCGoI8fIkpbdo=;
  b=IfFAhSEZ+K6npGSxElOzTYMX/cGd9WAW5NYEH2Ef5mDW+an4uCDW4vv8
   iBmGCsojwVFOi2/7YTvHhl8yq7akx8p7OuWhyiv0zaYz2H2w1poTDc/hp
   4U7AezhaFDLpwXzwHqbXhW2SaVt+t1nkwGxVYKvcwhyZuso+oAUiJT2IS
   7z1DVIPZhh5mMszMFLCZdYpF8G8TeR8dVVTcfzTrOObmNBys65+KEG1FV
   fHYv/mN2w7XcMxuDP3IPVTudcIRHEVIuRSu9zssZ5B8z0oEy0LuSyX/M2
   oC2LqaUPKtrk3xIhKsrQVx2jv1wqllyfUxv4AD/3ziC0r8vWpo/QLWIcs
   w==;
X-CSE-ConnectionGUID: pLeE4EX/TgiQrSrAhmM5XQ==
X-CSE-MsgGUID: yf5lzsqbShOIW0dpJDlmCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58746687"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="58746687"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 18:33:41 -0700
X-CSE-ConnectionGUID: 4BvdvFLeT3aTu51MF7FENA==
X-CSE-MsgGUID: K6CQ2eFVTWaVpp5nrZdaeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133113356"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Apr 2025 18:33:37 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9DNH-0006Wv-0n;
	Mon, 28 Apr 2025 01:33:35 +0000
Date: Mon, 28 Apr 2025 09:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, hannes@cmpxchg.org, minchan@kernel.org,
	nphamcs@gmail.com, senozhatsky@chromium.org, shakeel.butt@linux.dev,
	yosry.ahmed@linux.dev, Igor Belousov <igor.b@beldev.am>,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: Re: [PATCH mm-new] mm/zblock: add debugfs
Message-ID: <202504280934.X1Gqvqj1-lkp@intel.com>
References: <20250427201958.491806-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427201958.491806-1-vitaly.wool@konsulko.se>

Hi Vitaly,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Wool/mm-zblock-add-debugfs/20250428-042209
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250427201958.491806-1-vitaly.wool%40konsulko.se
patch subject: [PATCH mm-new] mm/zblock: add debugfs
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250428/202504280934.X1Gqvqj1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504280934.X1Gqvqj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504280934.X1Gqvqj1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zblock.c:125:46: error: no member named 'num_pages' in 'struct block_desc'
     125 |                         i, block_list->block_count, block_desc[i].num_pages,
         |                                                     ~~~~~~~~~~~~~ ^
   mm/zblock.c:126:44: error: no member named 'num_pages' in 'struct block_desc'
     126 |                         block_list->block_count * block_desc[i].num_pages);
         |                                                   ~~~~~~~~~~~~~ ^
   2 errors generated.


vim +125 mm/zblock.c

   115	
   116	static int zblock_blocks_show(struct seq_file *s, void *v)
   117	{
   118		struct zblock_pool *pool = s->private;
   119		int i;
   120	
   121		for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
   122			struct block_list *block_list = &pool->block_lists[i];
   123	
   124			seq_printf(s, "%d: %ld blocks of %d pages (total %ld pages)\n",
 > 125				i, block_list->block_count, block_desc[i].num_pages,
   126				block_list->block_count * block_desc[i].num_pages);
   127		}
   128		return 0;
   129	}
   130	DEFINE_SHOW_ATTRIBUTE(zblock_blocks);
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
