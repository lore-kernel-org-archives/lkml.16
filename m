Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9722AE7F;
	Wed, 30 Apr 2025 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004880; cv=none; b=uz09ZMCDdfNcI3ALS0o1n1DL14Dfd7CyOVVrfrYGvIZPFllhCni+3u/E7YntfB8rzNJQiu5lHHnPQdQ4z/EwalHIAmsZ69djWMHzvXzd4R0j5SgkJY3AtImTl8wjCoi34nhGbkpJn3IyG+wenqbwztkFUNI1nHV2wytLYrxnQZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004880; c=relaxed/simple;
	bh=+SjWW4fR/EqDLqfWjxuFRi+9M+h1UwFLsskoJ8SVllg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qHNmrCyAiV4/zSevZKIfZjiA8nVzl0rTAKKQiOXDHaeJgWZdj2ygZlFkhiQai2RPjPzI0vJLw6N1gOkRmuodpKbCvjKO3xopbMkpHkfnQv1NVA4f1wO7XrGxnWcPWAMKny/FIxVMD7JPoTtzuJwfzgM38PNC2VCMFf9flb6O3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=fail smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 125CE106F;
	Wed, 30 Apr 2025 02:21:09 -0700 (PDT)
Received: from [10.1.33.69] (Suzukis-MBP.cambridge.arm.com [10.1.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B45673F5A1;
	Wed, 30 Apr 2025 02:21:14 -0700 (PDT)
Message-ID: <e99c390f-229f-41cf-8646-b1400331605e@arm.com>
Date: Wed, 30 Apr 2025 10:21:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] coresight: etm4x: Extract the trace unit
 controlling
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401180708.385396-1-leo.yan@arm.com>
 <20250401180708.385396-2-leo.yan@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250401180708.385396-2-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 19:07, Leo Yan wrote:
> The trace unit is controlled in the ETM hardware enabling and disabling.
> The sequential changes for support AUX pause and resume will reuse the
> same operations.
> 
> Extract the operations in the etm4_{enable|disable}_trace_unit()
> functions.  A minor improvement in etm4_enable_trace_unit() is for
> returning the timeout error to callers.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>

The patch looks good to me. One comment below, nothing with your patch 
though.


> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 103 +++++++++++++++++++++++++----------------
>   1 file changed, 62 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..53cb0569dbbf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -431,6 +431,44 @@ static int etm4x_wait_status(struct csdev_access *csa, int pos, int val)
>   	return coresight_timeout(csa, TRCSTATR, pos, val);
>   }
>   
> +static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
> +{
> +	struct coresight_device *csdev = drvdata->csdev;
> +	struct device *etm_dev = &csdev->dev;
> +	struct csdev_access *csa = &csdev->access;
> +
> +	/*
> +	 * ETE mandates that the TRCRSR is written to before
> +	 * enabling it.
> +	 */
> +	if (etm4x_is_ete(drvdata))
> +		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> +
> +	etm4x_allow_trace(drvdata);
> +	/* Enable the trace unit */
> +	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> +
> +	/* Synchronize the register updates for sysreg access */
> +	if (!csa->io_mem)
> +		isb();
> +
> +	/* wait for TRCSTATR.IDLE to go back down to '0' */
> +	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0)) {
> +		dev_err(etm_dev,
> +			"timeout while waiting for Idle Trace Status\n");
> +		return -ETIME;
> +	}
> +
> +	/*
> +	 * As recommended by section 4.3.7 ("Synchronization when using the
> +	 * memory-mapped interface") of ARM IHI 0064D
> +	 */
> +	dsb(sy);
> +	isb();
> +
> +	return 0;
> +}
> +
>   static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	int i, rc;
> @@ -539,33 +577,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   		etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
>   	}
>   
> -	/*
> -	 * ETE mandates that the TRCRSR is written to before
> -	 * enabling it.
> -	 */
> -	if (etm4x_is_ete(drvdata))
> -		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> -
> -	etm4x_allow_trace(drvdata);
> -	/* Enable the trace unit */
> -	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> -
> -	/* Synchronize the register updates for sysreg access */
> -	if (!csa->io_mem)
> -		isb();
> -
> -	/* wait for TRCSTATR.IDLE to go back down to '0' */
> -	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0))
> -		dev_err(etm_dev,
> -			"timeout while waiting for Idle Trace Status\n");
> -
> -	/*
> -	 * As recommended by section 4.3.7 ("Synchronization when using the
> -	 * memory-mapped interface") of ARM IHI 0064D
> -	 */
> -	dsb(sy);
> -	isb();
> -
> +	rc = etm4_enable_trace_unit(drvdata);
>   done:
>   	etm4_cs_lock(drvdata, csa);
>   
> @@ -884,25 +896,12 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>   	return ret;
>   }
>   
> -static void etm4_disable_hw(void *info)
> +static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>   {
>   	u32 control;
> -	struct etmv4_drvdata *drvdata = info;
> -	struct etmv4_config *config = &drvdata->config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct device *etm_dev = &csdev->dev;
>   	struct csdev_access *csa = &csdev->access;
> -	int i;
> -
> -	etm4_cs_unlock(drvdata, csa);
> -	etm4_disable_arch_specific(drvdata);
> -
> -	if (!drvdata->skip_power_up) {
> -		/* power can be removed from the trace unit now */
> -		control = etm4x_relaxed_read32(csa, TRCPDCR);
> -		control &= ~TRCPDCR_PU;
> -		etm4x_relaxed_write32(csa, control, TRCPDCR);
> -	}
>   
>   	control = etm4x_relaxed_read32(csa, TRCPRGCTLR);
>   
> @@ -943,6 +942,28 @@ static void etm4_disable_hw(void *info)
>   	 * of ARM IHI 0064H.b.
>   	 */
>   	isb();
> +}
> +
> +static void etm4_disable_hw(void *info)
> +{
> +	u32 control;
> +	struct etmv4_drvdata *drvdata = info;
> +	struct etmv4_config *config = &drvdata->config;
> +	struct coresight_device *csdev = drvdata->csdev;
> +	struct csdev_access *csa = &csdev->access;
> +	int i;
> +
> +	etm4_cs_unlock(drvdata, csa);
> +	etm4_disable_arch_specific(drvdata);
> +
> +	if (!drvdata->skip_power_up) {
> +		/* power can be removed from the trace unit now */
> +		control = etm4x_relaxed_read32(csa, TRCPDCR);
> +		control &= ~TRCPDCR_PU;
> +		etm4x_relaxed_write32(csa, control, TRCPDCR);
> +	}

Shouldn't we delay ^^ until we have read all the registers back and 
disabled the trace ? As I said, this is an existing problem and may need
to be fixed. It would be good to move it after we have done everything 
with the accesses. If we start with that patch, we could easily backport
it to stable.


Suzuki


> +
> +	etm4_disable_trace_unit(drvdata);
>   
>   	/* read the status of the single shot comparators */
>   	for (i = 0; i < drvdata->nr_ss_cmp; i++) {

