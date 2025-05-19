Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180E274FFA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657943; cv=none; b=bZwMSSFQ/EIccJ+eNASHI8BUH2VexzBPZmwt/P4SAWI7QCkcPrL2BGJUyng7nP3Tq17lcwNMOj75ufuS/07jf3iH2aqTTw6pEsfr1g6WogTWGpfU3r/wAdO36wX06HqHsNZ3Trv1MTzFGjImxgxEOzUSWwQBuii9i/u11WU4QZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657943; c=relaxed/simple;
	bh=yJmJBDqZKvDuVrVsQTB7p+hv1xxsfW41J0kmo5sfZwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=We3KrIl8W6yiP5csJxWZT0H+6pZ8/tOKOZpO7tInhCVq+5Fx+YcZ6YOe6R7n7Fl9Qm+7NaSj8znzT5EOw6trfMR7ZVhHRRUuV0igptigkYztb2z+BLDdU1ub0kHf4Qp/cYik3W3ao+xu2ubRW1PmeX94ONXFOrI5HuYRMP6BOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dX0dEEfL; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dX0dEEfL"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e733a6ff491so3927436276.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747657941; x=1748262741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHsufu+SF6+BkfAoJdbGGEtsqtE+xN15rWNgtA6qUrk=;
        b=dX0dEEfL8+/Zke7XLR3A1vpOdD8VXakOBGZsEawh/ukpJAYXVvLqlxbIfDr2/SxcvK
         gAc8AEqTd1yuzZ0KHrF8hvUVAHrOtvbOMi/nHuWTDsuJ6vqjAe9MXUj5uQRXLwN71RHc
         mqv/c9mg36/HcuZdL7wgWW2SfH3vJhAcB5T5Zz3QEXw1nZFhczHl9sBcmUYZOIGynMiE
         +RAlGt6Vom6X8fVjC1DhYUgP9zZc4mQ9/Y6Wz+kQQ9QrEmiaWUy+IGuLeVUiWhOXQzAC
         9gm4FfL1lR6T371ZC5xuVBQLB7BGd+kENa/RngcriSBwQqP16gR74OThZn2mtAiuRupi
         9bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657941; x=1748262741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHsufu+SF6+BkfAoJdbGGEtsqtE+xN15rWNgtA6qUrk=;
        b=MBp0kNfu32WC9TYWJF7BYBn9qNeLJ9CfWHByP++2iYX+x6DqJEitPpm5GE2OEZ5Rnn
         sMWmbP304tcqqNq1prusQYPitACY0zv2Db0UJCtWdtl+/ESrXjf2E7m/4uHxzgjiWBBv
         5YPDWXkxDtL2ypNJV2Tf1qKnQk5yvghPcRcjD9GpzVcUW/uJb/ma/WPY9EWnpxoFKVRT
         bjK/ulIrFg9jYFRRJJGXwnBxo1WLNwGlIKHbySBxCyo3hfe5BuMkz5j3fDE6Lq7WlG0G
         /WGoAV3fO+GOBdSJeOC7TalvzWsK99eNQ1WhxgXxBmSDuy7r5/iPi10JQ94+1cQoM37X
         a7CA==
X-Forwarded-Encrypted: i=1; AJvYcCV3u8cGnWqyejY5AU9dOkY1vPiPl6W/5x7FaT8A4M0kDSEL05/qW4bFT11OXnX+kQpuBnfsYKC5GrLO2Mc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XtwPuZ1u8amw2f9dcAt//Gj0AEF3Kz9bMAmHX/JrZHSVbtrR
	B+BJ19YYsg6gx/AojekEkTvlviRYMhVBuTZq2PZ61QKNKt9NvVP0VfjkzvhdIUvVOMsmuhE7lq/
	xnWXqmY7cBOktxrYIIXUWw9X2KTbVeoqeyiVgmvWSOg==
X-Gm-Gg: ASbGncujQdxW4NZnD1IAdfzCFK0FPVF6NFWWBynbSamhs32cmZahDQK1zw2mSEA7ZBB
	BjQ1NFOQtp3zAT9FwApvNPenxnmgRGxOyo3CuGDRyhh1TLBIeOYFsSJeR8mrKkPbCDkaoEZzyge
	fSKozsSo2mYKLVndElRaY7irWZaduTJbJ00A==
X-Google-Smtp-Source: AGHT+IGQJih7ABrJkyHXOxVQqXeWFy+8tRFAAwAelY8XbJK42oN2ccbF+YYkI6zd7QDW809w0lHa6Kx2D4jNl++RLr8=
X-Received: by 2002:a05:6902:1201:b0:e78:f901:6074 with SMTP id
 3f1490d57ef6-e7b6d39c8e6mr15228387276.5.1747657940585; Mon, 19 May 2025
 05:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516-b4-usdhc-v2-1-3fccd02f5602@nxp.com>
In-Reply-To: <20250516-b4-usdhc-v2-1-3fccd02f5602@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 14:31:44 +0200
X-Gm-Features: AX0GCFu0noKnxB0Y5FfzLidgfrO3RarPEU6zn_6BF2jOJDmCis2kwv2FoOkskmk
Message-ID: <CAPDyKFrknTGmptb4K28eHtELEdu_7WXtJwV5L5zyxfzuGeR5WA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-esdhc-imx: fix few build warnings
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Luke Wang <ziniu.wang_1@nxp.com>, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 May 2025 at 09:44, Haibo Chen <haibo.chen@nxp.com> wrote:
>
> drivers/mmc/host/sdhci-esdhc-imx.c:1566 sdhci_esdhc_imx_hwinit() warn: inconsistent indenting
> drivers/mmc/host/sdhci-esdhc-imx.c:1251 esdhc_executing_tuning() error: uninitialized symbol 'target_min'.
> drivers/mmc/host/sdhci-esdhc-imx.c:1251 esdhc_executing_tuning() error: uninitialized symbol 'target_max'.
>
> Fixes: be953af79cc6 ("mmc: sdhci-esdhc-imx: widen auto-tuning window for standard tuning")
> Fixes: 541a95e64d76 ("mmc: sdhci-esdhc-imx: optimize the manual tuing logic to get the best timing")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202505160225.Csr5USfq-lkp@intel.com/
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index c0160c69a027826c4099c9bcf82cd4d83f1113fd..741db169f44d9c9c1e5e1dee591b72221fa1e2b9 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1216,8 +1216,8 @@ static int esdhc_executing_tuning(struct sdhci_host *host, u32 opcode)
>         int win_length, target_min, target_max, target_win_length;
>         u32 clk_tune_ctrl_status, temp;
>
> -       min = ESDHC_TUNE_CTRL_MIN;
> -       max = ESDHC_TUNE_CTRL_MIN;
> +       min = target_min = ESDHC_TUNE_CTRL_MIN;
> +       max = target_max = ESDHC_TUNE_CTRL_MIN;
>         target_win_length = 0;
>         while (max < ESDHC_TUNE_CTRL_MAX) {
>                 /* find the mininum delay first which can pass tuning */
> @@ -1591,8 +1591,8 @@ static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
>                          * wider, give auto tuning enough space to handle the sample
>                          * point shift cause by temperature change.
>                          */
> -                        tmp &= ~ESDHC_TUNING_WINDOW_MASK;
> -                        tmp |= FIELD_PREP(ESDHC_TUNING_WINDOW_MASK, ESDHC_AUTO_TUNING_WINDOW);
> +                       tmp &= ~ESDHC_TUNING_WINDOW_MASK;
> +                       tmp |= FIELD_PREP(ESDHC_TUNING_WINDOW_MASK, ESDHC_AUTO_TUNING_WINDOW);
>
>                         /* Disable the CMD CRC check for tuning, if not, need to
>                          * add some delay after every tuning command, because
>
> ---
> base-commit: 484803582c77061b470ac64a634f25f89715be3f
> change-id: 20250516-b4-usdhc-bcd8cea08ed6
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>
