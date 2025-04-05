Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B74C74
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 07:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743836772; cv=none; b=NCNUXTCfWY8korCFXgIMTf+Qry+N7zrsSjeQpkyYPKY2j6IPZHQ1EHDFlpOdYdKyKVRFM0PiuZZfvDCLauAnY78w2XkJkG5RCI789l169dtki6XnOg0avYc2hDnuwri0aE/fpPOUTDCOpX+ZvCO1t/o6WUuge/mjfk5iKF3bl9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743836772; c=relaxed/simple;
	bh=Rjzq+YMrenvgwUaFnNd7/zOgT/ym4O9GWmDR3XLVUdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFvRs5WV1Ig8cG+9Z4Lw99IBvbZG5K2SoTb9aK49kZqrqxTJmLtp/lmKlZxqnIkMDa4v68d3KY8hij3t1Y6IdPcIanbHk6l2ceTiRu/ftoyALl5oYO/FZ+NULaUJPTv7Bbo+Yk5iF1aYWC1moOhPMjzSS5PqD/tcXpmPG2obPWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R519qWF1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R519qWF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743836770; x=1775372770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rjzq+YMrenvgwUaFnNd7/zOgT/ym4O9GWmDR3XLVUdo=;
  b=R519qWF1XiD85W9xds55cvyEbHFlNHp3tnQl+DqP+PspUoT7GZRBI2sB
   btiuaroV2lGjrK7/Q5ho/1SY3FSMuSGtdiuge9TSX8YMSzLkxHqk/pZYq
   8Vjwe1I0FbFLaqIOuu1ipGqg2tREWqk/e6RN5C8v2g1e3PHYRxrsBCfO+
   iunHd9xOwHkGmCHMpAmVPtydwqWRjy5T/pjp5ssIvK10V18UfpcAuOW7F
   quX08bHLEz5Fg2+g4n63tOjsHQrgWCDzN4WlXynTHPjm22QLSPA2a+tlY
   dmO6WUOSUmrM+e3cBsCPLM5vfMP33ahSA+6IhtVKu8PsCr9Zz/bZfjf3E
   Q==;
X-CSE-ConnectionGUID: /Q4CKYa1S7Oq5CxRE2SLOg==
X-CSE-MsgGUID: wQ0phkdkTbWc68r/xp2O9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49072308"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="49072308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 00:06:09 -0700
X-CSE-ConnectionGUID: knwEZ9VqQVGw/YMDi077NA==
X-CSE-MsgGUID: kRaXCZooQuukJNHBe9rOAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="132472844"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Apr 2025 00:06:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0xbC-0001sD-2t;
	Sat, 05 Apr 2025 07:05:50 +0000
Date: Sat, 5 Apr 2025 15:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/clk/sophgo/clk-sg2042-pll.c:217:1-7: WARNING: do_div() does
 a 64-by-32 division, please consider using div64_ul instead.
Message-ID: <202504051456.niworhgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a8662bcd2ff152bfbc751cab20f33053d74d0963
commit: 48cf7e01386e7e35ea12255bc401bdd484c34e7d clk: sophgo: Add SG2042 clock driver
date:   10 months ago
config: arm-randconfig-r053-20250404 (https://download.01.org/0day-ci/archive/20250405/202504051456.niworhgJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051456.niworhgJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/sophgo/clk-sg2042-pll.c:217:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
>> drivers/clk/sophgo/clk-sg2042-pll.c:160:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

vim +217 drivers/clk/sophgo/clk-sg2042-pll.c

   138	
   139	/**
   140	 * sg2042_pll_recalc_rate() - Calculate rate for plls
   141	 * @reg_value: current register value
   142	 * @parent_rate: parent frequency
   143	 *
   144	 * This function is used to calculate below "rate" in equation
   145	 * rate = (parent_rate/REFDIV) x FBDIV/POSTDIV1/POSTDIV2
   146	 *      = (parent_rate x FBDIV) / (REFDIV x POSTDIV1 x POSTDIV2)
   147	 *
   148	 * Return: The rate calculated.
   149	 */
   150	static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
   151						    unsigned long parent_rate)
   152	{
   153		struct sg2042_pll_ctrl ctrl_table;
   154		u64 numerator, denominator;
   155	
   156		sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
   157	
   158		numerator = parent_rate * ctrl_table.fbdiv;
   159		denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
 > 160		do_div(numerator, denominator);
   161		return numerator;
   162	}
   163	
   164	/**
   165	 * sg2042_pll_get_postdiv_1_2() - Based on input rate/prate/fbdiv/refdiv,
   166	 * look up the postdiv1_2 table to get the closest postdiiv combination.
   167	 * @rate: FOUTPOSTDIV
   168	 * @prate: parent rate, i.e. FREF
   169	 * @fbdiv: FBDIV
   170	 * @refdiv: REFDIV
   171	 * @postdiv1: POSTDIV1, output
   172	 * @postdiv2: POSTDIV2, output
   173	 *
   174	 * postdiv1_2 contains all the possible combination lists of POSTDIV1 and POSTDIV2
   175	 * for example:
   176	 * postdiv1_2[0] = {2, 4, 8}, where div1 = 2, div2 = 4 , div1 * div2 = 8
   177	 *
   178	 * See TRM:
   179	 * FOUTPOSTDIV = FREF * FBDIV / REFDIV / (POSTDIV1 * POSTDIV2)
   180	 * So we get following formula to get POSTDIV1 and POSTDIV2:
   181	 * POSTDIV = (prate/REFDIV) x FBDIV/rate
   182	 * above POSTDIV = POSTDIV1*POSTDIV2
   183	 *
   184	 * Return:
   185	 * %0 - OK
   186	 * %-EINVAL - invalid argument, which means Failed to get the postdivs.
   187	 */
   188	static int sg2042_pll_get_postdiv_1_2(unsigned long rate,
   189					      unsigned long prate,
   190					      unsigned int fbdiv,
   191					      unsigned int refdiv,
   192					      unsigned int *postdiv1,
   193					      unsigned int *postdiv2)
   194	{
   195		int index;
   196		u64 tmp0;
   197	
   198		/* POSTDIV_RESULT_INDEX point to 3rd element in the array postdiv1_2 */
   199		#define	POSTDIV_RESULT_INDEX	2
   200	
   201		static const int postdiv1_2[][3] = {
   202			{2, 4,  8}, {3, 3,  9}, {2, 5, 10}, {2, 6, 12},
   203			{2, 7, 14}, {3, 5, 15}, {4, 4, 16}, {3, 6, 18},
   204			{4, 5, 20}, {3, 7, 21}, {4, 6, 24}, {5, 5, 25},
   205			{4, 7, 28}, {5, 6, 30}, {5, 7, 35}, {6, 6, 36},
   206			{6, 7, 42}, {7, 7, 49}
   207		};
   208	
   209		/* prate/REFDIV and result save to tmp0 */
   210		tmp0 = prate;
   211		do_div(tmp0, refdiv);
   212	
   213		/* ((prate/REFDIV) x FBDIV) and result save to tmp0 */
   214		tmp0 *= fbdiv;
   215	
   216		/* ((prate/REFDIV) x FBDIV)/rate and result save to tmp0 */
 > 217		do_div(tmp0, rate);
   218	
   219		/* tmp0 is POSTDIV1*POSTDIV2, now we calculate div1 and div2 value */
   220		if (tmp0 <= 7) {
   221			/* (div1 * div2) <= 7, no need to use array search */
   222			*postdiv1 = tmp0;
   223			*postdiv2 = 1;
   224			return 0;
   225		}
   226	
   227		/* (div1 * div2) > 7, use array search */
   228		for (index = 0; index < ARRAY_SIZE(postdiv1_2); index++) {
   229			if (tmp0 > postdiv1_2[index][POSTDIV_RESULT_INDEX]) {
   230				continue;
   231			} else {
   232				/* found it */
   233				*postdiv1 = postdiv1_2[index][1];
   234				*postdiv2 = postdiv1_2[index][0];
   235				return 0;
   236			}
   237		}
   238		pr_warn("%s can not find in postdiv array!\n", __func__);
   239		return -EINVAL;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
