Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC833D544
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485654; cv=none; b=NTWBoIa1B05zb6CW+ac/a5uJcTBh/vOrqxq+081yupmPFJ1Gqq0KN8j1zSUmRfDrRnWpJ5yb2/m/Y8oa1oO7BHMnH8EpL+Zfy+jJCYGsKhAgFbTEuOVc6RBentd6UCpsYTMSD+Ab1wd42xCAmIJjpddEnnUEoHcQqoOQ31TjGw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485654; c=relaxed/simple;
	bh=VppeuCwrVBa6uCRTnB87SL+PIZcn0Ri4vi5vBIk8oyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsldggQhgud4AWbtSRwm9iRipx4/aKEETHP7GEdHSveQa6rXV7Hn/7Mq5qV/PijZzulG9P0ggaayb+CzpiLJ0IDaWaK2O0r4JrfvnpJoObLe/JKjTXoWJ1Bo2wt6ilgPl+A329ObZ4AJMdSk4eGS3nPPnf/b4Mo9Ew+75DGFHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BC6214BF;
	Mon,  9 Jun 2025 09:13:53 -0700 (PDT)
Received: from [10.57.48.120] (unknown [10.57.48.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2CEF63F673;
	Mon,  9 Jun 2025 09:14:11 -0700 (PDT)
Message-ID: <89f9fede-3a0f-4ed6-a42d-43827f7a4fca@arm.com>
Date: Mon, 9 Jun 2025 17:14:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] coresight: Appropriately disable trace bus clocks
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-5-423b3f1f241d@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-5-423b3f1f241d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2025 17:00, Leo Yan wrote:
> Some CoreSight components have trace bus clocks 'atclk' and are enabled
> using clk_prepare_enable().  These clocks are not disabled when modules
> exit.
> 
> As atclk is optional, use devm_clk_get_optional_enabled() to manage it.
> The benefit is the driver model layer can automatically disable and
> release clocks.
> 
> Check the returned value with IS_ERR() to detect errors but leave the
> NULL pointer case if the clock is not found.  And remove the error
> handling codes which are no longer needed.
> 
> Fixes: d1839e687773 ("coresight: etm: retrieve and handle atclk")
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Can we consolidate the ATCLK handling to the core coresight helper for
APB clocks ?  It is an optional clock for all devices anyways ?

Cheers
Suzuki



> ---
>   drivers/hwtracing/coresight/coresight-etb10.c      | 10 +++---
>   drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 ++----
>   drivers/hwtracing/coresight/coresight-funnel.c     | 36 +++++++---------------
>   drivers/hwtracing/coresight/coresight-replicator.c | 34 ++++++--------------
>   drivers/hwtracing/coresight/coresight-stm.c        |  9 ++----
>   drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++----
>   6 files changed, 34 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index d5efb085b30d36b51ca591c1b595ef82481f5569..8e81b41eb22264f17606050fa8da277aae05c5cc 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -730,12 +730,10 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>   	if (!drvdata)
>   		return -ENOMEM;
>   
> -	drvdata->atclk = devm_clk_get(&adev->dev, "atclk"); /* optional */
> -	if (!IS_ERR(drvdata->atclk)) {
> -		ret = clk_prepare_enable(drvdata->atclk);
> -		if (ret)
> -			return ret;
> -	}
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
> +
>   	dev_set_drvdata(dev, drvdata);
>   
>   	/* validity for the resource is already checked by the AMBA core */
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 1c6204e1442211be6f3d7ca34bd2251ba796601b..baba2245b1dfb31f4bf19080e20c33df3a5b854f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -832,12 +832,9 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	spin_lock_init(&drvdata->spinlock);
>   
> -	drvdata->atclk = devm_clk_get(&adev->dev, "atclk"); /* optional */
> -	if (!IS_ERR(drvdata->atclk)) {
> -		ret = clk_prepare_enable(drvdata->atclk);
> -		if (ret)
> -			return ret;
> -	}
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
>   
>   	drvdata->cpu = coresight_get_cpu(dev);
>   	if (drvdata->cpu < 0)
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 36fc4e991458c112521c4261d73f3e58e9a3f995..b044a4125310ba4f8c88df295ec3684ab266682f 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -213,7 +213,6 @@ ATTRIBUTE_GROUPS(coresight_funnel);
>   
>   static int funnel_probe(struct device *dev, struct resource *res)
>   {
> -	int ret;
>   	void __iomem *base;
>   	struct coresight_platform_data *pdata = NULL;
>   	struct funnel_drvdata *drvdata;
> @@ -231,12 +230,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
>   	if (!drvdata)
>   		return -ENOMEM;
>   
> -	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
> -	if (!IS_ERR(drvdata->atclk)) {
> -		ret = clk_prepare_enable(drvdata->atclk);
> -		if (ret)
> -			return ret;
> -	}
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
>   
>   	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>   	if (IS_ERR(drvdata->pclk))
> @@ -248,10 +244,8 @@ static int funnel_probe(struct device *dev, struct resource *res)
>   	 */
>   	if (res) {
>   		base = devm_ioremap_resource(dev, res);
> -		if (IS_ERR(base)) {
> -			ret = PTR_ERR(base);
> -			goto out_disable_clk;
> -		}
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
>   		drvdata->base = base;
>   		desc.groups = coresight_funnel_groups;
>   		desc.access = CSDEV_ACCESS_IOMEM(base);
> @@ -261,10 +255,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
>   	dev_set_drvdata(dev, drvdata);
>   
>   	pdata = coresight_get_platform_data(dev);
> -	if (IS_ERR(pdata)) {
> -		ret = PTR_ERR(pdata);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +
>   	dev->platform_data = pdata;
>   
>   	raw_spin_lock_init(&drvdata->spinlock);
> @@ -274,17 +267,10 @@ static int funnel_probe(struct device *dev, struct resource *res)
>   	desc.pdata = pdata;
>   	desc.dev = dev;
>   	drvdata->csdev = coresight_register(&desc);
> -	if (IS_ERR(drvdata->csdev)) {
> -		ret = PTR_ERR(drvdata->csdev);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(drvdata->csdev))
> +		return PTR_ERR(drvdata->csdev);
>   
> -	ret = 0;
> -
> -out_disable_clk:
> -	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> -	return ret;
> +	return 0;
>   }
>   
>   static int funnel_remove(struct device *dev)
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 6dd24eb10a94b0eb28f4f27afab845227e22b96c..9e8bd36e7a9a2fd061f41c56242ac2b11549daf5 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -219,7 +219,6 @@ static const struct attribute_group *replicator_groups[] = {
>   
>   static int replicator_probe(struct device *dev, struct resource *res)
>   {
> -	int ret = 0;
>   	struct coresight_platform_data *pdata = NULL;
>   	struct replicator_drvdata *drvdata;
>   	struct coresight_desc desc = { 0 };
> @@ -238,12 +237,9 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   	if (!drvdata)
>   		return -ENOMEM;
>   
> -	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
> -	if (!IS_ERR(drvdata->atclk)) {
> -		ret = clk_prepare_enable(drvdata->atclk);
> -		if (ret)
> -			return ret;
> -	}
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
>   
>   	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>   	if (IS_ERR(drvdata->pclk))
> @@ -255,10 +251,8 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   	 */
>   	if (res) {
>   		base = devm_ioremap_resource(dev, res);
> -		if (IS_ERR(base)) {
> -			ret = PTR_ERR(base);
> -			goto out_disable_clk;
> -		}
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
>   		drvdata->base = base;
>   		desc.groups = replicator_groups;
>   		desc.access = CSDEV_ACCESS_IOMEM(base);
> @@ -272,10 +266,8 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   	dev_set_drvdata(dev, drvdata);
>   
>   	pdata = coresight_get_platform_data(dev);
> -	if (IS_ERR(pdata)) {
> -		ret = PTR_ERR(pdata);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
>   	dev->platform_data = pdata;
>   
>   	raw_spin_lock_init(&drvdata->spinlock);
> @@ -286,17 +278,11 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   	desc.dev = dev;
>   
>   	drvdata->csdev = coresight_register(&desc);
> -	if (IS_ERR(drvdata->csdev)) {
> -		ret = PTR_ERR(drvdata->csdev);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(drvdata->csdev))
> +		return PTR_ERR(drvdata->csdev);
>   
>   	replicator_reset(drvdata);
> -
> -out_disable_clk:
> -	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> -	return ret;
> +	return 0;
>   }
>   
>   static int replicator_remove(struct device *dev)
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 88ee453b2815444a550a2b932b28367eb93336b8..57fbe3ad0fb20501d4e7e5c478d1e56e98685c40 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -842,12 +842,9 @@ static int __stm_probe(struct device *dev, struct resource *res)
>   	if (!drvdata)
>   		return -ENOMEM;
>   
> -	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
> -	if (!IS_ERR(drvdata->atclk)) {
> -		ret = clk_prepare_enable(drvdata->atclk);
> -		if (ret)
> -			return ret;
> -	}
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
>   
>   	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>   	if (IS_ERR(drvdata->pclk))
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index b2559c6fac6d2f02e0038e583cd324d7165c5aee..8d6179c83e5d3194d1f90e10c88fcc1faccf0cd7 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -128,7 +128,6 @@ static const struct coresight_ops tpiu_cs_ops = {
>   
>   static int __tpiu_probe(struct device *dev, struct resource *res)
>   {
> -	int ret;
>   	void __iomem *base;
>   	struct coresight_platform_data *pdata = NULL;
>   	struct tpiu_drvdata *drvdata;
> @@ -144,12 +143,9 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>   
>   	spin_lock_init(&drvdata->spinlock);
>   
> -	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
> -	if (!IS_ERR(drvdata->atclk)) {
> -		ret = clk_prepare_enable(drvdata->atclk);
> -		if (ret)
> -			return ret;
> -	}
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
>   
>   	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>   	if (IS_ERR(drvdata->pclk))
> 

