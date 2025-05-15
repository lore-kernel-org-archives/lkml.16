Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECBC2063F3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296267; cv=none; b=KVaD95wVRbQgSa/0axduUjFRQca3UTUUaMffv6UiCAVTVihODSAfgPUrMlirvRoNt4iyjWGHTpq6ss4XsCkvOa9NW1gtx9a84W/COTRysf+dLBltUfsDJco2j95d39wDF3uhUK/DMlQFGDCkM9JKxzGri0F04sNVsnP6BFJYDRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296267; c=relaxed/simple;
	bh=2tLlNfEtxEHQxa7jEbsw6A5HqqJrIe+CYDIn9siiqKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiSdlNVZmBcgB0jojRe3u8fWnLUVM6yxVQ/0Fa5ED6ZIs+jznxiszB2prAjLhLEGifhXCTGWuLpvaAPDf+1pSQO6Li/laCFcXzzWqoScsJKZ8v7qi1YBdQzBZDYgrPmAPNkfTZrkzQUGTlV3NHK8+sAGrb3DDarI0QZD56NwTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3D314BF;
	Thu, 15 May 2025 01:04:12 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E9C3F673;
	Thu, 15 May 2025 01:04:23 -0700 (PDT)
Date: Thu, 15 May 2025 09:04:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] coresight: prevent deactivate active config while
 enabling the config
Message-ID: <20250515080421.GB412060@e132581.arm.com>
References: <20250514161951.3427590-1-yeoreum.yun@arm.com>
 <20250514161951.3427590-4-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514161951.3427590-4-yeoreum.yun@arm.com>

On Wed, May 14, 2025 at 05:19:51PM +0100, Yeoreum Yun wrote:
> While enable active config via cscfg_csdev_enable_active_config(),
> active config could be deactivated via configfs' sysfs interface.
> This could make UAF issue in below scenario:
> 
> CPU0                                          CPU1
> (sysfs enable)                                load module
>                                               cscfg_load_config_sets()
>                                               activate config. // sysfs
>                                               (sys_active_cnt == 1)
> ...
> cscfg_csdev_enable_active_config()
> lock(csdev->cscfg_csdev_lock)
> // here load config activate by CPU1
> unlock(csdev->cscfg_csdev_lock)
> 
>                                               deactivate config // sysfs
>                                               (sys_activec_cnt == 0)
>                                               cscfg_unload_config_sets()
>                                               unload module
> 
> // access to config_desc which freed
> // while unloading module.
> cscfg_csdev_enable_config
> 
> To address this, use cscfg_config_desc's active_cnt as a reference count
>  which will be holded when
>     - activate the config.
>     - enable the activated config.
> and put the module reference when config_active_cnt == 0.
> 
> Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable configurations")
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  .../hwtracing/coresight/coresight-config.h    |  2 +-
>  .../hwtracing/coresight/coresight-syscfg.c    | 49 +++++++++++++------
>  2 files changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index b9ebc9fcfb7f..90fd937d3bd8 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -228,7 +228,7 @@ struct cscfg_feature_csdev {
>   * @feats_csdev:references to the device features to enable.
>   */
>  struct cscfg_config_csdev {
> -	const struct cscfg_config_desc *config_desc;
> +	struct cscfg_config_desc *config_desc;
>  	struct coresight_device *csdev;
>  	bool enabled;
>  	struct list_head node;
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 23017612f2ea..83dad24e0116 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -869,6 +869,25 @@ void cscfg_csdev_reset_feats(struct coresight_device *csdev)
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
>  
> +static bool cscfg_config_desc_get(struct cscfg_config_desc *config_desc)
> +{
> +	if (!atomic_fetch_inc(&config_desc->active_cnt)) {
> +		/* must ensure that config cannot be unloaded in use */
> +		if (unlikely(cscfg_owner_get(config_desc->load_owner))) {
> +			atomic_dec(&config_desc->active_cnt);
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +static void cscfg_config_desc_put(struct cscfg_config_desc *config_desc)
> +{
> +	if (!atomic_dec_return(&config_desc->active_cnt))
> +		cscfg_owner_put(config_desc->load_owner);
> +}
> +
>  /*
>   * This activate configuration for either perf or sysfs. Perf can have multiple
>   * active configs, selected per event, sysfs is limited to one.
> @@ -892,22 +911,17 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
>  			if (config_desc->available == false)
>  				return -EBUSY;
>  
> -			/* must ensure that config cannot be unloaded in use */
> -			err = cscfg_owner_get(config_desc->load_owner);
> -			if (err)
> +			if (!cscfg_config_desc_get(config_desc)) {
> +				err = -EINVAL;
>  				break;
> +			}
> +
>  			/*
>  			 * increment the global active count - control changes to
>  			 * active configurations
>  			 */
>  			atomic_inc(&cscfg_mgr->sys_active_cnt);
>  
> -			/*
> -			 * mark the descriptor as active so enable config on a
> -			 * device instance will use it
> -			 */
> -			atomic_inc(&config_desc->active_cnt);
> -
>  			err = 0;
>  			dev_dbg(cscfg_device(), "Activate config %s.\n", config_desc->name);
>  			break;
> @@ -922,9 +936,8 @@ static void _cscfg_deactivate_config(unsigned long cfg_hash)
>  
>  	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
>  		if ((unsigned long)config_desc->event_ea->var == cfg_hash) {
> -			atomic_dec(&config_desc->active_cnt);
>  			atomic_dec(&cscfg_mgr->sys_active_cnt);
> -			cscfg_owner_put(config_desc->load_owner);
> +			cscfg_config_desc_put(config_desc);
>  			dev_dbg(cscfg_device(), "Deactivate config %s.\n", config_desc->name);
>  			break;
>  		}
> @@ -1049,7 +1062,7 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>  				     unsigned long cfg_hash, int preset)
>  {
>  	struct cscfg_config_csdev *config_csdev_active = NULL, *config_csdev_item;
> -	const struct cscfg_config_desc *config_desc;
> +	struct cscfg_config_desc *config_desc;
>  	unsigned long flags;
>  	int err = 0;
>  
> @@ -1064,8 +1077,8 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>  	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
>  	list_for_each_entry(config_csdev_item, &csdev->config_csdev_list, node) {
>  		config_desc = config_csdev_item->config_desc;
> -		if ((atomic_read(&config_desc->active_cnt)) &&
> -		    ((unsigned long)config_desc->event_ea->var == cfg_hash)) {
> +		if (((unsigned long)config_desc->event_ea->var == cfg_hash) &&
> +				cscfg_config_desc_get(config_desc)) {
>  			config_csdev_active = config_csdev_item;
>  			csdev->active_cscfg_ctxt = (void *)config_csdev_active;
>  			break;
> @@ -1099,7 +1112,11 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>  				err = -EBUSY;
>  			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>  		}
> +
> +		if (err)
> +			cscfg_config_desc_put(config_desc);
>  	}
> +
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> @@ -1138,8 +1155,10 @@ void cscfg_csdev_disable_active_config(struct coresight_device *csdev)
>  	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>  
>  	/* true if there was an enabled active config */
> -	if (config_csdev)
> +	if (config_csdev) {
>  		cscfg_csdev_disable_config(config_csdev);
> +		cscfg_config_desc_put(config_csdev->config_desc);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_disable_active_config);
>  
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 
