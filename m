Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97D1DF759;
	Mon, 28 Apr 2025 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825992; cv=none; b=SCXuoMeP2oRt0LgAmfNqKrye0WZZEe8blDLOg2FQPJ27qoLYMY2m3EQmCHdErwGyv6zjXx2TSvLv7CU6VIFK+f8Q98CBjzqqC6Zmv+WtZMsytAn8VtRf12ExKwJhLW6SRJcV/IBi9w7cXsiybjVhswndtFsBOp+xYAfPdch9jDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825992; c=relaxed/simple;
	bh=S0DDgNBpR08t+xxO+p+IaXwn25EIDim/obNPxkUPTTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gogf6uo/6KXvnQUZi1zoaGdmz9W7G1MMeu36Y6vDW9WZzmgmIjtUBjp1sIBi48ghOPVYRHqfTxE44YsQIdyS0tLa6hiQfvqUOULaJQiBkMGTl3fVIi6NPmd5XqePQoPNPnQIWWvq5l0jrw5LW6qFkgZ70p6KhCIo4RKZJ0H7PR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3MoCjG7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3MoCjG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745825991; x=1777361991;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S0DDgNBpR08t+xxO+p+IaXwn25EIDim/obNPxkUPTTk=;
  b=J3MoCjG7Cs8Zb57PkvjU+RO9MRbPITDA8PwosjtHKVuhi38LjL2krzaN
   tnojwXiIkOtS0ExZbNa/H3jypJm80hNttlKM7dvfraoGIFoopbD3ppI4s
   r5v9b9WMUlj/hAduToxO/O8pQt1ORsuv13MvJZT+M5KT6TQOSqjbetssB
   x8DNzrPVfp8trCbUd5KDGjYhyZ3v5IjNtkqbIyxkWnyLAfx8sEq1wb+5C
   ckAve7Cit8vuN+IJ1Uz9DkzrNgLIPAsrQNkkgOs3S5O0f7rAs1PD1eQKF
   rJsjs48BDWL4FS3fjvcR8gXiTWoYd0oocVIqW48xhx+G3lxEC1adUbwEF
   Q==;
X-CSE-ConnectionGUID: o93gZNwmT5yRsLhElGNdqg==
X-CSE-MsgGUID: mf8mjUcdQKOctRE3BHortw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58387403"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="58387403"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:39:50 -0700
X-CSE-ConnectionGUID: P1miLBrtRNWT95IHLFYsOw==
X-CSE-MsgGUID: /F0AC7MrQguQ6bDPNqvIzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133962074"
Received: from sbockowx-mobl2.ger.corp.intel.com (HELO [10.94.8.84]) ([10.94.8.84])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:39:46 -0700
Message-ID: <195fbcea-0b9d-4905-a131-78addcfff62b@linux.intel.com>
Date: Mon, 28 Apr 2025 09:39:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: Fix kcalloc() sizes
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250426141342.94134-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20250426141342.94134-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-26 16:13, Thorsten Blum wrote:
> rlist, clist, and slist are allocated using sizeof(pointer) instead of
> sizeof(*pointer). Fix the allocations by using sizeof(*pointer) and
> avoid overallocating memory on 64-bit systems.
> 
> Fixes: f2f847461fb7 ("ASoC: Intel: avs: Constrain path based on BE capabilities")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   sound/soc/intel/avs/path.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
> index cafb8c6198be..8f1bf8d0af8f 100644
> --- a/sound/soc/intel/avs/path.c
> +++ b/sound/soc/intel/avs/path.c
> @@ -131,9 +131,9 @@ int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template
>   	list_for_each_entry(path_template, &template->path_list, node)
>   		i++;
>   
> -	rlist = kcalloc(i, sizeof(rlist), GFP_KERNEL);
> -	clist = kcalloc(i, sizeof(clist), GFP_KERNEL);
> -	slist = kcalloc(i, sizeof(slist), GFP_KERNEL);
> +	rlist = kcalloc(i, sizeof(*rlist), GFP_KERNEL);
> +	clist = kcalloc(i, sizeof(*clist), GFP_KERNEL);
> +	slist = kcalloc(i, sizeof(*slist), GFP_KERNEL);
>   
>   	i = 0;
>   	list_for_each_entry(path_template, &template->path_list, node) {

Of course, thanks!

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

