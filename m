Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642F125A2D8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550048; cv=none; b=hsXB3tsUSAfTyQh8BGxkWxSdMuQl52o3V+47N4dn4kOqbk2uv6PayOwo/mjj4/y332fTRZt9W0N2bkv5ZEJsiWVpHHjWP+AJa7kPSOJIVjbirM15cysMxxHeePzlL8gvZxbvekKczUX/wAbEOuzp00BWHPfsIt5LJGxZYugXCuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550048; c=relaxed/simple;
	bh=N+oxIFk9FbSr33/YJuMmcdC7PGCytMKA1MRI6kSgwWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5LhcCKUPjSvEnEbRjfgmJjnsuahgJzCAqOfNoIuCpyNqJ3Lp/BMA2kkb1HbKaGnrlgQIT/l+af7ObqZtscG3n+x8XW9/aLFBWz0XjoTiRkL3DQ4iw83ftvu1Spy/Dv0Obi9qDf+sZi3rSWGbf9hMpIaxLgijrtf44BMqnWAqSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C0B214BF;
	Tue, 10 Jun 2025 03:07:05 -0700 (PDT)
Received: from [10.163.32.103] (unknown [10.163.32.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 276383F673;
	Tue, 10 Jun 2025 03:07:20 -0700 (PDT)
Message-ID: <dbf2f5b8-49cc-4b66-b32b-a8e149029419@arm.com>
Date: Tue, 10 Jun 2025 15:37:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] coresight: Refactor runtime PM
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-9-423b3f1f241d@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-9-423b3f1f241d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/06/25 9:30 PM, Leo Yan wrote:
> The validation for driver data pointers and clock pointers are redundant
> in the runtime PM callbacks.  After a driver's probing, its driver data
> and clocks have been initialized successfully, this ensures it is safe
> to access driver data and clocks in the runtime PM callbacks.  A corner
> case is a clock pointer is NULL, in this case, the clock core layer can
> handle it properly.  So remove these redundant checking.
> 
> In runtime resume, respect values returned from clock function and add
> error handling.

Makes sense.

> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

This looks like a good clean up and streamlining.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 +++-----
>  drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++------
>  drivers/hwtracing/coresight/coresight-etb10.c      |  8 ++------
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |  8 ++------
>  drivers/hwtracing/coresight/coresight-funnel.c     | 21 +++++++++++----------
>  drivers/hwtracing/coresight/coresight-replicator.c | 20 +++++++++++---------
>  drivers/hwtracing/coresight/coresight-stm.c        | 20 +++++++++++---------
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 20 +++++++++++---------
>  8 files changed, 53 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 3edfb5d3d02056afcaab4da575d1101c68aeac80..5f21366406aae03edef9e4fb737e19941afb9ac2 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -731,8 +731,8 @@ static int debug_runtime_suspend(struct device *dev)
>  {
>  	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->pclk);
> +
>  	return 0;
>  }
>  
> @@ -740,9 +740,7 @@ static int debug_runtime_resume(struct device *dev)
>  {
>  	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> -	return 0;
> +	return clk_prepare_enable(drvdata->pclk);
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 75b5114ef652e4a47c53fbd2b7811c1bab575645..c586495e9a088a63cec481a82fd9f4ec7c645160 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -278,8 +278,7 @@ static int ctcu_runtime_suspend(struct device *dev)
>  {
>  	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
> -		clk_disable_unprepare(drvdata->apb_clk);
> +	clk_disable_unprepare(drvdata->apb_clk);
>  
>  	return 0;
>  }
> @@ -288,10 +287,7 @@ static int ctcu_runtime_resume(struct device *dev)
>  {
>  	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
> -		clk_prepare_enable(drvdata->apb_clk);
> -
> -	return 0;
> +	return clk_prepare_enable(drvdata->apb_clk);
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 8e81b41eb22264f17606050fa8da277aae05c5cc..35db1b6093d154d67dc567df42f838e2ba3d1d58 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -809,8 +809,7 @@ static int etb_runtime_suspend(struct device *dev)
>  {
>  	struct etb_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
>  
>  	return 0;
>  }
> @@ -819,10 +818,7 @@ static int etb_runtime_resume(struct device *dev)
>  {
>  	struct etb_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
> -	return 0;
> +	return clk_prepare_enable(drvdata->atclk);
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index baba2245b1dfb31f4bf19080e20c33df3a5b854f..45630a1cd32fbd05ec8b2a6979f0174cacce365e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -925,8 +925,7 @@ static int etm_runtime_suspend(struct device *dev)
>  {
>  	struct etm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
>  
>  	return 0;
>  }
> @@ -935,10 +934,7 @@ static int etm_runtime_resume(struct device *dev)
>  {
>  	struct etm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -
> -	return 0;
> +	return clk_prepare_enable(drvdata->atclk);
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 9dcfc5ce8845d9e01bb956dddab0d64de51ec397..3b248e54471a38f501777fe162fea850d1c851b3 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -284,11 +284,8 @@ static int funnel_runtime_suspend(struct device *dev)
>  {
>  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> -
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
>  	return 0;
>  }
> @@ -296,13 +293,17 @@ static int funnel_runtime_suspend(struct device *dev)
>  static int funnel_runtime_resume(struct device *dev)
>  {
>  	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -	return 0;
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index e53095603b0c0419bc96a66b23d15bb54e75e634..e6472658235dc479cec91ac18f3737f76f8c74f0 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -323,24 +323,26 @@ static int replicator_runtime_suspend(struct device *dev)
>  {
>  	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return 0;
>  }
>  
>  static int replicator_runtime_resume(struct device *dev)
>  {
>  	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index ed68d8280b1945f38d1294a5b5f557a614c90c94..28230bbc9df2afec7b426e2fd4d4e4066f51e143 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -957,24 +957,26 @@ static int stm_runtime_suspend(struct device *dev)
>  {
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return 0;
>  }
>  
>  static int stm_runtime_resume(struct device *dev)
>  {
>  	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 1c5c2a82971490888c45508c68b516ab7dbf3eeb..9463afdbda8ad74eee78c72185fe7603f81b7888 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -206,24 +206,26 @@ static int tpiu_runtime_suspend(struct device *dev)
>  {
>  	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->atclk);
> +	clk_disable_unprepare(drvdata->pclk);
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_disable_unprepare(drvdata->pclk);
>  	return 0;
>  }
>  
>  static int tpiu_runtime_resume(struct device *dev)
>  {
>  	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> -		clk_prepare_enable(drvdata->pclk);
> +	ret = clk_prepare_enable(drvdata->pclk);
> +	if (ret)
> +		return ret;
>  
> -	if (drvdata && !IS_ERR(drvdata->atclk))
> -		clk_prepare_enable(drvdata->atclk);
> -	return 0;
> +	ret = clk_prepare_enable(drvdata->atclk);
> +	if (ret)
> +		clk_disable_unprepare(drvdata->pclk);
> +
> +	return ret;
>  }
>  #endif
>  
> 

