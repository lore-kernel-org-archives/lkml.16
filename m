Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DF014D70E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196476; cv=none; b=dfnRhkSch0ePVnjSZ3qiiVmcqXCX5AD8Ju1PkLuU4AQlEtQFkaDjuNf3cxEcnZkquLBBUopUUu+hj+gNRfBjxj/o5yTPqhf5/TR8suQ7R2/L6i5L4ARs4+A1LFpB8Wf3SsYyB9hvp7vDvSgYK6rrNgTg4H27qhm5yu1vKwdK+hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196476; c=relaxed/simple;
	bh=gdCIisoprcAtBtrqnXWRX9t4HFnV++povrCMun5++2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thhKEs2zez+MG3YTVb5lSL+bEO4wnVndqWsq8swF2qBLM50z/K+xN0Wn7PA+ii2P3+FjE6iGjzSx0aenUoPYgModi6k5DhyOOmfzGNxsyjIXZ2qwXCW8lUEiMebAUlZk6ZijLrsPBnrwsXP2vy/0XrqHTEdOORhKz+78oVQtqfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hPAyz47u; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hPAyz47u"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85b44094782so80871839f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743196473; x=1743801273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITd/dVYH0tNgH+qwyAefOJkkLmPAmD8hZuOxOmm1KYQ=;
        b=hPAyz47uQPdn88DejICza5rMu5hhAS/K8/yLaylBzkvkuYjN0P9OWTibQiS1K+jMhi
         PqmpON4tIxL1TFp65/nxltxlMd7dgdnNzKWAqFR6joIq2Rg7WDz4a8uZwR1DeH4Hf+sR
         rcvCUTEvpa6OJroM20S+5AQ6GQlaIm2ShHlvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743196473; x=1743801273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITd/dVYH0tNgH+qwyAefOJkkLmPAmD8hZuOxOmm1KYQ=;
        b=coUvxpfhrmrZybNCvK9GNZkNDtRTaLn/DoAkL99Tj6SUUq4NvPg2WFKEOaMbMoCNOm
         MjcSahPpW4LC2WPaAvoPLGZGpedS6sMZ7S9wT2z9gqYH+hoj+8V5ScNblX70nNzlAjVe
         byV6F6BumAh3HexXH5WQbNruVZexAe+4mYlkLxs2WYOZ67H1mzw/P4BuxXwpK9DTS+j1
         fYwpldYMeI6j8PzcqwuSz9T3rx9jOidZJt1wjpKvRYV2mK3SQo1ZUNdzI2ISY9toJNLv
         RgOwk5hwhA7saNew3rvrhsU/M0l1IAOqlsqAQ/th6EzJM4BjHxt8A9hS5jUxvY/es4Rn
         KEnw==
X-Forwarded-Encrypted: i=1; AJvYcCXeuB+JAF3/25wGbryhSNxySf0LCtdIGpFNdA7SkxgYXPK3LH/PhF/eT+85Grufb8xvcoaxy4+zpXbb09w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHI4yIwWJLnbr3d+OxfP5XNPLfv1XlD1AoXbfKjohS2kJqUpq3
	mTL4XMNB310R1/WdbzB49AOVhsg8QtDOHR/Ep8E1LhvlcWTjbDJvxJpp6/TUxAE=
X-Gm-Gg: ASbGncuyOovgqmHP7elqx1ZdKcW1Xzg49Py/uswzoL8VFOXHJVQSA96l28J7HYeT6OV
	rVW3oyWkuC+jT5tQd4TE0/Aby99ORzLKIc6xF3q4FowqYcC+1jFeFZpSgLHrOyxSa6AiDRvQKNf
	+ti8EgzCu1Ay4a+RJc+K/h4StFU17BL5Ga9zTj6KpgCuITHpRuDJJa+ayjVCKwtMQ7s2QM2/6Po
	MhhllTMuuUUdg4USHPgaeiNlbc25QqqOwuni2s02+MomrTKU/jKI6/TZnWycIN6Rm04VsvGsvHr
	ChRDjfqmQsDeBT08wHLtu/oB2ogj6xF8x4W1wbfI/zPhW4NLYUQaRaE=
X-Google-Smtp-Source: AGHT+IEu5vwAIwrMiVRpX0qPvQFoMngxuYyjWw6k1tjZRjkdhtFK08i2zSOfHAkxXDDIpwatOAc0tg==
X-Received: by 2002:a05:6602:7288:b0:85e:8c20:6194 with SMTP id ca18e2360f4ac-85e9e761b07mr146555039f.0.1743196473247;
        Fri, 28 Mar 2025 14:14:33 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464746a8fsm623876173.46.2025.03.28.14.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 14:14:32 -0700 (PDT)
Message-ID: <99a8b726-726a-4e26-bafc-9ff2b1e4d7be@linuxfoundation.org>
Date: Fri, 28 Mar 2025 15:14:31 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Fix the error limitation on max_hw_sectors for
 usbip device
To: Zongmin Zhou <min_halo@163.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250219092555.112631-1-min_halo@163.com>
 <88b2fb4b-96a4-4d29-bf92-4064d3572fa4@linuxfoundation.org>
 <5a41d6c3.8c78.195371996e0.Coremail.min_halo@163.com>
 <247c7e15-bbff-427f-8315-ca463f8b933b@linuxfoundation.org>
 <4d4035bf.26b9.19556dcc23d.Coremail.min_halo@163.com>
 <c49917d2-5157-4878-9866-be6053b5124d@linuxfoundation.org>
 <6d47fef6.9eef.19565c308e5.Coremail.min_halo@163.com>
 <803b43c6-9aab-4380-9753-fd2efa8061fa@linuxfoundation.org>
 <7e9db4d9-0a22-44b4-a981-0de25d6a2aa4@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <7e9db4d9-0a22-44b4-a981-0de25d6a2aa4@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/25 04:02, Zongmin Zhou wrote:
> 
> On 2025/3/11 00:49, Shuah Khan wrote:
>> On 3/5/25 03:03, Zongmin Zhou wrote:
>>> At 2025-03-05 03:45:28, "Shuah Khan" <skhan@linuxfoundation.org> wrote:
>>>
>>>> On 3/2/25 05:37, Zongmin Zhou wrote:
>>>>> Dear shuah,
>>>>>
>>>>>
>>>>> Yes, I agree with you.It would be better if there have a more simpler fixes than This patch.
>>>>>
>>>>> I can just think of the two possible solutions that mentioned before.
>>>>
>>>  >What are the two possible solutions?
>>> 1. The patch we are discussing now,have to change the API between the kernel and user-space.
>>
>> 2. Simply set vhci-hcd dma mask to 64 by default,just modify the vhci-hcd driver. Then dma_max_mapping_size() will always return SIZE_MAX.
>>
>> I prefer option #2 - What are the downsides if any with this option?
>>
> If set vhci-hcd dma mask to 64 by default,I can't predict what will happen when the real USB controller support less than 64bit?
> 
> After all, the data flows from vhci-hcd to usbip-host and finally to the USB controller to which the device is actually connected.
> 
> the data is ultimately processed through the real USB controller?

Sorry for the delay.

That is the case. I have to check the code to see what the host
would do if it receives larger buffers from the client (vhci)
> 
> However, the default setting to 64-bit is equivalent to eliminating the impact of
> 
> the patch(commit d74ffae8b8dd) on usbip protocol devices, sounds feasible?
> 
> I am not very professional in this field, waiting for your evaluation.

We can give this a try. Send me the patch with default testing the
following cases:

Host - swiotlb enabled and disabled in your environment to see what
happens when there is a mismatch swiotlb enabled case and client
side doesn't limit the size.

thanks,
-- Shuah
