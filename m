Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB18714901B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291166; cv=none; b=PF6uSuxUXRzJYJELXLFYnZc2xXoAIDk1B67/580aso3HKtE0wOU7nK2Ywht7fa16G4+NyYV0FKP0PCziyujIutBuFmuFcbzuYNiyoY6IzZRGPNI0NH7frLbcX3MhOMCNmJu3BSN9l6FQEW59PG7rm6heKwbrjkFwug842LWxC4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291166; c=relaxed/simple;
	bh=WLs+gGIU1PtbBCiZBkVwqHlql9fq1h3FbV/Wrgmm7i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dgwt1y5lmCdj19orRMeX9/y1H68dqEw09eVjSedsB8GhDOVMQwv4aqrnXyXnntGOMxKC6LnMjyErLoNUFVLyD7a6Z3EGdPbU0JflYy7RNgLLOAz54Ty09Y0WpLY2R1Rgc9L+cKxXTDRuQTusMvFEDK6MRkPx65nkVHR6zQyqqKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kX1oZ/9K; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kX1oZ/9K"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a528243636so2744769f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751291163; x=1751895963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6AggRvfqBPUM7xSqjPZuM2RvyKgPoiX7/6ImLDs6xk=;
        b=kX1oZ/9Ksfpz9fHgzFB3UXJtQ6KIygik+b1J2pINfOJ+GlqybVHxIUfDQK9iwvh+Ej
         nIxrzdzprsbqpuR6rc7qjkusKFRxXQ7/wPMWqa8SUfhjaYypLmvBw5xhTVMebLW67bdQ
         srAOaSuYmyGHzPN4CrPLjkay6lsPqLgGdTeP/65BrB/apgUdXdkXlltnKYrjHUdnkCoM
         lQsUPtxjTVwxyHG1HF0Z5p46syKrPEGjosWHHTTl3VkLtnb/9m4MvmPkpc0jEWat+vxT
         3suyR8Z7FfnGfk6/t2X3c/Ij1VE0Qt0ONYPBvJlkHUMRIU0ogW7I9qQ5LydpZt9/z5s1
         zjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291163; x=1751895963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6AggRvfqBPUM7xSqjPZuM2RvyKgPoiX7/6ImLDs6xk=;
        b=FfSSUNHWjPoYFLjpy5qEJNP8csNY6jMEGn64s+VwCiss5rf7EAuQlkCbfeWkHMYPW1
         JBi/CIrkBdoXNBey7bAxJKRbJKPeaGmJQa3PjJ+HG1pKrt4tO7/ByRY5VayphYiOJQsX
         B4PrkvSc566wpVpSbCFuYrGFYpLiwXOFjN9oKa8m2F+HJOfRhC9NfiLOjAAbeF90qv1R
         jRQYCMClWd0MuUD3lb8EA+pWXFSpY2MowAZOs3eaybYf57+eb7Ydu11NFTUqbmu/eP7A
         dBSGo1fwhuSWV5/pv9NMIdc5nAguVMqPv+07BBm4JcpsRFsDaI1R+RlB4DD3AXmFZL0M
         RLWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDJCwkxuhma5S5Z3PVreU3tXDNYfe8OQfZdfB9Wo4U2Sa514PxmX8MiAw/mx4tgRE1Ph6GEmXQKj8AwOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuTgycs46OCJSoX1Oe2O2ms1UHZYilOAzaI84PsgOyHQHzGOaU
	1mbMMxL2cgcZ1hA/WQEKjvXC63HAjrbAVkXvFN0mGn0v7x9cwFRUHEQdOAcVroabtko=
X-Gm-Gg: ASbGncv75BaUB1dqr4ufN0uBglbfEPQGkPS9Qb4yA85wwoU9tQ0CIWUXXYUTygCVMbB
	wojt/9VdKAhn3pvfNtvQFkU/BH333hCKWD6zucTKIhc5klEJizU0kZvLg7JXoqmx6HHvND1pZps
	X40+buymPt/Dy2BXTJS2ErkJETE1qqWbfBVTYcqUEBNLXy2ewL2dNqTxb7VNXGhX2uCE8Nkb/gy
	V+WqURqxCQjHHj8hdiLyWYMsfuzLgX3sPyyap5ROLhEYsiHMQ495VuQLcYXy+3Nt91YpDh68Nr2
	gTpxdTnYBXa7ErPJsJ9U9jtSRezgC3uqcCcwnaObMCh++7jiBRNU86Rly3PEuiEPOMk=
X-Google-Smtp-Source: AGHT+IHZw5qo7ZkrFE6ipOaPB5kCsXwJmt/AoFiz9rbjLSUFLi406xeDw2ABOa9CC2jfbdPGNmOfxA==
X-Received: by 2002:a05:6000:22c2:b0:3a5:1c71:432a with SMTP id ffacd0b85a97d-3a8fe1deba9mr10003038f8f.14.1751291162821;
        Mon, 30 Jun 2025 06:46:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7518sm10335232f8f.2.2025.06.30.06.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:46:02 -0700 (PDT)
Message-ID: <be3e8397-53d6-447a-97ba-4b54c7762f54@linaro.org>
Date: Mon, 30 Jun 2025 14:46:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
 <416f8284-ad98-4922-96d8-7ec873f7b9b8@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <416f8284-ad98-4922-96d8-7ec873f7b9b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30/06/2025 11:03 am, Yuanfang Zhang wrote:
> 
> 
> On 6/27/2025 7:23 PM, James Clark wrote:
>>
>>
>> On 27/06/2025 12:10 pm, Yuanfang Zhang wrote:
>>> The current implementation uses a fixed timeout via
>>> coresight_timeout(), which may be insufficient when multiple
>>> sources are enabled or under heavy load, leading to TMC
>>> readiness or flush completion timeout.
>>>
>>> This patch introduces a configurable timeout mechanism for
>>> flush and tmcready.
>>>
>>
>> What kind of values are you using? Is there a reason to not increase the global one?
> 1000, Because only TMC FLUSH will face timeout situations.

How long was the flush taking exactly? You should be able to log the 
time it took to get past the flush. Because if it's 101us then we can 
increase the global timeout to 150us or 200us without too much thought.

I don't think we can justify why 100us was picked over any other value 
anyway. And we've seen a couple of timeouts in our own CI.

>>
>> I don't think it's important what value we choose because it's only to stop hangs and make it terminate eventually. As far as I can see it wouldn't matter if we set it to a huge value like 1 second. That would only cause a big delay when something has actually gone wrong. Under normal circumstances the timeout won't be hit so it doesn't really need to be configurable.
> 
> But in some cases, TMC doesn't hang up, it just requires a longer waiting time.
>>
>>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>> ---
>>>    drivers/hwtracing/coresight/coresight-tmc-core.c | 43 ++++++++++++++++++++++--
>>>    1 file changed, 41 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> index 88afb16bb6bec395ba535155228d176250f38625..286d56ce88fe80fbfa022946dc798f0f4e72f961 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> @@ -8,6 +8,7 @@
>>>    #include <linux/kernel.h>
>>>    #include <linux/init.h>
>>>    #include <linux/types.h>
>>> +#include <linux/delay.h>
>>>    #include <linux/device.h>
>>>    #include <linux/idr.h>
>>>    #include <linux/io.h>
>>> @@ -35,13 +36,31 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
>>>    DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
>>>    DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
>>>    +static u32 tmc_timeout;
>>> +
>>> +static void tmc_extend_timeout(struct csdev_access *csa, u32 offset, int pos, int val)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = tmc_timeout; i > 0; i--) {
>>> +        if (i - 1)
>>
>> I didn't get what the if is for here? Removing it does basically the same thing, but if you do want to keep it maybe if (i > 1) is more explanatory.
> sure.
>>
>>> +            udelay(1);
>>
>> Can you not do udelay(tmc_timeout)?
> sure.
>>
>>> +    }
>>> +}
>>> +
>>> +static int tmc_wait_status(struct csdev_access *csa, u32 offset, int pos, int val)
>>> +{
>>> +    return coresight_timeout_action(csa, offset, pos, val,
>>> +            tmc_extend_timeout);
>>> +}
>>> +
>>>    int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
>>>    {
>>>        struct coresight_device *csdev = drvdata->csdev;
>>>        struct csdev_access *csa = &csdev->access;
>>>          /* Ensure formatter, unformatter and hardware fifo are empty */
>>> -    if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
>>> +    if (tmc_wait_status(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
>>>            dev_err(&csdev->dev,
>>>                "timeout while waiting for TMC to be Ready\n");
>>>            return -EBUSY;
>>> @@ -61,7 +80,7 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>>>        ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
>>>        writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>>>        /* Ensure flush completes */
>>> -    if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
>>> +    if (tmc_wait_status(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
>>>            dev_err(&csdev->dev,
>>>            "timeout while waiting for completion of Manual Flush\n");
>>>        }
>>> @@ -561,11 +580,31 @@ static ssize_t stop_on_flush_store(struct device *dev,
>>>      static DEVICE_ATTR_RW(stop_on_flush);
>>>    +static ssize_t timeout_cfg_show(struct device *dev,
>>> +                struct device_attribute *attr, char *buf)
>>> +{
>>> +    return scnprintf(buf, PAGE_SIZE, "%d\n", tmc_timeout);
>>> +}
>>> +
>>> +static ssize_t timeout_cfg_store(struct device *dev,
>>> +                 struct device_attribute *attr,
>>> +                 const char *buf, size_t size)
>>> +{
>>> +    unsigned long val;
>>> +
>>> +    if (kstrtoul(buf, 0, &val))
>>> +        return -EINVAL;
>>> +    tmc_timeout = val;
>>> +
>>> +    return size;
>>> +}
>>> +static DEVICE_ATTR_RW(timeout_cfg);
>>>    
>>
>> Seeing as the existing timeout is global for all devices, if we do want a configurable one shouldn't we make the global one configurable rather than per-device? That seems too fine grained to me.
> sure.
>>
>>>    static struct attribute *coresight_tmc_attrs[] = {
>>>        &dev_attr_trigger_cntr.attr,
>>>        &dev_attr_buffer_size.attr,
>>>        &dev_attr_stop_on_flush.attr,
>>> +    &dev_attr_timeout_cfg.attr,
>>>        NULL,
>>>    };
>>>   
>>> ---
>>> base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
>>> change-id: 20250627-flush_timeout-a598b4c0ce7b
>>>
>>> Best regards,
>>
> 

