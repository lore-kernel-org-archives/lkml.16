Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC9819F120
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090806; cv=none; b=F5+C2SBWbsGMGq00x2czk7ZK5Sf8MIUquzedfcvzUmYfOBuIfR8lHX4PhdtoYYJfam0whgp6QTNdmh01TDpy1SdILUPWiibhb6IE0H4nsz5chzyLI+ZGWef3kXMUoLe70ip+D/4gK2UHJKUVXEUKHp0INB3StlWmHslm9ofW7J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090806; c=relaxed/simple;
	bh=aZI0D9GByNS5niy1zG4DskkgaZ8o9N1YGuTSEvk42eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFRHlD1oC+DO1uTxMfRNYUA1JZZUYAJcRH04IO6HwZgL6BIhbT1p44tBjrg5KwTUA1L3CS0huGwc+FooWI05Do258JRfaiWnRkQ9pPx64bfdd1e8FSpj6c3CE+RIvV5o2+Uqfznj+WpvJFGliX9unkzRrOV+jLWKRGtc2lkh3fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zS8Gooq0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zS8Gooq0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so7783805e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743090801; x=1743695601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPWPL7yKTAtHpN1GHn1lwbAF2Bxssj4X5B+0T4l0yZA=;
        b=zS8Gooq08D4tUgk+wHsCFwNDiCiLYi6fvV33yAcYX5MLip6vsYcqiXWXHu5USx7Tyv
         xT2o08RNyfDKI8Wc3INXuaHBx113BNTJ1jnY+beZFianwEXdH/Byxv8h/3x0mf/ABZjw
         H2EXTikR3PwkvheNahDYIanMq4ZggPx2wASppHVm98jGO1S5SgcV4DupkcSFNqsf2Fvt
         h/5jiBbPrcX7sdvCWOjT0R9mq0s3QsEbunibAiZwNRvazAZm1MF3mjjsRZZp9MpnpBkk
         ZMzc0bWPFMIp1BGaFIdymvc3LEFMzwRcj3LlMbZvjw4msm78JfaQxNIosHD9sE1vAvZP
         BbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090801; x=1743695601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPWPL7yKTAtHpN1GHn1lwbAF2Bxssj4X5B+0T4l0yZA=;
        b=HjLEMzdYVUwPbeCwft4EX11eMXvZSEsN+IkE3uMIUopi/MlbaU4f1ZeiHoMajN3xhF
         OFUpDXa2RFCVeSHle626mifnU/bDI6JSQQjePAPSGo4GKC1VmLnZICeFIGXzMivnONWE
         kI/cJncUGKwgycZNx7xHhQ537t7c3U9qjiyT/uqaRKlMp/Dko8NTXcUTRFxwyVpwGrxY
         l1/iizyWzos6gu0nhb4YX2lsfWdo3+mjbj+qz63Pl7pJ1l5E+CP1zYq4u5C6kFcRFNEQ
         1YmjC8xOnxCbvHSuYjeFifbRtf9S8MeTc/Uz6+rHeMkKdhdqrs1I2utp4PTaQ6Hxe94r
         B6uw==
X-Forwarded-Encrypted: i=1; AJvYcCU93+uioFaQ4ebAXHheBst7tV6998TBro562wGvxy/Jl3uStbG98a17NAi3idAxYqbbaujWD95YMjdyAYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCgYxvihxJ3r/sKVUHaHU2P2dWyPo+X/q+AuaGnwBOgVFxemiS
	Cy79lu/xiyY9CRjvGtVu8G3cw1F7gzTC9rrZCU3vuOYC0l0RS9x/LqXJLMtIEOU=
X-Gm-Gg: ASbGncvDpfyMeXA5GvvtEGcR6DzvoOvbOcYg+n2d4TJZGjtfitcXekDGoi9vfGZyM5T
	Zz9TnRlCbht3jCwjXpFnKGLZfYfqaGSa1SUCGYxcxzOtyyOnDSdq9dtOnQXT/cuDMop8GUVdEmb
	2bhdbBowMK81AVq4J0wXxRAQktu5Y3WB1j9mDiurmRU3Yx90760HeMdRINNEr9Dv6n92cxYpwzl
	InqIL4+VdL1ziYT+KXfvBhjs17tYMPDgRMcN6umVruyFjs9ENkgws5LiuerKQ7hEkpRDdzrqBew
	anABy0kclf8IAOpiBAn06fAGxVRgMPWuV7ZjtLCwKICjzoFPLwRCd1dDkycB1iJbN8ccC7MvPw=
	=
X-Google-Smtp-Source: AGHT+IF0rsorn2DDVURJzAnXZcks95g4PPd1N+aY2Afsm9tUg7aUDyfar1m2VXFCygEcTyP952h82g==
X-Received: by 2002:a05:600c:1e16:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-43d8e6c0616mr7183295e9.13.1743090801523;
        Thu, 27 Mar 2025 08:53:21 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39acf3a9105sm5001550f8f.101.2025.03.27.08.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:53:19 -0700 (PDT)
Message-ID: <e7c3ea4a-1103-46ff-aa9a-bc0da3bdf1b2@linaro.org>
Date: Thu, 27 Mar 2025 15:53:18 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params
 error path
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
 linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250327154650.337404-1-alexey.klimov@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250327154650.337404-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/03/2025 15:46, Alexey Klimov wrote:
> In case of attempts to compress playback something, for instance,
> when audio routing is not set up correctly, the audio DSP is left in
> inconsistent state because we are not doing the correct things in
> the error path of q6asm_dai_compr_set_params().
> 
> So, when routing is not set up and compress playback is attempted
> the following errors are present (simplified log):
> 
> q6routing routing: Routing not setup for MultiMedia-1 Session
> q6asm-dai dais: Stream reg failed ret:-22
> q6asm-dai dais: ASoC error (-22): at snd_soc_component_compr_set_params()
> on 17300000.remoteproc:glink-edge:apr:service@7:dais
> 
> After setting the correct routing the compress playback will always fail:
> 
> q6asm-dai dais: cmd = 0x10db3 returned error = 0x9
> q6asm-dai dais: DSP returned error[9]
> q6asm-dai dais: q6asm_open_write failed
> q6asm-dai dais: ASoC error (-22): at snd_soc_component_compr_set_params()
> on 17300000.remoteproc:glink-edge:apr:service@7:dais
> 
> 0x9 here means "Operation is already processed". The CMD_OPEN here was
> sent the second time hence DSP responds that it was already done.
> 
> Turns out the CMD_CLOSE should be sent after the q6asm_open_write()
> succeeded but something failed after that, for instance, routing
> setup.
> 
> Fix this by slightly reworking the error path in
> q6asm_dai_compr_set_params().
> 
> Tested on QRB5165 RB5 and SDM845 RB3 boards.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5b39363e54cc ("ASoC: q6asm-dai: prepare set params to accept profile change")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

thanks for the patch,

This is now pretty much inline with what we have in non-compressed patch.

LGTM.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 045100c94352..a400c9a31fea 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -892,9 +892,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   
>   		if (ret < 0) {
>   			dev_err(dev, "q6asm_open_write failed\n");
> -			q6asm_audio_client_free(prtd->audio_client);
> -			prtd->audio_client = NULL;
> -			return ret;
> +			goto open_err;
>   		}
>   	}
>   
> @@ -903,7 +901,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   			      prtd->session_id, dir);
>   	if (ret) {
>   		dev_err(dev, "Stream reg failed ret:%d\n", ret);
> -		return ret;
> +		goto q6_err;
>   	}
>   
>   	ret = __q6asm_dai_compr_set_codec_params(component, stream,
> @@ -911,7 +909,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   						 prtd->stream_id);
>   	if (ret) {
>   		dev_err(dev, "codec param setup failed ret:%d\n", ret);
> -		return ret;
> +		goto q6_err;
>   	}
>   
>   	ret = q6asm_map_memory_regions(dir, prtd->audio_client, prtd->phys,
> @@ -920,12 +918,21 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
>   
>   	if (ret < 0) {
>   		dev_err(dev, "Buffer Mapping failed ret:%d\n", ret);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto q6_err;
>   	}
>   
>   	prtd->state = Q6ASM_STREAM_RUNNING;
>   
>   	return 0;
> +
> +q6_err:
> +	q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
> +
> +open_err:
> +	q6asm_audio_client_free(prtd->audio_client);
> +	prtd->audio_client = NULL;
> +	return ret;
>   }
>   
>   static int q6asm_dai_compr_set_metadata(struct snd_soc_component *component,
