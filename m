Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C545227E1C8
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664404; cv=none; b=n2uE8yrz4hxsRwj1xHAQcEIOL0WnzsOMQgf/3nlhvldMS/+15KPPXWo53PgpKcgQxsAkSEyIUDmFZhmD4GzoiWBKzJTZRrRjcrkVtv8S4wwBQRNqvxg9K7f10mNC7cq38LcpIMq5CluDBKBuEBHMBi4NYUhW6WO8Lh6KN0FMBJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664404; c=relaxed/simple;
	bh=2QhEeJN+QAQrXlpioyGsVmlzKPxs7y7V4R1J1hJ60dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZ3OPV4vGzr3fLcDZX0jnu7xdyG6/nlAdm9mPJbp/zrvuXNdiiYSjdGkXgkRcrEtWjcevIkoatHHFftIQIU+AuQn1kEpA/xw7VOBELzPzgtSDUjoXSh6LOPgmHeQOeqouQ4+s3zsJX7tMeTPyNBW9QB94wtdvnObTSSDFRBVjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0sy/t8d; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0sy/t8d"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7b943bcf0cso1390439276.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747664402; x=1748269202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VwQInU0BL1914wpsZlAYnKCHkRSUkFmFPhaLTIKOJvw=;
        b=M0sy/t8dBtiwJRpKhrbiD6kcliKEJ+A7otUNh4LpxnKirP144e0UD0dH8PVS1oel5n
         oWJyk4Wi+IIGXAMQrQq0+akRuZoO/c3H7EuCCuTT8chTn6z/bnXZgUb9U4SRKzMExaOa
         JM4PHo6qEY+MgqKeN78OTqHnO/MlW8sbfdWUzSC+AVy8X8Kf6wxNOrnbBp4oTx4GKO1J
         malKj/c6fo9Ovs/jT1e+/5Ntz1qqzZp7virlUH+mzQT3aJacqsZAk8LiiluxNpL2Pwk1
         CJeF98m1TSeeg/20VILLTu8dt/sZVKcqIjEWX61qXnwxETKJZBseC6XvwS+o0G37fV2y
         QkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747664402; x=1748269202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwQInU0BL1914wpsZlAYnKCHkRSUkFmFPhaLTIKOJvw=;
        b=ZD7oP5oZQ6qVUZja2fr//vdFOs54WWZZLTvFuqLyULM2bWtty2akhxd+tzNGDAkZ6G
         Au8RqKnikbElUemJZDrJKI+K/T/ZFl/BdZQZfvNyFypTtuTy/LHC7/nOsDtYhN842qC0
         p4hhBMOKt9N5hyyqRDLRGyzuXpa9M4VCwx2NcTBDOGHuN1FxrsW4PiHOGl81zle2Y2kM
         JYP4MSr74ZkhsWNX8tyA/R2FUKBsefx0zSUYEUXuY+XqSWrrPfywTBFUbc+7HelYgOPf
         qsnjWOMYoZEbMwwb04bxl7ZQMYSPWoyGYvvVsy/5ykV9E5c3/EnR3dRuuYcRdEGDDvKy
         FfSw==
X-Forwarded-Encrypted: i=1; AJvYcCXqzu6+jMb44theaQCPMWw7PmmAPo+q7L30JGUYfzQvkJyAaboJ2vBFIlBu54rni1acdYhAhTk5J8nktgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIVr9YG4XIu6hw0LKx9KYXysWHMIfuirAIogIsBYYwbT82ZvD
	hGd0y1y3/A/YapUzlw6Gvd2MWib4+yXTri6wEOrpMo24655ZsJ3XcA42OJIb58btiDvvES/4RcC
	DA1zCcOnMOWtjtVw9scxHyxkbhetMKkU8pPYtjkkW2A==
X-Gm-Gg: ASbGnct4xnY3JyTjo4qmOqOFKLzaZ7ILm3Itn8STDutEqx/NdIm+rT0ASTIxJJWO7XI
	j5MNhQt6EAA8Nywe3yf6eZUBaBPsQ0mRPZUKxvo7FcVikJbJT1p9SWh9qfMkh4nmJ5cqE85ata4
	sourzQ8YTXWj+cM8I0p1uwKKoEeTvGlUDT+w==
X-Google-Smtp-Source: AGHT+IGVX5yoYnItadKdZEWYQJ/USDnrDlwuwkIIEH6RYqaUPWRWklz3ss+nUUlHYUuwh48nx0lmjtA1sqsNK6i35fA=
X-Received: by 2002:a05:6902:140c:b0:e7b:5a74:f6d7 with SMTP id
 3f1490d57ef6-e7b6d715875mr16156878276.46.1747664401556; Mon, 19 May 2025
 07:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318230042.3138542-1-sbellary@baylibre.com> <20250318230042.3138542-3-sbellary@baylibre.com>
In-Reply-To: <20250318230042.3138542-3-sbellary@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 16:19:25 +0200
X-Gm-Features: AX0GCFuLITcWApASOkr6vaKuGc_781MXCq425ewvVNK_o0ULs7kwJTkxaVmgo8s
Message-ID: <CAPDyKFq-0XEgw2SX_4JoGXnrCF+S_HYjEw8cG_RX+usWTEFg5A@mail.gmail.com>
Subject: Re: [PATCH 2/4] pmdomain: ti: Fix STANDBY handling of PER power domain
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Bajjuri Praneeth <praneeth@ti.com>, Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Mar 2025 at 00:00, Sukrut Bellary <sbellary@baylibre.com> wrote:
>
> Per AM335x TRM[1](section 8.1.4.3 Power mode), in case of STANDBY,
> PER domain should be ON. So, fix the PER power domain handling on standby.
>
> [1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/ti/omap_prm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
> index b8ceb3c2b81c..7e36e675a8c6 100644
> --- a/drivers/pmdomain/ti/omap_prm.c
> +++ b/drivers/pmdomain/ti/omap_prm.c
> @@ -18,7 +18,9 @@
>  #include <linux/pm_domain.h>
>  #include <linux/reset-controller.h>
>  #include <linux/delay.h>
> -
> +#if IS_ENABLED(CONFIG_SUSPEND)
> +#include <linux/suspend.h>
> +#endif
>  #include <linux/platform_data/ti-prm.h>
>
>  enum omap_prm_domain_mode {
> @@ -88,6 +90,7 @@ struct omap_reset_data {
>  #define OMAP_PRM_HAS_RSTST     BIT(1)
>  #define OMAP_PRM_HAS_NO_CLKDM  BIT(2)
>  #define OMAP_PRM_RET_WHEN_IDLE BIT(3)
> +#define OMAP_PRM_ON_WHEN_STANDBY       BIT(4)
>
>  #define OMAP_PRM_HAS_RESETS    (OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
>
> @@ -404,7 +407,8 @@ static const struct omap_prm_data am3_prm_data[] = {
>                 .name = "per", .base = 0x44e00c00,
>                 .pwrstctrl = 0xc, .pwrstst = 0x8, .dmap = &omap_prm_noinact,
>                 .rstctrl = 0x0, .rstmap = am3_per_rst_map,
> -               .flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp"
> +               .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_ON_WHEN_STANDBY,
> +               .clkdm_name = "pruss_ocp",
>         },
>         {
>                 .name = "wkup", .base = 0x44e00d00,
> --
> 2.34.1
>
