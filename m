Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE31C84BF
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596992; cv=none; b=RrK8Dn95anCk7o7kAe85BWcJkZIoNLGoP5FDJW1vNiHqLiVLW6Pwm6NtZogswMXy7z2eheIClzjtmPFD3uxETReOjAdmgut4DhHR1vQzTEG7S5RHD/K8JvmPOcrCydikTvpoTSMZPveDQUGZW1J69hAnHUANOxp631vJtY/MYTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596992; c=relaxed/simple;
	bh=s3jtPPys9Ndu5/zHikXScciKpT4dvC7aNsBkEMstihM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXPxO3i9v3Di/z9rOoPnokLlhsVpxusv7V2cfqUK+aNmAKzsUpJmMa5n5ShzffbYKQMHX8BtX6u+O/ne0zFXTtwPDL4lN/QMx+Q2xpAtRMlsv5osk83+65wGWsfbO1VpyNBLfqaLaFhjQES+CmPMC1rwZRNi7tfcc3JJeHrlhs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3jv5ykb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3jv5ykb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596990; x=1778132990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s3jtPPys9Ndu5/zHikXScciKpT4dvC7aNsBkEMstihM=;
  b=d3jv5ykb2EF2DP13jivi01X3nVlWN5fOggfQA50Z0WGUgIUiLOByaSH9
   xqKoGPj6a3DClxSYhWSZCn1ifnDE75kRikC9o6sfqhvMtaodSP4rUcLGj
   TaqpudbD77kK5ZwvhDFGIDZh3WiIBMrXYd8tM7K+9FdOdsxx/uOR2Vr1S
   jrob5GFG6DdPFOh9dgWyLV4lhSRMFuyeGS5uX7xNY2CNIk8gBeEZblHUW
   eU0reSEN9OMJApqKNzQX4Gg1PZzKj89Go+eZWGsgR7KqIk94lAGIvUdTM
   z1mFlgPzGfP4wHkNsylQvx5YZJsp4iG4G0/b7nGTk8RcMKCUNCygEvdv1
   w==;
X-CSE-ConnectionGUID: TAD/F7w/TnKzaFNWgj2Blg==
X-CSE-MsgGUID: tQwagpKcSCSB2UXME4MslA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52120518"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52120518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:50 -0700
X-CSE-ConnectionGUID: ip+J+NnLQ6ySssTCUnohBQ==
X-CSE-MsgGUID: HOlc05yCQtSPBiCuEqDALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140580410"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2025 22:49:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf7-00077N-2M;
	Wed, 07 May 2025 05:49:45 +0000
Date: Wed, 7 May 2025 13:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Darshan Rathod <darshanrathod475@gmail.com>, abbotti@mev.co.uk
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	hsweeten@visionengravers.com, linux-kernel@vger.kernel.org,
	Darshan Rathod <darshanrathod475@gmail.com>
Subject: Re: [PATCH] staging: comedi: das16 : fixed a struct warning in code
Message-ID: <202505071332.006irHBZ-lkp@intel.com>
References: <20250426094145.13564-1-darshanrathod475@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426094145.13564-1-darshanrathod475@gmail.com>

Hi Darshan,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Darshan-Rathod/staging-comedi-das16-fixed-a-struct-warning-in-code/20250426-174345
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250426094145.13564-1-darshanrathod475%40gmail.com
patch subject: [PATCH] staging: comedi: das16 : fixed a struct warning in code
config: x86_64-randconfig-072-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071332.006irHBZ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071332.006irHBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071332.006irHBZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/comedi/drivers/das16.c:969:18: error: cannot assign to variable 'lrange' with const-qualified type 'const struct comedi_lrange *'
     969 |                 lrange->length = 1;
         |                 ~~~~~~~~~~~~~~ ^
   drivers/comedi/drivers/das16.c:959:31: note: variable 'lrange' declared const here
     959 |                 const struct comedi_lrange *lrange;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/comedi/drivers/das16.c:971:15: error: cannot assign to variable 'krange' with const-qualified type 'const struct comedi_krange *'
     971 |                 krange->min = min;
         |                 ~~~~~~~~~~~ ^
   drivers/comedi/drivers/das16.c:960:31: note: variable 'krange' declared const here
     960 |                 const struct comedi_krange *krange;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/comedi/drivers/das16.c:972:15: error: cannot assign to variable 'krange' with const-qualified type 'const struct comedi_krange *'
     972 |                 krange->max = max;
         |                 ~~~~~~~~~~~ ^
   drivers/comedi/drivers/das16.c:960:31: note: variable 'krange' declared const here
     960 |                 const struct comedi_krange *krange;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/comedi/drivers/das16.c:973:17: error: cannot assign to variable 'krange' with const-qualified type 'const struct comedi_krange *'
     973 |                 krange->flags = UNIT_volt;
         |                 ~~~~~~~~~~~~~ ^
   drivers/comedi/drivers/das16.c:960:31: note: variable 'krange' declared const here
     960 |                 const struct comedi_krange *krange;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/comedi/drivers/das16.c:1003:18: error: cannot assign to variable 'lrange' with const-qualified type 'const struct comedi_lrange *'
    1003 |                 lrange->length = 1;
         |                 ~~~~~~~~~~~~~~ ^
   drivers/comedi/drivers/das16.c:993:31: note: variable 'lrange' declared const here
     993 |                 const struct comedi_lrange *lrange;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/comedi/drivers/das16.c:1005:15: error: cannot assign to variable 'krange' with const-qualified type 'const struct comedi_krange *'
    1005 |                 krange->min = min;
         |                 ~~~~~~~~~~~ ^
   drivers/comedi/drivers/das16.c:994:31: note: variable 'krange' declared const here
     994 |                 const struct comedi_krange *krange;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/comedi/drivers/das16.c:1006:15: error: cannot assign to variable 'krange' with const-qualified type 'const struct comedi_krange *'
    1006 |                 krange->max = max;
         |                 ~~~~~~~~~~~ ^
   drivers/comedi/drivers/das16.c:994:31: note: variable 'krange' declared const here
     994 |                 const struct comedi_krange *krange;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/comedi/drivers/das16.c:1007:17: error: cannot assign to variable 'krange' with const-qualified type 'const struct comedi_krange *'
    1007 |                 krange->flags = UNIT_volt;
         |                 ~~~~~~~~~~~~~ ^
   drivers/comedi/drivers/das16.c:994:31: note: variable 'krange' declared const here
     994 |                 const struct comedi_krange *krange;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   8 errors generated.


vim +969 drivers/comedi/drivers/das16.c

742c4a095973f6 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-12  947  
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  948  static const struct comedi_lrange *das16_ai_range(struct comedi_device *dev,
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  949  						  struct comedi_subdevice *s,
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  950  						  struct comedi_devconfig *it,
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  951  						  unsigned int pg_type,
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  952  						  unsigned int status)
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  953  {
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  954  	unsigned int min = it->options[4];
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  955  	unsigned int max = it->options[5];
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  956  
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  957  	/* get any user-defined input range */
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  958  	if (pg_type == das16_pg_none && (min || max)) {
a987dd48bc19ae drivers/comedi/drivers/das16.c         Darshan Rathod      2025-04-26  959  		const struct comedi_lrange *lrange;
a987dd48bc19ae drivers/comedi/drivers/das16.c         Darshan Rathod      2025-04-26  960  		const struct comedi_krange *krange;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  961  
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  962  		/* allocate single-range range table */
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  963  		lrange = comedi_alloc_spriv(s,
ee8ed0141d532d drivers/comedi/drivers/das16.c         Gustavo A. R. Silva 2022-01-25  964  					    struct_size(lrange, range, 1));
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  965  		if (!lrange)
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  966  			return &range_unknown;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  967  
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  968  		/* initialize ai range */
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26 @969  		lrange->length = 1;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  970  		krange = lrange->range;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26 @971  		krange->min = min;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  972  		krange->max = max;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  973  		krange->flags = UNIT_volt;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  974  
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  975  		return lrange;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  976  	}
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  977  
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  978  	/* use software programmable range */
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  979  	if (status & DAS16_STATUS_UNIPOLAR)
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  980  		return das16_ai_uni_lranges[pg_type];
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  981  	return das16_ai_bip_lranges[pg_type];
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  982  }
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26  983  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
