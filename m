Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E772921D3EA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802689; cv=none; b=CH1o0AVxdTFDxzYTdouhW2LZtnUuDsS0+pMOgyTxNDspmnAZ01dAEhA8EoeizlyI+pGvuJdKfWrYFNhij3PWfitHWDKydu9vtZ4lE0irjQsduQ1WPSLg6FxG83GI4HeIHbJoOyi+J5dXOW2As3SCVbFa8sNBSKDi2IVaZKecxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802689; c=relaxed/simple;
	bh=fbM8D2I2VQPp/G5SEymTSmFb47JhCi5lG/QM0596HmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOacB7+r1ZIuQ8T5TMvVANwbwwpDqGnG4v7426JlrW4iC0kiGFF6H/91pCKGoNSIkdFtFjoXEj/ldJRMz0LB3RgnHYgxiBS6Pko/TqQr76fh5FSPaYz8v4Gng+fasDQUvvGTk/T1MibpJjnS2Vy6Pwp31HTOZ0ZxrwC33LMq+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luZhMUWo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luZhMUWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744802687; x=1776338687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fbM8D2I2VQPp/G5SEymTSmFb47JhCi5lG/QM0596HmE=;
  b=luZhMUWo8wnwsIFpDadDlsg8/QvkMOJaLo4TNXe6dY0Yv1prjHudv27f
   mgArKl8OUK1XnubtPqy6J79RFH4vORvHqO3Tg/ATpiSvQOkf7lpfYtcLR
   AEf+bBFsZg2pQmvLTHoYsyWiwxJtOcT/94EaugB/KTWp86w72JIAA7hxV
   BYuaqMZUsE3es6rOC9aB1C8WK3Z3pk6OWftE7fs84TusLfNYuzZcLzUFC
   624WcJ9BRRxPZ3OVnuNEVft2yZ4YEv+QeGn1s95BKvopGdndZzDULLYgf
   Z8XohltDjQZmcmbmnObWSonnW70y/OD9r8+nnPlxaKB9gIRAQHgPMBiZ4
   Q==;
X-CSE-ConnectionGUID: LqU/++guSw2FFR+5ddKlJA==
X-CSE-MsgGUID: LqXqb9rQQFGaDBGzQ2x7lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46226894"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46226894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:24:46 -0700
X-CSE-ConnectionGUID: fMiJ5kbERtmEMEGHaz/zFA==
X-CSE-MsgGUID: kjLusjOPTM2n2pkkW3pJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130208504"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Apr 2025 04:24:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u50sj-000JbU-2p;
	Wed, 16 Apr 2025 11:24:41 +0000
Date: Wed, 16 Apr 2025 19:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, "Borislav Petkov (AMD)" <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] regulator: hi6421v530: fix building with GCC 15
Message-ID: <202504161944.iNjyTvch-lkp@intel.com>
References: <20250415111411.6331-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415111411.6331-1-listout@listout.xyz>

Hi Brahmajit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc2 next-20250416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brahmajit-Das/regulator-hi6421v530-fix-building-with-GCC-15/20250415-191555
base:   linus/master
patch link:    https://lore.kernel.org/r/20250415111411.6331-1-listout%40listout.xyz
patch subject: [PATCH 1/1] regulator: hi6421v530: fix building with GCC 15
config: arm-randconfig-002-20250416 (https://download.01.org/0day-ci/archive/20250416/202504161944.iNjyTvch-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161944.iNjyTvch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161944.iNjyTvch-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:0:
>> include/linux/mod_devicetable.h:608:2: warning: 'nonstring' attribute directive ignored [-Wattributes]
     char name[PLATFORM_NAME_SIZE] __attribute__((nonstring));
     ^~~~
   scripts/kernel-doc: 1: kernel-doc.py: not found
   make[3]: *** [scripts/Makefile.build:203: scripts/mod/empty.o] Error 127 shuffle=3373171021
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2 shuffle=3373171021
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3373171021
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3373171021
   make: Target 'prepare' not remade because of errors.


vim +/nonstring +608 include/linux/mod_devicetable.h

   606	
   607	struct platform_device_id {
 > 608		char name[PLATFORM_NAME_SIZE] __attribute__((nonstring));
   609		kernel_ulong_t driver_data;
   610	};
   611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
