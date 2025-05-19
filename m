Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1382227877E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657938; cv=none; b=jO0AgCH47ODSR9s3RIZEF66ral0ffmBEj7gvfWrf0uYImnlwIO7PybWD59AWIr9hiTX33xZiDeVBQ3OrYZy6eyT8s3KlCmMym0tbcbOmWdW13eXtcKXSsyLB9XXN/oPaBdStkUPuy6hUFT94B1hbuh/eo+uDBTeJR7PB51lzFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657938; c=relaxed/simple;
	bh=6b8ZPtV5F994PMuvcCSu5RtuqE+uyQUk2qhJt6Rgzwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6ynbke6I9PM3tZQ+QgSuOIAhsBSGrniqGYeHMg8+oDd45qpeeNHuZ+2hOpxInAc9twpDZIcdqS1j5NCpTM3Sxpw5FPXhR9KxbTq0LwDBEple0ojLMNwLi6XaSM0Gq5CT9zoI/RD7pa5l8sqcnSdckJ9+mTyy05oFHyirbva6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdTnRvyJ; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdTnRvyJ"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso4089289276.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747657936; x=1748262736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rwPC3/sUg5alnk+vPawV+VRfKcVYwDAJB/XEbxtpgV8=;
        b=RdTnRvyJRPZ502PFl5HL6d/UU9+p//wsXFqMbbZ9q5ddnWho3fT5soQ9FnPSj9mwJY
         DGG8D1gkmMz4l7RO1KPRpxJSZnjsIJqFRMz2j9CzDyDLdF9hJ/gXWYLDA5JZMcAC3ZKX
         b9SZdelV0biPugAkmcqK9wamllKQoW9u4cAKEDGGhmWNtxq/mbHHW3IhJJMr53CE2mOU
         XCoPmX27cslnFA93SClB9OnEtOKRGSF6KyXeJGQLQH8OESMS38L46R4HRN1/9Kdl6kzm
         n6xtNQsX7gf06fE76LCAGMG1DZJVDcFdWlf+KjtnouqTDbDTUZaxV25PyPaOz/ona2oL
         ONrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657936; x=1748262736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwPC3/sUg5alnk+vPawV+VRfKcVYwDAJB/XEbxtpgV8=;
        b=Vnu0sv0tHdZewuwxH7dLnSmvxclaJM9eZNfr9X3PBaqW+Nmc0TaNVpyGMxFXuZcKJf
         j1pcc708bjFtBYmx1KvcmHnjYSW/uUqcD3xkWCS1FezgstRJjSHRLxVsz9OeqA2tdeAQ
         cUL3eFeeKjNm5alddlt+T9itWazqEDCrfWJ50OQnNZS8Msj60rLmPWoG+QcQ0d4r2ka6
         DlT6FSHJCe/LaXj+3G187w2DWVNgJuNuCHIboX9r4H/x0sgyvNojXSQyvogZlmbiVjHT
         Rw4OpwQ4xR3S6wR6ds/E1PzhB6dDjGXsMe05IrwkY6SGWacp9Boy0RJSaBB3LKUu5xiR
         DTDg==
X-Forwarded-Encrypted: i=1; AJvYcCXENNQxlvkJDTVQYDrKvY+D7EmVYuIGnVAn4y/cBVRfod4YYeBFsyrRkgSZEeiHrgZwtFImpwEBbt19f/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDWCmzkXBWRbk2Yg1syQMYbCW47sblaYXbVDL08dSMaWiAZ/K
	VoatAT+irClHw86aaCjSlqhBMJIGOxcuI0b4IsmQXBosm41cKQp6W28BGGBzD1lJxXt7eAHIieW
	oon9J0sWP5mPGXn5Gw7kNeFJ0Dq6ycZYj/A8zQ5LFNQ==
X-Gm-Gg: ASbGncuOaQubWPwuCpsL3c92Yvt6ZKUR/2qnURkEZHim5JjRqOxz8eeRRAqksIR8kFV
	KlEY1j6NwqLiBP3iLFFlOVjpwBOXuaL6DxYf5EctXrGHzu49xEw8yPjxcUEni7D4sbvCqNZlX+/
	rW6oLM9jEatxbARwxOwQQHVdGwgi0cB7aK7g==
X-Google-Smtp-Source: AGHT+IH+k05RenNE75G05lCkPIFd12fSQl1b4MXO59HUeKq46kiZr+jpNbTHEmQSsew+3IME0NcG8hlXcQsODDtf+tw=
X-Received: by 2002:a05:6902:110f:b0:e7b:94da:55dc with SMTP id
 3f1490d57ef6-e7b94da571amr8538048276.13.1747657935953; Mon, 19 May 2025
 05:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515204201502Kzmj4I6k5Fv2FjqyEjF6n@zte.com.cn>
In-Reply-To: <20250515204201502Kzmj4I6k5Fv2FjqyEjF6n@zte.com.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 14:31:40 +0200
X-Gm-Features: AX0GCFtXdhUci2gSte12YEy9YP5JWc22zhs6HMihigJb0b76jaF6NMhMse_Mf_o
Message-ID: <CAPDyKFrheefitHyBMz11pcUMi=cz_-nLzG9zY9cbYyZfjsQAKg@mail.gmail.com>
Subject: Re: [PATCH] mmc: bcm2835: Use str_read_write() helper
To: long.yunjian@zte.com.cn
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	rjui@broadcom.com, sbranden@broadcom.com, wahrenst@gmx.net, 
	u.kleine-koenig@baylibre.com, fang.yumeng@zte.com.cn, 
	linux-mmc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ouyang.maochun@zte.com.cn, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 14:42, <long.yunjian@zte.com.cn> wrote:
>
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>
> Remove hard-coded strings by using the str_read_write() helper.
>
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/bcm2835.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index e5f151d092cd..def054ddd256 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -44,6 +44,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/time.h>
>  #include <linux/workqueue.h>
> +#include <linux/string_choices.h>
>
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/mmc.h>
> @@ -391,8 +392,7 @@ static void bcm2835_transfer_block_pio(struct bcm2835_host *host, bool is_read)
>
>                                 if (time_after(jiffies, wait_max)) {
>                                         dev_err(dev, "PIO %s timeout - EDM %08x\n",
> -                                               is_read ? "read" : "write",
> -                                               edm);
> +                                               str_read_write(is_read), edm);
>                                         hsts = SDHSTS_REW_TIME_OUT;
>                                         break;
>                                 }
> @@ -435,12 +435,12 @@ static void bcm2835_transfer_pio(struct bcm2835_host *host)
>                       SDHSTS_CRC7_ERROR |
>                       SDHSTS_FIFO_ERROR)) {
>                 dev_err(dev, "%s transfer error - HSTS %08x\n",
> -                       is_read ? "read" : "write", sdhsts);
> +                       str_read_write(is_read), sdhsts);
>                 host->data->error = -EILSEQ;
>         } else if ((sdhsts & (SDHSTS_CMD_TIME_OUT |
>                               SDHSTS_REW_TIME_OUT))) {
>                 dev_err(dev, "%s timeout error - HSTS %08x\n",
> -                       is_read ? "read" : "write", sdhsts);
> +                       str_read_write(is_read), sdhsts);
>                 host->data->error = -ETIMEDOUT;
>         }
>  }
> --
> 2.25.1
