Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531C2CA6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671934; cv=none; b=urfl+KOdccK+cTVURFYMmrEKrj7sf6SMocvidMAJme/EYOdKFfb0X5Ivr6qLCr5ogpYZAD74Y9Z2CSYvWqJ/o0KhK6G+LJZRBwWqeZdJTCy6XsUqW7SKTUYsPCEa0/079wsBHZ2ZaVyU4T5/54zyL7HVvyO9BlpnFhD4vx0kOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671934; c=relaxed/simple;
	bh=rvHOKJvn3wE67LXFxDgx5NastYh3chD7UODcWBNLNYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTABF6EVmbxSIuu34sGuZWOICZDCWnjrFlGBH03RqF8GaeAMZs9nG2gSk+WIJrnbvQMo3oqAnl5BLM4LAbhLU2hqBY3itl0Tg3tYF2DXaWWszB5qpPv/a7kqMBU1O2xVb5Itgoag2Ab1DuF0N6pfVrFzCzks8QCpKPaA2MqzhzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UQJcirNR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQJcirNR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso3918765e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743671931; x=1744276731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyCYxUZtgBjDR1dXpE0eIlM+N8NWz764t0SQigqveio=;
        b=UQJcirNRed1QDGFHr0P6zQODemF2p5eG4DQ83+mHpY0ZSUoJBNzc5WlSkeTyDmL/rK
         cF5L6/slNvcKDkIIJBDffhvADlfh0gTy7Ac3KpNXyKZw8BjRRsg5NSld4v4jdwX4NIVy
         bBn06Jjhgvfh6JyYh1UfksWw771V/NrZyAhSFpulOc+PS5fmYRDcE8QpTt75DE80GqYB
         5my42z9CecnhBz0rm465OACdggsfoOtUEHAgdGiKqGHSmDmwdRmFdOA9GAYAoj0Mmizb
         s4ebTD/krKeFPq2o8hbhZ2HUMy/KMtaK3UzakVrcw4jozhBqLm4mA392eEoVikbZo5PO
         F4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743671931; x=1744276731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyCYxUZtgBjDR1dXpE0eIlM+N8NWz764t0SQigqveio=;
        b=XES01uEdEOsJMiXcX+w8lahpLUJ6wIymVNo1562XBIm/xmd/wK3QqD53L3mttl0Gww
         uXQYV7eCnMI44Oj6dR/GIbDNefesYviI+LZgmjlpnG0cV29PucirQkBPEh3gnvWumbi8
         hoTSrwGxDZgVjiECQGQq8awUhDW8AuNS9aRRTq+3fjEZlvriOQK/jRABjIYFBbuN1GSk
         AypmvaisweWI3wegSWvp73CdPO+BABHFjcMvGQJyKB2i7Q4fS9HDigQjhzmRU0r3tmaO
         S7U0+pVVs+RZt9AiT9Xze3IGLqREWHQaAskRdySMktE1D7kz5+8j6oE4JhbzO+nEomnn
         Xr0Q==
X-Gm-Message-State: AOJu0YxTbMilgqB10H9ntq9/l3yQcEFNeMrktgm5rMb1khYgvABGWM5n
	wHIsmaF8f+cuny3JKZzThW68OwviQqcwcs/0nGtVZWXFNtyfFgfZ+8fJ/ZrQB64=
X-Gm-Gg: ASbGncvqFw+QegtC1S8qmLUshdXnkCfGu3T40VVwl3W9Jf9WTi41wjOziPLb4BY0r6b
	BJBDvYsfkZRQIoHaR82GAEHrS89kD1PG+wReVRCa1mnEVi8HP/gq6CtryZr6cN0ZArtzLOt0Uuj
	URCaWbzAQq/d1aPCBg++dKy4BBdRyafNaeoFvCnigLti2zTH+WQ5IP6Mo/lul86fQGVumS6XsDZ
	+JiuWkzd5xJZOmngYe85UJ+3wIvlhxFomBQFryp2OadIBp25RtibLjtwHIf4i8PFs2QKUajmkpk
	T9tzbBnbYOT4v0OPu32xl3IG2r/FFnv4ETcXQLHG8+wcbb+1mmxG7rl+NGHlPTY/b3VnOerTMg=
	=
X-Google-Smtp-Source: AGHT+IEOW+q3N86NhkuGBaTi6IDcAvm8b9wmte2OHNlAZ2JqlCJ21/SroEoebyqhITLgZE567HDf/w==
X-Received: by 2002:a05:600c:3588:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43ec42b8eeemr15010135e9.16.1743671931044;
        Thu, 03 Apr 2025 02:18:51 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c301a732asm1261998f8f.30.2025.04.03.02.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:18:50 -0700 (PDT)
Message-ID: <283ac88b-c8d4-47c8-9ff7-935770eca566@linaro.org>
Date: Thu, 3 Apr 2025 10:18:49 +0100
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
 <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
 <2025040230-showoff-spray-ac83@gregkh>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <2025040230-showoff-spray-ac83@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/04/2025 12:31, Greg KH wrote:
> On Wed, Apr 02, 2025 at 09:19:17AM +0100, Srinivas Kandagatla wrote:
>> HI Greg,
>>
>> On 01/04/2025 20:18, Greg KH wrote:
>>> On Sun, Mar 09, 2025 at 02:56:50PM +0000, srinivas.kandagatla@linaro.org wrote:
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>
>>>> Hi Greg,
>>>>
>>>> Here are few nvmem patches for 6.15, Could you queue
>>>> these for 6.15.
>>>>
>>>> patche include
>>>> 	- updates to bindings to include MSM8960, X1E80100, MS8937,
>>>> 	  IPQ5018
>>>> 	- add support to bit offsets for register strides exceeding
>>>> 	  single byte
>>>> 	- add rockchip-otp variants.
>>>> 	- Few enhancements in qfprom and rochchip nvmem providers.
>>>
>>> Ok, I wanted to apply these, and tried to, but they fail horribly
>>> because:
>>>
>>> Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned reads")
>>> 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
>>> 	Has these problem(s):
>>> 		- Target SHA1 does not exist
>>> Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit reading is required")
>>> 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
>>> 	Has these problem(s):
>>> 		- Target SHA1 does not exist
>>> Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than one byte")
>>> 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
>>> 	Has these problem(s):
>>> 		- Target SHA1 does not exist
>>
>> Looks some of your scripts or b4 is picking up older version v1 of the
>> patchset
>>
>> None of the above patches have Fixes tags in the V2 patches that I shared
>> aswell as patches in linux-next.
> 
> Yes, that looks odd, it looks like b4 pulled in the wrong series, yes.
> 

Even that looked incorrect, as the v1 series only had one patch("[PATCH 
12/14] nvmem: make the misaligned raw_len non-fatal") that had fixes 
tag. Not sure how these 3 patches are tagged as fixes.

> But, that's even worse.  Those "fixes" are now not actually marked as
> fixes of the previous patch.  So that information is totally lost, and

Its because this patch("PATCH 12/14] nvmem: make the misaligned raw_len 
non-fatal") is taken as fixup patch and wrapped into the original patch 
("nvmem: core: verify cell's raw_len"), Also the sha will not be valid 
for linus or char-misc tree.

> again, the first commit here, "nvmem: core: verify cell's raw_len" is
> broken so much that it took 3 other changes to fix it, which implies
> that bisection would cause problems if you hit it in the middle here.
> 

All the patches related to this are enhancements to nvmem core to allow 
specifying bit offsets for nvmem cell that have 4 bytes strides.

Specially this check is also an additional check in core to make sure 
that cell offsets are aligned to register strides.

> While fixing patches is great, and something we do in the tree all the
> time, let's not purposefully break things and then fix them up in the
> same exact patch series please.  That's just sloppy engineering.
> 
> Please redo this series completely.  I can take the "new device support"

I can send them but its going to be exactly same series, I dont think 
anything will change as all of these patches are enhancements and there 
are no fixes.

I hope this clarifies a bit, Please let me know if you still want me to 
resend this series, which is going to be exactly same.

--srini
> patches at any time, and really, those should be marked with Cc: stable
> to get backported, right?  The other ones are written as if they are
> fixes, so again, I can take them any time, no need to wait for the -rc1
> merge cycle.
> 
> thanks,
> 
> greg k-h
