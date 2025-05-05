Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94D1F418C;
	Mon,  5 May 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433640; cv=none; b=V5oNFeW+DRsEor+LqjKdb6d5kTxjsNeUICT4EDaq5Q5RwAh9gmMOBnmA/MvyGiyu2L6EV+aqJMIAYb1KBjq7LK0f2dUvHEkMwKDuYt43IXOa+/hAC3Fn385AHYNbr2vTbUrpeGPQKB6/0cBALBeJ+opqHLO0aSY6NcNQTO+WDLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433640; c=relaxed/simple;
	bh=i7JGcwvA4qScIZy83CQCFii3FHeN5UManpcgNMkmvA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0CTMIos2IbsOA94sLCpaaSYcpT6aAZGtEF/cLchMTEiv6qKaycWx8uG8iv1EsMN4Xcp1LW/q7JDmdCOpAV/1BqIAHsvECl5jXaOgXQGATL4yc8H/3XkMrZ0fyuvorTfz/rGOq673KZV7Zz76IF9PLj7oMJHNWEsWzleDiUugpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLnfphLL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLnfphLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746433638; x=1777969638;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i7JGcwvA4qScIZy83CQCFii3FHeN5UManpcgNMkmvA4=;
  b=NLnfphLLyV4WB7tM//lJMtX+4dR8VVSGdbQgGi4lt8NDtas57BNlyJNJ
   vIchBajjcdVymFPC+Gt6cqBbs/2YZu5BRHwM241trUGMJnzrvBe+KBoVl
   Q5BFkhUEyXp/j6xTCf0dfLeC2pkrRDnWwDmlMTSBvKMpSAl7Guvy2loHW
   zIrxzm5sUSrRO4OHetaz3t5MjsU+Ng7ZQtoU31w7W91YS1Pc/FWGJer5U
   84VEi/nk8DS844+FqYX1nsHvesWOnOx1fZTg76GBi7HZTRz9cZf2VG62j
   JyWJfsWQtEqf1jgJyo3WoVxjrc+K2wL+SfNqfxeriLf+2kjQb/on8B/7n
   w==;
X-CSE-ConnectionGUID: wOyxIxtMRpi7WpM62PB6vQ==
X-CSE-MsgGUID: LLoovh5GTxS7FS8LPen86A==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65565299"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="65565299"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:27:17 -0700
X-CSE-ConnectionGUID: 6ShCHkh0R1+CzMKMjk8+Yw==
X-CSE-MsgGUID: 4EUcdzSLRoSoBYffwVRZeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="136129079"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.105.120]) ([10.246.105.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:27:15 -0700
Message-ID: <2933e4c7-fc4c-4161-afee-cd6abcd79ef5@linux.intel.com>
Date: Mon, 5 May 2025 16:27:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ASoC: intel/sdw_utils: Assign initial value in
 asoc_sdw_rt_amp_spk_rtd_init()
To: I Hsin Cheng <richard120310@gmail.com>, lgirdwood@gmail.com
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.dev, Vijendar.Mukunda@amd.com,
 peter.ujfalusi@linux.intel.com, peterz@infradead.org,
 christophe.jaillet@wanadoo.fr, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20250505074142.615408-1-richard120310@gmail.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20250505074142.615408-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/5/2025 3:41 PM, I Hsin Cheng wrote:
> If strstr() for codec_dai->component->name_prefix doesn't find "-1" nor
> "-2", the value of ret will remain uninitialized. Initialized it with
> "-EINVAL" representing the component name prefix inside "rtd" is
> invalid.

Indeed. Thanks for pointing it out.

> 
> If "->name_prefix" is guaranteed to have either "-1" or "-2", we can
> remove the second strstr() because we know if "-1" is not in
> "->name_prefix", then "-2" is in there. It'll be a waste to do one more
> strstr() in that case.

The existing name_prefix is with either "-1" or "-2". But we can't make
the assumption in the asoc_sdw_rt_amp_spk_rtd_init() helper. We might
have "-3", "-4" etc in the future.

> 
> Link: https://scan5.scan.coverity.com/#/project-view/36179/10063?selectedIssue=1627120
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  sound/soc/sdw_utils/soc_sdw_rt_amp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sdw_utils/soc_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
> index 0538c252ba69..83c2368170cb 100644
> --- a/sound/soc/sdw_utils/soc_sdw_rt_amp.c
> +++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
> @@ -190,7 +190,7 @@ int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
>  	const struct snd_soc_dapm_route *rt_amp_map;
>  	char codec_name[CODEC_NAME_SIZE];
>  	struct snd_soc_dai *codec_dai;
> -	int ret;
> +	int ret = -EINVAL;
>  	int i;
>  
>  	rt_amp_map = get_codec_name_and_route(dai, codec_name);

