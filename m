Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F0524888E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132435; cv=none; b=c/odMn21Wvlhm1WRCZiDukCei3l0/HVD905sqAvnMtX+t+6pwofz1BFU/IXwWE7HZ4fgFeKWglj1JS/z1PV3KEMjCu9UG3552j7XdyKDsMJkWIQW6a2F3j4IigWw2k9ivuqcq/DJ3ThaWBmGRFu8Ed2jgy/pnghcokPcn/VQEWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132435; c=relaxed/simple;
	bh=5KBZAGopcZFrtebBVfGMvjyC1ybiX32b4eYi9FWN4vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQDUCN5Bj93AfkOlysQWwn3zG5tT5IOT8xa4ImMtEcj2FxQeG2+phQb0tnu7g9rBDmsBkzmAAZp5NKyFt61XaZXVUUZhtWc3IvtYPZqIqFbjX4HKfP4uMFOwmO0vEjSht3mE77Xu4ZjQVd8blQpsramLtL7dBhv9bD7fuuo+35Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE62168F;
	Tue, 13 May 2025 03:33:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE5CB3F5A1;
	Tue, 13 May 2025 03:33:44 -0700 (PDT)
Date: Tue, 13 May 2025 11:33:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <20250513103340.GB26114@e132581.arm.com>
References: <20250324191740.64964-1-yeoreum.yun@arm.com>
 <20250325151803.GD604566@e132581.arm.com>
 <Z+OuATAe31GbcKZ2@e129823.arm.com>
 <20250428162214.GG551819@e132581.arm.com>
 <aBSfqU9ssymM/yC5@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBSfqU9ssymM/yC5@e129823.arm.com>

Hi Levi,

On Fri, May 02, 2025 at 11:34:17AM +0100, Yeoreum Yun wrote:

[...]

> > > > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > > > @@ -1020,6 +1020,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
> > > > >  	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
> > > > >
> > > > >  	raw_spin_unlock(&drvdata->spinlock);
> > > > > +
> > > > > +	cscfg_csdev_disable_active_config(csdev);
> > > > > +
> > > >
> > > > In general, we need to split changes into several patches if each
> > > > addresses a different issue.  From my understanding, the change above is
> > > > to fix missing to disable config when disable Sysfs mode.
> > > >
> > > > If so, could we use a seperate patch for this change?
> > > >
> > >
> > > It's not a differnt issue. Without this line, the active count wouldn't
> > > decrese and it raise another issue -- unloadable moudle for active_cnt :(
> > > So I think it should be included in this patch.
> >
> > I read the code again and concluded the change above is not related to
> > locking and would be a separate issue: when we close a Sysfs session,
> > we need to disable a config on a CoreSight device.
> > Could you clarify what is meaning "unloadable moudle for active_cnt"?
> > I only saw "cscfg_mgr->sys_active_cnt" is used for module unloading,
> > but have no clue why "active_cnt" impacts module unloading.
> 
> Yes. but it also related "by this patch".
> When the load config and "activate" configuration via sysfs,
> not only the cscfg_mgr->sys_active_cnt is increase but also
> "individual cscfg->active_cnt".
> This patch extends the meaning of "cscfg->active_cnt" includes
> "enable of configuraiton". so that cscfg_config_desc_put() prevent
> decrease "module reference" while holding individual active_cnt.
> That's why without this change, the "module reference" couldn't be
> decreased. The problem before this change is deactivation doesn't
> chekc cscfg->active_cnt but put module reference whenever it calls.

Thanks for explanation and it makes sense to me.

As we discussed, given this patch is relative big, let us divide into
three small patches for easier review.

- The first patch is to address that the sysfs interface misses to
  call cscfg_csdev_disable_active_config() for disabling config.

- The second patch fixes the locking issue for "config_csdev_list".
  As the "config_csdev_list" is protected by cscfg_csdev_lock, the
  cscfg_remove_owned_csdev_configs() function should use lock for
  exclusive operations.

- The third patch is to fix reference counter of a config module.
  The patch adds cscfg_config_desc_get() and cscfg_config_desc_put()
  in the config enabling / disabling flow for acquiring module
  reference counter.

Thanks,
Leo
