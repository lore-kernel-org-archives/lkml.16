Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07846208D7;
	Mon, 10 Feb 2025 04:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160032; cv=none; b=VdjXq5+RJps92jpKN4bHcz2rKJ7RCVB0m/XPHu11Zhknvdafl1Fv4U3TwP7ZAWVKz7MA8vrxu5/DZKppxcKGKRapDJiLF8s1VsLB7mZdfKV/VwcolC04tV10AWJdQdCFrBnaPqU332IReFdkQQbF9C7cwJvXkZKntCUzaoCuUdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160032; c=relaxed/simple;
	bh=sAigv+ZBWOzceL+5Qv+lyjh0RApPCEiILO5iemSK3No=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uWNM6tkFnA84KP6DRFvbo+yNMeZrnSjMmHpvJcMHQTThRyEj88D9BJiqo62s71syDV7byiNDzrAQx2rvZhTgo+hohbFNZICXAvW4uhcXzRQIb0CMngzUQQ0rjHtL5JCExQw2y0iS2l/IDSCycNXw3NIX5qZTDiYHR/ekfap5ojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtOBI2eR; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtOBI2eR"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f6c90b51c3so30915297b3.2;
        Sun, 09 Feb 2025 20:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739160030; x=1739764830; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmdcIHm53nyzDfWeNL0sIm/BNqO0dVi7BIogLdz6YDY=;
        b=AtOBI2eR0EsWYFFpLyRYy9nallFKUgn+9x4wNx09G37EKAuLbed7/IYjFeUNs57VNj
         /3OT0ZSPBm5S5uTzuqBdGE2QJ897WA4TbNhZliWwSxBzIaHZXHirS00wWEHF4nuL0xEr
         kQgoES203cc9B7DshUSzAPF3uoUWZENsVKDKuOxQVUHJppmEQXaUlIa+a7xRD0f2M9Pi
         7ffz5scBg7NKVrr7THkitVJykmZGUBbDBAzSf2+dMxHATKMHzbsNwq3A95/TTfW5Lh3u
         RmUOjhGL5zo4Iw+4N4N1ihlaacvrjGKAd7fJMgCgikrZcK9s8VNtRL1DO02AT4WIsFfD
         CQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739160030; x=1739764830;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vmdcIHm53nyzDfWeNL0sIm/BNqO0dVi7BIogLdz6YDY=;
        b=FkKCp71g9PyBznMJR2ldngHniqBaac2t6jEu6h7x95gCuEcxu0okfCUXFUD/kjA0j3
         YJHnYOyA4rFS72Fu8smxfFLjRj0TdEJDQ883Cw5OKEsdyGxbOGfyZ7qnQ+zVj5Tvc7HP
         CvnFoQ8cokyVoEOAw1NGYbeN3gT4hvn0Tnkfjnmr005mw7uY8527Zs0t0i31KFaz9+mA
         0XDOpP9Jj/WKim3gg7nct+H+pHl4KJTtihK5ku0qAQ8gn3KcHzieLK0N8rT2v9PWQl3v
         NdR+xLSOKgvfpMd5kRcMzWzv3+JFu6uvOkG5ttP1dvp13ZzXnejib0F1l3KhAGy0bItR
         zH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPrHEERPE0CFjCMYkJS2ecAf0KSntMjX/ttuK9/Er66iA9cOfousWd+/ZJic2887L54yE79uwthRWFySRjGHSJ//bl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0uBy8kxJDJ5YE7ohk4jLiOsSY+FdzV8u51ZL09Rbb5H7HUDZc
	PilY0fSxED8b39tRzlr+epzxxdxZnxJHT/Dbx18i/XyYS4HXN52W
X-Gm-Gg: ASbGnct9mGnQpHR9hvbk8mmagKVRZO/2CZ1+O1cs+2P+3g+04G6FyRd6aWT2Rc6z3NI
	+54M6Q2fD6FKSEhin4eHaz4QUvuCD4t57ViQ9XJk9Uls7pOVMTyKUF1tkMfqxzUZUhgJh5dhKGy
	cGPTe4gTvAFlV0GVWsfKAk9AgrD2pgsj5C9uY9kDZ7fPZvXENl5cjiq0qaBmVeVLXJadtgqGut9
	OYyQ6vPuhLGpioZVE60LCIxy+BHRBzK2hSniKHS+2Knt50qB50roOjC3V1bfs4CQr9lJHvOkB0L
	9Qbuc18=
X-Google-Smtp-Source: AGHT+IEG4FMCFIxLPkkJQ7+BUTLW5bSukFt1CP/qFIrPPQa1CzuDjPQmFWWQTuxXegura/RcNc7cmg==
X-Received: by 2002:a05:690c:c08:b0:6f9:525d:a096 with SMTP id 00721157ae682-6f9b280fd6fmr103731377b3.3.1739160029722;
        Sun, 09 Feb 2025 20:00:29 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fceff5csm14706147b3.9.2025.02.09.20.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 20:00:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Feb 2025 23:00:27 -0500
Message-Id: <D7OGRYOVJDJR.1JJOZXO4FIAZC@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <dongeg1@lenovo.com>, "Mark Pearson" <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] platform/x86: lenovo-super-hotkey-wmi.c: Support for
 mic and audio mute LEDs
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jackie Dong" <xy-jackie@139.com>, <hdegoede@redhat.com>,
 <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250208144114.11685-1-xy-jackie@139.com>
In-Reply-To: <20250208144114.11685-1-xy-jackie@139.com>

Hi Jackie,

I noticed a few things while going through your patch:

On Sat Feb 8, 2025 at 9:41 AM -05, Jackie Dong wrote:
> Implement Lenovo utility data WMI calls needed to make LEDs
> work on Ideapads that support this GUID.
> This enables the mic and audio LEDs to be updated correctly.
>
> Tested on below samples.
> ThinkBook 13X Gen4 IMH
> ThinkBook 14 G6 ABP
> ThinkBook 16p Gen4-21J8
> ThinkBook 16p Gen8-IRL
> ThinkBook 16p G7+ ASP
>
> Signed-off-by: Jackie Dong <xy-jackie@139.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v3:
>  - Changed the name of the Kconfig entry to LENOVO_SUPER_HOTKEY_WMI
>  - Renamed everything in this driver which contains the name "ideapad"
>    to instead contain the name of this driver.
>  - Moved struct wmi_device *led_wdev in lenovo_super_hotkey_wmi_private,
>    and use container_of() to the led_wdev pointer.
>  - Replaced sizeof(struct wmi_led_args) by sizeof(led_arg)
>  - Added condtions checking for obj && obj->type =3D=3D ACPI_TYPE_INTEGER
>    and free the ACPI object after get the required value.
>  - Removed led_classdev_unregister() after led_reg_failed label, but
>    add lenovo_super_hotkey_wmi_remove(struct wmi_device *wdev) to free
>    resource.
>  - Removed IDEAPAD_WMI_EVENT_FN_KEYS/IDEAPAD_WMI_EVENT_LUD_KEYS related
>    source codes and only keep LUD_WMI_METHOD_GUID.
>
> Changes in v2:
>  - Update code layout and formatting as recommended in review
>  - Improved error handling in ideapad_wmi_led_init
>  - Separated a WMI driver named lenovo-super-hotkey-wmi.c from
>    ideapad-lap.c, it's only for Lenovo Super Hotkey WMI devices.
>
>  drivers/platform/x86/Kconfig                  |   9 +
>  drivers/platform/x86/Makefile                 |   1 +
>  .../platform/x86/lenovo-super-hotkey-wmi.c    | 248 ++++++++++++++++++
>  3 files changed, 258 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-super-hotkey-wmi.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..c1792e8f04e1 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -475,6 +475,15 @@ config IDEAPAD_LAPTOP
>  	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  	  rfkill switch, hotkey, fan control and backlight control.
> =20
> +config LENOVO_SUPER_HOTKEY_WMI
> +	tristate "Lenovo Super Hotkey Utility WMI extras driver"
> +	depends on ACPI_WMI
> +	depends on IDEAPAD_LAPTOP
> +	help
> +	  This driver provides WMI support for Lenovo customized hotkeys functi=
on
> +	  of Lenovo NoteBooks which are for Consumer and SMB customers, such as
> +	  Ideapad/YOGA/XiaoXin/Gaming/ThinkBook and so on.
> +
>  config LENOVO_YMC
>  	tristate "Lenovo Yoga Tablet Mode Control"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index e1b142947067..598335da9f55 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
>  # IBM Thinkpad and Lenovo
>  obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl.o
>  obj-$(CONFIG_IDEAPAD_LAPTOP)	+=3D ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_SUPER_HOTKEY_WMI)	+=3D lenovo-super-hotkey-wmi.o
>  obj-$(CONFIG_LENOVO_YMC)	+=3D lenovo-ymc.o
>  obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
> diff --git a/drivers/platform/x86/lenovo-super-hotkey-wmi.c b/drivers/pla=
tform/x86/lenovo-super-hotkey-wmi.c
> new file mode 100644
> index 000000000000..e677bd11fa2f
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
> + *
> + *  Copyright (C) 2025	Lenovo
> + */
> +
> +#include <linux/leds.h>
> +#include <linux/wmi.h>
> +#include "ideapad-laptop.h"
> +
> +/* Lenovo Super Hotkey WMI GUIDs */
> +#define LUD_WMI_METHOD_GUID	"CE6C0974-0407-4F50-88BA-4FC3B6559AD8"
> +
> +/* Lenovo Utility Data WMI method_id */
> +#define WMI_LUD_GET_SUPPORT 1
> +#define WMI_LUD_SET_FEATURE 2
> +
> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
> +
> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
> +
> +/* Input parameters to mute/unmute audio LED and Mic LED */
> +struct wmi_led_args {
> +	u8 id;
> +	u8 subid;
> +	u16 value;
> +};
> +
> +/* Values of input parameters to SetFeature of audio LED and Mic LED */
> +enum hotkey_set_feature {
> +	MIC_MUTE_LED_ON =3D 1,
> +	MIC_MUTE_LED_OFF,
> +	AUDIO_MUTE_LED_ON =3D 4,
> +	AUDIO_MUTE_LED_OFF,
> +};
> +
> +#define LSH_ACPI_LED_MAX 2
> +
> +enum lenovo_super_hotkey_wmi_event_type {
> +	LSH_WMI_EVENT_LUD_KEYS =3D 2,
> +};
> +
> +struct lenovo_super_hotkey_wmi_private {
> +	enum lenovo_super_hotkey_wmi_event_type event;
> +	struct led_classdev cdev[LSH_ACPI_LED_MAX];
> +	struct wmi_device *led_wdev;
> +};
> +
> +enum mute_led_type {
> +	MIC_MUTE,
> +	AUDIO_MUTE,
> +};
> +
> +static int lsh_wmi_mute_led_set(enum mute_led_type led_type, struct led_=
classdev *led_cdev,
> +				enum led_brightness brightness)
> +
> +{
> +	struct lenovo_super_hotkey_wmi_private *wpriv =3D container_of(led_cdev=
,
> +			struct lenovo_super_hotkey_wmi_private, cdev[led_type]);
> +	struct wmi_led_args led_arg =3D {0, 0, 0};
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		led_arg.id =3D brightness =3D=3D LED_ON ? MIC_MUTE_LED_ON : MIC_MUTE_L=
ED_OFF;
> +		break;
> +	case AUDIO_MUTE:
> +		led_arg.id =3D brightness =3D=3D LED_ON ? AUDIO_MUTE_LED_ON : AUDIO_MU=
TE_LED_OFF;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	input.length =3D sizeof(led_arg);
> +	input.pointer =3D &led_arg;
> +	status =3D wmidev_evaluate_method(wpriv->led_wdev, 0, WMI_LUD_SET_FEATU=
RE, &input, NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int lsh_wmi_audiomute_led_set(struct led_classdev *led_cdev,
> +				     enum led_brightness brightness)
> +
> +{
> +	return lsh_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
> +}
> +
> +static int lsh_wmi_micmute_led_set(struct led_classdev *led_cdev,
> +				   enum led_brightness brightness)
> +{
> +	return lsh_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
> +}
> +
> +static int lenovo_super_hotkey_wmi_led_init(enum mute_led_type led_type,=
 struct device *dev)
> +{
> +	struct lenovo_super_hotkey_wmi_private *wpriv =3D dev_get_drvdata(dev);
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	int led_version, err =3D 0;
> +	unsigned int wmiarg;
> +	acpi_status status;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		wmiarg =3D WMI_LUD_GET_MICMUTE_LED_VER;
> +		break;
> +	case AUDIO_MUTE:
> +		wmiarg =3D WMI_LUD_GET_AUDIOMUTE_LED_VER;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	input.length =3D sizeof(wmiarg);
> +	input.pointer =3D &wmiarg;
> +	status =3D wmidev_evaluate_method(wpriv->led_wdev, 0, WMI_LUD_GET_SUPPO=
RT, &input, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj =3D output.pointer;
> +	if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +		led_version =3D obj->integer.value;
> +		kfree(output.pointer);

Maybe you should use <linux/cleanup.h> instead, to avoid memory bugs.
Something like:

	union acpi_object *obj __free(kfree) =3D out.pointer

> +	} else {
> +		err =3D -EIO;
> +		goto led_error;
> +	}
> +
> +	wpriv->cdev[led_type].max_brightness =3D LED_ON;
> +	wpriv->cdev[led_type].dev =3D dev;

The .dev field in led_classdev is where the class device is stored by
the LED core. Drivers should not set this.

> +	wpriv->cdev[led_type].flags =3D LED_CORE_SUSPENDRESUME;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		if (led_version !=3D WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
> +			err =3D -EIO;
> +			goto led_error;

Double free.

> +		}
> +		wpriv->cdev[led_type].name =3D "platform::micmute";
> +		wpriv->cdev[led_type].brightness_set_blocking =3D &lsh_wmi_micmute_led=
_set;
> +		wpriv->cdev[led_type].default_trigger =3D "audio-micmute";
> +
> +		err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0)
> +			goto led_reg_failed;

Double free.

> +
> +		break;
> +	case AUDIO_MUTE:
> +		if (led_version !=3D WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
> +			err =3D -EIO;
> +			goto led_error;

Double free.

> +		}
> +		wpriv->cdev[led_type].name =3D "platform::mute";
> +		wpriv->cdev[led_type].brightness_set_blocking =3D &lsh_wmi_audiomute_l=
ed_set;
> +		wpriv->cdev[led_type].default_trigger =3D "audio-mute";
> +
> +		err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0)
> +			goto led_reg_failed;

Double free.

> +
> +		break;
> +	default:
> +		err =3D -EINVAL;
> +		dev_err(dev, "Unknown LED type %d\n", led_type);
> +		goto led_error;

Double free.

> +	}
> +
> +	return 0;
> +
> +led_reg_failed:
> +	dev_err(dev, "Could not register mute LED %d : %d\n", led_type, err);
> +
> +led_error:
> +	kfree(obj);
> +	return err;
> +}
> +
> +static void lenovo_super_hotkey_wmi_leds_setup(struct device *dev)
> +{
> +	lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev);
> +	lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev);
> +}
> +
> +static int lenovo_super_hotkey_wmi_probe(struct wmi_device *wdev, const =
void *context)
> +{
> +	struct lenovo_super_hotkey_wmi_private *wpriv;
> +
> +	wpriv =3D devm_kzalloc(&wdev->dev, sizeof(*wpriv), GFP_KERNEL);
> +	if (!wpriv)
> +		return -ENOMEM;
> +
> +	*wpriv =3D *(const struct lenovo_super_hotkey_wmi_private *)context;

The .event context is only used inside this function, so I believe this
copy is unnecessary.

> +
> +	dev_set_drvdata(&wdev->dev, wpriv);
> +
> +	if (wpriv->event =3D=3D LSH_WMI_EVENT_LUD_KEYS) {

This check is maybe unnecessary.

> +		wpriv->led_wdev =3D wdev;
> +		lenovo_super_hotkey_wmi_leds_setup(&wdev->dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void lenovo_super_hotkey_wmi_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_super_hotkey_wmi_private *wpriv =3D dev_get_drvdata(&wdev=
->dev);
> +	unsigned int i;
> +
> +	for (i =3D 0; i < LSH_ACPI_LED_MAX; i++)
> +		led_classdev_unregister(&wpriv->cdev[i]);

devm_led_classdev_register() was used so this is not needed.

> +
> +	kfree(wpriv);

devm_kzalloc() was used to allocate wpriv so this is not needed and
probably double free.

--
~ Kurt

> +}
> +static const struct lenovo_super_hotkey_wmi_private lsk_wmi_context_lud_=
keys =3D {
> +	.event =3D LSH_WMI_EVENT_LUD_KEYS
> +};
> +
> +static const struct wmi_device_id lenovo_super_hotkey_wmi_id_table[] =3D=
 {
> +	{ LUD_WMI_METHOD_GUID, &lsk_wmi_context_lud_keys }, /* Utility data */
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(wmi, lenovo_super_hotkey_wmi_id_table);
> +
> +static struct wmi_driver lenovo_super_hotkey_wmi_driver =3D {
> +	 .driver =3D {
> +		 .name =3D "lenovo_super_hotkey_wmi",
> +		 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS
> +	 },
> +	 .id_table =3D lenovo_super_hotkey_wmi_id_table,
> +	 .probe =3D lenovo_super_hotkey_wmi_probe,
> +	 .remove =3D lenovo_super_hotkey_wmi_remove,
> +	 .no_singleton =3D true,
> +};
> +
> +module_wmi_driver(lenovo_super_hotkey_wmi_driver);
> +
> +MODULE_INFO(depends, "wmi,ideapad-laptop");
> +MODULE_AUTHOR("Jackie Dong <dongeg1@lenovo.com>");
> +MODULE_DESCRIPTION("Lenovo Super Hotkey Utility WMI extras driver");
> +MODULE_LICENSE("GPL");

