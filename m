Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A953F2512D5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697477; cv=none; b=PuyXGW8YFHdURmZwVw6ayulxATM4u4fluAqL9GB/kLUje6zH48cfeCKsIwMUyLxBOK6iHjFb6ZCDmcthvTKQRfbTNKVfjZleQ2kkzmmA3s1RriV5YVt+v6Rpnu1baGiF3Nq1e5kUc3N6sPLkXAQhlA3gDJz6anirHIOn4SWi8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697477; c=relaxed/simple;
	bh=ZxbRwQpKz0uC4rWFiP68dkqAQz2gSJboA0Xfn/m9gpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQUo47/MDGImg/DFjKbzMemDBzQadiL52NVzpeoyae0Z/CuXSx4+lm9h8TL2z33jPZBy7JgulgIDw7w8Rybn9rBo/W4HmDdc0+50y+GgABfgEdLjKI6KJkHAhiT4s/9B3h4YuM3YFetO7DCLO9e887k0klGDZ25UziedYNRpIuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZcotJdH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZcotJdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743697475; x=1775233475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZxbRwQpKz0uC4rWFiP68dkqAQz2gSJboA0Xfn/m9gpQ=;
  b=dZcotJdHhh6Vm1PVGRHCjjAfV5s5dDT+3i0yARzRaLOZ6yzbfBbftoAR
   JB2+uQeEJCbdOOB4yFTO5cDxQ9MFWy0gjrpbTwmDciB5SN94qtcd/2joZ
   h88v3an19wciMsMgIyW6f5g7GFEWt4UNTCCU+yJg7ELW593Xe5GgYHEkn
   L4Bx3RwDFAGkJRQZk7pKJWhCLXwNVHxPweIp0BiR8GvJdSN4KILi92rQm
   BmU6jfgFHx16l8EkPgQYrr1LRqrREgrAK8Gq1dihoJNhhnVhMaLHhKDfs
   IHuVQ0ZLbO1KNB0OwfuNWmm+0lgjHa5ogKGKLy4J+mV5z4z93IX2A/0N9
   w==;
X-CSE-ConnectionGUID: OxQsNTrlQW67+qn73HSBnQ==
X-CSE-MsgGUID: C9lqyTptRmGj+qQ21OxiSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48775517"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="48775517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 09:24:35 -0700
X-CSE-ConnectionGUID: xxB70RBJQwGRvlAWi+WJjA==
X-CSE-MsgGUID: OvWiObj2RCWfp9Nfg6CGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131180637"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Apr 2025 09:24:33 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0NMj-0000fT-33;
	Thu, 03 Apr 2025 16:24:29 +0000
Date: Fri, 4 Apr 2025 00:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org, chao@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: Re: [PATCH v4] f2fs: prevent the current section from being selected
 as a victim during GC
Message-ID: <202504032346.pFNGrse7-lkp@intel.com>
References: <20250403071016.2940-1-yohan.joung@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403071016.2940-1-yohan.joung@sk.com>

Hi yohan.joung,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v6.14 next-20250403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yohan-joung/f2fs-prevent-the-current-section-from-being-selected-as-a-victim-during-GC/20250403-151057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20250403071016.2940-1-yohan.joung%40sk.com
patch subject: [PATCH v4] f2fs: prevent the current section from being selected as a victim during GC
config: i386-buildonly-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504032346.pFNGrse7-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032346.pFNGrse7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032346.pFNGrse7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/file.c:30:
>> fs/f2fs/segment.h:480:53: error: too few arguments provided to function-like macro invocation
     480 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
         |                                                                                 ^
   fs/f2fs/segment.h:105:9: note: macro 'GET_SEC_FROM_SEG' defined here
     105 | #define GET_SEC_FROM_SEG(sbi, segno)                            \
         |         ^
>> fs/f2fs/segment.h:480:9: error: use of undeclared identifier 'GET_SEC_FROM_SEG'
     480 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
         |                                     ^
   fs/f2fs/segment.h:483:53: error: too few arguments provided to function-like macro invocation
     483 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
         |                                                                                 ^
   fs/f2fs/segment.h:105:9: note: macro 'GET_SEC_FROM_SEG' defined here
     105 | #define GET_SEC_FROM_SEG(sbi, segno)                            \
         |         ^
   fs/f2fs/segment.h:483:9: error: use of undeclared identifier 'GET_SEC_FROM_SEG'
     483 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
         |                                     ^
   4 errors generated.


vim +480 fs/f2fs/segment.h

   458	
   459	static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
   460			unsigned int segno, bool inmem)
   461	{
   462		struct free_segmap_info *free_i = FREE_I(sbi);
   463		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
   464		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
   465		unsigned int next;
   466		unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi);
   467	
   468		spin_lock(&free_i->segmap_lock);
   469		if (test_and_clear_bit(segno, free_i->free_segmap)) {
   470			free_i->free_segments++;
   471	
   472			if (!inmem && IS_CURSEC(sbi, secno))
   473				goto skip_free;
   474			next = find_next_bit(free_i->free_segmap,
   475					start_segno + SEGS_PER_SEC(sbi), start_segno);
   476			if (next >= start_segno + usable_segs) {
   477				if (test_and_clear_bit(secno, free_i->free_secmap)) {
   478					free_i->free_sections++;
   479	
 > 480					if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
   481						sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
   482	
   483					if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
   484						sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
   485				}
   486			}
   487		}
   488	skip_free:
   489		spin_unlock(&free_i->segmap_lock);
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
