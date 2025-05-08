Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3CD21579F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704101; cv=none; b=f3Glvh9jnePJf+N3ckdjIXsXV92LODRIFlRV77plKBRKCeV1vZVBhc33HDZvdW2wcuO8HGwM2m4yH7IIejpqg8CgK6k2VDcJLVl7PgTaYerHXOjIlcNoM7asKXX9xddS9ghCyH2+/JqfSMfCb2z2WdkdhU3RQIPQ5799Xn+iQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704101; c=relaxed/simple;
	bh=oA1OiCMhmphQt5LlavV/Bcw1WuniQxuqjCoszOxphYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNG7SCr1qlcUHO0Oof8d65XGBCMr8RgO7mdbAQEKi8ADRlRmS+sA/SL66WtGFRpT67MszxFOkY97Btqk6jJx5v8JiJ1Psvk3hNbXhzags5XwSkxsnjJWNiIBCp5Vjr/4PMDL8/fJhJ5ree0nPKyUP8lEo/AHe7oqghMmsqIhjKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FyI5oZEd; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FyI5oZEd"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7387d4a334so780854276.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746704098; x=1747308898; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=;
        b=FyI5oZEd7slpVzco9ViJfsAwtoZyQuAb2R492GKoVL5KJpNMVeGItCL7b5iLXpt6Mf
         a2MHelWty3udeXcJ4GI3pkPvze1KuJfT64lhDdS3cUtRIK3KxGXpmxnXVAs6MUTUy79+
         lv4AnGUpSm443rYSGV/83Uh4WY1TEpuegDuIcc4xVe+OA5jFCR+umiDDn5i6I8bxdxKe
         QmseUZZMBBTtpfZ0dZVbFxndELZBUPZoskYG8exqTTG1ccRh+XAy08xODInS3mGQOnem
         DMN+0yEhCxrCNilFMJ4sCIDU/GNf4itwRt/nAYVDqdywSapnumpspbakco3lZZ91Wv8q
         +Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704098; x=1747308898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=;
        b=mPWTqr4+hx4PWWtw5z5TweRpTQsbh3VFcqy9I+tBMTUCYZfnAv/AhzE3ZYHPtTgBJ5
         ftsXMew7eBfUN971pJciofO0awQIgq4RzFTz2A9j22CygNVFVOoH7CEZ2RPjp1pOozY9
         35F5+daUuCZP7vc2TI1w9D3M4psXcE3RJHYDu3c2QLSEOQ13+jvO6Y1bec7Wt+6p/0jx
         MVVkE4skHdr+zAOYb8eFQpHai3myODyq4O3Hhk1sXzQMKeQ+bMWhNjSPwW1A4SC6qHRD
         yWUIPjaeefhmLCvuOgw7qnwLpLj5UUcxIr4cdFnYGpL1Q4n8G2habOzu8lSpfTa+X3lo
         5q8g==
X-Forwarded-Encrypted: i=1; AJvYcCWu5PegnPywWlwe/oWYC4tzEzilxYGykFufYplJ0jXt7p2HW5QtlH1lef7kq+KLrJ4K+lj1GltZp8bHiNw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyo4JR6bYDnZmg0Sn8IuWfjC9I6VV8PUBN1BxJO+MvCwlPRVF8
	gdHfI+TQkF6qhg13AcUT5i6BtuQc9c8/41hHU4OiRac4dZdinRy3H+SOlrX5gKuB+HgekVEL2n7
	lmMw1stFZA8Fz2Wqg+CeXXuIyo1s7VsnnHrOzhw==
X-Gm-Gg: ASbGncu2PAXto5BH9orEFt+X0mFodEYMn2mcW3KvY2yNfRzjWzHQh1KMF61IWvGw1IZ
	th314CBeuM0a83OrDbOwpLHKy8i/6nfKBSt5kkKeNhDiAD0fnFTd+rhLt6uU7VkmXBHSvfGCZjJ
	FY1Wq8TzTselSI0kH3bypk+Mt76S3Df1/wHQ==
X-Google-Smtp-Source: AGHT+IFISwEmEaUPEIGkAw+pjWlFVBT86sEjNE/qTVOISvnuF8D1u+N13cESKrEtVLIEhG9cDQKZ22WKp9cDBmU869o=
X-Received: by 2002:a05:6902:230f:b0:e73:1ff1:ca2f with SMTP id
 3f1490d57ef6-e78ef6f7c55mr3350492276.32.1746704097920; Thu, 08 May 2025
 04:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 13:34:22 +0200
X-Gm-Features: ATxdqUFTyHds9ofNJKemjngwN8NRV53Nc2rYed1UjoRSW5B2VKN5wXgtKbJ3AXY
Message-ID: <CAPDyKFpQPj8ky-QkOTgb0KQFoj+cP0EPE-uFu_MQozPC2vosOQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 17:32, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Most structures in this driver are not modified.
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers. (This is the case for see meson_ee_pwrc_domain_desc)
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    8924    3832       0   12756    31d4 drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>   12396     336       0   12732    31bc drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe

> ---
> Compile tested-only.
> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 78 ++++++++++++------------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index fbb2b4103930..55c8c9f66a1b 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -69,27 +69,27 @@ struct meson_ee_pwrc_domain_desc {
>         char *name;
>         unsigned int reset_names_count;
>         unsigned int clk_names_count;
> -       struct meson_ee_pwrc_top_domain *top_pd;
> +       const struct meson_ee_pwrc_top_domain *top_pd;
>         unsigned int mem_pd_count;
> -       struct meson_ee_pwrc_mem_domain *mem_pd;
> +       const struct meson_ee_pwrc_mem_domain *mem_pd;
>         bool (*is_powered_off)(struct meson_ee_pwrc_domain *pwrc_domain);
>  };
>
>  struct meson_ee_pwrc_domain_data {
>         unsigned int count;
> -       struct meson_ee_pwrc_domain_desc *domains;
> +       const struct meson_ee_pwrc_domain_desc *domains;
>  };
>
>  /* TOP Power Domains */
>
> -static struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
> +static const struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(8),
>         .iso_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .iso_mask = BIT(9),
>  };
>
> -static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
> +static const struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
>         .sleep_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(8),
>         .iso_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
> @@ -104,20 +104,20 @@ static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
>                 .iso_mask = BIT(__bit),                         \
>         }
>
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
>
> -static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
> +static const struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(16) | BIT(17),
>         .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
>         .iso_mask = BIT(16) | BIT(17),
>  };
>
> -static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
> +static const struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(18) | BIT(19),
>         .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
> @@ -154,39 +154,39 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
>         { __reg, BIT(14) },                                     \
>         { __reg, BIT(15) }
>
> -static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
> +static const struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
>         { HHI_MEM_PD_REG0, GENMASK(3, 2) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
> +static const struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
>         { HHI_MEM_PD_REG0, GENMASK(1, 0) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
> @@ -198,28 +198,28 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
>         { HHI_NANOQ_MEM_PD_REG0, 0xff },
>         { HHI_NANOQ_MEM_PD_REG1, 0xff },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
>         { HHI_MEM_PD_REG0, GENMASK(31, 30) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
>         { HHI_MEM_PD_REG0, GENMASK(29, 26) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
>         { HHI_MEM_PD_REG0, GENMASK(25, 18) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
> +static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
>         { HHI_MEM_PD_REG0, GENMASK(5, 4) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>         { HHI_MEM_PD_REG0, GENMASK(5, 4) },
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(1, 0) },
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(3, 2) },
> @@ -235,12 +235,12 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>         { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
>         { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
>         { G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
>         { G12A_HHI_ISP_MEM_PD_REG1, GENMASK(31, 0) },
>  };
> @@ -270,14 +270,14 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
>
>  static bool pwrc_ee_is_powered_off(struct meson_ee_pwrc_domain *pwrc_domain);
>
> -static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
>         [PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 5, 2),
>         [PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>         [PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
>  };
>
> -static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>         [PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 11, 2),
>         [PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
> @@ -287,13 +287,13 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>                                     pwrc_ee_is_powered_off),
>  };
>
> -static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
>         [PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, gxbb_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 12, 2),
>         [PWRC_GXBB_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>  };
>
> -static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
>         [PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
>                                        meson8_pwrc_mem_vpu,
>                                        pwrc_ee_is_powered_off, 0, 1),
> @@ -303,7 +303,7 @@ static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
>                                                 meson8_pwrc_audio_dsp_mem),
>  };
>
> -static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
>         [PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
>                                        meson8_pwrc_mem_vpu,
>                                        pwrc_ee_is_powered_off, 11, 1),
> @@ -313,7 +313,7 @@ static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
>                                                 meson8_pwrc_audio_dsp_mem),
>  };
>
> -static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
>         [PWRC_SM1_VPU_ID]  = VPU_PD("VPU", &sm1_pwrc_vpu, sm1_pwrc_mem_vpu,
>                                     pwrc_ee_is_powered_off, 11, 2),
>         [PWRC_SM1_NNA_ID]  = TOP_PD("NNA", &sm1_pwrc_nna, sm1_pwrc_mem_nna,
> @@ -576,32 +576,32 @@ static void meson_ee_pwrc_shutdown(struct platform_device *pdev)
>         }
>  }
>
> -static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
>         .count = ARRAY_SIZE(g12a_pwrc_domains),
>         .domains = g12a_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
>         .count = ARRAY_SIZE(axg_pwrc_domains),
>         .domains = axg_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
>         .count = ARRAY_SIZE(gxbb_pwrc_domains),
>         .domains = gxbb_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
>         .count = ARRAY_SIZE(meson8_pwrc_domains),
>         .domains = meson8_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
>         .count = ARRAY_SIZE(meson8b_pwrc_domains),
>         .domains = meson8b_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
>         .count = ARRAY_SIZE(sm1_pwrc_domains),
>         .domains = sm1_pwrc_domains,
>  };
> --
> 2.49.0
>
