Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4528935949
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659450; cv=none; b=CZghkcPtdGDqin0YqeyUQVXf7z2DgWuyCMQM0Fa9OVLau1AO7L2mG+Hnk17/mCBGrw9D9No5/Z9Gdo5EcD20uTzjkt6SMCDRsCDkpST9MQBCCKoWg/pI/HAYngJl0fSI1ApM28m0N4bfhHVqXRPmXE81Qo0uSxeHkvybKe3WyTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659450; c=relaxed/simple;
	bh=nxK4yMEOf+OdXSnJrcPp5Mjs/aN9/YVBMiKNkhoUVPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dV8rErKYZVEZCu7M0fiRObtOuGIAvhXSyNDlQ9mwC6v3PZyZVzEix6N0suyrnV8e9S0UU+cK3fBGO4zMVqEjKKFXhIGE1MXMlpQS9navmjK0WTnqmwUbNeAUg4mP0M73sWQ1u/yOZiZkqziKU3b7JaXdszqE3qIazqgKJGa9Yss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0F93106F;
	Wed,  2 Apr 2025 22:50:49 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AC053F694;
	Wed,  2 Apr 2025 22:50:41 -0700 (PDT)
Message-ID: <b409c701-f126-4e07-ba14-75280529689b@arm.com>
Date: Thu, 3 Apr 2025 11:20:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] coresight: tmc: Support atclk
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-2-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250327113803.1452108-2-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/27/25 17:07, Leo Yan wrote:
> The atclk is an optional clock for the CoreSight TMC, but the driver
> misses to initialize it.  In most cases, the TMC shares the same atclk

TMC shares the atclk or pclk clock with other coresight components ?

> with other CoreSight components.  Since these components enable the
> clock before the TMC device is initialized, the TMC continues properly,
> which is why we don’t observe any lockup issues.
> 
> This change enables atclk in probe of the TMC driver.  Given the clock
> is optional, it is possible to return NULL if the clock does not exist.
> IS_ERR() is tolerant for this case.

Makes sense.

> 
> Dynamically disable and enable atclk during suspend and resume.  The
> clock pointers will never be error values if the driver has successfully
> probed, and the case of a NULL pointer case will be handled by the clock
> core layer.  The driver data is always valid after probe. Therefore,
> remove the related checks.  Also in the resume flow adds error handling.

Probably a good clean up.

> 
> Fixes: bc4bf7fe98da ("coresight-tmc: add CoreSight TMC driver")

Right commit to attribute.

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-core.c | 22 +++++++++++++++++-----
>  drivers/hwtracing/coresight/coresight-tmc.h      |  2 ++
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 5978bcda2556..6aad2acd0378 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  	struct coresight_desc desc = { 0 };
>  	struct coresight_dev_list *dev_list = NULL;
>  
> +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +	if (IS_ERR(drvdata->atclk))
> +		return PTR_ERR(drvdata->atclk);
> +

Adding this check here in __tmc_probe() ensures that it gets called
both during AMBA and platform probe methods.

>  	ret = -ENOMEM;
>  
>  	/* Validity for the resource is already checked by the AMBA core */
> @@ -1019,18 +1023,26 @@ static int tmc_runtime_suspend(struct device *dev)
>  {
>  	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
> +
>  	return 0;
>  }
>  
>  static int tmc_runtime_resume(struct device *dev)
>  {
>  	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..cbb4ba439158 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -210,6 +210,7 @@ struct tmc_resrv_buf {
>  
>  /**
>   * struct tmc_drvdata - specifics associated to an TMC component
> + * @atclk:	optional clock for the core parts of the TMC.
>   * @pclk:	APB clock if present, otherwise NULL
>   * @base:	memory mapped base address for this component.
>   * @csdev:	component vitals needed by the framework.
> @@ -244,6 +245,7 @@ struct tmc_resrv_buf {
>   *		 Used by ETR/ETF.
>   */
>  struct tmc_drvdata {
> +	struct clk		*atclk;
>  	struct clk		*pclk;
>  	void __iomem		*base;
>  	struct coresight_device	*csdev;

Otherwise, LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
