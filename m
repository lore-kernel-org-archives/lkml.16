Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E371B393C;
	Sun, 11 May 2025 23:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747006303; cv=none; b=XBllFrvjnhoDl3aDW3OHzuLbg2VVyM5alzLUO7oHjgIjzQYmq3Co+huoghAxppwnRLy+ayNTtWz9dDSNt2hHB6jhT3rvrUsDhA+A2q7r1Bl3NHx2vJ5BwBUAsq2xb0r582+vjDVn/mxqp2+PM3Bpmrk/Uoxt0z6Mto9O3dPj+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747006303; c=relaxed/simple;
	bh=0roI/JZWscX9NQeOjyFr3qhVhps94hu0D1pTW3mYU8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Bf0cM/8Kcfo1noAIkRExYCk8dw48lmhaKDE5BHXtoSaVtWdQbscPcI9SShoWIpCfNdFWu/YucLVJbtlhjEzWuZMyauGU4YbG+NNsdFBGwaezAbMy6jtP7K3K1ndoyYWRze/aaRJXUrf+tI9e7GtXEhh5SuqplAf5ujEZYHC2cUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciJ3WU+4; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciJ3WU+4"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52410fb2afeso3275921e0c.3;
        Sun, 11 May 2025 16:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747006300; x=1747611100; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:cc:to:from:subject
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYu5VOY34dRYDM9OJQkhQ6AP2jEXR8+108A2ODvYCho=;
        b=ciJ3WU+4+pwG9xMEXIMQ9LDf9+01jlB3C9ZTZTqy9MYsIGVLfrNyw3T0gTajEh1BrQ
         ejNB/XCR0zUbpmY1Uuty7+/7YZlVb0E+YklVrTCN4iceOw5gtwp5yfk3bTImJfR5nuj7
         btht9LmN7oizukxXPBIOrF4sBZvn9uuCXUc7ON1KZLiW/BOi8cfTMr7AOqZ/tCdgxr+U
         q9uBURPAo2VdNG1/Hca1ZjF7fs82Zb3Ym9CpzXcj9UQmc2ujtSEzg1GXxS6UJc+3eke7
         /ukg7icH7GG+zQ+Gml4HiKacesefb3mEJRiZquFks4zEUQUBEYABVKfGN5064T3WIyPi
         fmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747006300; x=1747611100;
        h=in-reply-to:references:content-transfer-encoding:cc:to:from:subject
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hYu5VOY34dRYDM9OJQkhQ6AP2jEXR8+108A2ODvYCho=;
        b=XI0jdlXhxcsssvI2E6bGtZFqSX5/aqnkx+uolUUHbi6WNwP/wJnv4sekuo81+Efig4
         3QaWpAHVbTkRlZbHPg8BmWIaJXh9Fq7H4YtmxEr4hM6cbsZTAyWBriN1n9Pe9NsrtNw2
         y+0jcluI8NvvFJEenwRbVhgL4BoZmDYbh5H+oaalf4HJlxEsRgjXe1EOZPhlelmP9twg
         1WQU2oTtFdfCnPnO5j8pJi148+7d9an9ZQ9vEVgg+jYimdkPmdOPdaF38ulz3QaqLy6O
         r7QlTKEj9E0AtUQvpFtnC1RlZrJ8jyAH2RFHNPP8hfNOVlrqKUWlXmzN7t+nCcfqFTQe
         V8DA==
X-Forwarded-Encrypted: i=1; AJvYcCUHyqbYub7E0GnmO1lcA+8IxOHi4/rgJCbYh0sztyn2FqSiX4M9DsM4pQTBW0wKOIXNO06pb4MUTZg0dao=@vger.kernel.org, AJvYcCUTsUWaXrYtxE+wIFkxzEA+oTNN4F8vOgImqzSoKlUNDI5uQPgeZs9VqbfDWzEL2Ozvi/eCXO08fXaJroIi@vger.kernel.org, AJvYcCWex1KdbGK0Z18HiRvQDgMhFB0L9Vo19thMEsxZbG9QnYEcDjFfeWczFt7Kpbb5PMi+elWCsOcvn/A=@vger.kernel.org, AJvYcCX7VXYu+jhT/1/KAbrtOrcu9BRW8I0faAlx3tQiNvkNQiClwO7BmC4mknl5V8YTLhaPHHPoK5pUPWHxXOG9Q7cqwdGcJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2PgZHkDzsONtvd4HZT8WDM8XVn9Xvqvwiu8OO6ExNcvVwr2K
	HFO/iEe2T+vc/lxp+qAEJ+P2fHZ7mj325fTIuOd3oiHWe5WSmurS
X-Gm-Gg: ASbGncsIAvddIzrcqeUo4SLjBjvXVyfJXsPq7b93MMlBNZc3rJxXvf6bjZDyChc8ALp
	juAutpL50VjX0AzBMxLuudwpRcQc5d47U/aNJ2LKRmB/bGzvMJvpDVtVgxSpY4/gstqY5hW59SB
	fOyimBv99IyjrT/BbGZc1Ki2EQlHuhicUwz+dgyi6fVUaT7ANo2W4R47K9el5Yc+XANEEsV65hy
	PvcaLfB9a+rVWJcXpW3fgjyPLAempeM89u99HjQ4I7ML8RwLlqGorIys6aRSHX2/q9tRSX75yNv
	MFjTX7KVU22ctA6I8uQd3XzMpg+9NyK7C1Sx15xwSch8
X-Google-Smtp-Source: AGHT+IGjw4THN6/CYxPynC8am/IeTYFioe3qgu2m7gcbGWFdTFPKqPOv3p/ao5tYt1WhUTRqy6HkiQ==
X-Received: by 2002:a05:6102:1586:b0:4c1:a15c:ab5c with SMTP id ada2fe7eead31-4deed3cf763mr8483575137.20.1747006300185;
        Sun, 11 May 2025 16:31:40 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f626c5b1sm4207930241.22.2025.05.11.16.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 16:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=afce0acdc6ff1c5169616ac0d9d196ee2754539f42460cfad411b3e51f0c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 11 May 2025 20:31:35 -0300
Message-Id: <D9TQ1OS3HDY7.DR4X47HLSEND@gmail.com>
Subject: Re: [PATCH v1 01/10] platform/x86: msi-wmi-platform: Use input
 buffer for returning result
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
 <20250511204427.327558-2-lkml@antheas.dev>
In-Reply-To: <20250511204427.327558-2-lkml@antheas.dev>

--afce0acdc6ff1c5169616ac0d9d196ee2754539f42460cfad411b3e51f0c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> From: Armin Wolf <W_Armin@gmx.de>
>
> Modify msi_wmi_platform_query() to reuse the input buffer for
> returning the result of a WMI method call. Using a separate output
> buffer to return the result is unnecessary because the WMI interface
> requires both buffers to have the same length anyway.
>
> Co-developed-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/msi-wmi-platform.c | 53 ++++++++++++-------------
>  1 file changed, 26 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x=
86/msi-wmi-platform.c
> index dc5e9878cb682..41218a9d6e35d 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -21,6 +21,7 @@
>  #include <linux/mutex.h>
>  #include <linux/printk.h>
>  #include <linux/rwsem.h>
> +#include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
> =20
> @@ -140,19 +141,19 @@ static int msi_wmi_platform_parse_buffer(union acpi=
_object *obj, u8 *output, siz
>  }
> =20
>  static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
> -				  enum msi_wmi_platform_method method, u8 *input,
> -				  size_t input_length, u8 *output, size_t output_length)
> +				  enum msi_wmi_platform_method method, u8 *buffer,
> +				  size_t length)
>  {
>  	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
>  	struct acpi_buffer in =3D {
> -		.length =3D input_length,
> -		.pointer =3D input
> +		.length =3D length,
> +		.pointer =3D buffer
>  	};
>  	union acpi_object *obj;
>  	acpi_status status;
>  	int ret;
> =20
> -	if (!input_length || !output_length)
> +	if (!length)
>  		return -EINVAL;
> =20
>  	/*
> @@ -169,7 +170,7 @@ static int msi_wmi_platform_query(struct msi_wmi_plat=
form_data *data,
>  	if (!obj)
>  		return -ENODATA;
> =20
> -	ret =3D msi_wmi_platform_parse_buffer(obj, output, output_length);
> +	ret =3D msi_wmi_platform_parse_buffer(obj, buffer, length);
>  	kfree(obj);
> =20
>  	return ret;
> @@ -185,17 +186,15 @@ static int msi_wmi_platform_read(struct device *dev=
, enum hwmon_sensor_types typ
>  				 int channel, long *val)
>  {
>  	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> -	u8 input[32] =3D { 0 };
> -	u8 output[32];
> +	u8 buffer[32] =3D { 0 };
>  	u16 value;
>  	int ret;
> =20
> -	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, input, sizeo=
f(input), output,
> -				     sizeof(output));
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buf, sizeof(=
buf));

s/buf/buffer/

>  	if (ret < 0)
>  		return ret;
> =20
> -	value =3D get_unaligned_be16(&output[channel * 2 + 1]);
> +	value =3D get_unaligned_be16(&buffer[channel * 2 + 1]);
>  	if (!value)
>  		*val =3D 0;
>  	else
> @@ -245,13 +244,17 @@ static ssize_t msi_wmi_platform_write(struct file *=
fp, const char __user *input,
>  		return ret;
> =20
>  	down_write(&data->buffer_lock);
> -	ret =3D msi_wmi_platform_query(data->data, data->method, payload, data-=
>length, data->buffer,
> +	ret =3D msi_wmi_platform_query(data->data, data->method, data->buffer,

Is this logic right? Shouldn't we pass payload instead of data->buffer?

Better yet, I think we should write the payload directly to
data->buffer and drop the memcpy hunk bellow

--=20
 ~ Kurt

>  				     data->length);
>  	up_write(&data->buffer_lock);
> =20
>  	if (ret < 0)
>  		return ret;
> =20
> +	down_write(&data->buffer_lock);
> +	memcpy(data->buffer, payload, data->length);
> +	up_write(&data->buffer_lock);
> +
>  	return length;
>  }
> =20
> @@ -348,23 +351,21 @@ static int msi_wmi_platform_hwmon_init(struct msi_w=
mi_platform_data *data)
> =20
>  static int msi_wmi_platform_ec_init(struct msi_wmi_platform_data *data)
>  {
> -	u8 input[32] =3D { 0 };
> -	u8 output[32];
> +	u8 buffer[32] =3D { 0 };
>  	u8 flags;
>  	int ret;
> =20
> -	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_EC, input, sizeof=
(input), output,
> -				     sizeof(output));
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_EC, buffer, sizeo=
f(buffer));
>  	if (ret < 0)
>  		return ret;
> =20
> -	flags =3D output[MSI_PLATFORM_EC_FLAGS_OFFSET];
> +	flags =3D buffer[MSI_PLATFORM_EC_FLAGS_OFFSET];
> =20
>  	dev_dbg(&data->wdev->dev, "EC RAM version %lu.%lu\n",
>  		FIELD_GET(MSI_PLATFORM_EC_MAJOR_MASK, flags),
>  		FIELD_GET(MSI_PLATFORM_EC_MINOR_MASK, flags));
>  	dev_dbg(&data->wdev->dev, "EC firmware version %.28s\n",
> -		&output[MSI_PLATFORM_EC_VERSION_OFFSET]);
> +		&buffer[MSI_PLATFORM_EC_VERSION_OFFSET]);
> =20
>  	if (!(flags & MSI_PLATFORM_EC_IS_TIGERLAKE)) {
>  		if (!force)
> @@ -378,27 +379,25 @@ static int msi_wmi_platform_ec_init(struct msi_wmi_=
platform_data *data)
> =20
>  static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
>  {
> -	u8 input[32] =3D { 0 };
> -	u8 output[32];
> +	u8 buffer[32] =3D { 0 };
>  	int ret;
> =20
> -	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_WMI, input, sizeo=
f(input), output,
> -				     sizeof(output));
> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_WMI, buffer, size=
of(buffer));
>  	if (ret < 0)
>  		return ret;
> =20
>  	dev_dbg(&data->wdev->dev, "WMI interface version %u.%u\n",
> -		output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
> -		output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
> +		buffer[MSI_PLATFORM_WMI_MAJOR_OFFSET],
> +		buffer[MSI_PLATFORM_WMI_MINOR_OFFSET]);
> =20
> -	if (output[MSI_PLATFORM_WMI_MAJOR_OFFSET] !=3D MSI_WMI_PLATFORM_INTERFA=
CE_VERSION) {
> +	if (buffer[MSI_PLATFORM_WMI_MAJOR_OFFSET] !=3D MSI_WMI_PLATFORM_INTERFA=
CE_VERSION) {
>  		if (!force)
>  			return -ENODEV;
> =20
>  		dev_warn(&data->wdev->dev,
>  			 "Loading despite unsupported WMI interface version (%u.%u)\n",
> -			 output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
> -			 output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
> +			 buffer[MSI_PLATFORM_WMI_MAJOR_OFFSET],
> +			 buffer[MSI_PLATFORM_WMI_MINOR_OFFSET]);
>  	}
> =20
>  	return 0;


--afce0acdc6ff1c5169616ac0d9d196ee2754539f42460cfad411b3e51f0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaCEzWwAKCRAWYEM49J/U
ZkBMAP0QCgQ8EFPcTh4IoLvioMBBfkMLrclFRvUl645QwDqXDAEAmsF1S/lg6S5o
GIP14336be7q5bbk6UoYVBVxC4AECws=
=m/5S
-----END PGP SIGNATURE-----

--afce0acdc6ff1c5169616ac0d9d196ee2754539f42460cfad411b3e51f0c--
