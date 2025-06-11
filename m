Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD9253F08
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633181; cv=none; b=SGxxSTe+AZzJSEh6K9s2P7KTA3SGiPW+BM2dzMi7ecgEQkaoOUUntvXB1h1Vrj0eT2jVPkDRqzzV8pRFTsOXGBuslKfg1pBWN/XH+no4MxCuU+/D63v5sbi1D7d4KZNXnRCiKAHJB3sCA6O1pobegjON6HHJ87QRAAVf9ENAEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633181; c=relaxed/simple;
	bh=26cUrdOcAuBXKmX7HJ2RoGTESx1cYCvg3/jc7ibH4rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Myn8xE25NJ2nKrFCMmMv6fn4vPrRzF/W1EHL27ncJKRZsA5BoTaZUsVPYio3xBI4dGshg0wLp5vuv4UhOme7f8rIaGqRJ7dZEvABhgKtY+3UqZehQuYtJGFjU+Dweh5EXeq2OBn5mMy2ZunIM+dqMBZSv5BCVAwdbdytfoqwe0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJIjGO1l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJIjGO1l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so4805185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749633178; x=1750237978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJDjyWcLMUVeDZk1xviHhZGZWgDlmwilJftnaWCxOuE=;
        b=aJIjGO1lDN1Nbam66LReCsWknV/M1StKDqUk70RDpGYFZd9mW5xuGnavrWDlC34f7G
         UAfXPbayPtDm3w+SOjBbZn5MatibDmwLwJwAcQr/dAx3/pYVdhBViFERlUp18eKsjI6T
         2tAD1gDySPBsfiIokJCBy2NWLzvzaKhh6ZGSjTBHeKDme5OhVlFtnnOa7fM5jUZ7/zQE
         hAWK7ObzluCjSlmv/ybK9Xg1bGEaKKUFQhFDY+V/ejQadN0RBTmaKKz8aZE4e0uXi2MW
         FQ8qMztOjSp8WvdThwUUwxbvu4byklLvl1ncn4pkL2JegBR5vgwpzavfCLUyz1BZWJhK
         vZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749633178; x=1750237978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJDjyWcLMUVeDZk1xviHhZGZWgDlmwilJftnaWCxOuE=;
        b=Oq/+H4TK8MfcepHq/SaGvwc0/EHm9Go+tXGt2BdoQHx+Kue7NvLNqxJUjMiLdB3gRT
         Vv/Opy6aB+Dp/w2QsVIh+PfGc6Ji4mKsfEWG50pYcYoTraIcsJ6IQKtzDiAN2jMjrtIl
         Or8vvxWmLg05c9uNboI4obL2UkgWSAY45+z0bA4lonPCJRhEs3I9uoEtPidqf1TX5p8e
         c0Ua1KF2gKNc9lcyOrAtH90RjgVbtw1n4iULGOtLztYYvrqE7ojuHPaIF+o4L7MxnuUL
         A2+6XXV1fKG37qCwlfi3pCiwyo58Cw+UPDK/U7qZuB5skWF1N7bWO4VDX2cDt7JRwHkJ
         0xUg==
X-Forwarded-Encrypted: i=1; AJvYcCV0q1FOZgR9MU3plcPyZKVh0R4LLnW3e4JCYenk0bQgwJrDdnknPGEnnWZ6BP1zF9cLFuN+Ycd3UDWntZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHowR+TxAxwD8dWJrUFrAcHn8of7zaNBhOL0PIglJ2K8qnvPRh
	FZsWg3WK6nczReWom0LsfL1CcJHCfk0bi0P6W+CJHN/X5TOxrTlSWpDHh6BjxaeKH2C76WKo/pn
	sgqp6
X-Gm-Gg: ASbGnct+KZrjr+g3roDpfCDmRXvdPfK94RbuNEL85cRcV5Eb9R3F3QMyJvf16Z/fETF
	M+nOshZHq94r4zMbClPm3fNGf14zsOtB6ZQo7+TfWxM8U4u7E5tLCqThAYRKfRdyjiHHjb6LSxV
	ihmh/exc6c0/uDQfBKhzmoMsXCDP5iAaBtegroR087Djq66yaydXQce/8HQ6nJkJ0YLNmbGu3EU
	nVSROyFppSacoBkat5iQEyD5N/d4xb5e59GCSnex0MLdbcQHek9pE0yWQWi3OZwhrMYSy6uC4gM
	9wFVtmjrTyDuARgKpeXyMRPsnIOofug8kYsGTj/dypJRQdxAvgyrBZ8+i1ikbbV2cLU=
X-Google-Smtp-Source: AGHT+IEDwPTZL6SoNXK5j+8T0mDQYtHiStwAj5EYJu2ANbxjMsZXyHidUhVjCqsEU3llM45+EIcuyg==
X-Received: by 2002:a05:600c:858d:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-453241f8a38mr16098165e9.10.1749633178213;
        Wed, 11 Jun 2025 02:12:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463ed4sm14755118f8f.94.2025.06.11.02.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 02:12:57 -0700 (PDT)
Message-ID: <95e216c6-e71b-4330-aa4a-aff74a207eea@linaro.org>
Date: Wed, 11 Jun 2025 10:12:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-1-2b831e714be2@linaro.org>
 <20250610113423.zztoyabv4qzsaawt@skbuf>
 <9852a22a-1a09-4559-9775-2ccbb44c43c0@linaro.org>
 <20250610210147.kwuwwjtcl36hrxjc@skbuf>
 <20250610213120.ib5tkbh4xu7af4jr@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250610213120.ib5tkbh4xu7af4jr@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/06/2025 10:31 pm, Vladimir Oltean wrote:
> On Wed, Jun 11, 2025 at 12:01:47AM +0300, Vladimir Oltean wrote:
>> On Tue, Jun 10, 2025 at 04:41:04PM +0100, James Clark wrote:
>>> On 10/06/2025 12:34 pm, Vladimir Oltean wrote:
>>>> On Mon, Jun 09, 2025 at 04:32:38PM +0100, James Clark wrote:
>>>>> In target mode, extra interrupts can be received between the end of a
>>>>> transfer and halting the module if the host continues sending more data.
>>>>
>>>> Presumably you mean not just any extra interrupts can be received, but
>>>> specifically CMDTCF, since that triggers the complete(&dspi->xfer_done)
>>>> call. Other interrupt sources are masked in XSPI mode and should be
>>>> irrelevant.
>>>
>>> Yes complete(&dspi->xfer_done) is called so CMDTCF is set. For example in
>>> one case of underflow I get SPI_SR = 0xca8b0450, which is these flags:
>>>
>>>    TCF, TXRXS, TFUF, TFFF, CMDTCF, RFOF, RFDF, CMDFFF
>>>
>>> Compared to a successful transfer I get 0xc2830330:
>>>
>>>    TCF, TXRXS,       TFFF, CMDTCF,       RFDF, CMDFFF
>>
>> Ok, so my new question would be: if CMDTCF is set, presumably it means a
>> command was transferred. What command was transferred, and who put data
>> in the FIFO for it?
>>
>> Because the answer to the above is AFAIU "no one", I guess the driver
>> should ignore CMDTCF when TFUF (TX FIFO underflow) is set; I consider
>> that to be the logic bug. You are also doing that in patch 4/4, except
>> you still call complete() for some reason. If you don't call complete(),
>> there is no reason to fend against spurious completions.
>>
>> I think I would prefer seeing more deliberate decisions in the driver,
>> it helps if things don't just work by coincidence.
> 
> After thinking some more, I think I agree with your decision.
> 
> If there's a TX FIFO underflow in target mode, presumably there are 2
> cases to handle.
> 
> 1. The underflow occurred in the middle of a large-ish SPI message
>     prepared by the driver, where the driver couldn't refill the TX FIFO
>     fast enough in dspi_interrupt().
> 
> 2. The underflow occurred because the driver had absolutely no SPI
>     message prepared, and yet the host wanted something.
> 
> What changed my mind is that if you don't call complete() on SPI_SR_TFUF
> (like I suggested), then case #1 above will hang. Your proposal is to
> call complete() anyway, but to discard any previous completions,
> associated with case #2, when there's a new message to prepare.
> 
> But I would like you to introduce a comment above the earlier
> reinit_completion() explaining why it is there.

Ok I can do that. I was going to say that a call to complete() would be 
required, sometimes you only get a single interrupt with both CMDTCF and 
TFUF set, rather than two. So it can't be ignored but it seems like 
we've come to the same conclusion.

I did try a few other approaches. One was disabling SPI in the interrupt 
handler on the first completion, but that didn't work because you need 
to wait for stop mode which might hang, and I was still struggling to 
stop the interrupt handler from firing again but I gave up before 
exploring it fully because it didn't feel right.

