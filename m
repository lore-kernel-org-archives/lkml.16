Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4B13AC1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530584; cv=none; b=EwVYfokwz51O0kIj0zQ8+2PT5eSIJCN8sDr1pWSc7qHFuXQO42TGfRmfCC0/mksM31B9TwUomcRRk8ENAB/WMTYYbyH6NWaimJ10zmRZUdd1hoHLak/+qlZLfyFJu+sk1KbiPuK3r//YPV7Jf5BkvZrIbLJyg7+rZ2spDGHRdiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530584; c=relaxed/simple;
	bh=dmqg5GhAnNOYRTKbDo2x0+pPDeIiIFeQ0zAhtcA6Jv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTxt/BGAxBZoT0v1IxvJuIBmVaV5TGJetc4bei6isbN31QiSnQ+WAZIccMmYQOfYU85WRMp+z4kgt/QHXYknUCRw7pQ6Zvik+41kHOPduaGbBy7FryS0lwk48QWGQ70s4fJanmYt5hrqEfG+GBtDkIF43TuXQkcSJ2ZWU0T1/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bZUQmI/Y; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bZUQmI/Y"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f768e9be1aso1145917b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1743530581; x=1744135381; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RElqtDNXiao5Fe66tX7PbQO9u80Hzs14f9V2tQZKzpA=;
        b=bZUQmI/YoF6cyS+u6LKi5Npktu1+3Tw8+8O5K5vXR8FAxe7fx6LTiUiUT7jawTm2yz
         +e1XtQZsKSEfWB/8BZH0rUv0hrvZksHCG1rCMkYvAoEcgMosX5Kx4+q9IdNGOBv50SC0
         SDXCEIPfTifSHv58Bhn/b91eMa7bGhgTuN16DUrnbak9b3pM29NDb6a6g9hHve2efaGz
         Z22pzUov3xECKaue0MwIqKTkIl3PWjbjDdEZdMZznxdrGmgoyghco7N6MwssqaQs+fZe
         mvhuGYPb90KXKdD4/R90Trj/Igp87aMUvTZiZu8y/uyjjukyC31qiRijciJ2t/pX6KkB
         f4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530581; x=1744135381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RElqtDNXiao5Fe66tX7PbQO9u80Hzs14f9V2tQZKzpA=;
        b=sioDBGVqEN1Y9qz8VezXwy9iEYsGp18Aobc35zPD/UKtInMPd9Ed3ZaCSZkzYDiGOu
         1lY50cjVaszxeLp0HV9eOfU4ZVHrmL+D4sCqTCilhlVECcsH02h7cGCNMLM+pZuc3s2g
         HwZpTDMDyO9BY1Z7JvS0NifrmUZrfAyPYtxvS9oKcq3AgjxZy2/xlpCpyLvg4bHPHlWa
         3VAoHtolx3ZpIMiLNfYy/3OuXCjEW3FDTMH+KpazKkEleaUFSbdne4xM+Tny+i2svTms
         kchECpaj1txgjp65IgCuXpr+NpK5wWp+NZBQL/4If+8ihn1raRW3fSJvl2U4ww3gvRsV
         S2LA==
X-Forwarded-Encrypted: i=1; AJvYcCU9HdN34b0/F0pKsIev+obsVV+6x5IzGqIkOYvSsA4yhvGXSEJNgaOn9WG0L4ctYdeIWOKDxAHQ4TkKuWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHIk8EaV4v7zUwh9KZ4YzNG4HB9iuj2cIhivD4yhqGIE+LUnw
	xk+PByL2FgotHfSq/AZKNIbXePIroDMydiBXEMxkSnwPqYxiOPKBGZHnU4wGG0+bU/PZ64tlbRk
	NDcoQw6R/UIn06XYjl3lNRS9f7Tz+2yGk6MUq1g==
X-Gm-Gg: ASbGncuCe7tnpXP06aI5NkEuyV+tM4cejQdEP4wgMAf2GcGHa8nrQASVSz6e3056OC8
	d7HAqUNXgVpwz6bmkDwtBpUeP55LWSjpy7wk9zoKxhnYhMDpH/NV+BaOhRjaLNaIyoODqaeMgBn
	IMqpypy8z7bEiePxY6vO+ca8uwldl+uD5DJKGG4XoyhsHPlL6jXYcBnUjJwQ==
X-Google-Smtp-Source: AGHT+IEAZ9awAdsvEF18jxvMFTvl6qOXCPx2YncirI/WvgPAq+emAZx1k23zW+DI5dEunJl/9DWT7JfGSiLy6Ulrod0=
X-Received: by 2002:a05:690c:6b86:b0:6ea:8901:dad8 with SMTP id
 00721157ae682-703b65e9521mr14267287b3.3.1743530581705; Tue, 01 Apr 2025
 11:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401132324.27312-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20250401132324.27312-1-bsdhenrymartin@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 1 Apr 2025 18:02:41 +0000
X-Gm-Features: AQ5f1JqNWcGg680Z3tQAJYQEnY6EuyQA4mTpaPDzPlzakkRAMGdaRw5B6PW0Yrk
Message-ID: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
Subject: Re: [PATCH v1] clk: bcm: Add NULL check in raspberrypi_clk_register()
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com, 
	mripard@kernel.org, u.kleine-koenig@baylibre.com, nathan@kernel.org, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Henry

Thanks for the patch.

On Tue, 1 Apr 2025 at 14:23, Henry Martin <bsdhenrymartin@gmail.com> wrote:
>
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> raspberrypi_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: 7dad8a613185 ("clk: bcm: rpi: Give firmware clocks a name")

Nit: It was 93d2725affd6 ("clk: bcm: rpi: Discover the firmware
clocks") that introduced the devm_kasprintf. 7dad8a613185 only changed
the thing being printed.

> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 0e1fe3759530..720acc10f8aa 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>         init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
>                                    "fw-clk-%s",
>                                    rpi_firmware_clk_names[id]);
> +       if (!init.name)
> +               return ERR_PTR(-ENOMEM);
>         init.ops = &raspberrypi_firmware_clk_ops;
>         init.flags = CLK_GET_RATE_NOCACHE;
>
> --
> 2.34.1
>
