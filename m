Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFB3242917
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185358; cv=none; b=a7J1/RBn1f0y8gK2vpwI6vDaciDB5nS5VXQobrvkY1OTywC3pheJYGXLUp+C/OTR69Je0TWIv9F6V/RzhCm+pAUv2fNbfMiYboFvdetzsKkgyA4cIXLO4QC+ltnuLhtxZdDQd48xOxSBCUJtFHUlEHE+8q+eY06vOcMJPZULZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185358; c=relaxed/simple;
	bh=94NVtr6krstqHMTTZ555PRDY2kTGLV93n01XyLSDDys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ig3/PTtFEkpcm/0ziK/IxiFMDSORcOXp37AaRgRd5o/aLGwDLbbZxDkJOjCx+JfekMmmUVdN+l19EHa5lvpE/VY2RX8eLp06lUuvdc9tC75LnUMvlyl54Jblf8d7SLrC+M8ejKAG20nksvw/HYpI/FzkUJYASjDvJQQwQxr+HQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bpUuxEb/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpUuxEb/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso10441165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 04:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746185354; x=1746790154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7lQ2KJpFgFghZWMP1n0kwnc11fDUmwjZq9ZoI5Ygwc=;
        b=bpUuxEb/MCF2roZH2zzxppCLCRgAlRruMXiXRAWHG0VuW204oIzWRvVtLKaa16ZAV2
         xs/Oh59jBDQ97lA97EduT+OyRfYjJLxzVhrA+koqrr80K+GlSdXrchx0aE69MOoUB6bw
         rGtuZL7xmOk8PkQyDqgKzWU1Ia7Ce2Q48cpH79Ft5Xjq6g4ol67c1lcZVg9HWU2XyRNk
         6S30iolRB/S8xo2E8rD5t+4kXpmBq8Dt2zw8kclUJ40GJHlQk5Ap2xYbV4UU2StOnLMn
         4jSPetLuJwZbn3Pv6xYSvxEcYPyJyC8csRJIwU0GlKW0D1WSeISj6SntqSbDClsVn1ka
         Au4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746185354; x=1746790154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7lQ2KJpFgFghZWMP1n0kwnc11fDUmwjZq9ZoI5Ygwc=;
        b=GwnmaXya7m7/vJSvMmcC9YYZQ8HtWaNZqZynJS38uPWZZ5/v9MeuIi1Td2sb6ueowz
         qnfg9747AyTPIqwqB6xDr/FRfvkVN8H7r2ivtbLrReIijsJlTFs5h3GV+xNhgA/78ug7
         WT8Jnem7SNFrpmfTif1FCMCI4jgA21Oq4p6vSXqRgD9rWFKKaRasOwnrQKWCPmzSudLd
         Aln1bvRsfd+opNdPvC87XxM3ni92OV7rONAPOwKeZYKhPSxD1TDt5LZSEms53eeJM7gO
         wOd7BqiNwzkGE8c55DEnAashBI1p+5XZZuX9DbAmJ9cVHrLspzhDoPoRxJNIZdpH1pLJ
         vV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBbde4sHx/8hwarkJibG6TwEPw+Y/EOXpVwflDZZEcFWVjJ/+YPu8AWVtqQPdgg9mNxa4/nNAeYIB95Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ74hPPnEqYXPHpQG1HTCTMI9Skis4HDWJFPrS6Ok2uBj6dJoj
	0rvbVM0/Wbr4ueu73XTnP0vqRrQY65sdrt27zzZ/qV0UWZ4aid25nq2/GUWF26A=
X-Gm-Gg: ASbGncs/4JXllF6RnciONd61iK8WuUHG/yq/v3gtmt1KQ1E8XfuE/ovmysNCLc1ztq8
	8XsVvcmtR/3bpivNyv30Fbb5Vvu1iTuKSXJ5UBRGBMTGMWtK2EieuHaFKcUADps+G/WydAIPuAG
	U+8O9FmQJRig0HsFkvavYARy96Rc9kp/sQZBIWAwxGOMTVGbZ7okd/neiNr9meIwz3VUdi4tgJy
	Ux2gcoAqSPQMSPZrVu1NJSn7G4CMpzc/riXv1zyT+vabMvKSw0hhwiyHPiIrpuqE+03BbcqLLAf
	9ORC1qzOE3Ar+SlcmLDGL9FarkSRC745OU01eC/t2l3vrzW+pxs2/3HqjlTVdJJMH0NClyOMJpH
	hEnS6MaSyWY0gyso=
X-Google-Smtp-Source: AGHT+IFH/Ju9ylz2xfklPPHdxXrknsXyS6ERW44I660ysylljtJKq0zkxnpquI6Rz77t0LPxmGBGWA==
X-Received: by 2002:a05:600c:c0e:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-441bbf3bd7bmr19248205e9.27.1746185353813;
        Fri, 02 May 2025 04:29:13 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-441b2b28082sm86703725e9.34.2025.05.02.04.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:29:13 -0700 (PDT)
Message-ID: <93f063fa-0012-4018-8c37-a2bfa623d2bf@linaro.org>
Date: Fri, 2 May 2025 13:29:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
 tglx@linutronix.de, pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sumitg@nvidia.com
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
 <aBSOJTlQUUnFIEVr@mai.linaro.org>
 <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
 <aBSjyZJ0__ctBa-4@mai.linaro.org>
 <5824d505-0a42-40cc-84ec-814f0bbfb79f@nvidia.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <5824d505-0a42-40cc-84ec-814f0bbfb79f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/05/2025 13:06, Jon Hunter wrote:
> 
> 
> On 02/05/2025 11:51, Daniel Lezcano wrote:
>> On Fri, May 02, 2025 at 11:16:17AM +0100, Jon Hunter wrote:
>>>
>>>
>>> On 02/05/2025 10:19, Daniel Lezcano wrote:
>>>> On Fri, May 02, 2025 at 12:37:25PM +0800, Robert Lin wrote:
>>>>> From: Pohsun Su <pohsuns@nvidia.com>
>>>>>
>>>>> This change adds support for WDIOC_GETTIMELEFT so userspace
>>>>> programs can get the number of seconds before system reset by
>>>>> the watchdog timer via ioctl.
>>>>>
>>>>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>>>>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>>>>> ---
>>>>>    drivers/clocksource/timer-tegra186.c | 64 ++++++++++++++++++++++ 
>>>>> +++++-
>>>>>    1 file changed, 63 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/ 
>>>>> clocksource/timer-tegra186.c
>>>>> index ea742889ee06..8d5698770cbd 100644
>>>>> --- a/drivers/clocksource/timer-tegra186.c
>>>>> +++ b/drivers/clocksource/timer-tegra186.c
>>>>> @@ -1,8 +1,9 @@
>>>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>>>    /*
>>>>> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
>>>>> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>>>>>     */
>>>>> +#include <linux/bitfield.h>
>>>>>    #include <linux/clocksource.h>
>>>>>    #include <linux/module.h>
>>>>>    #include <linux/interrupt.h>
>>>>> @@ -30,6 +31,7 @@
>>>>>    #define TMRSR 0x004
>>>>>    #define  TMRSR_INTR_CLR BIT(30)
>>>>> +#define  TMRSR_PCV GENMASK(28, 0)
>>>>>    #define TMRCSSR 0x008
>>>>>    #define  TMRCSSR_SRC_USEC (0 << 0)
>>>>> @@ -46,6 +48,9 @@
>>>>>    #define  WDTCR_TIMER_SOURCE_MASK 0xf
>>>>>    #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>>>>> +#define WDTSR 0x004
>>>>> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
>>>>> +
>>>>>    #define WDTCMDR 0x008
>>>>>    #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>>>>>    #define  WDTCMDR_START_COUNTER BIT(0)
>>>>> @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct 
>>>>> watchdog_device *wdd,
>>>>>        return 0;
>>>>>    }
>>>>> +static unsigned int tegra186_wdt_get_timeleft(struct 
>>>>> watchdog_device *wdd)
>>>>> +{
>>>>> +    struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
>>>>> +    u32 expiration, val;
>>>>> +    u64 timeleft;
>>>>> +
>>>>> +    if (!watchdog_active(&wdt->base)) {
>>>>> +        /* return zero if the watchdog timer is not activated. */
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>> +    /*
>>>>> +     * Reset occurs on the fifth expiration of the
>>>>> +     * watchdog timer and so when the watchdog timer is configured,
>>>>> +     * the actual value programmed into the counter is 1/5 of the
>>>>> +     * timeout value. Once the counter reaches 0, expiration count
>>>>> +     * will be increased by 1 and the down counter restarts.
>>>>> +     * Hence to get the time left before system reset we must
>>>>> +     * combine 2 parts:
>>>>> +     * 1. value of the current down counter
>>>>> +     * 2. (number of counter expirations remaining) * (timeout/5)
>>>>> +     */
>>>>> +
>>>>> +    /* Get the current number of counter expirations. Should be a
>>>>> +     * value between 0 and 4
>>>>> +     */
>>>>> +    val = readl_relaxed(wdt->regs + WDTSR);
>>>>> +    expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
>>>>> +    if (WARN_ON(expiration > 4))
>>>>> +        return 0;
>>>>
>>>> Each call will generate a big warning in the message. May be simpler
>>>> to add a pr_err() with an explicit message.
>>>
>>> I prefer the WARN. This should never happen. If we do change this, then
>>> dev_WARN() might be more appropriate, but I think that this is fine too.
>>
>> The function tegra186_wdt_get_timeleft() is triggered from userspace
>> via an ioctl or sysfs. The documentation process/coding-style.rst says:
>>
>> """
>> Do not WARN lightly
>> *******************
>>
>> WARN*() is intended for unexpected, this-should-never-happen situations.
>> WARN*() macros are not to be used for anything that is expected to happen
>> during normal operation. These are not pre- or post-condition asserts, 
>> for
>> example. Again: WARN*() must not be used for a condition that is expected
>> to trigger easily, for example, by user space actions. pr_warn_once() 
>> is a
>> possible alternative, if you need to notify the user of a problem.
>> """
>>
>> I understand it is important to check the return value in order to
>> have a consistent result when computing the remaining time but that
>> should not trigger a warning each time.
> 
> Yes so WARN sounds appropriate. It should never happen. I don't see the 
> issue.

The issue is if there is an userspace application reading the ioctl and 
or the sysfs, then the warning will be emitted each time if the 
never-happen condition exists. Preferably replace the WARN_ON by 
pr_warn_once() as suggested if the bug must be reported.

>>>>> +    /*
>>>>> +     * Convert the current counter value to seconds,
>>>>> +     * rounding up to the nearest second. Cast u64 to
>>>>> +     * u32 under the assumption that no overflow happens
>>>>> +     * when coverting to seconds.
>>>>> +     */
>>>>> +    timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
>>>>
>>>> Did you check there is a macro fitting the need in math.h ?
>>>
>>> I had a quick look, but looking again, I see we can use
>>> DIV_ROUND_CLOSEST_ULL() here.
>>
>> What about 'roundup()' ?
> 
> 'roundup' does not look the same as what is being done above. However, 
> DIV_ROUND_CLOSEST_ULL() does.

Ok, thanks for checking

   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
