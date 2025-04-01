Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545F1189F56
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497985; cv=none; b=ALUWH9+V8vTRvtBwODLuS2Sso2tkPZULZKncCCgfGLslZu+sM0vtVFlHBkoN3c6MhJ7XBTGdMWmGEJZnLRofQWTvjvyUEEkfdzA/IztP+81l0t7CzUAywfCjIGDMdRAGbYXBf89gyxHT3is06YxHCOZ5yf1V7cvE7rurTyTCvX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497985; c=relaxed/simple;
	bh=iA3vc6iBumO0wyuNH4D4SNx9H8X39pPVlKvlLxxeDqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cofMTD3s3mjuHtbcbzHHznB0QJCh6U6WAK5CnbwnEYlPIdwHR9WdHgE3BLzPAA9WfsbFJOzKXe+Qm9Bn2ajHpDuaecinThufkjGnXSZQcvMtTeDhY9uEKNYcJsPgrIIT3JoC5F9/j1OIN6GwUp9fSfUlZtuATuQv6jTBmnXsO0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdYg5tmv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdYg5tmv"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2295d78b433so9270625ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497982; x=1744102782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUtQE7nMd/6PSKoEtlC68hCAEgv6hCHzZZn6Ocd8nbQ=;
        b=RdYg5tmvEjiqm121IL/nr5xTsAa7TODaIHEnWSDofjTsVwB49Br7seF1Dq21pX/7Wz
         K5QnifMwPrCJ5zbt9gk+6sqkpTWi/+QA09Bs07vk1H6UMLVL2mQsyW6aNnsgHZpOuHhy
         7E7ByvnqJDTBpw1E8Sg0f71SRGTUbO9gFg8msmdg3yF9gliU7sJ+urFZttPKVFb9hMTv
         MV+amILgTfQ6z4rq2KcMkStei4C3km3hnTT9OnhPkcT4UsW1O5+CcRZyMA9H9OKolP2b
         snayhs/E369slo70k5DbOqgQm03ea0BTUA+LPeEdjtzCwrgzYONnY8Lclvinb1iT+oJc
         tNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497982; x=1744102782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUtQE7nMd/6PSKoEtlC68hCAEgv6hCHzZZn6Ocd8nbQ=;
        b=XA9LyW6gOt3C4NBngQZqBDPw+HMDLW7hicPid2+eLqehWox6dTEuSNdVIbE9s/9t0n
         TFR/FySmcGDXbbwcXesd3l+MbQEUl/lgQuLqk3jolpkqKlHZ7c709dJ+714cLnEjN+YE
         VHDEOhjTkUC6QzTdwBmdsGtGyj9ePMtrkBcsFxthxiGARmpkfqAeUD/W5sGTO6YJMBIF
         MriEvh8RQ30XZjFuFjlCneAtVtHK0bLEyy0ZJ2oBxmMuFwpnbuNiBuoqochu1j8cRTQu
         XOUPIWNvSN7J+/B2+/sKv5dkj7mUvCvMUVJ1C+nY35U5gJqSeV1Ep7OQH53KBg378V6d
         jt5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtzFPH9OXkmWVLdWkO81Hoep1rwesBuX1bEl56uO2k7W+cNEAYq0FhXHU6MX6NNW/Vd5d38nEnXDFbJXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzurQHP1LG1Z73SjicdMvlCxM3nhjXdCeFcVKlYeZo8Cp1jDa7u
	FqOimTYSxVbm2C89Zq6LNamtjGzIs4tUBDIR0vjyHebTLmVmpGg8vfsz8HCbJCynoTTfeT6YldF
	hoB0xM389cIXhPjbG3x5ojm+Vd4xd5wqRA7eka/orJCY+d5D3
X-Gm-Gg: ASbGncunwcmWIbrTIbfCajMfIeAPi19kS4zLkJt4V/qtRAG3mHjIfbDTPUIvZJg4l8t
	PyYcpL9aR14rZavcTGob9uOLrbRF1/CUh3Ay6y+myg08lgLtVarHS8VMQ0wUXBau2ZFuAljtnLY
	exFHgbK79gWZkH0AwxnfT7r6jHn8c=
X-Google-Smtp-Source: AGHT+IGzin6V0f0YGKy7Udk3aewjUGbBv6XmcP/DU6qB3LkeQJ2R2Z1zAebpSyapanvD2hTwAq7WiNaUzpcJ1/QKOno=
X-Received: by 2002:a05:6a00:853:b0:736:9fa2:bcbb with SMTP id
 d2e1a72fcca58-73980436cbamr19044549b3a.24.1743497982506; Tue, 01 Apr 2025
 01:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-2-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-2-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 09:59:31 +0100
X-Gm-Features: AQ5f1JpICOn046XWir454LuVhWbevJeRSx1F27tfX6sfrfiP5_Zt2Y4Br9MlhyM
Message-ID: <CAJ9a7Vi7kkjqfTWkY1-KP-HZUNG-25sPCZqDf2_n5i_OagEDGw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] coresight: etm4x: Extract the trace unit controlling
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 17:05, Leo Yan <leo.yan@arm.com> wrote:
>
> The trace unit is controlled in the ETM hardware enabling and disabling.
> The sequential changes for support AUX pause and resume will reuse the
> same operations.
>
> Extract the operations in the etm4_{enable|disable}_trace_unit()
> functions.  A minor improvement in etm4_enable_trace_unit() is for
> returning the timeout error to callers.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../coresight/coresight-etm4x-core.c          | 103 +++++++++++-------
>  1 file changed, 62 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..53cb0569dbbf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -431,6 +431,44 @@ static int etm4x_wait_status(struct csdev_access *csa, int pos, int val)
>         return coresight_timeout(csa, TRCSTATR, pos, val);
>  }
>
> +static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
> +{
> +       struct coresight_device *csdev = drvdata->csdev;
> +       struct device *etm_dev = &csdev->dev;
> +       struct csdev_access *csa = &csdev->access;
> +
> +       /*
> +        * ETE mandates that the TRCRSR is written to before
> +        * enabling it.
> +        */
> +       if (etm4x_is_ete(drvdata))
> +               etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> +
> +       etm4x_allow_trace(drvdata);
> +       /* Enable the trace unit */
> +       etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> +
> +       /* Synchronize the register updates for sysreg access */
> +       if (!csa->io_mem)
> +               isb();
> +
> +       /* wait for TRCSTATR.IDLE to go back down to '0' */
> +       if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0)) {
> +               dev_err(etm_dev,
> +                       "timeout while waiting for Idle Trace Status\n");
> +               return -ETIME;
> +       }
> +
> +       /*
> +        * As recommended by section 4.3.7 ("Synchronization when using the
> +        * memory-mapped interface") of ARM IHI 0064D
> +        */
> +       dsb(sy);
> +       isb();
> +
> +       return 0;
> +}
> +
>  static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  {
>         int i, rc;
> @@ -539,33 +577,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>                 etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
>         }
>
> -       /*
> -        * ETE mandates that the TRCRSR is written to before
> -        * enabling it.
> -        */
> -       if (etm4x_is_ete(drvdata))
> -               etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
> -
> -       etm4x_allow_trace(drvdata);
> -       /* Enable the trace unit */
> -       etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
> -
> -       /* Synchronize the register updates for sysreg access */
> -       if (!csa->io_mem)
> -               isb();
> -
> -       /* wait for TRCSTATR.IDLE to go back down to '0' */
> -       if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0))
> -               dev_err(etm_dev,
> -                       "timeout while waiting for Idle Trace Status\n");
> -
> -       /*
> -        * As recommended by section 4.3.7 ("Synchronization when using the
> -        * memory-mapped interface") of ARM IHI 0064D
> -        */
> -       dsb(sy);
> -       isb();
> -
> +       rc = etm4_enable_trace_unit(drvdata);
>  done:
>         etm4_cs_lock(drvdata, csa);
>
> @@ -884,25 +896,12 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>         return ret;
>  }
>
> -static void etm4_disable_hw(void *info)
> +static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>  {
>         u32 control;
> -       struct etmv4_drvdata *drvdata = info;
> -       struct etmv4_config *config = &drvdata->config;
>         struct coresight_device *csdev = drvdata->csdev;
>         struct device *etm_dev = &csdev->dev;
>         struct csdev_access *csa = &csdev->access;
> -       int i;
> -
> -       etm4_cs_unlock(drvdata, csa);
> -       etm4_disable_arch_specific(drvdata);
> -
> -       if (!drvdata->skip_power_up) {
> -               /* power can be removed from the trace unit now */
> -               control = etm4x_relaxed_read32(csa, TRCPDCR);
> -               control &= ~TRCPDCR_PU;
> -               etm4x_relaxed_write32(csa, control, TRCPDCR);
> -       }
>
>         control = etm4x_relaxed_read32(csa, TRCPRGCTLR);
>
> @@ -943,6 +942,28 @@ static void etm4_disable_hw(void *info)
>          * of ARM IHI 0064H.b.
>          */
>         isb();
> +}
> +
> +static void etm4_disable_hw(void *info)
> +{
> +       u32 control;
> +       struct etmv4_drvdata *drvdata = info;
> +       struct etmv4_config *config = &drvdata->config;
> +       struct coresight_device *csdev = drvdata->csdev;
> +       struct csdev_access *csa = &csdev->access;
> +       int i;
> +
> +       etm4_cs_unlock(drvdata, csa);
> +       etm4_disable_arch_specific(drvdata);
> +
> +       if (!drvdata->skip_power_up) {
> +               /* power can be removed from the trace unit now */
> +               control = etm4x_relaxed_read32(csa, TRCPDCR);
> +               control &= ~TRCPDCR_PU;
> +               etm4x_relaxed_write32(csa, control, TRCPDCR);
> +       }
> +
> +       etm4_disable_trace_unit(drvdata);
>
>         /* read the status of the single shot comparators */
>         for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike;leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
