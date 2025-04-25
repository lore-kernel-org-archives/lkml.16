Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D81DE3C1;
	Fri, 25 Apr 2025 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600922; cv=none; b=titfBjr5G+Zr+yL8qxRP8eKORtBCdFytNy7gfkqs/1r13dcpLHN3WEKMsCO9VGKWJNP3gtmIZFfxWAWWVxZkDY2DD5tkGscqpC/03huKogwrpqj5mYVOOfsSBttd12c3QtWnPMxlX2LuQlLELEdMemcamc+4DGzWTCw6QMDZWPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600922; c=relaxed/simple;
	bh=3e9BUcOp9lJZgyjIMsLsCjD8rTiGOJhcb5CW+ZazBKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQKLlvduiLQII6Dy10N23/oxWEn7RI9DE+yp6UAnPCpibNFHfrdfZxksxJDZcYNU3aQM684N6rNRpFQGulGO5AIfomhQuW09K1lYewPU+XsXU99r5faHjA/cR2xuIU51eE6sBzwdBec6JUXnF2Wi/t3UoFAi+9LECgUbf1RKVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmpoDMRN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmpoDMRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745600920; x=1777136920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3e9BUcOp9lJZgyjIMsLsCjD8rTiGOJhcb5CW+ZazBKI=;
  b=SmpoDMRNTAZ0smB0wve/bMA+J32vWXi2VU3iPTGCA1CA8cfZeqCpkRuj
   Z0I5YpYPLf1DspStxS1QGinar0QIUISk49u9gtKph6eu8qkO7xn7pKfUk
   5lW2JZ+9dXtI44gvdnfWiQ4Y7FpQApwA5a09hZmKi+6iB/wgjhwEjCtjj
   ANQLCQvxLegt5+HKQsK68jDavKYXM4Enzh6lhVd2romuAL57lfBlXfp5i
   Xdu6VdF2kx0/URNWlrLwhWJmAkqhdWRsNKv+DcCWYc+GAdDIqjIghdELS
   4dRFh4sxRpQBGjmtlcP7/oh9HrGNoAA7y2BxVPgi9WA5U6jjytKXO93Q1
   w==;
X-CSE-ConnectionGUID: zO9Q3MJJTVy38XOzXDi3ZA==
X-CSE-MsgGUID: 920aLyJMSEOg5rRQl0M/9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="34885685"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="34885685"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:08:40 -0700
X-CSE-ConnectionGUID: LM4NqfKZTCSgdYhaGUkRAQ==
X-CSE-MsgGUID: Vh0Xj+TdQeq6Sn+JCr3WQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133481210"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Apr 2025 10:08:38 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8MXS-0005NZ-27;
	Fri, 25 Apr 2025 17:08:34 +0000
Date: Sat, 26 Apr 2025 01:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chiang Brian <chiang.brian@inventec.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <202504260045.9nia3Zzl-lkp@intel.com>
References: <20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com>

Hi Chiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on robh/for-next linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chiang-Brian/dt-bindings-trivial-Add-tps53685-support/20250424-222559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250424132538.2004510-2-chiang.brian%40inventec.corp-partner.google.com
patch subject: [PATCH v6 1/2] hwmon: (pmbus/tps53679) Add support for TPS53685
config: powerpc64-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250426/202504260045.9nia3Zzl-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504260045.9nia3Zzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260045.9nia3Zzl-lkp@intel.com/

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

53030bcc87e4a4 Guenter Roeck 2020-01-20  120  
53030bcc87e4a4 Guenter Roeck 2020-01-20  121  /*
53030bcc87e4a4 Guenter Roeck 2020-01-20  122   * Common identification function for chips with multi-phase support.
53030bcc87e4a4 Guenter Roeck 2020-01-20  123   * Since those chips have special configuration registers, we want to have
53030bcc87e4a4 Guenter Roeck 2020-01-20  124   * some level of reassurance that we are really talking with the chip
53030bcc87e4a4 Guenter Roeck 2020-01-20  125   * being probed. Check PMBus revision and chip ID.
53030bcc87e4a4 Guenter Roeck 2020-01-20  126   */
53030bcc87e4a4 Guenter Roeck 2020-01-20  127  static int tps53679_identify_multiphase(struct i2c_client *client,
53030bcc87e4a4 Guenter Roeck 2020-01-20  128  					struct pmbus_driver_info *info,
53030bcc87e4a4 Guenter Roeck 2020-01-20  129  					int pmbus_rev, int device_id)
53030bcc87e4a4 Guenter Roeck 2020-01-20  130  {
53030bcc87e4a4 Guenter Roeck 2020-01-20  131  	int ret;
53030bcc87e4a4 Guenter Roeck 2020-01-20  132  
53030bcc87e4a4 Guenter Roeck 2020-01-20 @133  	ret = tps53679_identify_chip(client, pmbus_rev, device_id);
53030bcc87e4a4 Guenter Roeck 2020-01-20  134  	if (ret < 0)
53030bcc87e4a4 Guenter Roeck 2020-01-20  135  		return ret;
53030bcc87e4a4 Guenter Roeck 2020-01-20  136  
53030bcc87e4a4 Guenter Roeck 2020-01-20  137  	ret = tps53679_identify_mode(client, info);
53030bcc87e4a4 Guenter Roeck 2020-01-20  138  	if (ret < 0)
53030bcc87e4a4 Guenter Roeck 2020-01-20  139  		return ret;
53030bcc87e4a4 Guenter Roeck 2020-01-20  140  
53030bcc87e4a4 Guenter Roeck 2020-01-20  141  	return tps53679_identify_phases(client, info);
53030bcc87e4a4 Guenter Roeck 2020-01-20  142  }
53030bcc87e4a4 Guenter Roeck 2020-01-20  143  
53030bcc87e4a4 Guenter Roeck 2020-01-20  144  static int tps53679_identify(struct i2c_client *client,
53030bcc87e4a4 Guenter Roeck 2020-01-20  145  			     struct pmbus_driver_info *info)
53030bcc87e4a4 Guenter Roeck 2020-01-20  146  {
53030bcc87e4a4 Guenter Roeck 2020-01-20  147  	return tps53679_identify_mode(client, info);
53030bcc87e4a4 Guenter Roeck 2020-01-20  148  }
53030bcc87e4a4 Guenter Roeck 2020-01-20  149  
a49c0dafb304b8 Chiang Brian  2025-04-24  150  static int tps53685_identify(struct i2c_client *client,
a49c0dafb304b8 Chiang Brian  2025-04-24  151  				 struct pmbus_driver_info *info)
a49c0dafb304b8 Chiang Brian  2025-04-24  152  {
a49c0dafb304b8 Chiang Brian  2025-04-24  153  	info->func[1] |= PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
a49c0dafb304b8 Chiang Brian  2025-04-24  154  			 PMBUS_HAVE_STATUS_INPUT;
a49c0dafb304b8 Chiang Brian  2025-04-24  155  	info->format[PSC_VOLTAGE_OUT] = linear;
a49c0dafb304b8 Chiang Brian  2025-04-24  156  	return tps53679_identify_chip(client, TPS53681_PMBUS_REVISION,
a49c0dafb304b8 Chiang Brian  2025-04-24  157  					   TPS53685_DEVICE_ID);
a49c0dafb304b8 Chiang Brian  2025-04-24  158  }
a49c0dafb304b8 Chiang Brian  2025-04-24  159  
53030bcc87e4a4 Guenter Roeck 2020-01-20  160  static int tps53681_identify(struct i2c_client *client,
53030bcc87e4a4 Guenter Roeck 2020-01-20  161  			     struct pmbus_driver_info *info)
53030bcc87e4a4 Guenter Roeck 2020-01-20  162  {
53030bcc87e4a4 Guenter Roeck 2020-01-20  163  	return tps53679_identify_multiphase(client, info,
53030bcc87e4a4 Guenter Roeck 2020-01-20  164  					    TPS53681_PMBUS_REVISION,
53030bcc87e4a4 Guenter Roeck 2020-01-20 @165  					    TPS53681_DEVICE_ID);
53030bcc87e4a4 Guenter Roeck 2020-01-20  166  }
53030bcc87e4a4 Guenter Roeck 2020-01-20  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
