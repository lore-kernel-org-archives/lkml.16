Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD42F35946
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750741918; cv=none; b=AwIuXYwAne4VrAaSWdvbl59Fj/kJv+TeaQDhKYm2GaM0BMN+P+7delVfJZzJGlZ9OcBmW8y44BhbbF7RV9YrGLqq6kvOcQOuUuGCXfHfoizJS8K2COfcTcaTRWikDt1Y3XX8nAvDLFWCd6DJHfYKMVLo+n0iX4s3PnuvW3qkMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750741918; c=relaxed/simple;
	bh=g2SBdp4Q/4Up3tjmS+X71YsKE7Mx/swu6jPKmmAmfVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JF7Ii85ClHPn8A6xgusk938vlb0G4yjKLK+/aLoJ9OIPasn1RZjDP5TJH1M3mjbbFwVVO6z4zReoYIhKnrG74PsfaoaTOp0qAt48eO3DwyDSD18ItpmjZGLqesnEU+Oczyzt3CgXBkh1OfXQtmZshbvSlczgLof1Y+3APe3NS+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F10C5106F;
	Mon, 23 Jun 2025 22:11:37 -0700 (PDT)
Received: from [10.163.36.19] (unknown [10.163.36.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B42053F63F;
	Mon, 23 Jun 2025 22:11:52 -0700 (PDT)
Message-ID: <140f3fdd-ec11-4a96-bd71-4f6c8b5f13e1@arm.com>
Date: Tue, 24 Jun 2025 10:41:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/06/25 9:30 PM, Leo Yan wrote:
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
> index dd2b4cc7a2b70cf060a3207548fe80e3824c489f..9afa1f76c78a3347e54d94fe9a9ebed72e3fff8e 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -480,15 +480,18 @@ static inline bool is_coresight_device(void __iomem *base)
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
>

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
