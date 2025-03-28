Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7A4E545
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195494; cv=none; b=PXHr2FlveOU2cxMOSsLOcX4chnBhqBq1KK3bedpb9+u9gTZhZRzzq9RVZmdcDsebFh67bAMbHVlhzsZoYRgRkFGK9muQjd58dnDlnh8klYO+bkzVs2YL9pox1Mlu5XxXIv3av8eprGMNeXymtk+8sXSm2ds33rUsz0BDLk6HqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195494; c=relaxed/simple;
	bh=BVW0XhDPO/2+9RSGuGhR87CPWwNGqHO85wYj08m4tgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWbTYD+J62mVKm2B3X1/d7n9vwEY0q+xJnOWpfaP1Nm+TQpPSd9Mx7NMDstdLUNGw37Dj8v1HwRT0DUylfUKw2b3vWxxcnOQZkslaB0oGNH6S1vq16GC+pszp/OhsEaWfIErtBgTirF7kNa5tEfwNFTJPvjxd/lDWSa1ARVxxJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QyZlPKw9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QyZlPKw9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso18701695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743195491; x=1743800291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+oTTaYulNzz2jhtw5cRdi7qx7l2fz5I36Z6TNtlMsWM=;
        b=QyZlPKw9lJHmORWNmauhUa0wmqtUPnSXO/+5SzUaFVu6buUy/lW4QZgWI2wQajoJ+G
         QMJRKvDIUxAKR9u0QLwooDPAdu76nWUxK96JNuk9oqiua8Fq6JOCCuIHqcJcFjCbCLkh
         3nZZKCN3gNXFwa/3IrGXOWDwVwhUPx1gmUPjG3cRLEjgvxna8sGUS+sSq0Na4Fefq62B
         zDJM1SEn3Wwx/f83w5NHVWoBab73bUwWE2tHDfeqFb4yM8F9Gi7pnRpXdyNBecoo6f2T
         fm4w3B9SiKd00St0OPkk7A8vzu0YGs8I23cSKqdigICojYsDn3cwbm777ee+KsRzsU6O
         BJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195491; x=1743800291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+oTTaYulNzz2jhtw5cRdi7qx7l2fz5I36Z6TNtlMsWM=;
        b=PjKiPaxOC6YLp6U1TOfKkD4kbwqX6FEZb0qKlxM1VN7T9BDf4NTvlmgWfUs3qm0UA7
         k1zT1jM3gjIvL/vB3cC4/U6uJN3Yn0Vza0mN8AFZ7zUeeiCDrHDasMDLx/krxDf1Tx3u
         X3/475rUBwhksowpCJxYpbR2EWfnBHwS4j/TzssVLVZPv9ERfh9jpgKMD01xtvcf02dC
         Qd5oYwL5iduezaZFfh9Ux8cit1Ms5+d2ZXPHHxHhGP2X4nr4vJ1y6no0yVL9VUpVYPh2
         SeEnIslQjqOs+4ySaVQOT//6SflICKdMMefOEqGdX8JofgclyKOOrcVY+BLcOvIJVbf8
         iQiw==
X-Forwarded-Encrypted: i=1; AJvYcCXdJh5mF7eFirMwfEoHowuArmcbcF30iLSZIh2yeQV7Lt7FAIH+zXM6I60rEplvgl0JNnHqoK8u2dfHW0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzYOkd62y6fYV89ve46JoSQZa6zqSymbALh/tlQVB0TYTG8Rf6
	KY41EEUJhZzg4O4iQEH12PUKDyxAFjCOtqsT9KvCVcI6iHj5FMgymtLDg6V9vR8=
X-Gm-Gg: ASbGncuO4z09e/2K1yxI75icOrsH83JUtgKFbxIdt8gwqJeXdReJUaLnac+znnQTpBo
	KLRPxcW6pXbG5bKqZZ5rsr1uK7A69iLBRb3ab0rHbZyvXpISJyhP5BInPQ/cVLavM6maocIU2Te
	+p+nWPDTytXsDzjRZLSWU2fgI6D3zk03D4YFWJCwu7ch19kOjPC0EJiZ7c8PopKrwHLxCVrYAPz
	ogewOgFG3Ss7QxNiACcP2SoDfBjkoT3sNuylkvcKIgrDbRmXlSY+c5o/S0sMlsFKOgcLxmU+SBj
	X0XhMWzwCpA1T0HEBx3QP0KwRetOqzny+1ZVOIu7hx/Qb8sjThk40wlV84RFZxUV0p738EZ7PHQ
	Q8CRZaEIs
X-Google-Smtp-Source: AGHT+IFqXU1M+Pd6CMFBypVz3suv5poS4ILSOIL1uN7LFhe180YHnGFtscVuw9P793mhMEzt5SW0Pw==
X-Received: by 2002:a05:600c:468c:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43db61b52e5mr10442915e9.2.1743195491122;
        Fri, 28 Mar 2025 13:58:11 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d82efe678sm81785095e9.20.2025.03.28.13.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 13:58:10 -0700 (PDT)
Message-ID: <80ed9b3d-4d84-4bd4-8fba-20485e8a0731@linaro.org>
Date: Fri, 28 Mar 2025 21:58:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Add the Software Watchdog Timer for the NXP
 S32 platform
To: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <20250328151516.2219971-2-daniel.lezcano@linaro.org>
 <a7c9715f-b912-49dd-a664-7b5e6017d0fa@roeck-us.net>
 <03f65f72-4727-44c7-90cb-6d251f360c85@linaro.org>
 <5ee20c44-0846-440d-8ae8-8f7e6b8743cf@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <5ee20c44-0846-440d-8ae8-8f7e6b8743cf@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/03/2025 20:56, Guenter Roeck wrote:
> On 3/28/25 12:42, Daniel Lezcano wrote:
>>
>> Hi Guenter,
>>
>> thanks for your review
>>
>> On 28/03/2025 19:10, Guenter Roeck wrote:
>>> On 3/28/25 08:15, Daniel Lezcano wrote:
>>>> The S32 platform has several Software Watchdog Timer available and
>>>
>>> Why "Software" ? This is a hardware watchdog, or am I missing 
>>> something ?
>>
>> I have no idea why it is called 'Software' because it is indeed a 
>> hardware watchdog. It is how NXP called it in their technical 
>> reference manual.
>>
> 
> I guess it is because it resets the software. Please drop the term;
> it is misleading.

Ok, I will drop the term but keep a reference to the NXP documentation.

>>>> tied with a CPU. The SWT0 is the only one which directly asserts the
>>>> reset line, other SWT require an external setup to configure the reset
>>>> behavior which is not part of this change.
>>>>
>>>> The maximum watchdog value depends on the clock feeding the SWT
>>>> counter which is 32bits wide. On the s32g274-rb2, the clock has a rate
>>>> of 51MHz which lead to 83 seconds maximum timeout.
>>>>
>>>> The timeout can be specified via the device tree with the usual
>>>> existing bindings 'timeout-sec' or via the module param timeout.
>>>>
>>>> The watchdog can be loaded with the 'nowayout' option, preventing the
>>>> watchdog to be stopped.
>>>>
>>>> The watchdog can be started at boot time with the 'early-enable'
>>>> option, thus letting the watchdog framework to service the watchdog
>>>> counter.
>>>>
>>>> the watchdog support the magic character to stop when the userspace
>>>> releases the device.
>>>>
>>>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> ---
>>
>> [ ... ]
>>
>>>> --- /dev/null
>>>> +++ b/drivers/watchdog/s32g_wdt.c
>>>> @@ -0,0 +1,362 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Watchdog driver for S32G SoC
>>>> + *
>>>> + * Copyright (C) 2014 Freescale Semiconductor, Inc.
>>>> + * Copyright 2017-2019, 2021-2025 NXP.
>>>
>>> Does this originate from out-of-tree code ?
>>> If so, a reference would be helpful.
>>
>> Well, I kept the copyright but this implementation is mostly from 
>> scratch.
>>
> I am not a copyright expert, but if this isn't derived from some other 
> driver
> it should not include old copyrights.

Ok, I'll put only the NXP copyright

[ ... ]

>>>> +static void s32g_wdt_debugfs_init(struct device *dev, struct 
>>>> s32g_wdt_device *wdev)
>>>> +{
>>>> +    struct debugfs_regset32 *regset;
>>>> +    static struct dentry *dentry = NULL;
>>>> +
>>>> +    if (!dentry)
>>>> +        dentry = debugfs_create_dir("watchdog", NULL);
>>>
>>> That is a terribly generic debugfs directory name. That is unacceptable.
>>> Pick a name that is driver specific.
>>
>> Why is it terrible ? We end up with:
>>
>> watchdog/40100000.watchdog
>>
>> There are 7 watchdogs on the platform, the directory is there to group 
>> them all. It seems to me it is self-explanatory, no ?
>>
> 
> It should be something like "s32g/40100000.watchdog". Someone could have 
> some other watchdog
> (say, a real software watchdog) in the system and decide to use the top 
> level directory name
> for whatever reason. The top level should be something driver specific, 
> not a generic name.

Apparently we can have a subsystem creating the subsystem directory.

For example regmap is created by the core framework:

ls /sys/kernel/debug/regmap
4009c240.pinctrl-map0  4009c240.pinctrl-map1  4009c240.pinctrl-map2 
4009c240.pinctrl-map3  4009c240.pinctrl-map4  4009c240.pinctrl-map5

drivers/base/regmap/regmap-debugfs.c
   regmap_debugfs_root = debugfs_create_dir("regmap", NULL);

Or pinctrl:

ls /sys/kernel/debug/pinctrl
4009c240.pinctrl  pinctrl-devices   pinctrl-handles   pinctrl-maps

drivers/pinctrl/core.c:
  debugfs_root = debugfs_create_dir("pinctrl", NULL);


Would it make sense to have the watchdog framework to create this 
topmost directory and have the driver to use an API like:

int watchdog_debugfs_add(struct watchdog_device *wdog);

with wdog->debugfs set by the caller.

No need to have more API. When the driver is unloaded it can destroy its 
own directory. And when the core watchdog framework exits, it can 
recursively destroy the topmost directory.


>>>> +
>>>> +    dentry = debugfs_create_dir(dev_name(dev), dentry);
>>>> +
>>>
>>> Where is this removed if the driver is unloaded ?
>>
>> Oh right, I missed it. Thanks for pointing this out.
>>
>>> Also, if the driver is built into the kernel, it seems to me that a 
>>> second
>>> instance will create a nested directory. That seems odd.
>>
>> No, because there is the test above if (!dentry) which is a static 
>> variable.
>>
> 
> Yes, and then the second watchdog will create 
> "watchdog/40100000.watchdog/40200000.watchdog"
> or similar because dentry is overwritten with the reference to 
> "40100000.watchdog"
> 
> Thanks,
> Guenter
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
