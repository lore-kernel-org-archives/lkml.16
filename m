Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FAB15575C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662947; cv=none; b=q8bXIAiJpW1oRQfu15LLSfDgi6s+VD6/xtJ0iQ+Gid26TViUTR0SLzPPsowe2huLbk1vfpzWl7CV+UcEXBAPHVW4LK4LQIchdpO3+SKN+S5m5LRcS9l/riYmK97lryR+D396McyN8EY+9fPranVIyEHQCiMRmqg2j7gtgRcorNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662947; c=relaxed/simple;
	bh=HdnJUqHmISB3FjuAikp1AtKeC/xQ9PigPiyQSezv5GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dVEINns6R6Tf/YjsMhxRTDyTp6hVD8qgYMiV0g4nn8piaAhdVsArkxNalWQsNUliHvIHa8NuU0V0M7rESwYM4iUUY/6sZq0LtgKnVnp9fR1ZRFQFI8OcjA2b2jcMrGGZDoK/mr4cTKmtLhpw3uFKqqnlvi+sHXrRpuz2ENN5Dko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F605106F;
	Wed,  2 Apr 2025 23:49:07 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9444B3F59E;
	Wed,  2 Apr 2025 23:48:59 -0700 (PDT)
Message-ID: <5a8aaa17-cc36-4e03-95b3-24c3a16dd987@arm.com>
Date: Thu, 3 Apr 2025 12:18:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] coresight: Avoid enable programming clock
 duplicately
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-6-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250327113803.1452108-6-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/27/25 17:07, Leo Yan wrote:
> The programming clock is enabled by AMBA bus driver before a dynamic
> probe.  As a result, a CoreSight driver may redundantly enable the same
> clock.
> 
> To avoid this, add a check for device type and skip enabling the
> programming clock for AMBA devices.  The returned NULL pointer will be
> tolerated by the drivers.
> 
> Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  include/linux/coresight.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index b888f6ed59b2..26eb4a61b992 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -476,15 +476,18 @@ static inline bool is_coresight_device(void __iomem *base)
>   * Returns:
>   *
>   * clk   - Clock is found and enabled
> + * NULL  - Clock is not needed as it is managed by the AMBA bus driver
>   * ERROR - Clock is found but failed to enable
>   */
>  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>  {
> -	struct clk *pclk;
> +	struct clk *pclk = NULL;
>  
> -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> -	if (IS_ERR(pclk))
> -		pclk = devm_clk_get_enabled(dev, "apb");
> +	if (!dev_is_amba(dev)) {
> +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +		if (IS_ERR(pclk))
> +			pclk = devm_clk_get_enabled(dev, "apb");
> +	}
>  
>  	return pclk;
>  }

coresight_get_enable_apb_pclk() mostly gets called in the platform driver
probe paths but they are also present in some AMBA probe paths. Hence why
cannot the callers in AMBA probe paths get fixed instead ? Besides return
value never gets checked for NULL, which would have to be changed as well
if coresight_get_enable_apb_pclk() starts returning NULL values for AMBA
devices.

	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
	if (IS_ERR(drvdata->pclk))
		return -ENODEV;

I guess this redundancy should be fixed at the AMBA probe callers.
