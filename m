Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADF1E485;
	Sun, 11 May 2025 23:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006497; cv=none; b=GHL1CxJFPHdX+w5ijx187lDMUgRru0u23BzUbNf5xX+X01ygTa2IOqfyxCSEzZvuP8+v4Xm6SWildE4uD7tIwo7rqbfRzIm9WedF5TO5CsTEvuSE+Am5jyGqbmif/CbCid51wkxgTHldm8LA5q0ZtbIcmSaqSNIHl1RnN6Iit+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006497; c=relaxed/simple;
	bh=kAC1PYPME/yR8rTG87W/xvo+UtG3Js/A6NXe4uggmyI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rmk2SQ28MSasHsas3Fh8ygqLsoyhQZJyqbwFtJr2T1Bykc1oetUTOhVyZaAErUOuLTjYOrzMpQFoZ4dkC7jf09CayPOOCYh1EC9jY1n8J5vt77dKfl/+TMhebyB8snK9UEe+w7gVxATm7K2M0Rr5kt6HBxBMc6NrfttCIMY4Gn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXrMJgjv; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXrMJgjv"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52403e39a23so2665566e0c.2;
        Sun, 11 May 2025 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006494; x=1747611294; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:to:from:subject:cc
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kA3phTqrWpyrASScmz/GHZtwYXOXTQqLxqpmImth0tQ=;
        b=BXrMJgjvfbnHmlUb0OEYGao0JNJ1ffYDEBxgZMSzKOTlpEaPss7kadiqPnXNtAaQ3y
         C7gnQSGr4oFueDmqH+I17SD8JMuGBueZwfOX4GQ8IIZ6gF0Kp8z1CfdNoQyPdT2LaCzN
         twL+OIsVq4vWWtgR10XCzePIDVVtJde17jMhJ1Y0oug/HtqjLUD+VXSU9OOahGZ5yQ0r
         cWUWum4SN0ylao4B02+FCnBowthfzaxeDJnXnxWxLJL37QTcjIAKn8U/iXNsXpDE4ofM
         2940h/GIAxBHdo1LS67iryrsNN8Vt9LSErXCysKJ8xMXn2xUkJ2tdvaMiXanUx+o1hg7
         Qpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006494; x=1747611294;
        h=in-reply-to:references:content-transfer-encoding:to:from:subject:cc
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kA3phTqrWpyrASScmz/GHZtwYXOXTQqLxqpmImth0tQ=;
        b=Epu8qGLwRjTJFXubsIKxAms66aVPHaij6hKoxUpGSBnBAg30U59vrJaoQcu2/qvzMg
         fX9h9Lfin7U5L0x81suHCwIxnxKa00TcPPvxwPeJPxWdQqZeMHVRpacCpr0FPJ640fjG
         rqMfXy3jZ0PiNjBaeWRaUlDV7Uno7r7PJvn4oxEUvud+KABifaR/xqbUOotAF7dtcVEP
         WswuXJKSqQatuOtjhXGzKGv2zRP1LugDoV6ke6suI1BbQjuMHyM5/tGHp1ljoFuJeThv
         j1InIIbISf9H4Vk6PfMMK7nRGSfsoHeGWineMOq9fRyFmd8JBFrYH6JFTxi/efhcYP0O
         to3A==
X-Forwarded-Encrypted: i=1; AJvYcCUsBc2/PyvF2PPeSbWiemq1JjU7MhL9WPo1tsY6nSumaXN+rhlUc+9SOkAqH29ZxR+vxNHKr8//GQt4tDg=@vger.kernel.org, AJvYcCVT7EktPNZyWjdUjKlwprQr3FPx9DVwhJ3wtK6n/KOVmqEzKMmqMAqACc9ho9/1q28Jjpz8CjZtxP4+ptVw@vger.kernel.org, AJvYcCVg3okHuZ6+tnhinERW7Zzw/p+wrA4XoMwlrg0BnEq5vnfslpYxxiHjTX3rOSt/M6xbd50BiqbJ6DI=@vger.kernel.org, AJvYcCVpwQX1m8Y0p8kalBNNU3VQp2jSp0N2U7n0S3w6D/ALN4iE9MqNV06OnPTLdm67FZqmE8JnP4NvQAd6gHL2lbuMgwua7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL16viJWTgNZ384Pz3UfNhg/Kp3eWl30Xfj8Q0lZcakWVWF4Iv
	vV3jpkYj1gGFJa9qyY4RD2pEfkL1iYAx5FXy5XIBLJBI2DtvNxnC
X-Gm-Gg: ASbGnctygh7Rfrb2zCY8aRIJXE1LOBlgoHqsLfif++bJ5tTa9CeZyJE7A6DE/Mw9emG
	Ndc+pxchoZIeP9hGkJBTS7kNB9VPHvbubKrni9me1TL6Iss5dMBG6oq/PbA+UyUoxu1KGN5PB1o
	r/bs6/25ia+VemcifubbO3ClbuRcAB7K0e+jjFG0MHL1vJQ6HJ405P8inSDTEHhZ6ohSas3S5dg
	JpNZC9ZGfw7BtsAxsipcV4fm1VtW2aCI9qWuI9VEfmw6JmBs5allQHzJy19pg3dBZhP4DCqB0EJ
	iTLWFHCe2aOXBH/HSQBnGBJYMntzW56MKuTJB4YlG5q8
X-Google-Smtp-Source: AGHT+IGsI1cjGSdcy9x70btEFmbTLo8H6w2FPQ3wlhfynDMDVXoZdIBHJF+xjX8Oj3gSOhO5/KTefQ==
X-Received: by 2002:a05:6122:1da5:b0:520:9688:d1bb with SMTP id 71dfb90a1353d-52c53b4091amr9922942e0c.2.1747006494506;
        Sun, 11 May 2025 16:34:54 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375af9fsm4791468e0c.23.2025.05.11.16.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 16:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=8a1ec6a5cf08c131c836d3fac49dc263d405c035c64f596368230096e766;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 11 May 2025 20:34:50 -0300
Message-Id: <D9TQ460OHUEU.LEUNQX49TLS3@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 07/10] platform/x86: msi-wmi-platform: Add
 charge_threshold support
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-8-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-8-lkml@antheas.dev>

--8a1ec6a5cf08c131c836d3fac49dc263d405c035c64f596368230096e766
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> The battery of MSI laptops supports charge threshold. Add support for it.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/Kconfig            |   1 +
>  drivers/platform/x86/msi-wmi-platform.c | 110 ++++++++++++++++++++++++
>  2 files changed, 111 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index fd3da718731e7..51a34ab476ffc 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -744,6 +744,7 @@ config MSI_WMI
> =20
>  config MSI_WMI_PLATFORM
>  	tristate "MSI WMI Platform features"
> +	depends on ACPI_BATTERY
>  	depends on ACPI_WMI
>  	depends on HWMON
>  	select ACPI_PLATFORM_PROFILE
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x=
86/msi-wmi-platform.c
> index 6498f4b44fe53..46928fb4da8a6 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -31,6 +31,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
> +#include <acpi/battery.h>
> =20
>  #include <linux/unaligned.h>
> =20
> @@ -79,6 +80,7 @@
>  /* Get_Data() and Set_Data() Params */
>  #define MSI_PLATFORM_PL1_ADDR	0x50
>  #define MSI_PLATFORM_PL2_ADDR	0x51
> +#define MSI_PLATFORM_BAT_ADDR	0xd7
> =20
>  static bool force;
>  module_param_unsafe(force, bool, 0);
> @@ -118,6 +120,7 @@ enum msi_wmi_platform_method {
> =20
>  struct msi_wmi_platform_quirk {
>  	bool shift_mode;	/* Shift mode is supported */
> +	bool charge_threshold;	/* Charge threshold is supported */
>  	int pl_min;		/* Minimum PLx value */
>  	int pl1_max;		/* Maximum PL1 value */
>  	int pl2_max;		/* Maximum PL2 value */
> @@ -128,6 +131,7 @@ struct msi_wmi_platform_data {
>  	struct msi_wmi_platform_quirk *quirks;
>  	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
>  	struct device *ppdev;
> +	struct acpi_battery_hook battery_hook;
>  	struct device *fw_attrs_dev;
>  	struct kset *fw_attrs_kset;
>  };
> @@ -211,12 +215,14 @@ static const char * const msi_wmi_platform_debugfs_=
names[] =3D {
>  static struct msi_wmi_platform_quirk quirk_default =3D {};
>  static struct msi_wmi_platform_quirk quirk_gen1 =3D {
>  	.shift_mode =3D true,
> +	.charge_threshold =3D true,
>  	.pl_min =3D 8,
>  	.pl1_max =3D 43,
>  	.pl2_max =3D 45
>  };
>  static struct msi_wmi_platform_quirk quirk_gen2 =3D {
>  	.shift_mode =3D true,
> +	.charge_threshold =3D true,
>  	.pl_min =3D 8,
>  	.pl1_max =3D 30,
>  	.pl2_max =3D 37
> @@ -1013,6 +1019,94 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_pl=
atform_data *data)
>  	return 0;
>  }
> =20
> +static int msi_platform_psy_ext_get_prop(struct power_supply *psy,
> +					 const struct power_supply_ext *ext,
> +					 void *data,
> +					 enum power_supply_property psp,
> +					 union power_supply_propval *val)
> +{
> +	struct msi_wmi_platform_data *msi =3D data;
> +	u8 buffer[32] =3D { 0 };
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		buffer[0] =3D MSI_PLATFORM_BAT_ADDR;
> +		ret =3D msi_wmi_platform_query(msi, MSI_PLATFORM_GET_DATA,
> +					     buffer, sizeof(buffer));
> +		if (ret)
> +			return ret;
> +
> +		val->intval =3D buffer[1] & ~BIT(7);

I think BIT(7) should be a named define.

> +		if (val->intval > 100)
> +			return -EINVAL;
> +
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int msi_platform_psy_ext_set_prop(struct power_supply *psy,
> +					 const struct power_supply_ext *ext,
> +					 void *data,
> +					 enum power_supply_property psp,
> +					 const union power_supply_propval *val)
> +{
> +	struct msi_wmi_platform_data *msi =3D data;
> +	u8 buffer[32] =3D { 0 };
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> +		if (val->intval > 100)
> +			return -EINVAL;
> +		buffer[0] =3D MSI_PLATFORM_BAT_ADDR;
> +		buffer[1] =3D val->intval | BIT(7);
> +		return msi_wmi_platform_query(msi, MSI_PLATFORM_SET_DATA,
> +					      buffer, sizeof(buffer));
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int
> +msi_platform_psy_prop_is_writeable(struct power_supply *psy,
> +				   const struct power_supply_ext *ext,
> +				   void *data, enum power_supply_property psp)
> +{
> +	return true;
> +}
> +
> +static const enum power_supply_property oxp_psy_ext_props[] =3D {

Maybe s/oxp/msi/ ?

--=20
 ~ Kurt

> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> +};
> +
> +static const struct power_supply_ext msi_platform_psy_ext =3D {
> +	.name			=3D "msi-platform-charge-control",
> +	.properties		=3D oxp_psy_ext_props,
> +	.num_properties		=3D ARRAY_SIZE(oxp_psy_ext_props),
> +	.get_property		=3D msi_platform_psy_ext_get_prop,
> +	.set_property		=3D msi_platform_psy_ext_set_prop,
> +	.property_is_writeable	=3D msi_platform_psy_prop_is_writeable,
> +};
> +
> +static int msi_wmi_platform_battery_add(struct power_supply *battery,
> +					struct acpi_battery_hook *hook)
> +{
> +	struct msi_wmi_platform_data *data =3D
> +		container_of(hook, struct msi_wmi_platform_data, battery_hook);
> +
> +	return power_supply_register_extension(battery, &msi_platform_psy_ext,
> +					       &data->wdev->dev, data);
> +}
> +
> +static int msi_wmi_platform_battery_remove(struct power_supply *battery,
> +					   struct acpi_battery_hook *hook)
> +{
> +	power_supply_unregister_extension(battery, &msi_platform_psy_ext);
> +	return 0;
> +}
> +
>  static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const cha=
r __user *input,
>  					      size_t length, loff_t *offset)
>  {
> @@ -1245,6 +1339,13 @@ static int msi_wmi_platform_probe(struct wmi_devic=
e *wdev, const void *context)
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (data->quirks->charge_threshold) {
> +		data->battery_hook.name =3D "MSI Battery";
> +		data->battery_hook.add_battery =3D msi_wmi_platform_battery_add;
> +		data->battery_hook.remove_battery =3D msi_wmi_platform_battery_remove;
> +		battery_hook_register(&data->battery_hook);
> +	}
> +
>  	msi_wmi_platform_debugfs_init(data);
> =20
>  	msi_wmi_platform_profile_setup(data);
> @@ -1252,6 +1353,14 @@ static int msi_wmi_platform_probe(struct wmi_devic=
e *wdev, const void *context)
>  	return msi_wmi_platform_hwmon_init(data);
>  }
> =20
> +static void msi_wmi_platform_remove(struct wmi_device *wdev)
> +{
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(&wdev->dev);
> +
> +	if (data->quirks->charge_threshold)
> +		battery_hook_unregister(&data->battery_hook);
> +}
> +
>  static const struct wmi_device_id msi_wmi_platform_id_table[] =3D {
>  	{ MSI_PLATFORM_GUID, NULL },
>  	{ }
> @@ -1265,6 +1374,7 @@ static struct wmi_driver msi_wmi_platform_driver =
=3D {
>  	},
>  	.id_table =3D msi_wmi_platform_id_table,
>  	.probe =3D msi_wmi_platform_probe,
> +	.remove =3D msi_wmi_platform_remove,
>  	.no_singleton =3D true,
>  };
>  module_wmi_driver(msi_wmi_platform_driver);


--8a1ec6a5cf08c131c836d3fac49dc263d405c035c64f596368230096e766
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCE0HQAKCRAWYEM49J/U
Zg/WAQD18DGn6ipU8mroAtOcWfzU8ZURKm7DSgSnS8VsoUXMlAD/bpMdsci+tsnF
7onaRixNw6vG1INF1k3gqyNIE1+SdQg=
=zoEF
-----END PGP SIGNATURE-----

--8a1ec6a5cf08c131c836d3fac49dc263d405c035c64f596368230096e766--
