Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F91E282D;
	Tue, 11 Feb 2025 18:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297882; cv=none; b=qOSMgS/ql7pOs6WLL+cqGFPk6EliCoKVXAYvMNQvneIzlTH8rJ2g2Pp4h/hNKR2GoJHVggCDFYyKsX6So1JsEcW+74C5Qyv0mlQKwB8AGj8rMxWJEumuXMtQzQX5//FPeJcR2YwvdC6Ayyekw3lcC5msuC7+RwyvvWAbiXusE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297882; c=relaxed/simple;
	bh=CrqD8MFLObQ/PKrgYO+x5xyrm+eNQQYnmpKwnGz+O9U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VTu6ltZOfxJr//CJFqrQIWlne/rMAYeFCeDiWe/Apxmb2tZRpBtJfrejYJNykJkyp6Z4l52V0G8WEYUBvLUqArpIQSkVJXaP0DG+VWiH7NUNwrK7iBMQde0se6zBHcxMLJjh+ADQy/AF3lUWY0R7M7F1/AtlEOzPA+YrE/5cGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJQvxDuj; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJQvxDuj"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f9b1bc594dso36250167b3.0;
        Tue, 11 Feb 2025 10:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739297879; x=1739902679; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q4Vyy3zW4ZnDYcN5WZ8zmLskhNKf9jvN4iZ5JGATVI=;
        b=eJQvxDujGrV3eJLphclx4FFxutiMAsKQYJYMCj3os6/+eYusiYDXNCD4caGkgLz06Z
         j6xgBbaZdDdV90S2WTfYDzDGjVIrWtr4IQ2pnUrfUnny7QC4CSfwZ65epyKe3xbQMqS1
         MCel9bXmCZgdYBtFd5EKubMecfYuxTQ36DDIP2q8zYtjvVdIPcOya2J5309ALS53XoOZ
         ohTA6TSUi0j2wOUs8pzom1+3ohCJWIDB0G1v0GYYivDzRdCxvb5dPbfRlFKqsuw86DU6
         Stp23wdJVGOZK+P4bwS0zA6FKBNVZXOu5gCh38a77rFLbK+d0i+y8zCXZj8eddCCMorf
         g4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739297879; x=1739902679;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Q4Vyy3zW4ZnDYcN5WZ8zmLskhNKf9jvN4iZ5JGATVI=;
        b=Z9Gh4Gw6/i5ffoMIWhyzf6q4lunLFbaYT49P6L+JR2uJolJNWvDwOTsWOyNTwKBUt7
         d6jb6hCrU/v58anRQHMCUPtyiKaKNRHrdnOA8DSJwgVzsurb06VsJp+aZjTsTkwSNd2O
         vhNmpBzOMCuQP8rQhP5wzLhT8RCofCFeA/34GSSCrYk8U5KZRu7HgvR0dKB6ISM0M9R7
         OdCGTjOC1fykSvs6As8xIsKN/UVv0qyKmnBqcY0Y4uaLnZlYOCVh2Mpl+VMbiBu+GFCM
         /OcpQhizajLB5tvTHDV45nsaGQpS0vksSDKd9xd2eVr1ZFerXNGr6Nfl7XhQ8VNym3CR
         DxrA==
X-Forwarded-Encrypted: i=1; AJvYcCXdogonzcb1MS5QruOBtrKUPKIa5WLITgizUiXMyY73F4xgPDdRTEDcbFzsRhZ2QlOP4IIJxJbxRsaSfjyyCNfSkuq1@vger.kernel.org
X-Gm-Message-State: AOJu0YylOhF3SbtASlQGIgT9v7zqUJaJhiWGVmcuDiK5MxHlSkvbxQ3A
	az95g6JV5vdU52LFWS924Hu44BWSMOsCSCFBf41cD8ypgmesHK9g
X-Gm-Gg: ASbGnctp0IECVtY+4+12ARBVQspmC5iuyuuC2+MeFBVrtZW7o2U39NiYmrFIvbgATuc
	b+j4eijkloOBXp2JWgTouUUAefiuWmd8T010pA8CQEm8zU4bLk01Yc61aO9yeUDuAjVG1TinFb3
	eK982JUI/yXUwRF1JH5/hVSgdAPnHAWt5XtaOv/9vYlqxyw7TTQVvVqBQ6F/aOcXFdZQgtM9P4j
	w+oWy69h+wb61rP9ikEtgPDhfG4LS6hTXWbhT1j2U5mbpdBzYuTBT5hExic49Awy8KHdNY0vVAu
	ifi9I1t9
X-Google-Smtp-Source: AGHT+IEtOYNgyqoCC3zkQQ3ZU5xsTSUCX7+dBOFLW8VRNfZg7O3j39ubUSYJUbePhGtZMS6+LhAzjA==
X-Received: by 2002:a05:690c:46c1:b0:6f9:82fa:6d96 with SMTP id 00721157ae682-6fb1f19bbe5mr8752497b3.11.1739297879455;
        Tue, 11 Feb 2025 10:17:59 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fcefe5bsm22382767b3.21.2025.02.11.10.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 10:17:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 13:17:57 -0500
Message-Id: <D7PTN26CQAP6.3DDA9RLKRUVMV@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <dongeg1@lenovo.com>, "Mark Pearson" <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v4] platform/x86: lenovo-super-hotkey-wmi.c: Support for
 mic and audio mute LEDs
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jackie Dong" <xy-jackie@139.com>, <hdegoede@redhat.com>,
 <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250211152023.5447-1-xy-jackie@139.com>
In-Reply-To: <20250211152023.5447-1-xy-jackie@139.com>

Hi Jackie,

On Tue Feb 11, 2025 at 10:20 AM -05, Jackie Dong wrote:
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
> Changes in v4:
>  - Add related head files include cleanup.h, dev_printk.h, device.h,=20
>    module.h
>  - Replaced kfree() by __free()
>  - Remove double free for obj
>  - Remove wpriv->cdev[led_type].dev =3D dev
>  - Remove *wpriv =3D *(const struct lenovo_super_hotkey_wmi_private *)con=
text
>  - Remove wpriv->event =3D=3D LSH_WMI_EVENT_LUD_KEYS
>  - Remove lenovo_super_hotkey_wmi_remove() for unnecessary
>
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
>  .../platform/x86/lenovo-super-hotkey-wmi.c    | 234 ++++++++++++++++++
>  3 files changed, 244 insertions(+)
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
> index 000000000000..f5704dad5cb2
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
> + *
> + *  Copyright (C) 2025	Lenovo
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
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

This is where

	union acpi_object *obj __free(kfree) =3D output.pointer;

should go, not inside the if-else block.

If you prefer to free `obj` immidiately you should do it manually. But
be careful not to introduce memory bugs.

> +	if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +		led_version =3D obj->integer.value;
> +		union acpi_object *obj __free(kfree) =3D output.pointer;
> +	} else {
> +		err =3D -EIO;
> +		union acpi_object *obj __free(kfree) =3D output.pointer;
> +		return err;
> +	}
> +
> +	wpriv->cdev[led_type].max_brightness =3D LED_ON;
> +	wpriv->cdev[led_type].flags =3D LED_CORE_SUSPENDRESUME;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		if (led_version !=3D WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
> +			err =3D -EIO;
> +			goto led_error;
> +		}
> +		wpriv->cdev[led_type].name =3D "platform::micmute";
> +		wpriv->cdev[led_type].brightness_set_blocking =3D &lsh_wmi_micmute_led=
_set;
> +		wpriv->cdev[led_type].default_trigger =3D "audio-micmute";
> +
> +		err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0)
> +			goto led_reg_failed;
> +
> +		break;
> +	case AUDIO_MUTE:
> +		if (led_version !=3D WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
> +			err =3D -EIO;
> +			goto led_error;
> +		}
> +		wpriv->cdev[led_type].name =3D "platform::mute";
> +		wpriv->cdev[led_type].brightness_set_blocking =3D &lsh_wmi_audiomute_l=
ed_set;
> +		wpriv->cdev[led_type].default_trigger =3D "audio-mute";
> +
> +		err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0)
> +			goto led_reg_failed;
> +
> +		break;
> +	default:
> +		err =3D -EINVAL;
> +		dev_err(dev, "Unknown LED type %d\n", led_type);
> +		goto led_error;
> +	}
> +
> +	return 0;
> +
> +led_reg_failed:
> +	dev_err(dev, "Could not register mute LED %d : %d\n", led_type, err);
> +
> +led_error:
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
> +	dev_set_drvdata(&wdev->dev, wpriv);
> +	wpriv->led_wdev =3D wdev;
> +	lenovo_super_hotkey_wmi_leds_setup(&wdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct lenovo_super_hotkey_wmi_private lsk_wmi_context_lud_=
keys =3D {
> +	.event =3D LSH_WMI_EVENT_LUD_KEYS
> +};
> +
> +static const struct wmi_device_id lenovo_super_hotkey_wmi_id_table[] =3D=
 {
> +	{ LUD_WMI_METHOD_GUID, &lsk_wmi_context_lud_keys }, /* Utility data */

Is this `context` needed anymore? It is not used anymore so you can maybe
drop it?

--=20
 ~ Kurt

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
> +	 .no_singleton =3D true,
> +};
> +
> +module_wmi_driver(lenovo_super_hotkey_wmi_driver);
> +
> +MODULE_INFO(depends, "wmi,ideapad-laptop");
> +MODULE_AUTHOR("Jackie Dong <dongeg1@lenovo.com>");
> +MODULE_DESCRIPTION("Lenovo Super Hotkey Utility WMI extras driver");
> +MODULE_LICENSE("GPL");

