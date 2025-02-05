Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15421519BC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754392; cv=none; b=GVOCDO9kmhQJsp8y0ljkaZ0PO2DpB/BbS+9TARlDsTsIlBgDx/v1wVV/imHxpvgOpnqClo8PjE7ptqiP8EzMwHA10zWq5ozpMLFP25N5Wx86hCvllGYmiA/1rbUc+4KTPvBQcX94yxfuHX4ZFnNogWqHjInVyGexrMlbWQwWLjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754392; c=relaxed/simple;
	bh=dJo1EFPa8YIIvRHpglzURkC0J+HnvcqX6wYnRedJIaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIifRyH/SQ3uySHEwZsUptOzjEVymrjR0Sy0CVfjQA6T9Iod/dsTkrxcZ89M6+WXQ0ECQx3PU9vrXGHzpNDUg3ua3quojehDB5i1svra+gk7JLCb8w3I2afedJQT6Gf2a4y5lx8xe1YvQTHqb0T5SrPlFYTgM8CWtAV7Yn30dRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Xrh+SFJp; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Xrh+SFJp"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f4bc408e49so40886407b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 03:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1738754389; x=1739359189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybYhgoqvdEUqCkpSu+wLe1vUmUBCbbPBzWxAddTN9tM=;
        b=Xrh+SFJppWV7y83/qCJ4hweRLAh4Dw2/UPYmOf9jEiHl3P7Qzde8elYv5ZqCaeBSJx
         wL3/ZCULPS8//wvF6LD3O75sLMEy3vLTeNlowMsAxnTUBJFqvAoO8uBUsOj3mOr3Ertp
         cgW2Zd01ygVGJJqJhXEqBsVERo915eM/ZJ1dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738754389; x=1739359189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybYhgoqvdEUqCkpSu+wLe1vUmUBCbbPBzWxAddTN9tM=;
        b=J9Tnr8f8zHEMuTMFQp6aRzWjYGCaxJ1BjRHVUfeFJA8thV9BrIWG1/43T4CHHm8ha1
         t5EgVUXkuqHY74PgyjSaMdeOVY+Jt9t+nYro8rArRgzWZsuGXhtTjWF8eQBGfM+lPyY4
         AP3H5r4Q+nx1Yg73R+edBeT5Im64/RYG5zjdczo7MSEgrkBe8bDp/Om7foBrKW8VG35U
         1OwO0Tj8rWkBY0G8oS8kOwNdxb23ar+4ateCTZ5txNOvVvnJLvZ/tLv4qorIsZ76hqNz
         kubzLnNxwNQ9Qr5wyTuzjU4QwSd+bZh3NN3JfsKdXK8Gc0CNtKJ9X/SRfhTtcumVceXc
         j2Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVLrZkIqagoG/54WJm2RWSna/O362MGQMJ4U8GPF0OzG/GIQ0O7A84IVphhX7pzrGOdzuZErKO9xdr8O8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj5Ggoaaw6N/u/SNLtrVH36iXfCoypp3Ks7sCzOO9rRbfEKUjz
	GKa6bciEU4+k19gTm9C5cFe9o/b98ieuq52/rolkt20M0NoD0MGntBjQ9oBwkghbFpu15PO38z9
	2NmvjctMtTS6fkMtrP2l7XoQMu1v42Q9F2snJQw==
X-Gm-Gg: ASbGnctNVgC1gCetIO2gG4zBZhyW88k6ijesl9IJfNST6shHOoKPRnRuphSzrZ3wU+D
	JqUHjj6yKQ5l83KVM0Kq7JENoY/LOew44DfghcVllcwW/KbdP/4JhlPtzSjgPOXxM2MG5N5U=
X-Google-Smtp-Source: AGHT+IHrHyVnC3ucjf5CnroJR9CV5ZcoEk66TZwNGhnQNhqYfAzUhk+K50MujLR1SniK7HjaTQcDJUvQT8Lporl78yk=
X-Received: by 2002:a05:690c:7407:b0:6f7:409c:f645 with SMTP id
 00721157ae682-6f989e3acdemr19242597b3.4.1738754389549; Wed, 05 Feb 2025
 03:19:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com> <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
In-Reply-To: <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 5 Feb 2025 12:19:38 +0100
X-Gm-Features: AWEUYZl4J7MiWYs5V1DsV6zpiNupetaeRUoMIlCCJYHJv9tWjHggrdqzDtOIt9g
Message-ID: <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock generation
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Abel Vesa <abelvesa@kernel.org>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Wed, Feb 5, 2025 at 10:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add support for spread spectrum clock (SSC) generation to the pll14xxx
> driver.
>
> Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

It doesn=E2=80=99t seem right to me.
You can=E2=80=99t take 90% of my patch, where the SSC management was actual=
ly
implemented,
add 10%, and consider yourself the author of the patch.
Please correct it in version 3.

Thanks and regards,
Dario

> ---
>  drivers/clk/imx/clk-pll14xx.c | 66 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.=
c
> index f290981ea13bdba3602af7aa44aaadfe0b78dcf9..3bdce762a9d651a6fb048dcbf=
58db396af9d3aaf 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -20,6 +20,8 @@
>  #define GNRL_CTL       0x0
>  #define DIV_CTL0       0x4
>  #define DIV_CTL1       0x8
> +#define SSCG_CTRL      0xc
> +
>  #define LOCK_STATUS    BIT(31)
>  #define LOCK_SEL_MASK  BIT(29)
>  #define CLKE_MASK      BIT(11)
> @@ -31,15 +33,26 @@
>  #define KDIV_MASK      GENMASK(15, 0)
>  #define KDIV_MIN       SHRT_MIN
>  #define KDIV_MAX       SHRT_MAX
> +#define SSCG_ENABLE    BIT(31)
> +#define MFREQ_CTL_MASK GENMASK(19, 12)
> +#define MRAT_CTL_MASK  GENMASK(9, 4)
> +#define SEL_PF_MASK    GENMASK(1, 0)
>
>  #define LOCK_TIMEOUT_US                10000
>
> +enum imx_pll14xx_ssc_mod_type {
> +       IMX_PLL14XX_SSC_DOWN_SPREAD,
> +       IMX_PLL14XX_SSC_UP_SPREAD,
> +       IMX_PLL14XX_SSC_CENTER_SPREAD,
> +};
> +
>  struct clk_pll14xx {
>         struct clk_hw                   hw;
>         void __iomem                    *base;
>         enum imx_pll14xx_type           type;
>         const struct imx_pll14xx_rate_table *rate_table;
>         int rate_count;
> +       struct clk_spread_spectrum      ssc_conf;
>  };
>
>  #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
> @@ -349,6 +362,42 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, =
unsigned long drate,
>         return 0;
>  }
>
> +static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned long par=
ent_rate,
> +                                   unsigned int pdiv, unsigned int mdiv)
> +{
> +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +       struct clk_spread_spectrum *conf =3D &pll->ssc_conf;
> +       u32 sscg_ctrl, mfr, mrr, mod_type;
> +
> +       sscg_ctrl =3D readl_relaxed(pll->base + SSCG_CTRL);
> +       sscg_ctrl &=3D
> +               ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_M=
ASK);
> +
> +       mfr =3D parent_rate / (conf->modfreq * pdiv * (1 << 5));
> +       mrr =3D ((conf->spreaddepth / 100) * mdiv * (1 << 6)) / (100 * mf=
r);
> +
> +       switch (conf->method) {
> +       case CLK_SSC_CENTER_SPREAD:
> +               mod_type =3D IMX_PLL14XX_SSC_CENTER_SPREAD;
> +               break;
> +       case CLK_SSC_UP_SPREAD:
> +               mod_type =3D IMX_PLL14XX_SSC_UP_SPREAD;
> +               break;
> +       case CLK_SSC_DOWN_SPREAD:
> +               mod_type =3D IMX_PLL14XX_SSC_DOWN_SPREAD;
> +               break;
> +       default:
> +               mod_type =3D IMX_PLL14XX_SSC_DOWN_SPREAD;
> +               break;
> +       }
> +
> +       sscg_ctrl |=3D SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
> +               FIELD_PREP(MRAT_CTL_MASK, mrr) |
> +               FIELD_PREP(SEL_PF_MASK, mod_type);
> +
> +       writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
> +}
> +
>  static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>                                  unsigned long prate)
>  {
> @@ -370,6 +419,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, u=
nsigned long drate,
>                 writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
>                                pll->base + DIV_CTL1);
>
> +               if (pll->ssc_conf.enable)
> +                       clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rat=
e.mdiv);
> +
>                 return 0;
>         }
>
> @@ -410,6 +462,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, u=
nsigned long drate,
>         gnrl_ctl &=3D ~BYPASS_MASK;
>         writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
>
> +       if (pll->ssc_conf.enable)
> +               clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
> +
>         return 0;
>  }
>
> @@ -465,6 +520,16 @@ static void clk_pll14xx_unprepare(struct clk_hw *hw)
>         writel_relaxed(val, pll->base + GNRL_CTL);
>  }
>
> +static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
> +                                           struct clk_spread_spectrum *c=
lk_ss)
> +{
> +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +
> +       memcpy(&pll->ssc_conf, clk_ss, sizeof(pll->ssc_conf));
> +
> +       return 0;
> +}
> +
>  static const struct clk_ops clk_pll1416x_ops =3D {
>         .prepare        =3D clk_pll14xx_prepare,
>         .unprepare      =3D clk_pll14xx_unprepare,
> @@ -485,6 +550,7 @@ static const struct clk_ops clk_pll1443x_ops =3D {
>         .recalc_rate    =3D clk_pll14xx_recalc_rate,
>         .round_rate     =3D clk_pll1443x_round_rate,
>         .set_rate       =3D clk_pll1443x_set_rate,
> +       .set_spread_spectrum =3D clk_pll1443x_set_spread_spectrum,
>  };
>
>  struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *na=
me,
>
> --
> 2.37.1
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
