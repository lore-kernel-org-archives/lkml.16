Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613012512D7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900903; cv=none; b=UUcE8gmVQ5ISBT5hgqD3GPJ8N8Cy59Lo8qhijN4bNuBUb6XBQw+OfzwevyCYMa0W7GANgrL3WveT5uOuoFYM/g65gfY9+jqlX4RaKQS2WjcyKnM4N04FO7RnLAvf/ONV59xwYvH8PKPf+IFGM+1ah8+fnXbbXncU3ARS+oRf9sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900903; c=relaxed/simple;
	bh=/PhGwu0uAhp/vEox7uqp3mHxPtfkQOsOSO0IgrLrcWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjxWkf0wQbJyZS586yW4LpQCL40UitGTKEg5cptSrUWpUOjaIVNG4p7dy7nKxLPAAK4wHAe2RORBotdPR0dzV+BmvhyP0jKc2OzHREGJqChfVW9Zo8X4J36AarcF8mMDsOC+FY760q0eU+Ab0xwlPC+TaxZA4FtusZpYw58qFwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 356CB1515;
	Thu, 17 Apr 2025 07:41:38 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E75C3F66E;
	Thu, 17 Apr 2025 07:41:38 -0700 (PDT)
Message-ID: <4e25536e-459b-4376-9422-4a7d0156234d@arm.com>
Date: Thu, 17 Apr 2025 15:41:36 +0100
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
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250410114214.1599777-3-allen.wang@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 12:42 pm, Shouping Wang wrote:
> The ARM NI700 contains multiple clock domains, each with a PMU.
> In some hardware implementations, these PMUs under the same device
> share a common interrupt line. The current codes implementation
> only supports requesting a separate IRQ for each clock domain's PMU.
> 
> Here, a single interrupt handler is registered for shared interrupt.
> Within this handler, the interrupt status of all PMUs sharing the
> interrupt is checked.

Unfortunately this isn't sufficient for sharing an IRQ between multiple 
PMUs - the CPU affinity and hotplug context migration must be kept in 
sync as well.

I guess I really should get back to my old plan to factor out a common 
helper library for all this stuff - that was the main reason I left 
combined IRQ support out of the initial version here rather than do 
another copy-paste of the arm_dmc620 design again...

Thanks,
Robin.

> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
> ---
>   drivers/perf/arm-ni.c | 77 +++++++++++++++++++++++++++++--------------
>   1 file changed, 53 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index 3f3d2e0f91fa..611085e89436 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -104,6 +104,7 @@ struct arm_ni_cd {
>   	u16 id;
>   	int num_units;
>   	int irq;
> +	s8 irq_friend;
>   	int cpu;
>   	struct hlist_node cpuhp_node;
>   	struct pmu pmu;
> @@ -446,26 +447,31 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
>   {
>   	struct arm_ni_cd *cd = dev_id;
>   	irqreturn_t ret = IRQ_NONE;
> -	u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
> +	u32 reg;
>   
> -	if (reg & (1U << NI_CCNT_IDX)) {
> -		ret = IRQ_HANDLED;
> -		if (!(WARN_ON(!cd->ccnt))) {
> -			arm_ni_event_read(cd->ccnt);
> -			arm_ni_init_ccnt(cd);
> +	for (;;) {
> +		reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
> +		if (reg & (1U << NI_CCNT_IDX)) {
> +			ret = IRQ_HANDLED;
> +			if (!(WARN_ON(!cd->ccnt))) {
> +				arm_ni_event_read(cd->ccnt);
> +				arm_ni_init_ccnt(cd);
> +			}
>   		}
> -	}
> -	for (int i = 0; i < NI_NUM_COUNTERS; i++) {
> -		if (!(reg & (1U << i)))
> -			continue;
> -		ret = IRQ_HANDLED;
> -		if (!(WARN_ON(!cd->evcnt[i]))) {
> -			arm_ni_event_read(cd->evcnt[i]);
> -			arm_ni_init_evcnt(cd, i);
> +		for (int i = 0; i < NI_NUM_COUNTERS; i++) {
> +			if (!(reg & (1U << i)))
> +				continue;
> +			ret = IRQ_HANDLED;
> +			if (!(WARN_ON(!cd->evcnt[i]))) {
> +				arm_ni_event_read(cd->evcnt[i]);
> +				arm_ni_init_evcnt(cd, i);
> +			}
>   		}
> +		writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
> +		if (!cd->irq_friend)
> +			return ret;
> +		cd += cd->irq_friend;
>   	}
> -	writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
> -	return ret;
>   }
>   
>   static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_start)
> @@ -538,12 +544,6 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   	if (cd->irq < 0)
>   		return cd->irq;
>   
> -	err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
> -			       IRQF_NOBALANCING | IRQF_NO_THREAD,
> -			       dev_name(ni->dev), cd);
> -	if (err)
> -		return err;
> -
>   	cd->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
>   	cd->pmu = (struct pmu) {
>   		.module = THIS_MODULE,
> @@ -603,6 +603,30 @@ static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
>   	node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
>   }
>   
> +static int arm_ni_irq_init(struct arm_ni *ni)
> +{
> +	int irq;
> +	int err = 0;
> +
> +	for (int i = 0; i < ni->num_cds; i++) {
> +		irq = ni->cds[i].irq;
> +		for (int j = i; j--; ) {
> +			if (ni->cds[j].irq == irq) {
> +				ni->cds[j].irq_friend = i-j;
> +				goto next;
> +			}
> +		}
> +		err =  devm_request_irq(ni->dev, irq, arm_ni_handle_irq,
> +					IRQF_NOBALANCING | IRQF_NO_THREAD,
> +					 dev_name(ni->dev), &ni->cds[i]);
> +		if (err)
> +			return err;
> +next:
> +		;
> +	}
> +	return 0;
> +}
> +
>   static int arm_ni_probe(struct platform_device *pdev)
>   {
>   	struct arm_ni_node cfg, vd, pd, cd;
> @@ -611,6 +635,7 @@ static int arm_ni_probe(struct platform_device *pdev)
>   	void __iomem *base;
>   	static atomic_t id;
>   	int num_cds;
> +	int ret;
>   	u32 reg, part;
>   
>   	/*
> @@ -669,8 +694,6 @@ static int arm_ni_probe(struct platform_device *pdev)
>   			reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
>   			arm_ni_probe_domain(base + reg, &pd);
>   			for (int c = 0; c < pd.num_components; c++) {
> -				int ret;
> -
>   				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
>   				arm_ni_probe_domain(base + reg, &cd);
>   				ret = arm_ni_init_cd(ni, &cd, res->start);
> @@ -683,6 +706,12 @@ static int arm_ni_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	ret = arm_ni_irq_init(ni);
> +	if (ret) {
> +		arm_ni_remove(pdev);
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   
