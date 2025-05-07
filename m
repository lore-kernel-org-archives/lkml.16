Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD2821CC45;
	Wed,  7 May 2025 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617767; cv=none; b=gaYHGCW4RXPG5b2oPvn2dr55oCh7Svf01pLM3QTTLYxWe7FczmxphJD3iuREwlr4Js4Ccu3U5HYealb10D9797py0zB6/9HYvifRc1dDwQ6vADPxkXGEWgOv2D6yuyHacLr7bfXHuQSmmU6QGA0yLKdSEr9zpTOWL0rZOOdRGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617767; c=relaxed/simple;
	bh=49oBLtVDl/a7eoaCQ18JFPDgN5OMlYWx4iq2ZQubEEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noyjuJ4vza6770v1d1sf0hdLsifYkK8p6a2VfB2bZ3AXkio7dnubHN7Q0vxBiv0WJdxOroUthPx01rRP1VvfsW9CPbvAdY59J+Sf+XF4x7jhj4ibCasqSH0YNbQ+fjCSYoZ45MFODd6cBRTPYh75EI66hDCt70mbKefzEOdFsaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxVwit8Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxVwit8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746617766; x=1778153766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=49oBLtVDl/a7eoaCQ18JFPDgN5OMlYWx4iq2ZQubEEg=;
  b=cxVwit8Y2PifFb+5IL1q3OfndKn54YFdU9JfsFtoI7nGDbE4vMi7u7o9
   cArlkuaMniZ7IkHIAaOr/MVmQibv9+/CIbzVEHw8qru6n00UxjyGaIv62
   GY8ifOU4zYkp0QAZ+MMmL3QwLEJRrwstbrDXR4vc+a5Za4C1SkBW7KDku
   un1IHo8h/6UcZ9+7nnsKR1iBW3Gg6gjCq0RstFteWDdRslVH80LFWg0U7
   wHi4NFAsk2+LnWzgXRTYW5FewKjRGdWJiAfdHMxZiDLaoqYUeWDSSf3IH
   jFzFkmi2MqgPTVk45gMdmvbzRMCK7rFkjO7fjHGgzZHsmoOMFgRjGowHW
   A==;
X-CSE-ConnectionGUID: m48hsSsuSJm9QClvODiiZg==
X-CSE-MsgGUID: 5RyERPSfQNGFXnxaFzMp4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48243595"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48243595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:36:05 -0700
X-CSE-ConnectionGUID: X5e6XJ8GRXaTzAwMUqYDWQ==
X-CSE-MsgGUID: u7fHLKZYQ6a9CF74WHQAUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135841842"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 04:36:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCd4C-0007gv-0f;
	Wed, 07 May 2025 11:36:00 +0000
Date: Wed, 7 May 2025 19:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chiang Brian <chiang.brian@inventec.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <202505071941.RISL4lFW-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chiang-Brian/dt-bindings-trivial-Add-tps53685-support/20250424-222559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250424132538.2004510-2-chiang.brian%40inventec.corp-partner.google.com
patch subject: [PATCH v6 1/2] hwmon: (pmbus/tps53679) Add support for TPS53685
config: riscv-randconfig-r112-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071941.RISL4lFW-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071941.RISL4lFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071941.RISL4lFW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/tps53679.c:133:57: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected char *id @@     got int device_id @@
   drivers/hwmon/pmbus/tps53679.c:133:57: sparse:     expected char *id
   drivers/hwmon/pmbus/tps53679.c:133:57: sparse:     got int device_id
>> drivers/hwmon/pmbus/tps53679.c:165:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int device_id @@     got char * @@
   drivers/hwmon/pmbus/tps53679.c:165:45: sparse:     expected int device_id
   drivers/hwmon/pmbus/tps53679.c:165:45: sparse:     got char *
>> drivers/hwmon/pmbus/tps53679.c:133:57: sparse: sparse: non size-preserving integer to pointer cast
>> drivers/hwmon/pmbus/tps53679.c:165:45: sparse: sparse: non size-preserving pointer to integer cast

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
