Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2EB1E485;
	Sun, 11 May 2025 23:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006442; cv=none; b=Y3qitz3JQaryb/5HXwoQNj676jDcAdJ0r8DsWKpnltFO+/8ExK2iIx2ev+o6lM8kafa23SGIThMx6ecSS+nnbP/9E2Zrwg6wPYIS/JjUl+f15I1yIQt0V3tIQM/k6O73VBz6IfRGiPuyVLESf9uyiNXeSYFvqo5P5en4ShphycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006442; c=relaxed/simple;
	bh=J5rgwoWlf4e+FyfzjQXArj1BxMYpFygEipejSIRmfos=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KjuTfZV4mcCei9CpftssPw6+PAW2pj+J5ybop14BZ5BwXu41xeVj4LxccsabM3cdObUfw8VD2/g3Ana/1WxGoZJBmYtHBv6afNPMzpQiGF/CVr3npDlEqOp5ocLAqcSAD4BQ6oukkhFS9zoYI16sRc5/OdwtpX62CAPogXGuPR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5SbcMhT; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5SbcMhT"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4c32f1f7801so1322195137.2;
        Sun, 11 May 2025 16:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006438; x=1747611238; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:to:from:subject:cc
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xD0wc1t1WyJJeeOaCyIBi5DFpTobzS5I5ml6LwPy7xU=;
        b=i5SbcMhTGQrrNDXd9A9naa8ivNMD0SJP28g7sVYrl0RtKaDAy00ExTP6EGSqPptnTp
         EaK0NeCw9ubCA5HKwf2Deqrgetucto3plISU83LHa8cSrzjVBV5tdHc0/MYb/yzFOgh1
         E9Mms7bHZeLrVQKnBg8D5tWXGQbeL/gh3OjHELeFkCixeXU1u8/odbcdxjzWZebTUK9h
         gXuksLhQaWDhyuCs5LnpUqPFwmqwJVUwov6C3gBfTrx38ida48Lj8B41WqVcnZHlz39t
         TmYyYcnA3GQXKWxKoKGtJNlDQDZQaVmEeEBKA3ZxjCpxrpjD6cp3/99JBBfRlOMT6sT9
         K3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006438; x=1747611238;
        h=in-reply-to:references:content-transfer-encoding:to:from:subject:cc
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xD0wc1t1WyJJeeOaCyIBi5DFpTobzS5I5ml6LwPy7xU=;
        b=UMCKs5Em5Anmqe1+x/bFc3rCH6cLNEm2bbKsIgJu78Zr6ByYCCJQhub/+LX8HAW4f3
         efV3/D/QAcE8EqD3qgNuljpIy1QPEWb9fnzkjxOqYpryoLe4Qf+TYnWPltold7ke88L4
         T5tqiMcfqH9MLwWRStW1ccnL/LzFoqJPB6sXM3xHzfqyGsfaJfSBHP/Fndvfz29tVkq7
         vr0EgITa9p7j7fOf9j2kZe7uDPusgLllgPVOj4LfXWbcbmluL3neKUFidiHPCZSHjpm6
         6U+kCEL8+fA7IEz9ILHGDqvfs47/z2X9sCQgI6T5egz/E533ZtXsWDEHuxyZa+ijoUiH
         OO6w==
X-Forwarded-Encrypted: i=1; AJvYcCWa4spWBoOC498bZs9igivuAumO/9CIvGULFIHS6HLhQVAYz4eNr0++Me2S21lb1wMw1X+7q/qdo/s=@vger.kernel.org, AJvYcCXOiWHbDxFFFIa8PQNP0nCmr6z9g9MjSkvr8J6xt8Hl8V3Mggayp+CymiD2dU+w9aZ1DsxC7TCWO/8LE+gmigP941BZdA==@vger.kernel.org, AJvYcCXruhA1fTASl7JTZWpUGLK0/5cnPZvG5O2l4WYN8zQulkWDsP6zCDO5gWC6mNDHylK4NmII9Sa7PHQo215V@vger.kernel.org, AJvYcCXyqJ7lFxvq0RXBfJvablSK5zfxvUE2GI5bYaqlUb/D6z0k+hfBMWplNvK0l5qs42Z1HRrXfkEryY0lNlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HpzVFkAsswmUaX+T2Zxivu6dVXsEzlxspmmCbqj0VMM0PDTt
	swoVZbyuam3uQ4/wrHYtuGsQmaCEwl1jm8kICdWa79dmycA3g00z
X-Gm-Gg: ASbGncvaN7k0iihR2ctiooL7gt6iyCc6G3o6Gr9wO3Ls0P1hOrFVMjYluN909MgEpQa
	C5Q28kGhcitI5JuTG2+v/WvK0j8yB5f9Nt5SWIjY02fOmIu8zHJ+CNkWi4rBAVhdueccPiuD+YH
	i5FbdJLN7x2Zq0G48knrmbJ29OGESSzPksmqug+zbkQGSNItGX8EGbdAnyFNZWAxURGKwrVZTRp
	sFcFivQhjoDsFe+0Vl38yo3aTl79xsEw+dpY/RSOigRKSI+xgeduCRIHvFFG8MhScDUYrZ21fCj
	CJyhjSfG2Yq4/g6X8Cw6nkF7TSXhruf+SJnQlDnlWjgWNPd6nLJlmqw=
X-Google-Smtp-Source: AGHT+IELShoSFGS1un8ebKl6ECRdNCSUH8MfTaPhkscQPDyGTtGPaP3kJuSpv7iJ0ui12QUr/HxfEg==
X-Received: by 2002:a05:6102:2c0a:b0:4c3:6393:83f4 with SMTP id ada2fe7eead31-4deed314ff1mr9525512137.2.1747006438009;
        Sun, 11 May 2025 16:33:58 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6297d64sm4317023241.30.2025.05.11.16.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 16:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=aeb4a69df08982bca8e65b063a06e61624074636c4a8e7256729350bf95c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 11 May 2025 20:33:53 -0300
Message-Id: <D9TQ3FWVTOBM.4GU600TZ7NZ9@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 05/10] platform/x86: msi-wmi-platform: Add platform
 profile through shift mode
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-6-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-6-lkml@antheas.dev>

--aeb4a69df08982bca8e65b063a06e61624074636c4a8e7256729350bf95c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> MSI's version of platform profile in Windows is called shift mode.
> Introduce it here, and add a profile handler to it.
>
> It has 5 modes: sport, comfort, green, eco, and user.
> Confusingly, for the Claw, MSI only uses sport, green, and eco,
> where they correspond to performance, balanced, and low-power.
> Therefore, comfort is mapped to balanced-performance, and user to
> custom.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/Kconfig            |   1 +
>  drivers/platform/x86/msi-wmi-platform.c | 117 ++++++++++++++++++++++++
>  2 files changed, 118 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index bee98251b8f0b..57a48910c8fd4 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -746,6 +746,7 @@ config MSI_WMI_PLATFORM
>  	tristate "MSI WMI Platform features"
>  	depends on ACPI_WMI
>  	depends on HWMON
> +	select ACPI_PLATFORM_PROFILE
>  	help
>  	  Say Y here if you want to have support for WMI-based platform feature=
s
>  	  like fan sensor access on MSI machines.
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x=
86/msi-wmi-platform.c
> index 9ac3c6f1b3f1d..c0b577c95c079 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -17,6 +17,7 @@
>  #include <linux/dmi.h>
>  #include <linux/errno.h>
>  #include <linux/fixp-arith.h>
> +#include <linux/platform_profile.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/kernel.h>
> @@ -63,6 +64,16 @@
>  #define MSI_PLATFORM_AP_FAN_FLAGS_OFFSET	1
>  #define MSI_PLATFORM_AP_ENABLE_FAN_TABLES	BIT(7)
> =20
> +/* Get_Data() and Set_Data() Shift Mode Register */

Maybe you can write short documentation for these methods?

> +#define MSI_PLATFORM_SHIFT_ADDR		0xd2
> +#define MSI_PLATFORM_SHIFT_DISABLE	BIT(7)
> +#define MSI_PLATFORM_SHIFT_ENABLE	(BIT(7) | BIT(6))
> +#define MSI_PLATFORM_SHIFT_SPORT	(MSI_PLATFORM_SHIFT_ENABLE + 4)
> +#define MSI_PLATFORM_SHIFT_COMFORT	(MSI_PLATFORM_SHIFT_ENABLE + 0)
> +#define MSI_PLATFORM_SHIFT_GREEN	(MSI_PLATFORM_SHIFT_ENABLE + 1)
> +#define MSI_PLATFORM_SHIFT_ECO		(MSI_PLATFORM_SHIFT_ENABLE + 2)
> +#define MSI_PLATFORM_SHIFT_USER		(MSI_PLATFORM_SHIFT_ENABLE + 3)

Instead of summing the profiles I suggest something like:

enum MSI_PLATFORM_PROFILES {
	MSI_PROFILE_COMFORT,
	MSI_PROFILE_GREEN,
	MSI_PROFILE_ECO,
	MSI_PROFILE_USER,
	MSI_PROFILE_SPORT,
}

And you can prepare your commands like

command =3D MSI_PLATFORM_SHIT_ENABLE;
command |=3D FIELD_PREP(GENMASK(1,0), MSI_PROFILE_{profile});

I feel that it's cleaner this way. This is only a suggestion though.

> +
>  static bool force;
>  module_param_unsafe(force, bool, 0);
>  MODULE_PARM_DESC(force, "Force loading without checking for supported WM=
I interface versions");
> @@ -100,12 +111,14 @@ enum msi_wmi_platform_method {
>  };
> =20
>  struct msi_wmi_platform_quirk {
> +	bool shift_mode;	/* Shift mode is supported */
>  };
> =20
>  struct msi_wmi_platform_data {
>  	struct wmi_device *wdev;
>  	struct msi_wmi_platform_quirk *quirks;
>  	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
> +	struct device *ppdev;
>  };
> =20
>  struct msi_wmi_platform_debugfs_data {
> @@ -150,8 +163,10 @@ static const char * const msi_wmi_platform_debugfs_n=
ames[] =3D {
> =20
>  static struct msi_wmi_platform_quirk quirk_default =3D {};
>  static struct msi_wmi_platform_quirk quirk_gen1 =3D {
> +	.shift_mode =3D true
>  };
>  static struct msi_wmi_platform_quirk quirk_gen2 =3D {
> +	.shift_mode =3D true
>  };
> =20
>  static const struct dmi_system_id msi_quirks[] =3D {
> @@ -561,6 +576,90 @@ static const struct hwmon_chip_info msi_wmi_platform=
_chip_info =3D {
>  	.info =3D msi_wmi_platform_info,
>  };
> =20
> +static int msi_wmi_platform_profile_probe(void *drvdata, unsigned long *=
choices)
> +{
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);

Please, use the non-atomic __set_bit(). `choices` is not shared between
threads.

> +	return 0;
> +}
> +
> +static int msi_wmi_platform_profile_get(struct device *dev,
> +					enum platform_profile_option *profile)
> +{
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	u8 buffer[32] =3D { };

Move this to the top.

> +
> +	buffer[0] =3D MSI_PLATFORM_SHIFT_ADDR;
> +
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, siz=
eof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	if (buffer[0] !=3D 1)
> +		return -EINVAL;
> +
> +	switch (buffer[1]) {
> +	case MSI_PLATFORM_SHIFT_SPORT:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		return 0;
> +	case MSI_PLATFORM_SHIFT_COMFORT:
> +		*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;

Maybe comfort can be mapped to balanced and green to cool. What do you
think?

> +		return 0;
> +	case MSI_PLATFORM_SHIFT_GREEN:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		return 0;
> +	case MSI_PLATFORM_SHIFT_ECO:
> +		*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +		return 0;
> +	case MSI_PLATFORM_SHIFT_USER:
> +		*profile =3D PLATFORM_PROFILE_CUSTOM;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int msi_wmi_platform_profile_set(struct device *dev,
> +					enum platform_profile_option profile)
> +{
> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> +	u8 buffer[32] =3D { };
> +
> +	buffer[0] =3D MSI_PLATFORM_SHIFT_ADDR;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_SPORT;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_COMFORT;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_GREEN;
> +		break;
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_ECO;
> +		break;
> +	case PLATFORM_PROFILE_CUSTOM:
> +		buffer[1] =3D MSI_PLATFORM_SHIFT_USER;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, size=
of(buffer));
> +}
> +
> +static const struct platform_profile_ops msi_wmi_platform_profile_ops =
=3D {
> +	.probe =3D msi_wmi_platform_profile_probe,
> +	.profile_get =3D msi_wmi_platform_profile_get,
> +	.profile_set =3D msi_wmi_platform_profile_set,
> +};
> +
>  static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const cha=
r __user *input,
>  					      size_t length, loff_t *offset)
>  {
> @@ -742,6 +841,22 @@ static int msi_wmi_platform_init(struct msi_wmi_plat=
form_data *data)
>  	return 0;
>  }
> =20
> +static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data *=
data)
> +{
> +	int err;
> +
> +	if (!data->quirks->shift_mode)
> +		return 0;
> +
> +	data->ppdev =3D devm_platform_profile_register(
> +		&data->wdev->dev, "msi-wmi-platform", data,
> +		&msi_wmi_platform_profile_ops);

Broken format.

> +	if (err)
> +		return err;

`err` is not initialized. Is it a leftover?

> +
> +	return PTR_ERR_OR_ZERO(data->ppdev);
> +}
> +
>  static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *c=
ontext)
>  {
>  	struct msi_wmi_platform_data *data;
> @@ -775,6 +890,8 @@ static int msi_wmi_platform_probe(struct wmi_device *=
wdev, const void *context)
> =20
>  	msi_wmi_platform_debugfs_init(data);
> =20
> +	msi_wmi_platform_profile_setup(data);

Check return value.

--=20
 ~ Kurt

> +
>  	return msi_wmi_platform_hwmon_init(data);
>  }
> =20


--aeb4a69df08982bca8e65b063a06e61624074636c4a8e7256729350bf95c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCEz5QAKCRAWYEM49J/U
Zj9mAQDmrvN/iksYMOz3w+IHBf+KOIfgI8JibO7rgHW7cNwzVgD/Qujzic4Qg7lg
z5cDUi6YYi+tzF4Y5Wq3grk8AUddXg4=
=TZaT
-----END PGP SIGNATURE-----

--aeb4a69df08982bca8e65b063a06e61624074636c4a8e7256729350bf95c--
