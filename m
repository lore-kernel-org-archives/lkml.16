Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8832205E36
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591500; cv=none; b=Zo9fudNQ5yylztRhZCngQh2BwFUFU5unjU995IGCC1JbDxVQnOihHJPn55sFeQt2iATXlHXO2n8ew1q0CZqFBozGTeYCN6ZaDb0F/TNR/zBfVGj1k5v9dgdWNYZIP+eyHufL/7rqQ4HY5DZnBXfl/+Jxvn5nHBa2U9jkbd9684Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591500; c=relaxed/simple;
	bh=h6CWMX42b1q0GMAh+1qfTza+9TeJXgXvTvyYsur+MFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmyGgUjKw3GAUcJkIl9UvYma2mNf2H1JVFgHKGG9PQgNLfqjMpmffHlpl8SJkGQOXg6U1k+TT1EvIHaY8qU4DmMMOd9Pz/WdSW7n0WWoH0s6031C782I6TEfH9x02gNKOIMbZFhsz/WoqfeR8UZ3PZIN8idVUw6tOKZ6wEGZMAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgH9fUT8; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgH9fUT8"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so4246472276.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591498; x=1739196298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Am0X09ccYm4uqIChn1Tko10AiRMYHlGQ0TVf8PEtNTc=;
        b=xgH9fUT8Fhyqs33rXJPnM7kQtTG8sD0cOoKdXbMEmMeAXCVnJkk/G0Pu4Tjqm24PJs
         Hbf/gj4SU+g/aSoIZlkcgXj23LqnkOvhwJNfCsGIfEH9dF5PqcS/Ko7uWm4VZRPxHBqr
         vE0u29JPcAu5ShbD8HGclA2DK81aM89pOHrFOQALnevWYVW/7j48mjpB/HyKmR2rZ98H
         ED55JipYAnNpTuzcnmHAezlirgctBqxLPfOvWMPEApdbw1WVADIcQn/ogkVq1OamjSLr
         CJ78KqyE8XPKUrJZmhp3w/F0EM3BGMa3jT8d+Cu1jeYt24ASBbNFTbt/rvw0j1BLU7Kw
         7FLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591498; x=1739196298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Am0X09ccYm4uqIChn1Tko10AiRMYHlGQ0TVf8PEtNTc=;
        b=Iz6r4l5v72fMO017tNAkkUaV4ZilvQqGNjR1MCr1YnNAiGmPjoWl2YnIeYjjVcJ9d9
         S5F3VJKCr759zNgW+c5TKhD5JdIqYNpIGUDk15JzvjrQTvo77FKKHkSV1iI24fTbOU4/
         O9vFeiHtPyFMbJ5qwwIfJDU5zUFj7EtttQtlz372ZkW/rVkI4GD4kILMN5mlwJ9kFfNW
         ZC2q8w1Jq0KVeQSqNbinIIVOZmgr/Sv6L+9fQNLtLqs7I5eZKwVMsJ/LlIwQVcK6PWdZ
         vaB5cGDOXNo55UFGvZrP5uDDDOOjK/5gQ4aG3gcY6G7I7fk/zIiKhRhYed/oszKdIKCi
         Pi+w==
X-Forwarded-Encrypted: i=1; AJvYcCVft/9tL8uNHzFJs4qk/Ju1mQJTeMh3sXATVuwP9VT8S8JsAJ2E0xskTMBsjlFC9CgHLSQlPnOQIe4GAtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIJG4Yg7+0TOY9in8xuM6Np7P0nwn6g78+GvbWDpRXb4wmXZs
	My2CSfrTpZ7TTr1RtSxDtndkolRMT31xCdhNSsY/ofk9Od5VuSgqEXoxiXrak6GXiGxfSvZmHXn
	VMVh6PWbs5qJyQSPCwmNdfmEA+hxEZFtGW694lP9EiBbnVbgj
X-Gm-Gg: ASbGncvkdRGzEgZiy5ASRoo+Vb4o0q1YDMds7LBIMq8Eb96j291Gavfp0XcsG2KOFxD
	Qg5kMZRkx8k/qlMohL/VTfYkIGlA4pyPtfk5Mki89KFjRnZ0KBz8LkstBk9FW/hmx+afwZlBByQ
	==
X-Google-Smtp-Source: AGHT+IFwnbzyrxEukfl9ktPOhFtVST3/FONPbZt9n/IsJ/BCI9rREcADlK7HneW2NrgAPdGw7ypRtb7SFs72hQbzEUU=
X-Received: by 2002:a05:6902:2006:b0:e5b:111b:a8d7 with SMTP id
 3f1490d57ef6-e5b111ba9abmr284291276.41.1738591497654; Mon, 03 Feb 2025
 06:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129214335.125292-1-linux@treblig.org>
In-Reply-To: <20250129214335.125292-1-linux@treblig.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 3 Feb 2025 15:04:21 +0100
X-Gm-Features: AWEUYZmZikQz2CrmOrzRKi5yrRTvk_iJYC_EFEjQ29bDOeCh_i1eh4bHMrvn-Yc
Message-ID: <CAPDyKFobzCJTaHV6rXwTr-hhzKgN7fAuiUQXjG20pRmBq5wsgg@mail.gmail.com>
Subject: Re: [PATCH] mmc: slot-gpio: Remove unused mmc_gpio_set_cd_isr
To: linux@treblig.org
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2025 at 22:43, <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> mmc_gpio_set_cd_isr() last use was removed in 2018 by
> commit 7838a8ddc80b ("mmc: omap_hsmmc: Kill off cover detection")
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/slot-gpio.c  | 12 ------------
>  include/linux/mmc/slot-gpio.h |  1 -
>  2 files changed, 13 deletions(-)
>
> diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
> index 12247219e1c2..5fd455816393 100644
> --- a/drivers/mmc/core/slot-gpio.c
> +++ b/drivers/mmc/core/slot-gpio.c
> @@ -159,18 +159,6 @@ int mmc_gpio_set_cd_wake(struct mmc_host *host, bool on)
>  }
>  EXPORT_SYMBOL(mmc_gpio_set_cd_wake);
>
> -/* Register an alternate interrupt service routine for
> - * the card-detect GPIO.
> - */
> -void mmc_gpio_set_cd_isr(struct mmc_host *host, irq_handler_t isr)
> -{
> -       struct mmc_gpio *ctx = host->slot.handler_priv;
> -
> -       WARN_ON(ctx->cd_gpio_isr);
> -       ctx->cd_gpio_isr = isr;
> -}
> -EXPORT_SYMBOL(mmc_gpio_set_cd_isr);
> -
>  /**
>   * mmc_gpiod_request_cd - request a gpio descriptor for card-detection
>   * @host: mmc host
> diff --git a/include/linux/mmc/slot-gpio.h b/include/linux/mmc/slot-gpio.h
> index 274a2767ea49..1ed7b0d1e4f9 100644
> --- a/include/linux/mmc/slot-gpio.h
> +++ b/include/linux/mmc/slot-gpio.h
> @@ -22,7 +22,6 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
>  int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
>                          unsigned int idx, unsigned int debounce);
>  int mmc_gpiod_set_cd_config(struct mmc_host *host, unsigned long config);
> -void mmc_gpio_set_cd_isr(struct mmc_host *host, irq_handler_t isr);
>  int mmc_gpio_set_cd_wake(struct mmc_host *host, bool on);
>  void mmc_gpiod_request_cd_irq(struct mmc_host *host);
>  bool mmc_can_gpio_cd(struct mmc_host *host);
> --
> 2.48.1
>
