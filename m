Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB63D69;
	Mon, 30 Jun 2025 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291150; cv=none; b=DKND037MpdgBBg37BZ4rAmxAFKq6KrBrRAEdlTDg+X3dNw0K8JRR4WccoQeSQ35UFYZpOL5gswuq6Ega4F4OkqANQVAgvfiGdkI+7qv55XggRNBBIY6k38n6MwsCVgtD3u1Ye8i95TPD9IL+29/SwRLNGyGI4xmJAhhLyPLvIf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291150; c=relaxed/simple;
	bh=btX5GrzVDV3XYG1/WD2QsKImTpdzgYQ/0mbnUQmA9/w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HzuFpRJiPZBqszNX/rcBH1BnrRU4WNj40xIxqwyPGAv/OmNfunjEWrYvAFCopzVQUNRPbyNQZ1ue9l5+dVZQrs2mDvi0jjCj5keqN7ZRcda42G4diirj7zeTpSm9vvt1XwzUzbnOkE59DAEulF+SmTcVk5Yx8EY9M2kNv5yEtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLtEwAwp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLtEwAwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751291149; x=1782827149;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=btX5GrzVDV3XYG1/WD2QsKImTpdzgYQ/0mbnUQmA9/w=;
  b=PLtEwAwp3OpnsQgx2MOUHo1NgKOUOnW0vgYEYF/mUnGUsOEXi58TfyWh
   vwF9ZDlwW61jrSj2npHNOksyIEgDdu+S2S6EhsUr7kwF9Ox4fNqtSdSoB
   ejH5oGJzBczWg3oNwY1hC356DTMg1wmVNF5LYGoVpp6rhoUUsX6DG/t9h
   zeGPMol51KXd5J+E1jc5ExfiucJ1K7LP/LA/J9CAeddviWpd1eiwHWTDt
   E92jolm65kJ0nE+md7m2iB73ClemsR9Y60zyrpsaAKWQOX3P39M9E6aDL
   OiAsk48BISlvNBhI+tEwdqhc0ZsWQtkJwKW9COGATPpd0GaiCGEu+kSSs
   Q==;
X-CSE-ConnectionGUID: 6leoHsZPSumoiEJwcnv/hw==
X-CSE-MsgGUID: D0aRDAMrTTKEHuD5sfC7WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52747053"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52747053"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:44:43 -0700
X-CSE-ConnectionGUID: gAgMf0a+RuKdTg9XBJjNZA==
X-CSE-MsgGUID: 2JNWOGCxQ9+c4vmYFUVIlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="184389130"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:44:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 16:44:37 +0300 (EEST)
To: Shravan Kumar Ramani <shravankr@nvidia.com>
cc: Vadim Pasternak <vadimp@nvidia.com>, 
    David Thompson <davthompson@nvidia.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    David Thompson <davthomspson@nvidia.com>
Subject: Re: [PATCH v3 1/2] platform/mellanox: mlxbf-pmc: Remove newline char
 from event name input
In-Reply-To: <cd2607b381630c0ae5ef7c86a4ab7e75c86d276c.1751286845.git.shravankr@nvidia.com>
Message-ID: <2b88f7a6-0b4b-9b0b-74c9-21af22f56898@linux.intel.com>
References: <cover.1751286845.git.shravankr@nvidia.com> <cd2607b381630c0ae5ef7c86a4ab7e75c86d276c.1751286845.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jun 2025, Shravan Kumar Ramani wrote:

> Since the input string passed via the command line appends a newline char,
> it needs to be removed before comparison with the event_list.
> 
> Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: David Thompson <davthomspson@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 900069eb186e..16cc909aecab 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1204,9 +1204,10 @@ static bool mlxbf_pmc_event_supported(const char *blk)
>  }
>  
>  /* Get the event number given the name */
> -static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
> +static int mlxbf_pmc_get_event_num(const char *blk, char *evt)
>  {
>  	const struct mlxbf_pmc_events *events;
> +	int len = strlen(evt);
>  	unsigned int i;
>  	size_t size;
>  
> @@ -1214,6 +1215,10 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
>  	if (!events)
>  		return -EINVAL;
>  
> +	/* Remove the trailing newline character if present */
> +	if (evt[len - 1] == '\n')
> +		evt[len - 1] = '\0';
> +
>  	for (i = 0; i < size; ++i) {
>  		if (!strcmp(evt, events[i].evt_name))
>  			return events[i].evt_num;
> @@ -1681,7 +1686,7 @@ static ssize_t mlxbf_pmc_counter_show(struct device *dev,
>  			return -EINVAL;
>  	} else if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_REGISTER) {
>  		offset = mlxbf_pmc_get_event_num(pmc->block_name[blk_num],
> -						 attr->attr.name);
> +						 (char *)attr->attr.name);
>  		if (offset < 0)
>  			return -EINVAL;
>  		if (mlxbf_pmc_read_reg(blk_num, offset, &value))
> @@ -1730,7 +1735,7 @@ static ssize_t mlxbf_pmc_counter_store(struct device *dev,
>  			return err;
>  	} else if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_REGISTER) {
>  		offset = mlxbf_pmc_get_event_num(pmc->block_name[blk_num],
> -						 attr->attr.name);
> +						 (char *)attr->attr.name);

These shouldn't need any newline removal, right?

>  		if (offset < 0)
>  			return -EINVAL;
>  		err = mlxbf_pmc_write_reg(blk_num, offset, data);
> @@ -1792,7 +1797,7 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
>  
>  	if (isalpha(buf[0])) {
>  		evt_num = mlxbf_pmc_get_event_num(pmc->block_name[blk_num],
> -						  buf);
> +						  (char *)buf);

You should cleanup the newline here, not inside mlxbf_pmc_get_event_num() 
so that you can keep the argument type const.

As the input parameter is const char *, I suggest using 
kstrdup_and_replace() so you can modify it.

In general, casting constness away is bad practice.

>  		if (evt_num < 0)
>  			return -EINVAL;
>  	} else {
> 

-- 
 i.

