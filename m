Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CD221C9E4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746167491; cv=none; b=FPhBV1co9Sj+Mx8UleECOb2/rwsfbAha5d0IDvnyr4kNg69ZTTt8NEUtmjOQqf9zUCVDaCBwdBAnWWZuN6yfPl3iGjU2SCKMNZ7OCrTriHxZkhG5phG+A6ll6TIfEeFuEP4MHOsSerD9sCB12zW9kpqu6O0Gp6DvM0rI+of29XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746167491; c=relaxed/simple;
	bh=ppNang/M+HWbm5hVHmLn3PBm4cLiUtrarwQAqnwwU3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fy7B5Dzdat0EHq5krW4s7jO4DmItr6nNz/FEIlXlwlBA/weSylYiizktC/7XDsYJFBHLymgW8JpkcaIXzdkiAKRt41PCrC/9lJIqjA7+ZFBvEHPFUoTTOnUEHVGbL7lb/Pisola0ZS+HuLCu/+wNyciIuoXKeb2TC99vgOMJNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF03C1063;
	Thu,  1 May 2025 23:31:19 -0700 (PDT)
Received: from [10.163.80.122] (unknown [10.163.80.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 653E03F66E;
	Thu,  1 May 2025 23:31:23 -0700 (PDT)
Message-ID: <39ad8cb6-94fb-47dd-ad39-ac9ce1916d8c@arm.com>
Date: Fri, 2 May 2025 12:01:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] coresight: Disable trace bus clock properly
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-6-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250423151726.372561-6-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 20:47, Leo Yan wrote:
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
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etb10.c      | 10 ++++------
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 +++------
>  drivers/hwtracing/coresight/coresight-funnel.c     | 36 +++++++++++-------------------------
>  drivers/hwtracing/coresight/coresight-replicator.c | 34 ++++++++++------------------------
>  drivers/hwtracing/coresight/coresight-stm.c        |  9 +++------
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 10 +++-------
>  6 files changed, 34 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 7948597d483d..45c2f8f50a3f 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -730,12 +730,10 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>  	if (!drvdata)
>  		return -ENOMEM;
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
>  	dev_set_drvdata(dev, drvdata);
>  
>  	/* validity for the resource is already checked by the AMBA core */
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 8927bfaf3af2..adbb134f80e6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -832,12 +832,9 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	spin_lock_init(&drvdata->spinlock);
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
>  	drvdata->cpu = coresight_get_cpu(dev);
>  	if (drvdata->cpu < 0)
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 3fb9d0a37d55..ec6d3e656548 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -213,7 +213,6 @@ ATTRIBUTE_GROUPS(coresight_funnel);
>  
>  static int funnel_probe(struct device *dev, struct resource *res)
>  {
> -	int ret;
>  	void __iomem *base;
>  	struct coresight_platform_data *pdata = NULL;
>  	struct funnel_drvdata *drvdata;
> @@ -231,12 +230,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
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
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> @@ -248,10 +244,8 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	 */
>  	if (res) {
>  		base = devm_ioremap_resource(dev, res);
> -		if (IS_ERR(base)) {
> -			ret = PTR_ERR(base);
> -			goto out_disable_clk;
> -		}
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
>  		drvdata->base = base;
>  		desc.groups = coresight_funnel_groups;
>  		desc.access = CSDEV_ACCESS_IOMEM(base);
> @@ -260,10 +254,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	dev_set_drvdata(dev, drvdata);
>  
>  	pdata = coresight_get_platform_data(dev);
> -	if (IS_ERR(pdata)) {
> -		ret = PTR_ERR(pdata);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +
>  	dev->platform_data = pdata;
>  
>  	raw_spin_lock_init(&drvdata->spinlock);
> @@ -273,17 +266,10 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  	desc.pdata = pdata;
>  	desc.dev = dev;
>  	drvdata->csdev = coresight_register(&desc);
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
>  }
>  
>  static int funnel_remove(struct device *dev)
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 87346617b852..460af0f7b537 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -219,7 +219,6 @@ static const struct attribute_group *replicator_groups[] = {
>  
>  static int replicator_probe(struct device *dev, struct resource *res)
>  {
> -	int ret = 0;
>  	struct coresight_platform_data *pdata = NULL;
>  	struct replicator_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
> @@ -238,12 +237,9 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
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
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> @@ -255,10 +251,8 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	 */
>  	if (res) {
>  		base = devm_ioremap_resource(dev, res);
> -		if (IS_ERR(base)) {
> -			ret = PTR_ERR(base);
> -			goto out_disable_clk;
> -		}
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
>  		drvdata->base = base;
>  		desc.groups = replicator_groups;
>  		desc.access = CSDEV_ACCESS_IOMEM(base);
> @@ -271,10 +265,8 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	dev_set_drvdata(dev, drvdata);
>  
>  	pdata = coresight_get_platform_data(dev);
> -	if (IS_ERR(pdata)) {
> -		ret = PTR_ERR(pdata);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
>  	dev->platform_data = pdata;
>  
>  	raw_spin_lock_init(&drvdata->spinlock);
> @@ -285,17 +277,11 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  	desc.dev = dev;
>  
>  	drvdata->csdev = coresight_register(&desc);
> -	if (IS_ERR(drvdata->csdev)) {
> -		ret = PTR_ERR(drvdata->csdev);
> -		goto out_disable_clk;
> -	}
> +	if (IS_ERR(drvdata->csdev))
> +		return PTR_ERR(drvdata->csdev);
>  
>  	replicator_reset(drvdata);
> -
> -out_disable_clk:
> -	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> -	return ret;
> +	return 0;
>  }
>  
>  static int replicator_remove(struct device *dev)
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index c32d0bd92f30..f13fbab4d7a2 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -842,12 +842,9 @@ static int __stm_probe(struct device *dev, struct resource *res)
>  	if (!drvdata)
>  		return -ENOMEM;
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
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 4b9634941752..cac1b5bba086 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -128,7 +128,6 @@ static const struct coresight_ops tpiu_cs_ops = {
>  
>  static int __tpiu_probe(struct device *dev, struct resource *res)
>  {
> -	int ret;
>  	void __iomem *base;
>  	struct coresight_platform_data *pdata = NULL;
>  	struct tpiu_drvdata *drvdata;
> @@ -144,12 +143,9 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>  
>  	spin_lock_init(&drvdata->spinlock);
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
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
