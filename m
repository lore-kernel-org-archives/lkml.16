Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE78E2E06C2
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079761; cv=none; b=OBMGd+OoTXau9djmECkiaRSXmJ88MUjWw0Fvjj7oSeudP+GwmikFd9P4stSW64y5Ar4ocmXzaTG+stXkFcCglyWwBDRriRHcTK2gdbwqWRNMjhBG8jcNV0pgVEBWm12vmbcS3krBUskY2UVWkN4MD5bu8fxf922A8ZeLHYfV1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079761; c=relaxed/simple;
	bh=5hRzPTtmBcuXKvnr1u8SKXzEFc7yHR0Ah2bvFxcA2o8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WbToxIO59CuWrveNvP4aRKni6Y9g1MKOx8xPPnEvmi/Yxo4wuu5Wk0FeWmaFA4juUJfKAncCQHnkAwl4vehmLnxRLffQanNQwbPrgBDxZnjkNJZCb4aYgPR/VMX59XKwY2gcaus+jeVpd+4nfMrPRS/2KD5MOnISvbR8FtHT4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xce6Gk8n; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xce6Gk8n"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2570607f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750079758; x=1750684558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MRJ1d1h4wdrkCI/v3DN5wRcdUPl+ITQvSsG/x26pFEQ=;
        b=xce6Gk8nG17wGr8vmmjdHewLBacu6f9B3boytHnf/sQd4QQx/+XPtZ90cARC6j0Yee
         4B2E+LjCrh21fs2GJTshRGJTFIgRBtTzOjMI6jI4NadPeiV2m4GRITaH0yaoxIHMo5Ss
         KQE4cymEVrHwygvTLVQ3vxBAh2Xda9CsianNXOUtjSGH+n/8htXhtAsiOy+xzavWGDgN
         ZMaXdJXDVLbtedlYhVWul8TtAgd4yvfaljFU7e7++7Ml8HhOBh5mPBlYkJeEOvGxiOU4
         toMkhoxBzTrpTHn+mIm8B7vGfVflM7OZ+bxAA8e4c/A67H3OLigFFmcUp6mVhzRvbAF4
         ICHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079758; x=1750684558;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRJ1d1h4wdrkCI/v3DN5wRcdUPl+ITQvSsG/x26pFEQ=;
        b=IhQsRSpyMlkoXavvM/SZwtUEGTOsBYFocHliSThFoxqHqbILe9+s4xAA4y5w8GxoNF
         ySyayLe3AvU+oiJW0haGlsS5V7uJFKTV8dcYmioJNsc0O2XDJaZJSyyuk0c2E9y0mHgB
         QyZZDYF1Li7+onPzf5ozGrB6vr9wM1dy76mqJ4OoSQepcVK1taJ7LNbAwXlwMHEu7yjm
         BGT38lcRXN7PnvLlxy/C3El59PwXUMcb2SLavKv1dErBf9nOUAGQVUPilSkXujd6D818
         0FaW+y2DNC1auqo+hYugt9JnbggLBIvWd3QJ3ykE0NncTJaO7UBWbgiIjLGHG/ozdpll
         Bc3g==
X-Forwarded-Encrypted: i=1; AJvYcCWbeB5yeXZgq363h2YwS4e/t3WrtxCG82lj6q1A5c+XayoXGk3Ozye465TPJr2FQs+zl32g4+5eNUXLN5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61d+uQiEBX5q7KlsRsg54o5PkRia50qm+7Kr/272Pu0RpTLGt
	Vwpz1MFZG9t79D1p4Uf4iZ5hwrOZ+a9rz2gt9rtU2U2BoOzqfnRE2tpibzXSQyQAPOg=
X-Gm-Gg: ASbGncs0W6NWdApTTbknXIiEkEz0lYWSB9YDQec6KpxMfItcj7OcBlFt9W9/9d5Z4xt
	MhmG1Lcr1yGM0Fd+cHcnoIkRSHqMKK2Fuj5w60m4dNFM5epv0cxhzZ2n/SuRf68BtVj6PXGlAAv
	AdAz/nW57Xq9LcJYQIwsaktYq2KlboaNRE7MtJAOiWSvngGPbmgo05r1CDglMg4mpGMBRZrVI2s
	q/A2n2uHagsvyu6cHmWTUKhH+s0uqZucs+vGjSPqvJWXjMqgLxHwNMB7oLuF1sc1JF0w9qsD2vo
	9Tvo0Co4/6aTGogKWXVojrSYiQ6dNRcBIPpVwHMXH4rflfBkIJd0HvL2k92GxjORGqM=
X-Google-Smtp-Source: AGHT+IGAmjzfqrOCVqwqF8zQeuRiuJlPPFK6JjwkpluH+DPJPa87BVcnTa2cfcWuNNx592BuRyZiZA==
X-Received: by 2002:a05:6000:2585:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a572e99648mr7009457f8f.49.1750079758052;
        Mon, 16 Jun 2025 06:15:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm152625665e9.1.2025.06.16.06.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:15:57 -0700 (PDT)
Message-ID: <d16bdc40-20d6-49db-bf41-18bb9b8e01fd@linaro.org>
Date: Mon, 16 Jun 2025 14:15:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
From: James Clark <james.clark@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Mark Brown <broonie@kernel.org>, olteanv@gmail.com,
 oe-kbuild-all@lists.linux.dev, arnd@arndb.de, larisa.grigore@nxp.com,
 Frank.li@nxp.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <202506160036.t9VDxF6p-lkp@intel.com>
 <20250616111749.316413-1-james.clark@linaro.org>
 <20250616112927.GA21689@lst.de>
 <5f1ca0ac-b66c-4b92-8f69-027c2468b117@sirena.org.uk>
 <20250616120832.GA24959@lst.de>
 <2d62254e-5cbe-4174-95d8-e80cae4f4543@sirena.org.uk>
 <20250616121444.GA25443@lst.de>
 <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
 <20250616131346.GB29838@lst.de>
 <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
Content-Language: en-US
In-Reply-To: <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 2:14 pm, James Clark wrote:
> 
> 
> On 16/06/2025 2:13 pm, Christoph Hellwig wrote:
>> On Mon, Jun 16, 2025 at 02:10:40PM +0100, James Clark wrote:
>>> The change introduces consistency with the existing declarations in
>>> dma-mapping.h. Surely there is value in consistency and it doesn't do 
>>> any
>>> harm to define new ones with stubs the same as the other ones. That way
>>> when you change an existing device that has DMA stuff to use a new 
>>> part of
>>> the API you don't have to predict that it will behave differently to
>>> another part of the API.
>>
>> Well, redoing the rest would definitively be nice, but so far no one
>> has signed up to that.
>>
>>> I suppose it is possible to #ifdef out the DMA stuff in this driver, but
>>> IMO it would be quite messy, and I don't think randomly not stubbing out
>>> some functions is the right way to move towards fixing all the 
>>> dependencies
>>> in all drivers. We should continue with the stubs for now and fix whole
>>> drivers one by one as a proper effort.
>>
>> Does the driver even work at all without DMA support?
>>
> 
> Yes it does, it has a few modes that don't require it. Presumably we 
> can't just add a depends into the kconfig for all devices because they 
> might not be using DMA.

*for all the different variants of spi-fsl-dpsi devices I mean

