Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CC01C4A24
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955501; cv=none; b=BCDIydjzripX9Lp0PS2MD2QUX19Ec4wsz7bH2xNy3+oIt1GSEJl3nt+rWjbqLV7ta8TNM1XpIpiLs3Q3DBf7XC8g5f/ZWE7rnGpSlIvMo4Si9ClXTbLBVBebLwq+XIMsImUrkzyekDstd/3jx29SFD9ZDHYYpfw9xgyErNavNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955501; c=relaxed/simple;
	bh=4vhY6njRa9Rl8vz7fB5BjME1Ai3VboLm3lxRlFY1PYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STAlpWI4H38u2/JeeGW1ME3EEsa3bs0WFgOwGcoCw2KB2EZ+w9Y6vCBK9UzhXls+XjYo/SXsUoL7KgkzcyKdu+ik3UCdnMcN5kH8dfaCXz36XOaoEE7ZW+vHvrD7Kbb5T1Mztg2sgFxlrshuDhmVG1MvCXUvf0ICEYHTd2V6JCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCbGxZ08; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCbGxZ08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750955500; x=1782491500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4vhY6njRa9Rl8vz7fB5BjME1Ai3VboLm3lxRlFY1PYc=;
  b=cCbGxZ08Ss77Y6WPRrUZYoILJ6NxhTtTPmwDmXBvAp7evgjHwEoclJIY
   feXIyZX7eVYh7AoqwLTRLhx/8P226K+MgBaEMctcnto+gmxSp+MsjY3/h
   Nf3BF97t9mb8ogRevJAgvp4bJGwyEp+nnaiC4sYm6qNtZNrjBaZG4m1OU
   kW3kFJzKv+70lhhbLmNGO6KhnDD71l8DpUqrjlhlACvm2V3XRD1M4wpfb
   dUCnqA4R1JfIWJHOAsuun6PWu7cl9BjoFx4eCnVmfCghzdCOPlEKEEgrB
   soLP1ZZHjrAbvg3+oldgxF0EnMRK6NqSsdVn4J/hPyoEIjefqRcZNp/rh
   A==;
X-CSE-ConnectionGUID: +b78+EqESWmPTQUeG2IGVg==
X-CSE-MsgGUID: XOXX1FeUQcy+EB88zE1hEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64614198"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="64614198"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:31:37 -0700
X-CSE-ConnectionGUID: m7HO+CcBToas/7kyx6GJmQ==
X-CSE-MsgGUID: W4gpHGpBQ9OusFjWdq2Pig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="152074764"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Jun 2025 09:31:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUpVa-000UGo-0H;
	Thu, 26 Jun 2025 16:31:30 +0000
Date: Fri, 27 Jun 2025 00:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, phillip@squashfs.org.uk
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH] Squashfs: add page cache share support
Message-ID: <202506270024.FPuaCoE9-lkp@intel.com>
References: <20250626003644.3675-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626003644.3675-1-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.16-rc3]
[also build test WARNING on linus/master next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/Squashfs-add-page-cache-share-support/20250626-084010
base:   v6.16-rc3
patch link:    https://lore.kernel.org/r/20250626003644.3675-1-liubo03%40inspur.com
patch subject: [PATCH] Squashfs: add page cache share support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250627/202506270024.FPuaCoE9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270024.FPuaCoE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270024.FPuaCoE9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/squashfs/pagecache_share.c:18:
>> fs/squashfs/squashfs.h:25:40: warning: 'struct squashfs_page_actor' declared inside parameter list will not be visible outside of this definition or declaration
      25 |                                 struct squashfs_page_actor *);
         |                                        ^~~~~~~~~~~~~~~~~~~
>> fs/squashfs/squashfs.h:49:33: warning: 'struct squashfs_sb_info' declared inside parameter list will not be visible outside of this definition or declaration
      49 |         void * (*create)(struct squashfs_sb_info *msblk, void *comp_opts);
         |                                 ^~~~~~~~~~~~~~~~
   fs/squashfs/squashfs.h:50:32: warning: 'struct squashfs_sb_info' declared inside parameter list will not be visible outside of this definition or declaration
      50 |         void (*destroy)(struct squashfs_sb_info *msblk);
         |                                ^~~~~~~~~~~~~~~~
   fs/squashfs/squashfs.h:52:58: warning: 'struct squashfs_page_actor' declared inside parameter list will not be visible outside of this definition or declaration
      52 |                           int offset, int length, struct squashfs_page_actor *output);
         |                                                          ^~~~~~~~~~~~~~~~~~~
   fs/squashfs/squashfs.h:51:34: warning: 'struct squashfs_sb_info' declared inside parameter list will not be visible outside of this definition or declaration
      51 |         int (*decompress)(struct squashfs_sb_info *msblk, struct bio *bio,
         |                                  ^~~~~~~~~~~~~~~~


vim +25 fs/squashfs/squashfs.h

f5cc08737507f2 Phillip Lougher 2024-12-29  22  
ffae2cd73a9e82 Phillip Lougher 2009-01-05  23  /* block.c */
846b730e99518a Phillip Lougher 2013-11-18  24  extern int squashfs_read_data(struct super_block *, u64, int, u64 *,
846b730e99518a Phillip Lougher 2013-11-18 @25  				struct squashfs_page_actor *);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  26  
ffae2cd73a9e82 Phillip Lougher 2009-01-05  27  /* cache.c */
ffae2cd73a9e82 Phillip Lougher 2009-01-05  28  extern struct squashfs_cache *squashfs_cache_init(char *, int, int);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  29  extern void squashfs_cache_delete(struct squashfs_cache *);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  30  extern struct squashfs_cache_entry *squashfs_cache_get(struct super_block *,
ffae2cd73a9e82 Phillip Lougher 2009-01-05  31  				struct squashfs_cache *, u64, int);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  32  extern void squashfs_cache_put(struct squashfs_cache_entry *);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  33  extern int squashfs_copy_data(void *, struct squashfs_cache_entry *, int, int);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  34  extern int squashfs_read_metadata(struct super_block *, void *, u64 *,
ffae2cd73a9e82 Phillip Lougher 2009-01-05  35  				int *, int);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  36  extern struct squashfs_cache_entry *squashfs_get_fragment(struct super_block *,
ffae2cd73a9e82 Phillip Lougher 2009-01-05  37  				u64, int);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  38  extern struct squashfs_cache_entry *squashfs_get_datablock(struct super_block *,
ffae2cd73a9e82 Phillip Lougher 2009-01-05  39  				u64, int);
82de647e1f81fd Phillip Lougher 2011-05-20  40  extern void *squashfs_read_table(struct super_block *, u64, int);
ffae2cd73a9e82 Phillip Lougher 2009-01-05  41  
4c0f0bb2351bee Phillip Lougher 2009-10-06  42  /* decompressor.c */
4c0f0bb2351bee Phillip Lougher 2009-10-06  43  extern const struct squashfs_decompressor *squashfs_lookup_decompressor(int);
9508c6b90b3f57 Phillip Lougher 2013-11-13  44  extern void *squashfs_decompressor_setup(struct super_block *, unsigned short);
9508c6b90b3f57 Phillip Lougher 2013-11-13  45  
9508c6b90b3f57 Phillip Lougher 2013-11-13  46  /* decompressor_xxx.c */
80f784098ff44e Xiaoming Ni     2022-10-19  47  
80f784098ff44e Xiaoming Ni     2022-10-19  48  struct squashfs_decompressor_thread_ops {
80f784098ff44e Xiaoming Ni     2022-10-19 @49  	void * (*create)(struct squashfs_sb_info *msblk, void *comp_opts);
80f784098ff44e Xiaoming Ni     2022-10-19  50  	void (*destroy)(struct squashfs_sb_info *msblk);
80f784098ff44e Xiaoming Ni     2022-10-19  51  	int (*decompress)(struct squashfs_sb_info *msblk, struct bio *bio,
80f784098ff44e Xiaoming Ni     2022-10-19  52  			  int offset, int length, struct squashfs_page_actor *output);
80f784098ff44e Xiaoming Ni     2022-10-19  53  	int (*max_decompressors)(void);
80f784098ff44e Xiaoming Ni     2022-10-19  54  };
80f784098ff44e Xiaoming Ni     2022-10-19  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
