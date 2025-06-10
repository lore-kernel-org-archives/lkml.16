Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB66B28DF3D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559693; cv=none; b=jR5XrZwwXquwAC8gHqdJSMZngfeOEVoGRFFeXc6AXOw3RSxgbY2+IIpnLlrzgdVgELV7nycEz1rHFRKlN+bzwqLFl1lA7+hj0CLICL5VxSNtVL5ZCicVsMH7wX/KPJIbgCBt7flSRZM/ltOg0DBJ6I4yOhb39xGKhi36Bp51Gc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559693; c=relaxed/simple;
	bh=CQyg78Qds92jFpTV0etojONguvbST9WWDToRUjZPbho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bFkUOF3Qy1YZKBPyTCbnCB3ymdNOcKo6vstYe0cKYfUjwsaQYx/RQEI4Ob9zhoBUZT/aWC1vOtrEBehRXTepLWH6iQYBVxCBfCDpBvCTmi0iaGSB9EnBiPJhTHmx5dX2xPpkPY0C3EyO8FomcnnhlWzhJ5hl7aPOYqNx0+xdrrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMP7lmrK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMP7lmrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749559691; x=1781095691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQyg78Qds92jFpTV0etojONguvbST9WWDToRUjZPbho=;
  b=LMP7lmrKeSwAfA22NRH0WFyJxxqdp6nujdwJp4LgUJyDNLT9celzJ4cM
   lP7bEHELlgJYjgJVJ09b9/mSe0FsbU13I0WBEnzF8gj6ItlWNSN+Y396M
   eTByioMiIFvtkxpmVmzCHinF2Pf9V1UEJcfCPWxPWKaVCKFcJ9ePrNH6B
   OAtGCFA4F83JpQ18QyNzhQf52rcxQ+gpgYVrHe+Vm8oAlo5moOqdsLhKx
   6bTkIBI87RPY8B3icyyWz9x6iOjhmpAt5os9vjP80THFbIUhzL60HBh5k
   ZvTXH5VrioYKmny9zh19LSWCe3ZmpT0MHwWrWFcoEEWC9RyRKNjIJYPI6
   Q==;
X-CSE-ConnectionGUID: SxQBdrlDQgmS5Jv/pEyVOA==
X-CSE-MsgGUID: z1u7O0aETV+o06s/lEuSaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51577726"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51577726"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:48:10 -0700
X-CSE-ConnectionGUID: UE1WMwO5Stidr6XAa6mzsA==
X-CSE-MsgGUID: 6Z14DMBaShONx/UqpEFyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="147339589"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jun 2025 05:48:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOyOc-0008Dx-11;
	Tue, 10 Jun 2025 12:48:06 +0000
Date: Tue, 10 Jun 2025 20:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/thermal/thermal_debugfs.c:252:59: warning: '%d' directive
 output may be truncated writing between 1 and 5 bytes into a region of size
 between 3 and 8
Message-ID: <202506102037.N7IGnA5z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 755113d7678681a137c330f7997ceb680adb644e thermal/debugfs: Add thermal cooling device debugfs information
date:   1 year, 5 months ago
config: csky-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250610/202506102037.N7IGnA5z-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506102037.N7IGnA5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506102037.N7IGnA5z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/thermal_debugfs.c:103:6: warning: no previous prototype for 'thermal_debug_init' [-Wmissing-prototypes]
     103 | void thermal_debug_init(void)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:329:6: warning: no previous prototype for 'thermal_debug_cdev_state_update' [-Wmissing-prototypes]
     329 | void thermal_debug_cdev_state_update(const struct thermal_cooling_device *cdev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:389:6: warning: no previous prototype for 'thermal_debug_cdev_add' [-Wmissing-prototypes]
     389 | void thermal_debug_cdev_add(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c:431:6: warning: no previous prototype for 'thermal_debug_cdev_remove' [-Wmissing-prototypes]
     431 | void thermal_debug_cdev_remove(struct thermal_cooling_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_debugfs.c: In function 'cdev_tt_seq_show':
>> drivers/thermal/thermal_debugfs.c:252:59: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 8 [-Wformat-truncation=]
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                                                           ^~
   drivers/thermal/thermal_debugfs.c:252:54: note: directive argument in the range [0, 65535]
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                                                      ^~~~~~~~
   drivers/thermal/thermal_debugfs.c:252:17: note: 'snprintf' output between 5 and 14 bytes into a destination of size 11
     252 |                 snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     253 |                          entry->id >> 16, entry->id & 0xFFFF);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +252 drivers/thermal/thermal_debugfs.c

   233	
   234	static int cdev_tt_seq_show(struct seq_file *s, void *v)
   235	{
   236		struct thermal_debugfs *thermal_dbg = s->private;
   237		struct cdev_debugfs *cdev_dbg = &thermal_dbg->cdev_dbg;
   238		struct list_head *transitions = cdev_dbg->transitions;
   239		struct cdev_record *entry;
   240		int i = *(loff_t *)v;
   241	
   242		if (!i)
   243			seq_puts(s, "Transition\tOccurences\n");
   244	
   245		list_for_each_entry(entry, &transitions[i], node) {
   246			/*
   247			 * Assuming maximum cdev states is 1024, the longer
   248			 * string for a transition would be "1024->1024\0"
   249			 */
   250			char buffer[11];
   251	
 > 252			snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
   253				 entry->id >> 16, entry->id & 0xFFFF);
   254	
   255			seq_printf(s, "%-10s\t%-10llu\n", buffer, entry->count);
   256		}
   257	
   258		return 0;
   259	}
   260	
   261	static const struct seq_operations tt_sops = {
   262		.start = cdev_seq_start,
   263		.next = cdev_seq_next,
   264		.stop = cdev_seq_stop,
   265		.show = cdev_tt_seq_show,
   266	};
   267	
   268	DEFINE_SEQ_ATTRIBUTE(tt);
   269	
   270	static int cdev_dt_seq_show(struct seq_file *s, void *v)
   271	{
   272		struct thermal_debugfs *thermal_dbg = s->private;
   273		struct cdev_debugfs *cdev_dbg = &thermal_dbg->cdev_dbg;
   274		struct list_head *durations = cdev_dbg->durations;
   275		struct cdev_record *entry;
   276		int i = *(loff_t *)v;
   277	
   278		if (!i)
   279			seq_puts(s, "State\tResidency\n");
   280	
   281		list_for_each_entry(entry, &durations[i], node) {
   282			s64 duration = ktime_to_ms(entry->residency);
   283	
   284			if (entry->id == cdev_dbg->current_state)
   285				duration += ktime_ms_delta(ktime_get(),
   286							   cdev_dbg->timestamp);
   287	
   288			seq_printf(s, "%-5d\t%-10llu\n", entry->id, duration);
   289		}
   290	
   291		return 0;
   292	}
   293	
   294	static const struct seq_operations dt_sops = {
   295		.start = cdev_seq_start,
   296		.next = cdev_seq_next,
   297		.stop = cdev_seq_stop,
   298		.show = cdev_dt_seq_show,
   299	};
   300	
   301	DEFINE_SEQ_ATTRIBUTE(dt);
   302	
   303	static int cdev_clear_set(void *data, u64 val)
   304	{
   305		struct thermal_debugfs *thermal_dbg = data;
   306	
   307		if (!val)
   308			return -EINVAL;
   309	
   310		mutex_lock(&thermal_dbg->lock);
   311	
   312		thermal_debugfs_cdev_clear(&thermal_dbg->cdev_dbg);
   313	
   314		mutex_unlock(&thermal_dbg->lock);
   315	
   316		return 0;
   317	}
   318	
   319	DEFINE_DEBUGFS_ATTRIBUTE(cdev_clear_fops, NULL, cdev_clear_set, "%llu\n");
   320	
   321	/**
   322	 * thermal_debug_cdev_state_update - Update a cooling device state change
   323	 *
   324	 * Computes a transition and the duration of the previous state residency.
   325	 *
   326	 * @cdev : a pointer to a cooling device
   327	 * @new_state: an integer corresponding to the new cooling device state
   328	 */
   329	void thermal_debug_cdev_state_update(const struct thermal_cooling_device *cdev,
   330					     int new_state)
   331	{
   332		struct thermal_debugfs *thermal_dbg = cdev->debugfs;
   333		struct cdev_debugfs *cdev_dbg;
   334		struct cdev_record *cdev_record;
   335		int transition, old_state;
   336	
   337		if (!thermal_dbg || (thermal_dbg->cdev_dbg.current_state == new_state))
   338			return;
   339	
   340		mutex_lock(&thermal_dbg->lock);
   341	
   342		cdev_dbg = &thermal_dbg->cdev_dbg;
   343	
   344		old_state = cdev_dbg->current_state;
   345	
   346		/*
   347		 * Get the old state information in the durations list. If
   348		 * this one does not exist, a new allocated one will be
   349		 * returned. Recompute the total duration in the old state and
   350		 * get a new timestamp for the new state.
   351		 */
   352		cdev_record = thermal_debugfs_cdev_record_get(thermal_dbg,
   353							      cdev_dbg->durations,
   354							      old_state);
   355		if (cdev_record) {
   356			ktime_t now = ktime_get();
   357			ktime_t delta = ktime_sub(now, cdev_dbg->timestamp);
   358			cdev_record->residency = ktime_add(cdev_record->residency, delta);
   359			cdev_dbg->timestamp = now;
   360		}
   361	
   362		cdev_dbg->current_state = new_state;
   363		transition = (old_state << 16) | new_state;
   364	
   365		/*
   366		 * Get the transition in the transitions list. If this one
   367		 * does not exist, a new allocated one will be returned.
   368		 * Increment the occurrence of this transition which is stored
   369		 * in the value field.
   370		 */
   371		cdev_record = thermal_debugfs_cdev_record_get(thermal_dbg,
   372							      cdev_dbg->transitions,
   373							      transition);
   374		if (cdev_record)
   375			cdev_record->count++;
   376	
   377		cdev_dbg->total++;
   378	
   379		mutex_unlock(&thermal_dbg->lock);
   380	}
   381	
   382	/**
   383	 * thermal_debug_cdev_add - Add a cooling device debugfs entry
   384	 *
   385	 * Allocates a cooling device object for debug, initializes the
   386	 * statistics and create the entries in sysfs.
   387	 * @cdev: a pointer to a cooling device
   388	 */
 > 389	void thermal_debug_cdev_add(struct thermal_cooling_device *cdev)
   390	{
   391		struct thermal_debugfs *thermal_dbg;
   392		struct cdev_debugfs *cdev_dbg;
   393		int i;
   394	
   395		thermal_dbg = thermal_debugfs_add_id(d_cdev, cdev->id);
   396		if (!thermal_dbg)
   397			return;
   398	
   399		cdev_dbg = &thermal_dbg->cdev_dbg;
   400	
   401		for (i = 0; i < CDEVSTATS_HASH_SIZE; i++) {
   402			INIT_LIST_HEAD(&cdev_dbg->transitions[i]);
   403			INIT_LIST_HEAD(&cdev_dbg->durations[i]);
   404		}
   405	
   406		cdev_dbg->current_state = 0;
   407		cdev_dbg->timestamp = ktime_get();
   408	
   409		debugfs_create_file("trans_table", 0400, thermal_dbg->d_top,
   410				    thermal_dbg, &tt_fops);
   411	
   412		debugfs_create_file("time_in_state_ms", 0400, thermal_dbg->d_top,
   413				    thermal_dbg, &dt_fops);
   414	
   415		debugfs_create_file("clear", 0200, thermal_dbg->d_top,
   416				    thermal_dbg, &cdev_clear_fops);
   417	
   418		debugfs_create_u32("total_trans", 0400, thermal_dbg->d_top,
   419				   &cdev_dbg->total);
   420	
   421		cdev->debugfs = thermal_dbg;
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
