Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBF5BA2E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474855; cv=none; b=NaHIawmI9gF/K7/sk2MNjMTYVDWKXQK+W/dAuFElWeIYvFqS1r5SOCfssmJoX8FV/SKTH79t+uk/E+Sw6BHUGVwizSiMVAOdIC8CfA1kZKLgql0igCqC34MN+qB2OzltNQ4ab/OM1wc8iCTIh57cYdJOB1Lwf3LWkiCxxA+PRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474855; c=relaxed/simple;
	bh=Hu/WytInUFsVyfj/rzJT6VjIoLegav7e02oTHIkQ/uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnfdv8FdHZZmssiJBHIWql5BkyPxtJF0cq2KRUbI63ccKEZvEaLklk2D8q+iEnvJ05+4XBqPPQy1ZHIdnhLUgnh/xUUt4DSMbmshQJiJCBJe2CeNMt8/DulWdRqVM/7Qg43kfqLQGOx0ulIc6YS4KcEsnPwkNrN/2W+OqycjMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0B9522C7;
	Wed,  2 Jul 2025 09:47:16 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 615703F66E;
	Wed,  2 Jul 2025 09:47:31 -0700 (PDT)
Date: Wed, 2 Jul 2025 17:47:29 +0100
From: Leo Yan <leo.yan@arm.com>
To: Junhao He <hejunhao3@huawei.com>
Cc: suzuki.poulose@arm.com, james.clark@arm.com, anshuman.khandual@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v2 2/3] coresight: tmc: refactor the tmc-etr mode setting
 to avoid race conditions
Message-ID: <20250702164729.GA1039028@e132581.arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-3-hejunhao3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620075412.952934-3-hejunhao3@huawei.com>

On Fri, Jun 20, 2025 at 03:54:11PM +0800, Junhao He wrote:

[...]

> To fix this, configure the tmc-etr mode before invoking enable_etr_perf()
> or enable_etr_sysfs(), explicitly check if the tmc-etr sink is already
> enabled in a different mode, and simplily the setup and checks for "mode".
> To prevent race conditions between mode transitions.

I have a similiar fixing for CTI driver, see:
https://lore.kernel.org/linux-arm-kernel/20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com/T/#maccd68b460fb8d74ccdd3504163d8f486f04178b

[...]

> @@ -1781,14 +1756,52 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
>  static int tmc_enable_etr_sink(struct coresight_device *csdev,
>  			       enum cs_mode mode, void *data)
>  {
> +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	enum cs_mode old_mode;
> +	int rc = -EINVAL;
> +
> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {

scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {

I am concerned that the spinlock is acquired and released for several
times in a single flow. It is possible to hit some corner case, e.g.,

- CPU0 acquires the lock, set sink as SYSFS mode, and releases the lock;
- CPU1 acquires the lock, detects the SYSFS mode has been set,
  directly bail out, then enable ETM.

The problem is the sink has not been enabled yet. This leads to CPU1
to enable the tracer but prior to sink's enabling.

The key piont is we should ensure the mode is consistent to the
hardware state. I will take a bit time for if we can have a better idea
for this.

> +		old_mode = coresight_get_mode(csdev);
> +		if (old_mode != CS_MODE_DISABLED && old_mode != mode)
> +			return -EBUSY;
> +
> +		if (drvdata->reading)
> +			return -EBUSY;
> +
> +		/* In sysFS mode we can have multiple writers per sink. */
> +		if (old_mode == CS_MODE_SYSFS) {
> +			csdev->refcnt++;

I am just wandering if we can unify the "refcnt" code for both SYSFS
mode and Perf mode, and as a result, we can consolidate the code cross
different drivers.

Something like:

                if (!csdev->refcnt) {
                        coresight_set_mode(csdev, mode);
                } else {
                        /* The device has been configured with an incompatible mode */
                        if (coresight_get_mode(csdev) != mode)
                                return -EBUSY;

                        csdev->refcnt++;
                }

Then when disable the device:

                csdev->refcnt--;
                if (!csdev->refcnt)
                        coresight_set_mode(csdev, CS_MODE_DISABLED);

We should not check "drvdata->reading" when enable or disable sink, as
it is a flag to track if reading the trace buffer, it is irrelevant to
the sink device's enabling or disabling.

Please verify perf mode (especially for system wide session) to avoid
anything missed.

Thanks,
Leo

> +			return 0;
> +		}
> +
> +		/*
> +		 * minor note: In sysFS mode, the task1 get locked first, it setup
> +		 * etr mode to SYSFS. Then task2 get locked，it will directly return
> +		 * success even when the tmc-etr is not enabled at this moment.
> +		 * Ultimately, task1 will still successfully enable tmc-etr.
> +		 * This is a transient state and does not cause an anomaly.
> +		 */
> +		coresight_set_mode(csdev, mode);
> +	}
> +
>  	switch (mode) {
>  	case CS_MODE_SYSFS:
> -		return tmc_enable_etr_sink_sysfs(csdev);
> +		rc = tmc_enable_etr_sink_sysfs(csdev);
> +		break;
>  	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> +		rc = tmc_enable_etr_sink_perf(csdev, data);
> +		break;
>  	default:
> -		return -EINVAL;
> +		rc = -EINVAL;
>  	}
> +
> +	if (rc && old_mode != mode) {
> +		scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> +			coresight_set_mode(csdev, old_mode);
> +		}
> +	}
> +
> +	return rc;
>  }
>  
>  static int tmc_disable_etr_sink(struct coresight_device *csdev)
> -- 
> 2.33.0
> 
