Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FC918B03
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738837942; cv=none; b=Q95kQ1AZ7OCTCb4AjK/HH42kDmPDTxFAllC6oHNlt+LyrB9Ap8raLNlO7ZorMNY5I/ZTaKk3UCQ+UDHBAMZ/F4j3xrDUHpQO929szeJVpzT087S+JnqZZ4ytXrqIzHAxvcEEELrtqxihF5DBkf6b1igq/lHjq32poC14l+WH4YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738837942; c=relaxed/simple;
	bh=A3UmOOPTkZ5V+nsffwzqYuX1GJ0nEl3W+c+g0TAZ/pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktp0ff6deMN9JAJZbCkddvyW89JKaeqPVVh8u6E84RtkmhlmqHuOrfzmqns2wHvFcUSZHHKYF7csqBIUL9yr+ysG72XjgVt3vSkVDmTi6mOkbHUVn3xRZpsd3jBp1/8edAg89R7zOsxaK2CnH5wt1IxXvlXrBjEERm0Fjacl0xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 413FA12FC;
	Thu,  6 Feb 2025 02:32:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8722F3F63F;
	Thu,  6 Feb 2025 02:32:18 -0800 (PST)
Date: Thu, 6 Feb 2025 10:32:13 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight-tmc: stop disabling tmc when flush timeout
Message-ID: <20250206103213.GB8855@e132581.arm.com>
References: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>

Hi Yuanfang,

On Fri, Jan 03, 2025 at 04:01:54PM +0800, Yuanfang Zhang wrote:
> 
> When multiple ETMs are enabled simultaneously, the time required
> to complete a flush in the process of reading the TMC device node
> may exceed the default wait time of 100us.

Have you tried how long time would be safe to wait for the
TMCREADY_BIT bit to be set on your platform?

> If the TMC capture is stopped while any ETM has not completed its
> flush, it can cause the corresponding CPU to hang.
>
> Fix the by checking the TMCReady bit after the flush. If TMCReady
> bit is set, TraceCaptEn bit can be clear; otherwise, return directly
> and stop the TMC read.

When a timeout for TMC flush and stop is detected, if the driver
arbitrarily bails out without disabling TMC, this would leave the
hardware always on.

I would like first know if a longer timeout can fix the issue.

Thanks,
Leo

> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 17 +++++++++++++++--
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 22 +++++++++++++++++-----
>  2 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d4f641cd9de69488fe3d1c1dc9b5a9eafb55ed59..bded290c42891d782344d9a6e63ebdbed6719133 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -80,11 +80,21 @@ static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
>         return;
>  }
> 
> -static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> +static int __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>  {
> +       int rc;
> +
>         CS_UNLOCK(drvdata->base);
> 
>         tmc_flush_and_stop(drvdata);
> +
> +       rc = tmc_wait_for_tmcready(drvdata);
> +       if (rc) {
> +               dev_err(&drvdata->csdev->dev,
> +                       "Failed to disable : TMC is not ready\n");
> +               CS_LOCK(drvdata->base);
> +               return rc;
> +       }
>         /*
>          * When operating in sysFS mode the content of the buffer needs to be
>          * read before the TMC is disabled.
> @@ -94,6 +104,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>         tmc_disable_hw(drvdata);
> 
>         CS_LOCK(drvdata->base);
> +       return 0;
>  }
> 
>  static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> @@ -650,7 +661,9 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
>                         ret = -EINVAL;
>                         goto out;
>                 }
> -               __tmc_etb_disable_hw(drvdata);
> +               ret = __tmc_etb_disable_hw(drvdata);
> +               if (ret)
> +                       goto out;
>         }
> 
>         drvdata->reading = true;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index a48bb85d0e7f44a25b813f3c828cc3d705d16012..63a1f7501562fa0b5c2fe6ea53dce4d82842bec3 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1135,11 +1135,21 @@ static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
>         }
>  }
> 
> -static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> +static int __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>  {
> +       int rc;
> +
>         CS_UNLOCK(drvdata->base);
> 
>         tmc_flush_and_stop(drvdata);
> +
> +       rc = tmc_wait_for_tmcready(drvdata);
> +       if (rc) {
> +               dev_err(&drvdata->csdev->dev,
> +                       "Failed to disable : TMC is not ready\n");
> +               CS_LOCK(drvdata->base);
> +               return rc;
> +       }
>         /*
>          * When operating in sysFS mode the content of the buffer needs to be
>          * read before the TMC is disabled.
> @@ -1150,7 +1160,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>         tmc_disable_hw(drvdata);
> 
>         CS_LOCK(drvdata->base);
> -
> +       return 0;
>  }
> 
>  void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> @@ -1779,9 +1789,11 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>         }
> 
>         /* Disable the TMC if we are trying to read from a running session. */
> -       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> -               __tmc_etr_disable_hw(drvdata);
> -
> +       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
> +               ret = __tmc_etr_disable_hw(drvdata);
> +               if (ret)
> +                       goto out;
> +       }
>         drvdata->reading = true;
>  out:
>         spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20250103-fix_cpu_hung-b5a95179ada4
> 
> Best regards,
> --
> Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> 
