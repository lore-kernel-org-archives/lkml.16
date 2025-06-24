Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC7C227E8F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750743867; cv=none; b=gn77Rq9Z85FrXzkTNHdyPfWi6sGyphnxIxV2JsxnDrC/l6bGlJlHoqG+bwc6/TpeTvQf+9mU/ONHbUpCork3Udt+BhKmZeUGgg6cmQ9kruVYuKAJhSZ8CCnlc6HnYK73tDYBSqL4+CBYoUAR1lNS8OK5WYkejhGnFol81G9+hN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750743867; c=relaxed/simple;
	bh=CR1Nvj7o1XlP8lz0b+NE79yycXXAKOjEJnjmbWeJ/AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBt0BO+2BwjgI1LiV8BNc8ovsw6YZv/3jgXtQjF7k4kft5iNrhwOUdWNwjH0r3jzXEzdZskx4kGBlU69VJ9EJfJW2CV5H5+WjsXnDhnyB3bG/O9xTbSEWQFb/RrMd3kX76/N+9wtlNex0D2+lnP/UvlKfaNZsyG1y4WxRHyEceA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7A6B106F;
	Mon, 23 Jun 2025 22:44:05 -0700 (PDT)
Received: from [10.163.36.19] (unknown [10.163.36.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45EAF3F63F;
	Mon, 23 Jun 2025 22:44:20 -0700 (PDT)
Message-ID: <bb0a5725-36d0-4809-b17d-6ead7ba8d520@arm.com>
Date: Tue, 24 Jun 2025 11:14:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] coresight: Consolidate clock enabling
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-7-423b3f1f241d@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-7-423b3f1f241d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/06/25 9:30 PM, Leo Yan wrote:
> CoreSight drivers enable pclk and atclk conditionally.  For example,
> pclk is only enabled in the static probe, while atclk is an optional
> clock that it is enabled for both dynamic and static probes, if it is
> present.  In the current CoreSight drivers, these two clocks are
> initialized separately.  This causes complex and duplicate codes.
> 
> This patch consolidates clock enabling into a central place.  It renames
> coresight_get_enable_apb_pclk() to coresight_get_enable_clocks() and
> encapsulates clock initialization logic:
> 
>  - If a clock is initialized successfully, its clock pointer is assigned
>    to the double pointer passed as an argument.
>  - If pclk is skipped for an AMBA device, or if atclk is not found, the
>    corresponding double pointer is set to NULL.  The function returns
>    Success (0) to guide callers can proceed with no error.
>  - Otherwise, an error number is returned for failures.
> 
> The function became complex, move it from the header to the CoreSight
> core layer and the symbol is exported.  Added comments for recording
> details.
> 
> CoreSight drivers are refined so that clocks are initialized in one go.
> As a result, driver data no longer needs to be allocated separately in
> the static and dynamic probes.  Moved the allocation into a low-level
> function to avoid code duplication.

But why should this change be included here in this patch that
consolidates pclk and atclk clock initialization ? Should this
be done in a separate patch instead ?

> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c       | 30 +++++----------
>  drivers/hwtracing/coresight/coresight-core.c       | 45 ++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  | 29 ++++++--------
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++--
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++----
>  drivers/hwtracing/coresight/coresight-funnel.c     | 11 ++----
>  drivers/hwtracing/coresight/coresight-replicator.c | 11 ++----
>  drivers/hwtracing/coresight/coresight-stm.c        |  9 ++---
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 30 +++++----------
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++---
>  include/linux/coresight.h                          | 23 +----------
>  11 files changed, 101 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 4c345ff2cff141ea63c2220393e5fdd00c449ca6..a3ccb7034ae14d7339bc2549bccadf11e28c45e2 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -515,14 +515,20 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  {
>  	int ret = 0;
>  	u32 dma_mask;
> -	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct catu_drvdata *drvdata;
>  	struct coresight_desc catu_desc;
>  	struct coresight_platform_data *pdata = NULL;
>  	void __iomem *base;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, drvdata);
> +
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
>  	if (!catu_desc.name)
> @@ -580,14 +586,8 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  
>  static int catu_probe(struct amba_device *adev, const struct amba_id *id)
>  {
> -	struct catu_drvdata *drvdata;
>  	int ret;
>  
> -	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	amba_set_drvdata(adev, drvdata);
>  	ret = __catu_probe(&adev->dev, &adev->res);
>  	if (!ret)
>  		pm_runtime_put(&adev->dev);
> @@ -627,22 +627,12 @@ static struct amba_driver catu_driver = {
>  static int catu_platform_probe(struct platform_device *pdev)
>  {
>  	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	struct catu_drvdata *drvdata;
>  	int ret = 0;
>  
> -	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> -
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	ret = __catu_probe(&pdev->dev, res);
>  	pm_runtime_put(&pdev->dev);
>  	if (ret)
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fa758cc21827552a5c97b6bdd05d22dec4994b22..f9cc240e7c259fdb7cb3ee321825b44079a07b69 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1698,6 +1698,51 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
>  }
>  EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
>  
> +/*
> + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> + * for the given device.
> + *
> + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> + * skip to get and enable the pclk for an AMBA device.
> + *
> + * atclk is an optional clock, it will be only enabled when it is existed.
> + * Otherwise, a NULL pointer will be returned to caller.
> + *
> + * Returns: '0' on Success; Error code otherwise.
> + */
> +int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
> +				struct clk **atclk)
Moving this helper function here does make sense.

> +{
> +	WARN_ON(!pclk);

That is because pclk will be populated in all possible scenarios
including the one assigned as NULL - hence it needs to have been
allocated.
 > +
> +	if (dev_is_amba(dev)) {
> +		/* Don't enable pclk for an AMBA device */
> +		*pclk = NULL;
> +	} else {
> +		/*
> +		 * "apb_pclk" is the default clock name for an Arm Primecell
> +		 * peripheral, while "apb" is used only by the CTCU driver.
> +		 *
> +		 * For easier maintenance, CoreSight drivers should use
> +		 * "apb_pclk" as the programming clock name.
> +		 */
> +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +		if (IS_ERR(*pclk))
> +			*pclk = devm_clk_get_enabled(dev, "apb");
> +		if (IS_ERR(*pclk))
> +			return PTR_ERR(*pclk);
> +	}
> +
> +	if (atclk) {

But an allocated atclk indicates need for atclk clock init instead.
Probably a 'which all clocks' flag based approach might been better ?
But I guess this proposal will create less code churn.

> +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +		if (IS_ERR(*atclk))
> +			return PTR_ERR(*atclk);
> +	}

atclk when requested - either will have a valid clock or an error
pointer but never a NULL pointer unlike the pclk clock ?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_enable_clocks);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>  MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index e39dfb886688e111eee95d4294f37fa85baccd14..3edfb5d3d02056afcaab4da575d1101c68aeac80 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -562,10 +562,20 @@ static void debug_func_exit(void)
>  
>  static int __debug_probe(struct device *dev, struct resource *res)
>  {
> -	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct debug_drvdata *drvdata;
>  	void __iomem *base;
>  	int ret;
>  
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, drvdata);
> +
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
> +	if (ret)
> +		return ret;
> +
>  	drvdata->cpu = coresight_get_cpu(dev);
>  	if (drvdata->cpu < 0)
>  		return drvdata->cpu;
> @@ -625,13 +635,6 @@ static int __debug_probe(struct device *dev, struct resource *res)
>  
>  static int debug_probe(struct amba_device *adev, const struct amba_id *id)
>  {
> -	struct debug_drvdata *drvdata;
> -
> -	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	amba_set_drvdata(adev, drvdata);
>  	return __debug_probe(&adev->dev, &adev->res);
>  }
>  
> @@ -690,18 +693,8 @@ static struct amba_driver debug_driver = {
>  static int debug_platform_probe(struct platform_device *pdev)
>  {
>  	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	struct debug_drvdata *drvdata;
>  	int ret = 0;
>  
> -	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> -
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index de279efe340581ceabfb9e1cd1e7fe4b5e4f826e..75b5114ef652e4a47c53fbd2b7811c1bab575645 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -188,7 +188,7 @@ static int ctcu_probe(struct platform_device *pdev)
>  	const struct ctcu_config *cfgs;
>  	struct ctcu_drvdata *drvdata;
>  	void __iomem *base;
> -	int i;
> +	int i, ret;
>  
>  	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
>  	if (!desc.name)
> @@ -207,9 +207,9 @@ static int ctcu_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->apb_clk))
> -		return PTR_ERR(drvdata->apb_clk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->apb_clk, NULL);
> +	if (ret)
> +		return ret;
>  
>  	cfgs = of_device_get_match_data(dev);
>  	if (cfgs) {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 1915da95b93d953a61778a71b4880c87b91fe17a..a742466ad0e14d2ceeeccddec5bba4f2160793c2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2211,13 +2211,14 @@ static int etm4_probe(struct device *dev)
>  	struct csdev_access access = { 0 };
>  	struct etm4_init_arg init_arg = { 0 };
>  	struct etm4_init_arg *delayed;
> +	int ret;
>  
>  	if (WARN_ON(!drvdata))
>  		return -ENOMEM;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
>  		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
> @@ -2301,10 +2302,6 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> -
>  	if (res) {
>  		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
>  		if (IS_ERR(drvdata->base))
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index b044a4125310ba4f8c88df295ec3684ab266682f..02e0dc678a32c3b1f32fc955bf8871142e3412e1 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -217,6 +217,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	struct coresight_platform_data *pdata = NULL;
>  	struct funnel_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
> +	int ret;
>  
>  	if (is_of_node(dev_fwnode(dev)) &&
>  	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
> @@ -230,13 +231,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Map the device base for dynamic-funnel, which has been
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 9e8bd36e7a9a2fd061f41c56242ac2b11549daf5..f1bbd12e63e0c130f945d8df34fb2334bd21336f 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -223,6 +223,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	struct replicator_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
>  	void __iomem *base;
> +	int ret;
>  
>  	if (is_of_node(dev_fwnode(dev)) &&
>  	    of_device_is_compatible(dev->of_node, "arm,coresight-replicator"))
> @@ -237,13 +238,9 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Map the device base for dynamic-replicator, which has been
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 57fbe3ad0fb20501d4e7e5c478d1e56e98685c40..a931282ec0eaf1b2a5db8ccc8f21789441cd634d 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -842,13 +842,10 @@ static int __stm_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
> -	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
>  	dev_set_drvdata(dev, drvdata);
>  
>  	base = devm_ioremap_resource(dev, res);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index e867198b03e82892da7312c9dc1c69676602c598..e5ab4a0323354d826c831f68c71d81808cbcd8ff 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -785,13 +785,19 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  	u32 devid;
>  	void __iomem *base;
>  	struct coresight_platform_data *pdata = NULL;
> -	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct tmc_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
>  	struct coresight_dev_list *dev_list = NULL;
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, drvdata);
> +
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
>  	ret = -ENOMEM;
>  
> @@ -898,14 +904,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  
>  static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
>  {
> -	struct tmc_drvdata *drvdata;
>  	int ret;
>  
> -	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	amba_set_drvdata(adev, drvdata);
>  	ret = __tmc_probe(&adev->dev, &adev->res);
>  	if (!ret)
>  		pm_runtime_put(&adev->dev);
> @@ -982,18 +982,8 @@ static struct amba_driver tmc_driver = {
>  static int tmc_platform_probe(struct platform_device *pdev)
>  {
>  	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	struct tmc_drvdata *drvdata;
>  	int ret = 0;
>  
> -	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
> -	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
> -
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 8d6179c83e5d3194d1f90e10c88fcc1faccf0cd7..5e47d761e1c4e99072eeb492c1eac7dd4285a591 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -132,6 +132,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>  	struct coresight_platform_data *pdata = NULL;
>  	struct tpiu_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
> +	int ret;
>  
>  	desc.name = coresight_alloc_device_name(&tpiu_devs, dev);
>  	if (!desc.name)
> @@ -143,13 +144,10 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>  
>  	spin_lock_init(&drvdata->spinlock);
>  
> -	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> -	if (IS_ERR(drvdata->atclk))
> -		return PTR_ERR(drvdata->atclk);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
> +	if (ret)
> +		return ret;
>  
> -	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
> -	if (IS_ERR(drvdata->pclk))
> -		return PTR_ERR(drvdata->pclk);
>  	dev_set_drvdata(dev, drvdata);
>  
>  	/* Validity for the resource is already checked by the AMBA core */
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 9afa1f76c78a3347e54d94fe9a9ebed72e3fff8e..96cc814c1886f02bf802918b3ccb457b245bdbd6 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -474,27 +474,6 @@ static inline bool is_coresight_device(void __iomem *base)
>  	return cid == CORESIGHT_CID;
>  }
>  
> -/*
> - * Attempt to find and enable "APB clock" for the given device
> - *
> - * Returns:
> - *
> - * clk   - Clock is found and enabled
> - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> - * ERROR - Clock is found but failed to enable
> - */
> -static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> -{
> -	struct clk *pclk = NULL;
> -
> -	if (!dev_is_amba(dev)) {
> -		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> -		if (IS_ERR(pclk))
> -			pclk = devm_clk_get_enabled(dev, "apb");
> -	}
> -
> -	return pclk;
> -}
>  
>  #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))
>  
> @@ -726,4 +705,6 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
>  			     struct platform_driver *pdev_drv);
>  int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
>  			       struct coresight_device *sink);
> +int coresight_get_enable_clocks(struct device *dev, struct clk **pclk,
> +				struct clk **atclk);
>  #endif		/* _LINUX_COREISGHT_H */
> 
