Received: from mail-m49218.qiye.163.com (mail-m49218.qiye.163.com [45.254.49.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8E21362
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241869; cv=none; b=hHgSFESZGU9OBv2ZctmCEdc64yPW1+uCQPLda+T8caaYX0Vf4wCZTcD1xeyNMR1N/137dk4ZYQu2Dn232lPTp1E4TaeuW8tp6becJ2fNHY3SIr2jabwPigCco0gkPInY+lowan7s9R+ihAe7/EsNAC3tjrufBOD7JbMxFev8Oic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241869; c=relaxed/simple;
	bh=1bK5985yRDQUR1N8scw2SbZH+Pk7WIEn0Gr6a9x/kj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AlmLiIweMtv5Z3H/4uXnVLGtEc5EJhtSAoaQCHX706FuKtE6Yj2Pl3n3HJiCwUouv0mdgftJ5PIKfDTzcbqKTNCbKUKHYKot8D70I/5AutOhChmchApKLECY5JjTP324+Z6qEj0zet9aQDV0lmlwJBFtrTT7eK5StEGI9/jGIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=45.254.49.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1295c5899;
	Mon, 21 Apr 2025 17:54:29 +0800 (GMT+08:00)
Message-ID: <e473bba6-a9ad-45fa-a9d0-3cabbc162966@hj-micro.com>
Date: Mon, 21 Apr 2025 17:54:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf:arm-ni: support PMUs to share IRQs for different
 clock domains
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <20250410114214.1599777-1-allen.wang@hj-micro.com>
 <20250410114214.1599777-3-allen.wang@hj-micro.com>
 <4e25536e-459b-4376-9422-4a7d0156234d@arm.com>
Content-Language: en-US
From: Shouping Wang <allen.wang@hj-micro.com>
In-Reply-To: <4e25536e-459b-4376-9422-4a7d0156234d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0pCVk1OSUNNGU5IGkNMSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
X-HM-Tid: 0a9657c548a709d9kunm1295c5899
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjI6Fzo4PDJNHgIINAghMD1C
	PVYwCktVSlVKTE9OSUlCSUxLS09CVTMWGhIXVRoXFx4VVQwaFRw7ExFWFhIYCRRVGBQWRVlXWRIL
	WUFZSklJVUlJT1VJT0pVSE9ZV1kIAVlBQ0lKTjcG

For the same NI700 device, different CDs share a PMU interrupt. The
cd->cpu is set to the first CPU in the NUMA node associated with the
device, meaning all CDs share the same cd->cpu value. During event_init,
event->cpu is assigned to cd->cpu, resulting in all CD PMUs sharing the
interrupt being bound to the same CPU context. if the CPU goes offline,
the PMU context on that CPU is migrated to a target CPU, and the
interrupt is rebound to the target CPU. My understanding is that the CPU
affinity and hotplug operations can remain synchronized. Could you
confirm if there are any misunderstandings in this logic?

On 4/17/2025 10:41 PM, Robin Murphy wrote:
> On 10/04/2025 12:42 pm, Shouping Wang wrote:
>> The ARM NI700 contains multiple clock domains, each with a PMU.
>> In some hardware implementations, these PMUs under the same device
>> share a common interrupt line. The current codes implementation
>> only supports requesting a separate IRQ for each clock domain's PMU.
>>
>> Here, a single interrupt handler is registered for shared interrupt.
>> Within this handler, the interrupt status of all PMUs sharing the
>> interrupt is checked.
> 
> Unfortunately this isn't sufficient for sharing an IRQ between multiple
> PMUs - the CPU affinity and hotplug context migration must be kept in
> sync as well.
> 
> I guess I really should get back to my old plan to factor out a common
> helper library for all this stuff - that was the main reason I left
> combined IRQ support out of the initial version here rather than do
> another copy-paste of the arm_dmc620 design again...
> 
> Thanks,
> Robin.
> 
>> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
>> ---
>>   drivers/perf/arm-ni.c | 77 +++++++++++++++++++++++++++++--------------
>>   1 file changed, 53 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
>> index 3f3d2e0f91fa..611085e89436 100644
>> --- a/drivers/perf/arm-ni.c
>> +++ b/drivers/perf/arm-ni.c
>> @@ -104,6 +104,7 @@ struct arm_ni_cd {
>>       u16 id;
>>       int num_units;
>>       int irq;
>> +    s8 irq_friend;
>>       int cpu;
>>       struct hlist_node cpuhp_node;
>>       struct pmu pmu;
>> @@ -446,26 +447,31 @@ static irqreturn_t arm_ni_handle_irq(int irq,
>> void *dev_id)
>>   {
>>       struct arm_ni_cd *cd = dev_id;
>>       irqreturn_t ret = IRQ_NONE;
>> -    u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>> +    u32 reg;
>>   -    if (reg & (1U << NI_CCNT_IDX)) {
>> -        ret = IRQ_HANDLED;
>> -        if (!(WARN_ON(!cd->ccnt))) {
>> -            arm_ni_event_read(cd->ccnt);
>> -            arm_ni_init_ccnt(cd);
>> +    for (;;) {
>> +        reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>> +        if (reg & (1U << NI_CCNT_IDX)) {
>> +            ret = IRQ_HANDLED;
>> +            if (!(WARN_ON(!cd->ccnt))) {
>> +                arm_ni_event_read(cd->ccnt);
>> +                arm_ni_init_ccnt(cd);
>> +            }
>>           }
>> -    }
>> -    for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>> -        if (!(reg & (1U << i)))
>> -            continue;
>> -        ret = IRQ_HANDLED;
>> -        if (!(WARN_ON(!cd->evcnt[i]))) {
>> -            arm_ni_event_read(cd->evcnt[i]);
>> -            arm_ni_init_evcnt(cd, i);
>> +        for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>> +            if (!(reg & (1U << i)))
>> +                continue;
>> +            ret = IRQ_HANDLED;
>> +            if (!(WARN_ON(!cd->evcnt[i]))) {
>> +                arm_ni_event_read(cd->evcnt[i]);
>> +                arm_ni_init_evcnt(cd, i);
>> +            }
>>           }
>> +        writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>> +        if (!cd->irq_friend)
>> +            return ret;
>> +        cd += cd->irq_friend;
>>       }
>> -    writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>> -    return ret;
>>   }
>>     static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node
>> *node, u64 res_start)
>> @@ -538,12 +544,6 @@ static int arm_ni_init_cd(struct arm_ni *ni,
>> struct arm_ni_node *node, u64 res_s
>>       if (cd->irq < 0)
>>           return cd->irq;
>>   -    err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
>> -                   IRQF_NOBALANCING | IRQF_NO_THREAD,
>> -                   dev_name(ni->dev), cd);
>> -    if (err)
>> -        return err;
>> -
>>       cd->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
>>       cd->pmu = (struct pmu) {
>>           .module = THIS_MODULE,
>> @@ -603,6 +603,30 @@ static void arm_ni_probe_domain(void __iomem
>> *base, struct arm_ni_node *node)
>>       node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
>>   }
>>   +static int arm_ni_irq_init(struct arm_ni *ni)
>> +{
>> +    int irq;
>> +    int err = 0;
>> +
>> +    for (int i = 0; i < ni->num_cds; i++) {
>> +        irq = ni->cds[i].irq;
>> +        for (int j = i; j--; ) {
>> +            if (ni->cds[j].irq == irq) {
>> +                ni->cds[j].irq_friend = i-j;
>> +                goto next;
>> +            }
>> +        }
>> +        err =  devm_request_irq(ni->dev, irq, arm_ni_handle_irq,
>> +                    IRQF_NOBALANCING | IRQF_NO_THREAD,
>> +                     dev_name(ni->dev), &ni->cds[i]);
>> +        if (err)
>> +            return err;
>> +next:
>> +        ;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static int arm_ni_probe(struct platform_device *pdev)
>>   {
>>       struct arm_ni_node cfg, vd, pd, cd;
>> @@ -611,6 +635,7 @@ static int arm_ni_probe(struct platform_device *pdev)
>>       void __iomem *base;
>>       static atomic_t id;
>>       int num_cds;
>> +    int ret;
>>       u32 reg, part;
>>         /*
>> @@ -669,8 +694,6 @@ static int arm_ni_probe(struct platform_device *pdev)
>>               reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
>>               arm_ni_probe_domain(base + reg, &pd);
>>               for (int c = 0; c < pd.num_components; c++) {
>> -                int ret;
>> -
>>                   reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
>>                   arm_ni_probe_domain(base + reg, &cd);
>>                   ret = arm_ni_init_cd(ni, &cd, res->start);
>> @@ -683,6 +706,12 @@ static int arm_ni_probe(struct platform_device
>> *pdev)
>>           }
>>       }
>>   +    ret = arm_ni_irq_init(ni);
>> +    if (ret) {
>> +        arm_ni_remove(pdev);
>> +        return ret;
>> +    }
>> +
>>       return 0;
>>   }
>>   
> 
> 

