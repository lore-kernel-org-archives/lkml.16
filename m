Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E612798E3;
	Mon,  7 Jul 2025 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893180; cv=none; b=qJE5wGqHthbm3MDqGCZyaqhgrp/9eausVzMk05Gww1x4lSasE6Ia08egLT+FJ88kVhOw6YZmTNgFKxSF45xBru4U7tIMcbdoRgR990r6mVEwQashk/qIypAxT5+rAzJ/8Xz9Te9OALMf58NdDWP7MemEBw1dNLCSXEH668DteDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893180; c=relaxed/simple;
	bh=AIpdjaop4M9+6eXivbyQLogbWlCGzKNHvDpcMI0Z31c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DpPiIsbA3FXO3ixIWhG9/qNe5OepWn7ixnmkiIkd0Ma+tgffTpuLICLIBhIbVzB/nhw7VwZRI+TXCkpCIuiwLEaIOT04O8FHN6rmAC/otVFg4VIDRIR8kOPRZgJaamQTickDVa4tkq2RjWZ1uv0/FXzCPSkc12D9SXd9F8Jg+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwSE49WH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwSE49WH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751893178; x=1783429178;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AIpdjaop4M9+6eXivbyQLogbWlCGzKNHvDpcMI0Z31c=;
  b=EwSE49WHo/5jZhSHP0EkNPa+jsSVZ5txkCgtXBOCJMnSZEieZQBh6IB9
   5VhcvwM2PCIVUN8Edhd4/jUoNPXkruWO4GGMKfin9sj9lEwKBgtqsextC
   q13pO1t4cL7Bhi3OGPDL78TyMv36Bz+wD/ward6rXbf2s4xiEImwE3yhL
   WhKplt/rttSO8T9Mm5F7Qlu+TgWyQAjEJYCJbAMwXnnLYEsCUWbNXXEzQ
   HFS1xLKk6o4/khMFv6dcGJjEtqxUYGkJWi/spSuB1Svi1A2WsirMXFRpp
   WoOIkcLAfs9fzatFRyoODWVcu2SxqceEEIbDJ3dCw5BxF9/PScZycmIiA
   A==;
X-CSE-ConnectionGUID: jc6yz7ypTBqIKJ1kG5yHHg==
X-CSE-MsgGUID: Hx89f7GFTz6UuMx6g6V+2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53970616"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="53970616"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 05:59:37 -0700
X-CSE-ConnectionGUID: nwgno0biRkOTSA+PUotBNw==
X-CSE-MsgGUID: 3nActMbpTL6pXWMIprqrSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="154634790"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 05:59:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 15:59:31 +0300 (EEST)
To: Shravan Kumar Ramani <shravankr@nvidia.com>
cc: Vadim Pasternak <vadimp@nvidia.com>, 
    David Thompson <davthompson@nvidia.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] platform/mellanox: mlxbf-pmc: Validate event/enable
 input
In-Reply-To: <2ee618c59976bcf1379d5ddce2fc60ab5014b3a9.1751380187.git.shravankr@nvidia.com>
Message-ID: <fe24c309-737e-72c5-90ae-cfb873dd195d@linux.intel.com>
References: <cover.1751380187.git.shravankr@nvidia.com> <2ee618c59976bcf1379d5ddce2fc60ab5014b3a9.1751380187.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Jul 2025, Shravan Kumar Ramani wrote:

> Before programming the event info, validate the event number received as input
> by checking if it exists in the event_list. Also fix a typo in the comment for
> mlxbf_pmc_get_event_name() to correctly mention that it returns the event name
> when taking the event number as input, and not the other way round. For setting
> the enable value, the input should be 0 or 1 only. Use kstrtobool() in place of
> kstrtoint() in  mlxbf_pmc_enable_store() to accept only valid input.
> 
> Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueField-3")
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 9cc3d4ca53cf..9aa8de1122e5 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1223,7 +1223,7 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
>  	return -ENODEV;
>  }
>  
> -/* Get the event number given the name */
> +/* Get the event name given the number */
>  static char *mlxbf_pmc_get_event_name(const char *blk, u32 evt)
>  {
>  	const struct mlxbf_pmc_events *events;
> @@ -1807,6 +1807,9 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
>  		err = kstrtouint(buf, 0, &evt_num);
>  		if (err < 0)
>  			return err;
> +
> +		if (!mlxbf_pmc_get_event_name(pmc->block_name[blk_num], evt_num))
> +			return -EINVAL;
>  	}
>  
>  	if (strstr(pmc->block_name[blk_num], "l3cache"))
> @@ -1887,13 +1890,14 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
>  {
>  	struct mlxbf_pmc_attribute *attr_enable = container_of(
>  		attr, struct mlxbf_pmc_attribute, dev_attr);
> -	unsigned int en, blk_num;
> +	unsigned int blk_num;
>  	u32 word;
>  	int err;
> +	bool en;
>  
>  	blk_num = attr_enable->nr;
>  
> -	err = kstrtouint(buf, 0, &en);
> +	err = kstrtobool(buf, &en);
>  	if (err < 0)
>  		return err;
>  
> @@ -1913,14 +1917,11 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
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
> -		if (en == 1) {
> +		if (en) {
>  			err = mlxbf_pmc_config_l3_counters(blk_num, true, false);
>  			if (err)
>  				return err;
> 

Hi,

I've applied this series to the review-ilpo-fixes branch but I had to 
split the kstrbool() change to own commit, it's very apparent these two 
changes should have been separate right from the start (and I even asked 
you to split this earlier).

Whenever making changes, especially fixes, please try hard put separate 
changes into own patches. That should be done even if the changes touch 
same file, and they may even look similar such as here, both are doing 
"input validation", but the cases were still clearly different.

It's easier to review, justify in the changelog, etc. when the change is 
very focused on a single problem only.

-- 
 i.

