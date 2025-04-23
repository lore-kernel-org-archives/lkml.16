Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4D2268FC9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396221; cv=none; b=nbHZV/8PYuowyHvEUf4e7/jvwbiNfxMZJ2rKbUa4P3sD9EOUimxCBpxaB6pGD5vWQ9GaMyf7SkLSlxWwO5g9Bnh+tf4c2UUBuKkC9AMVfdMPKipoHacNdsz5M90e4I9i3snoSoABp63BPoSxmvILGRASITiXXoe469kXwfF2lqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396221; c=relaxed/simple;
	bh=bSpjW+9ufbA0t43BiX6OwdyJEkKiQ0NPu/mvXSXhZe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ug8xw+bjhD5LAjgoIwoa26/6nuqDir0u+NQ9UGPUwfeReNJ13asjRMe0uxdZ4YMdsWCoLcS4r4rK5x83cv/3fDZQu2Us1l8L1V2WJXiQlzg796JNVDSE6UVPaOTB/3MnSazxHZ10C4R/CrB0IpOVY7F3mKwKTceOHOEpFQ3GB8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 270001063;
	Wed, 23 Apr 2025 01:16:48 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 545BC3F59E;
	Wed, 23 Apr 2025 01:16:52 -0700 (PDT)
Date: Wed, 23 Apr 2025 09:16:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
Message-ID: <20250423081648.GJ28953@e132581.arm.com>
References: <20250415184649.356683-1-yabinc@google.com>
 <20250415184649.356683-2-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415184649.356683-2-yabinc@google.com>

Hi Yabin,

Sorry for late reply as I was on vacation for the past two weeks.

On Tue, Apr 15, 2025 at 11:46:48AM -0700, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
> 
> To address these race conditions, this patch introduces the
> following changes:
> 
> 1. The enable and disable operations for the CATU device are not
>    reentrant. Therefore, a spinlock is added to ensure that only
>    one CPU can enable or disable a given CATU device at any point
>    in time.
> 
> 2. A reference counter is used to manage the enable/disable state
>    of the CATU device. The device is enabled when the first CPU
>    requires it and is only disabled when the last CPU finishes
>    using it. This ensures the device remains active as long as at
>    least one CPU needs it.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

As Jie reminded, please add James' review tag in next spin.

Thanks,
Leo

> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
>  drivers/hwtracing/coresight/coresight-catu.h |  1 +
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..3909b562b077 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>  static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>  		       void *data)
>  {
> -	int rc;
> +	int rc = 0;
>  	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
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
>  	return rc;
>  }
>  
> @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>  
>  static int catu_disable(struct coresight_device *csdev, void *__unused)
>  {
> -	int rc;
> +	int rc = 0;
>  	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
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
>  	return rc;
>  }
>  
> @@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>  	dev->platform_data = pdata;
>  
>  	drvdata->base = base;
> +	raw_spin_lock_init(&drvdata->spinlock);
>  	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
>  	catu_desc.pdata = pdata;
>  	catu_desc.dev = dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..755776cd19c5 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>  	void __iomem *base;
>  	struct coresight_device *csdev;
>  	int irq;
> +	raw_spinlock_t spinlock;
>  };
>  
>  #define CATU_REG32(name, offset)					\
> -- 
> 2.49.0.604.gff1f9ca942-goog
> 
