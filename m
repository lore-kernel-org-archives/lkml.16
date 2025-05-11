Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA491E485;
	Sun, 11 May 2025 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006539; cv=none; b=s9xuVE+neADrEr3lBUDKM7ee/pANtb2QMeOAnaEAFC3kcW+JJDbjWwTa2yw8TrbItBO6C9SH5L0T5vI4yi4j54qGc4+DffzbBQqbN9V7uIm1UEty3D2YyYToOtpNaXmUFbGf9fcbYa/Ed3deFvMqNfwvxp3BonLYmnkzO4AzhAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006539; c=relaxed/simple;
	bh=XNmWdIQxVcWH/LdDQZ5Jl2zneO22mnRSEzWntMTpN6Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=bze8CWodZ8OVUjBqPx4fVkjzS3z/kIp9vRVExdTCBfwHATBmV251Vi8NqeRsKQmW9TkpQCJI6wq+sLOhIRZZVv2Zmhmr4mlt1FvhXKGBsGQqfIFtnaEp4P/JUlsXVOppGpvcfqAipCByegz1R34upEjtptulAVtGthefy4M5ttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAy3wWW3; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAy3wWW3"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1090062241.2;
        Sun, 11 May 2025 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006536; x=1747611336; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:from:subject:cc:to
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMrBMLNdO+8utoitlOv2Dln2dGic5qE8A6Jtp+NzDDQ=;
        b=cAy3wWW3LHUZNXqhxkQmjNMxsPb/9HUkEbTy7fOqMyNliwrqJUeko6VldxHekQycil
         hwIEgAN1CdCysJ/arakdMbxVmIUzKfGICckhkvnTK+nujPQD3UiM02ra5UFqKX36oAlp
         jOP2/skILLV9JCA1wYIfOM/eU/nzmWbFMKIrmH/nU/OZ5Ch58fd4uNBt1wdenJVKIOXA
         hXofcYWY2aZ4SLpdV7d1ljc3QcYve7hGNVqbrnKgkec/cQ2WxmjzvtxLupC6cLpWKkHg
         xzR7TwFSuu6VxZlCHsvS9tvJLCip2swhjLE2MERpZNJi4Yt/Cv0MSHvYgvitoVGMTB4y
         IQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006536; x=1747611336;
        h=in-reply-to:references:content-transfer-encoding:from:subject:cc:to
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fMrBMLNdO+8utoitlOv2Dln2dGic5qE8A6Jtp+NzDDQ=;
        b=CnuVjaPVvf+qj2hxsKsNh+aW7IqW65UoJIrlBde5KdGB4ByZu8Ess3miwO8qbb9LSr
         BJntmQ8kzEiUKU/QGRFAej1OjOjm72eA/fNONJflheuwccx44kZgvulxL2FcgAKGqss7
         lz20gMJaXq7e6m98wEUYEUeWKJ90tWAExK6h4NxAM4cXasqHpE0Vqud440EZ9oqgoagq
         AzJuBDaSCavS0RthY3RDBARV/PCPcOCRvvbtRAYDpQJSeEl7GUy7TaMKYKcA26YW3Q8G
         20QpMkftngYtZuwamjROucBY2HkZ2SU5gEjF//mTcf7s/UHbtRhmY6CaQpV+IDZ1QbJ4
         l6cg==
X-Forwarded-Encrypted: i=1; AJvYcCVTtcZ7UFVxcId7rI24Kh7WxVKcg4zMS/JFO7DNzKtLC6VuyhIB+QnjBBF6CpJvbfAJTsjSv/it1JI=@vger.kernel.org, AJvYcCVpLrem+WWBUCjCIyUUmIM7MDitBgEkhw1/FLfMzRiPJ5tZwq5iAYE+X9dkOOrG3h7NZTpiB0socRRzBm0=@vger.kernel.org, AJvYcCWG4JD8Du6xTu8yaoLhFkXdFsizroOKTzYmgDWBrCcEBEVAL8afiBIUQ6Ski7f3f/YrFlC5AVj0TQwc82ZO@vger.kernel.org, AJvYcCXXzO4UPUP6AhXJfGjJNtgC7q5KdDICx2cbu41pxQrPVsoOWE7FlCoRdIoWkx1m/xMnG5kN/yUBeLxejsO9ETU72KGa3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV9AJq30HEKAEZAFdvobPTdV0+tQ9bo+yKlskOByqkvQH0ltYk
	2VugyLVmFDCIoa2WDroxXmbt3nq8VpN3PThjvZH/PegvPdNS7XJo
X-Gm-Gg: ASbGncvg8wq1r9y6RFJtDtMfF9Tfl4gpydtE3puWsW44ZSQ8jJ5awYHauN4L8nr10iC
	bcY7tEfrQTkNSZRbCGhaIi81kzYoSsb5C31co+shwHLSge7es5yLaK4ogQ1d0aagzqUesl38G2Y
	C+1N2tl5P6q9UOz3338O2KFsWBB/rP4CxIz1fyvjAb1XV73CH17Z39LdYmb4z98eID6a2dg9CQY
	Cfwp6JmLsNd7rULdkw3WEKwBngt3EhUkUqUO2WL8qWmnrVYi7dWlgY5Q1zZ7t7PjBjqjokAfExb
	oJcDNbeyl/xirB4ivxrkXtOx6rlZZ7z2RPv4o9ORuNHa
X-Google-Smtp-Source: AGHT+IHx+nTcXRSjvbE3N0tFiFHEmiEiaDArkY8DRz03T8xrDLdQWbRUrJ2a1ah7qvWyOJoaiLJsCg==
X-Received: by 2002:a05:6102:1502:b0:4cb:43d4:6926 with SMTP id ada2fe7eead31-4deed33c57dmr9626335137.7.1747006536358;
        Sun, 11 May 2025 16:35:36 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea0298db9sm4392638137.0.2025.05.11.16.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 16:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7547664b886a80457f05e12aaf30434863635008445c92610d3975c9eb38;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 11 May 2025 20:35:30 -0300
Message-Id: <D9TQ4OLSV5U7.1NJ2JIKUN6QR3@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 08/10] platform/x86: msi-wmi-platform: Drop excess
 fans in dual fan devices
From: "Kurt Borja" <kuurtb@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-9-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-9-lkml@antheas.dev>

--7547664b886a80457f05e12aaf30434863635008445c92610d3975c9eb38
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> Currently, the platform driver always exposes 4 fans, since the
> underlying WMI interface reads 4 values from the EC. However, most
> devices only have two fans. Therefore, at least in the case of the
> Claw series, quirk the driver to only show two hwmon fans.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/msi-wmi-platform.c | 28 ++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x=
86/msi-wmi-platform.c
> index 46928fb4da8a6..eaf0eb25e349b 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -121,6 +121,7 @@ enum msi_wmi_platform_method {
>  struct msi_wmi_platform_quirk {
>  	bool shift_mode;	/* Shift mode is supported */
>  	bool charge_threshold;	/* Charge threshold is supported */
> +	bool dual_fans;		/* For devices with two hwmon fans */
>  	int pl_min;		/* Minimum PLx value */
>  	int pl1_max;		/* Maximum PL1 value */
>  	int pl2_max;		/* Maximum PL2 value */
> @@ -216,6 +217,7 @@ static struct msi_wmi_platform_quirk quirk_default =
=3D {};
>  static struct msi_wmi_platform_quirk quirk_gen1 =3D {
>  	.shift_mode =3D true,
>  	.charge_threshold =3D true,
> +	.dual_fans =3D true,
>  	.pl_min =3D 8,
>  	.pl1_max =3D 43,
>  	.pl2_max =3D 45
> @@ -223,6 +225,7 @@ static struct msi_wmi_platform_quirk quirk_gen1 =3D {
>  static struct msi_wmi_platform_quirk quirk_gen2 =3D {
>  	.shift_mode =3D true,
>  	.charge_threshold =3D true,
> +	.dual_fans =3D true,
>  	.pl_min =3D 8,
>  	.pl1_max =3D 30,
>  	.pl2_max =3D 37
> @@ -635,6 +638,23 @@ static const struct hwmon_chip_info msi_wmi_platform=
_chip_info =3D {
>  	.info =3D msi_wmi_platform_info,
>  };
> =20
> +static const struct hwmon_channel_info * const msi_wmi_platform_info_dua=
l[] =3D {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT,
> +			   HWMON_F_INPUT
> +			   ),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_ENABLE,
> +			   HWMON_PWM_ENABLE
> +			   ),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info msi_wmi_platform_chip_info_dual =3D =
{
> +	.ops =3D &msi_wmi_platform_ops,
> +	.info =3D msi_wmi_platform_info_dual,
> +};
> +
>  static int msi_wmi_platform_profile_probe(void *drvdata, unsigned long *=
choices)
>  {
>  	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> @@ -1227,9 +1247,11 @@ static int msi_wmi_platform_hwmon_init(struct msi_=
wmi_platform_data *data)
>  {
>  	struct device *hdev;
> =20
> -	hdev =3D devm_hwmon_device_register_with_info(&data->wdev->dev, "msi_wm=
i_platform", data,
> -						    &msi_wmi_platform_chip_info,
> -						    msi_wmi_platform_hwmon_groups);
> +	hdev =3D devm_hwmon_device_register_with_info(
> +		&data->wdev->dev, "msi_wmi_platform", data,
> +		data->quirks->dual_fans ? &msi_wmi_platform_chip_info_dual :
> +					&msi_wmi_platform_chip_info,

This is the wrong approach.

Add the quirk and control visibility from msi_wmi_platform_is_visible(),
like I mentioned in the cover-letter.

--=20
 ~ Kurt

> +		msi_wmi_platform_hwmon_groups);
> =20
>  	return PTR_ERR_OR_ZERO(hdev);
>  }


--7547664b886a80457f05e12aaf30434863635008445c92610d3975c9eb38
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCE0RwAKCRAWYEM49J/U
Zv25AP9O60DveWgtOqx9mfzmImtIK2qOwNEmZufRLXwCZ/BC/QEAlTw0D3y2OfXV
2UHOMMQyN6ApqHOmwFbWuxiwEovoCAM=
=dLWp
-----END PGP SIGNATURE-----

--7547664b886a80457f05e12aaf30434863635008445c92610d3975c9eb38--
