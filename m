Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F019049B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737678; cv=none; b=VBzFTHhXk+5n/6n8sJYTZ0kiy79cWDiD5ULGkW2nkSWRvItCtELwMZkzxLg0gCwMUqwg23Ljq7zmy5/UJaAs2m5QWs556GcbempYxqe912loyjWMGFdk4bPbKm3Cls7CqwBHKmVdMgEBhjtKr8DPyS4GoylYEKv1j6268zukKRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737678; c=relaxed/simple;
	bh=60WDQiWn4ERcM4sXmxu8hCFJPSCd2H/JsWpNpGO9EBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jqe1rxHvg3sS+sA2KHq8GfiWXDRuJbxT3hrS8PqSpiXaJ1kgvpvJwHMW/UgXj8MexgnALfS2pQwakiIlLe/cwMgYKuyiXxQ63v7a1PAmGfJZB0jovHatmJCxWfKNQzkyCG1ZjMDK1B9c7JLrpor3VaNGhhLdsafYkQXEFXMWQNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZWc7a+aQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZWc7a+aQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450dd065828so7603555e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749737674; x=1750342474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J19QzIs1SpN2V+Z84587yjfC+A6S3Z0DqJUi8/rsIps=;
        b=ZWc7a+aQHcTTvXzje3+dB4qw/TBms4ehHn53nXBEU3WJGPqi7w60eTsKpF8fcQxGIZ
         Iox5Be8J+2c/nDpwqfmJ+ii2k0tiuD7IaQ1YFlMlvu9o0Ux9h1wNNt1NQ4QOfxpX85gc
         YZrYkdqaPKbVA/sTC0QUHandbm024ofuExH0tBPBV32J6PeETfrirOm7OApkodq7jQr3
         Nb3WF3Qfikwf2p/ZR6NQPTulQ99Am6j+dey+adTYJwDHne4VG+9HngY3WFc/Cl1ZLn+h
         UVjbXNBYurr0/ahOKwndgA4Tc9wwwkcnqYKDQR/KKt9vqHBf4AaEgsZM3RREthzjiNoH
         BGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737674; x=1750342474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J19QzIs1SpN2V+Z84587yjfC+A6S3Z0DqJUi8/rsIps=;
        b=hv+tb4EYcnOHFnnGefEvPgt81EmUxev4e/vHoiHSUfw0ahejTEd3aoD1GY84l2oDO+
         F5kAam2PmcDeuzQbjUkgnt935KI1m4O08UZrCdBDzail8/PfOGZE3NdAlyHuUOhJoJ7j
         wWXhCTT5X4OZBlE8hqSgjmFCT6Pyx0kRlJo6Rm0ABBvFo6ODa9n1+F1/phYWmhyVZw8N
         r3tYQNr2B6lDhD2o1Hx8Dv8JuSwwufCV8pD9HqRt3/HYMWk1KQ9IwRDUN+oBBJLi1bAZ
         OjgaQ32joKZLV/MNe54hmkEEcTVaq4kceykoLBx/EvRQOu7ll3TGwVbphq5BkqT6/MqC
         F39A==
X-Forwarded-Encrypted: i=1; AJvYcCVDOXsvFNeWvVET06jNy8Z4viLSsK/UAQ6CdgkOlVfIB1FlUbcYRpwCf2yCDbsCxG/mj/vh6qBQ2FXLaaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDIR/dYrEmjIuHocG9KE5M9aw+gF5O3S9t8kbc5q3n4uxjwdH8
	d4dLHx5hoYmzqG0+wzEmA7cV20oxD9NxCQIVkkCOlZrAm3MwNRtoYRVtycZpbQpxmAE=
X-Gm-Gg: ASbGncvRQLcLDhEcQL/BMh8eAYXjEaY+1m53fDYE4d+yMtKbYrvAtBF7/Qj2KUjRZIT
	XAnXTOq69G+Pm4+jBoxEX3DAlLSS5QWtBOcOGKf6h9prjndMkGdTKfKBTzp70ZcKpQlSIc3B+Hi
	DgWC6WQPArJlNWCn3c1lYzptlQKIi3bq7xvjA7VgrRjlFUvUg2QSiVSncF237EsIBIjjNZoSiZr
	7q78ulvct/Rw8YxIrDLsKkeZNHxDLOaNv0MOzIJRQdFWUuao1KXzmZ4w3JqPNaGL0XXXwlIre7L
	X7B3GXeEflZ9YHvPXk9j190Z62Tb0yADrTgpa8PnIxj1TdRGmMOOI0H/K6WQsP4U8biFVzCyFB/
	r8g==
X-Google-Smtp-Source: AGHT+IGMvfoiQPigVo7iO2Dw6iilpFxrDO4WGsQDGLouqfPnH55vE1SO0OF49/vNlZbAzHfxJoNlPQ==
X-Received: by 2002:a5d:64c5:0:b0:3a4:d700:f773 with SMTP id ffacd0b85a97d-3a5606a2f5amr2978490f8f.11.1749737674171;
        Thu, 12 Jun 2025 07:14:34 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56198f827sm2077031f8f.29.2025.06.12.07.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:14:33 -0700 (PDT)
Message-ID: <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
Date: Thu, 12 Jun 2025 15:14:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Frank Li <Frank.li@nxp.com>, Vladimir Oltean <olteanv@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250612111514.rfb3gpmlilznrfxs@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 12:15 pm, Vladimir Oltean wrote:
> On Thu, Jun 12, 2025 at 12:05:26PM +0100, James Clark wrote:
>> (No idea why it goes faster when it's under load, but I hope that can be
>> ignored for this test)
> 
> Might be because of dynamic CPU frequency scaling as done by the governor.
> If the CPU utilization of spidev_test isn't high enough, the governor
> will prefer lower CPU frequencies. You can try to repeat the test with
> the "performance" governor and/or setting the min frequency equal to the
> max one.
> 

That doesn't seem to make a difference, I get the same results with 
this. Even for the "fixed" DMA test results below there is a similar 
small performance increase when stressing the system:

   # cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
   1300000
   ...

   # cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
   1300000
   ...

   # cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
   performance
   ...

> That's why I don't like the DMA mode in DSPI, it's still CPU-bound,
> because the DMA buffers are very small (you can only provide one TX FIFO
> worth of data per DMA transfer, rather than the whole buffer).

Is that right? The FIFO size isn't used in any of the DMA codepaths, it 
looks like the whole DMA buffer is filled before initiating the 
transfer. And we increase the buffer to 4k in this patchset to fully use 
the existing allocation.

> 
> FWIW, the XSPI FIFO performance should be higher.

This leads me to realise a mistake in my original figures. My head was 
stuck in target mode where we use DMA so I forgot to force DMA in host 
mode to run the performance tests. The previous figures were all XSPI 
mode and the small difference in performance could have been just down 
to the layout of the code changing?

Changing it to DMA mode gives figures that make much more sense:

Coherent (4096 byte transfers): 6534 kbps
Non-coherent:                   7347 kbps

Coherent (16 byte transfers):    447 kbps
Non-coherent:                    448 kbps


Just for comparison running the same test in XSPI mode:

4096 byte transfers:            2143 kbps
16 byte transfers:               637 kbps


So for small transfers XSPI is slightly better but for large ones DMA is 
much better, with non-coherent memory giving another 800kbps gain. 
Perhaps we could find the midpoint and then auto select the mode 
depending on the size, but maybe there is latency to consider too which 
could be important.

