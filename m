Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB24C6D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743034990; cv=none; b=As/CsqNIPpLMHsO21nqmSTOh4h1AtYlxX5g940QmhzIabYKGn9RvxRqBp7Q+oOnTVEwZB+Zc7oRAUxo7D0ZgMCxbposLSXSRFIm08SaIncfJvyK7hFlP6vkFGz9Szxx3ha1oygaY4OhUEaKAX6/BZdIuB3YpTv8kCpShwJqrXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743034990; c=relaxed/simple;
	bh=Y3ezlGK6zuVO6F9g7ngr8WO+h+p2yG0zmR7WyzpdQWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h/EtyjmqF8TcITewpjLUi2EAgT3B4EzJgSA/8siiJKm6mRG5VH9dbPbqtkMKYcqyvxn37y/2yT/jIJLVwVeGVJFTt6Vgr2xeP2QC4hsE2Ko42Kw2AQF9icaSLehkXbognP5LWOD3/Lt9xHtJoQnrPHMPGlP8Tw8J+yst3trDb1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msB+0MdE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msB+0MdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743034988; x=1774570988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3ezlGK6zuVO6F9g7ngr8WO+h+p2yG0zmR7WyzpdQWY=;
  b=msB+0MdEiXWFmsEaul0yIurmt+toSDFTST8F5VgKzPHTV0vOk1SlVu4d
   4Pr5zoKIVe9xnYy2mj1hB/W1Ji/l1XY47Gn9+UR7SiZ/uO0HLg35y1xci
   UOmuzjv4gqFLFouJdzGPdnTfzgfJbLLBfrY+VZNrgoY6YNL/1d00JlC3W
   20Uu8TjF+nhfjZn0/XTKq38sOOzh2MsfsiRSDJSB1Lby27sxQazjPUoVI
   dByKCjgXNga+gwSqQaCj/74M6ZaO91aTSDf9qUp6KUI5ClyYlLgbyW19r
   Yx+cIlLj/42Zve/pRfTsOSDZm9g7pUQ8QzY8AxzS38pYl9nRiAKXRntYY
   A==;
X-CSE-ConnectionGUID: T/aszaObS7OakKpRNfKrjA==
X-CSE-MsgGUID: NoiP5qooRs6l8A7QeJOQxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44266745"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="44266745"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 17:23:08 -0700
X-CSE-ConnectionGUID: jL+y0nQCQZuFmk9WadAfGg==
X-CSE-MsgGUID: Fho/PEzXSOCNrLEvIXdN/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="155868562"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2025 17:23:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txb1N-0006Dv-21;
	Thu, 27 Mar 2025 00:22:58 +0000
Date: Thu, 27 Mar 2025 08:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Muminul Islam <muislam@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: drivers/hv/mshv_eventfd.c:493:16: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202503270801.W4bHMSyJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f6e0150b2003fb2b9265028a618aa1732b3edc8f
commit: 621191d709b14882270dfd8ea5d7d6cdfebe2c35 Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
date:   5 days ago
config: x86_64-randconfig-123-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270801.W4bHMSyJ-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270801.W4bHMSyJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270801.W4bHMSyJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hv/mshv_eventfd.c:493:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int events @@     got restricted __poll_t @@
   drivers/hv/mshv_eventfd.c:493:16: sparse:     expected unsigned int events
   drivers/hv/mshv_eventfd.c:493:16: sparse:     got restricted __poll_t
--
>> drivers/hv/mshv_root_main.c:1341:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void const * @@
   drivers/hv/mshv_root_main.c:1341:14: sparse:     expected void const [noderef] __user *ptr
   drivers/hv/mshv_root_main.c:1341:14: sparse:     got void const *
>> drivers/hv/mshv_root_main.c:2192:23: sparse: sparse: symbol 'mshv_reboot_nb' was not declared. Should it be static?

vim +493 drivers/hv/mshv_eventfd.c

   373	
   374	static int mshv_irqfd_assign(struct mshv_partition *pt,
   375				     struct mshv_user_irqfd *args)
   376	{
   377		struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
   378		struct mshv_irqfd *irqfd, *tmp;
   379		unsigned int events;
   380		struct fd f;
   381		int ret;
   382		int idx;
   383	
   384		irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL);
   385		if (!irqfd)
   386			return -ENOMEM;
   387	
   388		irqfd->irqfd_partn = pt;
   389		irqfd->irqfd_irqnum = args->gsi;
   390		INIT_WORK(&irqfd->irqfd_shutdown, mshv_irqfd_shutdown);
   391		seqcount_spinlock_init(&irqfd->irqfd_irqe_sc, &pt->pt_irqfds_lock);
   392	
   393		f = fdget(args->fd);
   394		if (!fd_file(f)) {
   395			ret = -EBADF;
   396			goto out;
   397		}
   398	
   399		eventfd = eventfd_ctx_fileget(fd_file(f));
   400		if (IS_ERR(eventfd)) {
   401			ret = PTR_ERR(eventfd);
   402			goto fail;
   403		}
   404	
   405		irqfd->irqfd_eventfd_ctx = eventfd;
   406	
   407		if (args->flags & BIT(MSHV_IRQFD_BIT_RESAMPLE)) {
   408			struct mshv_irqfd_resampler *rp;
   409	
   410			resamplefd = eventfd_ctx_fdget(args->resamplefd);
   411			if (IS_ERR(resamplefd)) {
   412				ret = PTR_ERR(resamplefd);
   413				goto fail;
   414			}
   415	
   416			irqfd->irqfd_resamplefd = resamplefd;
   417	
   418			mutex_lock(&pt->irqfds_resampler_lock);
   419	
   420			hlist_for_each_entry(rp, &pt->irqfds_resampler_list,
   421					     rsmplr_hnode) {
   422				if (rp->rsmplr_notifier.irq_ack_gsi ==
   423								 irqfd->irqfd_irqnum) {
   424					irqfd->irqfd_resampler = rp;
   425					break;
   426				}
   427			}
   428	
   429			if (!irqfd->irqfd_resampler) {
   430				rp = kzalloc(sizeof(*rp), GFP_KERNEL_ACCOUNT);
   431				if (!rp) {
   432					ret = -ENOMEM;
   433					mutex_unlock(&pt->irqfds_resampler_lock);
   434					goto fail;
   435				}
   436	
   437				rp->rsmplr_partn = pt;
   438				INIT_HLIST_HEAD(&rp->rsmplr_irqfd_list);
   439				rp->rsmplr_notifier.irq_ack_gsi = irqfd->irqfd_irqnum;
   440				rp->rsmplr_notifier.irq_acked =
   441							      mshv_irqfd_resampler_ack;
   442	
   443				hlist_add_head(&rp->rsmplr_hnode,
   444					       &pt->irqfds_resampler_list);
   445				mshv_register_irq_ack_notifier(pt,
   446							       &rp->rsmplr_notifier);
   447				irqfd->irqfd_resampler = rp;
   448			}
   449	
   450			hlist_add_head_rcu(&irqfd->irqfd_resampler_hnode,
   451					   &irqfd->irqfd_resampler->rsmplr_irqfd_list);
   452	
   453			mutex_unlock(&pt->irqfds_resampler_lock);
   454		}
   455	
   456		/*
   457		 * Install our own custom wake-up handling so we are notified via
   458		 * a callback whenever someone signals the underlying eventfd
   459		 */
   460		init_waitqueue_func_entry(&irqfd->irqfd_wait, mshv_irqfd_wakeup);
   461		init_poll_funcptr(&irqfd->irqfd_polltbl, mshv_irqfd_queue_proc);
   462	
   463		spin_lock_irq(&pt->pt_irqfds_lock);
   464		if (args->flags & BIT(MSHV_IRQFD_BIT_RESAMPLE) &&
   465		    !irqfd->irqfd_lapic_irq.lapic_control.level_triggered) {
   466			/*
   467			 * Resample Fd must be for level triggered interrupt
   468			 * Otherwise return with failure
   469			 */
   470			spin_unlock_irq(&pt->pt_irqfds_lock);
   471			ret = -EINVAL;
   472			goto fail;
   473		}
   474		ret = 0;
   475		hlist_for_each_entry(tmp, &pt->pt_irqfds_list, irqfd_hnode) {
   476			if (irqfd->irqfd_eventfd_ctx != tmp->irqfd_eventfd_ctx)
   477				continue;
   478			/* This fd is used for another irq already. */
   479			ret = -EBUSY;
   480			spin_unlock_irq(&pt->pt_irqfds_lock);
   481			goto fail;
   482		}
   483	
   484		idx = srcu_read_lock(&pt->pt_irq_srcu);
   485		mshv_irqfd_update(pt, irqfd);
   486		hlist_add_head(&irqfd->irqfd_hnode, &pt->pt_irqfds_list);
   487		spin_unlock_irq(&pt->pt_irqfds_lock);
   488	
   489		/*
   490		 * Check if there was an event already pending on the eventfd
   491		 * before we registered, and trigger it as if we didn't miss it.
   492		 */
 > 493		events = vfs_poll(fd_file(f), &irqfd->irqfd_polltbl);
   494	
   495		if (events & POLLIN)
   496			mshv_assert_irq_slow(irqfd);
   497	
   498		srcu_read_unlock(&pt->pt_irq_srcu, idx);
   499		/*
   500		 * do not drop the file until the irqfd is fully initialized, otherwise
   501		 * we might race against the POLLHUP
   502		 */
   503		fdput(f);
   504	
   505		return 0;
   506	
   507	fail:
   508		if (irqfd->irqfd_resampler)
   509			mshv_irqfd_resampler_shutdown(irqfd);
   510	
   511		if (resamplefd && !IS_ERR(resamplefd))
   512			eventfd_ctx_put(resamplefd);
   513	
   514		if (eventfd && !IS_ERR(eventfd))
   515			eventfd_ctx_put(eventfd);
   516	
   517		fdput(f);
   518	
   519	out:
   520		kfree(irqfd);
   521		return ret;
   522	}
   523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
