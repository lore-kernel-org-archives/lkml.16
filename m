Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A5187848
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738994414; cv=none; b=fWKHuYdlT9dbtZM9sqhDuQHhlFGDOY5or60Z+ImL5Tn2oFX1dM/8FGCv0dVgTbtOuxnTQhSTKqtvHzt9tu2OLg1SXwB13bdItH3dSgEvH1ZOEzyltg5ZuCnKmHVw1J30+mQJMPi6N+y5IhVD6+sg1//7hdWmB+l+TgCC4cZMU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738994414; c=relaxed/simple;
	bh=v8GABo1UwktwEyJJqWmZGaAZAFNtICPfnzaZpX+Utb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab6HhK8p8XJyRTQ9NHh9KxJqcyXfqbuTZSyAoOIzHi7DXHJCxQM7au9LUpKItZtBs8wgovRFdj8P9FnSSJR6nrDDaJBhNvpgTjpHx+3wbZwCCEk+UztGtraAVcYLOPLoXilWvCur58HZCaxypycBAT+aAFI+pe8twrtjIdAspcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcrpZJ7C; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcrpZJ7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738994413; x=1770530413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8GABo1UwktwEyJJqWmZGaAZAFNtICPfnzaZpX+Utb4=;
  b=mcrpZJ7Ccg28nxTBwszYkOCq0fzszL/kywMvOZ07ndWM+UpGfp80ByW7
   LC0IObYwJsuShjseCl6Ka8wVKRcVOxLPMqoWFgdbmQ6APpzGwxb9fOXIV
   DAIYbXz5SMljYcmkInGYEtg7k1vZ6eAvlHMqW35Hsfi9yP9a7RlToBcB1
   rE+rhxUqeIVt9cYSo4GZy5Tjufd+Fr/nwUfSH7OkjrykbnpWPdq13MlhM
   VDOey2SuNmKGvo9r53pkMtpDzPyWRF6MCGcxrMF5RYOy+roFZZFY66ExB
   sgs7eAw4AM9NEzXbMdhB2kVP5+BLIBVytu8LEQZqELYMXljufbQlLfmKE
   Q==;
X-CSE-ConnectionGUID: 2yubInMvSK+1VqFRvVHh8g==
X-CSE-MsgGUID: iEmTMXiRRUqY8EZwySOyVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="51028713"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="51028713"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 22:00:12 -0800
X-CSE-ConnectionGUID: Kz5/PTaSRZeW6SsyjxyI+g==
X-CSE-MsgGUID: aj7zVIGPTeudqEkQRkDA9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134956830"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2025 22:00:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgdss-000zbz-2j;
	Sat, 08 Feb 2025 06:00:06 +0000
Date: Sat, 8 Feb 2025 13:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: zihan zhou <15645113830zzh@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, bsegall@google.com,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH V2 2/2] sched: Reduce the default slice to avoid tasks
 getting an extra tick
Message-ID: <202502081304.ujyIUca2-lkp@intel.com>
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
config: x86_64-randconfig-072-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081304.ujyIUca2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081304.ujyIUca2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081304.ujyIUca2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
   kernel/sched/debug.c: In function 'sched_base_slice_write':
>> kernel/sched/debug.c:193:9: error: implicit declaration of function 'sched_update_scaling'; did you mean 'sched_update_numa'? [-Werror=implicit-function-declaration]
     193 |         sched_update_scaling();
         |         ^~~~~~~~~~~~~~~~~~~~
         |         sched_update_numa
   cc1: some warnings being treated as errors


vim +193 kernel/sched/debug.c

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
