Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DFA35963;
	Thu, 22 May 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918970; cv=none; b=AauZjRKIdhxL7WVGaBQ9B3AInVOk245M8QqnbkmK9P/rUmDJ56V8cLl6fH6Kj8HsvqvA6nNquA0+p6XLaXBfHytoSUxARrDWuSzEcvGDezpAsoGYRiEsf1Wk/wTMY2BD39dnwQYbvqZNzo4tq6tBlUlfdfjULVLjwDmKVIsT92Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918970; c=relaxed/simple;
	bh=p1KWM5oBbpZnedQuEqjR+2MSTGiekG3J/uT1oWAu4dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcUe/vI49UuKSIvUUQfh6jhQN2N6tmgKiuzbJHTQ73srSADBeSwk5cNQ0RJRD2IW/BZDgMKBrdF5NG0FvEcKCGp6rj48/GR+fmr742NCcXN5DEZrHQx0gcng4ehF+SKU4ndwfNCAaw9EADdjRggmpEftly8GOvz8Ugz0MTOQ4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGZRz5Su; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGZRz5Su"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747918969; x=1779454969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1KWM5oBbpZnedQuEqjR+2MSTGiekG3J/uT1oWAu4dA=;
  b=kGZRz5Su/ZlP0t77KaUInnhjNixZrT6mjicj371laT8A2SC4m+l5rPPr
   r8dobUuh7kV6fqBQZjF4XrFEdgWAnlYkf1gHDEHJfcHKuS/EBOxuV41zx
   IlpjnOgY0l+8UW/1SduuZrnZOnA7luGkL8dNgYwqo5HFwJWlV1XSHFPyP
   6X3fR0ruv43BzQCSYcnCW+X/o8o1KyGmxaFrFQ5DotWV8l6obR4bVJ/IM
   rU82qnrSyTCEerqlvpTJXaL1JLsN/xCcoWdSIN7bGe/NKhxFYmbrhTC1z
   VDNjPwmhF0V9JDULx+zJa+UE8+Q0FteVK/HZEyHTYGt59M7N76F6Txk25
   w==;
X-CSE-ConnectionGUID: 44ytzsV8R8CUjlARlXewFQ==
X-CSE-MsgGUID: yQTBKOo0SyC9yc12G9QfuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75340617"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75340617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 06:02:48 -0700
X-CSE-ConnectionGUID: SoOqui/DRnuAsWjHovNpDw==
X-CSE-MsgGUID: q7cN3l/wQl2E5soKzhJp1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140401377"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 May 2025 06:02:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI5ZL-000PLo-2d;
	Thu, 22 May 2025 13:02:43 +0000
Date: Thu, 22 May 2025 21:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: dell_rbu: Fix list usage
Message-ID: <202505222012.YMyWZkiR-lkp@intel.com>
References: <20250521161639.47357-2-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521161639.47357-2-stuart.w.hayes@gmail.com>

Hi Stuart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc7 next-20250522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stuart-Hayes/platform-x86-dell_rbu-Fix-list-usage/20250522-002119
base:   linus/master
patch link:    https://lore.kernel.org/r/20250521161639.47357-2-stuart.w.hayes%40gmail.com
patch subject: [PATCH 1/2] platform/x86: dell_rbu: Fix list usage
config: x86_64-randconfig-r113-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222012.YMyWZkiR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505222012.YMyWZkiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222012.YMyWZkiR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/dell/dell_rbu.c:80:18: sparse: sparse: symbol 'packet_data_list' was not declared. Should it be static?
   drivers/platform/x86/dell/dell_rbu.c:112:20: sparse: sparse: context imbalance in 'create_packet' - unexpected unlock

vim +/packet_data_list +80 drivers/platform/x86/dell/dell_rbu.c

    79	
  > 80	struct list_head packet_data_list;
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
