Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62022D7AD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802087; cv=none; b=KNbA4WvrAIATjlfMPACl+37bvCE/AVuysLNYDuJwusE1GxvYkApKJ6LIjof/EfTZqPDlFxCJpN+QJj9oReHXzkmHK9ljVV3z5hpg2KQhPknZO9ZvxF9GKTlMSkiP0K4CmblFZHHBe7BkMc+SIEdwip8yXZZJgTTATAt7EBfSRVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802087; c=relaxed/simple;
	bh=y04507FbmezAK8rMj6tPXO7bVGj9VUwZE90RETgFlVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7IEtOi6og7fV/l1xcJGBQ4m/a3GYGKznIuhEdBfjw/arDHjt50M3ykyiHXRkxXJbDiJ6h6R/fmH7ohhQ9pG1djMadZszxaWPFbZvVQvQYixjkHFSmsE/U5RJVo7WJ3OQum0roqYZxX421uBzxTjBJFB9IvUkAYYLHj2xS3i3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brDtzqrP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brDtzqrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744802085; x=1776338085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y04507FbmezAK8rMj6tPXO7bVGj9VUwZE90RETgFlVw=;
  b=brDtzqrPmrdSYS/nL3jhPRhbMqjC2oQsjxqbNHop/6Af9C71ebxdb3z6
   2wv3VmTF0w6tQbosZtGVy2q3YbcaXWqgxbzl2t9lByZplG/I+SlZ+MHvF
   vKo5U96iCxjzl0C36URAzecNuCarAMMaq/9CJpTpc1UCGQ4S1o8CJIyjp
   k/V/NdvuLr+nTWVjKluESVDMgBmWcGDQ3Te2cK/WGxwvM3gpVcHkpZST2
   mVcU6BJ46H1ofxq/JrmazRqfivsREmC/iUBvEZRZne8R5YsYZTbNkzLSu
   4YUyJXEbjqvCKDGIa9098JdwkK5QKCZuXoJWYYeK+w+y8U4srfwP9FSip
   g==;
X-CSE-ConnectionGUID: psXrL8SxS3SZz9El1FH7xQ==
X-CSE-MsgGUID: l4vmNnJEQaaZXQa3rtSNaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68835049"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="68835049"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:14:45 -0700
X-CSE-ConnectionGUID: QEz0H0rbTjeiP3gpe+WFEg==
X-CSE-MsgGUID: mUrm/8FeR3mQrJU/eo9ndA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="153639921"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2025 04:14:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u50j3-000JbA-0Y;
	Wed, 16 Apr 2025 11:14:41 +0000
Date: Wed, 16 Apr 2025 19:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: drivers/hwmon/aht10.c:182: warning: Function parameter or struct
 member 'data' not described in 'aht10_interval_write'
Message-ID: <202504161919.duDL1s2X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1a1d569a75f3ab2923cb62daf356d102e4df2b86
commit: 8c78f0dee4371ab3b0422edf08597525c6219512 hwmon: Add AHT10 Temperature and Humidity Sensor Driver
date:   4 years, 3 months ago
config: csky-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250416/202504161919.duDL1s2X-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161919.duDL1s2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161919.duDL1s2X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/aht10.c:87: warning: Excess function parameter 'client' description in 'aht10_init'
   drivers/hwmon/aht10.c:131: warning: Function parameter or struct member 'data' not described in 'aht10_read_values'
   drivers/hwmon/aht10.c:131: warning: Excess function parameter 'aht10_data' description in 'aht10_read_values'
>> drivers/hwmon/aht10.c:182: warning: Function parameter or struct member 'data' not described in 'aht10_interval_write'
>> drivers/hwmon/aht10.c:182: warning: Function parameter or struct member 'val' not described in 'aht10_interval_write'
>> drivers/hwmon/aht10.c:193: warning: Function parameter or struct member 'data' not described in 'aht10_interval_read'
>> drivers/hwmon/aht10.c:193: warning: Function parameter or struct member 'val' not described in 'aht10_interval_read'
>> drivers/hwmon/aht10.c:202: warning: Function parameter or struct member 'data' not described in 'aht10_temperature1_read'
>> drivers/hwmon/aht10.c:202: warning: Function parameter or struct member 'val' not described in 'aht10_temperature1_read'
>> drivers/hwmon/aht10.c:217: warning: Function parameter or struct member 'data' not described in 'aht10_humidity1_read'
>> drivers/hwmon/aht10.c:217: warning: Function parameter or struct member 'val' not described in 'aht10_humidity1_read'


vim +182 drivers/hwmon/aht10.c

   174	
   175	/**
   176	 * aht10_interval_write() - store the given minimum poll interval.
   177	 * Return: 0 on success, -EINVAL if a value lower than the
   178	 *         AHT10_MIN_POLL_INTERVAL is given
   179	 */
   180	static ssize_t aht10_interval_write(struct aht10_data *data,
   181					    long val)
 > 182	{
   183		data->min_poll_interval = ms_to_ktime(clamp_val(val, 2000, LONG_MAX));
   184		return 0;
   185	}
   186	
   187	/**
   188	 * aht10_interval_read() - read the minimum poll interval
   189	 *                            in milliseconds
   190	 */
   191	static ssize_t aht10_interval_read(struct aht10_data *data,
   192					   long *val)
 > 193	{
   194		*val = ktime_to_ms(data->min_poll_interval);
   195		return 0;
   196	}
   197	
   198	/**
   199	 * aht10_temperature1_read() - read the temperature in millidegrees
   200	 */
   201	static int aht10_temperature1_read(struct aht10_data *data, long *val)
 > 202	{
   203		int res;
   204	
   205		res = aht10_read_values(data);
   206		if (res < 0)
   207			return res;
   208	
   209		*val = data->temperature;
   210		return 0;
   211	}
   212	
   213	/**
   214	 * aht10_humidity1_read() - read the relative humidity in millipercent
   215	 */
   216	static int aht10_humidity1_read(struct aht10_data *data, long *val)
 > 217	{
   218		int res;
   219	
   220		res = aht10_read_values(data);
   221		if (res < 0)
   222			return res;
   223	
   224		*val = data->humidity;
   225		return 0;
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
