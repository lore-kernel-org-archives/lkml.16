Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7861BC3F;
	Tue, 13 May 2025 20:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169063; cv=none; b=Ck/N2GZW7PDFLF5zLSSMJZoFaeAwK+mblh7Kbe7o7hKCwNKAdv7vJxuqFT4ffLTX/7y2ogk+P9ArnUKh3o0Y9UfL2nGaB29+tjHlpUJ3sYBdOXyHg2lRN9O4YoODSu4ueKcYOrixlw8rzgjorKJJrtRfK5piffaJkPx99fCyQ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169063; c=relaxed/simple;
	bh=iRQACn3A17OEJJu1tgTKdDRpXBS3pg0OJSCkRrlQsFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/6gbRug4hI3vOnalHNfppMcYUF0AOJpViAqxp/3jor4/lsvEClH3Mkw1wAb850MotvkuhDvsfyWar2D4jSPpYk2L3dJmBcnG4HTyMYPqMb57ulrTQLk1gVEElJTW6nnWxEBH0bHIWQkDREa/qT14GdfJHdvp3QGhUyGM+5ujUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qtWD+wm9; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qtWD+wm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747169034; x=1747773834; i=w_armin@gmx.de;
	bh=CrhKrW9KfcFJ40D7875MMr8Mvd4CC0R5bJh4ccb/Hxw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qtWD+wm9Kb3Dq7RF5AXwCNcdeaziZlSc7mNau5jhrkHgyp3bdGQ1kNgsgfEBnb2k
	 jY2xCYRqNOTEdjta2CQ62Rly4hCQNi/qkcLXo72+y0voV0Cyh4nfUPsCiT07tqO9N
	 ZogaxKCAhIOmGKDyXdHAzXGolESsM4Vbwhe2t+LPMW+qDizzDIjgSBzpt7LXqL/IL
	 V8c9NndPe9QAYIll8mqPsNqs++hLz1JzAorXUCvQqYW0JEY+Vp3u7VmRLJ6ecy2ss
	 WOBkepLSVwL9rOX3hRUnGNKe1Yb7MJs+xdODoRFiBGrDpJWxrWeaBgMGo9OsdTu0S
	 IOHI9FtZxOWIwFnuTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mdeb5-1unj8F1wZd-00bxAD; Tue, 13
 May 2025 22:43:54 +0200
Message-ID: <70b63140-1e68-4db2-acb0-896636926dfd@gmx.de>
Date: Tue, 13 May 2025 22:43:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/10] platform/x86: msi-wmi-platform: Add quirk system
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-4-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511204427.327558-4-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uthdLKBG+jQtzcJyWMYdKHo3bCU/baE3Y0Yi3+Vr5/cPxKcWlMP
 pwI8eyD98TlZu6OFavmjb1JtlpBZzZ3aZ2miyBqgyVeQcajE+2jqrjPYeerWw61gUg4M3cq
 fNhVyRg93dXpHireHfEr2DqnwOzKIkVSr/7V3od6oKAnRCE1GQJhRqQSf4PcZOAn0G/thgZ
 AfdMgIAs+YLYSOVp+RJnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wxNzT4Ic4S0=;KWLfnDArL1VbwZfCEn2LLaQh10c
 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

Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:

> MSI uses the WMI interface as a passthrough for writes to the EC
> and uses a board name match and a quirk table from userspace on
> Windows. Therefore, there is no auto-detection functionality and
> we have to fallback to a quirk table.
>
> Introduce it here, prior to starting to add features to it.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/msi-wmi-platform.c | 45 +++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
>
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/=
x86/msi-wmi-platform.c
> index f0d1b8e1a2fec..408d42ab19e20 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -14,6 +14,7 @@
>   #include <linux/debugfs.h>
>   #include <linux/device.h>
>   #include <linux/device/driver.h>
> +#include <linux/dmi.h>
>   #include <linux/errno.h>
>   #include <linux/hwmon.h>
>   #include <linux/kernel.h>
> @@ -79,8 +80,12 @@ enum msi_wmi_platform_method {
>   	MSI_PLATFORM_GET_WMI		=3D 0x1d,
>   };
>  =20
> +struct msi_wmi_platform_quirk {
> +};
> +
>   struct msi_wmi_platform_data {
>   	struct wmi_device *wdev;
> +	struct msi_wmi_platform_quirk *quirks;
>   	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
>   };
>  =20
> @@ -124,6 +129,39 @@ static const char * const msi_wmi_platform_debugfs_=
names[] =3D {
>   	"get_wmi"
>   };
>  =20
> +static struct msi_wmi_platform_quirk quirk_default =3D {};
> +static struct msi_wmi_platform_quirk quirk_gen1 =3D {
> +};
> +static struct msi_wmi_platform_quirk quirk_gen2 =3D {
> +};
> +
> +static const struct dmi_system_id msi_quirks[] =3D {
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

I would prefer if we rely on the model code reported by the embedded contr=
oller instead of
the SMBIOS board name.

The model code is contained inside the firmware string returned by the Get=
_EC() WMI method,
see https://github.com/BeardOverflow/msi-ec/blob/main/docs/device_support_=
guide.md (section "Additional Info") for details.
This way support for devices sharing a model code can be implemented more =
efficiently.

I suggest we extract this model code inside msi_wmi_platform_ec_init() and=
 perform the quirk matching there.

Thanks,
Armin Wolf

> +
>   static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *o=
utput, size_t length)
>   {
>   	if (obj->type !=3D ACPI_TYPE_BUFFER)
> @@ -413,6 +451,7 @@ static int msi_wmi_platform_init(struct msi_wmi_plat=
form_data *data)
>   static int msi_wmi_platform_probe(struct wmi_device *wdev, const void =
*context)
>   {
>   	struct msi_wmi_platform_data *data;
> +	const struct dmi_system_id *dmi_id;
>   	int ret;
>  =20
>   	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> @@ -422,6 +461,12 @@ static int msi_wmi_platform_probe(struct wmi_device=
 *wdev, const void *context)
>   	data->wdev =3D wdev;
>   	dev_set_drvdata(&wdev->dev, data);
>  =20
> +	dmi_id =3D dmi_first_match(msi_quirks);
> +	if (dmi_id)
> +		data->quirks =3D dmi_id->driver_data;
> +	else
> +		data->quirks =3D &quirk_default;
> +
>   	ret =3D devm_mutex_init(&wdev->dev, &data->wmi_lock);
>   	if (ret < 0)
>   		return ret;
