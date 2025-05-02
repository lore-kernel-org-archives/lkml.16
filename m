Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B11F426C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746174037; cv=none; b=WTOeouBvIleQU7x7DxAFKM0ixfiDZTGkRH9LFhBv4jf8J0XVp1HByr7gIFz/CXXLXdT3ue5b59rCh1Sj6B3KfLITrqr5dYOTX3OUalJB/JdQyNoHK12+QpeD8qrDfIVO5dv1PUIKshKISBvHlxVQldTCiQHJP9gcKP2BNjp57Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746174037; c=relaxed/simple;
	bh=h7eAaDyiYP4pND18DDj7M+We3dOxn1dowmirOubgGOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XckXNPlIZToAcrAQtyhck5wrUXLLR2xp4FOA8w03/IPLBAZiOx9po2qVS2LNyrK10dHEbOZdHdUyh6MvDBH3ZT1RACmrQtLiBPk468VLjWklfDWlBKsaqdntA78qIrjbCA+SxxCNWykhsSD3F0zY1D8zliZQbb+sMdL2VZeFGeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1zwT4Lv; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1zwT4Lv"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso2253818e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746174034; x=1746778834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kXLFubqUkd5cIugy8JrkNYO6BUnEgO3u7Ym3AjRCy0=;
        b=C1zwT4Lvj+A537JxQ6G154hnIFCUHcuGKpv1iaQFQ4o/Qd0sHfx8YfvuQea1jyXhdW
         w+4zB/M8U0CQdv1f538KS+2TxuQz7o5JIWOEHWcDzMjUCJtGpDOI8x+5Zi5AHfL2J7Ky
         EneCLUi7U1Z1Zrjs6uxoMNBwSADeMdP7dDtjZwAihigPIhr68tEv4hLCJ4mgZeIpd8C0
         l1PTeTsIgIhW6D9rbMO3yMco3NNQalA9RUKPBRHaVZxNYJH0ChU22U9TCBlIHIPFhblN
         NyeSEuKaJKbFq4RrT3veiGNRu0e2/zz9UiDtHA62hKHeI1gL/icmV1ntQaLCfReWLlNA
         eUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746174034; x=1746778834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kXLFubqUkd5cIugy8JrkNYO6BUnEgO3u7Ym3AjRCy0=;
        b=H9UdlSELWuCoh6VQzq0BpGKhAEcmfRNe6zFR+PJTaG6du+JmM2jQmF1U5aeyg4Dgt3
         ow4ei+THVXAMCuHfLBWcSGXLmeetbei/PRJ1y5+yS6Yitjn/WA7kns1Dy8+0B8afSCiK
         7Pk05j4e5jnRTp7RNJjgBrXCWDDnPQlGoq34yuQevY39aG1oYN487GsZUnuSzSYZVIMf
         shx3ChJLOf52FzGJFYALkljdGcr+4KPuME/yile63BsICvi36bWK2ZTldTbsEkacbtFY
         eXP+LPCGcG1ee5zGEFfmSqkvrqriFkbTXxHBQLV5OLKxOTl9KVoXaeiq+wkDXdTEeiWy
         hg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2EWx6qylEef0PKKf5PyFViGrvo+o+a9eW/5ghkQVdE2JRQIq7KUA6JbZxwBWhMpaDfnvSHYwAXwbU+40=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA9iSv2tl/B7GG+fiY19sN+l8iIgdKW7a/YLokLf5M/V67e3wL
	mdM5QuxEuz/iSUKtKxg1ZgW1ediz7s9UZ75witMWlQWbgK1lq4df2o4AJQ==
X-Gm-Gg: ASbGncvTap9OEt7rmv5xeagLcVp4UVqDqXS4gF9QdwqXzsrJt9LT9/l0DFvq0bw7/DD
	msGLgEBLUN2c7UOHrLcL9hBO7Q6smJ3ygd9B9Dba7dH9pBX+ukIhALUCF96nYMGrwuMbS/SOLj4
	i2nB0CRMhqLUs+LmaN/0BHrgPY4Fqe4jVFg44oqy3UrrBoDDswvDIZnL6aqxpQj9fZZCdRULRZ0
	aCfY9ILoyqMWlPAW+2b8v5wP25aTJ42M9k3Gk9jD+Z2pmGT2Ss/HNZEHhsSKDPd7XoSeX5LCoER
	g5z44OhUW1n2wlx9YQYszl1tUK+bhi/jn0fFZZXR8cAAEqsu3KYs/8x2Nn1oB5JuXJMmW1aK5mL
	J/X1ank1N9R0Gk1hOHsTuQQ==
X-Google-Smtp-Source: AGHT+IGHBZBwvbyjgg70qRknVRZ/yMRFAPY+vnKyWGQh7bMoIY+H8P1fmqaz0UZGPN+UuYxt/3ZOaQ==
X-Received: by 2002:a05:6512:3d15:b0:545:2f0d:8836 with SMTP id 2adb3069b0e04-54eac243a0amr416668e87.40.1746174033592;
        Fri, 02 May 2025 01:20:33 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f1719sm293392e87.161.2025.05.02.01.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 01:20:33 -0700 (PDT)
Message-ID: <2996270f-d03e-45f7-9b6b-c5675c39515b@gmail.com>
Date: Fri, 2 May 2025 11:20:32 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: bd718x7: Ensure SNVS power state is used as
 requested
To: Esben Haabendal <esben@geanix.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250501-bd718x7-snvs-reset-v1-1-1fcc7088200e@geanix.com>
 <j3M49vfoxys9iFGLs2PwAULHoQsSQsHAKmaT1D2QCwyjUJNzjxXKESFYkXasW3_3owOakk-tXosNLIgfnMC6vQ==@protonmail.internalid>
 <52221c62-689c-44d2-b65d-07a5301090b3@gmail.com> <87tt638q7t.fsf@geanix.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <87tt638q7t.fsf@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 09:46, Esben Haabendal wrote:
> "Matti Vaittinen" <mazziesaccount@gmail.com> writes:
>> On 01/05/2025 17:48, Esben Haabendal wrote:
>>> With the introduction of the rohm,reset-snvs-powered DT binding [2], the
>>> PMIC settings were only changed when the new property was not found.
>>>
>>> As mentioned in [1] the default for BD71387 and BD71847 is to switch to
>>> SNVS power state on watchdog reset.
>>
>> I suppose you mean READY, not SNVS? Commit seems to state:
>> "By default only wathcdog reset changes state from poweroff to ready."
> 
> You are absolutely right. Sorry about that.
> 
>>> So even with rohm,reset-snvs-powered added to DT, a watchdog reset causes
>>> transitions through READY instead of SNVS.
>>
>> The original idea of the rohm,reset-snvs-powered was not to configure
>> the SNVS to be the target.
> 
> Makes sense.
> 
> If we keep it that way, then I think we should change the description of
> the binding. "Transfer PMIC to SNVS state at reset" tricked at least me
> into believing it would actually make the kernel setup the PMIC to
> go to SNVS state at reset.
> 
> Maybe someething like:
> 
>      PMIC is configured to go to SNVS state on reset. Bootloader or
>      something else is responsible for configuring the PMIC to do this.
>      The driver will not change this configuration when this property is
>      present.

I am not objecting this. And adding your suggestion at the end of the 
mail should make things, well, not pretty but working.

> I guess back in 2019 when you introduced the rohm,reset-snvs-powered
> binding you had to keep the code for writing to TRANS_COND1 in the
> default case for backwards compatibility. But in hindsight, I think the
> asymetry caused by not doing the same when rohm,reset-snvs-powered is
> used is what caught me off guard.

Yes, I agree. It should have changed the reset target from the day 1, 
but as I didn't do it right back then ... We now may very well have it 
somewhere it shouldn't be, and changing this is somewhat risky.

> But that is water under the bridge...
> 
>> The driver was mostly built to assume that the PMIC has been
>> configured by earlier stages like uboot, and configs in the driver
>> were mostly introduced to make power rail enable states controllable
>> by the software - without risking the rails to be left off. Thus,
>> AFAIR, the values set by boot (or other power manager MCUs) haven't
>> been overwritten is the "rohm,reset-snvs-powered" has been found.
> 
> Got it.
> 
>> Configuring for example the hardware watchdog related stuff at Linux
>> driver boot is somewhat late, since watchdog should probably be running
>> already - and hangs might happen prior the driver probe.
> 
> Yes. But this specific configuration is not too late to do at driver
> probe time, although it is better to do it as early as possible.
> 
>>> And with the default reboot
>>> method in mxc_restart() is to cause a watchdog reset, we ended up powering
>>> off the SNVS domains, and thus losing SNVS state such as SNVS RTC and
>>> LPGPR, on reboots.
>>>
>>> With this change, the rohm,reset-snvs-powered property results in the PMIC
>>> configuration being modified so POWEROFF transitions to SNVS for all reset
>>> types, including watchdog reset.
>>
>> As far as I can say, this change is, in principle, fine. The
>> "rohm,reset-snvs-powered" shouldn't be populated in the device-tree, if
>> SNVS is not meant to be used. My only worry is that the BD71837, 47 and
>> 50 have been on the field since 2018 - and I am not at all sure all the
>> device-trees are sane...
> 
> Yes, there is no way to know that fore sure. Even verifying the sanity
> of the in-tree device-trees will require quite some work.
> 
>> And if we configure the reset to use SNVS state, then the software
>> controlled regulators will not turn ON after the reset. Fail to mark
>> them in the device-tree and the device will be dead until battery is
>> drained or removed.
>>
>> Is there a way for you to set the "target state" at boot SW?
> 
> As of right now, not really. I am currently stuck with the existing
> bootloader. I will replace it sometime later, and at that time, I can
> make it configure the PMIC properly.
> 
>> I think that should work as the Linux driver won't touch the target
>> state if rohm,reset-snvs-powered is set(?)
> 
> That should work, yes.
> 
>> This is not NACK to the change, this is asking if we had a safer way,
>> both for other users and also for you (since I still think these configs
>> should be done prior Linux driver probe)...
> 
> We could create another device-tree binding to make the driver override
> PMIC configuration to use SNVS state on reset. But, in order to maintain
> backwards compatibility with the rohm,reset-snvs-powered, I don't know
> what to call it without adding more confusion. Maybe something like
> rohm,force-reset-snvs-powered?

This should keep the existing users happy while also supporting your use 
case. Together with fix to the description of the 
rohm,reset-snvs-powered (as you suggest above), this should work even if 
it's not really pretty. I am not sure how the DT folks see this though.

Another option is to change the rohm,reset-snvs-powered to have a value. 
Something like:
rohm,reset-snvs-powered = "default"; or
rohm,reset-snvs-powered = "forced";

> But although I found the bidning confusing at first, and currently is
> not able to configure the PMIC before starting Linux, I agree that
> it is better to have bootloader or something else handle PMIC
> configuration, so it is setup as early as possible.

Probably yes.

Yours,
	-- Matti
