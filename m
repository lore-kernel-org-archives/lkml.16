Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE28111A8
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591772; cv=none; b=Yuqfbh8WRGlUUUdpvtpVJw89ZOpwf/Mv+Ea6oYPg29oRvhA6WSn2PPgOA4mDOkjahGarm9t74Zag/dQxT5G9NSDryUKB7+WBOSluktZeV4WlRuCffbPcTuqon8LhH2dyVZ9jkVLxsqmvpXkULP1++eXc53h1cgUPus1duEc8JyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591772; c=relaxed/simple;
	bh=BhDJSrHYmdsEXplQFttxlJTvYf2TKpF3zvQiKJnEhX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhmUj2fHzkKIk/7pg0+wFiB+Fd3kbpjftkd30DDH7FjN2PRzR7hrJEKMXVtCsGGWuGtAKy+PWAI1YKrDu4g1GPVuFecjmQv/7K2uSEE9i4fl4XESaZiT5FvsC74EMlovKA2Kw8KMPcNlV0F6wDFu3z/qRUm+r6hUr38HpZ/wsvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TFCn67Mh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFCn67Mh"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso4950580e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591768; x=1739196568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H4pmT0xng8YdhycWRMKJfsqizxwuIDbDyEJ81pc8bF0=;
        b=TFCn67MhkpzqQA+g0ir89xZj7fDZ+gMAKDJ6ThfRd26IrFuYoEEMEAManmrbDbOySA
         rLvIttQGiHYHmRG3dIOOLOvmKpreL/Psv0uJ7WQigmHEyOq/iZ7ToGgPFFFG8INO+aTz
         Z9cATybj4kSx2ndQukfzSiDkQ+5Ef/hppwsj1I57d3ocZEPyH9G5ybFwgqaMZQQ9iMcn
         6CFUbBeryZaVw8XFjZzuHLYHqZN8SgQ2I/L0JAeeFx7qh97Jrj8IK0N4lykGY3mbxfnP
         dDvRMk1+6lohlOxLIyflVzeeaN/++s4QVsUs2Ha/6qSYec4x23o0iu+psk7dq+LnhBiL
         WGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591768; x=1739196568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4pmT0xng8YdhycWRMKJfsqizxwuIDbDyEJ81pc8bF0=;
        b=qGT8Pn+lY0FZrtJcAAieRz5FAp6P6bDg8w1kYBgYXOOdHNFL8PdepwPo12+z22OWRJ
         fNAUl01ae3rGCSFbTMwxbaElG1rxd+qNCd3tJ5YCieX11QN31uZmAbwbaY2LwpnYku2l
         WWQus5z7tFcK+/mMJ+fH1Uzteyn3CsjlNbyocXwjNoR+YJqmST9iiQ0FsHjcSFEYQTya
         PanIPMhNIXS+mgOeZUcN0uaXfryG+zADi1ohXND2BZhrBEz8GCTLdnvMJvWvB+I1o3yA
         Tc7R0ZsT2odQAQ80bI2PfLJGsbcyM/llkX09tFkTifUjCOX91WY2We5DDUBKNMhKwmHD
         oyqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFvtt4Ty7g/WAo6HkBHg51OCYSlzsI4FiJFXyz6bBuS38px7WDm5o+xfeV1MdaFsyGLmj2cjs2HxJAjkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1huWm1hIq2Yz6xTvfSlNLy+TcLFGiUoy9uvk/kbspNhU/1LbH
	9ETvxpq03MJAsVOk1mMZ5rXFthtsixTXHe+y3ijb6s2OgWwQaeJmEJnV1zLEmzU=
X-Gm-Gg: ASbGncs9TnPnfMJ2febprT2viOQrTP34LH9Eq0/BrqMv2dttZn0HawB3+04n5NPMybJ
	2h3RsvjHsW9qWC9Mfxw4n5aaH0EmkzaZo2GoeH51nn3dAJgi9PzYZEoItxMTDxdzA3i43jdBymV
	zD6RPbl0Wg9WQ3DifcC1Iq43vK92Dbpvj1G3r46zQn8rWYjMkeRVVVltzHqDGIz+CHxV4OCD6qv
	JdQMo2VC+RosiLZ+fk6kHkYsiEWeic0Bsj2hLtliopIqSaJ8laO98syPJgf0wWwxCyVVzzL6UiS
	j4w5GH1RTHqeNUJOkqwxboheB9W54iSXDyBrRDx9VQljscto7Nm+zUCxgxeUHvoDW7Wy0Uw=
X-Google-Smtp-Source: AGHT+IFtAcXEaVrswkCO/X2ohPvix6C9anq5aWjz8V/6SOYEap4Iiw/P0CbtbcIo2Z8mkkAhqD9zAA==
X-Received: by 2002:a05:6512:3994:b0:542:8d53:5eab with SMTP id 2adb3069b0e04-543ea3c894amr5745670e87.6.1738591768446;
        Mon, 03 Feb 2025 06:09:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0f97sm1303565e87.5.2025.02.03.06.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:09:27 -0800 (PST)
Date: Mon, 3 Feb 2025 16:09:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we
 start streaming
Message-ID: <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>

On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> With the existing code, we are only setting up one period at a time, in a
> ping-pong buffer style. This tiggers lot of underruns in the dsp
> leading to jitter noise during audio playback.
> 
> Fix this by scheduling all the periods, this will ensure that the dsp
> has enough buffer feed and ultimatley fixing the underruns and audio
> distortion.
> 
> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index c9404b5934c7..148c3fb77168 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -299,15 +299,17 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct q6apm_dai_rtd *prtd = runtime->private_data;
> -	int ret = 0;
> +	int ret = 0, i;
>  
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>  		 /* start writing buffers for playback only as we already queued capture buffers */
> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			for (i = 0; i < runtime->periods; i++)
> +				ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);

So, all errors except the last one are ignored now?

> +		}
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  		/* TODO support be handled via SoftPause Module */
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
