Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1120338F9C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750739879; cv=none; b=lAgJum08x34iDWeZ2zCDymWmtVP7/9164Y9NZt8zy4GTZVXhaixnUzqErLMkVkJeXfoQWMPxodkkTkl2oR6KLBfVFY7RbeFclFuB17hxwAC+3yK2YNzxlvZlDnZnqbT9IZJaBN9fupfehFTBhpkWOyKQEnmKMKvmRlLuvjW/m/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750739879; c=relaxed/simple;
	bh=47hAahDt8L0Z4Aa1WDJbc14lGOkzR/HM9O++3TbuKRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVbwYWJEH23y2GkfdqL+pEdLxRggmHLjdRARaFkzdMKloB9GR2oR3SxgFuhd+j5DL4yRrBUNgdMrof3QXq/vv1XnIBaDaQ95c0TpHLCY6LlFLltAuZbivstCLBXmTTQa/o+LCdMikGP3X7B6kOrR2YMItkhUk7G08Skyw+H4LOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 404CA106F;
	Mon, 23 Jun 2025 21:37:38 -0700 (PDT)
Received: from [10.163.36.19] (unknown [10.163.36.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28C923F63F;
	Mon, 23 Jun 2025 21:37:52 -0700 (PDT)
Message-ID: <97f63b59-ca86-4c2b-82c9-6edd1e7000d6@arm.com>
Date: Tue, 24 Jun 2025 10:07:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] coresight: Appropriately disable programming
 clocks
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-4-423b3f1f241d@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-4-423b3f1f241d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/06/25 9:30 PM, Leo Yan wrote:
> Some CoreSight components have programming clocks (pclk) and are enabled
> using clk_get() and clk_prepare_enable().  However, in many cases, these
> clocks are not disabled when modules exit and only released by clk_put().
> 
> To fix the issue, this commit refactors coresight_get_enable_apb_pclk()
> by replacing clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled() for enabling APB clock.  Callers are updated
> to reuse the returned error value.
> 
> With the change, programming clocks are managed as resources in driver
> model layer, allowing clock cleanup to be handled automatically.  As a
> result, manual cleanup operations are no longer needed and are removed
> from the Coresight drivers.
> 
> Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c       |  9 ++-------
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |  6 +-----
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  | 10 ++--------
>  drivers/hwtracing/coresight/coresight-etm4x-core.c |  9 ++-------
>  drivers/hwtracing/coresight/coresight-funnel.c     |  6 +-----
>  drivers/hwtracing/coresight/coresight-replicator.c |  6 +-----
>  drivers/hwtracing/coresight/coresight-stm.c        |  4 +---
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |  4 +---
>  drivers/hwtracing/coresight/coresight-tpiu.c       |  4 +---
>  include/linux/coresight.h                          | 16 +++-------------
>  10 files changed, 15 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index af2a55f0c907c392d092a50612b23c115a1b0f5f..4c345ff2cff141ea63c2220393e5fdd00c449ca6 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -636,7 +636,7 @@ static int catu_platform_probe(struct platform_device *pdev)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
> @@ -645,11 +645,8 @@ static int catu_platform_probe(struct platform_device *pdev)
>  	dev_set_drvdata(&pdev->dev, drvdata);
>  	ret = __catu_probe(&pdev->dev, res);
>  	pm_runtime_put(&pdev->dev);
> -	if (ret) {
> +	if (ret)
>  		pm_runtime_disable(&pdev->dev);
> -		if (!IS_ERR_OR_NULL(drvdata->pclk))
> -			clk_put(drvdata->pclk);
> -	}
>  
>  	return ret;
>  }
> @@ -663,8 +660,6 @@ static void catu_platform_remove(struct platform_device *pdev)
>  
>  	__catu_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index a871d997330b09bdb741f35c59108b0b3252cc54..e39dfb886688e111eee95d4294f37fa85baccd14 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -699,7 +699,7 @@ static int debug_platform_probe(struct platform_device *pdev)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
> @@ -710,8 +710,6 @@ static int debug_platform_probe(struct platform_device *pdev)
>  	if (ret) {
>  		pm_runtime_put_noidle(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);
> -		if (!IS_ERR_OR_NULL(drvdata->pclk))
> -			clk_put(drvdata->pclk);
>  	}
>  	return ret;
>  }
> @@ -725,8 +723,6 @@ static void debug_platform_remove(struct platform_device *pdev)
>  
>  	__debug_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_ACPI
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index c6bafc96db963310b5e77a095953c83a172cfc7c..de279efe340581ceabfb9e1cd1e7fe4b5e4f826e 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -209,7 +209,7 @@ static int ctcu_probe(struct platform_device *pdev)
>  
>  	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->apb_clk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->apb_clk);
>  
>  	cfgs = of_device_get_match_data(dev);
>  	if (cfgs) {
> @@ -233,12 +233,8 @@ static int ctcu_probe(struct platform_device *pdev)
>  	desc.access = CSDEV_ACCESS_IOMEM(base);
>  
>  	drvdata->csdev = coresight_register(&desc);
> -	if (IS_ERR(drvdata->csdev)) {
> -		if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> -			clk_put(drvdata->apb_clk);
> -
> +	if (IS_ERR(drvdata->csdev))
>  		return PTR_ERR(drvdata->csdev);
> -	}
>  
>  	return 0;
>  }
> @@ -275,8 +271,6 @@ static void ctcu_platform_remove(struct platform_device *pdev)
>  
>  	ctcu_remove(pdev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> -		clk_put(drvdata->apb_clk);
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 205121c14d72ec2f6a193dccb94b7cfd5c314e26..1915da95b93d953a61778a71b4880c87b91fe17a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2303,14 +2303,12 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	if (res) {
>  		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(drvdata->base)) {
> -			clk_put(drvdata->pclk);
> +		if (IS_ERR(drvdata->base))
>  			return PTR_ERR(drvdata->base);
> -		}
>  	}
>  
>  	dev_set_drvdata(&pdev->dev, drvdata);
> @@ -2417,9 +2415,6 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
>  	if (drvdata)
>  		etm4_remove_dev(drvdata);
>  	pm_runtime_disable(&pdev->dev);
> -
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  static const struct amba_id etm4_ids[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index b1922dbe9292b02c91ca5730998e59ecdb08fdc7..36fc4e991458c112521c4261d73f3e58e9a3f995 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -240,7 +240,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	/*
>  	 * Map the device base for dynamic-funnel, which has been
> @@ -284,8 +284,6 @@ static int funnel_probe(struct device *dev, struct resource *res)
>  out_disable_clk:
>  	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
>  		clk_disable_unprepare(drvdata->atclk);
> -	if (ret && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return ret;
>  }
>  
> @@ -355,8 +353,6 @@ static void funnel_platform_remove(struct platform_device *pdev)
>  
>  	funnel_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  static const struct of_device_id funnel_match[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 06efd2b01a0f71620eac71166567d14655b58403..6dd24eb10a94b0eb28f4f27afab845227e22b96c 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -247,7 +247,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	/*
>  	 * Map the device base for dynamic-replicator, which has been
> @@ -296,8 +296,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
>  out_disable_clk:
>  	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
>  		clk_disable_unprepare(drvdata->atclk);
> -	if (ret && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return ret;
>  }
>  
> @@ -335,8 +333,6 @@ static void replicator_platform_remove(struct platform_device *pdev)
>  
>  	replicator_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index e45c6c7204b4491e0f879bc7d5d445aa1d3118be..88ee453b2815444a550a2b932b28367eb93336b8 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -851,7 +851,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  	dev_set_drvdata(dev, drvdata);
>  
>  	base = devm_ioremap_resource(dev, res);
> @@ -1033,8 +1033,6 @@ static void stm_platform_remove(struct platform_device *pdev)
>  
>  	__stm_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_ACPI
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 0b5e7635a084d226619e69189a2ecbaff754ec43..e867198b03e82892da7312c9dc1c69676602c598 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -991,7 +991,7 @@ static int tmc_platform_probe(struct platform_device *pdev)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  
>  	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
> @@ -1015,8 +1015,6 @@ static void tmc_platform_remove(struct platform_device *pdev)
>  
>  	__tmc_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 3e01592884280819c16398cbb5e09cbaee5d3efb..b2559c6fac6d2f02e0038e583cd324d7165c5aee 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -153,7 +153,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
>  
>  	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
>  	if (IS_ERR(drvdata->pclk))
> -		return -ENODEV;
> +		return PTR_ERR(drvdata->pclk);
>  	dev_set_drvdata(dev, drvdata);
>  
>  	/* Validity for the resource is already checked by the AMBA core */
> @@ -293,8 +293,6 @@ static void tpiu_platform_remove(struct platform_device *pdev)
>  
>  	__tpiu_remove(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_put(drvdata->pclk);
>  }
>  
>  #ifdef CONFIG_ACPI
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 4ac65c68bbf44b98db22c3dad2d83a224ce5278e..dd2b4cc7a2b70cf060a3207548fe80e3824c489f 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -480,26 +480,16 @@ static inline bool is_coresight_device(void __iomem *base)
>   * Returns:
>   *
>   * clk   - Clock is found and enabled
> - * NULL  - clock is not found
>   * ERROR - Clock is found but failed to enable
>   */
>  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>  {
>  	struct clk *pclk;
> -	int ret;
>  
> -	pclk = clk_get(dev, "apb_pclk");
> -	if (IS_ERR(pclk)) {
> -		pclk = clk_get(dev, "apb");
> -		if (IS_ERR(pclk))
> -			return NULL;
> -	}
> +	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +	if (IS_ERR(pclk))
> +		pclk = devm_clk_get_enabled(dev, "apb");
>  
> -	ret = clk_prepare_enable(pclk);
> -	if (ret) {
> -		clk_put(pclk);
> -		return ERR_PTR(ret);
> -	}
>  	return pclk;
>  }
>  
> 

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
