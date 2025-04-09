Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB79778F3E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 02:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744164697; cv=none; b=IQxaH8dyORvEdT5Yz7jLcpuuRWr85OpUZirhtQc48Qt43LoHw1xFhQNKS3G8XN0v17U0kPI0NtL2Ghf0gLtYh5FjtCRGZXTa72cnwuHrDaLcZBZA3PtpzrVAz8loN44lZF6/+oL4VW8rOTGTErM3qWp0zZhA/lroPTf1aWu5iJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744164697; c=relaxed/simple;
	bh=t4tq8UbjY+U5a7wBUUsL14H5gi1Ul3QOmWUxsvbzRXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0pv4KgLXaD+y1XRQwtkWRf+yzA11OQkq5VzRx2cjDRSXA/36tETgc007HUbOEiaJSexonXz6Xd9HICpH4jdzZTbBKbv9yXC039CkmgQAJekonp1Im51q3SgZkIMl4+AVRzUfFk0D6QDud4gOexzCrUJdnRBtAeKIsgvwlnbwSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fo9+HnyH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fo9+HnyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744164696; x=1775700696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4tq8UbjY+U5a7wBUUsL14H5gi1Ul3QOmWUxsvbzRXY=;
  b=Fo9+HnyH7KZ/sA07C3s/M7fsJCuYy6lCNx8LLbwEzZ20N7/ywcLvaozF
   8xm1G6AqMmst1Ux1cpgBzbxDAybcV6YjtN/6qvbf0TkeO7phsfFEBtNjJ
   He+YFc8fVuM5mufWBnibLXOfQgweBGhHKJuDmEWnploiR7mdluO/ga2TT
   Gh/PvMGKgHSEB4dIBaMdoVh82+tz14mxePzBdF8gkLH4VBvh3V0aLoP2Z
   qxwOVQOivEp+kGl6I5sr9ICKWhDVA+o27YhviNsgAC7QJUcpEJiWnxHhz
   4/e4kJCai42uvgSoe3GW8PR88t4BWMvIjTIJwrgSvaa6ocTz70fJLBdHV
   g==;
X-CSE-ConnectionGUID: HLxUveSZSiyH0Kq9GYZF2Q==
X-CSE-MsgGUID: aV2GFS3MT+CkCstzCAxbfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56992196"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="56992196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 19:11:35 -0700
X-CSE-ConnectionGUID: TWSPITbqQkez/1A7GV025Q==
X-CSE-MsgGUID: m74SvP+8SieDW/IbChg7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128298425"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 19:11:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2KuW-0008BB-3A;
	Wed, 09 Apr 2025 02:11:28 +0000
Date: Wed, 9 Apr 2025 10:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Guorui Yu <guorui.yu@linux.alibaba.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dan Middleton <dan.middleton@linux.intel.com>,
	Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3 2/5] tsm-mr: Add tsm-mr sample code
Message-ID: <202504090703.LtAt1UZI-lkp@intel.com>
References: <20250407-tdx-rtmr-v3-2-54f17bc65228@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-tdx-rtmr-v3-2-54f17bc65228@intel.com>

Hi Cedric,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-mr-Add-TVM-Measurement-Register-support/20250408-032813
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250407-tdx-rtmr-v3-2-54f17bc65228%40intel.com
patch subject: [PATCH v3 2/5] tsm-mr: Add tsm-mr sample code
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250409/202504090703.LtAt1UZI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090703.LtAt1UZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090703.LtAt1UZI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from samples/tsm-mr/tsm_mr_sample.c:8:
>> include/linux/tsm-mr.h:81:58: error: use of undeclared identifier 'nr_mrs'
      81 |         const struct tsm_measurement_register *mrs __counted_by(nr_mrs);
         |                                                                 ^
   1 error generated.


vim +/nr_mrs +81 include/linux/tsm-mr.h

b6f2f446f66ff9 Cedric Xing 2025-04-07  47  
b6f2f446f66ff9 Cedric Xing 2025-04-07  48  #define TSM_MR_(mr, hash)                              \
b6f2f446f66ff9 Cedric Xing 2025-04-07  49  	.mr_name = #mr, .mr_size = hash##_DIGEST_SIZE, \
b6f2f446f66ff9 Cedric Xing 2025-04-07  50  	.mr_hash = HASH_ALGO_##hash, .mr_flags = TSM_MR_F_READABLE
b6f2f446f66ff9 Cedric Xing 2025-04-07  51  
b6f2f446f66ff9 Cedric Xing 2025-04-07  52  /**
b6f2f446f66ff9 Cedric Xing 2025-04-07  53   * struct tsm_measurements - Defines the CC-specific measurement facility and
b6f2f446f66ff9 Cedric Xing 2025-04-07  54   * methods for updating measurement registers (MRs).
b6f2f446f66ff9 Cedric Xing 2025-04-07  55   * @name: Optional parent directory name.
b6f2f446f66ff9 Cedric Xing 2025-04-07  56   * @mrs: Array of MR definitions.
b6f2f446f66ff9 Cedric Xing 2025-04-07  57   * @nr_mrs: Number of elements in @mrs.
b6f2f446f66ff9 Cedric Xing 2025-04-07  58   * @refresh: Callback function to load/sync all MRs from TVM hardware/firmware
b6f2f446f66ff9 Cedric Xing 2025-04-07  59   *           into the kernel cache.
b6f2f446f66ff9 Cedric Xing 2025-04-07  60   * @write: Callback function to write to the MR specified by the parameter @mr.
b6f2f446f66ff9 Cedric Xing 2025-04-07  61   *
b6f2f446f66ff9 Cedric Xing 2025-04-07  62   * @refresh takes two parameters:
b6f2f446f66ff9 Cedric Xing 2025-04-07  63   *
b6f2f446f66ff9 Cedric Xing 2025-04-07  64   * * @tm - points back to this structure.
b6f2f446f66ff9 Cedric Xing 2025-04-07  65   * * @mr - points to the MR (an element of @mrs) being read (hence triggered
b6f2f446f66ff9 Cedric Xing 2025-04-07  66   *   this callback).
b6f2f446f66ff9 Cedric Xing 2025-04-07  67   *
b6f2f446f66ff9 Cedric Xing 2025-04-07  68   * Note that @refresh is invoked only when an MR with %TSM_MR_F_LIVE set is
b6f2f446f66ff9 Cedric Xing 2025-04-07  69   * being read and the cache is stale. However, @refresh must reload not only
b6f2f446f66ff9 Cedric Xing 2025-04-07  70   * the MR being read (@mr) but also all MRs with %TSM_MR_F_LIVE set.
b6f2f446f66ff9 Cedric Xing 2025-04-07  71   *
b6f2f446f66ff9 Cedric Xing 2025-04-07  72   * @write takes an additional parameter besides @tm and @mr:
b6f2f446f66ff9 Cedric Xing 2025-04-07  73   *
b6f2f446f66ff9 Cedric Xing 2025-04-07  74   * * @data - contains the bytes to write and whose size is @mr->mr_size.
b6f2f446f66ff9 Cedric Xing 2025-04-07  75   *
b6f2f446f66ff9 Cedric Xing 2025-04-07  76   * Both @refresh and @write should return 0 on success and an appropriate error
b6f2f446f66ff9 Cedric Xing 2025-04-07  77   * code on failure.
b6f2f446f66ff9 Cedric Xing 2025-04-07  78   */
b6f2f446f66ff9 Cedric Xing 2025-04-07  79  struct tsm_measurements {
b6f2f446f66ff9 Cedric Xing 2025-04-07  80  	const char *name;
b6f2f446f66ff9 Cedric Xing 2025-04-07 @81  	const struct tsm_measurement_register *mrs __counted_by(nr_mrs);
b6f2f446f66ff9 Cedric Xing 2025-04-07  82  	size_t nr_mrs;
b6f2f446f66ff9 Cedric Xing 2025-04-07  83  	int (*refresh)(const struct tsm_measurements *tm,
b6f2f446f66ff9 Cedric Xing 2025-04-07  84  		       const struct tsm_measurement_register *mr);
b6f2f446f66ff9 Cedric Xing 2025-04-07  85  	int (*write)(const struct tsm_measurements *tm,
b6f2f446f66ff9 Cedric Xing 2025-04-07  86  		     const struct tsm_measurement_register *mr, const u8 *data);
b6f2f446f66ff9 Cedric Xing 2025-04-07  87  };
b6f2f446f66ff9 Cedric Xing 2025-04-07  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
