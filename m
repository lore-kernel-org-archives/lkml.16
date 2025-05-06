Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8D182;
	Tue,  6 May 2025 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746515280; cv=none; b=U2zSceGcHZNXqSzdoiHR8K/IMJR/4MeY8wPYpf+SVH2h8Js1dHSy8yifv0fDcw6TEtyeC/UTsP64qywNqoRsvlD3nVLrYyePKaRDc4dGrlcf1yXZVrlwzazMzb+jwhavBkpjh5kgvagxpwblthVcHtcJ+kz9Fw1iCdV7362ITYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746515280; c=relaxed/simple;
	bh=m84rQNfv+wPSyuAqrTVmuLPCWHgXeR+DHuszDBQaqX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcA1rGEwhEgehNCOsQqT2V4xOiMklBasiwTwQ4j2oDl7SqLJkkj8rMcQ61zqyV4CJEB/E95yLPRRK+Mkme3/jPZKKiW79lDJj4B49+aG0IIWcEetHXmsgQucHvqkwbqlwJ//s+9w/avZJlJLs54yZdAkK7VNjgfqbgamZUzQ5SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoI+dzxQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoI+dzxQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so5057339f8f.1;
        Tue, 06 May 2025 00:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746515276; x=1747120076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZppS/C81ITAy/9mKqeaCCmAzUcnHEK99Z47iW8mUao=;
        b=BoI+dzxQzHiRprkOvdyrWOoSW3AxcgqqFWCzFNMsUSkr7Qz+rxs1N6bwHCK1S/70wI
         EUMS4Zgaysu6Q96THe4rvzL3B2qAv9UaN/GWWH5mkyl24qQgxTlVP1Ocj0eviPVS2xVG
         qVlGg+2F7Lhnt+1QLQcCLBEfZkvQl9TT1hLDQsotLxw1EiZJdDowOsrHU7FDHK8cPQNB
         vc8uNUgmtStdawJ4f+bwNFpurPavfYDjOAvYCRLHSpjFdoWmgNprrBVMzIytqi4E47Ep
         voEVQCZJARUkn8//2PlRzn3FT2lD9sIzcUbLipTUDl7ha2s8HnSi5g8lSlutaaL4NUQe
         UyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746515276; x=1747120076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZppS/C81ITAy/9mKqeaCCmAzUcnHEK99Z47iW8mUao=;
        b=VjrRYU/izUJYl4Oo1bbLGhuoVHgYMK4I9s6dn536XSUxWABjQiGP6/YmtbH8sTsVH1
         +zGKrG6ENippMvD3ay6N+7sYVWJtPr1/WoyksKsqqF74Ddony/0LB0q3EnpsopT99p2j
         kBU5QUBvf8yXEFXWU14alK4utjS6oVY2Q+WLgz2FrOzDZgjKBAqy5U2YpimjoWlMZlrb
         vHd0ZycSMKvQ4IqDSA1sLXCqc+ymAuEFiBr9n0zniRweVRlWuyu/kBQg5XCnAu54mJnZ
         5HjdyIyk66qvgtKRhDlePNaoSHnYDUueC324Rxb2LKQY9TqtjbMQFBMgqEeejZWwn4NA
         rK8A==
X-Forwarded-Encrypted: i=1; AJvYcCV/KD+ZBciX1WyLnFqtkySgFADR9OO1DOMwYx0mRoeZE3GCaDUpE3W+FNcD9DMJfEI0H7wit21n20ab@vger.kernel.org, AJvYcCVaP1ar7bqwL1/ZydEO8kOj1oLfYHK0ZauRilqzX5UCuMCBqRl4uLLidjafrtLvJd9XMff18bz2FkQHQ7Eb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8xyyAS0g8Wrf3RU5L80K6AlYziQVkv3EaxlfRenJ4qbsNJe7f
	v9AhOk6JaGxvGqJ4ipIKxx+1/eZXv3X1utQ2vtoJ5CoZWc76lVPRnnNcGX61Gn1YNL92tArEZ2J
	1UwslNTi6uOG6AhzKXOlu9tuQ0UJ5Hw==
X-Gm-Gg: ASbGncsJxV6E+IcGNXnIc9QI+aG+WAe5fUXoWXGu5INFqpQwSI8Z4ytHQCGWjiLwQQq
	IRZ2ACwtg3+HWdHMtEFcWhT2UQHbnwimlJUyIVUlrvNt4GtaV+MXfaBCMr5an3/+bg1UuD/46Ct
	Z0/F2n6/hfybhx7iD6C+r23sx3aWjDRi1j+A==
X-Google-Smtp-Source: AGHT+IFDzyXw8/9RCoAw/RXTetVEAfjvn26sflNNARjdcgsvPC0V7HJxDwE1X1+tKuuKfPuRWfKt9sT2qyWnSY0I03k=
X-Received: by 2002:a05:6000:40e1:b0:3a0:82f2:3094 with SMTP id
 ffacd0b85a97d-3a0ac3eb250mr1223830f8f.50.1746515275969; Tue, 06 May 2025
 00:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225090014.59067-1-clamor95@gmail.com> <20250225090014.59067-3-clamor95@gmail.com>
 <CAGTfZH3qAXwB6gD4Jxb6s5QZQFE8zkAG3cPZC5KoWEaZi4fQYg@mail.gmail.com>
 <CAPVz0n0+KodZkd=45Y4C9wncf+b0D1irUn+X1L6E42o4qq7oXg@mail.gmail.com> <CAGTfZH3iqQ6=ispLmX8nzG3S4JjrtFcOis3+55VCVyp83FwkAQ@mail.gmail.com>
In-Reply-To: <CAGTfZH3iqQ6=ispLmX8nzG3S4JjrtFcOis3+55VCVyp83FwkAQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 6 May 2025 10:07:44 +0300
X-Gm-Features: ATxdqUFQj-HmZ7bS66_Z5jT8mBtT4cxwlntSesBfZAMkw2G0svCDsWucjE32P6k
Message-ID: <CAPVz0n34i4bUcfwbneHz4AS66Tnz+b2N2O9DJruFBY2KFKkttw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] extcon: Add basic support for Maxim MAX14526 MUIC
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 6 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 10:06=
 Chanwoo Choi <chanwoo@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, May 6, 2025 at 4:02=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
> >
> > =D0=B2=D1=82, 6 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 0=
9:57 Chanwoo Choi <chanwoo@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Hi,
> > >
> > > On Tue, Feb 25, 2025 at 6:09=E2=80=AFPM Svyatoslav Ryhel <clamor95@gm=
ail.com> wrote:
> > > >
> > > > The MAX14526 is designed to simplify interface requirements on
> > > > portable devices by multiplexing common inputs (USB, UART,
> > > > Microphone, Stereo Audio and Composite Video) on a single
> > > > micro/mini USB connector. The USB input supports Hi-Speed USB
> > > > and the audio/video inputs feature negative rail signal
> > > > operation allowing simple DC coupled accessories. These device
> > > > allow a single micro/mini USB port to support all the common
> > > > interfaces on Cellular phones and portable media players over
> > > > the same external lines.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/extcon/Kconfig           |  12 ++
> > > >  drivers/extcon/Makefile          |   1 +
> > > >  drivers/extcon/extcon-max14526.c | 301 +++++++++++++++++++++++++++=
++++
> > > >  3 files changed, 314 insertions(+)
> > > >  create mode 100644 drivers/extcon/extcon-max14526.c
> > > >
> > > > diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> > > > index a6f6d467aacf..1096afc0b5bb 100644
> > > > --- a/drivers/extcon/Kconfig
> > > > +++ b/drivers/extcon/Kconfig
> > > > @@ -134,6 +134,18 @@ config EXTCON_MAX8997
> > > >           Maxim MAX8997 PMIC. The MAX8997 MUIC is a USB port access=
ory
> > > >           detector and switch.
> > > >
> > > > +config EXTCON_MAX14526
> > > > +       tristate "Maxim MAX14526 EXTCON Support"
> > > > +       select IRQ_DOMAIN
> > > > +       select REGMAP_I2C
> > > > +       help
> > > > +         If you say yes here you get support for the Maxim MAX1452=
6
> > > > +         MUIC device. The MAX14526 MUIC is a USB port accessory
> > > > +         detector and switch. The MAX14526 is designed to simplify
> > > > +         interface requirements on portable devices by multiplexin=
g
> > > > +         common inputs (USB, UART, Microphone, Stereo Audio and
> > > > +         Composite Video) on a single micro/mini USB connector.
> > > > +
> > > >  config EXTCON_PALMAS
> > > >         tristate "Palmas USB EXTCON support"
> > > >         depends on MFD_PALMAS
> > > > diff --git a/drivers/extcon/Makefile b/drivers/extcon/Makefile
> > > > index 0d6d23faf748..6482f2bfd661 100644
> > > > --- a/drivers/extcon/Makefile
> > > > +++ b/drivers/extcon/Makefile
> > > > @@ -18,6 +18,7 @@ obj-$(CONFIG_EXTCON_MAX3355)  +=3D extcon-max3355=
.o
> > > >  obj-$(CONFIG_EXTCON_MAX77693)  +=3D extcon-max77693.o
> > > >  obj-$(CONFIG_EXTCON_MAX77843)  +=3D extcon-max77843.o
> > > >  obj-$(CONFIG_EXTCON_MAX8997)   +=3D extcon-max8997.o
> > > > +obj-$(CONFIG_EXTCON_MAX14526)  +=3D extcon-max14526.o
> > > >  obj-$(CONFIG_EXTCON_PALMAS)    +=3D extcon-palmas.o
> > > >  obj-$(CONFIG_EXTCON_PTN5150)   +=3D extcon-ptn5150.o
> > > >  obj-$(CONFIG_EXTCON_QCOM_SPMI_MISC) +=3D extcon-qcom-spmi-misc.o
> > > > diff --git a/drivers/extcon/extcon-max14526.c b/drivers/extcon/extc=
on-max14526.c
> > > > new file mode 100644
> > > > index 000000000000..b38b20a4db47
> > > > --- /dev/null
> > > > +++ b/drivers/extcon/extcon-max14526.c
> > > > @@ -0,0 +1,301 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +#include <linux/device.h>
> > > > +#include <linux/devm-helpers.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/extcon-provider.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/mod_devicetable.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/pm.h>
> > > > +#include <linux/regmap.h>
> > > > +
> > > > +/* I2C addresses of MUIC internal registers */
> > > > +#define MAX14526_DEVICE_ID     0x00
> > > > +#define MAX14526_ID            0x02
> > > > +
> > > > +/* CONTROL_1 register masks */
> > > > +#define MAX14526_CONTROL_1     0x01
> > > > +#define   ID_2P2               BIT(6)
> > > > +#define   ID_620               BIT(5)
> > > > +#define   ID_200               BIT(4)
> > > > +#define   VLDO                 BIT(3)
> > > > +#define   SEMREN               BIT(2)
> > > > +#define   ADC_EN               BIT(1)
> > > > +#define   CP_EN                        BIT(0)
> > > > +
> > > > +/* CONTROL_2 register masks */
> > > > +#define MAX14526_CONTROL_2     0x02
> > > > +#define   INTPOL               BIT(7)
> > > > +#define   INT_EN               BIT(6)
> > > > +#define   MIC_LP               BIT(5)
> > > > +#define   CP_AUD               BIT(4)
> > > > +#define   CHG_TYPE             BIT(1)
> > > > +#define   USB_DET_DIS          BIT(0)
> > >
> > > (snip)
> > >
> > > > +static int max14526_probe(struct i2c_client *client)
> > > > +{
> > > > +       struct device *dev =3D &client->dev;
> > > > +       struct max14526_data *priv;
> > > > +       int ret, dev_id, rev, i;
> > > > +
> > > > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > +       if (!priv)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       priv->client =3D client;
> > > > +       i2c_set_clientdata(client, priv);
> > > > +
> > > > +       priv->regmap =3D devm_regmap_init_i2c(client, &max14526_reg=
map_config);
> > > > +       if (IS_ERR(priv->regmap))
> > > > +               return dev_err_probe(dev, PTR_ERR(priv->regmap), "c=
annot allocate regmap\n");
> > > > +
> > > > +       for (i =3D 0; i < MAX14526_N_REGMAP_FIELDS; i++) {
> > > > +               priv->rfield[i] =3D devm_regmap_field_alloc(dev, pr=
iv->regmap,
> > > > +                                                         max14526_=
reg_field[i]);
> > > > +               if (IS_ERR(priv->rfield[i]))
> > > > +                       return dev_err_probe(dev, PTR_ERR(priv->rfi=
eld[i]),
> > > > +                                            "cannot allocate regma=
p field\n");
> > > > +       }
> > > > +
> > > > +       /* Detect if MUIC version is supported */
> > > > +       ret =3D regmap_field_read(priv->rfield[VENDOR_ID], &dev_id)=
;
> > > > +       if (ret)
> > > > +               return dev_err_probe(dev, ret, "failed to read MUIC=
 ID\n");
> > > > +
> > > > +       regmap_field_read(priv->rfield[CHIP_REV], &rev);
> > > > +
> > > > +       if (dev_id =3D=3D MAX14526_ID)
> > > > +               dev_info(dev, "detected MAX14526 MUIC with id 0x%x,=
 rev 0x%x\n", dev_id, rev);
> > > > +       else
> > > > +               dev_err_probe(dev, -EINVAL, "MUIC vendor id 0x%X is=
 not recognized\n", dev_id);
> > > > +
> > > > +       priv->edev =3D devm_extcon_dev_allocate(dev, max14526_extco=
n_cable);
> > > > +       if (IS_ERR(priv->edev))
> > > > +               return dev_err_probe(dev, (IS_ERR(priv->edev)),
> > > > +                                    "failed to allocate extcon dev=
ice\n");
> > > > +
> > > > +       ret =3D devm_extcon_dev_register(dev, priv->edev);
> > > > +       if (ret < 0)
> > > > +               return dev_err_probe(dev, ret, "failed to register =
extcon device\n");
> > > > +
> > > > +       ret =3D max14526_ap_usb_mode(priv);
> > > > +       if (ret < 0)
> > > > +               return dev_err_probe(dev, ret, "failed to set AP US=
B mode\n");
> > > > +
> > > > +       regmap_write_bits(priv->regmap, MAX14526_CONTROL_2, INT_EN,=
 INT_EN);
> > > > +       regmap_write_bits(priv->regmap, MAX14526_CONTROL_2, USB_DET=
_DIS, ~USB_DET_DIS);
> > >
> > > When using ~USB_DET_DIS, there is overflow issue like you are receive=
d
> > > mail from linux-next.
> > > I'd like you to fix this issue.
> > >
> > > I'm sorry for late reply.
> > >
> >
> > It should not matter because register bit size is 8 bit anyway.
>
> There is issue on linux-next build (x86_64, allmodconfig).
> You can check the failure details on 'linux-next: build failure after
> merge of the extcon tree' mail title.
> If there is build issue when merging it into linux-next.git, it will
> happen on linux.git mainline git.
>
> It should support all arch build.
>

ok, fine, I will send v3 within a few hours.

> --
> Best Regards,
> Chanwoo Choi
> Samsung Electronics
