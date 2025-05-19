Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB992750EB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656609; cv=none; b=nzqA2d6JvZ1l2zQNtic1BPW6GDsV6X2ARfdAVco0AkhUX/aZuJS/AmYQ1eDp6ls9KLjEiNYjhIOEWZdLFqACgGl0ANgTh6ZByysLWtU0+xcOMkx1eLRnVDv870CRpMjR9Bm2Aom3u32hSEgf65IrP8Ym51N0y5JzXQe93oVLLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656609; c=relaxed/simple;
	bh=x5MdkypAjAqC6VVdaSVvm9ZhVBug5otYm1hx1SGsbBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MrBBX1F1iy1u3T1oAV6RyDKRDQImHatuH2XFZUEe5z8GPb3yiHP+g/V4tVPogjiw5JqWoXcy6EVg/58TKD2NKx3R9mlPdFacbT6Rx88o64nSU46YyabgWi/cm696ODekAvTLLJ3FclXEYi+NOIvjyq1NJlB+3teI9pqdboMDnAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dKgPAbYx; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKgPAbYx"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7c5d4709caso780306276.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747656606; x=1748261406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ujcjzl2OsuY9ii/H7l8DqEgEiJqH4rk4ZJIB8igbgM=;
        b=dKgPAbYxMpPfPF5XbaZlJc1plGmb9UJ13h8aDCpjairyrABw3vm4yx/9feBhFwtCic
         Z13oUG0vvCkCPfLRMj3c4deDiwPDvgKn/oFrISkFXM7EmdI44btu3R/jPR92Udh48sHP
         1CbrwAvki+LpIZsyZYkj5ScY/eQLvyzyoTSJN8s8NBlXv3wTUERfj8Quzr/fUXoOvXSo
         /9+ePd/I+a/7MR9tJrDDAUXtT98rlkFj+U1I7qn6NT/0MmXRQaXaTDlDGr09jEMR3Y5b
         U15UHjT/1HYn5iWXdSlWMUiXSxC7rxbno8yUHn/WiKNEt2Ai/R/RzxfQ/KXgwRkDFpEJ
         QIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747656606; x=1748261406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ujcjzl2OsuY9ii/H7l8DqEgEiJqH4rk4ZJIB8igbgM=;
        b=qFCYPaLCkSRqmxpxqt2Gfrtp++QhG0SlN0WCEYoe4dmS4ipQiCQXRve2Y3K34tYWnN
         keoFhoy2zD3D2grE2CES0Olipy5RfOTCme/5St7jh2PTNJC57JQR6ILCKiKNSJsLt9M/
         bYimrE7KS689OdjkD2X+LrWhs8N7RqaCUv0Y+LevQixRX5cCrqohuBovbg9M8Hu1/Gmq
         y1I319QfkJlP5aXAsFqP3IK09TVuyLhlhR2P0CTHN4rCwPGWfQ5YJvCLKtLVJZJeEOei
         vtvlG+KUqRc5Mj+NAydOlwoDpDMDKLf41Mu9JwQ8LLlBxP6beWvlzRqN6vudnZJ/3MM3
         ewtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsQva+spO9Kva1gMstt5qa/JL9f8g97zAfm7lhrRiGFlRE0uhxOsxlUi3XNsfBCvKGmvdTQkWAW7KmQgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YykOY83ub42PFYxrjmlkDVFA0Jy58AjJji+eMo7QBybTs1xOu8N
	I9SXj8s5xGKdhF0OgqC0ad8Fznh/5+w+b9MpkxwSlO+6rwNYHvWtO/mGAtIO6PLyNVuKVZiZWXD
	SDTU09CAUkPrWfNq6OWQvrPui08rb66mCYNBIJ29K3A==
X-Gm-Gg: ASbGncuJ/2/9AYMVKdVx1nxN4Fz2tqC9IS0T1yRIM25t0/80ardyAUq3s5iL9MD54FP
	M9hvVF5XvMdf5eDBswejYoqduv112WTQPPEa9Kk/Kk7zPMU2krI2x/JKj2xfHWrtdlRFXv3yQ6+
	M6dh7lweQO23qQalKmLz9pM1ypLSt/g1uToF5poLfiPzhv
X-Google-Smtp-Source: AGHT+IEOp/4OAlCuuRfUfbvowUG/jmX/8U9R9YSNLFHxK1XdonfCvP/aN1Pa67AHy8pc66Zut/uLaetRuELGnBxAxw4=
X-Received: by 2002:a05:6902:1a41:b0:e7b:9525:292c with SMTP id
 3f1490d57ef6-e7b95252a90mr7684525276.32.1747656605714; Mon, 19 May 2025
 05:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516092716.3918-1-victorshihgli@gmail.com> <20250516092716.3918-2-victorshihgli@gmail.com>
In-Reply-To: <20250516092716.3918-2-victorshihgli@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 14:09:29 +0200
X-Gm-Features: AX0GCFsKEuxWZEXyX5oP7nQDpYMiMx4_qRZXMZhQ_k_JThJteCMW8xB2bXrBelM
Message-ID: <CAPDyKFrKRw2kOQ9Gq=eCmm0N24hSEamNeCWGzC6X-Qg33ad-gw@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] mmc: core: Adjust some error messages for SD
 UHS-II cards
To: Victor Shih <victorshihgli@gmail.com>
Cc: adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, benchuanggli@gmail.com, 
	HL.Liu@genesyslogic.com.tw, Greg.tu@genesyslogic.com.tw, 
	Ben Chuang <ben.chuang@genesyslogic.com.tw>, 
	Victor Shih <victor.shih@genesyslogic.com.tw>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 May 2025 at 11:27, Victor Shih <victorshihgli@gmail.com> wrote:
>
> From: Victor Shih <victor.shih@genesyslogic.com.tw>
>
> Adjust some error messages to debug mode to avoid causing
> misunderstanding it is an error.
>
> Signed-off-by: Ben Chuang <ben.chuang@genesyslogic.com.tw>
> Signed-off-by: Victor Shih <victor.shih@genesyslogic.com.tw>
> ---
>  drivers/mmc/core/sd_uhs2.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/sd_uhs2.c b/drivers/mmc/core/sd_uhs2.c
> index 1c31d0dfa961..58c4cef37f7c 100644
> --- a/drivers/mmc/core/sd_uhs2.c
> +++ b/drivers/mmc/core/sd_uhs2.c
> @@ -36,6 +36,10 @@
>  #include "sd_ops.h"
>  #include "mmc_ops.h"
>
> +#define DRIVER_NAME "sd_uhs2"
> +#define DBG(f, x...) \
> +       pr_debug(DRIVER_NAME " [%s()]: " f, __func__, ## x)
> +

We don't need a macro for this, just use a pr_debug() below instead.

>  #define UHS2_WAIT_CFG_COMPLETE_PERIOD_US  (1 * 1000)
>  #define UHS2_WAIT_CFG_COMPLETE_TIMEOUT_MS 100
>
> @@ -91,8 +95,8 @@ static int sd_uhs2_phy_init(struct mmc_host *host)
>
>         err = host->ops->uhs2_control(host, UHS2_PHY_INIT);
>         if (err) {
> -               pr_err("%s: failed to initial phy for UHS-II!\n",
> -                      mmc_hostname(host));
> +               DBG("%s: failed to initial phy for UHS-II!\n",
> +                   mmc_hostname(host));
>         }
>
>         return err;
> --
> 2.43.0
>

Kind regards
Uffe
