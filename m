Received: from mail-m49222.qiye.163.com (mail-m49222.qiye.163.com [45.254.49.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9EF263F4A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745380692; cv=none; b=hgbw7sbNpHYUJm3BNBHj/oilZhkTnYg+d/bhr94XNe8BRmzRVcQqtv/LnF+h8A4PanSxQ0gDoZKd/QWXLHkpAkrdfBg7gGClenW0GGbMfMhAqlVrn/C+rjSsk/KX7GpE/s7ZbixMnKvbBt4swDHq1yKb27Cpfg2kHLeTdfr6bNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745380692; c=relaxed/simple;
	bh=mTzqpXSxd+kl4gytZPuLNHyo8HLzfPXQbV+8YL95vXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRzq2IzwgWW3Ksm1PXG+cM0KKFm22u690m33TYmRRp22k1b8NL5mm45y4ZdeHk9saZYcX/sHl+JEkf/rMxGwXfCpOby+wouBFNP1nxPrO9X/EQCeXNnYeI3wQfq5qWmle3QRmkoP6AasfIgx3E91WL39E7QuQYBQQ9axd9E5DNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; arc=none smtp.client-ip=45.254.49.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 12ce7e313;
	Wed, 23 Apr 2025 11:42:39 +0800 (GMT+08:00)
Message-ID: <43635f5b-fdf1-468d-a800-b96c86529e03@hj-micro.com>
Date: Wed, 23 Apr 2025 11:42:38 +0800
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
 linux-kernel@vger.kernel.org, peter.du@hj-micro.com, andy.xu@hj-micro.com,
 allen.wang@hj-micro.com
References: <20250410114214.1599777-1-allen.wang@hj-micro.com>
 <20250410114214.1599777-3-allen.wang@hj-micro.com>
 <4e25536e-459b-4376-9422-4a7d0156234d@arm.com>
 <e473bba6-a9ad-45fa-a9d0-3cabbc162966@hj-micro.com>
 <d24f34a7-5fa6-4f39-8040-e03a0816306e@arm.com>
Content-Language: en-US
From: Shouping Wang <allen.wang@hj-micro.com>
In-Reply-To: <d24f34a7-5fa6-4f39-8040-e03a0816306e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGkhKVkxIGkJNS05PSEJCGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
X-HM-Tid: 0a9660bd95d809d9kunm12ce7e313
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kzo6FRw4IzJPHk8tAgwsFTBL
	Ky4KCx5VSlVKTE9OSExCTE1LTUhPVTMWGhIXVRoXFx4VVQwaFRw7ExFWFhIYCRRVGBQWRVlXWRIL
	WUFZSklJVUlJT1VJT0pVSE9ZV1kIAVlBSktKQ0o3Bg++

‌Can multiple CDs of an NI700 device only register single PMU (similar
to CMN PMU driver) by treating their PMUs as a unified entity to support
shared interrupts? or do you already have existing solutions that
support shared interrupt scenarios?

On 4/22/2025 10:35 PM, Robin Murphy wrote:
> On 21/04/2025 10:54 am, Shouping Wang wrote:
>> For the same NI700 device, different CDs share a PMU interrupt. The
>> cd->cpu is set to the first CPU in the NUMA node associated with the
>> device, meaning all CDs share the same cd->cpu value.
> 
> But what if CPUs are being onlined/offlined while arm_ni_probe() is
> running? We can't necessarily assume that multiple calls to
> cpumask_local_spread() at different points in time will give consistent
> results to begin with.
> 
>> During event_init,
>> event->cpu is assigned to cd->cpu, resulting in all CD PMUs sharing the
>> interrupt being bound to the same CPU context. if the CPU goes offline,
>> the PMU context on that CPU is migrated to a target CPU, and the
>> interrupt is rebound to the target CPU.
> 
> Except the CDs will *each* try to migrate the same IRQ one-by-one as if
> it's theirs uniquely. I suppose it's quite likely that the
> cpumask_any_*() calls will all happen to pick the same new target CPU,
> given that we should be under the global CPU hotplug lock at that point,
> but I'm still not sure that's strictly guaranteed. Furthermore it opens
> a race window where as soon as the first irq_set_affinity() call has
> taken effect, the IRQ handler for all the *other* CDs may then be called
> on the new CPU before their respective PMU contexts have been migrated.
> 
>> My understanding is that the CPU
>> affinity and hotplug operations can remain synchronized. Could you
>> confirm if there are any misunderstandings in this logic?
> 
> For that to happen *reliably*, essentially the IRQ affinity needs to be
> managed at an equivalent level to the initial IRQ request itself.
> 
> Thanks,
> Robin.
> 
>> On 4/17/2025 10:41 PM, Robin Murphy wrote:
>>> On 10/04/2025 12:42 pm, Shouping Wang wrote:
>>>> The ARM NI700 contains multiple clock domains, each with a PMU.
>>>> In some hardware implementations, these PMUs under the same device
>>>> share a common interrupt line. The current codes implementation
>>>> only supports requesting a separate IRQ for each clock domain's PMU.
>>>>
>>>> Here, a single interrupt handler is registered for shared interrupt.
>>>> Within this handler, the interrupt status of all PMUs sharing the
>>>> interrupt is checked.
>>>
>>> Unfortunately this isn't sufficient for sharing an IRQ between multiple
>>> PMUs - the CPU affinity and hotplug context migration must be kept in
>>> sync as well.
>>>
>>> I guess I really should get back to my old plan to factor out a common
>>> helper library for all this stuff - that was the main reason I left
>>> combined IRQ support out of the initial version here rather than do
>>> another copy-paste of the arm_dmc620 design again...
>>>
>>> Thanks,
>>> Robin.
>>>
>>>> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
>>>> ---
>>>>    drivers/perf/arm-ni.c | 77 ++++++++++++++++++++++++++++
>>>> +--------------
>>>>    1 file changed, 53 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
>>>> index 3f3d2e0f91fa..611085e89436 100644
>>>> --- a/drivers/perf/arm-ni.c
>>>> +++ b/drivers/perf/arm-ni.c
>>>> @@ -104,6 +104,7 @@ struct arm_ni_cd {
>>>>        u16 id;
>>>>        int num_units;
>>>>        int irq;
>>>> +    s8 irq_friend;
>>>>        int cpu;
>>>>        struct hlist_node cpuhp_node;
>>>>        struct pmu pmu;
>>>> @@ -446,26 +447,31 @@ static irqreturn_t arm_ni_handle_irq(int irq,
>>>> void *dev_id)
>>>>    {
>>>>        struct arm_ni_cd *cd = dev_id;
>>>>        irqreturn_t ret = IRQ_NONE;
>>>> -    u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>>>> +    u32 reg;
>>>>    -    if (reg & (1U << NI_CCNT_IDX)) {
>>>> -        ret = IRQ_HANDLED;
>>>> -        if (!(WARN_ON(!cd->ccnt))) {
>>>> -            arm_ni_event_read(cd->ccnt);
>>>> -            arm_ni_init_ccnt(cd);
>>>> +    for (;;) {
>>>> +        reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>>>> +        if (reg & (1U << NI_CCNT_IDX)) {
>>>> +            ret = IRQ_HANDLED;
>>>> +            if (!(WARN_ON(!cd->ccnt))) {
>>>> +                arm_ni_event_read(cd->ccnt);
>>>> +                arm_ni_init_ccnt(cd);
>>>> +            }
>>>>            }
>>>> -    }
>>>> -    for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>>>> -        if (!(reg & (1U << i)))
>>>> -            continue;
>>>> -        ret = IRQ_HANDLED;
>>>> -        if (!(WARN_ON(!cd->evcnt[i]))) {
>>>> -            arm_ni_event_read(cd->evcnt[i]);
>>>> -            arm_ni_init_evcnt(cd, i);
>>>> +        for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>>>> +            if (!(reg & (1U << i)))
>>>> +                continue;
>>>> +            ret = IRQ_HANDLED;
>>>> +            if (!(WARN_ON(!cd->evcnt[i]))) {
>>>> +                arm_ni_event_read(cd->evcnt[i]);
>>>> +                arm_ni_init_evcnt(cd, i);
>>>> +            }
>>>>            }
>>>> +        writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>>>> +        if (!cd->irq_friend)
>>>> +            return ret;
>>>> +        cd += cd->irq_friend;
>>>>        }
>>>> -    writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>>>> -    return ret;
>>>>    }
>>>>      static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node
>>>> *node, u64 res_start)
>>>> @@ -538,12 +544,6 @@ static int arm_ni_init_cd(struct arm_ni *ni,
>>>> struct arm_ni_node *node, u64 res_s
>>>>        if (cd->irq < 0)
>>>>            return cd->irq;
>>>>    -    err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
>>>> -                   IRQF_NOBALANCING | IRQF_NO_THREAD,
>>>> -                   dev_name(ni->dev), cd);
>>>> -    if (err)
>>>> -        return err;
>>>> -
>>>>        cd->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
>>>>        cd->pmu = (struct pmu) {
>>>>            .module = THIS_MODULE,
>>>> @@ -603,6 +603,30 @@ static void arm_ni_probe_domain(void __iomem
>>>> *base, struct arm_ni_node *node)
>>>>        node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
>>>>    }
>>>>    +static int arm_ni_irq_init(struct arm_ni *ni)
>>>> +{
>>>> +    int irq;
>>>> +    int err = 0;
>>>> +
>>>> +    for (int i = 0; i < ni->num_cds; i++) {
>>>> +        irq = ni->cds[i].irq;
>>>> +        for (int j = i; j--; ) {
>>>> +            if (ni->cds[j].irq == irq) {
>>>> +                ni->cds[j].irq_friend = i-j;
>>>> +                goto next;
>>>> +            }
>>>> +        }
>>>> +        err =  devm_request_irq(ni->dev, irq, arm_ni_handle_irq,
>>>> +                    IRQF_NOBALANCING | IRQF_NO_THREAD,
>>>> +                     dev_name(ni->dev), &ni->cds[i]);
>>>> +        if (err)
>>>> +            return err;
>>>> +next:
>>>> +        ;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static int arm_ni_probe(struct platform_device *pdev)
>>>>    {
>>>>        struct arm_ni_node cfg, vd, pd, cd;
>>>> @@ -611,6 +635,7 @@ static int arm_ni_probe(struct platform_device
>>>> *pdev)
>>>>        void __iomem *base;
>>>>        static atomic_t id;
>>>>        int num_cds;
>>>> +    int ret;
>>>>        u32 reg, part;
>>>>          /*
>>>> @@ -669,8 +694,6 @@ static int arm_ni_probe(struct platform_device
>>>> *pdev)
>>>>                reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
>>>>                arm_ni_probe_domain(base + reg, &pd);
>>>>                for (int c = 0; c < pd.num_components; c++) {
>>>> -                int ret;
>>>> -
>>>>                    reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
>>>>                    arm_ni_probe_domain(base + reg, &cd);
>>>>                    ret = arm_ni_init_cd(ni, &cd, res->start);
>>>> @@ -683,6 +706,12 @@ static int arm_ni_probe(struct platform_device
>>>> *pdev)
>>>>            }
>>>>        }
>>>>    +    ret = arm_ni_irq_init(ni);
>>>> +    if (ret) {
>>>> +        arm_ni_remove(pdev);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>>        return 0;
>>>>    }
>>>>    
>>>
>>>
>>
> 
> 

