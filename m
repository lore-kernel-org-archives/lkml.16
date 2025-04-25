Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF0F279914;
	Fri, 25 Apr 2025 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594150; cv=none; b=oK+ODc8LYXZQds94epo3Mu26Doi1roblMvbFhqNgZ9HlzbyxHiCKoEA2ustqq4ccfjeiWcyKMqzpfKxcYvgAbXvX6Mv0xf2eEW4qVaqb2c7eNIaNqtGlm6hZf2G8nqv/DO9mwIrilGd5MZQPfOZw7q6NwizEfyEfzOV3KSXsnoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594150; c=relaxed/simple;
	bh=cHoR1mvhfJvEkOnqx7+B37rDrUCFYjzoaPlGXi4c4Ic=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dLAczHPRMGC6vyEWRGlr7wszfnNEa7YI50kaxxuYD1/x6EPWDuksePfLHjypbP8u4VSswpgEAyhGCRnAdJBF1qNxcWpUD4Omr+OIaI5I6ukTC3+tKEZKvAenr1bThyjVOoJotFITW5Th5C3TahZ2VL7+2cNJbP21xvk0gBTL35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLwoxkMZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLwoxkMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745594148; x=1777130148;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cHoR1mvhfJvEkOnqx7+B37rDrUCFYjzoaPlGXi4c4Ic=;
  b=DLwoxkMZtMc04QOA8AOOTAR+JLQOO3TVU9ixJRd2jCBxWX7XG2o73Xw0
   j2Zt9HnIDKnvjXQopbojaQ/rTUKb57Yn2CeYv1JOm9irl6ZFxjuyk4MWV
   09Fj6z0J6pwH+xofteoI53f/+yrBj/Vay2LNVkihkwfCoenRQmb2l1D6/
   e7pmQl6vwyGqxdoa+UIyY7hjfq/CNyGp+NCGpnhzHJ/CjZEydwbRXt4k5
   8siuL++pldyewm+MH3hT1BUWL6e/zHNoBPcwjytQHLOmndugXY+Y2YexS
   2W1asDYurbEngAaNNOskpNu4OSw3vKW6WHVibrfuq3CEzEW2ajkRGQ17d
   w==;
X-CSE-ConnectionGUID: Y1fGxSZtSCmyAn0NiJKYZA==
X-CSE-MsgGUID: EBQcHp27QM+trQecYeYvDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47134060"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47134060"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 08:15:48 -0700
X-CSE-ConnectionGUID: owMVK2VfR7SJ3nW0awWvtg==
X-CSE-MsgGUID: WJ9SURBmQKKbQky7t0+CKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137916568"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 08:15:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 25 Apr 2025 18:15:42 +0300 (EEST)
To: Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: samsung-atna33xc20: extend msleep in
 atana33xc20_disable to avoid glitch
In-Reply-To: <20250425105822.4061016-1-alvin1.chen@lcfc.corp-partner.google.com>
Message-ID: <a75efa75-a113-842c-d598-2c1405a5c29b@linux.intel.com>
References: <20250425105822.4061016-1-alvin1.chen@lcfc.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Apr 2025, Alvin1 Chen wrote:

> samsung-atna40ct03 encouters glitch when powering off, extend msleep

encounters

msleep()

I'd also suggest you describe the glitch a bit more than that.

> in atana33xc20_disable to 40 can avoid this symptom.
> 
> Change-Id: I4d052621d3c3e0fdae0ac472fe5da151f46be237
> Signed-off-by: Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 4 ++--

Please use scripts/get_maintainer.pl to send this v2 of this patch to 
correct lists and people. Thanks.

-- 
 i.

>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> index 9a482a744b8c..87a4e1c47aaa 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -154,10 +154,10 @@ static int atana33xc20_disable(struct drm_panel *panel)
>  	p->el3_was_on = true;
>  
>  	/*
> -	 * Sleeping 20 ms here (after setting the GPIO) avoids a glitch when
> +	 * Sleeping 40 ms here (after setting the GPIO) avoids a glitch when
>  	 * powering off.
>  	 */
> -	msleep(20);
> +	msleep(40);
>  
>  	return 0;
>  }
> 
