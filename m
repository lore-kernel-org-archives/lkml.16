Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7B61F930
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514315; cv=none; b=m2Apt1ptN4jLLWpLbTluloidvmctNVpuNx6e/B7LlMRQUWBdxWlsQP5HbFfb0DKbsMiljYIHvJVHYu+jX4BleemdLm6kqAHiWS0jROFx0SMZzAf2ZH9YUUHtwb1JNZLPQF4h4w4RS3gg8KmoOdSUkkta8UUfSeSIrVN7oqwUFPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514315; c=relaxed/simple;
	bh=Q1h3J1lMlqtTxeUWZ2nmb72vQCNud+YGGXy7C5Z3tuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIPIHFqu3wL/r+Gjtwg6c8VX4vDXafd3rvMUXqghO50YaWdwLEQmj1Neyitd7FhhtYYBPfi6eiNrD07QYcJe4XGgl5hn0hLiXYPAOv5Pvdbl9DEqbTWmvZLL0HQ9E9zejehuxdiKMgblDM7Exbp50m3iXzoajC1xGK0JguL/+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF3D61424;
	Tue,  1 Apr 2025 06:31:54 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E1723F694;
	Tue,  1 Apr 2025 06:31:50 -0700 (PDT)
Message-ID: <cf88ccd7-a95e-455e-a194-895dcc393c5b@arm.com>
Date: Tue, 1 Apr 2025 14:31:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: catu: Introduce refcount and spinlock for
 enabling/disabling
To: James Clark <james.clark@linaro.org>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>
References: <20250328223837.2314277-1-yabinc@google.com>
 <ea366793-4c27-44af-9b6b-8964c4151416@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ea366793-4c27-44af-9b6b-8964c4151416@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/03/2025 15:24, James Clark wrote:
> 
> 
> On 28/03/2025 10:38 pm, Yabin Cui wrote:
>> When tracing ETM data on multiple CPUs concurrently via the
>> perf interface, the CATU device is shared across different CPU
>> paths. This can lead to race conditions when multiple CPUs attempt
>> to enable or disable the CATU device simultaneously.
>>
>> To address these race conditions, this patch introduces the
>> following changes:
>>
>> 1. The enable and disable operations for the CATU device are not
>>     reentrant. Therefore, a spinlock is added to ensure that only
>>     one CPU can enable or disable a given CATU device at any point
>>     in time.
>>
>> 2. A reference counter is used to manage the enable/disable state
>>     of the CATU device. The device is enabled when the first CPU
>>     requires it and is only disabled when the last CPU finishes
>>     using it. This ensures the device remains active as long as at
>>     least one CPU needs it.
>>
>> Signed-off-by: Yabin Cui <yabinc@google.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-catu.c | 29 ++++++++++++++------
>>   drivers/hwtracing/coresight/coresight-catu.h |  1 +
>>   2 files changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/ 
>> hwtracing/coresight/coresight-catu.c
>> index 275cc0d9f505..834a7ffbbdbc 100644
>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>> @@ -458,12 +458,19 @@ static int catu_enable_hw(struct catu_drvdata 
>> *drvdata, enum cs_mode cs_mode,
>>   static int catu_enable(struct coresight_device *csdev, enum cs_mode 
>> mode,
>>                  void *data)
>>   {
>> -    int rc;
>> +    int rc = 0;
>> +    unsigned long flags;
>>       struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>> -    CS_UNLOCK(catu_drvdata->base);
>> -    rc = catu_enable_hw(catu_drvdata, mode, data);
>> -    CS_LOCK(catu_drvdata->base);
>> +    spin_lock_irqsave(&catu_drvdata->spinlock, flags);
> 
> Hi Yabin,
> 
> This needs to be a raw_spinlock since [1]. Also you might as well use 
> the new guard() thing to save someone find-and-replacing it later.
> 
> But I'm wondering if this is accurate. The ETR's refcount is dependent 
> on the pid of the owner of the trace session:
> 
>    /* Do not proceed if this device is associated with another session */
>    if (drvdata->pid != -1 && drvdata->pid != pid) {
>      rc = -EBUSY;
>      goto unlock_out;
>    }
> 
>    /*
>     * No HW configuration is needed if the sink is already in
>     * use for this session.
>     */
>    if (drvdata->pid == pid) {
>      csdev->refcnt++;
>      goto unlock_out;
>    }
> 
> If the helpers get enabled first, could this mean that CATU gets 
> associated with a different session than the ETR? 

Thats a good point, I looked at the code and :

I think we have a bug here, w.r.t helpers and Sinks. We enable the
helpers (e.g. CATU) and then we try the actual sink (e.g. ETR). And
if we fail to enable ETR, we don't disable the helpers.


We have this today :

	case CORESIGHT_DEV_TYPE_SINK:
		ret = coresight_enable_sink(csdev, mode, sink_data);
		/*
		 * Sink is the first component turned on. If we
		 * failed to enable the sink, there are no components
		 * that need disabling. Disabling the path here
		 * would mean we could disrupt an existing session.
		 */
		if (ret)
			goto out;

...

out: 

         return ret; 

err: 

         coresight_disable_path_from(path, nd); 

         goto out; 

}

Suzuki


Maybe not, but it
> would be easier to understand if the core code handled the refcounting 
> and locking for linked devices.
> 
> [1]: https://lore.kernel.org/all/20250306121110.1647948-3- 
> yeoreum.yun@arm.com/
> 
> Thanks
> James
> 
>> +    if (csdev->refcnt == 0) {
>> +        CS_UNLOCK(catu_drvdata->base);
>> +        rc = catu_enable_hw(catu_drvdata, mode, data);
>> +        CS_LOCK(catu_drvdata->base);
>> +    }
>> +    if (!rc)
>> +        csdev->refcnt++;
>> +    spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
>>       return rc;
>>   }
>> @@ -486,12 +493,17 @@ static int catu_disable_hw(struct catu_drvdata 
>> *drvdata)
>>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>>   {
>> -    int rc;
>> +    int rc = 0;
>> +    unsigned long flags;
>>       struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>> -    CS_UNLOCK(catu_drvdata->base);
>> -    rc = catu_disable_hw(catu_drvdata);
>> -    CS_LOCK(catu_drvdata->base);
>> +    spin_lock_irqsave(&catu_drvdata->spinlock, flags);
>> +    if (--csdev->refcnt == 0) {
>> +        CS_UNLOCK(catu_drvdata->base);
>> +        rc = catu_disable_hw(catu_drvdata);
>> +        CS_LOCK(catu_drvdata->base);
>> +    }
>> +    spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
>>       return rc;
>>   }
>> @@ -550,6 +562,7 @@ static int __catu_probe(struct device *dev, struct 
>> resource *res)
>>       dev->platform_data = pdata;
>>       drvdata->base = base;
>> +    spin_lock_init(&drvdata->spinlock);
>>       catu_desc.access = CSDEV_ACCESS_IOMEM(base);
>>       catu_desc.pdata = pdata;
>>       catu_desc.dev = dev;
>> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/ 
>> hwtracing/coresight/coresight-catu.h
>> index 141feac1c14b..663282ec6381 100644
>> --- a/drivers/hwtracing/coresight/coresight-catu.h
>> +++ b/drivers/hwtracing/coresight/coresight-catu.h
>> @@ -65,6 +65,7 @@ struct catu_drvdata {
>>       void __iomem *base;
>>       struct coresight_device *csdev;
>>       int irq;
>> +    spinlock_t spinlock;
>>   };
>>   #define CATU_REG32(name, offset)                    \
> 

