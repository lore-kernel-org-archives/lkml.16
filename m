Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA242224AED
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214115; cv=none; b=rXnRdYtZ1wjV5ZRlOpgmO9rLlko/brOIzhive5QGQs/8M1PkP3hQqte8kYCW/21YqH2TjnnwAWjopiKS35NAwCZ80c3Gz4clbSK5n+xKcLXozPrU4zo3QD7mmp5OJqhu8vuxYQ07mNj46oQvbNuEZzlKNJM+F9ZYrrO4lEtWTI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214115; c=relaxed/simple;
	bh=kxxTgdmGJNsrlf4IcgzT3n0S5zAAcuol3ADDvF6vPOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0gRDL4Y2dudpYuamkFaHXJAfgU9tHzt25fwDMxBzn8C/CUzjyEJbT4d1PS7PRWSQMitNv4dgsBc4VpXD2oteBDm8yItaH9TIQ+MTr+KljQ6vQ2C9nXkkE8dDWjPEQXShCy/Dyoxfmtvz9PNRzfRTe/k80JiK/V10krRnyBV+wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 109D715A1;
	Wed, 14 May 2025 02:15:01 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCB213F5A1;
	Wed, 14 May 2025 02:15:11 -0700 (PDT)
Date: Wed, 14 May 2025 10:15:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] coresight: holding cscfg_csdev_lock while
 removing cscfg from csdev
Message-ID: <20250514091509.GD26114@e132581.arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
 <20250513170622.3071637-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513170622.3071637-3-yeoreum.yun@arm.com>

On Tue, May 13, 2025 at 06:06:21PM +0100, Yeoreum Yun wrote:
> There'll be possible race scenario for coresight config:
> 
> CPU0                                          CPU1
> (perf enable)                                 load module
>                                               cscfg_load_config_sets()
>                                               activate config. // sysfs
>                                               (sys_active_cnt == 1)
> ...
> cscfg_csdev_enable_active_config()
>   lock(csdev->cscfg_csdev_lock)
>                                               deactivate config // sysfs
>                                               (sys_activec_cnt == 0)
>                                               cscfg_unload_config_sets()
>   <iterating config_csdev_list>               cscfg_remove_owned_csdev_configs()
>   // here load config activate by CPU1
>   unlock(csdev->cscfg_csdev_lock)
> 
> iterating config_csdev_list could be raced with config_csdev_list's
> entry delete.
> 
> To resolve this race , hold csdev->cscfg_csdev_lock() while
> cscfg_remove_owned_csdev_configs()
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Fixes: 02bd588e12df ("coresight: configuration: Update API to permit dynamic load/unload")
> ---
>  drivers/hwtracing/coresight/coresight-syscfg.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index a70c1454b410..5d194b9269f5 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
>  static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
>  {
>  	struct cscfg_config_csdev *config_csdev, *tmp;
> +	unsigned long flags;
>  
>  	if (list_empty(&csdev->config_csdev_list))
>  		return;
>  
> +	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);

Could we use the format:

   guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);

Sorry I did not mention this in the earlier review.  Otherwise:

Reviewed-by: Leo Yan <leo.yan@arm.com>

>  	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
>  		if (config_csdev->config_desc->load_owner == load_owner)
>  			list_del(&config_csdev->node);
>  	}
> +	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);


>  }
>  
>  static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 
