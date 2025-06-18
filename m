Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFBD280037;
	Wed, 18 Jun 2025 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238776; cv=none; b=DmBlF/U1UsvbxM1XsbsP7orfAc3aiKhDJG8lI7C9a1Q8ba1LSel9kmTNSq6Dq97/mfhf64/4V6H1//+emtvR/DfEwygy8g7f/RrSXTUSJ3+jXT8deX6UGBvSZmWnOzfwU5Sqw8UfUXtDWnGbvy2P5uEM+wKgyolWqCZoIOZKzhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238776; c=relaxed/simple;
	bh=4a36yfaVxjel1bSdzn14/ug9XsRUK4qd0+2wlh7dnFs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f9yMX0mFvdVuMkNsnpeKXWk14sF0ACMGLXjWfPLtdkBbjTaPsjXz3DsRKTU5dTaNZvyTtjLuONJ4xwJYZG0vJVnuNLlV1oXu0r79+a98pETNcTWATLHcxA9xYkvZAsaaWnn+xVrlUV1aFV7QUAQfPMo/xAtePdywiAfaxzQRAa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVQOrJJj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVQOrJJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750238775; x=1781774775;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4a36yfaVxjel1bSdzn14/ug9XsRUK4qd0+2wlh7dnFs=;
  b=WVQOrJJjhxopaFYOD7FrKMC+MmRf4dqopK9kJvbtZZwgi2DufJmAvxdo
   a686Dld4Ab/TESCNkn+8ZqarN2B862OoDgt2HqIeursWdH6edoGneJk4i
   H8hSbHZiKmWIl3GV2CAM3mBXpTE3Jx+KV+Dz5hwDkIofvwTOFvSETSLOW
   da8OFAGVSnnqOBpf2kgLBuNfYRCbmg1X5Z+LRfqqKpoHldU5Fx6aJICce
   0jo34lyRLvfontZjGdcdf0/B+lzKB4LJWvA5CNV2JaCbTLXLHVbS+0edd
   IQSsAdGiYRpIfnL+ZprTenMDot7RYeBwQA7sdO7BBwEvxiGf3PvVIe1Ob
   g==;
X-CSE-ConnectionGUID: 6nQi78CvTICtBDhm8x1BXA==
X-CSE-MsgGUID: nX0ubiUkRWSPzF9Tj5M4Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56122619"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="56122619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:25:07 -0700
X-CSE-ConnectionGUID: i+jrtZyrSdKfB197CboOpA==
X-CSE-MsgGUID: A4AbLTM6SMi037T+x57/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="150189629"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.62])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:25:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Jun 2025 12:25:01 +0300 (EEST)
To: Shravan Kumar Ramani <shravankr@nvidia.com>
cc: Vadim Pasternak <vadimp@nvidia.com>, 
    David Thompson <davthompson@nvidia.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-pmc: Check validity of
 event/enable input
In-Reply-To: <20250618071713.8595-1-shravankr@nvidia.com>
Message-ID: <7d5d6ca9-0078-dec1-d889-4407f8867abd@linux.intel.com>
References: <20250618071713.8595-1-shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jun 2025, Shravan Kumar Ramani wrote:

> For eventN input, check if the event is part of the event list
> supported by the block.
> For enable input, do not accept values other than 0 or 1.
> Also replace sprintf instance with snprintf.

The code changes in the patch barely match some of what is described 
here, there are major gaps in the description.

Please don't try to put multiple independent changes into the same patch 
but create a patch series, each patch having focused changelog explaining 
reasoning clearly.

Unless the change is trivial (e.g., a comment typo fix) my general 
suggestion is to first state the problem, then explain the solution (on 
general level, no need to spell out what can be trivially read from the 
patch). Even for that comment change below, I'd want it mentioned that the 
comment does not match the code, it would be not enough to say e.g. "fix 
a wrong comment" but explain why it is wrong.

Some of these changes below may need Fixes tag but given the general 
vagueness and lack of description for some of the changes, I cannot decide 
(nor will accept the patches which do not have enough explanation). Put 
any fix patch at the head of the series.

Please don't leave lines "short" in the changelog (lines cut abruptly at 
stop "."). Write real paragraphs with full length and if you want have 
more than one paragraph, leave an empty line in between.

> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 900069eb186e..fcc3392ff150 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1215,14 +1215,14 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
>  		return -EINVAL;
>  
>  	for (i = 0; i < size; ++i) {
> -		if (!strcmp(evt, events[i].evt_name))
> +		if (!strncmp(evt, events[i].evt_name, strlen(events[i].evt_name)))
>  			return events[i].evt_num;
>  	}
>  
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

