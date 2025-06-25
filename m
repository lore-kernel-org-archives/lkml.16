Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BDA4A04
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827995; cv=none; b=mx42Ntq+TMPcjLi+58DINi2ONcecfD/nwYXYhLLq+gYAm6QgsUex53zj6ShgxKActQqRFXPNEWDW4rdwmoZqxlFlSTAnz9H+Eqrvr2svkEQwPhSLmjx8whWDOVCtMYUaZvIHiAcYznGErJZvuxvc5iQmdeOGQogs/EFSRMGd5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827995; c=relaxed/simple;
	bh=czZKWkwXbXmaZpqtDefhqkPljwr9KTI2et+ef5ASvUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpLY/XVi67nuYz0WZ+ZC1ZrLXsTh5xfxtwYESHFl7NYM00f4SWOSnIXVcS0bjt5V9hFSs1FZn2m982cWEf9wulH68tmprdMCtxLTRT70DssjqnaDHGAhlql+YK0ie51wqD3eVUL6TVbRtlUe+XtVPe128OK4Xivi8DNk5EZwMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UUzYsjtJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UUzYsjtJ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so6231926e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750827991; x=1751432791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYL0zDoEF8tBEVV2CM33ngyEh5/p8g2bCwVDJFJP1+w=;
        b=UUzYsjtJ234w0CiI3l7SjmBOr1+orPlIwIiW7dEzO8c0rocrkRC3HUBZ16OOQ5/tVC
         BkcIVkaFgxnl+vc5HbJ7sdWxbJ/UTM3mvXs2iGuDsj4xfE7P+JGQB+UTlXtC7t3JeN81
         4Sfkjzvw6+EKjCgrng0sIv+S3jsBinVGyFUSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750827991; x=1751432791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYL0zDoEF8tBEVV2CM33ngyEh5/p8g2bCwVDJFJP1+w=;
        b=RrVHDYH3Vvu13Y7EOKsG0w9Vi+ZT47KVR6Uezu2OCoZT2xmii0VvATaw9+7HauY09b
         mCuZaepq5wsUSMcMJFf6eEvra0JQkI+hwp1ooOQ9GFzCGlxReYwJecWkxWE9C1GtK9jG
         InO9r2ouhZmcct4qSuF7WstK/jtIEzNyVEMJ6u1s8M85Cjeesq+u0Ug41wYn+oHKKmyA
         nH5dqZ0eHeHfYWeX7paq/qbMCxO8MrfswvDdi0qFaoeK4Bf/P/ATOleQyWRKJRG/2Px+
         Wy710JvNyXJTwcPfkgEUG8Bo5xeTRWNPEd4vWHjyCNFtCgWrN/oMIApxy53tVJY4SwFv
         kOOA==
X-Forwarded-Encrypted: i=1; AJvYcCVQQu8aDXa2WEqQR9+/mXVzMH769OrJxwM/ZmmbF3KtYwKwxvIJwVuVnS4l141p0zH222wvJV+Ppj2dbWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFeIP4NckFYHJ75lnRx0/Kwkln6wS77B2arExa/Ly4iSxM9NLi
	jKriL0A8dTiqSq4BBmkQuOyBgt36tUPRStNLk1vM0rPDwg2LIzhwo4iZL+2mOLtmZT387jAxeCv
	jrgCyH5yYLSiduXd+Bpwch2XCOvOGaBfaSSDmW/XC
X-Gm-Gg: ASbGncsR6bzpE4MP40mJHlzQcv6f01C/TKkaL6sbgmahakeUEzluYhxc875t4UijyhD
	68+REQWa8EUkhSquU9piMUM3S09jSr6m36XbgjRgYHrjUSKmf10cKzcCo2pK3RwOEJUiy+GGO70
	lNicIniLV4Dnfrlj6YictUTe59r8/tCEj2kWDbZ5M4q5nh/5I6g1mWsAQToi+/UZsR4yrVXA==
X-Google-Smtp-Source: AGHT+IEPnjDPdzCHrxS9FLolva0rhORMM3QulXsmJfUCrp8Q42wqK3RvPIsJ5XM2NL3tU4k3s1Ue9EkMUcYihQ9AaGg=
X-Received: by 2002:a05:6512:b97:b0:553:2f57:f8af with SMTP id
 2adb3069b0e04-554fdce9e0dmr449486e87.20.1750827991225; Tue, 24 Jun 2025
 22:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com> <20250624073548.29732-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250624073548.29732-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Jun 2025 13:06:20 +0800
X-Gm-Features: Ac12FXzHd-cnN4TUsA_r-2fnEM30GQ1asEGL9sR_0RQ8CDW8gNp231ivBudzbiA
Message-ID: <CAGXv+5G-s6+sF-PS0iywC5uxMkrfH1FskWG_HcHAi_tfuHWtZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] regulator: Add support for MediaTek MT6316 SPMI
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 24, 2025 at 3:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a driver for the regulators found on all types of the MediaTek
> MT6316 SPMI PMIC, fully controlled by SPMI interface and featuring
> four step down DCDC (buck) converters.
>
> In particular, this includes support for:
>  - MT6316(BP/VP):    2+2 Phase (Phase 1: buck1+2, Phase 2: buck3+4)
>  - MT6316(CP/HP/KP): 3+1 Phase (Phase 1: buck1+2+4, Phase 2: buck3)
>  - MT6316(DP/TP):    4+0 Phase (Single phase, buck1+2+3+4)
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/regulator/Kconfig            |   9 +
>  drivers/regulator/Makefile           |   1 +
>  drivers/regulator/mt6316-regulator.c | 345 +++++++++++++++++++++++++++
>  3 files changed, 355 insertions(+)
>  create mode 100644 drivers/regulator/mt6316-regulator.c
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 6d8988387da4..bca2ebbd89b7 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -864,6 +864,15 @@ config REGULATOR_MT6315
>           This driver supports the control of different power rails of de=
vice
>           through regulator interface.
>
> +config REGULATOR_MT6316
> +       tristate "MT6316 SPMI PMIC regulator driver"
> +       depends on SPMI || COMPILE_TEST
> +       help
> +          Say Y here to enable support for 2+2, 3+1 and 4 phase regulato=
rs
> +          found in the MediaTek MT6316 BP, CP, DP, HP, VP and TP SPMI PM=
ICs.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
>  config REGULATOR_MT6323
>         tristate "MediaTek MT6323 PMIC"
>         depends on MFD_MT6397
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index c0bc7a0f4e67..58643e35d2cc 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -103,6 +103,7 @@ obj-$(CONFIG_REGULATOR_MP886X) +=3D mp886x.o
>  obj-$(CONFIG_REGULATOR_MPQ7920) +=3D mpq7920.o
>  obj-$(CONFIG_REGULATOR_MT6311) +=3D mt6311-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6315) +=3D mt6315-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6315)  +=3D mt6316-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6323) +=3D mt6323-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6331) +=3D mt6331-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6332) +=3D mt6332-regulator.o
> diff --git a/drivers/regulator/mt6316-regulator.c b/drivers/regulator/mt6=
316-regulator.c
> new file mode 100644
> index 000000000000..952852bbe923
> --- /dev/null
> +++ b/drivers/regulator/mt6316-regulator.c
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024 MediaTek Inc.
> +// Copyright (c) 2025 Collabora Ltd
> +//                    AngeloGioacchino Del Regno <angelogioacchino.delre=
gno@collabora.com>
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/spmi.h>
> +
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +#define MT6316_BUCK_MODE_AUTO                  0
> +#define MT6316_BUCK_MODE_FORCE_PWM             1
> +#define MT6316_BUCK_MODE_LP                    2
> +
> +#define MT6316_CHIP_ID                         0x20b
> +#define MT6316_BUCK_TOP_CON0                   0x1440
> +#define EN_SET_OFFSET                          0x1
> +#define EN_CLR_OFFSET                          0x2
> +
> +#define MT6316_BUCK_TOP_CON1                   0x1443
> +
> +#define MT6316_BUCK_TOP_ELR0                   0x1448
> +#define MT6316_BUCK_TOP_ELR2                   0x144a
> +#define MT6316_BUCK_TOP_ELR4                   0x144c
> +#define MT6316_BUCK_TOP_ELR6                   0x144e
> +#define MT6316_VSEL_MASK                       GENMASK(8, 0)
> +
> +#define MT6316_VBUCK1_DBG                      0x14a8
> +#define MT6316_VBUCK2_DBG                      0x1528
> +#define MT6316_VBUCK3_DBG                      0x15a8
> +#define MT6316_VBUCK4_DBG                      0x1628
> +#define MT6316_BUCK_QI                         BIT(0)
> +
> +#define MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0    0x1688
> +#define MT6316_BUCK_TOP_4PHASE_TOP_ELR_0       0x1690
> +
> +enum mt6316_type {
> +       MT6316_TYPE_2PHASE,
> +       MT6316_TYPE_3PHASE,
> +       MT6316_TYPE_4PHASE
> +};
> +
> +/**
> + * struct mt6316_regulator_info - MT6316 regulators information
> + * @desc: Regulator description structure
> + * @debug_reg: Debug register for regulator status
> + * @lp_mode_reg: Low Power mode register (normal/idle)
> + * @lp_mode_mask: Low Power mode regulator mask
> + * @modeset_reg: AUTO/PWM mode register
> + * @modeset_mask: AUTO/PWM regulator mask
> + */
> +struct mt6316_regulator_info {
> +       struct regulator_desc desc;
> +       u16 debug_reg;
> +       u16 lp_mode_reg;
> +       u16 lp_mode_mask;
> +       u16 modeset_reg;
> +       u16 modeset_mask;
> +};
> +
> +#define MT6316_BUCK(match, vreg_id, min, max, step, vs_reg)            \
> +{                                                                      \
> +       .desc =3D {                                                      =
 \
> +               .name =3D match,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6316_vreg_setclr_ops,                        =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D (max - min) / step + 1,                  =
 \
> +               .min_uV =3D min,                                         =
 \
> +               .uV_step =3D step,                                       =
 \
> +               .enable_reg =3D MT6316_BUCK_TOP_CON0,                    =
 \
> +               .enable_mask =3D BIT(vreg_id - 1),                       =
 \
> +               .vsel_reg =3D vs_reg,                                    =
 \
> +               .vsel_mask =3D MT6316_VSEL_MASK,                         =
 \
> +               .of_map_mode =3D mt6316_map_mode,                        =
 \
> +       },                                                              \
> +       .lp_mode_reg =3D MT6316_BUCK_TOP_CON1,                           =
 \
> +       .lp_mode_mask =3D BIT(vreg_id - 1),                              =
 \
> +       .modeset_reg =3D MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0,            =
 \
> +       .modeset_mask =3D BIT(vreg_id - 1),                              =
 \
> +       .debug_reg =3D MT6316_VBUCK##vreg_id##_DBG,                      =
 \
> +}

[...]

> +
> +/* MT6316BP/VP - 2+2 phase buck */
> +static struct mt6316_regulator_info mt6316bv_regulators[] =3D {
> +       MT6316_BUCK("vbuck12", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0)=
,
> +       MT6316_BUCK("vbuck34", 3, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR4)=
,

                                    ^
While this is technically correct as the selector does start from 0,
I don't think the regulator can actually go down to 0V. In the past
for the MT6311 / MT6315, MediaTek always added a standard minimum
voltage in the device tree.

I believe a combination of setting .linear_min_sel and adjusting min_uV
and n_voltages is the correct solution.

> +};
> +
> +/* MT6316CP/HP/KP - 3+1 phase buck */
> +static struct mt6316_regulator_info mt6316chk_regulators[] =3D {
> +       MT6316_BUCK("vbuck124", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0=
),
> +       MT6316_BUCK("vbuck3", 3, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR4),
> +};
> +
> +/* MT6316DP/TP - 4 phase buck */
> +static struct mt6316_regulator_info mt6316dt_regulators[] =3D {
> +       MT6316_BUCK("vbuck1234", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR=
0),
> +};
> +
> +static const struct regmap_config mt6316_spmi_regmap_config =3D {
> +       .reg_bits       =3D 16,
> +       .val_bits       =3D 8,
> +       .max_register   =3D 0x1700,
> +       .fast_io        =3D true,
> +};
> +
> +static int mt6316_regulator_probe(struct spmi_device *sdev)
> +{
> +       struct regulator_config config =3D {};
> +       struct mt6316_regulator_info *info;
> +       struct regulator_dev *rdev;
> +       enum mt6316_type type;
> +       int num_vregs, ret;
> +       unsigned int i;
> +       u32 chip_id;
> +
> +       config.regmap =3D devm_regmap_init_spmi_ext(sdev, &mt6316_spmi_re=
gmap_config);
> +       if (IS_ERR(config.regmap))
> +               return PTR_ERR(config.regmap);
> +
> +       /*
> +        * The first read is expected to fail: this PMIC needs to be woke=
n up
> +        * and that can be done with any activity over the SPMI bus.
> +        */
> +       regmap_read(config.regmap, MT6316_CHIP_ID, &chip_id);
> +
> +       /* The second read, instead, shall not fail! */
> +       ret =3D regmap_read(config.regmap, MT6316_CHIP_ID, &chip_id);
> +       if (ret) {
> +               dev_err(&sdev->dev, "Cannot read Chip ID!\n");
> +               return ret;
> +       }
> +       dev_dbg(&sdev->dev, "Chip ID: 0x%x\n", chip_id);
> +
> +       config.dev =3D &sdev->dev;
> +
> +       type =3D (uintptr_t)device_get_match_data(&sdev->dev);
> +       switch (type) {
> +       case MT6316_TYPE_2PHASE:

Instead of being tied to the compatible string / PMIC variant,
I wonder if this is something that can be read back from the
PMIC. You wouldn't need so many variant compatible strings if
that's the case.

FWIW we do that for some of the X-Powers AXP PMICs.


ChenYu
