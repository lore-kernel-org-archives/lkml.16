Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6A61AA1E0;
	Mon, 28 Apr 2025 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745867667; cv=none; b=KZKdWx0uLMntdHhu+ydoiDt5AiU1LYJRl+TyGyS4wA/7lyK4WidDI3en2lpcPLVXXuswQPZWBrnZJTY68vy7Mvh8dYLmPhVGjZsnjplwIiwHCwFO+2qA5h2QIqwd0mTqV2zxvX9VTxarmbPHBE+ebxxnA1J4uGXDFAzvhNNou+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745867667; c=relaxed/simple;
	bh=mT089aHYmLuAke710Cc4798GN0dGqQn4LKm7PFHGJK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsyZrnvM1x3wFkVmvOCtXJCgGy/KBzcs6vdBkYmOS30UBo7ZpZxfGr23o88cSKhYTzJSrezkRL2WUQY4IDogPT9xkvSaiChvMJBnCB0cHOWNE6L8+8U2zRrHVcABl3g5bX/sYOWlLiZmBENozAaIXLWMaaNeybYj85SW0KSr3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKLT8VNI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKLT8VNI"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2aeada833so1003896466b.0;
        Mon, 28 Apr 2025 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745867664; x=1746472464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/XiREfyi5qc9JCo65dvQl61WK9aMPq6Nea/T/FePaU=;
        b=dKLT8VNIEYaqtrE0KtpQLyX5ATgk8WzBQ8ShrHodwtTabMrVW7gP1PPpHoQKaoig9p
         x+YOoW9z5g8VHtrycbWTJgTeC7E3dSNj+17sNcf0y9q5ppfZRqF+zdc3Olu8hExX+yb1
         GLdf8fmvy7N4WXFkyYuPbzfp7By9q/wnJihhV9dsiAJzEB26DRZEuJ4I2nruwEd6sH94
         XAiMnNCmqJw9agIJY7hNGf992Yc2zkXv1ztY4bTshAymC5+dQXD8Pgkj6+qxAUqzLrxk
         TNM6JNPW3qc0pRO9P2sk3VBkXGOKW7FIk1aHRum5wBswpcL9ldNHJucQM2JKSDaIPlaw
         B9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745867664; x=1746472464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/XiREfyi5qc9JCo65dvQl61WK9aMPq6Nea/T/FePaU=;
        b=gRZ1lFoHqEuPKhHOLRZuAM7jsfI0CFZnC1cU6Lze3CARysg472/K7qWWo0zKxrRDhR
         w8g8xmWaomCz7RUt/9rxn5ugXD55aW5DMIJ5ia16vO3Utws7J8q0clowISatrc/5z3pw
         7esrZGEAfq6TZ+Oc2HbMJd9kOZIoCCZDWu7/CnkJCq+HrS2yxk6/knGqawWJ/fny0hw9
         IL8aUqRkLClnWeIyz8hu0VEOURLxIbIuV8MBUnY2TXhTv06mlTvxi0de6/BIAb5t3KBm
         p5ojEDx0Pvz7iuLXqClhzM7/OiklMLaU5HYEKZ4VgMoJQW1ugSozW3iiWpb5h73exogL
         g3dA==
X-Forwarded-Encrypted: i=1; AJvYcCXavPHKUlQ/3jNQximniU/qQs3Uqw9MoEmVz/J92zPUVigw+hSON5lHmagzbnDY4N58ptMl5C7WBVJYv1Y=@vger.kernel.org, AJvYcCXxs/o5LUrIYycZk2diFw8TvuqzCAKSgAP4VQ6r18molQ078Wt3D0AnfDCLXqUicC/RIwW5I97bdYTGXx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUGqsYA4twaQNK/KY9xilXAd7z2ZgMUM/Uy7QvE0TlUnuXBTtL
	3sQkVmBS35zn1ZNb4StBcCLVsNXcMtqWqb3Iq1dL7gHzZVqhIm4s
X-Gm-Gg: ASbGncvkPK7G95o8+ITEln0RGTERil8IQexPtAugTrx8dnDPGvHaPONT1BPoWi1PTFE
	jg+Ln4wpHgX1a0YYmXX1igyRb04ciQy87tVWKFWQNP4O3f8YbXCdU+lb9/wcaEdar2CRExKEEcJ
	/CH8Nz/+t9FIKYHJazFwXmhVYsjI5RLmq0lOYXoPYXUEsp2iYxnqxoP/P07SchZ0eJIh8yzURPI
	wg3fxYCIkPtFNc5gQpaAGlsS54fc4lyMnHBpM4dhOLho0/rLq76u0zsQK0jpkgfWZNlRxS0O0VY
	rR1j8hxfli03+aXocE8B51oNMAr8ZlBs0kPby8jfSVicni/cxz/xRGKSTFAzL3ywJFRmbcUbg0e
	yUwvc
X-Google-Smtp-Source: AGHT+IEUoXqS2/nHfqxkAVo1FJB8JI3Woca1wrz/Df0wld3ytV0qV7YwibBGa/o994QW4GCqquvSsg==
X-Received: by 2002:a17:907:2d1f:b0:aca:aeb4:938e with SMTP id a640c23a62f3a-acec6a2689fmr36719566b.8.1745867663655;
        Mon, 28 Apr 2025 12:14:23 -0700 (PDT)
Received: from [192.168.1.128] ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed65410sm662857866b.126.2025.04.28.12.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:14:23 -0700 (PDT)
Message-ID: <59e93077-9882-42e7-bc13-21d60168963f@gmail.com>
Date: Mon, 28 Apr 2025 22:14:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: topology: Fix null pointer dereference
Content-Language: en-US
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Liam Girdwood <liam.r.girdwood@intel.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250428-fixup-of-sof-topology-v2-1-7966515a81b7@collabora.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250428-fixup-of-sof-topology-v2-1-7966515a81b7@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/28/2025 4:32 PM, Julien Massot wrote:
> Prevent null pointer dereference in snd_sof_load_topology()
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
> ---
> Changes in v2:
> - Better commit message as suggested
> - Link to v1: https://lore.kernel.org/r/20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com
> ---
>  sound/soc/sof/topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index e19ba94f2c80a43731b90351bacfde2720db50ed..5d3ee3a86392c5a3fbfd05f83acc99b102c8cf61 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -2481,7 +2481,7 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  	if (!tplg_files)
>  		return -ENOMEM;
>  
> -	if (sof_pdata->machine->get_function_tplg_files) {
> +	if (sof_pdata->machine && sof_pdata->machine->get_function_tplg_files) {
>  		tplg_cnt = sof_pdata->machine->get_function_tplg_files(scomp->card,
>  								       sof_pdata->machine,
>  								       tplg_filename_prefix,
>
> ---
> base-commit: 80626102e730787e2cdcab0e36d267bedcd1a63e
> change-id: 20250428-fixup-of-sof-topology-50886568a785
>
> Best regards,

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
