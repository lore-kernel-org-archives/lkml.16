Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBB32505BF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693089; cv=none; b=ke5P723PRa1+dUyHbYD1BW3yZuUK37AEizsBOPGPs6JtaAZ2qKQAjJ9KzD+4VrIz9SpBF5uy+8yM9p4DmoPivHT4dX8qOosHPB5xNFL0Tpyvxs6t/Y0ll/NRmJOtymLHWn9viIGgd3nyHmZTMo3iHQKWdL1ah5RqC3tF3By+Esg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693089; c=relaxed/simple;
	bh=pazXNSNFRwcbem0gEd5+HAWBBg0Pc62HTCAJjOo1360=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPuupLEAWahaiyLtWJfccAaZ2wWb61NQCWnLGBwLtoKhNiiLsZJDzhGQ0czrw/3qFt47CPIaObsKXaDj/RA9k7bamBZ1uOYYHryfXSIRBa603+f2LdkVksB44axFMKHEV/PJ1v7TQSGK+5khCufxITArtzGz9b+mVWnq0umQsJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hp2b9VfH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hp2b9VfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743693088; x=1775229088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pazXNSNFRwcbem0gEd5+HAWBBg0Pc62HTCAJjOo1360=;
  b=Hp2b9VfHDx22SRBlSA7V83YRaF4PMtoErMOrVxH5xeUdZqQeabFUOJmn
   9MlN2n7e4RCCa0KMVaEwFE3QD5tV9rPhEvGM5rESTlgE5A5n+tDa5eqJB
   ggCDsRLFlXgnHFd4mp+MhWEhFEZgBLdTVy1WLxLZRTsPUHTHQ3N51PLbE
   W5NGPoq3SviZDt8j9pl/Qb6ugx28Xs9+4+kTvEY6YGwRNyhQZ2kJP+5xt
   YzQVD2k5k1XwNe1oQjG5KXaCc2naKBFN0R8WpbpYvcvHpqsa7LdLSH+x3
   7Pgnmk663wC8OapL/r40PR3qxHFIbQToVYA5/UBuHVcLZuCkX6+NwVhnl
   A==;
X-CSE-ConnectionGUID: 9fhy7RIOTLCy95UKGLOc0Q==
X-CSE-MsgGUID: X/KQEsIGTC+xEPdcJFgFTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55738647"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="55738647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 08:11:25 -0700
X-CSE-ConnectionGUID: TzyCgRpwS9Ci2czWVDkHYw==
X-CSE-MsgGUID: ihRpxO2bRmmQt9iUym/Wvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132242656"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Apr 2025 08:11:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0MDu-0000V7-2v;
	Thu, 03 Apr 2025 15:11:18 +0000
Date: Thu, 3 Apr 2025 23:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org, chao@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, pilhyun.kim@sk.com,
	yohan.joung@sk.com
Subject: Re: [PATCH v4] f2fs: prevent the current section from being selected
 as a victim during GC
Message-ID: <202504032206.xzJoHkRX-lkp@intel.com>
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
config: i386-buildonly-randconfig-005-20250403 (https://download.01.org/0day-ci/archive/20250403/202504032206.xzJoHkRX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032206.xzJoHkRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032206.xzJoHkRX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/checkpoint.c:20:
   fs/f2fs/segment.h: In function '__set_test_and_free':
>> fs/f2fs/segment.h:480:81: error: macro "GET_SEC_FROM_SEG" requires 2 arguments, but only 1 given
     480 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
         |                                                                                 ^
   fs/f2fs/segment.h:105: note: macro "GET_SEC_FROM_SEG" defined here
     105 | #define GET_SEC_FROM_SEG(sbi, segno)                            \
         | 
>> fs/f2fs/segment.h:480:37: error: 'GET_SEC_FROM_SEG' undeclared (first use in this function)
     480 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
         |                                     ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.h:480:37: note: each undeclared identifier is reported only once for each function it appears in
   fs/f2fs/segment.h:483:81: error: macro "GET_SEC_FROM_SEG" requires 2 arguments, but only 1 given
     483 |                                 if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
         |                                                                                 ^
   fs/f2fs/segment.h:105: note: macro "GET_SEC_FROM_SEG" defined here
     105 | #define GET_SEC_FROM_SEG(sbi, segno)                            \
         | 


vim +/GET_SEC_FROM_SEG +480 fs/f2fs/segment.h

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
