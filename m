Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA802376E6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596248; cv=none; b=UKvcx5zL7ltd+LlqH02WBA3iv1vLThk5nUusKGuNcHufp1Gx55PVeUxb0ytNwiyUEnldKpWIQTXd3lfdQYVk6q2TLNB8QXu9JgVxtco7uzBKWo63EII7ipSAPC59pt2xv2QMVY5UPLgMj0D0FZYXZuomxEv/hDNdeIVsteWUGIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596248; c=relaxed/simple;
	bh=r5inOR0ZcptfLFBSCXQu2chHbp7Y7JyY4Avw/EU3Ct4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6zJKmRvEtlbklMjxaqo2cou78CKyWMMCVNfYbwt192cZpSzZ+j/uG56buSCk+L4m/w1yh+M0x2kQpPqtFFALHmJezWZaNNkZVvhWqv5Eu/HCsV28RouuTsXqLoD0eIj14SJFqQP6yIPoIX89h2FMlkpd78rfz4azNd9NfiKADk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3783106F;
	Wed,  2 Apr 2025 05:17:26 -0700 (PDT)
Received: from [10.57.67.12] (unknown [10.57.67.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99B7C3F63F;
	Wed,  2 Apr 2025 05:17:22 -0700 (PDT)
Message-ID: <2f594c55-6fce-445f-b838-ea518916103f@arm.com>
Date: Wed, 2 Apr 2025 13:17:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf: arm-ni: Fix list_add() corruption in
 arm_ni_probe()
To: HongBo Yao <andy.xu@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, allen.wang@hj-micro.com, peter.du@hj-micro.com
References: <20250331121536.2626552-1-andy.xu@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250331121536.2626552-1-andy.xu@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-31 1:15 pm, HongBo Yao wrote:
> From: Hongbo Yao <andy.xu@hj-micro.com>
> 
> When a resource allocation fails in one clock domain of an NI device,
> we need to properly roll back all previously registered perf PMUs in
> other clock domains of the same device.
> 
> Otherwise, it can lead to kernel panics.
> 
> Calling arm_ni_init+0x0/0xff8 [arm_ni] @ 2374
> arm-ni ARMHCB70:00: Failed to request PMU region 0x1f3c13000
> arm-ni ARMHCB70:00: probe with driver arm-ni failed with error -16
> list_add corruption: next->prev should be prev (fffffd01e9698a18),
> but was 0000000000000000. (next=ffff10001a0decc8).
> pstate: 6340009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> pc : list_add_valid_or_report+0x7c/0xb8
> lr : list_add_valid_or_report+0x7c/0xb8
> Call trace:
>   __list_add_valid_or_report+0x7c/0xb8
>   perf_pmu_register+0x22c/0x3a0
>   arm_ni_probe+0x554/0x70c [arm_ni]
>   platform_probe+0x70/0xe8
>   really_probe+0xc6/0x4d8
>   driver_probe_device+0x48/0x170
>   __driver_attach+0x8e/0x1c0
>   bus_for_each_dev+0x64/0xf0
>   driver_add+0x138/0x260
>   bus_add_driver+0x68/0x138
>   __platform_driver_register+0x2c/0x40
>   arm_ni_init+0x14/0x2a [arm_ni]
>   do_init_module+0x36/0x298
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops - BUG: Fatal exception
> SMP: stopping secondary CPUs

This, and the subject, are really confusing, since apparent list
corruption is just one of many possible symptoms, and the fact that it
happens to be a second instance of arm_ni_probe() hitting it is pure
coincidence. The bug is that probe failure can lead to PMUs being freed
without being unregistered, which can obviously lead to all manner of
use-after-free conditions in the perf core.

> Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
> Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
> ---
>   drivers/perf/arm-ni.c | 44 +++++++++++++++++++++++++++++--------------
>   1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index fd7a5e60e963..ee85577e86b9 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -102,6 +102,7 @@ struct arm_ni_unit {
>   struct arm_ni_cd {
>   	void __iomem *pmu_base;
>   	u16 id;
> +	bool pmu_registered;
>   	int num_units;
>   	int irq;
>   	int cpu;
> @@ -571,10 +572,31 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   	err = perf_pmu_register(&cd->pmu, name, -1);
>   	if (err)
>   		cpuhp_state_remove_instance_nocalls(arm_ni_hp_state, &cd->cpuhp_node);
> +	else
> +		cd->pmu_registered = true;
>   
>   	return err;
>   }
>   
> +static void arm_ni_remove_cds(struct arm_ni *ni)
> +{
> +	for (int i = 0; i < ni->num_cds; i++) {
> +		struct arm_ni_cd *cd = ni->cds + i;
> +
> +		if (!cd->pmu_base)
> +			continue;
> +
> +		if (!cd->pmu_registered)
> +			continue;

It's clearly redundant to have both checks here - TBH I'd be inclined to
just do the minimal fix with the existing pmu_base logic:

@@ -656,8 +673,11 @@ static int arm_ni_probe(struct platform_device *pdev)
  				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
  				arm_ni_probe_domain(base + reg, &cd);
  				ret = arm_ni_init_cd(ni, &cd, res->start);
-				if (ret)
+				if (ret) {
+					ni->cds[cd.id].pmu_base = NULL;
+					arm_ni_remove(pdev);
  					return ret;
+				}
  			}
  		}
  	}

...however I'm not against replacing that use of pmu_base with an
explicit flag if you think that's nicer. As implied, though, I really
don't see any point in splitting up arm_ni_remove() itself, we can just
move the whole definition up and call it for this purpose too (with your
other drvdata fix).

Thanks,
Robin.
