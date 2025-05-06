Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D388321ADB9;
	Tue,  6 May 2025 06:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746514644; cv=none; b=ZqkBrIv4ieYCPp0nUJ186V4d4+GUGjfmGAzyT0COJ/XP0Y4XXGwoSAaRznyxx/UXDBo4qamLvZ7IafhDMp4Yp9kr8L5ciVbLRwEEDu69EmEKIEpC18LB0I37FF8V5eHF1Xbm1LN+QkJ9tKnhBkqarnI7g3qJNFGhCcASO7mqSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746514644; c=relaxed/simple;
	bh=jmxxIbzqKYSBJ1ZYZ8TvH3M6DSe+Gh2o2IqwWJRzrlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+CvlABJLY31zKDdXp1dtoj/AsxtFNBmPwC6SafOChrFByunuMgwQJJLcs+TOLMgg4IkUl+WWTiJrAb2SOVcacYoIh0+Hkmz7xKpAaGK9we/ZZVTZd4tnMRo4BFM26T8x1M9hLjQon81LuOnD+BKVIIUehPnc76JpheaVEX5XKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niXS9vJD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niXS9vJD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6E9C4CEE4;
	Tue,  6 May 2025 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746514644;
	bh=jmxxIbzqKYSBJ1ZYZ8TvH3M6DSe+Gh2o2IqwWJRzrlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=niXS9vJDBbl74HJG7BMxJx0ezJru9LnnTdImpiFfPAWDz1TV9f8NaPhgOvlou7DLL
	 YR7Ymim2r2aVEu68jncTxc0Z43NtijYzrEjKCvLC7coeiNwd2/nAA4pTJeA840aGNF
	 UVgJ08bl8eujq9WFeKh84c1yi9Ibo3XTQVFDrkUEJxgCWcTGTMVIWDJxJH4VdyqX08
	 4EZTcTn+1tw7qB2pSyM/rCMhamsIFmZvb/YQZEKWUve+Jc6cTC6kIlvn0A9i5f3HVP
	 /3mEgg2kZK5XtciRNm8goYBIoLgN6m1Q2wM6OsX2DLH1hxZvdEgUKYq1eBMN5iJd8q
	 OJ4gAQ3gPhztw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acbb48bad09so976943966b.0;
        Mon, 05 May 2025 23:57:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkwM1Wppczmt1Sjl+pXAmQA63M6idIQqrEe6zVAEdtvTlaIG++tCHvZfCyCzBVURrtRLQLr235ybO6@vger.kernel.org, AJvYcCWc9DTUOx580/pTNPlDM/0AmO8otXHc1lw3Ek5e2r5SM7gwi6U6ng/aOzSGaSK2NihlZL/oGPTeTzUhciyd@vger.kernel.org
X-Gm-Message-State: AOJu0YzIY56FpAvV8SMR5/aMkHYqlcGoLOl29e7FHSOTIwlRkWVwOM5j
	cQ0Mz0S7aVLPTuMdrva4EohRPp6j3DICIij8iyECyXYzcmiVixw3cePPjTdVnbpuex4NFunDTps
	8nY5D3dM7WlXZhv9PgOQZk+vqc1E=
X-Google-Smtp-Source: AGHT+IHqT3uZQgVbS8zzGchNicDCxaGgHK15LYaUKIzG0HK3z4buSjYRHnO51K7zWfR57fyko+u8zvaJcxJf/ibZ4E0=
X-Received: by 2002:a17:907:d40e:b0:aca:c8aa:5899 with SMTP id
 a640c23a62f3a-ad1d349bc2cmr199839966b.22.1746514643038; Mon, 05 May 2025
 23:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225090014.59067-1-clamor95@gmail.com> <20250225090014.59067-3-clamor95@gmail.com>
In-Reply-To: <20250225090014.59067-3-clamor95@gmail.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Tue, 6 May 2025 15:56:42 +0900
X-Gmail-Original-Message-ID: <CAGTfZH3qAXwB6gD4Jxb6s5QZQFE8zkAG3cPZC5KoWEaZi4fQYg@mail.gmail.com>
X-Gm-Features: ATxdqUG3o8cHQPZFii1jFBNrMYogu47ZLQun4AWci1craFWNsch5lxW3bY0GIMQ
Message-ID: <CAGTfZH3qAXwB6gD4Jxb6s5QZQFE8zkAG3cPZC5KoWEaZi4fQYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] extcon: Add basic support for Maxim MAX14526 MUIC
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 25, 2025 at 6:09=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> The MAX14526 is designed to simplify interface requirements on
> portable devices by multiplexing common inputs (USB, UART,
> Microphone, Stereo Audio and Composite Video) on a single
> micro/mini USB connector. The USB input supports Hi-Speed USB
> and the audio/video inputs feature negative rail signal
> operation allowing simple DC coupled accessories. These device
> allow a single micro/mini USB port to support all the common
> interfaces on Cellular phones and portable media players over
> the same external lines.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/extcon/Kconfig           |  12 ++
>  drivers/extcon/Makefile          |   1 +
>  drivers/extcon/extcon-max14526.c | 301 +++++++++++++++++++++++++++++++
>  3 files changed, 314 insertions(+)
>  create mode 100644 drivers/extcon/extcon-max14526.c
>
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index a6f6d467aacf..1096afc0b5bb 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -134,6 +134,18 @@ config EXTCON_MAX8997
>           Maxim MAX8997 PMIC. The MAX8997 MUIC is a USB port accessory
>           detector and switch.
>
> +config EXTCON_MAX14526
> +       tristate "Maxim MAX14526 EXTCON Support"
> +       select IRQ_DOMAIN
> +       select REGMAP_I2C
> +       help
> +         If you say yes here you get support for the Maxim MAX14526
> +         MUIC device. The MAX14526 MUIC is a USB port accessory
> +         detector and switch. The MAX14526 is designed to simplify
> +         interface requirements on portable devices by multiplexing
> +         common inputs (USB, UART, Microphone, Stereo Audio and
> +         Composite Video) on a single micro/mini USB connector.
> +
>  config EXTCON_PALMAS
>         tristate "Palmas USB EXTCON support"
>         depends on MFD_PALMAS
> diff --git a/drivers/extcon/Makefile b/drivers/extcon/Makefile
> index 0d6d23faf748..6482f2bfd661 100644
> --- a/drivers/extcon/Makefile
> +++ b/drivers/extcon/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_EXTCON_MAX3355)  +=3D extcon-max3355.o
>  obj-$(CONFIG_EXTCON_MAX77693)  +=3D extcon-max77693.o
>  obj-$(CONFIG_EXTCON_MAX77843)  +=3D extcon-max77843.o
>  obj-$(CONFIG_EXTCON_MAX8997)   +=3D extcon-max8997.o
> +obj-$(CONFIG_EXTCON_MAX14526)  +=3D extcon-max14526.o
>  obj-$(CONFIG_EXTCON_PALMAS)    +=3D extcon-palmas.o
>  obj-$(CONFIG_EXTCON_PTN5150)   +=3D extcon-ptn5150.o
>  obj-$(CONFIG_EXTCON_QCOM_SPMI_MISC) +=3D extcon-qcom-spmi-misc.o
> diff --git a/drivers/extcon/extcon-max14526.c b/drivers/extcon/extcon-max=
14526.c
> new file mode 100644
> index 000000000000..b38b20a4db47
> --- /dev/null
> +++ b/drivers/extcon/extcon-max14526.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/device.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/extcon-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +
> +/* I2C addresses of MUIC internal registers */
> +#define MAX14526_DEVICE_ID     0x00
> +#define MAX14526_ID            0x02
> +
> +/* CONTROL_1 register masks */
> +#define MAX14526_CONTROL_1     0x01
> +#define   ID_2P2               BIT(6)
> +#define   ID_620               BIT(5)
> +#define   ID_200               BIT(4)
> +#define   VLDO                 BIT(3)
> +#define   SEMREN               BIT(2)
> +#define   ADC_EN               BIT(1)
> +#define   CP_EN                        BIT(0)
> +
> +/* CONTROL_2 register masks */
> +#define MAX14526_CONTROL_2     0x02
> +#define   INTPOL               BIT(7)
> +#define   INT_EN               BIT(6)
> +#define   MIC_LP               BIT(5)
> +#define   CP_AUD               BIT(4)
> +#define   CHG_TYPE             BIT(1)
> +#define   USB_DET_DIS          BIT(0)

(snip)

> +static int max14526_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct max14526_data *priv;
> +       int ret, dev_id, rev, i;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->client =3D client;
> +       i2c_set_clientdata(client, priv);
> +
> +       priv->regmap =3D devm_regmap_init_i2c(client, &max14526_regmap_co=
nfig);
> +       if (IS_ERR(priv->regmap))
> +               return dev_err_probe(dev, PTR_ERR(priv->regmap), "cannot =
allocate regmap\n");
> +
> +       for (i =3D 0; i < MAX14526_N_REGMAP_FIELDS; i++) {
> +               priv->rfield[i] =3D devm_regmap_field_alloc(dev, priv->re=
gmap,
> +                                                         max14526_reg_fi=
eld[i]);
> +               if (IS_ERR(priv->rfield[i]))
> +                       return dev_err_probe(dev, PTR_ERR(priv->rfield[i]=
),
> +                                            "cannot allocate regmap fiel=
d\n");
> +       }
> +
> +       /* Detect if MUIC version is supported */
> +       ret =3D regmap_field_read(priv->rfield[VENDOR_ID], &dev_id);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to read MUIC ID\n"=
);
> +
> +       regmap_field_read(priv->rfield[CHIP_REV], &rev);
> +
> +       if (dev_id =3D=3D MAX14526_ID)
> +               dev_info(dev, "detected MAX14526 MUIC with id 0x%x, rev 0=
x%x\n", dev_id, rev);
> +       else
> +               dev_err_probe(dev, -EINVAL, "MUIC vendor id 0x%X is not r=
ecognized\n", dev_id);
> +
> +       priv->edev =3D devm_extcon_dev_allocate(dev, max14526_extcon_cabl=
e);
> +       if (IS_ERR(priv->edev))
> +               return dev_err_probe(dev, (IS_ERR(priv->edev)),
> +                                    "failed to allocate extcon device\n"=
);
> +
> +       ret =3D devm_extcon_dev_register(dev, priv->edev);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "failed to register extcon=
 device\n");
> +
> +       ret =3D max14526_ap_usb_mode(priv);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "failed to set AP USB mode=
\n");
> +
> +       regmap_write_bits(priv->regmap, MAX14526_CONTROL_2, INT_EN, INT_E=
N);
> +       regmap_write_bits(priv->regmap, MAX14526_CONTROL_2, USB_DET_DIS, =
~USB_DET_DIS);

When using ~USB_DET_DIS, there is overflow issue like you are received
mail from linux-next.
I'd like you to fix this issue.

I'm sorry for late reply.

(snip)

--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
