Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6AA8F58;
	Fri, 16 May 2025 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389334; cv=none; b=BNLkVeZjLq8Wl6vZ6Ph8E/sS9ISQ6ECYph5q8hdBItxgWs9H3dZSfagK4dsWB1ZENWFqUzWIT07Gg+b/3COPywG3H2ltTksBIECMBtYy3TE3qIFAqkq18abgLOa0f7jnF+nLQohEzBgol1zo9yWp5LXmNlDwDe/LJ4hkD/c/AEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389334; c=relaxed/simple;
	bh=F6ORg0yRnpqLbpE6aw8TDMpSUs9XkjRKy6srRdJ4A2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSYnpJO5M41qV2UzqHIoa8hBnu0izD1XEKcFD2Bp7RxQfNEtlfMeDOMm53/zLQh55DZUX6mvrhnLny1BrFvEJMTJdyLZ+ZEFB8E0mvNC0GShVUz5kM4H8cLvcHLcIjhlG4bLfbEcpEbm0CGrVFomxR/crOQFJlg9LXfE7TpRbVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IY1gutf/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IY1gutf/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad24677aaf6so255421866b.2;
        Fri, 16 May 2025 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747389331; x=1747994131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Axg7F7QjuzXYT66ePL9GXJ6xq+M+wgyKaCF1Z17Ng8I=;
        b=IY1gutf/8mB77UbteAaO+qhp13HflZjNqxp+0AdEymZ5pdzlkgEuoOmynyCE5wYDU5
         fdfztyXnREuTRD2fXuUb5PJW0A9oLxeWBCuJXfqC5hf+4AVHNyybJhM5LTHuRnvHscty
         WaHbJppFzTYbm5VaYSJmC6hHT1hLbttygRc1yDZT1+VA/hdB4FCq2Na6R9KgbcFt56QP
         yMslViLmd36IFIkwVre1Pl2MdKul+XmbrYnkyUnMK+KZnQKgdcVjXbtGRX0L5KGgNOkm
         fNrGi7viCqzW3Me4mgjtszzTQ2yaTVYUXGNn5ShJuaLBM6BzZ+1pgSpscBfQijOKXm8b
         mmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389331; x=1747994131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Axg7F7QjuzXYT66ePL9GXJ6xq+M+wgyKaCF1Z17Ng8I=;
        b=bW8sff5WVfQqi017bqMSSYKJXxxS3L3GG11T66jj3l2itXhPUBrn2pU1dMowCUaR4z
         S5Iv0rEAqB6o0gM8Dky5Q4Zgh3nx6mB4VH2SnpsX3EFqpIAYzEyY/3EQV3lQ2Gwvy0t0
         Er1VTFfrHT63vlB47Gh/yf9PDy3i3psVJw+2cLbKKVwEl30aYqYZysQ8frGjg3L4BPEH
         Cw53P+Nxc3DcqVanxZK6SxYltLMN9CDQxFu0m1mISavymXpJJmNeypS0JMGZe1KdE6S1
         behvpRfYCdzOd3wk1yJ5gQJCu33FsL/80mLpR2kmAr4HT4PLrB6a44BwyYLS38yVa1bQ
         tUHw==
X-Forwarded-Encrypted: i=1; AJvYcCUZZZitO/VopdBW4vVopz+PZXDDRL30k4cG5o5NQ4AZMCOi2Hs6Y+EMT7N2yMAocBVQE4tjIAO1mmrAmVM=@vger.kernel.org, AJvYcCXqtY3aLUFMSg55G0DgOA1sb/Z0zl/cFMoUL0IZTNWJ6chfiX9yC8b6cNBczrZxydPNfDECBEpVXbNcvzw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy14EXvo44ufCdRbjHxuJfUW7R2X+gedyieIFo2UAGLpEZQnonM
	MhP4UUsDTUAIQ2hd0Fjhk4bbyFo7d93pJCf756HNg527C2VOivW/5acXNu8DMw==
X-Gm-Gg: ASbGncsmEummKQtEQWEDwbI7UWMCze2OnfR3mGMM2aYg+mT4OoZuFihhmlf0KDp5I4R
	iD9NVYTCnQ9Ww6NNJPyNO8EBW63jcjTlnysn1ZMpUNsWfCf94mQwur4wfPY1tfZ9x0Zdy2r+1qc
	ri6/XN37uhKr+2cNg0X5HwvwgEvMIFL017OhbQXpheM9o7dDsv0BJyRjPFURTu4+fUCqve2EgEc
	5w6gHDO6fvYl0sB4buQe2zgX0+Cm0qDIGFFVCHp+EKcM6upXWAVZV/2292lWe7nSH/Ih2LwxnSs
	4XXclcpfg13EPfq6/TMbtLsQkOMUcRqN36xtABqlzu9id5Xpl2USqI7I1t3maYf8ZQ4Nmk18e8V
	E3Bmerv9ZQuUPp0D8Eg==
X-Google-Smtp-Source: AGHT+IGbL/TPBNXrDuxYzIG3AQQgcydYk4efAjQsTWHoUpwrnWH3h6zVQ0RXFqueVJ6EXMmGZdEghw==
X-Received: by 2002:a17:907:c10:b0:ad5:1f59:96f8 with SMTP id a640c23a62f3a-ad52d50aab1mr214119166b.34.1747389330713;
        Fri, 16 May 2025 02:55:30 -0700 (PDT)
Received: from [192.168.6.174] ([92.120.5.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d439639sm128936966b.104.2025.05.16.02.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:55:30 -0700 (PDT)
Message-ID: <a1466ee2-8931-4ec6-bca8-69c2117d0f6b@gmail.com>
Date: Fri, 16 May 2025 13:13:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] ASoC: re-introduce disable_route_checks flag for
 OF routes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
 <20250515153128.147457-2-laurentiumihalcea111@gmail.com>
 <875xi1tkm7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <875xi1tkm7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 16.05.2025 04:22, Kuninori Morimoto wrote:
> Hi Laurentiu
>
> Thank you for the patch
>
>> The "disable_route_checks" flag was previously removed via commit
>> dd2395162c07 ("ASoC: remove disable_route_checks") as it wasn't being
>> used anywhere.
>>
>> Re-introduce an OF-specific variant of the flag: "disable_of_route_checks"
>> as this will be used by audio-graph-card2.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  include/sound/soc.h  |  1 +
>>  sound/soc/soc-core.c | 12 ++++++++++--
>>  2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/sound/soc.h b/include/sound/soc.h
>> index 1fffef311c41..e76da038557d 100644
>> --- a/include/sound/soc.h
>> +++ b/include/sound/soc.h
>> @@ -1077,6 +1077,7 @@ struct snd_soc_card {
>>  	unsigned int instantiated:1;
>>  	unsigned int topology_shortname_created:1;
>>  	unsigned int fully_routed:1;
>> +	unsigned int disable_of_route_checks:1;
>>  	unsigned int probed:1;
>>  	unsigned int component_chaining:1;
>>  	struct device *devres_dev;
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index 67bebc339148..b14a52d6f550 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -2245,8 +2245,16 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>>  
>>  	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
>>  				      card->num_of_dapm_routes);
>> -	if (ret < 0)
>> -		goto probe_end;
>> +	if (ret < 0) {
>> +		if (card->disable_of_route_checks) {
>> +			ret = 0;
>> +			dev_info(card->dev,
>> +				 "%s: disable_of_route_checks set, ignoring errors on add_routes\n",
>> +				 __func__);
>> +		} else {
>> +			goto probe_end;
>> +		}
>> +	}
> commit dd2395162c07 removed flag from 3 parts (core x2 / topology), but
> this patch get back only one of them.


hm, so the rationale for introducing this OF-specific flag was because

audio-graph-card2 is the only user for this feature and this user only

needs to disable route checks for OF-based routes. On second thought

though I think it might be better to have this feature for all routes in case

someone might need it for non-OF routes as well? (if we go with the current

approach and it turns out someone needs it for non-OF routes you're going

to need more changes to support that)


>
> I think this flag check should be implemented in snd_soc_dapm_add_route()
> itself instead of each caller, but what do you think ?


good idea, I'll give it a try


>
> And maybe we want to use more easy-to-understand naming, like
> "ignore route check", etc ?


sure


>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
