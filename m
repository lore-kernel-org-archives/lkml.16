Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837501925AF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745815800; cv=none; b=b4lXFINRmB9d15B3xonehEsg/OStTCJMvTP2yxcd9ChiZexyrfIStnmPy/k+ZWB2DadDdzM+OugSzz1DwXAX76clj6NDZGUIzcKbRC0iL72mGAPHuSVmdP2Hfd8iDtMaZ8lz/91U8at2ZPPiXs35YyyWyW+cD9H3DY7DhUE6khw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745815800; c=relaxed/simple;
	bh=qasftPJJ9ofW89eezvOfY1ztpyU1IcZwTY6Q/QZj2OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMdPx0QTNJQPTQo1aNM14HA6wrikZvl1jknSfqVyeOstXK0O/fDaHB4mKYsbCWqzT5+IVVga0E9fM9upe82JN+vEdK5AcaFLWokEaToQ1IJyMsWOcGZB2Hq1YIOz/Dx0dG7F/sXZWMHPEfa84Quz2lQ0juImGHxq/gZnsaLmqaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ST/deP2D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ST/deP2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745815799; x=1777351799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qasftPJJ9ofW89eezvOfY1ztpyU1IcZwTY6Q/QZj2OE=;
  b=ST/deP2DEN1txX3RFR8m3/I1+Nd2S+5rKrr7UvAJDlMXd1eKQByNiT5X
   uNJqNig4aBE70/t5b34cKI2+lyYv7i3mXP2rky8+rzQCfyW/7MFN2zLz9
   CDrR2VqqlxgRjjelA3YVrYTNT7hlEN9WXokrCFxL12TFEAvtqedbV7211
   iQWe7vVBQ/7pXPCtzZg+QFNJMjaAkvHlEpOC8SLshfTBzNG4NLR6jo8H3
   mm83M62aDAdM0YrIVvUdpj0jzj8OEASmxkEBpZuCipnhXQt00iy61YBDB
   Lu+F/h1OIWCuG7RgHMjZfk8lArWTEnyh052ncBL+PrPF4bc5qLUtVzqln
   A==;
X-CSE-ConnectionGUID: /H4NPUipRQKOrDXJjQ9BMw==
X-CSE-MsgGUID: OcIfXCvDRjyEyffFx8GQhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50045671"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="50045671"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 21:49:58 -0700
X-CSE-ConnectionGUID: eB45a0U4TLKy/X1ScOxe9Q==
X-CSE-MsgGUID: aaOfsjEhR0KUOGebgCUIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="138223219"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2025 21:49:55 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9GRD-0006dF-2U;
	Mon, 28 Apr 2025 04:49:51 +0000
Date: Mon, 28 Apr 2025 12:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	hannes@cmpxchg.org, minchan@kernel.org, nphamcs@gmail.com,
	senozhatsky@chromium.org, shakeel.butt@linux.dev,
	yosry.ahmed@linux.dev, Igor Belousov <igor.b@beldev.am>,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: Re: [PATCH mm-new] mm/zblock: add debugfs
Message-ID: <202504281254.YFJgfUac-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250428/202504281254.YFJgfUac-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504281254.YFJgfUac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504281254.YFJgfUac-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/zblock.c:28:
   mm/zblock.h:24:2: error: #error Unsupported PAGE_SIZE
      24 | #error Unsupported PAGE_SIZE
         |  ^~~~~
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/debugfs.h:15,
                    from mm/zblock.c:20:
   mm/zblock.h:44:40: error: 'SLOT_BITS' undeclared here (not in a function); did you mean 'SLOT_SIZE'?
      44 |         DECLARE_BITMAP(slot_info, 1 << SLOT_BITS);
         |                                        ^~~~~~~~~
   include/uapi/linux/const.h:51:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   include/linux/types.h:11:28: note: in expansion of macro 'BITS_TO_LONGS'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                            ^~~~~~~~~~~~~
   mm/zblock.h:44:9: note: in expansion of macro 'DECLARE_BITMAP'
      44 |         DECLARE_BITMAP(slot_info, 1 << SLOT_BITS);
         |         ^~~~~~~~~~~~~~
   mm/zblock.c: In function 'zblock_blocks_show':
>> mm/zblock.c:125:66: error: 'const struct block_desc' has no member named 'num_pages'
     125 |                         i, block_list->block_count, block_desc[i].num_pages,
         |                                                                  ^
   mm/zblock.c:126:64: error: 'const struct block_desc' has no member named 'num_pages'
     126 |                         block_list->block_count * block_desc[i].num_pages);
         |                                                                ^


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
