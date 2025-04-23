Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A74D1A3161
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416593; cv=none; b=LQYFUs44oeWyLoWkWigLoEFhlR7ro+ymMqxJxV0Swl3iEGpDOoAQuVnamC5oVdvnPP20f6HSSQ3FUwhtoFEM25W4mppdgFbft9R77SB2U88nAkG2OW6jmEYBa68Mf/MbvVPK57cbzKQ2wxpFTy4RrblsmE/MaO/K2aRUtj1S9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416593; c=relaxed/simple;
	bh=jk+TchufJ868NtNLS+22SM8xBonG6c4aHaCettsNZSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0e2ikBp2AKld0AI4hWlNY4CSf2JB9CkS9mwa21grgBu2WbYAqFCNVm6O7eqvzTtuRDhwhlt2vET1PYuimxLun3J5slOFwifuoeLqdvGPcToOMbFo+82nPRO/EzLAS2a3kIo3FgtG4iU7SmU9hC9cd+xBF6oOddrt9WQvK/WLV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4NU7iOJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4NU7iOJ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso8021103b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745416590; x=1746021390; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AfFYosDpWgtYqX+IBcKx3G6NRXK+h00Dluuphe8bpkw=;
        b=j4NU7iOJHEyGfG0/SmUt3zIKNyeusmIGLC6joJyRMq0MuVqzirYuHEoFhuoR3YOh/d
         pUa9zgHEx9g3e0QaU1Q1hjax4VfrxzERVK/5DuxYaYD3Z9gTwfMwyv5Qd10DSgPFt5UQ
         4GXAvotT9lNYIiD3b9dKKhniBAJWRXRU2uXBT1cDbMQkiTiwC6AUvlLVJR5VoucT9vXL
         /Gv8lfdeZ7hpUyNXFYfwSfmxa0NIzJzg+s9H6Lq5hZCM2WXkn3YcHTEr6KDFtCAfehx6
         PX2HmmEZO2E98vNbnqyd1xWWPuqdWgi+RChHM1vaGXIntX7+AWVpd0UUFLveChPhEMFI
         0Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416590; x=1746021390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfFYosDpWgtYqX+IBcKx3G6NRXK+h00Dluuphe8bpkw=;
        b=HwBo901yzPCyaaYGL0sc10qhngu1Kc1cTcGQfPL9X5f1zUednuKkhLrtl5v0LZ3x8N
         ZgB1t4lQz7qKMboyMOZuI9TDhqI3mhG0AIa/tKTOmpIWD79k2afNuUitjkgD7iFjXzun
         bxKzi2ugGH6tl29jpITORhAMpWthfftk5YAgW83NLa8P+7B8OLWpkMd1uG7cJygs40Wg
         3kK1YeM3H5cZC+mX7z+7gaib0939qHG4SvJW6hDU/mdMRfNgqX8/7lNNRuyRcd8wKap6
         oJkSPdE5nJMOJPqFXlsJb0Tl3USnLo6lP8fldXuqUL3w4tCesGr5JqrUwKItTtVASpmk
         omlw==
X-Forwarded-Encrypted: i=1; AJvYcCVCbzhSbayHzqqE//HXIKu+4GwXz1X50ruooc9bxEUlkeSRmWy2hAcYQYDS/X6c7ErpxHRsXtzp5DMAFzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiRhIxdMHh0J41HPt0pi/jhOReYtgxLf/WjOefiHVcXGCsMfNL
	ihuP/YZgFFOhxYDz/9uSfOZiZK5Stl+VBZN5MwcSb3HqvHEAg4+lCcL/6MXJmYZc0AGZN+CqYEj
	izG+r5h4SaufTUebZrYr1Kgy8Dr9HKVtVuIhAoQ==
X-Gm-Gg: ASbGncuviMYabA0EBRJzmXlYaFWO9ph6FgDFkBrIeuy8cSzKZyEPY1rVjUibGQwQmEn
	ISUZFRxDOSGsS99nCOr+UHYKMjroIcRleEWmgWDprWOlmfj48Mr6/0areepPMtdpFC4pZeF9+E/
	XNdKhtoqQCP40sxH7uGKQrSTQ=
X-Google-Smtp-Source: AGHT+IEZEwAAL6Mzvuw66yRR76sgj8VMBU2yaInPUBYU8I3B/gwzxM8RhzYuE2b5vDzjHBe3JxDUibZDnvfCuYcJvbc=
X-Received: by 2002:a05:6a00:35cd:b0:736:a8db:93b8 with SMTP id
 d2e1a72fcca58-73dc14443dcmr27340760b3a.3.1745416590619; Wed, 23 Apr 2025
 06:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423103744.475-1-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250423103744.475-1-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 23 Apr 2025 14:56:18 +0100
X-Gm-Features: ATxdqUHZer5iq5su-vp4Gz2VbQzHeqDcBbOIkqfEaFQjhoASLp3Hn8QLjnpu60s
Message-ID: <CAJ9a7Vi9sZBMfkwp445im8fbjeEZOB5_8saTsXhYj3aoRRPdFw@mail.gmail.com>
Subject: Re: [PATCH] coresight: tmc: fix failure to disable/enable ETF after reading
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 23 Apr 2025 at 11:37, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> From: Mao Jinlong <quic_jinlmao@quicinc.com>
>
> From: Mao Jinlong <quic_jinlmao@quicinc.com>
>

What are these extra email addresses for?

> ETF may fail to re-enable after reading, and driver->reading will
> not be set to false, this will cause failure to enable/disable to ETF.
> This change set driver->reading to false even if re-enabling fail.
>
> Fixes: 669c4614236a7 ("coresight: tmc: Don't enable TMC when it's not ready.")

This SHA and message appear not be present in any upstream / coresight branch.

> Co-developed-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d858740001c2..8c9f14e36bc2 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -87,6 +87,12 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>  {
>         CS_UNLOCK(drvdata->base);
>
> +       /* Check if the etf already disabled*/
> +       if (!(readl_relaxed(drvdata->base + TMC_CTL) & TMC_CTL_CAPT_EN)) {
> +               CS_LOCK(drvdata->base);
> +               return;
> +       }
> +

What does this have to do with the stated function of the patch - this
is unnecessary.
Under what scenario can this function be called with the ETB
previously disabled?

>         tmc_flush_and_stop(drvdata);
>         /*
>          * When operating in sysFS mode the content of the buffer needs to be
> @@ -747,7 +753,6 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>         char *buf = NULL;
>         enum tmc_mode mode;
>         unsigned long flags;
> -       int rc = 0;
>
>         /* config types are set a boot time and never change */
>         if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
> @@ -773,11 +778,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>                  * can't be NULL.
>                  */
>                 memset(drvdata->buf, 0, drvdata->size);
> -               rc = __tmc_etb_enable_hw(drvdata);
> -               if (rc) {
> -                       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> -                       return rc;
> -               }
> +               __tmc_etb_enable_hw(drvdata);

Dropping a valid error check is not acceptable. If a TMC cannot be
re-enabled, then that is a hardware error that needs noting and
dealing with.

Regards

Mike

>         } else {
>                 /*
>                  * The ETB/ETF is not tracing and the buffer was just read.
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
