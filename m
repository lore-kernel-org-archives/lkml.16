Received: from mail-m15578.qiye.163.com (mail-m15578.qiye.163.com [101.71.155.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100D2A8D0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669438; cv=none; b=hSctCohW5iUiOnTq/Me5mkvvJc3cyBDU9SGkYeShZMlyV5wMEY/xGsfZRzBQKTgVmC41h9sySVhRV+dWslG/k9Z+4MfvIa6NL53NCcay2R/IulI8wwyUCQufxAb7T6a5CCToflxuM5l3zYiw1STV2RFzeFn8PlTUva5BHj7zRFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669438; c=relaxed/simple;
	bh=4BS66JqLbbRS7wRo3uLWA63bxarxiz/nBvsKghwJprg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmqE/7b58+PSYRMwS4+O+hZr0vRdfwsIbgmCe+0ANxm2fW2a1UWF+0XN/OR4ursFHdkSF7P8EQrtwrkvnnrlhSC6OHnXjFZQIANoofpSk+R2RoF3CeIdxPgUwkqrB/DftC7ltAUfl++L7JTHRk0PYtOysaOaZ7SY2KlUGQ5xKAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=101.71.155.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from [172.21.129.240] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1088f8c4a;
	Thu, 3 Apr 2025 10:54:17 +0800 (GMT+08:00)
Message-ID: <a1cf32e8-c711-476d-a827-e3affedba780@hj-micro.com>
Date: Thu, 3 Apr 2025 10:53:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf: arm-ni: Fix list_add() corruption in
 arm_ni_probe()
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, allen.wang@hj-micro.com, peter.du@hj-micro.com
References: <20250331121536.2626552-1-andy.xu@hj-micro.com>
 <2f594c55-6fce-445f-b838-ea518916103f@arm.com>
From: Hongbo Yao <andy.xu@hj-micro.com>
In-Reply-To: <2f594c55-6fce-445f-b838-ea518916103f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh0ZVhlNTENCGUIaQkodTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSktJSEJIQ1VKS0
	tVSkJLS1kG
X-HM-Tid: 0a95f9921d4403afkunm1088f8c4a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBQ6Dgw6CzJMOQMIETAWPBFK
	IgpPCzZVSlVKTE9ITU9DQ05DT05PVTMWGhIXVRoVHwJVAw47ExFWFhIYCRRVGBQWRVlXWRILWUFZ
	SklJVUlJT1VJT0pVSE9ZV1kIAVlBTk5ISDcG



在 2025/4/2 20:17, Robin Murphy 写道:
> On 2025-03-31 1:15 pm, HongBo Yao wrote:
>> From: Hongbo Yao <andy.xu@hj-micro.com>
>>
>> When a resource allocation fails in one clock domain of an NI device,
>> we need to properly roll back all previously registered perf PMUs in
>> other clock domains of the same device.
>>
>> Otherwise, it can lead to kernel panics.
>>
>> Calling arm_ni_init+0x0/0xff8 [arm_ni] @ 2374
>> arm-ni ARMHCB70:00: Failed to request PMU region 0x1f3c13000
>> arm-ni ARMHCB70:00: probe with driver arm-ni failed with error -16
>> list_add corruption: next->prev should be prev (fffffd01e9698a18),
>> but was 0000000000000000. (next=ffff10001a0decc8).
>> pstate: 6340009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>> pc : list_add_valid_or_report+0x7c/0xb8
>> lr : list_add_valid_or_report+0x7c/0xb8
>> Call trace:
>>   __list_add_valid_or_report+0x7c/0xb8
>>   perf_pmu_register+0x22c/0x3a0
>>   arm_ni_probe+0x554/0x70c [arm_ni]
>>   platform_probe+0x70/0xe8
>>   really_probe+0xc6/0x4d8
>>   driver_probe_device+0x48/0x170
>>   __driver_attach+0x8e/0x1c0
>>   bus_for_each_dev+0x64/0xf0
>>   driver_add+0x138/0x260
>>   bus_add_driver+0x68/0x138
>>   __platform_driver_register+0x2c/0x40
>>   arm_ni_init+0x14/0x2a [arm_ni]
>>   do_init_module+0x36/0x298
>> ---[ end trace 0000000000000000 ]---
>> Kernel panic - not syncing: Oops - BUG: Fatal exception
>> SMP: stopping secondary CPUs
> 
> This, and the subject, are really confusing, since apparent list
> corruption is just one of many possible symptoms, and the fact that it
> happens to be a second instance of arm_ni_probe() hitting it is pure
> coincidence. The bug is that probe failure can lead to PMUs being freed
> without being unregistered, which can obviously lead to all manner of
> use-after-free conditions in the perf core.
> 
Hi, robin.
Thank you for the feedback. I'll revise the title as suggested.

>> Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
>> Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
>> ---
>>   drivers/perf/arm-ni.c | 44 +++++++++++++++++++++++++++++--------------
>>   1 file changed, 30 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
>> index fd7a5e60e963..ee85577e86b9 100644
>> --- a/drivers/perf/arm-ni.c
>> +++ b/drivers/perf/arm-ni.c
>> @@ -102,6 +102,7 @@ struct arm_ni_unit {
>>   struct arm_ni_cd {
>>       void __iomem *pmu_base;
>>       u16 id;
>> +    bool pmu_registered;
>>       int num_units;
>>       int irq;
>>       int cpu;
>> @@ -571,10 +572,31 @@ static int arm_ni_init_cd(struct arm_ni *ni,
>> struct arm_ni_node *node, u64 res_s
>>       err = perf_pmu_register(&cd->pmu, name, -1);
>>       if (err)
>>           cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd-
>> >cpuhp_node);
>> +    else
>> +        cd->pmu_registered = true;
>>         return err;
>>   }
>>   +static void arm_ni_remove_cds(struct arm_ni *ni)
>> +{
>> +    for (int i = 0; i < ni->num_cds; i++) {
>> +        struct arm_ni_cd *cd = ni->cds + i;
>> +
>> +        if (!cd->pmu_base)
>> +            continue;
>> +
>> +        if (!cd->pmu_registered)
>> +            continue;
> 
> It's clearly redundant to have both checks here - TBH I'd be inclined to
> just do the minimal fix with the existing pmu_base logic:
> 
> @@ -656,8 +673,11 @@ static int arm_ni_probe(struct platform_device *pdev)
>                  reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
>                  arm_ni_probe_domain(base + reg, &cd);
>                  ret = arm_ni_init_cd(ni, &cd, res->start);
> -                if (ret)
> +                if (ret) {
> +                    ni->cds[cd.id].pmu_base = NULL;
> +                    arm_ni_remove(pdev);
>                      return ret;
> +                }
>              }
>          }
>      }
> 
> ...however I'm not against replacing that use of pmu_base with an
> explicit flag if you think that's nicer. As implied, though, I really
> don't see any point in splitting up arm_ni_remove() itself, we can just
> move the whole definition up and call it for this purpose too (with your
> other drvdata fix).
>
You're right, i'll simplify the fix by leveraging the exisiting pmu_base
logic and move the arm_ni_remove() definition up in the next version.
Appreciate the guidance.

Best regards,
Hongbo.


> Thanks,
> Robin.
> 
> 

