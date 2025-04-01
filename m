Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E1B6A33B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743468775; cv=none; b=ZuOrIsPkCU8d3C1P7705uf6frRC6l7TNn9uNea3boPmSdKVRqFUQSpkATqjlU3pDaY8uohX4tiekbXgn9X6cVjlz1uCnNnVqn7J2gxIOGWn/8HFdwndJrAoUv5R3kHV+zSr0q8czIpElK4ZCuJ7/9bBkUCyoSqWQKsgd/m4Rlqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743468775; c=relaxed/simple;
	bh=CMpSQHq3iF7V7TCw9C/Cs1GU8XUOe2N2XNb6odHDafY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNsh7AH5TFuS0SUTZ7eBhLMjkPOYJ0IhiVH8gjVsxT6PVQJ9zOf6dlfx0Xy94ix/iSWyPUKL6gu59DkPQ6q5rF3p1GNf5keBBrqt5srjL7r8baYZ2vCYZ3oFFCr0m5LpynXtMPz5irHkbvZd8btdH9zVfy8ClgO0yyLXTIH09nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3UewMlG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3UewMlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743468774; x=1775004774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CMpSQHq3iF7V7TCw9C/Cs1GU8XUOe2N2XNb6odHDafY=;
  b=T3UewMlG0D/qiaNV86Iy3iygPVo8JXY5+s4dAQgtu8OZbKzVsEJvluOZ
   undFSTAetGiumn0bhT/lHpsV0rCRRkADRXRpdsBPaOX+N7L5feiVBOuv4
   gLFlUKDeP9TzCDHcKg9xE3PtvApJxlpRiNGW7n3NRt5YUYTwkoIBkFmwJ
   Phmv+TWCCme1DewKRfZhnSuo6GYSAdtJFhJWic5g2fag7grtfVMwmx36N
   8gMDWe0ZyGosB3JtoNNZCkbj2ETT6tI8xxxhSo+GQ7ia4irg6Lou08KBe
   TZtCMBFg/Xq/j2A/y4Km1eoqS48VHyndakl8wbfBlfJO7n2OYvRp/uSVy
   w==;
X-CSE-ConnectionGUID: Cd19MVExQeyWp6ml9E9sFw==
X-CSE-MsgGUID: il6CWJbDQH+SSmK7P7P86w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="32375147"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="32375147"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:52:53 -0700
X-CSE-ConnectionGUID: abTSWexGQ++Mu1J4er3vWg==
X-CSE-MsgGUID: uL8l00A8Q4yl6FeaFQH8UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126701732"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2025 17:52:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzPrz-0009Wi-2U;
	Tue, 01 Apr 2025 00:52:47 +0000
Date: Tue, 1 Apr 2025 08:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: gpittala <ganeshkpittala@gmail.com>, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	hvaibhav.linux@gmail.com, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, rmfrfs@gmail.com,
	pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ganeshkpittala@gmail.com
Subject: Re: [PATCH] staging: greybus: Multiple cleanups and refactors
Message-ID: <202504010829.vIzweYue-lkp@intel.com>
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331213337.6171-1-ganeshkpittala@gmail.com>

Hi gpittala,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/gpittala/staging-greybus-Multiple-cleanups-and-refactors/20250401-053719
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250331213337.6171-1-ganeshkpittala%40gmail.com
patch subject: [PATCH] staging: greybus: Multiple cleanups and refactors
config: i386-buildonly-randconfig-004-20250401 (https://download.01.org/0day-ci/archive/20250401/202504010829.vIzweYue-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504010829.vIzweYue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504010829.vIzweYue-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/greybus/loopback.c:272:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     272 | gb_loopback_stats_attrs(latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
>> drivers/staging/greybus/loopback.c:272:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     272 | gb_loopback_stats_attrs(latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:274:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     274 | gb_loopback_stats_attrs(requests_per_second);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:274:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     274 | gb_loopback_stats_attrs(requests_per_second);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:276:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     276 | gb_loopback_stats_attrs(throughput);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:276:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     276 | gb_loopback_stats_attrs(throughput);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:278:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     278 | gb_loopback_stats_attrs(apbridge_unipro_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:278:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     278 | gb_loopback_stats_attrs(apbridge_unipro_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:280:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     280 | gb_loopback_stats_attrs(gbphy_firmware_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:167:2: note: expanded from macro 'gb_loopback_stats_attrs'
     167 |         gb_loopback_ro_stats_attr(field, min, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:280:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     280 | gb_loopback_stats_attrs(gbphy_firmware_latency);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:168:2: note: expanded from macro 'gb_loopback_stats_attrs'
     168 |         gb_loopback_ro_stats_attr(field, max, u);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:142:27: note: expanded from macro 'gb_loopback_ro_stats_attr'
     142 |         return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);               \
         |                                 ~^
   drivers/staging/greybus/loopback.c:301:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     301 | gb_dev_loopback_rw_attr(type, d);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:27: note: expanded from macro 'gb_dev_loopback_rw_attr'
     213 |         return sysfs_emit(buf, "%\n" #type "\n", gb->field);                    \
         |                                 ~^
   drivers/staging/greybus/loopback.c:303:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     303 | gb_dev_loopback_rw_attr(size, u);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:27: note: expanded from macro 'gb_dev_loopback_rw_attr'
     213 |         return sysfs_emit(buf, "%\n" #type "\n", gb->field);                    \
         |                                 ~^
   drivers/staging/greybus/loopback.c:305:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     305 | gb_dev_loopback_rw_attr(us_wait, d);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:27: note: expanded from macro 'gb_dev_loopback_rw_attr'
     213 |         return sysfs_emit(buf, "%\n" #type "\n", gb->field);                    \
         |                                 ~^
   drivers/staging/greybus/loopback.c:307:1: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
     307 | gb_dev_loopback_rw_attr(iteration_max, u);


vim +/x0a +272 drivers/staging/greybus/loopback.c

355a7058153e04b Alexandre Bailon 2015-03-31  270  
355a7058153e04b Alexandre Bailon 2015-03-31  271  /* Time to send and receive one message */
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03 @272  gb_loopback_stats_attrs(latency);
583cbf50e0a4c89 Bryan O'Donoghue 2015-07-21  273  /* Number of requests sent per second on this cport */
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03  274  gb_loopback_stats_attrs(requests_per_second);
355a7058153e04b Alexandre Bailon 2015-03-31  275  /* Quantity of data sent and received on this cport */
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03  276  gb_loopback_stats_attrs(throughput);
1ec5843ee988991 Bryan O'Donoghue 2015-10-15  277  /* Latency across the UniPro link from APBridge's perspective */
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03  278  gb_loopback_stats_attrs(apbridge_unipro_latency);
1ec5843ee988991 Bryan O'Donoghue 2015-10-15  279  /* Firmware induced overhead in the GPBridge */
e54b106dd1be503 Sandeep Patil    2016-05-19  280  gb_loopback_stats_attrs(gbphy_firmware_latency);
8e1d6c336d74977 Bryan O'Donoghue 2015-12-03  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
