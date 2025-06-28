Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC7D1FDA7B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751095959; cv=none; b=EOIXsXzk7/dKSG365DC4hCdaE0CXe56N6lYEsgIybBCv7BP4t9XMel153a54Rar5cmMsBYBqQSn9BNSARATp/AbkmbpQi75YrQF8WT56lMLHYFShBZgkGTW/JRHC5KajvfvLgzEy6yUSlzeaGbGkzF8vfwDUrpQWlQH+mWvK32Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751095959; c=relaxed/simple;
	bh=VxkARWkB0aq7yYC24dvQDmT3R3hm+Ujx+8DCWsOSsV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srJ8kLMwDgTDNyV19ldx2x5Wyp5hgULYEnmY/C8/cB1yszaCpUJkNtz420TK/C/hpJ37R5c2HO/JMBfQAf9xH5sdUHUT/un8Pz0XWHxxF/d03ilEb3atknkReHc6u1Vw0xoOvzoECYlPe3W1Z4osxpVrEWDA6gvwIz6wfIh9DQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkwQFMWm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkwQFMWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751095957; x=1782631957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VxkARWkB0aq7yYC24dvQDmT3R3hm+Ujx+8DCWsOSsV8=;
  b=CkwQFMWmVuVJnKTTZYmlQM7cOUb3dLqge8IQ9bNizUpPAzR9erdTp2lr
   dNKpjKEGsw2/ZCrhwQoB7Ta1Jt9vR4FZfopi0g/zZpGjApdyWqAgwA2On
   NzflDogLokntlc86+68Wc+08dx9LaymYkxdJCusX1qrpPSYyBnqvXnvz0
   n/sAJ8cr63dyiHPjKWrpyZ98NRRu23hRiJL3v2WiLWO+UGgBbVfhF5aco
   ez116fVhfsJenBACnSpKpseU5iEUJ9uiQPNJFH0UrXUwZRDxCR/Z4Hdr/
   1KsX0k9VStWLC5FqleGBY8l0G0zL+QrJ/dG1vGlT9c7fVFeXEx9PIpJia
   Q==;
X-CSE-ConnectionGUID: iIMP3vGiTC+LYU807smtHQ==
X-CSE-MsgGUID: JPsufbiKSl+gMs6/90Eb3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="63655431"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="63655431"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 00:32:37 -0700
X-CSE-ConnectionGUID: yUkFfSVERgai/gy+CcbSVg==
X-CSE-MsgGUID: U+lGoKUhS/+E0fUy6599DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="157032721"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jun 2025 00:32:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVQ36-000Wu2-0p;
	Sat, 28 Jun 2025 07:32:32 +0000
Date: Sat, 28 Jun 2025 15:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: zhongjinji@honor.com, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, yuzhao@google.com,
	linux-kernel@vger.kernel.org, yipengxiang@honor.com,
	liulu.liu@honor.com, feng.han@honor.com
Subject: Re: [PATCH] mm: vmscan: Page scanning depends on swappiness and
 refault
Message-ID: <202506281519.wHSXE6l0-lkp@intel.com>
References: <20250627162606.30609-1-zhongjinji@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627162606.30609-1-zhongjinji@honor.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc3]
[cannot apply to akpm-mm/mm-everything next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhongjinji-honor-com/mm-vmscan-Page-scanning-depends-on-swappiness-and-refault/20250628-002820
base:   linus/master
patch link:    https://lore.kernel.org/r/20250627162606.30609-1-zhongjinji%40honor.com
patch subject: [PATCH] mm: vmscan: Page scanning depends on swappiness and refault
config: x86_64-buildonly-randconfig-005-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281519.wHSXE6l0-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281519.wHSXE6l0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281519.wHSXE6l0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:2783:24: error: use of undeclared identifier 'swappiness'
    2783 |         if ((!sc->priority && swappiness) || sc->file_is_tiny)
         |                               ^
>> mm/vmscan.c:4100:33: error: expected identifier
    4100 |         if (seq <= READ_ONCE(mm_state->.seq))
         |                                        ^
>> mm/vmscan.c:4100:33: error: expected identifier
>> mm/vmscan.c:4100:33: error: expected identifier
>> mm/vmscan.c:4100:33: error: expected identifier
>> mm/vmscan.c:4100:33: error: expected identifier
>> mm/vmscan.c:4100:33: error: expected identifier
>> mm/vmscan.c:4100:33: error: expected identifier
>> mm/vmscan.c:4154:3: error: call to undeclared function 'for_each_age_able_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4154 |                 for_each_age_able_type(type, can_age) {
         |                 ^
>> mm/vmscan.c:4154:40: error: expected ';' after expression
    4154 |                 for_each_age_able_type(type, can_age) {
         |                                                      ^
         |                                                      ;
   10 errors generated.


vim +/swappiness +2783 mm/vmscan.c

  2770	
  2771	static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
  2772	{
  2773		struct mem_cgroup *memcg = lruvec_memcg(lruvec);
  2774		struct pglist_data *pgdat = lruvec_pgdat(lruvec);
  2775	
  2776		if (!sc->may_swap)
  2777			return 0;
  2778	
  2779		if (!can_demote(pgdat->node_id, sc, memcg) &&
  2780		    mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH)
  2781			return 0;
  2782	
> 2783		if ((!sc->priority && swappiness) || sc->file_is_tiny)
  2784			return BALACNCE_SWAPPINESS;
  2785	
  2786		return sc_swappiness(sc, memcg);
  2787	}
  2788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
