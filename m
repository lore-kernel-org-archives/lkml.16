Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D0617BEBF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027129; cv=none; b=SwDxr74Ef9SdE0ZZmRwgNmj/YfKNX3Qbh1NMLlc/jRz4LhGaHnlh9SVQEMLdIR0clEDsolncTDAI0WBNuaCzd0TA8I1BE/XM8fNWyjAzhmLVoY8t2+olpm1AQMOSfOpXuPHvdyRHd0YvsEePE0SWGDCg0jmKcF2FugjPczB0IOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027129; c=relaxed/simple;
	bh=eoGkTQhqugRlO85EAz2Zx0SlQN4BRx8grqr+qLksFlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UygUDprI0UKqtvwSt+NR46h+GuKlJYjDj8njGKFlAWyEnYdRRfrKtpyvmRFF9DVaviLn3y+4T8vAkuXEq5Qtdd+QU9X294RpwSZ/IeR7kEM8rK7UDZYX2Vn5igle5LdVDhCv9+E6Ae2tN2vT1n+FhgqAVZywjtQs8HLnTMvCRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8594C1063;
	Wed, 30 Apr 2025 08:31:59 -0700 (PDT)
Received: from [192.168.1.148] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78C023F5A1;
	Wed, 30 Apr 2025 08:32:05 -0700 (PDT)
Message-ID: <adc1454d-f990-4f45-9dc2-6740b04ccba5@arm.com>
Date: Wed, 30 Apr 2025 14:45:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
Content-Language: en-GB
To: Yabin Cui <yabinc@google.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250429231301.1952246-1-yabinc@google.com>
 <20250429231301.1952246-2-yabinc@google.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250429231301.1952246-2-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 00:12, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
> 
> To address these race conditions, this patch introduces the
> following changes:
> 
> 1. The enable and disable operations for the CATU device are not
>     reentrant. Therefore, a spinlock is added to ensure that only
>     one CPU can enable or disable a given CATU device at any point
>     in time.
> 
> 2. A reference counter is used to manage the enable/disable state
>     of the CATU device. The device is enabled when the first CPU
>     requires it and is only disabled when the last CPU finishes
>     using it. This ensures the device remains active as long as at
>     least one CPU needs it.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Looks good to me, I will add :

Fixes: fcacb5c154ba ("coresight: Introduce support for Coresight Address 
Translation Unit")

Suzuki

> ---
>   drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
>   drivers/hwtracing/coresight/coresight-catu.h |  1 +
>   2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 96cb48b140af..d4e2e175e077 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       void *data)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, mode, data);
> -	CS_LOCK(catu_drvdata->base);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> +	if (csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	if (!rc)
> +		csdev->refcnt++;
>   	return rc;
>   }
>   
> @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>   
>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_disable_hw(catu_drvdata);
> -	CS_LOCK(catu_drvdata->base);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> +	if (--csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_disable_hw(catu_drvdata);
> +		CS_LOCK(catu_drvdata->base);
> +	}
>   	return rc;
>   }
>   
> @@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>   	dev->platform_data = pdata;
>   
>   	drvdata->base = base;
> +	raw_spin_lock_init(&drvdata->spinlock);
>   	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
>   	catu_desc.pdata = pdata;
>   	catu_desc.dev = dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..755776cd19c5 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>   	void __iomem *base;
>   	struct coresight_device *csdev;
>   	int irq;
> +	raw_spinlock_t spinlock;
>   };
>   
>   #define CATU_REG32(name, offset)					\

