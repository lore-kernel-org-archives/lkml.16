Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A4625DB10
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694333; cv=none; b=ek2QbER5py8wUeWuB7lvFjx7SxEYxWihqAeKJNly+PvUH63iKwIdByynvGiulqqyqfQHIMeY9kLPlae1rTnq5uOT4axrVLuaFlet9fCMLgOn/+rqIW+bL+EWpdCN1TtW6WDJTAL4gZNebq+snxHcjFCklDeBvx8HL4MWRzs/mrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694333; c=relaxed/simple;
	bh=HICEtZaAQRFHap7zIQoBmWTYfBPkkeBT85z5LMrKE8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEDRqSQUDQkhk/7hNLpji0WcqmBc3iFSM91qCeQIP1X59Z7Lkj7yo6fEgxgMU3zqkQ1fTfrtAgm3/qY5XDk9fslvKoZGKX1Vev00cccthmDp6AXoGMxzfpQrkF5FCb04tSawm1UK5pOFBAHc6y32vNqOEFhXL/rbQdjmlpWX4zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0tbGGV8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0tbGGV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745694331; x=1777230331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HICEtZaAQRFHap7zIQoBmWTYfBPkkeBT85z5LMrKE8A=;
  b=B0tbGGV8cSjoKmHteC5y/lA8WtDs5yNEdoirsuqCp9qHu6qUFLz7p2BL
   KlwCJ2Jpo8E1SRQ1q9IDx5tOkmIeBgh3wIpLBsvlvSikO5n2IEGIGwls0
   wVKOPNAHoHYdUHrCewUPuv2BIseiZclxOP2fn6bPfeLUnpJzz4FwbYZCV
   oGT1VMjabILDu3j2dRx/ntaDyA2yx+r2rXPK+s91NVfN1r7hb+9HXNE+C
   CP/p9SGETU28KwhDBN4U/sP7KYYX2Lxwd5vdSgP1EPyMH9ZsUULrmV1uy
   fMMiowMy/W37NsTlFWjA7Du1DjGlQ66+MUb64GUTSSbxML572uaBFpsD4
   Q==;
X-CSE-ConnectionGUID: BhQG1W2YTSydj9H9anUHtg==
X-CSE-MsgGUID: 8nrb1p7NQIqtfqanwifvTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="51147084"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="51147084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 12:05:30 -0700
X-CSE-ConnectionGUID: MmtfxJ28TrKutqY06FgGBg==
X-CSE-MsgGUID: M+VDgQ65QwKJF0RDln6ykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="137216153"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Apr 2025 12:05:29 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8kq6-0005xN-2w;
	Sat, 26 Apr 2025 19:05:26 +0000
Date: Sun, 27 Apr 2025 03:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Darshan Rathod <darshanrathod475@gmail.com>, abbotti@mev.co.uk0
Cc: oe-kbuild-all@lists.linux.dev, hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org,
	Darshan Rathod <darshanrathod475@gmail.com>
Subject: Re: [PATCH] Staging: comedi: das16: Fixed a stucture warning in code
Message-ID: <202504270205.NwA93W44-lkp@intel.com>
References: <20250426113627.36525-1-darshanrathod475@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426113627.36525-1-darshanrathod475@gmail.com>

Hi Darshan,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Darshan-Rathod/Staging-comedi-das16-Fixed-a-stucture-warning-in-code/20250426-193741
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250426113627.36525-1-darshanrathod475%40gmail.com
patch subject: [PATCH] Staging: comedi: das16: Fixed a stucture warning in code
config: powerpc-randconfig-003-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270205.NwA93W44-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270205.NwA93W44-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270205.NwA93W44-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/comedi/drivers/das16.c: In function 'das16_ai_range':
>> drivers/comedi/drivers/das16.c:969:18: error: assignment of member 'length' in read-only object
      lrange->length = 1;
                     ^
>> drivers/comedi/drivers/das16.c:971:15: error: assignment of member 'min' in read-only object
      krange->min = min;
                  ^
>> drivers/comedi/drivers/das16.c:972:15: error: assignment of member 'max' in read-only object
      krange->max = max;
                  ^
>> drivers/comedi/drivers/das16.c:973:17: error: assignment of member 'flags' in read-only object
      krange->flags = UNIT_volt;
                    ^
   drivers/comedi/drivers/das16.c: In function 'das16_ao_range':
   drivers/comedi/drivers/das16.c:1003:18: error: assignment of member 'length' in read-only object
      lrange->length = 1;
                     ^
   drivers/comedi/drivers/das16.c:1005:15: error: assignment of member 'min' in read-only object
      krange->min = min;
                  ^
   drivers/comedi/drivers/das16.c:1006:15: error: assignment of member 'max' in read-only object
      krange->max = max;
                  ^
   drivers/comedi/drivers/das16.c:1007:17: error: assignment of member 'flags' in read-only object
      krange->flags = UNIT_volt;
                    ^


vim +/length +969 drivers/comedi/drivers/das16.c

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
5c47473ec0f437 drivers/comedi/drivers/das16.c         Darshan Rathod      2025-04-26  959  		const struct comedi_lrange *lrange;
5c47473ec0f437 drivers/comedi/drivers/das16.c         Darshan Rathod      2025-04-26  960  		const struct comedi_krange *krange;
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
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26 @972  		krange->max = max;
0ce8280e287609 drivers/staging/comedi/drivers/das16.c H Hartley Sweeten   2015-01-26 @973  		krange->flags = UNIT_volt;
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
