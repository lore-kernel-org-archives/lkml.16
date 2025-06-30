Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4D543147
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751262482; cv=none; b=RKAVo5opN59Twf085dAD/PtQMmJN+vVoXnEEkHOnN/38yNTBKU+XeOjOV7YzEYHumifATIRW1xSzfU6sql90oCIF+nIsW34yGsnB0xQw4o0YO2gi96e8U41JWNrLVo3uF5pNEUcO1SnKivjyX5yaIzmuFkKldizX9cu1gZPis1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751262482; c=relaxed/simple;
	bh=2IruJvIGNeHKNHFZLJZCXUmlfpg/XFDsCde7VhwpoF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKeBckvXXOYE9CPGCj0ZxA8AYl+J0ASxGkicy7VXqC406lB7gKxdSPhxL2HuoeFLIlgA/SaA+9W1+b6Vh9gkV8CSACUfIZTMmIwKhTNucL+EKJp1JKXhxYfX4EZEDw2mWuixSaZqYtX192EQiJk3tRCuaCoTG6CBsCfrxtHD7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30BA91F60;
	Sun, 29 Jun 2025 22:47:44 -0700 (PDT)
Received: from [10.163.37.132] (unknown [10.163.37.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 042F93F6A8;
	Sun, 29 Jun 2025 22:47:56 -0700 (PDT)
Message-ID: <d7286c62-8c7a-493e-8149-72d9c77eca00@arm.com>
Date: Mon, 30 Jun 2025 11:17:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] coresight: Refactor driver data allocation
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-8-0ce0009c38f8@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250627-arm_cs_fix_clock_v4-v4-8-0ce0009c38f8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27/06/25 5:21 PM, Leo Yan wrote:
> The driver data no longer needs to be allocated separately in the static
> and dynamic probes. Moved the allocation into the low-level functions to
> avoid code duplication.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-catu.c      | 20 +++++++-------------
>  drivers/hwtracing/coresight/coresight-cpu-debug.c | 21 +++++++--------------
>  drivers/hwtracing/coresight/coresight-tmc-core.c  | 20 +++++++-------------
>  3 files changed, 21 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 0f476a0cbd740c233d039c5c411ca192681e2023..a3ccb7034ae14d7339bc2549bccadf11e28c45e2 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -515,11 +515,17 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  {
>  	int ret = 0;
>  	u32 dma_mask;
> -	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct catu_drvdata *drvdata;
>  	struct coresight_desc catu_desc;
>  	struct coresight_platform_data *pdata = NULL;
>  	void __iomem *base;
>  
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, drvdata);
> +
>  	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
>  	if (ret)
>  		return ret;
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
> @@ -627,18 +627,12 @@ static struct amba_driver catu_driver = {
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
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	ret = __catu_probe(&pdev->dev, res);
>  	pm_runtime_put(&pdev->dev);
>  	if (ret)
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 5f6db2fb95d4623a0bab08828ae00442870abd7d..3edfb5d3d02056afcaab4da575d1101c68aeac80 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -562,10 +562,16 @@ static void debug_func_exit(void)
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
>  	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
>  	if (ret)
>  		return ret;
> @@ -629,13 +635,6 @@ static int __debug_probe(struct device *dev, struct resource *res)
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
> @@ -694,14 +693,8 @@ static struct amba_driver debug_driver = {
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
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index ead3f5358d411b1d9e45f87986bd85cbe5be720a..e5ab4a0323354d826c831f68c71d81808cbcd8ff 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -785,10 +785,16 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>  	u32 devid;
>  	void __iomem *base;
>  	struct coresight_platform_data *pdata = NULL;
> -	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct tmc_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
>  	struct coresight_dev_list *dev_list = NULL;
>  
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, drvdata);
> +
>  	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
>  	if (ret)
>  		return ret;
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
> @@ -982,14 +982,8 @@ static struct amba_driver tmc_driver = {
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
> -	dev_set_drvdata(&pdev->dev, drvdata);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> 

