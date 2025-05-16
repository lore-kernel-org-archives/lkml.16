Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003D139E;
	Fri, 16 May 2025 05:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747373470; cv=none; b=UXDJ4EFbmwCKEs9+pDFVHIxcB/HgIrFCGZjMr+VTS9g5fSKZa7Dz2fBIVzEXFPY5HZiIl4KtqWjcyQSMWVxml+VZ/HoeGMy9w5Wi6MuycaIxOK7ce6F6fsLzNNhnWs7EilIFm4bm6jAKggyd1K7Nbj/f1Cl5KMMETQwTKHT0d9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747373470; c=relaxed/simple;
	bh=toxGotdghsHUab1+RRGl3zwSsX4qzYDutwY3v4Z9C+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+7KBxD4OArOOmtT9wnhpQ4zwWwejXyS5CRhgv9gzVnowdnMCk9PCIlGjm4QP8+CsG91yaHHevN4CdBkhMHhbbxzsEFNvua3SVPEiOjnYX6t6ZPOUogq0dX/SLRb3F3ZK9pquOT7ByRSJ8e6J9XZo/NUso+n8pZEMBmJLz1vubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xe5+BfOC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xe5+BfOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747373469; x=1778909469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=toxGotdghsHUab1+RRGl3zwSsX4qzYDutwY3v4Z9C+g=;
  b=Xe5+BfOCSaSLdQjyvioK3QzYYfSrCgNUA8oBu7Q6XxYSMS4nSaoY+PCa
   b5yXxtEXHNjuhLLdCV/Aiu37YzzwyrpgYcwoY5BoIYKbWNi3R2wVAfekC
   4lcXWst74NpkkPE3lLDrfe3fNAOLkj1z+o+7QkeY3zwrQ3RkE227KFcNs
   n1sJAyM016yWfkmerBifTzQpQ1AcTtU1B5jd1uee9tcLpT/4R+oSnbAhN
   cE7rDHR3bjRGrL7Pogp+VZ+Qv1oMb3S0y+MG392NUtXXR9tR8yYZmnw/y
   eqCyreIHyXA6ndKByfJgyrTRrFtLnn5OSS4AYGnQBACTVAt6GZLa0XvyZ
   Q==;
X-CSE-ConnectionGUID: /5uEeI+LQKufEjzxxXrgvA==
X-CSE-MsgGUID: iyW2gnn4TumPO38a0LXtFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74734088"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="74734088"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 22:31:08 -0700
X-CSE-ConnectionGUID: XDTdNfeGSuG7gBpjsL5y9w==
X-CSE-MsgGUID: m0RU7hrdT9K3M202SrKrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138979538"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 22:31:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFnew-000J1T-0H;
	Fri, 16 May 2025 05:31:02 +0000
Date: Fri, 16 May 2025 13:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chiang Brian <chiang.brian@inventec.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <202505161242.oQFhPxZ9-lkp@intel.com>
References: <20250515081449.1433772-3-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515081449.1433772-3-chiang.brian@inventec.com>

Hi Chiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on groeck-staging/hwmon-next krzk-dt/for-next linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chiang-Brian/hwmon-pmbus-tps53679-Add-support-for-TPS53685/20250515-171511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250515081449.1433772-3-chiang.brian%40inventec.com
patch subject: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
config: i386-buildonly-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161242.oQFhPxZ9-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161242.oQFhPxZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161242.oQFhPxZ9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/tps53679.c:133:50: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'char *' [-Wint-conversion]
     133 |         ret = tps53679_identify_chip(client, pmbus_rev, device_id);
         |                                                         ^~~~~~~~~
   drivers/hwmon/pmbus/tps53679.c:90:26: note: passing argument to parameter 'id' here
      90 |                                   u8 revision, char *id)
         |                                                      ^
>> drivers/hwmon/pmbus/tps53679.c:165:10: error: incompatible pointer to integer conversion passing 'char[2]' to parameter of type 'int' [-Wint-conversion]
     165 |                                             TPS53681_DEVICE_ID);
         |                                             ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/tps53679.c:34:32: note: expanded from macro 'TPS53681_DEVICE_ID'
      34 | #define TPS53681_DEVICE_ID     "\x81"
         |                                ^~~~~~
   drivers/hwmon/pmbus/tps53679.c:129:25: note: passing argument to parameter 'device_id' here
     129 |                                         int pmbus_rev, int device_id)
         |                                                            ^
   2 errors generated.


vim +133 drivers/hwmon/pmbus/tps53679.c

53030bcc87e4a4b Guenter Roeck 2020-01-20  120  
53030bcc87e4a4b Guenter Roeck 2020-01-20  121  /*
53030bcc87e4a4b Guenter Roeck 2020-01-20  122   * Common identification function for chips with multi-phase support.
53030bcc87e4a4b Guenter Roeck 2020-01-20  123   * Since those chips have special configuration registers, we want to have
53030bcc87e4a4b Guenter Roeck 2020-01-20  124   * some level of reassurance that we are really talking with the chip
53030bcc87e4a4b Guenter Roeck 2020-01-20  125   * being probed. Check PMBus revision and chip ID.
53030bcc87e4a4b Guenter Roeck 2020-01-20  126   */
53030bcc87e4a4b Guenter Roeck 2020-01-20  127  static int tps53679_identify_multiphase(struct i2c_client *client,
53030bcc87e4a4b Guenter Roeck 2020-01-20  128  					struct pmbus_driver_info *info,
53030bcc87e4a4b Guenter Roeck 2020-01-20  129  					int pmbus_rev, int device_id)
53030bcc87e4a4b Guenter Roeck 2020-01-20  130  {
53030bcc87e4a4b Guenter Roeck 2020-01-20  131  	int ret;
53030bcc87e4a4b Guenter Roeck 2020-01-20  132  
53030bcc87e4a4b Guenter Roeck 2020-01-20 @133  	ret = tps53679_identify_chip(client, pmbus_rev, device_id);
53030bcc87e4a4b Guenter Roeck 2020-01-20  134  	if (ret < 0)
53030bcc87e4a4b Guenter Roeck 2020-01-20  135  		return ret;
53030bcc87e4a4b Guenter Roeck 2020-01-20  136  
53030bcc87e4a4b Guenter Roeck 2020-01-20  137  	ret = tps53679_identify_mode(client, info);
53030bcc87e4a4b Guenter Roeck 2020-01-20  138  	if (ret < 0)
53030bcc87e4a4b Guenter Roeck 2020-01-20  139  		return ret;
53030bcc87e4a4b Guenter Roeck 2020-01-20  140  
53030bcc87e4a4b Guenter Roeck 2020-01-20  141  	return tps53679_identify_phases(client, info);
53030bcc87e4a4b Guenter Roeck 2020-01-20  142  }
53030bcc87e4a4b Guenter Roeck 2020-01-20  143  
53030bcc87e4a4b Guenter Roeck 2020-01-20  144  static int tps53679_identify(struct i2c_client *client,
53030bcc87e4a4b Guenter Roeck 2020-01-20  145  			     struct pmbus_driver_info *info)
53030bcc87e4a4b Guenter Roeck 2020-01-20  146  {
53030bcc87e4a4b Guenter Roeck 2020-01-20  147  	return tps53679_identify_mode(client, info);
53030bcc87e4a4b Guenter Roeck 2020-01-20  148  }
53030bcc87e4a4b Guenter Roeck 2020-01-20  149  
340e957083852e1 Chiang Brian  2025-05-15  150  static int tps53685_identify(struct i2c_client *client,
340e957083852e1 Chiang Brian  2025-05-15  151  				 struct pmbus_driver_info *info)
340e957083852e1 Chiang Brian  2025-05-15  152  {
340e957083852e1 Chiang Brian  2025-05-15  153  	info->func[1] |= PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
340e957083852e1 Chiang Brian  2025-05-15  154  			 PMBUS_HAVE_STATUS_INPUT;
340e957083852e1 Chiang Brian  2025-05-15  155  	info->format[PSC_VOLTAGE_OUT] = linear;
340e957083852e1 Chiang Brian  2025-05-15  156  	return tps53679_identify_chip(client, TPS53681_PMBUS_REVISION,
340e957083852e1 Chiang Brian  2025-05-15  157  					   TPS53685_DEVICE_ID);
340e957083852e1 Chiang Brian  2025-05-15  158  }
340e957083852e1 Chiang Brian  2025-05-15  159  
53030bcc87e4a4b Guenter Roeck 2020-01-20  160  static int tps53681_identify(struct i2c_client *client,
53030bcc87e4a4b Guenter Roeck 2020-01-20  161  			     struct pmbus_driver_info *info)
53030bcc87e4a4b Guenter Roeck 2020-01-20  162  {
53030bcc87e4a4b Guenter Roeck 2020-01-20  163  	return tps53679_identify_multiphase(client, info,
53030bcc87e4a4b Guenter Roeck 2020-01-20  164  					    TPS53681_PMBUS_REVISION,
53030bcc87e4a4b Guenter Roeck 2020-01-20 @165  					    TPS53681_DEVICE_ID);
53030bcc87e4a4b Guenter Roeck 2020-01-20  166  }
53030bcc87e4a4b Guenter Roeck 2020-01-20  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
