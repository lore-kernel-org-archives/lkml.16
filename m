Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5DE2EE260;
	Thu, 26 Jun 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952109; cv=none; b=bc+mPqNu2BeCU5xSJ5K5QRUSVfNESsORXiwdvqzriV5L3HwXdTp4CIkEiDQAp6GJXaxjFCu8W+lLDnIywSOxdEJmnyav5WnszNZnoipLnVGnA/HfaBiUN5VrTSsIfHBxCWVWZNhwNX2FdSYzcdWyOQIHyVwPLYvRwHua7yw892Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952109; c=relaxed/simple;
	bh=O0L8FVvB///Na6bAs2bAIq/uTQnDv1eoHSfh3JhHjGE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Sh/bcowNEVsJe2wgALq8MQUbTlH2JtZPsEhaZiqxC70/KRC09F2qEWOP8539l13xyiKLFPdVF3L5ybj2Wxbe55FEkIdH7HSg9Yuaun3PjxTQV3iFTtVl+EqXwuKv/aTNDT5bWEP7fpxwRgyjbYIjJ0GAv4hVVwLVtXoLI3GYXec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mq+k1Do2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mq+k1Do2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750952108; x=1782488108;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=O0L8FVvB///Na6bAs2bAIq/uTQnDv1eoHSfh3JhHjGE=;
  b=Mq+k1Do2oGWJTUxevyvQziyhSen9IwvB88JPjpQJF5rrtRKr9rMTIE2+
   8agrcyHTXaLGSXx9dZ6gwLnmP/YzkDi1OhLw9cgkTdfK0LKq+eyjPu4Zl
   7jXsKfuwp6+owtx3UsaQpiKY/LYFKVc0/IrvEyjw+OLsZXjulJsrVZPN0
   tgLKIJx46BhAg6FrI275suNo9Rq/7FevTsluEqfVOJLdSrYavbH4JTg2U
   SMMNhB6UMB06xo3hDn6lXyhdII/unTHzra+jNOoFAl+iQv8paACVGbNJS
   4FcG6MHtreZFxUvuiNiXWcRQnjntsoUcO55PYxRCqNZ/OI9Rf4pwcTfyq
   Q==;
X-CSE-ConnectionGUID: QEB3xeQpR1iCCyzpiaN9PA==
X-CSE-MsgGUID: xKBKwQ9+QBW1gRsNflwgNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="55879163"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="55879163"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:35:07 -0700
X-CSE-ConnectionGUID: da1akKF+TPKt+KsLuRnorA==
X-CSE-MsgGUID: eSf8IE2iRhyFFzHiXvif7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="156587108"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:35:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Jun 2025 18:35:02 +0300 (EEST)
To: Shravan Kumar Ramani <shravankr@nvidia.com>
cc: Vadim Pasternak <vadimp@nvidia.com>, 
    David Thompson <davthompson@nvidia.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] platform/mellanox: mlxbf-pmc: Validate event/enable
 input
In-Reply-To: <7936743cf4d6b20c4ed25dc03722e3a7277aed70.1750245955.git.shravankr@nvidia.com>
Message-ID: <d9c09ceb-1492-f323-352d-4e8899e30ea2@linux.intel.com>
References: <cover.1750245955.git.shravankr@nvidia.com> <7936743cf4d6b20c4ed25dc03722e3a7277aed70.1750245955.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jun 2025, Shravan Kumar Ramani wrote:

> Before programming the event info, validate the event number received as input
> by checking if it exists in the event_list. Also fix a typo in the comment for
> the mlxbf_pmc_get_event_name routine to correctly mention that it returns the
> event name when taking the event number as input, and not the other way round.
> For the enable setting, the value should be only 0 or 1. Make this check common
> for all scenarios in enable store.
> 
> Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueField-3")
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 366c0cba447f..fcc3392ff150 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1222,7 +1222,7 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
>  	return -ENODEV;
>  }
>  
> -/* Get the event number given the name */
> +/* Get the event name given the number */
>  static char *mlxbf_pmc_get_event_name(const char *blk, u32 evt)
>  {
>  	const struct mlxbf_pmc_events *events;
> @@ -1799,6 +1799,9 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
>  		err = kstrtouint(buf, 0, &evt_num);
>  		if (err < 0)
>  			return err;
> +
> +		if (!mlxbf_pmc_get_event_name(pmc->block_name[blk_num], evt_num))
> +			return -EINVAL;
>  	}
>  
>  	if (strstr(pmc->block_name[blk_num], "l3cache"))
> @@ -1889,6 +1892,9 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
>  	if (err < 0)
>  		return err;
>  
> +	if (en != 0 && en != 1)
> +		return -EINVAL;

This is using kstrtouint() but there's also kstrtobool() which would do 
this check for you.

> +
>  	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE) {
>  		err = mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
>  			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
> @@ -1905,9 +1911,6 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
>  			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
>  			MLXBF_PMC_WRITE_REG_32, word);
>  	} else {
> -		if (en && en != 1)
> -			return -EINVAL;
> -
>  		err = mlxbf_pmc_config_l3_counters(blk_num, false, !!en);
>  		if (err)
>  			return err;
> 

-- 
 i.

