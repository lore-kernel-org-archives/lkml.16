Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F6F273818
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373772; cv=none; b=qhIVIzl3Hl4E8ltHrTFVFLTuC4aufiu9bBzEBvFyNwvi4EZgjBGNkHwYInyLysThP9CVaTrDbYrqAr1sFNn0K0Rbstejh5KFlt72IxMIu1UqdZwJLOg7tl4xxyI1+lDEi0oKzRQeJqLsblnLfp8iEGdnTHpRj+IWPgUnLryGbC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373772; c=relaxed/simple;
	bh=2USRWzkHY9LDDjXfilZDHGMHlXswQOI+HCwfX1yZ/fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1InEB4KaF/VC+d2C8SH/BOlwRn3iV/BehM8TAQ2eMWLPwSgwsBIEi8k2+Jsno5kCsjmT76rEp1jaLxsrKX8TzV2ijVIUxjqVFi9DwKxYdMasw3AzHbGpBGeO06+6g8igYukfYrzp3X1fAIDd16nupzzcYiQADjFuH56R5A+a3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NYDyCiv9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYDyCiv9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453749af004so30455825e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751373768; x=1751978568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tsVCbz5zR4RqV+iuMQyZvIjkyF6mk+aRWwFqzLZi86I=;
        b=NYDyCiv926Zb84kMYRq3uZbh463JS8dlmsszVdO0HJn9tp/AEP5v8F/g/8DKLN/4Cw
         VyPb8qPp1fMjYWPoOZWYQXyAGU4zZGu7mHDM2fg92+LXF5OWF67ibrV0tBbqbBplHAhw
         VdytyFQIlL5X50n/dX7hXGhTcoDpVTRc2+DhphvFdkkULZ97vH7xZY0O4rt+zsow4XBU
         +rDwTxHngLpHSDJbQmfgKuLQ47AhbMTvq/mv4JzePdSnGXxM6ypulGss3/HuarIFhRZc
         S2ux9W4UhGHY+cYqTHacrZ8VlTe+qZ0USK3flaWS26paJyoSYbowGOC98M4TdE/KwDzB
         7biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373768; x=1751978568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsVCbz5zR4RqV+iuMQyZvIjkyF6mk+aRWwFqzLZi86I=;
        b=MCQbDCxUtvH2y8323d5sSFr8tIc/2kVxNQLz5oGu8qCKsEaiCMKeOMSYrDN4hL95kU
         CLYa5xqzNJhyaMx3K5bB9Auepn7EgOZym/UtgawN1KfPIZY2mxn6s8aoOfQANC5GwD4T
         RyTJkYKJE8qZwOkPE9VQ0DRTAyAN516uPfttrf8aerSq7CdChd8QiWjprzg35edY3B+b
         QhWkExQrdOSNPtub47UTZevC+FeSP2JFcm3xC2tfcjK/JSv5hwhAcschd177xcnv/ZlL
         yPj6rDL3FLX537/h2NOgW0LfBYTeiHV3I2MXbWhClG4/PGEz7EUNMnU1rjViCEE2d3Ur
         +CQg==
X-Forwarded-Encrypted: i=1; AJvYcCUV6rXVDx4PDia83az5lmNQMpE06NiFK0ZSjVDVwCRLzYuXbFbQGX/j1ew3Nt7lSrE60XpnjDTRBC63Y7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmXu6BANP0KQYhZL5GNejwMgSmVR0NT/bq8rmEPUPlB1PWvUz
	9R+Z8fuCkCIjBXraj3Qnz2HbNSS18ENctT3ZSoyQG/XTMzFmqwDS3y7o0aOs+jiE+68=
X-Gm-Gg: ASbGncvaTPuR4sEtzt2YkDlKjKveGdCA37rIQYMJNfeZ5uhOIcIqkMcKLOuZZci32hf
	HkE4FLH5YZsqKuW7zrgTcUYWW2m8fSgIa1anQ7UVqNdEMExEohDcAJgCVBNCFBeHDA64ro5bFgV
	x4eGIIZO33U7xo+Uj+nYdDYW9/kKD4bgQElLUgUD8KBrcOCQ+IDIWC//Q0PKc8cGGhh7b3ahUFN
	r5Q0pnZdWa2JjmIRP15d9e5q0Tso8S/XrFY5SQNFu/5X8LaLSCKE+VO7GXEPaG8lvp63YDRJqRM
	Lntw6oKROh2/gGm+EJNAYzsM3mzC29k1Be2bL0m9yVo5PVmM65XtGV+iSkiHwkV6nm4=
X-Google-Smtp-Source: AGHT+IGzGtmISDr4u15qcknVybwuXswS0vgnEq/kCyZSCSHrqvkYh2GXlp+x4RvRaQKJVW3fIdsSmQ==
X-Received: by 2002:a05:600c:6986:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-4538ee278d6mr164093505e9.13.1751373767557;
        Tue, 01 Jul 2025 05:42:47 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453966eb3e0sm104937695e9.28.2025.07.01.05.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:42:47 -0700 (PDT)
Message-ID: <c9bf945b-9fc6-4829-addf-2fb7a7d4eb36@linaro.org>
Date: Tue, 1 Jul 2025 13:42:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] spi: spi-fsl-dspi: Target mode improvements
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250630152612.npdobwbcezl5nlym@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250630152612.npdobwbcezl5nlym@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 4:26 pm, Vladimir Oltean wrote:
> On Fri, Jun 27, 2025 at 11:21:36AM +0100, James Clark wrote:
>> Improve usability of target mode by reporting FIFO errors and increasing
>> the buffer size when DMA is used. While we're touching DMA stuff also
>> switch to non-coherent memory, although this is unrelated to target
>> mode.
>>
>> The first commit is marked as a fix because it can fix intermittent
>> issues with existing transfers, rather than the later fixes which
>> improve larger than FIFO target mode transfers which would have never
>> worked.
>>
>> With the combination of the commit to increase the DMA buffer size and
>> the commit to use non-coherent memory, the host mode performance figures
>> are as follows on S32G3:
>>
>>    # spidev_test --device /dev/spidev1.0 --bpw 8 --size <test_size> --cpha --iter 10000000 --speed 10000000
>>
>>    Coherent (4096 byte transfers): 6534 kbps
>>    Non-coherent:                   7347 kbps
>>
>>    Coherent (16 byte transfers):    447 kbps
>>    Non-coherent:                    448 kbps
>>
>> Just for comparison running the same test in XSPI mode:
>>
>>    4096 byte transfers:            2143 kbps
>>    16 byte transfers:               637 kbps
>>
>> These tests required hacking S32G3 to use DMA in host mode, although
>> the figures should be representative of target mode too where DMA is
>> used. And the other devices that use DMA in host mode should see similar
>> improvements.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
> 
> My test numbers on LS1028A:
> 
> Baseline XSPI (unmodified driver):
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 8 --cpha --iter 10000000 --speed 10000000
> rate: tx 2710.6kbps, rx 2710.6kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 16 --cpha --iter 10000000 --speed 10000000
> rate: tx 3217.5kbps, rx 3217.5kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 4096 --cpha --iter 10000000 --speed 10000000
> rate: tx 5118.4kbps, rx 5118.4kbps
> 
> Baseline DMA (modified just DSPI_XSPI_MODE -> DSPI_DMA_MODE):
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 8 --cpha --iter 10000000 --speed 10000000
> rate: tx 1359.5kbps, rx 1359.5kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 16 --cpha --iter 10000000 --speed 10000000
> rate: tx 1461.1kbps, rx 1461.1kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 4096 --cpha --iter 10000000 --speed 10000000
> rate: tx 1664.6kbps, rx 1664.6kbps
> 
> Intermediary LS1028A DMA mode (using non-coherent buffers but still
> small DMA buffers, i.e. holding just 1 FIFO size worth of data):
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 8 --cpha --iter 10000000 --speed 10000000
> rate: tx 1345.1kbps, rx 1345.1kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 16 --cpha --iter 10000000 --speed 10000000
> rate: tx 1522.5kbps, rx 1522.5kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 4096 --cpha --iter 10000000 --speed 10000000
> rate: tx 1690.8kbps, rx 1690.8kbps
> 
> Final LS1028A DMA mode (with the patch to send large messages as a
> single DMA buffer applied):
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 8 --cpha --iter 10000000 --speed 10000000
> rate: tx 2247.0kbps, rx 2247.0kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 16 --cpha --iter 10000000 --speed 10000000
> rate: tx 3477.4kbps, rx 3477.4kbps
> $ ./spidev_test --device /dev/spidev2.1 --bpw 8 --size 4096 --cpha --iter 10000000 --speed 10000000
> rate: tx 8978.4kbps, rx 8978.4kbps
> 
> So after your patch set, DMA mode on LS1028A becomes more performant and
> should replace XSPI. This is an outstanding result. That can be done as
> follow-up work.

I wonder if latency could be higher despite increased throughput? It 
probably wouldn't be a big enough increase that anyone would care. And 
based on the structure of the driver if throughput is higher the latency 
might even be lower.

