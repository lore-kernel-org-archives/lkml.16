Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4698714A8B
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976743; cv=none; b=oAcTueDhlTLbGo8Kb5l0MGGkniSdjvOQJmj+CwwDlLvgShEJgCG37JEGpWDRsjlUU+0lEjwGmhe83htEhPTlZ73G+HYyXFTCMjlvk6Hioow+Kjp6xhMggfPkOdfPG+7DksKpSy+9p5VkrBKQwkBsWNA+Cc6/sbkoQNWhUqm8HSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976743; c=relaxed/simple;
	bh=d8vzZRwLPwViD420OdIgJhDQbhL+2kT+lTYaavjXEgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgmyWEsAbqPZIbu8HBUtDl2XhZ+1RdepJqezs5nCNQM5KBHOcaEfWHxV3djJgwDD1hEX4L3p2CAPwr5/1VOCMw+bVLCqv72HAlqC7QR8Dqq6VJjy7kyrdfWLhCblK6ncGaUzCNBDQmBXFP88JpoJdx+ORrlMvVV+nz0yPj/Av8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjC6fNht; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjC6fNht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738976742; x=1770512742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d8vzZRwLPwViD420OdIgJhDQbhL+2kT+lTYaavjXEgk=;
  b=jjC6fNhtVYjIr3Z4tOtfx66lV+JHiHUcMFKPAhuPn4MemtsyUkIECpWa
   TOEkqq+OEcBkO77ukfN5dl+cSROt8lf2hKeBzexZlRjBzQjCKDDfoo3Pq
   OuO6h0H8H8ZntTTn6NZyK1Y7sM2WZFQIXIE1MWrvTTTcu2pN7RAtVd96U
   HHoP+G3zeFFbPle/ZJ5tTjjte2PP2Q54RlWlosuUKkz5f2tShxGjZecc3
   /9GiZYzn6zmJQ3wH97B+oHgyqsQjyutHXR77oUnc67qWa14Ii1E+HHCBL
   CT1cgMXdlsI/nyTeG3i+6j2/PCKYRamyZ+3MylHRq7fMqGjCHO9atR9M2
   g==;
X-CSE-ConnectionGUID: SVkTEiGBSPaYKBBarX/mWQ==
X-CSE-MsgGUID: gxM7DqydQVGisvzyFww1qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39756997"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39756997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 17:05:41 -0800
X-CSE-ConnectionGUID: S6SyaLI+TpuY3YmuzPn2cQ==
X-CSE-MsgGUID: H55n+kLZTaO7+KZt1W2iow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134911131"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2025 17:05:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgZHr-000zKh-1X;
	Sat, 08 Feb 2025 01:05:35 +0000
Date: Sat, 8 Feb 2025 09:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: zihan zhou <15645113830zzh@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, bsegall@google.com,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH V2 2/2] sched: Reduce the default slice to avoid tasks
 getting an extra tick
Message-ID: <202502080831.VwRnAlxo-lkp@intel.com>
References: <20250207062402.33725-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207062402.33725-1-15645113830zzh@gmail.com>

Hi zihan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on peterz-queue/sched/core linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zihan-zhou/sched-Reduce-the-default-slice-to-avoid-tasks-getting-an-extra-tick/20250207-142556
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250207062402.33725-1-15645113830zzh%40gmail.com
patch subject: [PATCH V2 2/2] sched: Reduce the default slice to avoid tasks getting an extra tick
config: i386-randconfig-141-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080831.VwRnAlxo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080831.VwRnAlxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080831.VwRnAlxo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:193:2: error: call to undeclared function 'sched_update_scaling'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     193 |         sched_update_scaling();
         |         ^
   1 error generated.


vim +/sched_update_scaling +193 kernel/sched/debug.c

   168	
   169	
   170	static ssize_t sched_base_slice_write(struct file *filp, const char __user *ubuf,
   171					   size_t cnt, loff_t *ppos)
   172	{
   173		char buf[16];
   174		unsigned int base_slice;
   175	
   176		if (cnt > 15)
   177			cnt = 15;
   178	
   179		if (copy_from_user(&buf, ubuf, cnt))
   180			return -EFAULT;
   181		buf[cnt] = '\0';
   182	
   183		if (kstrtouint(buf, 10, &base_slice))
   184			return -EINVAL;
   185	
   186	
   187		base_slice = clamp_t(u64, base_slice,
   188						NSEC_PER_MSEC/10,   /* HZ=1000 * 10 */
   189						NSEC_PER_MSEC*100); /* HZ=100  / 10 */
   190	
   191		sysctl_sched_base_slice = base_slice;
   192	
 > 193		sched_update_scaling();
   194	
   195		*ppos += cnt;
   196		return cnt;
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
