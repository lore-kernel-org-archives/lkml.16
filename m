Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F1129AB01
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929304; cv=none; b=ggXLNmmItwigFHZAn5xUR1YDHwIDGD7DVtyGh0++LEtKL9HQ16QJ7b1fi1U5a6DGGw2ItSrQe1T4TAj012Be0+3dc1mdUHc2Hmjl9UHlqPZPlN9ZUZF69rfIIAzqRzXAXMlqfqmrPva+qQma8BB4iV2PVH7aPcG06xz0vxmEECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929304; c=relaxed/simple;
	bh=TXuQPqAg7S5oOsB/2JdDGDJQ7ANNmURcZvFDfmnEIH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3KVAZH97ydLUyKhB1RSGSEGXOWe/jHoE8gCZdAmeFkqc9FFOg3QNbY2R6TKDjPcmSMwfgcbV9MHfo4bT3Fw/593w3M50hSsFF2vPnxPf9J3S4LW3I02bG3E1nz7nyTKwDEkv+ziR0B1aX81qTcnvA7cDJIJkqaDcWgSNHRq1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uftq761a; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uftq761a"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so3663195e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750929300; x=1751534100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6HELOLH5t63t0lxWsM9sFc0qk5UYWyQgDUSTkLl0Kg=;
        b=Uftq761anopkAEHofrwinkUqaPo973/UtjH573OugAj7dPYCz+N+pNxhR2Ebs63UQO
         w55fEWkT3yEv1mmsVfP5fzVPs1smOrVlG1o4/YuCRFCbHCRyjsNNCX6Sskdr0atFjz+N
         xDKUOJ0XhmnTpCr48KIytrLTei6A/RrnOU4nnlgVenCVLL3ZWlUGFfJWYos+qS7RmPcn
         u2GJakQV5gLJUU3Y3lVd6Ma4Hg7QVQz2DIAkzjJrmEI0Z2tVmXJYnaq/QiUr1UUu1y7b
         +bXWijkBGKyH1qtr8XVoa16qk8/zQuBQZMBdx3w59KjPVS6X6c+iC6NTLBUUCA1fGNWq
         +G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750929300; x=1751534100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6HELOLH5t63t0lxWsM9sFc0qk5UYWyQgDUSTkLl0Kg=;
        b=EtPoGAT1xOvCgx9HlEmU8oWDXeyebJH/qusebr3P5mc+MjHrC8rMW+r9QLWX/u1pyK
         BO84Yp0/IxKmeU9sfYBJEKsjlIw3GhdVvfOUBSINebIzK2GZfE/k5YgM0Fhx9he3d9di
         gULzmSsdR6eVazYK/LJ7fy+M/sc00USFEwxYeHTywGJDVRfluEPky0yyAZbOtpfoP9oW
         gQ60ysSBfE74R6GS8f3L3k7tvCeQ6COo4VS0rDEUP+r6PyoK/qUrgpfUHaiiRJCLQM/+
         QPJok808K3kGJY2uusYxrWlKM/ayo+tK4ZHm9XCg3CVcExVOCgUVcNjZkyrwo9EUPIvK
         4yeg==
X-Forwarded-Encrypted: i=1; AJvYcCWklk7MWekDD8lWHg7DkeTl2//1e+kE8M/6sU2Pq9klm3GsRDLEiMJr+iij2SRhXJHnqVpcEk2QMsrYCCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOVdRmstRqJR04plbt78F8bxgIZa8eyGw5M0+41Bm1Exa7Trkn
	ICP+LAfS2cfSMgYpocx76iPT52QrO2YCc/MYDcjCYS8tsSzVvxI6C8NM+jTc8uv2NcFpA0Euo/S
	EVLf8
X-Gm-Gg: ASbGncsyKQXtuLyU4i+3MHqIb8p/qrIBdhNam9mIaQWyuBDJz1AVINlQqMkrNtSTh1g
	dB8HOGhtlKmlyzaOVsNHZbpc3uj9tbhytH6PKnLlok+JjPDEtOnQP6vUS0g0LHNpvSSPcjapkVA
	tYUz4XX7BpoUXllaYD5u+Uql5TPYDmLSIZrMSYFzkBlNK7jgLVmTxJNzJj7PnYxasuR0RJTdZve
	dZ8G57LZdDgnWJlMmDVp/u1IF+AbPOM4IHhAngTBJfeaEVAPuFDi0J59zpJKxC1eKj4sVb5MLxU
	xYEe2W0FiefwTsOilqGxHBmPIA6op5V6P4War5/AEcEapUS7W6OMgoJ2BSyeluOVz1g=
X-Google-Smtp-Source: AGHT+IGu1qpUTz8c4jWhNCy48sK61OzHT2aoxKhnMhoAC1djW2eREuQnj2r7lzI78n8bzCS1SF6OaQ==
X-Received: by 2002:a05:600c:c16d:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-45381af23bfmr65504065e9.31.1750929300374;
        Thu, 26 Jun 2025 02:15:00 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm43399545e9.3.2025.06.26.02.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 02:14:59 -0700 (PDT)
Message-ID: <6fe9eebc-b050-4b12-a28b-e2f0bcc707e2@linaro.org>
Date: Thu, 26 Jun 2025 10:14:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-4-e7d574f5f62c@linaro.org>
 <aFrUqW0ijRt7CJzw@lizhi-Precision-Tower-5810>
 <228fc6f7-52c2-48a8-af7e-6f2cfa7b9168@linaro.org>
 <aFwQCL0tQh9peb7x@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFwQCL0tQh9peb7x@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2025 4:04 pm, Frank Li wrote:
> On Wed, Jun 25, 2025 at 10:00:41AM +0100, James Clark wrote:
>>
>>
>> On 24/06/2025 5:39 pm, Frank Li wrote:
>>> On Tue, Jun 24, 2025 at 11:35:34AM +0100, James Clark wrote:
>>>> Using coherent memory here isn't functionally necessary. Because the
>>>> change to use non-coherent memory isn't overly complex and only a few
>>>> synchronization points are required, we might as well do it while fixing
>>>> up some other DMA issues.
>>>>
>>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>
>>> In https://lore.kernel.org/imx/c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org/
>>>
>>> look like less performance, why need this patch.
>>>
>>> In https://lore.kernel.org/imx/ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org/
>>> look like better.
>>>
>>> Any conclusion?
>>>
>>> Need performance gain here if it is better.
>>>
>>> Frank
>>>
>>
>> Hi Frank,
>>
>> The performance figures for this set are in the cover letter. It's either
>> the same or faster, there is no evidence of worse performance. The one you
>> linked was a bad result from not testing it in DMA mode, but it's corrected
>> later in that thread.
> 
> Okay! you need mention why need this change, why non-coherent better than
> coherent at your case.
> 
> You descript what you already done, but not descript why need it.
> 
> for example:
> 
> "fixing up some other DMA issues", what issues exactly?

I can remove that line, it might be more appropriate to add in the cover 
letter as it's relating to other commits in this set.

> 
> some benefit, like memcpy from/to non-coherent is faster then from/to
> coherenct memory ...
> 

Yes I can mention that it's expected to be and was measured to be 
faster. That should help people running git log in the future to see why 
we did it.

> of put test data here will be appreciated.
> 
> The cover letter will be lost after patch merge. When someone run git log
> after some year later, they need know why need this change , what purpose ...
> 
> Frank
> 

I somewhat disagree with this. Usually maintainers add a 'Link:' to the 
mailing list when applying patches, so the cover letter shouldn't be 
lost. And these particular performance test results are short lived, in 
several years time other things may have changed. The performance is 
related to a specific device and the state of the rest of the kernel at 
this time. Additionally, I mentioned that it's the combination of two 
commits. In order to put figures on this commit message I would have to 
run another set of tests with only this commit and not the one to 
increase the buffer size which comes after. I did consider reversing the 
order of them to do this, but it wasn't straightforward, and I really 
didn't think it was worth the effort when I can just put the figures on 
the cover letter.

We only need the figures to judge whether to merge it right now, readers 
in the future will want to read the commit message to see what was done 
and why. I'm sure that they can trust that we measured some improvement 
if for some reason the cover letter is lost.

It's very common in the kernel to put figures relating to an entire 
patchset on the cover letter of it, rather than on the last commit message.

> 
>>
>> The reason the figures aren't in this commit is because it requires this
>> change and the one to increase the size of the buffer.
> 
> 
>>
>> Thanks
>> James
>>

