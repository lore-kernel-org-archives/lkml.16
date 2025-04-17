Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725141B4153
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906662; cv=none; b=VwBwxy1yFhBqMfqPhSDw4wIxQGmMye4oT8lKFD4kw6t4sltkkoSLNPPimgk9KiEMdViWCEBpL+kxM0AHv+H9Il1aGEZyYxxvog/NvVMKXjbjzBcl7Xw5B0N4TWCwZQE/wp+6PtcWQSv9YETOo9U+4Vzzn0+lP5vg/mscSiE4IcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906662; c=relaxed/simple;
	bh=YdyGYQvJPxptB7Ud1K9823h/vEclrujKLrEKCBQa44w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jh+fha7b+rKBKL0yJqsLsocYyEOKK0/r0PTl5WZbLEwCPuRdNrC3xNUFMsGaNOEhg3E9sgr2GOQZSfYCSpdUS9VWVB5DWoTxCpfOgOg/FH8gMdz7ru4Mx2V3PPZwTm2su/3dMcmQb8mjjsjUFyRwtkfgoLeqa0pg8h+9uGiqPc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I08ChHFl; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I08ChHFl"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-603f54a6cb5so472078eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744906659; x=1745511459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ86ga6RjrBQ4jtVg7iGsvEs2Pk/5xuTneiTlVnUO0k=;
        b=I08ChHFl421jGUWX3hDKOeCEnaE2W6myEHnSc/t5arLr/NjtnLLOb/6WQqjUeLO1lN
         Ykzpa0tDs7OOL15YMenVo6fimibiO27iVp3tNFmKtoUFjNTDPBRpv2Y1JNkY6uspB8rE
         m+D3e7Glzdtpc0Hpe+UmFVcXFgjM1XsSIM9f6wlVC4Eh6VC1kD6suIBnKgt6SPFQUTT0
         7V2vzSKFf1+MJiEG8R2g1iQzw5S2aX47IKFPAudL5k9x7ZkzC/0Gpgt+E5V4tf7ChoR2
         mJK50Oyb9CZx27ZbOcCUL/focZmNQTZt6VXq1L8c9Rj6NEGyaFtlO58rQYBKWgDXOvRq
         em2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906659; x=1745511459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ86ga6RjrBQ4jtVg7iGsvEs2Pk/5xuTneiTlVnUO0k=;
        b=wvaU6gAgq0Sh/8X5/n6hnUfQ3T7+OHS4vQUv0tEF5CO1nJoyF6LdIoMDPmuUAHYoDs
         pqdY2ZygbeZ45RMJIll6MfDRtBzsWbWXszPqewroLMLIC0RO3cWdOyopYtJDGr9zTboT
         lrGdREiuzNUBd1s5cOvat4EOrZCNn3P5wf5PWUEVEdY8ei3SMVX+lHnITA3BJSiBy8CP
         sAi81PA9Ylkwi8BKXGbvjAsfBeb6Enr1X6pb8VmsokWIOiio5M+2imusaZiohbCiUpCL
         hdSQDJ+RUiRKcjVgpJ5xlUvSPUF50BEcnbVsBRw6CMy3EPNdsB3GXAE8xgIiNS4vW+as
         J6/g==
X-Forwarded-Encrypted: i=1; AJvYcCUqw7TpE3DpEhrouc2wQzNE7G0xz5Cob98DdrpDuUYrIdqL0eOOLLo+CzRV8NBWmrKAg738FrtWETLDIdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxinalxgBI3M/JhjwVudeyk55K41Pp6Eg9xpuTBGbSqsSzIFZ
	eBj9xaYUs+MO+jACiHMGFoeOiCIoceonKt1orDUTuZE84EnF7bH8yLb1sW2JoMo=
X-Gm-Gg: ASbGncvMOE8YOeNVgWPAOFvbzT7ZzQA40J8xBHICdwitmPlmpetB59DFkIRsVWaU71w
	SxPkvP2SydzGNLKetMMdDyQ3zTXCvEaEaQRLGhzcfkeheEZFbimgyxD0SBbkLPeZsXL1GTj5DnN
	oNNLH+fr3dDCd7paX/B1CtOm6it0VAiVxdrgidsBaRL0o/QnSbQcfxRll+9iM9RZz6y4fbLrfVu
	5drPOfENDiVDUHP/C3t61JVqDsjEZcBNVjuQL75oiKnVOCUvijN+3ZxMyw+Qo1EHBIeMtQIYafx
	h6+v9ioi/4UObofLfMOVR1ivUavov1wZLgckadnOGdPZgiluFZap0meTcsD7HpqPYWq5BiPpzLq
	rwIUryjkF0+V88sgUYw==
X-Google-Smtp-Source: AGHT+IGBBgE75fsVkLXxYoZqV19j+mS6o4e4vTLZSbr9DKTQoVtLZ0+RYC5g8QIKrdP0fbpy7FLYJQ==
X-Received: by 2002:a05:6820:1e13:b0:604:6b0:c259 with SMTP id 006d021491bc7-604a931e696mr3952610eaf.4.1744906659563;
        Thu, 17 Apr 2025 09:17:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff6aacf5sm12896eaf.39.2025.04.17.09.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 09:17:39 -0700 (PDT)
Message-ID: <cd50b4eb-ef6c-4842-88cd-932042ca2629@baylibre.com>
Date: Thu, 17 Apr 2025 11:17:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: frequency:: Remove unused parameter from data
 documentation
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>, gregkh@linuxfoundation.org,
 jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Michael.Hennerich@analog.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20250417143220.572261-1-gshahrouzi@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250417143220.572261-1-gshahrouzi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 9:32 AM, Gabriel Shahrouzi wrote:
> The AD9832 driver uses the Common Clock Framework (CCF) to obtain the
> master clock (MCLK) frequency rather than relying on a frequency value
> passed from platform data.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.h | 1 -
>  1 file changed, 1 deletion(-)
> 
Please include the driver name in your patch subjects. Otherwise readers will
assume that this is something that affects all IIO frequency drivers. I noticed
you are doing this on all of the patches you are sending, not just this one.


[PATCH] iio: frequency: ad9832: Remove unused parameter from data documentation
