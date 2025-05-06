Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDCA17A310;
	Tue,  6 May 2025 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746515192; cv=none; b=TTdHLtcQmm2iZ06F2ZegXa3xlHSusBRs2QHqxbkLhLaZXyKwNRrMrngMkTtYE7IpUmDzW6jaajfkHObbNNi5VR85OK7LNdF5FuBrRlFykcTYqb4qEuvmLRxY/+Tas/WoL6XFMYb7J38bqTWHOpW5XIwh9RTmrT+U4YVYSBAa+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746515192; c=relaxed/simple;
	bh=BZhQEnlidpLMM/LQoGWS8B+sNx/K+LBeDIM8zBcX770=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/GapKvroMVJhgDj+7ok//uo1Q0+wblh+uu1lMYWt8a6Tx14UyEb+DXPsn514FLElHrhJY6jU+ZbVkI/ZElOyBg+yYa7v3flhGC545X5CBQfBNPl/wXR4vJJ1fh5pQ8ArilCIDrIxMh6tKmMasjWNpmHttXd6MH3VGm29pwgMK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwlEGhJE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwlEGhJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FC5C4CEEB;
	Tue,  6 May 2025 07:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746515192;
	bh=BZhQEnlidpLMM/LQoGWS8B+sNx/K+LBeDIM8zBcX770=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MwlEGhJEElVu7rwvQ2PGMf5/pCG2dI71H0WfCeliNX5JljbqeZEQuZsw42BgNqBAe
	 E95E8q8q7gs1MFdWGGBaXs3rHrcIbdnTG3MFcW34yEF0eb2xALMkuARTIKgjA8NePt
	 NnnbBFg0woEHcHb9kTsinD4V9oyZvhEVUzIzjZaq0r+T85bGZ9h/DMCsR5cf2yTvok
	 waELJZJ+zBH4bWlayMQfIrMGGqscyEhXKWMJCEtUx6CumEOz/8vC7SJYdljH0rLiQS
	 XlBLc+nPk0ECmxv+IjJYWNRG6wKver0iretstTr37w8bIOxavYiw87kEE6Qb/CMsCp
	 wR1afV/KZ8cNg==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6062e41916dso2571001eaf.1;
        Tue, 06 May 2025 00:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPlYeWeKN65GaFgyf2LML0LUTAU/UmkFbvzXrVh3A2Xqmkz/YNa3LCSl6gHskWRaR3aiO32ukZNwdf@vger.kernel.org, AJvYcCXcgp+x/w/DcsZQf0kabICLvy+obhvH0ie6cUzISC4bUL9DGJxOU5iXxXp9PPXoszgbMUqszd7xOtg7Jtlp@vger.kernel.org
X-Gm-Message-State: AOJu0YxiRw7SSD/OoFdSnRtNzNiRaSDqT6R5ij6cluY7tRdV3illLcQt
	ZJAkAdVOkFJn3ofT5u/PPKO5rrvYrYZ2pIZmbtNBqb9udfaNnGRWfNw6wWI6reV18luQPoQzI4u
	BDmotmelEkiKy6NIJ11u3KH+w+9o=
X-Google-Smtp-Source: AGHT+IEEbGCWuSuq7dSnhkxYB2/2rNvzJlYZ9dokNlKOGB/hp03hIE8cx+K6ibVRjQKkJuFm/Q4xHDBT8Uvbl9bxxAI=
X-Received: by 2002:a05:6870:e414:b0:2c2:3ea8:eb3d with SMTP id
 586e51a60fabf-2db39143342mr1213451fac.33.1746515191675; Tue, 06 May 2025
 00:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225090014.59067-1-clamor95@gmail.com> <20250225090014.59067-3-clamor95@gmail.com>
 <CAGTfZH3qAXwB6gD4Jxb6s5QZQFE8zkAG3cPZC5KoWEaZi4fQYg@mail.gmail.com> <CAPVz0n0+KodZkd=45Y4C9wncf+b0D1irUn+X1L6E42o4qq7oXg@mail.gmail.com>
In-Reply-To: <CAPVz0n0+KodZkd=45Y4C9wncf+b0D1irUn+X1L6E42o4qq7oXg@mail.gmail.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Tue, 6 May 2025 16:05:54 +0900
X-Gmail-Original-Message-ID: <CAGTfZH3iqQ6=ispLmX8nzG3S4JjrtFcOis3+55VCVyp83FwkAQ@mail.gmail.com>
X-Gm-Features: ATxdqUGvNBy_L1CY3NqYRgLxfGVeg7CuV0bWWS5nOsb_viCZDmy-1nQeeO2bqXM
Message-ID: <CAGTfZH3iqQ6=ispLmX8nzG3S4JjrtFcOis3+55VCVyp83FwkAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] extcon: Add basic support for Maxim MAX14526 MUIC
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 4:02=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:
>
> =D0=B2=D1=82, 6 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 09:=
57 Chanwoo Choi <chanwoo@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi,
> >
> > On Tue, Feb 25, 2025 at 6:09=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmai=
l.com> wrote:
> > >
> > > The MAX14526 is designed to simplify interface requirements on
> > > portable devices by multiplexing common inputs (USB, UART,
> > > Microphone, Stereo Audio and Composite Video) on a single
> > > micro/mini USB connector. The USB input supports Hi-Speed USB
> > > and the audio/video inputs feature negative rail signal
> > > operation allowing simple DC coupled accessories. These device
> > > allow a single micro/mini USB port to support all the common
> > > interfaces on Cellular phones and portable media players over
> > > the same external lines.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/extcon/Kconfig           |  12 ++
> > >  drivers/extcon/Makefile          |   1 +
> > >  drivers/extcon/extcon-max14526.c | 301 +++++++++++++++++++++++++++++=
++
> > >  3 files changed, 314 insertions(+)
> > >  create mode 100644 drivers/extcon/extcon-max14526.c
> > >
> > > diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> > > index a6f6d467aacf..1096afc0b5bb 100644
> > > --- a/drivers/extcon/Kconfig
> > > +++ b/drivers/extcon/Kconfig
> > > @@ -134,6 +134,18 @@ config EXTCON_MAX8997
> > >           Maxim MAX8997 PMIC. The MAX8997 MUIC is a USB port accessor=
y
> > >           detector and switch.
> > >
> > > +config EXTCON_MAX14526
> > > +       tristate "Maxim MAX14526 EXTCON Support"
> > > +       select IRQ_DOMAIN
> > > +       select REGMAP_I2C
> > > +       help
> > > +         If you say yes here you get support for the Maxim MAX14526
> > > +         MUIC device. The MAX14526 MUIC is a USB port accessory
> > > +         detector and switch. The MAX14526 is designed to simplify
> > > +         interface requirements on portable devices by multiplexing
> > > +         common inputs (USB, UART, Microphone, Stereo Audio and
> > > +         Composite Video) on a single micro/mini USB connector.
> > > +
> > >  config EXTCON_PALMAS
> > >         tristate "Palmas USB EXTCON support"
> > >         depends on MFD_PALMAS
> > > diff --git a/drivers/extcon/Makefile b/drivers/extcon/Makefile
> > > index 0d6d23faf748..6482f2bfd661 100644
> > > --- a/drivers/extcon/Makefile
> > > +++ b/drivers/extcon/Makefile
> > > @@ -18,6 +18,7 @@ obj-$(CONFIG_EXTCON_MAX3355)  +=3D extcon-max3355.o
> > >  obj-$(CONFIG_EXTCON_MAX77693)  +=3D extcon-max77693.o
> > >  obj-$(CONFIG_EXTCON_MAX77843)  +=3D extcon-max77843.o
> > >  obj-$(CONFIG_EXTCON_MAX8997)   +=3D extcon-max8997.o
> > > +obj-$(CONFIG_EXTCON_MAX14526)  +=3D extcon-max14526.o
> > >  obj-$(CONFIG_EXTCON_PALMAS)    +=3D extcon-palmas.o
> > >  obj-$(CONFIG_EXTCON_PTN5150)   +=3D extcon-ptn5150.o
> > >  obj-$(CONFIG_EXTCON_QCOM_SPMI_MISC) +=3D extcon-qcom-spmi-misc.o
> > > diff --git a/drivers/extcon/extcon-max14526.c b/drivers/extcon/extcon=
-max14526.c
> > > new file mode 100644
> > > index 000000000000..b38b20a4db47
> > > --- /dev/null
> > > +++ b/drivers/extcon/extcon-max14526.c
> > > @@ -0,0 +1,301 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +#include <linux/device.h>
> > > +#include <linux/devm-helpers.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/err.h>
> > > +#include <linux/extcon-provider.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/module.h>
> > > +#include <linux/pm.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +/* I2C addresses of MUIC internal registers */
> > > +#define MAX14526_DEVICE_ID     0x00
> > > +#define MAX14526_ID            0x02
> > > +
> > > +/* CONTROL_1 register masks */
> > > +#define MAX14526_CONTROL_1     0x01
> > > +#define   ID_2P2               BIT(6)
> > > +#define   ID_620               BIT(5)
> > > +#define   ID_200               BIT(4)
> > > +#define   VLDO                 BIT(3)
> > > +#define   SEMREN               BIT(2)
> > > +#define   ADC_EN               BIT(1)
> > > +#define   CP_EN                        BIT(0)
> > > +
> > > +/* CONTROL_2 register masks */
> > > +#define MAX14526_CONTROL_2     0x02
> > > +#define   INTPOL               BIT(7)
> > > +#define   INT_EN               BIT(6)
> > > +#define   MIC_LP               BIT(5)
> > > +#define   CP_AUD               BIT(4)
> > > +#define   CHG_TYPE             BIT(1)
> > > +#define   USB_DET_DIS          BIT(0)
> >
> > (snip)
> >
> > > +static int max14526_probe(struct i2c_client *client)
> > > +{
> > > +       struct device *dev =3D &client->dev;
> > > +       struct max14526_data *priv;
> > > +       int ret, dev_id, rev, i;
> > > +
> > > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +       if (!priv)
> > > +               return -ENOMEM;
> > > +
> > > +       priv->client =3D client;
> > > +       i2c_set_clientdata(client, priv);
> > > +
> > > +       priv->regmap =3D devm_regmap_init_i2c(client, &max14526_regma=
p_config);
> > > +       if (IS_ERR(priv->regmap))
> > > +               return dev_err_probe(dev, PTR_ERR(priv->regmap), "can=
not allocate regmap\n");
> > > +
> > > +       for (i =3D 0; i < MAX14526_N_REGMAP_FIELDS; i++) {
> > > +               priv->rfield[i] =3D devm_regmap_field_alloc(dev, priv=
->regmap,
> > > +                                                         max14526_re=
g_field[i]);
> > > +               if (IS_ERR(priv->rfield[i]))
> > > +                       return dev_err_probe(dev, PTR_ERR(priv->rfiel=
d[i]),
> > > +                                            "cannot allocate regmap =
field\n");
> > > +       }
> > > +
> > > +       /* Detect if MUIC version is supported */
> > > +       ret =3D regmap_field_read(priv->rfield[VENDOR_ID], &dev_id);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "failed to read MUIC I=
D\n");
> > > +
> > > +       regmap_field_read(priv->rfield[CHIP_REV], &rev);
> > > +
> > > +       if (dev_id =3D=3D MAX14526_ID)
> > > +               dev_info(dev, "detected MAX14526 MUIC with id 0x%x, r=
ev 0x%x\n", dev_id, rev);
> > > +       else
> > > +               dev_err_probe(dev, -EINVAL, "MUIC vendor id 0x%X is n=
ot recognized\n", dev_id);
> > > +
> > > +       priv->edev =3D devm_extcon_dev_allocate(dev, max14526_extcon_=
cable);
> > > +       if (IS_ERR(priv->edev))
> > > +               return dev_err_probe(dev, (IS_ERR(priv->edev)),
> > > +                                    "failed to allocate extcon devic=
e\n");
> > > +
> > > +       ret =3D devm_extcon_dev_register(dev, priv->edev);
> > > +       if (ret < 0)
> > > +               return dev_err_probe(dev, ret, "failed to register ex=
tcon device\n");
> > > +
> > > +       ret =3D max14526_ap_usb_mode(priv);
> > > +       if (ret < 0)
> > > +               return dev_err_probe(dev, ret, "failed to set AP USB =
mode\n");
> > > +
> > > +       regmap_write_bits(priv->regmap, MAX14526_CONTROL_2, INT_EN, I=
NT_EN);
> > > +       regmap_write_bits(priv->regmap, MAX14526_CONTROL_2, USB_DET_D=
IS, ~USB_DET_DIS);
> >
> > When using ~USB_DET_DIS, there is overflow issue like you are received
> > mail from linux-next.
> > I'd like you to fix this issue.
> >
> > I'm sorry for late reply.
> >
>
> It should not matter because register bit size is 8 bit anyway.

There is issue on linux-next build (x86_64, allmodconfig).
You can check the failure details on 'linux-next: build failure after
merge of the extcon tree' mail title.
If there is build issue when merging it into linux-next.git, it will
happen on linux.git mainline git.

It should support all arch build.

--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
