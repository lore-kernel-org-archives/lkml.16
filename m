Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F0329898D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742600; cv=none; b=ePn5o7e+HEmEZFkbV4l834epznw6STRHgHR5w9wZzsy+bfRvdMLuZNwh4Yevux3xEaWa46Dbfm2vlo0qTvutEEh2brLCmPh4z+njpkRh6zho9npOBmw69TlhdnzAZHxzojC3oR7wjdVixQ0zhfyYxzwL3D9x5SIVe3eJXgimYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742600; c=relaxed/simple;
	bh=gfSkNsEDvHrBasjkaxzkBzgE2ArloUcp9iGt4cd2kgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZzPs17L3bBgsZFhkmyoqH1p9p4gYobt7MfhhmUZHuDHygsgU14rBqbMXX1v2xVT2jIcssZbVZsd0hUDZmzCva0HVzrJ6zL0nCX9aI3xDT7FbWxeRwaNV2A4JLkv9u8JQTgfQIWzU25AQ6Mc2Age844JTi3eJNf9UMIE8LyeIEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0uJ5zFI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0uJ5zFI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d7b50815so9476195e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742597; x=1750347397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ljv00glv7rh1spp86bQ43dOcZbrTy283SQsKA4sfY=;
        b=B0uJ5zFI/qhkH6ZrotjI+p6mYc8oiiN0iJaErTcXODlXLahWjRW1sUH766I928tt/z
         6TzRS5lI8mxv78CmC6F9KIgriOoYPu/ZVDcEHu9ybqWMNKCaenU5i9ubSZgCNgYja0/x
         8AR4ya/sTLRZ0AdummyK8u+Nd6uabmLEs9P8ZCWkgnTi/KbVnTooGFhXvGu6bOsBqJNx
         5wqtjwhYqG7wVW9prTzlHCckaIXzpsSKuhaUZUKlGc8HLwCn0N+KUnT6XalTc8DCJ8sZ
         VAQiievyRPz/qJFb2fR2FPyloJbMoLV1OjXD7F6PNgcR5aPZJwQrSF0QsSvwFBJlBCR8
         GDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742597; x=1750347397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ljv00glv7rh1spp86bQ43dOcZbrTy283SQsKA4sfY=;
        b=oVw9Q6CQrThRUtxBlCumNcGODUdTmamvC85kkkkMCMIDlMWKrf2tq7PHfSb3TpzTjp
         SA+lsaYauNq/0u89EmKB6LrCGXV8h/u2fGT1FVYOqH33AgURiu0pA362pkaB14etKspX
         wATW2LG4yNXMctpFFz9Gz6u5lVS+OrAydwsluCFeklbswU0at0BTqLmERGKqYO/0BJC3
         TJg4EmN52fL8R9t1xG+JPSW0NwU61mC1w2yLKmWE2c35gwmiIkjESJ9t6LZegsp5mbiq
         CqbFRT7/bEF430Y+9wRjR0cRQKaAaHhUl8NARaYeUy/xV0hdcNx9Vne0p12g0sVkvWS1
         OBuw==
X-Forwarded-Encrypted: i=1; AJvYcCUh9zOUa1MYDfMzPWmFxcfo06YosaTjwoJJg/8UUgzWJcKh5UX7qOIA3WMhobU4EzX/wmA3yJxgjy2DSLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEI4yuPy3NKwMoi2gYqL8DmbXQukoZSOxTIyKKQAKVJ4yi0nWQ
	qJ6zxrVYvmrKXVKsxHMmP5LigVduhaH1Le1nZazSdpUIgQTG2ncVWYRk5NvNg6z03DY/8obG5uJ
	O5JGU
X-Gm-Gg: ASbGnct+WsWjwjPm+z+P+sguPGrDZFdluzYdVR/Y9pEUNcVRM/a2H9u/KulXID7K8Fs
	pGWsuLEcB1h9QW3pMSCCayF49Jx3ArDTFn6Nqwg1Hvvg4yBfrUWGnw/LrY1/XvUu32GpKuqWg8Q
	6Q2k3eqKtDuiNWl4ul/dE/hcVBprzFX8tgdmBnQ/MjvZM4Q0fJoj7xKRpbPw8TFKCv4RF0pymWM
	G5417/JskASstzmXaBAV0B/pjj9VI51JNhPMLNqKz9OgSM5ILPqWy56cCq/mo4plFDQzYKT9bHk
	EFXyl/AW9NfY7rRmB5OGkanMykxazn0PBQE6x1hNHCCCF/GupzP3Y7D02v6R6EgZrk4=
X-Google-Smtp-Source: AGHT+IFSR8e8jVVCJqCvh7kcoUQB+Aw0Y24SkOD/mG2mZV1+q1ECgdVeqvoTrAvrNH8EzxirHatO2g==
X-Received: by 2002:a05:600c:1ca8:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-4532b941335mr36533255e9.32.1749742597338;
        Thu, 12 Jun 2025 08:36:37 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm24007395e9.10.2025.06.12.08.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:36:36 -0700 (PDT)
Message-ID: <7e4bcfe4-cf79-4b21-865d-a1248e09ffee@linaro.org>
Date: Thu, 12 Jun 2025 16:36:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
 <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
 <20250612143644.cmw6d4iiootipafp@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250612143644.cmw6d4iiootipafp@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 3:36 pm, Vladimir Oltean wrote:
> On Thu, Jun 12, 2025 at 03:14:32PM +0100, James Clark wrote:
>>> FWIW, the XSPI FIFO performance should be higher.
>>
>> This leads me to realise a mistake in my original figures. My head was stuck
>> in target mode where we use DMA so I forgot to force DMA in host mode to run
>> the performance tests. The previous figures were all XSPI mode and the small
>> difference in performance could have been just down to the layout of the
>> code changing?
>>
>> Changing it to DMA mode gives figures that make much more sense:
>>
>> Coherent (4096 byte transfers): 6534 kbps
>> Non-coherent:                   7347 kbps
>>
>> Coherent (16 byte transfers):    447 kbps
>> Non-coherent:                    448 kbps
>>
>>
>> Just for comparison running the same test in XSPI mode:
>>
>> 4096 byte transfers:            2143 kbps
>> 16 byte transfers:               637 kbps
> 
> So to be clear, the 'non-coherent' test was done just with patch 2
> applied, or also with 3?

The whole set, and then the non-coherent patch reverted.

