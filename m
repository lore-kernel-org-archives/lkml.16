Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFA1D86D6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 02:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081158; cv=none; b=cmTqVdFRuILPJ2h8yoT0fRh4R3GrNInrpP1aQigoDZukfntlnWqjfhTDJbxq2CfI5UCpW+5vQLRuNgaWhoI+XYiuU9TJRik67Hycf5X8K3bDS3XC4rEh9INrAcfMFycLh4Fa3Z7DfDv3bv7RnvlTYqRByG1vzoYTCQ/Jl3Mty6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081158; c=relaxed/simple;
	bh=+67ZGNOqIDdLmDAgZZ04izq2rizy6C/3AVLNfdHPStQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfB9zQ883x+Tz13z9IulWRwuACzASuVCDZZI4Yk9fLc5DrUACnrbbdG3m8uuqJmCeMrwCJKsHBO3id6bQXxhkge+c4Z1bg981aeJTMV8Fxx1YClZNHIdG0UFHmt60CzuP30Br+BXMJ0bX8/ia2OzfDZqZnPm3Ot6Q9zr97YALX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFlSJ9Bt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFlSJ9Bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744081156; x=1775617156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+67ZGNOqIDdLmDAgZZ04izq2rizy6C/3AVLNfdHPStQ=;
  b=aFlSJ9BttybN5+4AmcoQoKtaLl71p1L6l673kMORtABLMAxuGiVLvym+
   lwbroY5jlHJCPdZbIas+H2sQ6+eG/CN3K9vCPVIWqtn1a5942nDBELgqk
   M2/Q9z0cfv69LwCALWxVq95mWUGTc1x5qc3hHVZI1qCw4SF9aUlGj3yhh
   Z0WxVDwwdJ2HBRhca+FpJ+C6kw01CTdy/RAmfSaeiSPxaWoHxYEHEUTK2
   R8B7n+i7RHU9r15nGe1xcEEDVZGRAIHmf2t6t5sSCUyhCBX06TVqcExpD
   dxU5SjbZiCHaBciZWwYCEIaQXLyeHWFudrYCx/Un4xygFYFez+HVuGWqZ
   A==;
X-CSE-ConnectionGUID: +dTu4PX3TReJzhwlx4ZoHQ==
X-CSE-MsgGUID: 5y8IWEyIQeSqre6Oh/gODw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56158588"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="56158588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:59:16 -0700
X-CSE-ConnectionGUID: U4zE16mqTrSd5ZRauvA7QA==
X-CSE-MsgGUID: 3oVwmc/QQi2ljZT733hBRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="133104693"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2025 19:59:13 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1zB9-00043V-0d;
	Tue, 08 Apr 2025 02:59:11 +0000
Date: Tue, 8 Apr 2025 10:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Ian King <colin.king@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] md/raid6 algorithms: scale test duration for speedier
 boots
Message-ID: <202504081059.IWn9WLkl-lkp@intel.com>
References: <20250407143105.60-1-colin.king@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407143105.60-1-colin.king@intel.com>

Hi Colin,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Colin-Ian-King/md-raid6-algorithms-scale-test-duration-for-speedier-boots/20250407-225435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250407143105.60-1-colin.king%40intel.com
patch subject: [PATCH] md/raid6 algorithms: scale test duration for speedier boots
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504081059.IWn9WLkl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081059.IWn9WLkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081059.IWn9WLkl-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: lib/raid6/algos.o: in function `raid6_choose_gen.constprop.0':
>> algos.c:(.text.unlikely+0xa8): undefined reference to `__udivdi3'
>> m68k-linux-ld: algos.c:(.text.unlikely+0x122): undefined reference to `__udivdi3'
   m68k-linux-ld: algos.c:(.text.unlikely+0x1be): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
