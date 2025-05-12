Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DEE2561CB;
	Mon, 12 May 2025 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077380; cv=none; b=uEgEGFPvT50R2j6F3QsGLXqwkzGjSXdALS3Z6CY4w6rUd3lzyyIddah5pBUUuMckgi8V30WONRtU/3LLTu3JUBpVenk/DSV7ETNQAoHOykn2jZhuXuIptu3R8MvdI1d7hXOfsUuPrqvA7jsbddnvmIBfJppDsOEZU7r6iJy/Z80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077380; c=relaxed/simple;
	bh=csoWxmWxRHcoiw+mcdR3F2D8ykvGSGe3zRxtHmNwDhc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Hm2RYrf+x+WMShtPUCTwANu5rdGv5d5ZCpCKIM7QKhaC8A8aFEy6kLidb3z3p6/3fsFtO6b3wfL04WcGKxTdfSmPpd1FEJ+HHeGFeBAVBStUq67nzP++SsfhktukgpGDowNmYPZfMqb1eJLUXEPp9pJ9PUvrnnMcpLO0zIfnYHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDDNIfWY; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDDNIfWY"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52403e39a23so3275258e0c.2;
        Mon, 12 May 2025 12:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747077377; x=1747682177; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RYSuLkdFz2FZsbrZ/W7pjYu4T4GfGBCPecCYVxKA/cw=;
        b=IDDNIfWYxobqphfjpCmHUa7SS7ZQ97Yag8t6xhXyKWuLbavDJAIqQRQ7YSF28ZAO3+
         quPHOOd4Otuo3BRAyiy34ZD7t/wzWHXjXsL1BXy8ErbsyUBsMpxNYUj5qbUjex+0aPh6
         GzcwV6M2xozFUTa59iXGtMzRlKd+Cqsa6FPPggftOXESHRFapIlhTUZzRdS+dYQVRY++
         xOZ7NfasVJZZTRUaTTa6b9LKPBZlPW3niy18Wv3vBmka6xu/pU1Varf3jeFfDndjkcfK
         L6V2CQ1VuyZf0wiJp0Tcw5HIoYQyTsdbe5GtNNDqM816sIjIC00A1Ns+O5DiNSHyzRzo
         mKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747077377; x=1747682177;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYSuLkdFz2FZsbrZ/W7pjYu4T4GfGBCPecCYVxKA/cw=;
        b=RPkHKDycGiE/cCeItLX9DJDRbEZBCLfuriH8pEZHJk2w6Zfh/shEROIxRFUoMzV0EE
         JtAP2ngEFpQ3vWykZxPaXnwvqlfbMGjEPqcyCgZcMSvE12CKE6NAPJZkuC94Hesh56iA
         mPv0Dd8ilXjh+EFFEyWvc46Nn1KzZKfyavFx33RudtSDvI33OZ3wiPNsIbwdbu6oVSgW
         T+SPwbuJPStKkbDTEdFxeZ0okN5wEhCzqi0j3qOo6S244Qt71kuKHfsv69KN35IRavG6
         amM4q9CwvbZD7hxe2UaAy03PP7gwlWyVZhWeEpYn/mJ3UUuf7b21H5Hr4+URwrOTp/dX
         9dIg==
X-Forwarded-Encrypted: i=1; AJvYcCUa8fKRORCIerA796mdEcFnQxz97qY2fesSSoGBVrlKDzJHfiimHKAziwTRbo0OHPLx5N0Ry9f5htpWQ4LF@vger.kernel.org, AJvYcCUawa81ylf4FKdH7lEvQ50Y4vIapNfhg0k/u8JTLs77dfZsQ4MWFmDqyTo/6L6Pn+2bAk+c1rodY8LAVOVt5BfhnN3OLQ==@vger.kernel.org, AJvYcCW4LoaQDHv6jDzz130qu/hXrNt876nx9+A72+cZ56hzVFCm411KHiVa2ZcGg2bhfpKtMICNvpvutIjM1CE=@vger.kernel.org, AJvYcCWnMhLyCE1EeTydyAPtYqMhSQTNVOftrVV0oJO6HEXo3vIhch+UaCDJvuFmAxB1i1vZZZ1rfl7lsDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbCsY90BOKixQIK9HLoH+KXYWhuqrlo7UKb8NOt9UG7jV1mJiI
	bbSG3W6x/OfVrhFkI5dcTiskQbheJbVD+rKspNK9L0jVFMYpvXPuniXgJg==
X-Gm-Gg: ASbGncsg2WHXDD3MQ7/1dDe07A1gm4zHiULKB0ijbFJCpEO5MTJ9x5GufjthVxhYZm0
	Ay7cNVbqWlGHI2o9bNRMgKJxBqvP2Igh9nNNxoTpsKTgPOsFruJHFCi4lFFy3RIjrTcd2gdyDGR
	jDiBvPiwIjK+jL79Pewr/laQKQ3ajPoCLj2VNJp1jMo1LIqysiMOFrTM+V12pStoOXKwaOJqAbi
	11mSCyLgV1tmo5FPYilSm4DCBbejwiK8c0U0GCWdoDLld/Pd929uo5fcCMyFPW9QfTFIT5yOEl2
	ZgnnB4FvZ2tfa21isIccmSdSpyOtXBsvwKLzdSe/OIEyNUBBhtfKJoE=
X-Google-Smtp-Source: AGHT+IFHQoQemjQLv58nIUo1L8Az0vfwrtj4FK8I9sNBvd3K6hRB1VyQoRijEVWVHfUw7padc6pFtQ==
X-Received: by 2002:a05:6122:1d14:b0:523:dd87:fe95 with SMTP id 71dfb90a1353d-52c53daf2admr11691435e0c.9.1747077376966;
        Mon, 12 May 2025 12:16:16 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6298ebasm5631710241.34.2025.05.12.12.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 12:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5ca082a70d43aa946c92beeef9ccf0d061b858a7f9da8673702484b413ff;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 12 May 2025 16:16:12 -0300
Message-Id: <D9UF8OXHEJKZ.23PW2J8J7VYSZ@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Antheas Kapenekakis" <lkml@antheas.dev>,
 <platform-driver-x86@vger.kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Hans
 de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Jean Delvare" <jdelvare@suse.com>,
 "Guenter Roeck" <linux@roeck-us.net>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v1 10/10] platform/x86: msi-wmi-platform: Restore fan
 curves on PWM disable and unload
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-11-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-11-lkml@antheas.dev>

--5ca082a70d43aa946c92beeef9ccf0d061b858a7f9da8673702484b413ff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> MSI software is a bit weird in that even when the manual fan curve is
> disabled, the fan speed is still somewhat affected by the curve. So
> we have to restore the fan curves on unload and PWM disable, as it
> is done in Windows.
>
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/msi-wmi-platform.c | 123 +++++++++++++++++++++++-
>  1 file changed, 122 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x=
86/msi-wmi-platform.c
> index 7dafe17d4d6be..a917db0300c06 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -123,16 +123,25 @@ struct msi_wmi_platform_quirk {
>  	bool shift_mode;	/* Shift mode is supported */
>  	bool charge_threshold;	/* Charge threshold is supported */
>  	bool dual_fans;		/* For devices with two hwmon fans */
> +	bool restore_curves;	/* Restore factory curves on unload */
>  	int pl_min;		/* Minimum PLx value */
>  	int pl1_max;		/* Maximum PL1 value */
>  	int pl2_max;		/* Maximum PL2 value */
>  };
> =20
> +struct msi_wmi_platform_factory_curves {
> +	u8 cpu_fan_table[32];
> +	u8 gpu_fan_table[32];
> +	u8 cpu_temp_table[32];
> +	u8 gpu_temp_table[32];
> +};
> +
>  struct msi_wmi_platform_data {
>  	struct wmi_device *wdev;
>  	struct msi_wmi_platform_quirk *quirks;
>  	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
>  	struct device *ppdev;
> +	struct msi_wmi_platform_factory_curves factory_curves;
>  	struct acpi_battery_hook battery_hook;
>  	struct device *fw_attrs_dev;
>  	struct kset *fw_attrs_kset;
> @@ -219,6 +228,7 @@ static struct msi_wmi_platform_quirk quirk_gen1 =3D {
>  	.shift_mode =3D true,
>  	.charge_threshold =3D true,
>  	.dual_fans =3D true,
> +	.restore_curves =3D true,
>  	.pl_min =3D 8,
>  	.pl1_max =3D 43,
>  	.pl2_max =3D 45
> @@ -227,6 +237,7 @@ static struct msi_wmi_platform_quirk quirk_gen2 =3D {
>  	.shift_mode =3D true,
>  	.charge_threshold =3D true,
>  	.dual_fans =3D true,
> +	.restore_curves =3D true,
>  	.pl_min =3D 8,
>  	.pl1_max =3D 30,
>  	.pl2_max =3D 37
> @@ -507,6 +518,94 @@ static struct attribute *msi_wmi_platform_hwmon_attr=
s[] =3D {
>  };
>  ATTRIBUTE_GROUPS(msi_wmi_platform_hwmon);
> =20
> +static int msi_wmi_platform_curves_save(struct msi_wmi_platform_data *da=
ta)
> +{
> +	int ret;
> +
> +	data->factory_curves.cpu_fan_table[0] =3D
> +		MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE;
> +	ret =3D msi_wmi_platform_query_unlocked(
> +		data, MSI_PLATFORM_GET_FAN,
> +		data->factory_curves.cpu_fan_table,
> +		sizeof(data->factory_curves.cpu_fan_table));
> +	if (ret < 0)
> +		return ret;
> +	data->factory_curves.cpu_fan_table[0] =3D
> +		MSI_PLATFORM_FAN_SUBFEATURE_CPU_FAN_TABLE;

Is it necessary to set the subfeature again here (and bellow)?

Also there is a lot of code repetition here, I would suggest a helper
function. It will be optimized/inlined by the compiler anyway.

> +
> +	data->factory_curves.gpu_fan_table[0] =3D
> +		MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE;
> +	ret =3D msi_wmi_platform_query_unlocked(
> +		data, MSI_PLATFORM_GET_FAN,
> +		data->factory_curves.gpu_fan_table,
> +		sizeof(data->factory_curves.gpu_fan_table));
> +	if (ret < 0)
> +		return ret;
> +	data->factory_curves.gpu_fan_table[0] =3D
> +		MSI_PLATFORM_FAN_SUBFEATURE_GPU_FAN_TABLE;
> +
> +	data->factory_curves.cpu_temp_table[0] =3D
> +		MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE;
> +	ret =3D msi_wmi_platform_query_unlocked(
> +		data, MSI_PLATFORM_GET_TEMPERATURE,
> +		data->factory_curves.cpu_temp_table,
> +		sizeof(data->factory_curves.cpu_temp_table));
> +	if (ret < 0)
> +		return ret;
> +	data->factory_curves.cpu_temp_table[0] =3D
> +		MSI_PLATFORM_FAN_SUBFEATURE_CPU_TEMP_TABLE;
> +
> +	data->factory_curves.gpu_temp_table[0] =3D
> +		MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE;
> +	ret =3D msi_wmi_platform_query_unlocked(
> +		data, MSI_PLATFORM_GET_TEMPERATURE,
> +		data->factory_curves.gpu_temp_table,
> +		sizeof(data->factory_curves.gpu_temp_table));
> +	if (ret < 0)
> +		return ret;
> +	data->factory_curves.gpu_temp_table[0] =3D
> +		MSI_PLATFORM_FAN_SUBFEATURE_GPU_TEMP_TABLE;
> +
> +	return 0;
> +}
> +
> +static int msi_wmi_platform_curves_load(struct msi_wmi_platform_data *da=
ta)
> +{
> +	u8 buffer[32] =3D { };
> +	int ret;
> +
> +	memcpy(buffer, data->factory_curves.cpu_fan_table,
> +	       sizeof(data->factory_curves.cpu_fan_table));
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_FAN,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;

A helper for this operation would be nice too.

> +
> +	memcpy(buffer, data->factory_curves.gpu_fan_table,
> +	       sizeof(data->factory_curves.gpu_fan_table));
> +	ret =3D msi_wmi_platform_query_unlocked(data, MSI_PLATFORM_SET_FAN,
> +					      buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	memcpy(buffer, data->factory_curves.cpu_temp_table,
> +	       sizeof(data->factory_curves.cpu_temp_table));
> +	ret =3D msi_wmi_platform_query_unlocked(
> +		data, MSI_PLATFORM_SET_TEMPERATURE, buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	memcpy(buffer, data->factory_curves.gpu_temp_table,
> +	       sizeof(data->factory_curves.gpu_temp_table));
> +	ret =3D msi_wmi_platform_query_unlocked(
> +		data, MSI_PLATFORM_SET_TEMPERATURE, buffer, sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +
>  static umode_t msi_wmi_platform_is_visible(const void *drvdata, enum hwm=
on_sensor_types type,
>  					   u32 attr, int channel)
>  {
> @@ -603,9 +702,19 @@ static int msi_wmi_platform_write(struct device *dev=
, enum hwmon_sensor_types ty
>  				return -EINVAL;
>  			}
> =20
> -			return msi_wmi_platform_query_unlocked(
> +			ret =3D msi_wmi_platform_query_unlocked(
>  				data, MSI_PLATFORM_SET_AP, buffer,
>  				sizeof(buffer));
> +			if (ret < 0)
> +				return ret;
> +
> +			if (val =3D=3D 2 && data->quirks->restore_curves) {
> +				ret =3D msi_wmi_platform_curves_load(data);
> +				if (ret < 0)
> +					return ret;
> +			}
> +
> +			return 0;
>  		default:
>  			return -EOPNOTSUPP;
>  		}
> @@ -1373,6 +1482,13 @@ static int msi_wmi_platform_probe(struct wmi_devic=
e *wdev, const void *context)
> =20
>  	msi_wmi_platform_profile_setup(data);
> =20
> +	if (data->quirks->restore_curves) {
> +		guard(mutex)(&data->wmi_lock);

We don't need locking here. data->factory_curves is not shared until you
register the hwmon device.

> +		ret =3D msi_wmi_platform_curves_save(data);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	return msi_wmi_platform_hwmon_init(data);
>  }
> =20
> @@ -1382,6 +1498,11 @@ static void msi_wmi_platform_remove(struct wmi_dev=
ice *wdev)
> =20
>  	if (data->quirks->charge_threshold)
>  		battery_hook_unregister(&data->battery_hook);
> +
> +	if (data->quirks->restore_curves) {
> +		guard(mutex)(&data->wmi_lock);

We can avoid locking here by adding a devm action that restores the
curves. devm resources are unloaded in LIFO order.

Please, also check my comments on [Patch 2]. I don't think that patch is
needed.

--=20
 ~ Kurt

> +		msi_wmi_platform_curves_load(data);
> +	}
>  }
> =20
>  static const struct wmi_device_id msi_wmi_platform_id_table[] =3D {


--5ca082a70d43aa946c92beeef9ccf0d061b858a7f9da8673702484b413ff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCJJAAAKCRAWYEM49J/U
ZsklAP4nP+TLLnauvq9QNwdLDzn1mhru1skaFEs6UZfARtrQWgEAoWwjSMYzbHky
NEul9sSHiTtk8t2DDwCv4E5z70V7kAY=
=mk39
-----END PGP SIGNATURE-----

--5ca082a70d43aa946c92beeef9ccf0d061b858a7f9da8673702484b413ff--
