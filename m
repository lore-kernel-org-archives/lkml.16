Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64D321ADC2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103157; cv=none; b=LC0uprtWYZKVBDZVGA38FFVx2niL7XWVI7bUO0QOt6e7b8jHhoWItonfAbBciqpSVrkCL3t80ZiGec6o2mDtOoOtdpSH1AffbTGmD7kEKcNUdFkbm/79H6MzpGHZOcY7sc4fA3Jt8zkfYRWg1/4jZlALw3rjg8neQImqJLKLJhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103157; c=relaxed/simple;
	bh=8Y2ipdf68jbjP+ONrXK4m6gDypJxM855jxMpYsk0KWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZF2/5k7EVRMQW3RWWCndFznCMCRhmivHssqx0a5V4KnKFjAdHeqnrJap95IjFQjOqwm+7JD/HbakwkAQN0w+E+kBguxBefsMEE04VzIe2yKf+hK2T8dtb/N6SGuVlSC2e48snHDs4N9kZm1KM3215u4QgOLusKNndoIiWxcEpac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56FDA1688;
	Tue,  8 Apr 2025 02:05:50 -0700 (PDT)
Received: from [10.57.41.251] (unknown [10.57.41.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04B913F694;
	Tue,  8 Apr 2025 02:05:47 -0700 (PDT)
Message-ID: <98f6fa74-f14e-48f1-b550-c1ff962df53d@arm.com>
Date: Tue, 8 Apr 2025 10:05:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [Patch v1]Add ETE devarch condition in
 etm4_init_iomem_access
Content-Language: en-GB
To: yiru zhang <yiru.zhang@mediatek.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250408073651.17140-1-yiru.zhang@mediatek.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250408073651.17140-1-yiru.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yiru



On 08/04/2025 08:36, yiru zhang wrote:
> Due to ETE supported, so add ETE devarch condition in etm4_init_iomem_access.

Is there a reason why you cannot use the "system instructions to access 
the ETE" ?

The patch as such is fine by me (withe some minor styling nits). But, we
do not recommend using the MMIO for ETE, when it can be accessed
directly by sysreg.

FWIW, if you remove the "mmio base" address from the DT/ACPI, it
should automatically use the system instructions for ETE.




> Signed-off-by: yiru zhang <yiru.zhang@mediatek.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2b8f10463840..971b9f0fe5e4 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1135,8 +1135,9 @@ static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
>   	 * with MMIO. But we cannot touch the OSLK until we are
>   	 * sure this is an ETM. So rely only on the TRCDEVARCH.
>   	 */
> -	if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH) {
> -		pr_warn_once("TRCDEVARCH doesn't match ETMv4 architecture\n");
> +	if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH \
> +	&& (devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETE_ARCH) {

We could use a switch case ?

	switch (devarch & ETM_DEVARCH_ID_MASK) {
	case ETM_DEVARCH_ETMv4x_ARCH:
	case ETM_DEVARCH_ETE_ARCH:
		break;
	default:
		pr_warn_once("Unknown ETM architecture: %x\n",
				devarch & ETM_DEVARCH_ID_MASK);
		return false;
	}

Suzuki

> +		pr_warn_once("TRCDEVARCH doesn't match ETMv4&ETE architecture\n");
>   		return false;
>   	}
>   

