Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA50D1372
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291313; cv=none; b=i52y6/PbWr+nhL/FpqTvD9lb26h1Z4/ExyvbpG2yPfZcxq1yb/Wvwd6iPjZEhoVA4Lp4B47q2gamuO/S3vnXgtSZ5nNREgT8qQDmtmUPYDK/L0hp2GIUHBZpfUlItixthZHICtT01gY0/t4hOoiLEkojRY5Q1599WT/N76h1PSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291313; c=relaxed/simple;
	bh=ogTvjHX1p157xvYG9ocJpAirXQE+XgMwDKIwl3lLYks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhdpzaJnJ1O7xofwAgBdyIl7efZlIezmuBK8dBxJj5WEq/qFgrQd8xi3swzyy3b2l0WHEEaCnKAfLwbw7oBjkNXWZi7YZKfQOGBi+UEKzc9VFl5LzGB15cK3RqJ8bgjWpfJtO6oHL262Wb6A9l6/swEKIwqh0/+9BRqglodz97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qSMQ3goO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSMQ3goO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7370a2d1981so555971b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744291310; x=1744896110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wMQZClxt/r11IMD+9AiWAlz3lBENpTb7OT4Ug6+9SZk=;
        b=qSMQ3goOp7JzS4TECw9V0iq98Xy2uEKj9uSA5vdxcpdm9O3RuygoRpY6r61t8Y4v3O
         iVDa4BJg7MvEvaM1SwuIOkk0qUNacCIYp7lXl+VRipAgts93+h7KLggkhwSjBPckb1X1
         Qx5znPLGIFHMqWZOHQpdw3Z58LWdEX40LwZ9rqiHVHaxutcOedh/2N0EwnM98ktuCHD3
         CUBvPqx8PsQj2KluAWyFTWLsassXw/oBNYK1xorRzd9Umw0PIE6Mg25KUV0cElc1RAGq
         bYqQ74DX+AAPNYje0j/3qTLRdcUtUpvcGgh8lM8VQ5d6QPKTfNau2R8qBy2GaY/R7Rtm
         Jpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744291310; x=1744896110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMQZClxt/r11IMD+9AiWAlz3lBENpTb7OT4Ug6+9SZk=;
        b=XI5FWcyscsVdvmGsntHk+Q/76wxRBPjROo0w5LCMy6xsfZweykwj3PO4L54RkfEitD
         fcNdPDkW8mAIVAsUC5SJ49vI++Mx3JqzJP/+suAK5l3KPzMIVRfaVeK/tuikPTdNZNuU
         l/8uAJ5/gm5vRa4BaRtFCgBQ2z2jl6+hZa5vsPvqWDLtv4ospetFkjFw2t4xe52knwBr
         9ml4r2P4V3lVYRF+n6o6fQv+At+WAd+QS7BorucK1EYQHh1GP9TBa84BFMfpek5Ph2PQ
         g/8z3bRmkEoRHavK45nebnYFKFYzPkuuL0uwGICRd5Ws+9SUhONDYCaynAHYAvAIqepN
         LOtA==
X-Forwarded-Encrypted: i=1; AJvYcCW6jjeS4ow+ib9adb+5V9++YQYKZmU425B+/VXc5/PaY+gHAXxooM9+PBL7kLSdQDN2o8m2fiWBKAHPJaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRrpxL0Ce0oQzFBnPd6iwQiO7U0hPSr6KlS7soaA0oBx7JVJC/
	5Ap0XXNPIFxPj7/oVgzpSf0sCAqAeMikaE64mLwLvNewmW4JSzdrO16LMvPk7N63wH8e/6KSMqW
	3DImufJR050EyMtlJHEs4Xn6H8ADyoa2YlXeE/g==
X-Gm-Gg: ASbGnctNTRnBaAQ1ckUR3Mk718tBPXMEMOWoNKf+OlJVugeuxZpX2xSdm/Kg1DD+SLO
	UyKTLfOGdgxzO8/mwE898iUjov0S1EG3uve16j9cTA0G4WzgF6XvlYWaa1VR4qewhMtwerNcayw
	3Y0NrsIOKJEu82gmrT+UpYD08=
X-Google-Smtp-Source: AGHT+IEL3aq17l9YVyu03lvnUk5C6k7qYVWUuIutjM7+77MtfedWhhLez/73fsO+lOMiT2oK1ZOolvmazkYHCs2MYjA=
X-Received: by 2002:a05:6a20:d48d:b0:1fe:90c5:7ceb with SMTP id
 adf61e73a8af0-201695d9c45mr5523489637.40.1744291310083; Thu, 10 Apr 2025
 06:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409032917.7580-1-yiru.zhang@mediatek.com> <20250410095158.8966-1-yiru.zhang@mediatek.com>
In-Reply-To: <20250410095158.8966-1-yiru.zhang@mediatek.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 10 Apr 2025 14:21:39 +0100
X-Gm-Features: ATxdqUF3Uhi02-Atot1ZYsCo3BPZFPm0ByTzdzbrh7QkbsgdDvRRnbSTXsdXDf4
Message-ID: <CAJ9a7Vjr+O7wueNc1kmFt-Up2qzFXcSabgoBeb5e+rW8Z3_3Qw@mail.gmail.com>
Subject: Re: [PATCH] [Patch v3]Add ETE devarch condition in etm4_init_iomem_access
To: yiru zhang <yiru.zhang@mediatek.com>
Cc: alexander.shishkin@linux.intel.com, 
	angelogioacchino.delregno@collabora.com, coresight@lists.linaro.org, 
	james.clark@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, suzuki.poulose@arm.com, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Please stop using the unusual title format of [PATCH}[Patch v3] - use
the git command line options to ensure the format is e.g. [PATCH v3]

What is the reason that your device cannot use the system instructions
to access the ETE? Using a memory interface, if implemented, is only
recommended for external debuggers, or on systems where the
implementation of system register access is not working.

On Thu, 10 Apr 2025 at 10:52, yiru zhang <yiru.zhang@mediatek.com> wrote:
>
> Due to ETE supported, so add ETE devarch condition in etm4_init_iomem_access.
>
> Signed-off-by: yiru zhang <yiru.zhang@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504101759.7Ls0Uy4o-lkp@intel.com/
>
> v1->v2: use switch case way
> v2->v3: clean build warning
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2b8f10463840..4002a2823fd0 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1135,11 +1135,15 @@ static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
>          * with MMIO. But we cannot touch the OSLK until we are
>          * sure this is an ETM. So rely only on the TRCDEVARCH.
>          */
> -       if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH) {
> -               pr_warn_once("TRCDEVARCH doesn't match ETMv4 architecture\n");
> +       switch (devarch & ETM_DEVARCH_ID_MASK) {
> +       case ETM_DEVARCH_ETMv4x_ARCH:
> +       case ETM_DEVARCH_ETE_ARCH:
> +               break;
> +       default:
> +               pr_warn_once("Unknown ETM architecture: 0x%lx\n",
> +                            devarch & ETM_DEVARCH_ID_MASK);
>                 return false;
>         }
> -
>         drvdata->arch = etm_devarch_to_arch(devarch);
>         *csa = CSDEV_ACCESS_IOMEM(drvdata->base);
>         return true;
> --
> 2.46.0
>

Otherwise -

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
