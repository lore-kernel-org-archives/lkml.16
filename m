Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC82CA6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672920; cv=none; b=SvAw3mkCiidhaXJJjtAX+7KUYNPjax1PjxiaZ64d55mszeGVHcmFDAJ04nGWhgqk5hHqvL/R6r9sGZ+8EGIURiGnalosxk45YtxBoVan3eoNCr6fWhYTK/WRw6zUbSBsIhgtpVOaF5mMRYFyWkIhNrntvBUHSS7wNob1gS7NXmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672920; c=relaxed/simple;
	bh=hTv2KgFQ6mmvlFNOjF6EqimAnSbCYHjyBnJGv3GuL9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PF0WR+pj7yaDr1m6ENRw2hBhkjAm1Fp3qqMqrtkiaS6CUEbFsU/49IBFtz9Sn7OTGUFgTQR3+rYa6+PlVl6E7XBhasxjzWv11QO0YXZ8JTP+QzjUW06qBaLozHaAe2A3nb6MioV3WCJg37nuiMgQxf802aanGF8RTBp1+kEJCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=etNWkVBK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="etNWkVBK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39bf44be22fso479794f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743672917; x=1744277717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5CAypoWaAtWtu473NN12TufcIHrlJkEOgdxMCUBBgo=;
        b=etNWkVBK1y4jOgIUaK/ENK6ZkDzqf8YuE0+rlAXq4X87WSVqv8JmwJWaw3HOrJtG9B
         qQBcjIWAzfMee7J4o5+hM0CTjWg+kB4GyFTSdUxj2X/gFa1TAxcExH9eMLf5sfF30Z7N
         +xChYOhH0TCkAjMyMl7aXZ+z0mz8Rcp/B0z6mGzTSpD0XnYFKoeD3vT79Nc9LXefKKnX
         8Chxxfl45vo/8kGhelSs5Qyc+dwZm8JiyXTsAfivo6WfjjKUTvF6bsjVPIxVH8SX6p+5
         offW6M3fiYi2pf57nsWCXGotf4DEIH3rpw4V5pD/JPTuRuFPVp+rHLljEcB6MB46y3Xm
         O3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672917; x=1744277717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5CAypoWaAtWtu473NN12TufcIHrlJkEOgdxMCUBBgo=;
        b=okUI1pLdw3l4VsqjAIdn7hvnCOQ3p5O6y0TqXYSs8mhfyOhFLDWELYoBke6uR4iiNu
         Jy9ajLKPDAWUMQhPrNeRZIYF9zDmP8Rui5BqfSvEpV5S2WX0qiaQmRYE/QONpV0XVpaR
         7ygYdMZejjPMhNJwWRTCOvTP9XlKv6ssSiqwhG+Zr+mns2XYW3W0/dhlwycm5zuLUUsh
         xoUM8pq4w8WiXV22MiwGk90HOmcyx+sfevsDZ7dvr8bdFGd6m55K/pgv133Lvn1mqFfa
         6Y+y55XDV297SQaJjR/XViOZ1nGQUhPTgDgvo/jOt7y4++WRknMp+hGoQReH5f9xMD/g
         pggA==
X-Forwarded-Encrypted: i=1; AJvYcCXcdSApwOwJSZs6Vuhp6HnI/G1u6NZ+vgte6HMnJ8kr1vbrPbeHFFTfjZSQhKmaA2LoJpC8v01Scf4DX0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK0gMw6/RfzEAATzc8VqWNwimxxffGFthbxn5i8AnKvFAsxUGl
	DGrmzFXrskn1SRxRXV83fmbgLDKLxVMwi+IYPA2gGLa4eY0dqTvrkud2d0wUh3U=
X-Gm-Gg: ASbGncsPC5SMma/JL0sOwzLehRRIi3OamOqMIK4aMoO95NHROVh/aoXWCaF1k4pUyTG
	anDvp7NKDs3ZIT9Q3xIkLagHTCib3L7woskrCkmQRe34z/PeC1cRncMpmgLiSAdjlAq8f9aV89R
	e1hdFyheiZIPaofjSjVA9kARD8k2ThHkPqaBa+Tb9l7nyTOXk/YR3cPuWt1RxSwyZ5H5BaJVu3/
	ASb0CljWM8XoG+uqqLZuwsOm76sA9EwWutA1VCRu9kUok5N4rb6+mabXRvpcFlq787TlMly+Es/
	9khKKLtJMXhXkQO75bXqLNpz8x1ZUnJhwtwIAxP00SFipMaxZU3TfcEOtQJhM68=
X-Google-Smtp-Source: AGHT+IEDow1XNrGFKRCrJe0HVDXIHcCY2J/XMVIEnBD6x/XU9lYgAvHJFWPEa5Ku+bo7CEPYTjTcEA==
X-Received: by 2002:a05:6000:2913:b0:391:3988:1c7c with SMTP id ffacd0b85a97d-39c29754657mr4540681f8f.24.1743672917108;
        Thu, 03 Apr 2025 02:35:17 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c301a7045sm1305774f8f.39.2025.04.03.02.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:35:16 -0700 (PDT)
Message-ID: <56cbe0a0-048e-45a2-87f2-e2515c7e7414@linaro.org>
Date: Thu, 3 Apr 2025 10:35:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <2025040143-espionage-poison-2345@gregkh>
 <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
 <2025040230-showoff-spray-ac83@gregkh>
 <283ac88b-c8d4-47c8-9ff7-935770eca566@linaro.org>
 <b6e7abf3-b263-410a-8f4c-eb9a8e2efa2b@oss.qualcomm.com>
 <e8c91706-1a94-4e3d-b2a9-9d670021bbc8@linaro.org>
 <CAO9ioeVYYy-10ZBmNLMzZK2+mZ5mKf_ZtGwRVf__Dg8GA=Sf0Q@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAO9ioeVYYy-10ZBmNLMzZK2+mZ5mKf_ZtGwRVf__Dg8GA=Sf0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/04/2025 10:31, Dmitry Baryshkov wrote:
> On Thu, 3 Apr 2025 at 12:27, Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 03/04/2025 10:25, Dmitry Baryshkov wrote:
>>> On 03/04/2025 12:18, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 02/04/2025 12:31, Greg KH wrote:
>>>>> On Wed, Apr 02, 2025 at 09:19:17AM +0100, Srinivas Kandagatla wrote:
>>>>>> HI Greg,
>>>>>>
>>>>>> On 01/04/2025 20:18, Greg KH wrote:
>>>>>>> On Sun, Mar 09, 2025 at 02:56:50PM +0000,
>>>>>>> srinivas.kandagatla@linaro.org wrote:
>>>>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>>>>>
>>>>>>>> Hi Greg,
>>>>>>>>
>>>>>>>> Here are few nvmem patches for 6.15, Could you queue
>>>>>>>> these for 6.15.
>>>>>>>>
>>>>>>>> patche include
>>>>>>>>      - updates to bindings to include MSM8960, X1E80100, MS8937,
>>>>>>>>        IPQ5018
>>>>>>>>      - add support to bit offsets for register strides exceeding
>>>>>>>>        single byte
>>>>>>>>      - add rockchip-otp variants.
>>>>>>>>      - Few enhancements in qfprom and rochchip nvmem providers.
>>>>>>>
>>>>>>> Ok, I wanted to apply these, and tried to, but they fail horribly
>>>>>>> because:
>>>>>>>
>>>>>>> Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned reads")
>>>>>>>      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
>>>>>>> raw_len")
>>>>>>>      Has these problem(s):
>>>>>>>          - Target SHA1 does not exist
>>>>>>> Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit
>>>>>>> reading is required")
>>>>>>>      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
>>>>>>> raw_len")
>>>>>>>      Has these problem(s):
>>>>>>>          - Target SHA1 does not exist
>>>>>>> Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than
>>>>>>> one byte")
>>>>>>>      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
>>>>>>> raw_len")
>>>>>>>      Has these problem(s):
>>>>>>>          - Target SHA1 does not exist
>>>>>>
>>>>>> Looks some of your scripts or b4 is picking up older version v1 of the
>>>>>> patchset
>>>>>>
>>>>>> None of the above patches have Fixes tags in the V2 patches that I
>>>>>> shared
>>>>>> aswell as patches in linux-next.
>>>>>
>>>>> Yes, that looks odd, it looks like b4 pulled in the wrong series, yes.
>>>>>
>>>>
>>>> Even that looked incorrect, as the v1 series only had one
>>>> patch("[PATCH 12/14] nvmem: make the misaligned raw_len non-fatal")
>>>> that had fixes tag. Not sure how these 3 patches are tagged as fixes.
>>>>
>>>>> But, that's even worse.  Those "fixes" are now not actually marked as
>>>>> fixes of the previous patch.  So that information is totally lost, and
>>>>
>>>> Its because this patch("PATCH 12/14] nvmem: make the misaligned
>>>> raw_len non-fatal") is taken as fixup patch and wrapped into the
>>>> original patch ("nvmem: core: verify cell's raw_len"), Also the sha
>>>> will not be valid for linus or char-misc tree.
>>>>
>>>>> again, the first commit here, "nvmem: core: verify cell's raw_len" is
>>>>> broken so much that it took 3 other changes to fix it, which implies
>>>>> that bisection would cause problems if you hit it in the middle here.
>>>>>
>>>>
>>>> All the patches related to this are enhancements to nvmem core to
>>>> allow specifying bit offsets for nvmem cell that have 4 bytes strides.
>>>>
>>>> Specially this check is also an additional check in core to make sure
>>>> that cell offsets are aligned to register strides.
>>>>
>>>>> While fixing patches is great, and something we do in the tree all the
>>>>> time, let's not purposefully break things and then fix them up in the
>>>>> same exact patch series please.  That's just sloppy engineering.
>>>>>
>>>>> Please redo this series completely.  I can take the "new device support"
>>>>
>>>> I can send them but its going to be exactly same series, I dont think
>>>> anything will change as all of these patches are enhancements and
>>>> there are no fixes.
>>>>
>>>> I hope this clarifies a bit, Please let me know if you still want me
>>>> to resend this series, which is going to be exactly same.
>>>
>>> I think Greg is asking to squash the fixup into the relevant patch.
>>
>> Its already squashed up in v2.
> 
> Then there should be no Fixes tags. Is the series that you are sending
> visible somewhere?

Yes, there is no fixes tags in v2 series,

Here is what is sent to as v2:
https://lore.kernel.org/lkml/47a3a851-f737-4772-87c6-98613347435c@linaro.org/T/#r01449e17cf6f9396967a822a0460ad4b1245e914


thanks,
Srini
> 
>>
>> thanks,
>> Srini
>>>
>>>>
>>>> --srini
>>>>> patches at any time, and really, those should be marked with Cc: stable
>>>>> to get backported, right?  The other ones are written as if they are
>>>>> fixes, so again, I can take them any time, no need to wait for the -rc1
>>>>> merge cycle.
>>>>>
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>
>>>
> 
> 
> 
