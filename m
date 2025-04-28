Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED491FF60A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857342; cv=none; b=gykPh2PZmZvsnlrYNhQiCtdYFr6h0KfNY0OmhFNijRh3a3Pa/Cd4gzTqfE4txkw/fTAnPLxsoxNnqGXUyKpJHV/+XGDeq7y9nQ8pDI6h7Z2EZLlSRKoDgSfLucf1m2r+6sriLX00Mq0k7M6XQfiuHPzDbz199ZIQBrH1n9lcgyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857342; c=relaxed/simple;
	bh=FIJXx2gCEHGBvPacIp3M6Xrashazp6M6jGAoWWtkKGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVoOdiIRaiwNdMKTO3y+FZ0KXHQ+tXTeYrw+5LXXUFqKCWbfts2oDmXqMXGxyVr4KjzO+ClPAmDtSbHCQoXcY9bMCpcnsKZsai1p94x7IaSGb8MpMbnrmhnUEOucMAA27UaxCM7fV6h3rqdsLXYI4Ct+vQ3vHMWo8kEkKvwcjZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9F11516;
	Mon, 28 Apr 2025 09:22:13 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 370683F66E;
	Mon, 28 Apr 2025 09:22:19 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:22:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <20250428162214.GG551819@e132581.arm.com>
References: <20250324191740.64964-1-yeoreum.yun@arm.com>
 <20250325151803.GD604566@e132581.arm.com>
 <Z+OuATAe31GbcKZ2@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+OuATAe31GbcKZ2@e129823.arm.com>

Hi Levi,

On Wed, Mar 26, 2025 at 07:34:25AM +0000, Yeoreum Yun wrote:

[...]

> > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> > >  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> > >
> > >  	raw_spin_unlock(&drvdata->spinlock);
> > > +
> > > +	cscfg_csdev_disable_active_config(csdev);
> > > +
> >
> > In general, we need to split changes into several patches if each
> > addresses a different issue.  From my understanding, the change above is
> > to fix missing to disable config when disable Sysfs mode.
> >
> > If so, could we use a seperate patch for this change?
> >
> 
> It's not a differnt issue. Without this line, the active count wouldn't
> decrese and it raise another issue -- unloadable moudle for active_cnt :(
> So I think it should be included in this patch.

I read the code again and concluded the change above is not related to
locking and would be a separate issue: when we close a Sysfs session,
we need to disable a config on a CoreSight device.

Could you clarify what is meaning "unloadable moudle for active_cnt"?
I only saw "cscfg_mgr->sys_active_cnt" is used for module unloading,
but have no clue why "active_cnt" impacts module unloading.

> > >  	cpus_read_unlock();
> > >
> > >  	/*
> > > diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > index a70c1454b410..6d8c212ad434 100644
> > > --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> > > +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> > > @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
> > >  static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
> > >  {
> > >  	struct cscfg_config_csdev *config_csdev, *tmp;
> > > +	unsigned long flags;
> > >
> > >  	if (list_empty(&csdev->config_csdev_list))
> > >  		return;
> > >
> > > +	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> >
> > I think we should use spinlock to guard the condition checking
> > list_empty().
> >
> > Here the race condition is the 'config_csdev_list' list and
> > configurations on the list.  For atomicity, we should use lock to
> > protect any operations on the list (read, add, delete, etc).
> 
> Interesting... Would you let me know which race it is?
> here to check list_empty(), it already guarded with "cscfg_mutex".

Thanks for pointing out this.  I read the code and understood that in
some scenarios the list is protected by the mutex "cscfg_mutex".

I would argue for using locking, we need to make clear for two thigns:

- What is the race condition;
- What locking is used to protect the race condition.

For current case, a CoreSight device has a config list, the race
condition is the config list will be manipulated by multiple places
(e.g., for module loading / unloading, opening or closing a perf or
SysFS session).  So a spinlock is used to to protect the config list.

"cscfg_mutex" is a high level lock, my understanding is to protect the
high level operations from the Sysfs knobs, though sometimes it can
mitigate the race condition on configuration list mentioned above, but
the spinlock is the locking mechanism for the low level's config list
on a CoreSight device.

> However list_del() is special case because iterating config_csdev_list
> can be done without cscfg_mutex -- see
> cscfg_csdev_enable_active_config().
> This gurad with spinlock purpose to guard race unloading and
> get the config in cscfg_csdev_enable_active_config()
> (Please see my response below...).
> 
> the emptiness of config_csdev_list is guarded with cscfg_mutex.
> therefore, It seems enough to guard iterating part with spinlock :)

Mixed using cscfg_mutex and spinlock get code complexity, and I am a bit
concerned this is not best practice.

At a glance, I would say 'cscfg_mutex' is purposed to protect the global
'cscfg_mgr', per CoreSight device's config list should be protected by
'cscfg_csdev_lock'.

> > A side topic, as here it adds locks for protecting 'config_csdev_list',
> > I am wandering why we do not do the same thing for
> > 'feature_csdev_list' (See cscfg_remove_owned_csdev_features() and
> > cscfg_get_feat_csdev()).
> 
> In case of feature, It's okay since it couldn't be accessed when it
> gets failed to get related config.

I looked at cscfg_load_feat_csdev(), it uses 'cscfg_csdev_lock' to
protect the feature list.  This is why I thought the feature list also
need to be protected by the lock.  Now it is only partially protected.

> When we see cscfg_csdev_enable_active_config(), the config could be
> accessed without cscfg_mutex lock. so the config need to be guarded with
> spin_lock otherwise it could be acquired while unload module
> (after get active_cnt in search logic cscfg_csdev_enable_active_config()
> and other running unloading process)

To make things more clear, I have a questions.

'cscfg_mgr->sys_active_cnt' is used in the cscfg_unload_config_sets()
function to decide if can unload module, if any configuration is
active, why this variable cannot prevent unloading module?

Sorry for late replying.

Leo

> But feature list is depends on config, If config is safe from
> load/unload, this is not an issue so we don't need it.
> 
> Thanks for your review!
