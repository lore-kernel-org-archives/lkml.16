Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231601E485;
	Sun, 11 May 2025 23:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006350; cv=none; b=rcg5Ij/JFaYmI3rQ/vymnXdQBrLiLp1Bb+jGQxryP1XD0NZl17z+Ed6seiLjBp9YAcZGYtTjyPbMvgBp+jExiPQleN9/TG7t95KPOVThsTyvaleMIrJBeMWbtGGsysnlTFJd+hDfQtUjARn7YmxHaAkztz+hp9QcPM6Zrfj8R7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006350; c=relaxed/simple;
	bh=DMGNQ/27J8zFgvIMjvABCtS0pdHAK/LX/79U+H8Tj9c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=MF3Yyio5w0c6/4MDDPDD9BTH4Nk99UxZo6fvlk+8FH7n1GqKMkjwTDdCAW5MVHAljrHK77DhOgiT/LtUFlfklBo03aFgfkSqZavcz4S8gNekNbG15FHnU1qI7PR6/Hk3Tqh9uzdiuKBu5pfanTXbCJZsifM437/Mx9RHkgh5oc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKterA5J; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKterA5J"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4c9cea30173so1442110137.3;
        Sun, 11 May 2025 16:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006348; x=1747611148; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:cc:to:from:subject
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHNUK48E56Iko6GSemulss7BICAJtM5CTl3JlPLr9rQ=;
        b=JKterA5J1fpjg3T9o0Opv5g3877mn6NJJ0EVuDFCFwEL94oIMu5XstmFpTIVNlED8Z
         mM3I687YmMq3ogBPTSuDQoK+X+wY8MeoSdaqq1zW50+AH6yM+3yLIbHczF9RAesXWkdr
         VSCt2UevV1ccuC+R3gwlzQUrnhZ2x8/CgPkhrTXCXvX5fE0utPOxowZOqH+J92r1RLXj
         die6E0FKhAV6GaiULngCeBSvisMX12bUhUQdR7onKafSRBCxDBxjuOJ02u69afbWjkmu
         +XvecndWQWeBd7Vb6D2xW6RkayctI1sjWtFwlqqaP4T0JCH/rxNKIkIR/ReD9XWfr8ID
         fdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006348; x=1747611148;
        h=in-reply-to:references:content-transfer-encoding:cc:to:from:subject
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qHNUK48E56Iko6GSemulss7BICAJtM5CTl3JlPLr9rQ=;
        b=ZJwwYmjvwSHjWFHcf34sE3x7TdArSBKb4/fWrnBWK3U5axZc7ci3mNfB44re508p9w
         n8uLuKYdj0WtFfgJqpQhQ3y+C4fHsOyyq11tdhzzYsdPomQB2CGhsKTNAMR7gFUZ9mm4
         efTD4QgnjTr6wJfrBbRPnBRg5XD2nSJXyCRufcDDDGDzvySpNdoXzSL8BUf7734WXPpy
         duNtCjPxjVJYXYo7fEhmfiU112U8gswAit9cltZIOUx+j/OvrWDhdPzDjV944z4FoLKj
         n3iLKnklCPMAlqjgKKP52vq6TpMhWlX9W+v4E48dZCT1qU8U3n4ui42Uf8VnJo6FsP9+
         QwPw==
X-Forwarded-Encrypted: i=1; AJvYcCVy6eM5b+XJjWcMEO7t/mpaIXnJAZpLgN9OXDbI81YS80Wk/pMhBC4TQd9jye4k7KrHZyWpLGH+m67aI6k=@vger.kernel.org, AJvYcCWASsjqHJ/NVaSI1vUE157AJgJaU2Si/zPS8jJJGxNDKnWvx0Cfa9cvxkttQe58fGSRF7xVK42dWxNXS6jpWLQpI4V0IQ==@vger.kernel.org, AJvYcCXjSElVSy/6LjJ1Gjzt5zLQuJS42b4jBjb5GzaQ7fdg4aonUi7x84MOAIUDzu0cwqVCKPeDQlcRNVA=@vger.kernel.org, AJvYcCXxJvH08//szdGccSVl8aIfy6mACdeYjJ+jfmk/l0NxnldN36a9IFfQI0M0UtDKJ62GtDV7VBDW2YKTnUtz@vger.kernel.org
X-Gm-Message-State: AOJu0YwYKqusdKLw9HMBqblwSTxrlAfNEbsvNERzsW2n1LoBjoMWHT5H
	A4GEEdTfclJHVxnniV05ydqkzx+3qWE4BIEd3I/lB8K4Je+ihGYA
X-Gm-Gg: ASbGncsu+VIETL8FL3HTvGOEGUqf+lwAjOFo7Eeq02BXXQ4iy13HJyc5Cmp0URmjsWe
	HOqL3ow1j+qC/p0HSiO77WfKiIk8zuyHGA0v4Pd1MqCFtL73w5XFiT6DtumiCBMtbdwVUKO4QGg
	96UNdHjWM69ugOWf1N/IqDEqqbpuM8aez7B+h+P+wF39cJi3sbVOwHiTeL7csnhLhqZWSAdwbMZ
	qxCpAzVScEv2zK/mUO4ycnJVrtATngXlcDjLrsBhC4tyCTqaVdRzTZLVBNBFBDpjf4/bfkmga77
	QbudmosiRkQUzzQxY7Hb9i/6YIKy8X5xxSwAsYfox8Ni
X-Google-Smtp-Source: AGHT+IHKq0xLDBq+ZUjE4BWwBcfWfrsTdq0ujVF0jXbUiEIwNKnMLwKFxQ8FZ+xSfggUMCixwaLwsQ==
X-Received: by 2002:a05:6102:3c84:b0:4bb:eb4a:f9ec with SMTP id ada2fe7eead31-4deed3d5708mr8354505137.16.1747006347782;
        Sun, 11 May 2025 16:32:27 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb2018611sm4188112137.20.2025.05.11.16.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 16:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=3bc745e53bd8909e7cb4150aef634e85549a7b98202ef2ad3e631cb8532a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 11 May 2025 20:32:23 -0300
Message-Id: <D9TQ2AHY9K45.2LVEF7CYQOW1R@gmail.com>
Subject: Re: [PATCH v1 03/10] platform/x86: msi-wmi-platform: Add quirk
 system
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-4-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-4-lkml@antheas.dev>

--3bc745e53bd8909e7cb4150aef634e85549a7b98202ef2ad3e631cb8532a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> MSI uses the WMI interface as a passthrough for writes to the EC
> and uses a board name match and a quirk table from userspace on
> Windows. Therefore, there is no auto-detection functionality and
> we have to fallback to a quirk table.
>
> Introduce it here, prior to starting to add features to it.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/msi-wmi-platform.c | 45 +++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x=
86/msi-wmi-platform.c
> index f0d1b8e1a2fec..408d42ab19e20 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -14,6 +14,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/device/driver.h>
> +#include <linux/dmi.h>
>  #include <linux/errno.h>
>  #include <linux/hwmon.h>
>  #include <linux/kernel.h>
> @@ -79,8 +80,12 @@ enum msi_wmi_platform_method {
>  	MSI_PLATFORM_GET_WMI		=3D 0x1d,
>  };
> =20
> +struct msi_wmi_platform_quirk {
> +};
> +
>  struct msi_wmi_platform_data {
>  	struct wmi_device *wdev;
> +	struct msi_wmi_platform_quirk *quirks;
>  	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
>  };
> =20
> @@ -124,6 +129,39 @@ static const char * const msi_wmi_platform_debugfs_n=
ames[] =3D {
>  	"get_wmi"
>  };
> =20
> +static struct msi_wmi_platform_quirk quirk_default =3D {};

This is static, you can drop the `=3D {}`.

> +static struct msi_wmi_platform_quirk quirk_gen1 =3D {
> +};
> +static struct msi_wmi_platform_quirk quirk_gen2 =3D {
> +};
> +
> +static const struct dmi_system_id msi_quirks[] =3D {

This should be moved to an .init section, i.e. marked as __initconst.

To achieve this, you have to move DMI matching to module_init and
*quirks most be static.

This way this memory can be freed after init.

--=20
 ~ Kurt

> +	{
> +		.ident =3D "MSI Claw (gen 1)",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_MATCH(DMI_BOARD_NAME, "MS-1T41"),
> +		},
> +		.driver_data =3D &quirk_gen1,
> +	},
> +	{
> +		.ident =3D "MSI Claw AI+ 7",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_MATCH(DMI_BOARD_NAME, "MS-1T42"),
> +		},
> +		.driver_data =3D &quirk_gen2,
> +	},
> +	{
> +		.ident =3D "MSI Claw AI+ 8",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_MATCH(DMI_BOARD_NAME, "MS-1T52"),
> +		},
> +		.driver_data =3D &quirk_gen2,
> +	},
> +};
> +
>  static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *out=
put, size_t length)
>  {
>  	if (obj->type !=3D ACPI_TYPE_BUFFER)
> @@ -413,6 +451,7 @@ static int msi_wmi_platform_init(struct msi_wmi_platf=
orm_data *data)
>  static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *c=
ontext)
>  {
>  	struct msi_wmi_platform_data *data;
> +	const struct dmi_system_id *dmi_id;
>  	int ret;
> =20
>  	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> @@ -422,6 +461,12 @@ static int msi_wmi_platform_probe(struct wmi_device =
*wdev, const void *context)
>  	data->wdev =3D wdev;
>  	dev_set_drvdata(&wdev->dev, data);
> =20
> +	dmi_id =3D dmi_first_match(msi_quirks);
> +	if (dmi_id)
> +		data->quirks =3D dmi_id->driver_data;
> +	else
> +		data->quirks =3D &quirk_default;
> +
>  	ret =3D devm_mutex_init(&wdev->dev, &data->wmi_lock);
>  	if (ret < 0)
>  		return ret;


--3bc745e53bd8909e7cb4150aef634e85549a7b98202ef2ad3e631cb8532a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCEziwAKCRAWYEM49J/U
Zl12AQDJJlNPi1jCWPKi5JllXi+G4CNISlKu4t1SybmUNsa4qwEA/c/8mf5gPxvg
7Dfy5309O91/iv+ODM+PjX2iBXynWwI=
=Ojbi
-----END PGP SIGNATURE-----

--3bc745e53bd8909e7cb4150aef634e85549a7b98202ef2ad3e631cb8532a--
