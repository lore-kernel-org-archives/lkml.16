Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC96623BF91
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601643; cv=none; b=SDuoBnVwW33hHzIUrXzV9QnfsqdMEHp2uFveNTZQ60VgrPuu5D5/wOdzIKRye5G0z+eTWekBuToccdPrjt8iE0iad6VmXHpqbxOkOHVp6EdLmE6HzHj9DIdO/uzH4zI3iFuJn6PkThdaLo9z8Qdq+zW78B9do73S4rx/pUEm7Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601643; c=relaxed/simple;
	bh=3HWKRBvWms/Fm5yIa6e9Ac6OSfU4w3fGrLtKzdLJgXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TukUXRVdW4tu3Mbn9M8BQoKgsjn+27Ytz764bhrIeEHZ+xMabKY1ngy73x31yRGr0OULNN4KIqB8n6aQWcMTU+Dziwk63Rwu3MUidDmoYp7HiWBjIYDr660tFoIc5P6LlCJOfdHMlLLrsP8JEPLdhhv1DgVFLc6V8ZRSwW1N2zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C26FEC;
	Wed,  2 Apr 2025 06:47:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79BF33F694;
	Wed,  2 Apr 2025 06:47:20 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:47:16 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] coresight: catu: Prevent concurrent PERF and
 SYSFS mode enablement
Message-ID: <20250402134716.GK115840@e132581.arm.com>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-3-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402011832.2970072-3-yabinc@google.com>

On Tue, Apr 01, 2025 at 06:18:31PM -0700, Yabin Cui wrote:
> A CATU device can be enabled for either PERF mode or SYSFS mode, but
> not both simultaneously. Consider the following race condition:
> 
> CPU 1 enables CATU for PERF mode.
> CPU 2 enables CATU for SYSFS mode. It only increases refcnt.
> CPU 2 enables ETR for SYSFS mode.
> CPU 1 fails to enable ETR for PERF mode.
> 
> This results in a CATU being enabled in PERF mode and an ETR enabled
> in SYSFS mode, leading to unknown behavior.
> 
> To prevent this situation, this patch checks enabled mode of a
> CATU device before increasing its refcnt.

Yes.  We have also observed the same issue.  I am currently working on
refactoring the Arm CoreSight locking, my plan is to use coresight_path
to maintain mode.

Given it is uncommon case to use two modes concurrently in Arm
CoreSight, I assume this is not an urgent issue.  Could we defer this
patch?  My understanding is that this issue will be prevented with
checking the path mode, rather than checking modes in seperate modules.

To be clear, I am fine with other two patches in the series.

Thanks,
Leo

> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: James Clark <james.clark@linaro.org>
> Suggested-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c | 6 +++++-
>  drivers/hwtracing/coresight/coresight-catu.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index b1d490dd7249..0caf3a3e75ce 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -466,7 +466,10 @@ static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>  		CS_UNLOCK(catu_drvdata->base);
>  		rc = catu_enable_hw(catu_drvdata, mode, data);
>  		CS_LOCK(catu_drvdata->base);
> -	}
> +		if (!rc)
> +			catu_drvdata->mode = mode;
> +	} else if (catu_drvdata->mode != mode)
> +		rc = -EBUSY;
>  	if (!rc)
>  		csdev->refcnt++;
>  	return rc;
> @@ -499,6 +502,7 @@ static int catu_disable(struct coresight_device *csdev, void *__unused)
>  		CS_UNLOCK(catu_drvdata->base);
>  		rc = catu_disable_hw(catu_drvdata);
>  		CS_LOCK(catu_drvdata->base);
> +		catu_drvdata->mode = CS_MODE_DISABLED;
>  	} else {
>  		rc = -EBUSY;
>  	}
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 755776cd19c5..ea406464f0a8 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -66,6 +66,7 @@ struct catu_drvdata {
>  	struct coresight_device *csdev;
>  	int irq;
>  	raw_spinlock_t spinlock;
> +	enum cs_mode mode;
>  };
>  
>  #define CATU_REG32(name, offset)					\
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 
