Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E3320101F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581963; cv=none; b=sIeQia1iJsVxG9q5Rp+rHsedmKs4aAzySqWfa6JzrxzsUIJrmzanse7tRvpyBtJu50d9Ytq/h+O9veIEjq0NYWahlxW6rxQNNIAjhSI8vXg7/uYeorz5dccKfm+FboZJRpBoBbzDMR9W1B6/0Y/Al3hAAYD+8KXuo0gBkyddLlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581963; c=relaxed/simple;
	bh=KUYKw4INNT8t96ZsDmF6Bl7eEUnrlc+Vi0r2E0czZUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIjDq89tIO6AqwuKnqFt0a/7N3YIIirKYdJoq0/W/KYfWykKATEw4td7/+E7wab8MpgLdDB6qwq0U6dqkcG3DgNuZC4QrmrFqlnz4hKgh7kuTgCtCI0WT9HrlWaVAkwNBdzNPg5Ez11oJngywvKNeuqeqsapc2Sz7MB1f01XeGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hqZksOZd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hqZksOZd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394036c0efso43539105e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743581960; x=1744186760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wwUiicvk+L3ACEyNWdk+Xc5uGV1RJZJnDz56q6f1WA=;
        b=hqZksOZd2mNKt6lCrYC4yyfhD+ehnMHgM/DghTuN89qIzsT/znn7zYuqJCHIQ/w32R
         3AaJnPj/T2JtVdVh+/UbRwQFHD5PiDHPzLVGGtgiaX+Gpy4WpJV1BVYdHInrpQTtAd/D
         B7mnUw/hw0pM1U0maeUeNeAjG+yUvGinjAu7R3ZKH8IyEHjZvD7MYiGWlYx445EW1qW3
         Jm56LB7mU3c1Lwq5cIvcHS79bdCJ6SDgBzZ84pomFjDZsyQkDTWVAZYBGvhCfn/ifr81
         wsbeuHx2hZYdRXj2NXftlfzDs8cO57wLB8aULei7SuRdy2xHrbc7MEDJjy0tDROc/ORG
         OORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581960; x=1744186760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wwUiicvk+L3ACEyNWdk+Xc5uGV1RJZJnDz56q6f1WA=;
        b=FcXJJYWRpfczWbAUHuasnu5lzfmyVR6MivVjaLDCjV8NiavjUlse7vczyfJu+g2/iN
         ir0EvnrsqctpNKmOniNkPVHuZOup7ts3zReEZ4f1VOX1Q9WfscsRE2Rb0AImk0uQPaXS
         HZEAbPktGN2GfWGnndCpPK7C6X/w5Ys0cJgpI3BXVximEBz2Uw7A2t4RYaIfE0mTdbO3
         DJrDHv+P/oO4hGQwQNe1M1HXsm2oNur9WCm2h+pmfrKjDlPO3VfQiApGRSVx/qtMgBaZ
         zBgXwWPd2kOJEwmCmVaIEAPa04R3eVOLzEbv4X5KngFOMPdMrUScQBOUAvLQWG2VdI1n
         YW2w==
X-Gm-Message-State: AOJu0YwRUwN7T420uQh8lfKsPFLJ3vFVpdaFP+IJo3pQTfrfCYw3wYIb
	whzCVEIA+aafBAeK/yQ5PLpzw9quuB5Dzss2KZ+lS1apw1Ejj4twzaLKP7hlDUs=
X-Gm-Gg: ASbGncswG8ftU95nSakLSNUnAjNr3Ax9hH44zhJu8Ep509S2LayzGiJKk7pXOQhPI8a
	gOYVu0TA8CA3Tr4l5Bpf2yH4qWKgXjWNDmW4JjLT6uczGd3qkh+c2zFCm3vx8g22SYpjeuAy0NR
	c0UJ3A3DQtXkClOZ1/5HrFWWR923KIK1D6MBtQp/LLXCUyhV9tKQ7nCCfyDc186pdIEQVdpWpF9
	rQ2CY5m9UZAyPFdTwgMfw6M077TwkwOWdpjCjZHZm/NiylU2SyTt+PtE4Pt8nHQBQofAi3zChbK
	GtFkurYYmfvkRFAMNnLrKoeVemQjBO2uxX+YusN9xoONXlEQdmMJtP2JanwU7UIJ4g0DYJrNWw=
	=
X-Google-Smtp-Source: AGHT+IEaNPvRgNNnQZ/y7y0BwtrLILH3rGHYfx5TkhnV5ZCWgGxR8X50GBxdjsp8LH6l9jkyiVwaEg==
X-Received: by 2002:a05:600c:3547:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43eb06bd359mr28024615e9.30.1743581960370;
        Wed, 02 Apr 2025 01:19:20 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0dcc66a4sm15207317f8f.42.2025.04.02.01.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 01:19:19 -0700 (PDT)
Message-ID: <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
Date: Wed, 2 Apr 2025 09:19:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <2025040143-espionage-poison-2345@gregkh>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <2025040143-espionage-poison-2345@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

HI Greg,

On 01/04/2025 20:18, Greg KH wrote:
> On Sun, Mar 09, 2025 at 02:56:50PM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> Hi Greg,
>>
>> Here are few nvmem patches for 6.15, Could you queue
>> these for 6.15.
>>
>> patche include
>> 	- updates to bindings to include MSM8960, X1E80100, MS8937,
>> 	  IPQ5018
>> 	- add support to bit offsets for register strides exceeding
>> 	  single byte
>> 	- add rockchip-otp variants.
>> 	- Few enhancements in qfprom and rochchip nvmem providers.
> 
> Ok, I wanted to apply these, and tried to, but they fail horribly
> because:
> 
> Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned reads")
> 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
> Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit reading is required")
> 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
> Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than one byte")
> 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
> 	Has these problem(s):
> 		- Target SHA1 does not exist

Looks some of your scripts or b4 is picking up older version v1 of the 
patchset

None of the above patches have Fixes tags in the V2 patches that I 
shared aswell as patches in linux-next.

Thanks,
Srini
> 
> Why do we have 3 patches all fixing the original one here?  Why isn't
> the original patch just "correct"?
> 
> And you can't send patches with git ids in them, that just doesn't work.
> 
> So please, go rework these to not introduce a bug and then fix it up,
> that's just not ok when dealing with a patch series.
> 
> thanks,
> 
> greg k-h
