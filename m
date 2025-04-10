Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F42040BA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267310; cv=none; b=sx+be/illQb7nV5yU67RsikCRxHuZiphwvs98U7vq6cZpUY5YlTA7gLyz/Td1TIN7j2BxfG3qMA/GB91N8+jyu//Uq/HYn+7INX5G4rCvXu3CH7zLy1eFaVmvNVfDCMLCDcO/iLoEqxmxIr1tCMrzfVY3WLh+801+X7rLZQ17Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267310; c=relaxed/simple;
	bh=eKWdlsR+gZq/WMnwiDfDDPjy/aOdQaKP5Tog0oX8hXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cout7K4xCDb7XYOh+hvPYTE+/FNut369r0p/y8mhn2mMPWMDP0D64VsHZeZjIAAcnQqtOHCDqa+C/oE045Sc0oeTgismIhZBYWOR54yGmpf51dl26qQAJabBov+5uMGRSyVWPuF2bTEe2iLI3jnmlLc3aFd7JPi7AAS1unlirxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dKOfMOT3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKOfMOT3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so89839766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 23:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744267306; x=1744872106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sbl05XNjXwXIwA7PmbRBkyTSHc10MQi0pg5RfqUxRjQ=;
        b=dKOfMOT3zf19q3/SaMp71AMOwSWNO+Nymp479U1orkzGBNoTOt6WawgFtJ6autr5QO
         EESJW7gb6g59d1iRQ2+BPF2n63YmmYpo9hJfAH9Hvc/9n3uoZoeb/AwD32pmzxpBsHws
         eV2yZM6VnR78EFytfqT/yyBBms9rJ0p7Blo0ZJ0eiODVswhjE3reinDNrEiNIVZVwWF7
         zMNAk9xdevU4bRWduYuOu5Gv2Kx0DVOvYWSdMJY8oznb8N4ELKGxFEpts/SwsLaa/Xhu
         u9fxOhvRYoO8OHI7O6U/6HDCqVsdLgLsfg9Xfs/due7Vbt5NgDBp8AHTr5SHKQd0EbZt
         9vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267306; x=1744872106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sbl05XNjXwXIwA7PmbRBkyTSHc10MQi0pg5RfqUxRjQ=;
        b=pM15GHIEaTQGcYHDjqHEGU0GsbVS29W8Bm6kuiLdaG0HXZxcJPZlqGXA+Q2ihgMuxn
         59oSA7zCth8uGEgrsM3K7GaviPzXZipNLU1vw2AtCBTiJ1XM8Begbud+lMij9Cd2VwSU
         yA+zHRHDx9gw/dnyw20Hnp5AliHhrraUcM/63uf3w3uOSyQJwhVm+C32vK24njGBrbjt
         +tvgas5ec3P5nV6Jv9ExSwClUKx7nFWy0UoYitQO/kYt1GUZKAYpHCvgcDvzQ9f01YJn
         Shb55jcCOx2W6g7WeqiFnVZFlVWGwMKlV1Gydn1zWV5+/bjcC6tn6fPY+sycWr9TMGe5
         ONzg==
X-Forwarded-Encrypted: i=1; AJvYcCW1rUwvxxdmFcin7LNbbI1f3Ki16STLcrQSvrb1aiIn+yPbYE2xinl93iHb5pRUvga/tKju+xD193CPat8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCW/tQLT5cHxi1FDlKqrzUM28OXa0O6GQvP3Y9SJQxfZb+ThG5
	SV+SvqhKT9RG8wpsEvg9gS0RVrB3IA63/Ozq87lqAhxDdprZY67KYYmNaa5qMSM=
X-Gm-Gg: ASbGncvbIqSbjCN5DJxvSVMaL3cr6i+eoQ6vhu8sJzpLRaakaj/wuGPBneOkABGYdbq
	jW6VZyFZDqTQZpBQ+j6ztd9u44jgZENDWpBYyPobNBxOBjB5956Cqv3olSgi4POPIW/5r7fIkwZ
	KobIPO3nFzP2QWFFhTcu4XM10KPM4vpPLEKveMGLfsT24yReQcq0jnrTUn1X0rDdnB3MhccJECW
	dHDwEZZJm7uqh8pw7a8NdEIpmFq+32T9GTHQpUSlKOaL0JFQbOv8delbb5cVX9cj5nk7Vo+FvN0
	H4elDQsjHn2rqJiZP4Cyd7eXtzSzKBh2jef6jJwkj+zKLubNmfTV/ETOi+klUA==
X-Google-Smtp-Source: AGHT+IGIijzSQTIvNZFHk1vd6j481tQc4BPdHGyE68UEhUubBExhKjE2Tspefm3pBMUpCnsjgm2sQw==
X-Received: by 2002:a17:907:3cc3:b0:ac3:afb1:dee7 with SMTP id a640c23a62f3a-acabd20d17dmr128884466b.28.1744267305615;
        Wed, 09 Apr 2025 23:41:45 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:ae8a:4fb8:9c71:6be])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9632sm221324866b.66.2025.04.09.23.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:41:45 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:41:40 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com, tiwai@suse.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 26/31] ASoC: qcom: qdsp6: Fetch USB offload mapped
 card and PCM device
Message-ID: <Z_doJMXjSFHt6eAp@linaro.org>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <20250409194804.3773260-27-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409194804.3773260-27-quic_wcheng@quicinc.com>

On Wed, Apr 09, 2025 at 12:47:59PM -0700, Wesley Cheng wrote:
> The USB SND path may need to know how the USB offload path is routed, so
> that applications can open the proper sound card and PCM device.  The
> implementation for the QC ASoC design has a "USB Mixer" kcontrol for each

Is this "USB_RX Audio Mixer" now?

> possible FE (Q6ASM) DAI, which can be utilized to know which front end link
> is enabled.
> 
> When an application/userspace queries for the mapped offload devices, the
> logic will lookup the USB mixer status though the following path:
> 
> MultiMedia* <-> MM_DL* <-> USB Mixer*

^

> 
> The "USB Mixer" is a DAPM widget, and the q6routing entity will set the

^

> DAPM connect status accordingly if the USB mixer is enabled.  If enabled,
> the Q6USB backend link can fetch the PCM device number from the FE DAI
> link (Multimedia*).  With respects to the card number, that is
> straightforward, as the ASoC components have direct references to the ASoC
> platform sound card.
> 
> An example output can be shown below:
> 
> Number of controls: 9
> name                                    value
> Capture Channel Map                     0, 0 (range 0->36)
> Playback Channel Map                    0, 0 (range 0->36)
> Headset Capture Switch                  On
> Headset Capture Volume                  1 (range 0->4)
> Sidetone Playback Switch                On
> Sidetone Playback Volume                4096 (range 0->8192)
> Headset Playback Switch                 On
> Headset Playback Volume                 20, 20 (range 0->24)
> USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> 
> The "USB Offload Playback Route PCM#*" kcontrol will signify the
> corresponding card and pcm device it is offload to. (card#0 pcm - device#1)
> If the USB SND device supports multiple audio interfaces, then it will
> contain several PCM streams, hence in those situations, it is expected
> that there will be multiple playback route kcontrols created.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 98 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index 6634e132787e..274c251e84dd 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -134,6 +134,103 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
>  	return ret;
>  }
>  
> +static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_pcm_runtime *rtd;
> +	struct snd_soc_dai *dai;
> +
> +	for_each_card_rtds(w->dapm->card, rtd) {
> +		dai = snd_soc_rtd_to_cpu(rtd, 0);
> +		/*
> +		 * Only look for playback widget. RTD number carries the assigned
> +		 * PCM index.
> +		 */
> +		if (dai->stream[0].widget == w)
> +			return rtd->id;
> +	}
> +
> +	return -1;
> +}
> +
> +static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dapm_path *p;
> +
> +	/* Checks to ensure USB path is enabled/connected */
> +	snd_soc_dapm_widget_for_each_sink_path(w, p)
> +		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
> +			return 1;

I assume this also needs to be changed. Please make sure you test the
series again. :)

> +
> +	return 0;
> +}
> +
> +static int q6usb_get_pcm_id(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_widget *w;
> +	struct snd_soc_dapm_path *p;
> +	int pidx;
> +
> +	/*
> +	 * Traverse widgets to find corresponding FE widget.  The DAI links are
> +	 * built like the following:
> +	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*

^

Thanks,
Stephan
