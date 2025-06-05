Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F66328E17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 22:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749163961; cv=none; b=pW0TfbAfELuhTq40dUDlGUDgy7IP532t2Usfu/ur3WafGVmrixdNXHdEEZdyNfTndU9Hktan5432NfpD6AleeRJ3W16TkZr5YGhfYJT121c74g2fCaIxYAqtIbT0fwD1KBu1/mrPHX8MCaQS7sVqA9cIHhCFyn+BUhVuacWcEC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749163961; c=relaxed/simple;
	bh=hVCG/PNAyR47L2wew1gz+MjkOBF/by+He8JQcUJ+LD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqHiT0qeVCWTT/hCgRqF+EYDn74CfD/kwDPONN4XF9mwKYvzujQ9XqWTTuIWIKBNpG4lFadVH6yKoo9EapR6T8UTX6DR7AujPAiDS6oY1OHUywfMsT0ygtJKg8WfKwy4uObJGADmrKmOtVW3mUJ1TTBo1Q2GOaBb/AtuqPU7yck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMXFIUDW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMXFIUDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749163960; x=1780699960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hVCG/PNAyR47L2wew1gz+MjkOBF/by+He8JQcUJ+LD8=;
  b=LMXFIUDWcdITc66rUwE3QAKt/1hxCMXCRAW4WcqpLtVdBGJ8DwDRYJSF
   SeM54tRzKvJeDI1zE/Urvc84/H8fQXbJraE6QCeJWs5X1OTc3IJ3zK/mk
   BMNOIVH9Lh4sPi0VxFJrH5KRg7Oanqxn3Q2MDfiNs9vWzdPURTO9nwCG1
   A1pAkTBrhOxaz5Jjt2g3FeorCwfqtbMH1GeJdPdRFMnlEv1RTv/bqiFPw
   kO1i26rhqT6F/ZXOPGvdo5e+hBcbycrcnaz5WnwBjApupfYe57wp3c73o
   TwR9W0C8tnU9jc9IXhwoCIC/bmdKGXaFMi5LpIdcG0yyd2RZeIbZBOGK7
   A==;
X-CSE-ConnectionGUID: gfH2MUDQT9uKQ8IrMwGykw==
X-CSE-MsgGUID: grwHHjruR3qYY/Nmxauyfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51448018"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="51448018"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 15:52:39 -0700
X-CSE-ConnectionGUID: R+UqtUdlQsGpSkoUzszFwQ==
X-CSE-MsgGUID: cxHUHmgBSR6txsQLjuMVaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="150475768"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2025 15:52:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNJRq-0004Wr-2h;
	Thu, 05 Jun 2025 22:52:34 +0000
Date: Fri, 6 Jun 2025 06:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 2/3] debugobjects: Show the state of debug_objects_enabled
Message-ID: <202506060634.mQtyT7cN-lkp@intel.com>
References: <20250604220926.870760-3-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604220926.870760-3-longman@redhat.com>

Hi Waiman,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on akpm-mm/mm-everything tip/core/debugobjects linus/master v6.15 next-20250605]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Waiman-Long/debugobjects-Add-ODEBUG_FLAG_NO_ALLOC-to-disable-memory-allocation/20250605-061211
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250604220926.870760-3-longman%40redhat.com
patch subject: [PATCH 2/3] debugobjects: Show the state of debug_objects_enabled
config: arm-randconfig-002-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060634.mQtyT7cN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060634.mQtyT7cN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060634.mQtyT7cN-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/debugobjects.c: In function 'check_results':
>> lib/debugobjects.c:1325:17: error: implicit declaration of function 'debug_object_disable'; did you mean 'debug_objects_disable'? [-Werror=implicit-function-declaration]
    1325 |                 debug_object_disable("selftest");
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 debug_objects_disable
   cc1: some warnings being treated as errors


vim +1325 lib/debugobjects.c

  1288	
  1289	static int __init
  1290	check_results(void *addr, enum debug_obj_state state, int fixups, int warnings)
  1291	{
  1292		struct debug_bucket *db;
  1293		struct debug_obj *obj;
  1294		unsigned long flags;
  1295		int res = -EINVAL;
  1296	
  1297		db = get_bucket((unsigned long) addr);
  1298	
  1299		raw_spin_lock_irqsave(&db->lock, flags);
  1300	
  1301		obj = lookup_object(addr, db);
  1302		if (!obj && state != ODEBUG_STATE_NONE) {
  1303			WARN(1, KERN_ERR "ODEBUG: selftest object not found\n");
  1304			goto out;
  1305		}
  1306		if (obj && obj->state != state) {
  1307			WARN(1, KERN_ERR "ODEBUG: selftest wrong state: %d != %d\n",
  1308			       obj->state, state);
  1309			goto out;
  1310		}
  1311		if (fixups != debug_objects_fixups) {
  1312			WARN(1, KERN_ERR "ODEBUG: selftest fixups failed %d != %d\n",
  1313			       fixups, debug_objects_fixups);
  1314			goto out;
  1315		}
  1316		if (warnings != debug_objects_warnings) {
  1317			WARN(1, KERN_ERR "ODEBUG: selftest warnings failed %d != %d\n",
  1318			       warnings, debug_objects_warnings);
  1319			goto out;
  1320		}
  1321		res = 0;
  1322	out:
  1323		raw_spin_unlock_irqrestore(&db->lock, flags);
  1324		if (res)
> 1325			debug_object_disable("selftest");
  1326		return res;
  1327	}
  1328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
