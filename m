Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C513215075
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932295; cv=none; b=KHcL3tc6WZYHE1ovGpsghTwUmwp5bs2uhGT8czYlXHQxkA7ZqcI9YN5mHaT30o/fVFzioefP8ElVbdKKy0lXV3CXdF+bWTt28IZvfKAiRgSChzl0U+bpEOjPUxZ1oAeanWH1h1VTHwZnFIQfvNd7IaUGe59lz5zTa4Wsrpwuun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932295; c=relaxed/simple;
	bh=WQ/9cxE5gGmXPpCJKlnLFbBEfplrIztKZyWOvmdN1kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QOhaZeRy4RzY7woAoTPGS3dX7DixdLk8TiX/eubikFA9VOAEg3fRtJ2SAOKlhluxX0RRGxJ01c4I7Cd30MbDDR6ocvjx3/M0zKK8mHP+MxuUqQ0mzdbWOeW7+7cLhW1LM/Pcem0iyM/f3aLJn+576aZGxpnmjkmTywH9hCrmmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FJps2vbN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FJps2vbN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453608ed113so7435965e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750932292; x=1751537092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjxAnOS8rNH0+1NZmQ65jb9c6BDRmhT9+YPsn9/ebwI=;
        b=FJps2vbNxsKQb7TNcoFrbqsozCOpL1GsKKwO6SQOk3Gq/rWmUC1DxLPZ/B87cqT/Aa
         9Cvd4fWrbJFeanIsflqXv5xQD6w/TzJIU03uVrr4gitgs0NTNeh6ZoJDYs60pUfX9JNK
         Xgi6Gd2I+JZLqJ1WenEY0z24hiD65aO06dYbl1WxuwWP9SBeqwnwUBGzwLHqgJqb8rbU
         iQf37ygXzJ9DHWPnYHHUM5lO1D1fxl3oM+aU1ewKmVVzl/5OE1B4OZUuIhmJr3MXTAXO
         s7beSXkRaWR8SNRdnOnM3XD4xobNEqC9J8EIt796qhUs2lhwvTKCWHRsUyjiMdfRFbls
         PL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932292; x=1751537092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjxAnOS8rNH0+1NZmQ65jb9c6BDRmhT9+YPsn9/ebwI=;
        b=K5hw+Lyo6FyewYH5SZiWfxD0Au4Idusxzb/rNTd0L5jREZt444V0iu3NpnFkodRUX/
         a45RW6+q648aG7Cuh7lbAWfq3Yu1z/r1q3MbFR8L9eIcVSd7Yp75RUrc08S8LBnDL9Sa
         1U7xfBFGCFzinwagpKohJocN15Uhe0y8S6ayvPqoJqoPp4+dqxR/T3O6XhV/bpPFaHzP
         BsnTpBAzS7NVdoALBDr9dc1PVMIH+lDn29Ur3ZGzO57+vKHi08IyDe5J4savXrS8vXVJ
         SmMQZ93rI/1QeRt041fUWdE2CMACSThq5OVIK8mRvtw3ZTN02km2Jn+hd/tRzrgoEz5H
         nEVg==
X-Forwarded-Encrypted: i=1; AJvYcCXO2kPRU8Rt4Jjxpp7lch3o2EIScnzxSyIJEA5OYVyVjZB9X+ei9SkrahwMw6dZtndhNs5alj10avLK0MU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Nr0rwYrF7kcapJgeVEad8jrsCG8eGIV81PsbmDkzWKaVl0hU
	S9S+tyi9XBxKxv9HwtH3q0ifOby3kaKWzR/BUVM7DeV8KaQEsmVDAhyoAYOBugGpf+o=
X-Gm-Gg: ASbGncsdvjJUBabvdBfuaOS4slx8UODKCDLw6WNGl51eqXvTYgPqiVWxO0EqoupCvJJ
	ijfh2Doo8aN2cQkZ59bUOfd+k/V2XR8pwN5kuExVTCD+V+2qHgpWsFmabUe1BzgIrA55tx6Q0Wk
	e4vrX0MBAuSucd0hmvJeaVNHkJ8VXhsZqSGHg/v//PebCSqSBxcKRbFl3NkOLy2yniMt09mw17s
	mK/O6Ja7seN0HDaIYWhnUvGwxd03MNiZar4DTHJV1S4/qQpK0ws0S6Z5Zvvx0Qii5EioZSGfzMd
	8+zWWNhA1l2uLtyggSz0f8+hZprpp1d6/oG7ODWcvQLIxsg/E78xl3VqoaRYTE8KNt8=
X-Google-Smtp-Source: AGHT+IFCIAdj1Md0jSwbK4WcI3GRDjT0JPNkwOFSc+l7/qC5ZuHylf2IYZ0En0415K5jiUPMuSKnLQ==
X-Received: by 2002:a05:600c:1c25:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-45383371376mr51561945e9.11.1750932291936;
        Thu, 26 Jun 2025 03:04:51 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453814a6275sm33518135e9.1.2025.06.26.03.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:04:51 -0700 (PDT)
Message-ID: <faf23c39-af14-40ae-ad22-849aea87a4bd@linaro.org>
Date: Thu, 26 Jun 2025 11:04:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] spi: spi-fsl-dspi: Stub out DMA functions
To: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>,
 Christoph Hellwig <hch@lst.de>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-3-e7d574f5f62c@linaro.org>
 <aFrSgJ5xZfccEX9x@lizhi-Precision-Tower-5810>
 <290fc244-e88f-47a3-8dd3-0ec27eb5c60b@app.fastmail.com>
 <0c6c78da-575a-4d29-a79a-3903aa801b42@linaro.org>
 <0f904f12-295c-48fe-96c7-c64c461cdbbd@app.fastmail.com>
 <884e86be-112b-44dd-a827-30355a5fdba6@linaro.org>
 <82824032-26d4-42a6-8a92-3e4a410741c5@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <82824032-26d4-42a6-8a92-3e4a410741c5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2025 11:54 am, Arnd Bergmann wrote:
> On Wed, Jun 25, 2025, at 12:19, James Clark wrote:
>> On 25/06/2025 11:00 am, Arnd Bergmann wrote:
>>> On Wed, Jun 25, 2025, at 11:19, James Clark wrote:
>>>> On 24/06/2025 6:16 pm, Arnd Bergmann wrote:
>>
>> Wouldn't that allow someone to break it by disabling (or not enabling)
>> that option? The driver won't fall back to the other modes if DMA isn't
>> configured, it just won't work. In this case it seems like it's better
>> to depend directly on DMA_ENGINE because that fixes the randconfig
>> issues, which is the whole reason for the discussion.
> 
> It would be the same as disabling DMA_ENGINE today when running on an
> SoC that supports DMA mode in DSPI. Ideally that should fall back
> to non-accelerated mode. I see a lot of checks for
> trans_mode == DSPI_DMA_MODE, and I it's probably best to change
> them to a function call like
> 
> static inline bool dsp_dma_mode(struct fsl_dspi *dspi)
> {
>       if (!IS_ENABLED(CONFIG_DMA_ENGINE)) // or CONFIG_FSL_DSPI_USE_DMA
>            return false;
> 
>       return dspi->devtype_data->trans_mode == DSPI_DMA_MODE;
> }
> 

I think we'd have to check with Vladimir on that. He said that he didn't 
change some devices that use DMA to use XSPI because he couldn't verify 
that they would still work [1]. So by adding this fallback we would be 
making that decision now, which I'm not sure we can do. It would 
probably be better to add the stubs that make the probe fail rather than 
register a driver with a fallback that we don't know works.

>> Would someone really want an option to disable compilation of two
>> functions if their DSPI device is one that doesn't use DMA? Seems like
>> this option would always be on anyway.
> 
> It's probably mainly relevant if they want to completely turn off
> CONFIG_DMA_ENGINE, which is substantially bigger. Using a check
> for that symbol in the driver is certainly simpler for the user,
> as they can't accidentally turn it off the custom symbol.

That was my thinking.

> 
> In theory you may also want to turn off DMA mode for testing,
> which is supported by at least the DW_DMA driver.
> 
> I see that SPI_TEGRA114 has a dependency on TEGRA20_APB_DMA,
> which is yet another variation. This is clearly done for
> usability purposes since that SPI driver only ever works with
> the specific DMA driver in practice, but it seems worse
> conceptually.
> 
>       Arnd

I can add it, I'm just questioning the usefulness of adding a new 
config option that's unlikely to be used in reality. It only achieves 
the same thing as doing #if CONFIG_DMA_ENGINE in one place in the code.

Ultimately we're just trying to fix some randconfig error, if we start 
adding new knobs for people to turn just do that, there's a risk they 
won't get used and we'll make configuring more complicated for people.

Testing might be a partial justification, but that config wouldn't allow 
you to force DMA mode where XSPI is used. You would almost certainly be 
doing that too if you are doing that kind of testing, and you'd have to 
hack the driver anyway to do that.

[1]: https://lkml.org/lkml/2025/6/12/1385

