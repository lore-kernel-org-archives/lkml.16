Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE2218732B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664260; cv=none; b=LGzrI+ZVsdMbPLic6wln/lndUvaQgqmhEUgkJcsia/m7cOdy8ybr8h1VyR/IP6xQIWFAa7lnECDuCmXRLpid9OkUPFO3cJDPRtQnxZkE2xCcY4d+MmqnYPrD2L7GMImPE1phj4TPN1MEs9/B16Xwfz80kw3STUSyjWH9x48q4yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664260; c=relaxed/simple;
	bh=yegnsyYz683tKmNytFSVZ/1TJEYAwVjdlVeUygdBKj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HaZ6WMjCmIx3y75PcdgqaQgQz3rwff1Pfn0IU8L2mZDyw1GooH8rhWL2y6JKtb8XA0ZX5NSGnk71ZksUoKuInmwEBjaIUozZAd5m2akp6XB+Lns+TgQfdgkADGKCbfnd/RUWOtUawYPgnbhXzoQiBo0pYrG3uEvGRmm9nj3iF00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20879106F;
	Thu,  3 Apr 2025 00:11:00 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D029D3F694;
	Thu,  3 Apr 2025 00:10:49 -0700 (PDT)
Message-ID: <d94c6f97-4ca8-4a3a-ae8a-8e872eaa8d3b@arm.com>
Date: Thu, 3 Apr 2025 12:40:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] coresight: Make clock sequence consistent
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-8-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250327113803.1452108-8-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/25 17:08, Leo Yan wrote:
> Since atclk is enabled after pclk during the probe phase, this commit
> maintains the same sequence for the runtime resume flow.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
>  drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
>  drivers/hwtracing/coresight/coresight-stm.c        | 6 +++---
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index ec6d3e656548..e378c2fffca9 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -299,11 +299,11 @@ static int funnel_runtime_resume(struct device *dev)
>  {
>  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }

funnel_probe() enables pclk after atclk though - which needs to be
reversed as well ?

static int funnel_probe(struct device *dev, struct resource *res)
{
	..................
        drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
        if (IS_ERR(drvdata->atclk))
                return PTR_ERR(drvdata->atclk);

        drvdata->pclk = coresight_get_enable_apb_pclk(dev);
        if (IS_ERR(drvdata->pclk))
                return PTR_ERR(drvdata->pclk);

>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 460af0f7b537..78854f586e89 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -337,11 +337,11 @@ static int replicator_runtime_resume(struct device *dev)
>  {
>  	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }

replicator_probe() enables pclk after atclk though - which needs to be
reversed as well ?

static int replicator_probe(struct device *dev, struct resource *res)
{
	..................
        drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
        if (IS_ERR(drvdata->atclk))
                return PTR_ERR(drvdata->atclk);

        drvdata->pclk = coresight_get_enable_apb_pclk(dev);
        if (IS_ERR(drvdata->pclk))
                return PTR_ERR(drvdata->pclk);



>  #endif
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index f13fbab4d7a2..ddb4f6678efd 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -972,11 +972,11 @@ static int stm_runtime_resume(struct device *dev)
>  {
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }
>  #endif

same here as well.

> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index cac1b5bba086..8212959f60d4 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -220,11 +220,11 @@ static int tpiu_runtime_resume(struct device *dev)
>  {
>  	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
>  	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>  		clk_prepare_enable(drvdata->pclk);
> +
> +	if (drvdata && !IS_ERR(drvdata->atclk))
> +		clk_prepare_enable(drvdata->atclk);
>  	return 0;
>  }
>  #endif

same here as well.

I assume this patch is trying to have the same clock sequence enablement
during original probe and resume path and then just the reverse sequence
during suspend path.
