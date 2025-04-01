Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFE132103
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743486526; cv=none; b=dcV39ofoRMBAlEjoHclJC6ADllaMhyICupwZA3q2XGTbyvju4yaydPcHVXm5Qcz92Z7DElENNQAnsnL/cR2i6C9zZtnnfHAOVrH/dDHccr2c8D4I+s/HNfjfCPvdvztthe9AIdxL9/x7Z/d0p2CRD1pBzDEx6FFpsJkg35rZrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743486526; c=relaxed/simple;
	bh=/GPkXXLez8BoplEZ8tPkqQgZsZycCPWCjMvUWWxm+zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVMkCebza3cCwbpi0b5WTTVsasG8SAq0+qRYXPqsf/ugwsO+EHzkqbMCSfdeOVt5bkXGICxkntwLIZX+5rflB7T7mPIz6SECbMZhb7gu4niwCCmm+xBGmkUuW4Yuu1aktXbKBaAJEXLpQwhSHBA4F8XSBW5ExrP3+e9NidZF6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=In3r31RV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="In3r31RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743486523; x=1775022523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/GPkXXLez8BoplEZ8tPkqQgZsZycCPWCjMvUWWxm+zE=;
  b=In3r31RVzVgpSO+GZCgjPY4PSc41aavwTOahFcOF9/d7xQUSO/gxHmhA
   rd3P+SEc9N0xOG1xkZ6v4xnKobAnBwEW3fuxDFmdffOlaUFIAl1/tT4f2
   Y4PTHzVrJ2vAzHc3lwMK2UdXeJjXh9zfQA+C2jRHtoUuHUQ4YFH3NG2kG
   JGAigDHDihNeKSOB5lGeX/c6y3+zE3wnlYuz/ay4S5Qi5ApKqCjNB6ky9
   pLgBy2SULYoeFCyX52c/2KkUf/yhVMebqPlUDPdjAAac0WxXucbZs9/xI
   xk6NtDUQ6ckKGeJxWNGwATD6buQ7QoNgKRY87iPl6yrZj0ytXgKnEI3CH
   g==;
X-CSE-ConnectionGUID: Vz3NEfQoQJihHORjufVzag==
X-CSE-MsgGUID: 0YkahKMZT3+yoR0GLnIQjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55453070"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="55453070"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 22:48:42 -0700
X-CSE-ConnectionGUID: yKHD5nPyRdC7ytu8Lva51A==
X-CSE-MsgGUID: AduYCZPRRB+Vz2Bv0wHzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="163510259"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Mar 2025 22:48:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzUUC-0009ds-0D;
	Tue, 01 Apr 2025 05:48:35 +0000
Date: Tue, 1 Apr 2025 13:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: gpittala <ganeshkpittala@gmail.com>, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, rmfrfs@gmail.com,
	pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ganeshkpittala@gmail.com
Subject: Re: [PATCH] staging: greybus: Multiple cleanups and refactors
Message-ID: <202504011217.iRb2Bbls-lkp@intel.com>
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
config: sparc-randconfig-002-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011217.iRb2Bbls-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011217.iRb2Bbls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011217.iRb2Bbls-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/loopback.c: In function 'latency_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:272:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:272:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'latency_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:272:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:272:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'requests_per_second_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:274:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(requests_per_second);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:274:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(requests_per_second);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'requests_per_second_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:274:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(requests_per_second);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:274:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(requests_per_second);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'throughput_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:276:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(throughput);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:276:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(throughput);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'throughput_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:276:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(throughput);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:276:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(throughput);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'apbridge_unipro_latency_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:278:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(apbridge_unipro_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:278:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(apbridge_unipro_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'apbridge_unipro_latency_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:278:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(apbridge_unipro_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:278:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(apbridge_unipro_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'gbphy_firmware_latency_min_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:280:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(gbphy_firmware_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:167:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, min, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:280:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(gbphy_firmware_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'gbphy_firmware_latency_max_show':
>> drivers/staging/greybus/loopback.c:142:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:280:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(gbphy_firmware_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/loopback.c:142:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);  \
                            ^
   drivers/staging/greybus/loopback.c:168:2: note: in expansion of macro 'gb_loopback_ro_stats_attr'
     gb_loopback_ro_stats_attr(field, max, u);  \
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:280:1: note: in expansion of macro 'gb_loopback_stats_attrs'
    gb_loopback_stats_attrs(gbphy_firmware_latency);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'type_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:301:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(type, d);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:301:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(type, d);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'size_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:303:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(size, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:303:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(size, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'us_wait_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:305:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(us_wait, d);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:305:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(us_wait, d);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'iteration_max_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:307:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(iteration_max, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:307:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(iteration_max, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'async_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:311:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(async, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:311:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(async, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'timeout_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:313:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(timeout, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:313:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(timeout, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c: In function 'outstanding_operations_max_show':
   drivers/staging/greybus/loopback.c:213:25: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:315:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(outstanding_operations_max, u);
    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/loopback.c:213:25: warning: too many arguments for format [-Wformat-extra-args]
     return sysfs_emit(buf, "%\n" #type "\n", gb->field);   \
                            ^
   drivers/staging/greybus/loopback.c:315:1: note: in expansion of macro 'gb_dev_loopback_rw_attr'
    gb_dev_loopback_rw_attr(outstanding_operations_max, u);
    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/x0a +142 drivers/staging/greybus/loopback.c

   132	
   133	#define gb_loopback_ro_stats_attr(name, field, type)		\
   134	static ssize_t name##_##field##_show(struct device *dev,	\
   135				    struct device_attribute *attr,		\
   136				    char *buf)					\
   137	{									\
   138		struct gb_loopback *gb = dev_get_drvdata(dev);			\
   139		/* Report 0 for min and max if no transfer succeeded */		\
   140		if (!gb->requests_completed)					\
   141			return sysfs_emit(buf, "0\n");				\
 > 142		return sysfs_emit(buf, "%\n" #type "\n", gb->name.field);		\
   143	}									\
   144	static DEVICE_ATTR_RO(name##_##field)
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
