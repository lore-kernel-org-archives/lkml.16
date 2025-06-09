Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4983421B9CF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488318; cv=none; b=hO+e614FJyJQwzIGzI6mUv4mm61m+hjxrLqteYw1bA10NdVZ8ovlacMw+xXaDqJP/F4+ZLhz14wSD4FcIpEGASATsRMeY03NnBelKQSFICcXPoaf1hkrQwMWL6Z/H8dD42XPC69q/7Kqrtz1CRbEct9klXQm/tZzjJCi00aDOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488318; c=relaxed/simple;
	bh=7MNJtYgctPcAvCtGaR80wMQIFSv9XHMSEDmt5DkZ6YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWVV5yqBaeNZ1PgcptoZC57QuI5t27yFHmsMaXWuiqMBawVgq4XD02DarYFkp2Xto6Zzb5bUSf8jU1BLWsEj+sPYjVcNHWO5AXamYtmew7Ngo3Q/Ih4+95n2M4GyoyxJ2tuCpDMnIZegtyjevkCSKMfnVQJmrhwip/aJU2jSwY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE57150C;
	Mon,  9 Jun 2025 09:58:17 -0700 (PDT)
Received: from [10.57.48.120] (unknown [10.57.48.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CECCD3F66E;
	Mon,  9 Jun 2025 09:58:34 -0700 (PDT)
Message-ID: <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
Date: Mon, 9 Jun 2025 17:58:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2025 17:00, Leo Yan wrote:
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
>   include/linux/coresight.h | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index dd2b4cc7a2b70cf060a3207548fe80e3824c489f..9afa1f76c78a3347e54d94fe9a9ebed72e3fff8e 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -480,15 +480,18 @@ static inline bool is_coresight_device(void __iomem *base)
>    * Returns:
>    *
>    * clk   - Clock is found and enabled
> + * NULL  - Clock is not needed as it is managed by the AMBA bus driver
>    * ERROR - Clock is found but failed to enable
>    */
>   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>   {
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

AMBA driver doesn't handle "apb" clock ? So we may need to retain that 
here ?

Otherwise looks good to me.

Suzuki
> +	}
>   
>   	return pclk;
>   }
> 

