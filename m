Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2D0280CD2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332515; cv=none; b=XWSEqJIOeoYgdarue/VMAQ72BeJLgnSWWH/acA1EWSPVVRyb78GdqTmpjMSEGYIJx3gAspOEH1LTDeiRu1oVnVTsnmdxGLftwAHadl0tFkILp3X4BcedTX1NXgSlg3jTOeAsCg9oi0IYrMkU+7pZD17L9HSt/oFKZFDwrYRhS+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332515; c=relaxed/simple;
	bh=BeA4rubPFl3vYTb+JwSWF+DtKeRTeSXkm9FNWggiwYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGzeFz7DXC2UVeG8+N8NKfrluxkkASvXa/r/bL6h576fSPM1goFbkTRj6lE+dbr2K/zZYYpSzLz3ILGKqFe9AEdrN6vIN1wnE/usYEHxBoInmDTdXXh8nIoSP6QyDyLvGIhg7kLcCAOi5B8aHC20RkF93KJefgfqRmy6xdokHF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63D5C152B;
	Tue, 22 Apr 2025 07:35:08 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB4E13F66E;
	Tue, 22 Apr 2025 07:35:11 -0700 (PDT)
Message-ID: <d24f34a7-5fa6-4f39-8040-e03a0816306e@arm.com>
Date: Tue, 22 Apr 2025 15:35:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf:arm-ni: support PMUs to share IRQs for different
 clock domains
To: Shouping Wang <allen.wang@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <20250410114214.1599777-1-allen.wang@hj-micro.com>
 <20250410114214.1599777-3-allen.wang@hj-micro.com>
 <4e25536e-459b-4376-9422-4a7d0156234d@arm.com>
 <e473bba6-a9ad-45fa-a9d0-3cabbc162966@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <e473bba6-a9ad-45fa-a9d0-3cabbc162966@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/04/2025 10:54 am, Shouping Wang wrote:
> For the same NI700 device, different CDs share a PMU interrupt. The
> cd->cpu is set to the first CPU in the NUMA node associated with the
> device, meaning all CDs share the same cd->cpu value.

But what if CPUs are being onlined/offlined while arm_ni_probe() is 
running? We can't necessarily assume that multiple calls to 
cpumask_local_spread() at different points in time will give consistent 
results to begin with.

> During event_init,
> event->cpu is assigned to cd->cpu, resulting in all CD PMUs sharing the
> interrupt being bound to the same CPU context. if the CPU goes offline,
> the PMU context on that CPU is migrated to a target CPU, and the
> interrupt is rebound to the target CPU.

Except the CDs will *each* try to migrate the same IRQ one-by-one as if 
it's theirs uniquely. I suppose it's quite likely that the 
cpumask_any_*() calls will all happen to pick the same new target CPU, 
given that we should be under the global CPU hotplug lock at that point, 
but I'm still not sure that's strictly guaranteed. Furthermore it opens 
a race window where as soon as the first irq_set_affinity() call has 
taken effect, the IRQ handler for all the *other* CDs may then be called 
on the new CPU before their respective PMU contexts have been migrated.

> My understanding is that the CPU
> affinity and hotplug operations can remain synchronized. Could you
> confirm if there are any misunderstandings in this logic?

For that to happen *reliably*, essentially the IRQ affinity needs to be 
managed at an equivalent level to the initial IRQ request itself.

Thanks,
Robin.

> On 4/17/2025 10:41 PM, Robin Murphy wrote:
>> On 10/04/2025 12:42 pm, Shouping Wang wrote:
>>> The ARM NI700 contains multiple clock domains, each with a PMU.
>>> In some hardware implementations, these PMUs under the same device
>>> share a common interrupt line. The current codes implementation
>>> only supports requesting a separate IRQ for each clock domain's PMU.
>>>
>>> Here, a single interrupt handler is registered for shared interrupt.
>>> Within this handler, the interrupt status of all PMUs sharing the
>>> interrupt is checked.
>>
>> Unfortunately this isn't sufficient for sharing an IRQ between multiple
>> PMUs - the CPU affinity and hotplug context migration must be kept in
>> sync as well.
>>
>> I guess I really should get back to my old plan to factor out a common
>> helper library for all this stuff - that was the main reason I left
>> combined IRQ support out of the initial version here rather than do
>> another copy-paste of the arm_dmc620 design again...
>>
>> Thanks,
>> Robin.
>>
>>> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
>>> ---
>>>    drivers/perf/arm-ni.c | 77 +++++++++++++++++++++++++++++--------------
>>>    1 file changed, 53 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
>>> index 3f3d2e0f91fa..611085e89436 100644
>>> --- a/drivers/perf/arm-ni.c
>>> +++ b/drivers/perf/arm-ni.c
>>> @@ -104,6 +104,7 @@ struct arm_ni_cd {
>>>        u16 id;
>>>        int num_units;
>>>        int irq;
>>> +    s8 irq_friend;
>>>        int cpu;
>>>        struct hlist_node cpuhp_node;
>>>        struct pmu pmu;
>>> @@ -446,26 +447,31 @@ static irqreturn_t arm_ni_handle_irq(int irq,
>>> void *dev_id)
>>>    {
>>>        struct arm_ni_cd *cd = dev_id;
>>>        irqreturn_t ret = IRQ_NONE;
>>> -    u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>>> +    u32 reg;
>>>    -    if (reg & (1U << NI_CCNT_IDX)) {
>>> -        ret = IRQ_HANDLED;
>>> -        if (!(WARN_ON(!cd->ccnt))) {
>>> -            arm_ni_event_read(cd->ccnt);
>>> -            arm_ni_init_ccnt(cd);
>>> +    for (;;) {
>>> +        reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>>> +        if (reg & (1U << NI_CCNT_IDX)) {
>>> +            ret = IRQ_HANDLED;
>>> +            if (!(WARN_ON(!cd->ccnt))) {
>>> +                arm_ni_event_read(cd->ccnt);
>>> +                arm_ni_init_ccnt(cd);
>>> +            }
>>>            }
>>> -    }
>>> -    for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>>> -        if (!(reg & (1U << i)))
>>> -            continue;
>>> -        ret = IRQ_HANDLED;
>>> -        if (!(WARN_ON(!cd->evcnt[i]))) {
>>> -            arm_ni_event_read(cd->evcnt[i]);
>>> -            arm_ni_init_evcnt(cd, i);
>>> +        for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>>> +            if (!(reg & (1U << i)))
>>> +                continue;
>>> +            ret = IRQ_HANDLED;
>>> +            if (!(WARN_ON(!cd->evcnt[i]))) {
>>> +                arm_ni_event_read(cd->evcnt[i]);
>>> +                arm_ni_init_evcnt(cd, i);
>>> +            }
>>>            }
>>> +        writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>>> +        if (!cd->irq_friend)
>>> +            return ret;
>>> +        cd += cd->irq_friend;
>>>        }
>>> -    writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>>> -    return ret;
>>>    }
>>>      static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node
>>> *node, u64 res_start)
>>> @@ -538,12 +544,6 @@ static int arm_ni_init_cd(struct arm_ni *ni,
>>> struct arm_ni_node *node, u64 res_s
>>>        if (cd->irq < 0)
>>>            return cd->irq;
>>>    -    err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
>>> -                   IRQF_NOBALANCING | IRQF_NO_THREAD,
>>> -                   dev_name(ni->dev), cd);
>>> -    if (err)
>>> -        return err;
>>> -
>>>        cd->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
>>>        cd->pmu = (struct pmu) {
>>>            .module = THIS_MODULE,
>>> @@ -603,6 +603,30 @@ static void arm_ni_probe_domain(void __iomem
>>> *base, struct arm_ni_node *node)
>>>        node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
>>>    }
>>>    +static int arm_ni_irq_init(struct arm_ni *ni)
>>> +{
>>> +    int irq;
>>> +    int err = 0;
>>> +
>>> +    for (int i = 0; i < ni->num_cds; i++) {
>>> +        irq = ni->cds[i].irq;
>>> +        for (int j = i; j--; ) {
>>> +            if (ni->cds[j].irq == irq) {
>>> +                ni->cds[j].irq_friend = i-j;
>>> +                goto next;
>>> +            }
>>> +        }
>>> +        err =  devm_request_irq(ni->dev, irq, arm_ni_handle_irq,
>>> +                    IRQF_NOBALANCING | IRQF_NO_THREAD,
>>> +                     dev_name(ni->dev), &ni->cds[i]);
>>> +        if (err)
>>> +            return err;
>>> +next:
>>> +        ;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>>    static int arm_ni_probe(struct platform_device *pdev)
>>>    {
>>>        struct arm_ni_node cfg, vd, pd, cd;
>>> @@ -611,6 +635,7 @@ static int arm_ni_probe(struct platform_device *pdev)
>>>        void __iomem *base;
>>>        static atomic_t id;
>>>        int num_cds;
>>> +    int ret;
>>>        u32 reg, part;
>>>          /*
>>> @@ -669,8 +694,6 @@ static int arm_ni_probe(struct platform_device *pdev)
>>>                reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
>>>                arm_ni_probe_domain(base + reg, &pd);
>>>                for (int c = 0; c < pd.num_components; c++) {
>>> -                int ret;
>>> -
>>>                    reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
>>>                    arm_ni_probe_domain(base + reg, &cd);
>>>                    ret = arm_ni_init_cd(ni, &cd, res->start);
>>> @@ -683,6 +706,12 @@ static int arm_ni_probe(struct platform_device
>>> *pdev)
>>>            }
>>>        }
>>>    +    ret = arm_ni_irq_init(ni);
>>> +    if (ret) {
>>> +        arm_ni_remove(pdev);
>>> +        return ret;
>>> +    }
>>> +
>>>        return 0;
>>>    }
>>>    
>>
>>
> 
