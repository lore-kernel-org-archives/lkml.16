Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB8298992;
	Thu,  3 Jul 2025 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527460; cv=none; b=MaZMhzOWjIZjQiGlP5sa9HN/4y2IpmBI/lxX6fE62KOnGbN20moG+d605soJQ/SbthKwPVUJXhSybVFkf3t0xl3Cu73EqZdcpaeoMDuwkIf2KHBzW9tBnIZAII9DBoGVKdU+aqYr2QL89mmE1an6mCe0nd3D772ShewXJZHGNtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527460; c=relaxed/simple;
	bh=WJLEHzPhZDh1aMPPDzsVjVYMXY1D03/jWiVIudvqUaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5LNKF4TbglUocGhi5vp/tjjoLCjkhvh1EfMG8W1Q163bzIL4G/vRFiZiGYlFH8kTHRcNrQqqdz0yuHOQeXMR3ajC7rD3vbUPe+n1Rfp4qhqR3XN1x4GgMGIGiFYd0San6igwguCdSoP2Ie8MXWM4lddQpq99u67RbD99bWKXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLjrqd0v; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLjrqd0v"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234bfe37cccso93379725ad.0;
        Thu, 03 Jul 2025 00:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751527457; x=1752132257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZZaxoWN1XxNyra6btHNimAGgXQoxpefWk9ygjfRZq8=;
        b=WLjrqd0vd1hmacPBQbaR5ism3+iPFgFUHLQCp/41vBCsVW74o9X17TSnPNrm0FuCtM
         7GMOM9zXv+jrIkg/AbKRfNDWwAy9fYOL9kCAXlCocy6iEcqjO4o4rVdiPEecSBSXzs8O
         JgoTsYd6mC/3sRK1USySDly0nKeYfMy+bcgdoEII8paafNMVAIELH3qVKWCIBLyC/FSz
         bUC6YzGqxCiHSspg5H4QFsTlm9OMu62B7O76uJi6V97SFfYjkP4idRVLQGbYWci7nG/z
         T4touBKAYyIiS2eEk4NIrqHasSVIo6RcO8e7OoidWjXJj79q8lXNpZdQOli+2n196Z4m
         Nmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751527457; x=1752132257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZZaxoWN1XxNyra6btHNimAGgXQoxpefWk9ygjfRZq8=;
        b=HfQfWbjtfqTJA8MKjDcqKhpCbpngRiYwEI4xydP+RyFHWCczCx7fhM2mOlV3vAWF4p
         4PEaPGpcNfBLkmUdS/6IJHbZZzMyFNA152n4LL0DvKtzvprIW99il+mQq9XuCWDDv75O
         ay0JMN+U86oAs3RZ+/C7Zf672qIn1RugzEGe6UioBQnE8rE86lcg4gdBnuhB8bPhlmYj
         Hw3V3BHPOuQiyld3IHsr+VYZkRsquYOaOQ2Li2DX1FUtp5S2nhH4BdLyI6nhX3A3Wtuc
         /64VrvcybQN5TBtOjBhL4wJ+pqDso9ak9NfcaJ5Ws+l5KHBwcxreLC13XpvwHwxJx4gD
         4PKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2UcFxYr5j0kvTsiXaj2my7uT9kcQcnYIE9+87xPGNw98CaKoYQswUR9Lc5BDM9whBCd1ZJWHCxeao@vger.kernel.org, AJvYcCVHphwr9NizhhBJ5KDav8heNnZxWu/KCY51FbGU4JCSa/IL+Ur6+31kRifbTxHCQJ1Xj5h2UwLoiDj0Ozhs@vger.kernel.org, AJvYcCWNwGpmzuVO/V86vxSPVtK1ozQNa38kSfTnDlpeKWT4aX+l5T8rwTo/EfgX9l8qkUR6N+RNTFNVxqOr@vger.kernel.org, AJvYcCWuEK6AhMvBhwWfpeBMVZ63qNqN2zJ7FXMQnSIi5LUG4PBukGuwNmDWoWMsorD0Nov8KOix3xKwb6cN+Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6a/sDeLvP0iisRFQPvdXQl9Grgn8fEJCP6j4d0W6GCVAkahsG
	QJI3yTFv2b2fpETPtn0JD+eZE96PQSb6NpYXw0HjhDYEIj+teSKtz801/ugMeWVus8lIJEdC7MT
	aGueYnhPr5GTozhu7TJ6xAFb2pXQVHdc=
X-Gm-Gg: ASbGncvvPaKQtl/NfXToW55afec3SGaKBEvCT/o0T/lY3PYsGbRDegN8xVMMNOZUhm+
	H8PXP4TtkvooYt3G/xvt6XptqOPSEZLQoVcqG+1wTodf1+xKY1ORtxxE5Kwr96oIalGZoD4Eqve
	MkW5SrUK+AiAO1CvShpWsaK3cskJoZ01Bfs5P3jxB3je2MwJAy+eis4LOOi79nogohxwVpiAvSa
	e8R9w==
X-Google-Smtp-Source: AGHT+IF28fFcL3kA1Qy1yVcrpwE17885PTMHu9rL782xmHXWhb0YeL6AEK3v2HVl99elK+5eBueNmgn9JS9Nd+qs8eo=
X-Received: by 2002:a17:90b:3d8d:b0:311:c1ec:7cfd with SMTP id
 98e67ed59e1d1-31a9d5fca26mr2667954a91.26.1751527456465; Thu, 03 Jul 2025
 00:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701181228.1196102-1-noltari@gmail.com> <20250701181228.1196102-4-noltari@gmail.com>
 <c893384d-4134-4510-be87-11a2c9ba6cc7@kernel.org>
In-Reply-To: <c893384d-4134-4510-be87-11a2c9ba6cc7@kernel.org>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Thu, 3 Jul 2025 09:23:41 +0200
X-Gm-Features: Ac12FXy7Bx2Ud6y2WomMeTcjhRCrIugUHxmaFJYaDrcW-MJHrrtRBmkoU2KYevw
Message-ID: <CAKR-sGeSPHu5DiFL2sX=SdET_jzbepo30qguscUjzYkX-Aub0Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: hwmon: add EMC2101 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

El mi=C3=A9, 2 jul 2025 a las 10:35, Krzysztof Kozlowski
(<krzk@kernel.org>) escribi=C3=B3:
>
> On 01/07/2025 20:12, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> > The Microchip EMC2101 is a SMBus 2.0 fan controller with temperature
> > monitoring.
> > It supports up to 1 fan, 1 internal temperature sensor, 1 external
> > temperature sensor and an 8 entry look up table to create a
> > programmable temperature response.
> >
> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > ---
> >  drivers/hwmon/Kconfig   |   10 +
> >  drivers/hwmon/Makefile  |    1 +
> >  drivers/hwmon/emc2101.c | 2175 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 2186 insertions(+)
> >  create mode 100644 drivers/hwmon/emc2101.c
> >
> >  v2: multiple improvements:
> >   - Remove FAN_RPM_MIN definition.
> >   - Rename FAN_FALSE_READ to FAN_MIN_READ.
> >   - pwm_auto_point_temp_hyst_store(): simplify function.
> >   - emc2101_fan_min_read(): add missing FAN_MIN_READ condition.
> >   - emc2101_fan_min_write(): fix tach_count calculation.
> >   - emc2101_init(): fix REG_TACH_MIN value.
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 079620dd4286..360b9f66275c 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -2002,6 +2002,16 @@ config SENSORS_EMC1403
> >         Threshold values can be configured using sysfs.
> >         Data from the different diodes are accessible via sysfs.
> >
> > +config SENSORS_EMC2101
> > +     tristate "SMSC EMC2101"
> > +     depends on I2C
> > +     help
> > +       If you say yes here you get support for the SMSC EMC2101
> > +       fan controller chips.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called emc2101.
> > +
> >  config SENSORS_EMC2103
> >       tristate "SMSC EMC2103"
> >       depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 48e5866c0c9a..70e95096c6f2 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -73,6 +73,7 @@ obj-$(CONFIG_SENSORS_DRIVETEMP)     +=3D drivetemp.o
> >  obj-$(CONFIG_SENSORS_DS620)  +=3D ds620.o
> >  obj-$(CONFIG_SENSORS_DS1621) +=3D ds1621.o
> >  obj-$(CONFIG_SENSORS_EMC1403)        +=3D emc1403.o
> > +obj-$(CONFIG_SENSORS_EMC2101)        +=3D emc2101.o
> >  obj-$(CONFIG_SENSORS_EMC2103)        +=3D emc2103.o
> >  obj-$(CONFIG_SENSORS_EMC2305)        +=3D emc2305.o
> >  obj-$(CONFIG_SENSORS_EMC6W201)       +=3D emc6w201.o
> > diff --git a/drivers/hwmon/emc2101.c b/drivers/hwmon/emc2101.c
> > new file mode 100644
> > index 000000000000..65f2eff27aaf
> > --- /dev/null
> > +++ b/drivers/hwmon/emc2101.c
> > @@ -0,0 +1,2176 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Driver for Microchip EMC2101 fan controller.
> > + *
> > + * Copyright 2025 =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include <linux/util_macros.h>
> > +
> > +#define REG_TEMP_INT                 0x00
> > +#define REG_TEMP_EXT_HI                      0x01
> > +#define REG_STATUS                   0x02
> > +#define  ADC_BUSY                    BIT(7)
> > +#define  TEMP_INT_HIGH                       BIT(6)
> > +#define  EEPROM_ERROR                        BIT(5)
> > +#define  TEMP_EXT_HIGH                       BIT(4)
> > +#define  TEMP_EXT_LOW                        BIT(3)
> > +#define  TEMP_EXT_FAULT                      BIT(2)
> > +#define  TEMP_EXT_CRIT                       BIT(1)
> > +#define  TACH_LOW                    BIT(0)
> > +#define REG_CONFIG                   0x03
> > +#define  ALERT_IRQ_ACK                       BIT(7)
> > +#define  FAN_STANDBY_ENABLE          BIT(6)
> > +#define  FAN_STANDBY_MODE            BIT(5)
> > +#define  FAN_MODE_DAC                        BIT(4)
> > +#define  SMBUS_TOUT_DISABLE          BIT(3)
> > +#define  PIN_FUNC_TACH                       BIT(2)
> > +#define  TEMP_EXT_CRIT_UNLOCK                BIT(1)
> > +#define  PIN_ASSERT_3_EXC            BIT(0)
> > +#define REG_CONV_RATE                        0x04
> > +#define  CONV_RATE_MASK                      0xf
> > +#define REG_TEMP_INT_MAX             0x05
> > +#define REG_TEMP_EXT_MAX_HI          0x07
> > +#define REG_TEMP_EXT_MIN_HI          0x08
> > +#define REG_TEMP_EXT_FORCE           0x0c
> > +#define REG_ONE_SHOT                 0x0f
> > +#define REG_TEMP_EXT_LO                      0x10
> > +#define REG_SCRATCHPAD_1             0x11
> > +#define REG_SCRATCHPAD_2             0x12
> > +#define REG_TEMP_EXT_MAX_LO          0x13
> > +#define REG_TEMP_EXT_MIN_LO          0x14
> > +#define REG_ALERT_MASK                       0x16
> > +#define  IRQ_TEMP_INT_MAX_DISABLE    BIT(6)
> > +#define  IRQ_TEMP_EXT_MAX_DISABLE    BIT(4)
> > +#define  IRQ_TEMP_EXT_MIN_DISABLE    BIT(3)
> > +#define  IRQ_TEMP_EXT_CRIT_DISABLE   BIT(1)
> > +#define  IRQ_TACH_MIN_DISABLE                BIT(0)
> > +#define REG_EXT_IDEALITY             0x17
> > +#define  EXT_IDEALITY_START          9846
> > +#define  EXT_IDEALITY_STEP           13
> > +#define  EXT_IDEALITY_VAL(x)         (EXT_IDEALITY_START + \
> > +                                      ((x) * EXT_IDEALITY_STEP))
> > +#define  EXT_IDEALITY_MASK           0x3f
> > +#define REG_BETA_COMP                        0x18
> > +#define  BETA_COMP_AUTO                      BIT(3)
> > +#define  BETA_COMP_DISABLE           7
> > +#define  BETA_COMP_2_33                      6
> > +#define  BETA_COMP_1_00                      5
> > +#define  BETA_COMP_0_43                      4
> > +#define  BETA_COMP_0_33                      3
> > +#define  BETA_COMP_0_25                      2
> > +#define  BETA_COMP_0_18                      1
> > +#define  BETA_COMP_0_11                      0
> > +#define  BETA_COMP_MASK                      0x7
> > +#define REG_TEMP_EXT_CRIT            0x19
> > +#define REG_TEMP_EXT_CRIT_HYST               0x21
> > +#define REG_TACH_LO                  0x46
> > +#define REG_TACH_HI                  0x47
> > +#define REG_TACH_MIN_LO                      0x48
> > +#define REG_TACH_MIN_HI                      0x49
> > +#define REG_FAN_CONFIG                       0x4a
> > +#define  FAN_EXT_TEMP_FORCE          BIT(6)
> > +#define  FAN_LUT_DISABLE             BIT(5)
> > +#define  FAN_POL_INV                 BIT(4)
> > +#define  FAN_CLK_SEL                 BIT(3)
> > +#define  FAN_CLK_OVR                 BIT(2)
> > +#define  TACH_FALSE_READ_DISABLE     BIT(0)
> > +#define  TACH_FALSE_READ_MASK                0x3
> > +#define REG_FAN_SPIN                 0x4b
> > +#define  FAN_SPIN_UP_ABORT           BIT(5)
> > +#define  FAN_SPIN_UP_POWER_SHIFT     3
> > +#define  FAN_SPIN_UP_POWER_100               (3 << FAN_SPIN_UP_POWER_S=
HIFT)
> > +#define  FAN_SPIN_UP_POWER_75                (2 << FAN_SPIN_UP_POWER_S=
HIFT)
> > +#define  FAN_SPIN_UP_POWER_50                (1 << FAN_SPIN_UP_POWER_S=
HIFT)
> > +#define  FAN_SPIN_UP_POWER_0         (0 << FAN_SPIN_UP_POWER_SHIFT)
> > +#define  FAN_SPIN_UP_POWER_MASK              (0x3 << FAN_SPIN_UP_POWER=
_SHIFT)
> > +#define  FAN_SPIN_UP_TIME_3200               7
> > +#define  FAN_SPIN_UP_TIME_1600               6
> > +#define  FAN_SPIN_UP_TIME_800                5
> > +#define  FAN_SPIN_UP_TIME_400                4
> > +#define  FAN_SPIN_UP_TIME_200                3
> > +#define  FAN_SPIN_UP_TIME_100                2
> > +#define  FAN_SPIN_UP_TIME_50         1
> > +#define  FAN_SPIN_UP_TIME_0          0
> > +#define  FAN_SPIN_UP_TIME_MASK               0x7
> > +#define REG_FAN_SET                  0x4c
> > +#define  FAN_SET_MASK                        0x3f
> > +#define REG_PWM_FREQ                 0x4d
> > +#define  PWM_FREQ_MASK                       0x1f
> > +#define REG_PWM_FREQ_DIV             0x4e
> > +#define REG_FAN_LUT_HYST             0x4f
> > +#define  FAN_LUT_HYST_MASK           0x1f
> > +#define REG_FAN_LUT_TEMP(x)          (0x50 + (0x2 * (x)))
> > +/* Write only with FAN_LUT_DISABLE */
> > +#define  FAN_LUT_TEMP_MASK           0x7f
> > +#define REG_FAN_LUT_SPEED(x)         (0x51 + (0x2 * (x)))
> > +/* Write only with FAN_LUT_DISABLE */
> > +#define  FAN_LUT_SPEED_MASK          0x3f
> > +#define REG_AVG_FILTER                       0xbf
> > +#define  FILTER_SHIFT                        1
> > +#define  FILTER_L2                   (3 << FILTER_SHIFT)
> > +#define  FILTER_L1                   (1 << FILTER_SHIFT)
> > +#define  FILTER_NONE                 (0 << FILTER_SHIFT)
> > +#define  FILTER_MASK                 (0x3 << FILTER_SHIFT)
> > +#define  ALERT_PIN_TEMP_COMP         BIT(0)
> > +#define REG_PRODUCT_ID                       0xfd
> > +#define REG_MANUFACTURER_ID          0xfe
> > +#define REG_REVISION                 0xff
> > +
> > +#define CLK_FREQ_ALT                 1400
> > +#define CLK_FREQ_BASE                        360000
> > +
> > +#define FAN_LUT_COUNT                        8
> > +#define FAN_LUT_HYST_DEF             4
> > +#define FAN_LUT_HYST_MIN             0
> > +#define FAN_LUT_HYST_MAX             31
> > +#define FAN_MIN_READ                 0xffff
> > +#define FAN_RPM_FACTOR                       5400000
> > +
> > +#define MANUFACTURER_ID                      0x5d
> > +
> > +#define TEMP_EXT_HI_FAULT            0x7f
> > +#define TEMP_EXT_LO_FAULT_OPEN               0x00
> > +#define TEMP_EXT_LO_FAULT_SHORT              0xe0
> > +
> > +#define TEMP_LO_FRAC                 125
> > +#define TEMP_LO_SHIFT                        5
> > +#define TEMP_LO_MASK                 (0x3 << TEMP_LO_SHIFT)
> > +
> > +#define TEMP_MIN                     -64
> > +#define TEMP_MAX                     127
> > +#define TEMP_MAX_FRAC                        750
> > +
> > +enum emc2101_fan_spin_up_abort {
> > +     EMC2101_FAN_SPIN_ABORT_DISABLE =3D 0,
> > +     EMC2101_FAN_SPIN_ABORT_ENABLE
> > +};
> > +
> > +enum emc2101_fan_standby {
> > +     EMC2101_FAN_STBY_DISABLE =3D 0,
> > +     EMC2101_FAN_STBY_ENABLE
> > +};
> > +
> > +enum emc2101_mode {
> > +     EMC2101_MODE_PWM =3D 0,
> > +     EMC2101_MODE_DAC
> > +};
> > +
> > +enum ecm2101_product_id {
> > +     EMC2101 =3D 0x16,
> > +     EMC2101_R =3D 0x28
> > +};
> > +
> > +enum emc2101_pwm_enable {
> > +     EMC2101_PWM_MANUAL =3D 1,
> > +     EMC2101_PWM_LUT =3D 2
> > +};
> > +
> > +enum emc2101_pwm_polarity {
> > +     EMC2101_POL_NORMAL =3D 0,
> > +     EMC2101_POL_INVERTED
> > +};
> > +
> > +enum emc2101_temp_channels {
> > +     EMC2101_TC_INT =3D 0,
> > +     EMC2101_TC_EXT,
> > +     EMC2101_TC_FORCE,
> > +     EMC2101_TC_NUM
> > +};
> > +
> > +enum emc2101_temp_diode {
> > +     EMC2101_TD_CPU =3D 1,
> > +     EMC2101_TD_2N3904 =3D 2
> > +};
> > +
> > +struct emc2101_data {
> > +     struct i2c_client *client;
> > +     struct device *dev;
> > +     struct mutex mutex;
>
> Add a comment describing what you are protecting here. It looks so far
> like you could just use regmap and drop the mutex, but I didn't check
> thoroughly.

The EMC2101 datasheet is explicit about the Look Up Table registers
(REG_FAN_LUT_TEMP and REG_FAN_LUT_SPEED) being RO if FAN_LUT_DISABLE
isn't set, so I believe that we need the mutex even if we switch to
regmap.
I will add an explanation with that in the next version.
Should I still switch the implementation to regmap considering that we
need a mutex?

>
> > +};
>
>
>
> ...
>
> > +
> > +static int emc2101_probe(struct i2c_client *client)
> > +{
> > +     struct i2c_adapter *adapter =3D client->adapter;
> > +     struct device *dev =3D &client->dev;
> > +     struct emc2101_data *data;
> > +     struct device *hwmon_dev;
> > +
> > +     if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> > +             return -EIO;
> > +
> > +     data =3D devm_kzalloc(dev, sizeof(struct emc2101_data), GFP_KERNE=
L);
>
> sizeof(*)
>
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->client =3D client;
> > +     data->dev =3D dev;
> > +     mutex_init(&data->mutex);
> > +
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->n=
ame, data,
> > +                                                      &emc2101_chip_in=
fo,
> > +                                                      emc2101_hwmon_gr=
oups);
> > +     if (IS_ERR(hwmon_dev))
> > +             return PTR_ERR(hwmon_dev);
> > +
> > +     dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->n=
ame);
>
> Drivers should be silent oon success. We already know that this probed
> based on sysfs.
>
> > +
> > +     return emc2101_init(data);
> > +}
> > +
> > +static int emc2101_detect(struct i2c_client *client, struct i2c_board_=
info *info)
> > +{
> > +     struct i2c_adapter *adapter =3D client->adapter;
> > +     s32 manufacturer, product, revision;
> > +     struct device *dev =3D &adapter->dev;
> > +
> > +     if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> > +             return -ENODEV;
> > +
> > +     manufacturer =3D i2c_smbus_read_byte_data(client, REG_MANUFACTURE=
R_ID);
> > +     if (manufacturer !=3D MANUFACTURER_ID)
> > +             return -ENODEV;
> > +
> > +     product =3D i2c_smbus_read_byte_data(client, REG_PRODUCT_ID);
> > +     switch (product) {
> > +     case EMC2101:
> > +             strscpy(info->type, "emc2101", I2C_NAME_SIZE);
> > +             break;
> > +     case EMC2101_R:
> > +             strscpy(info->type, "emc2101-r", I2C_NAME_SIZE);
> > +             break;
> > +     default:
> > +             return -ENODEV;
> > +     }
> > +
> > +     revision =3D i2c_smbus_read_byte_data(client, REG_REVISION);
> > +
> > +     dev_info(dev, "Found %s at 0x%02x (rev 0x%02x).\n",
> > +              info->type, client->addr, revision);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct i2c_device_id emc2101_ids[] =3D {
> > +     { "emc2101" },
> > +     { "emc2101-r" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, emc2101_ids);
> > +
> > +static const struct of_device_id emc2101_of_match_table[] =3D {
> > +     { .compatible =3D "microchip,emc2101", },
> > +     { .compatible =3D "microchip,emc2101-r", },
>
> Devices are compatible then? Express it in the bindings and drop this ent=
ry.
>
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, emc2101_of_match_table);
> > +
> > +static const unsigned short emc2101_address_list[] =3D {
> > +     0x4c, I2C_CLIENT_END
> > +};
> > +
> Best regards,
> Krzysztof
