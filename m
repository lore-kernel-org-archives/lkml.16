Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC11812E5B;
	Thu, 27 Mar 2025 01:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037443; cv=none; b=XDcXMO5+V1AI83Jm2jn45O6CX91PejWImYfDr6ckAj4ZZvaJEfnY2guBENsYt9DBzizvMh6DV79ecrqD5PMGmaTq1t4CcyhMd1FtpP8r2mg/JMF6uLjv8u8deiMv9yETmZ93iexdM/uzWwN66J6iKTcZmLq3REOZ/x8jlF7cc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037443; c=relaxed/simple;
	bh=PLB0c6EJQTg+fnqSJCfAE/vpnJq8T/eX+sJGgyAmlOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmkm2u0ljWoDKGqMSpo4SqsiundKrVvZ8pY1K6+QUTHMZDyX17cBPueFyouA3g1da06ZNmQ9BdaCfplPSgtAQ+m2U316Iqj7OKd3IckUKbpMub5xWV0rNBwBY9/66es34nVyHlr+p0fGwa/bqwy+X5FKuLp2WELM7CuSdRYb/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YKUcrK3Q; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YKUcrK3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743037423; x=1743642223; i=w_armin@gmx.de;
	bh=q2m3aSc2OrJA/5cgniVycmxbmUOUmwnokNZ4ZsQo1s8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YKUcrK3Q4OUjU+m23LtBlx7Lcu5PN6/zcRN+T6UoC0g9TS/obgzFdd30Eoyas01q
	 pbWpQTghFqk1bHXs7XJ/vQmIROyhUjaJRWzLKguitw9X5lKKvyQ4BWlZhQ+pqwX23
	 DadRfRGubLRT3KyeY7Km2tZiNOAD6kypRfp1ABtT7cIz38S8JFnWNshX9nSE6ILGT
	 MtuUntUL5FRR8K50G9cMpdNfN6UuCecFX96IcTISFqIo7BT4fIEIKUsBJlChq5NbW
	 anKahqsfDiZ5RYOPp6yEaxhDeFisLWN8/WyW/lEG69s45r086smcpOJoPH5JQxp3b
	 uZ3UeUZKL0U2IxRkcg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MN5if-1tfFpD3qy5-00NHyG; Thu, 27
 Mar 2025 02:03:43 +0100
Message-ID: <cf6be9ba-03e4-4d9d-9f62-91cd11e6ee30@gmx.de>
Date: Thu, 27 Mar 2025 02:03:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6 RESEND] platform/x86: Add Lenovo WMI Events Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-4-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250317144326.5850-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7h8yO+WRsiuNEs+JRWEOr3YdNx90kJJ1tvQBReKEnfZecWrSer1
 6TAfViehuOfHw1BvPJXYha/j/cf1PzzsdrOtIaMv3Vmm6eiJ39jN1mfA+FIflW3z9pGsja0
 fXofTPFBJKZydGjzSozIj24fdLsdcjznM7L9YfJRjAaNDYDmreXxkFmmhuvlPaljF9VTUx9
 HJSMUFPu7oHakF1XSDC8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j+SFepbjCvY=;qlK7prp7ub0/i6J2tOZOKv4iwxp
 eO3uA0utpvxr2gBgyvHjttuqz9ASKLWzHKQCmbErd4a7y6ksx2FH6CygvGFGmC3xRpBBViQjg
 ki4Z0JfJWq1SCyMz8C1/ugqJj7M0IKoUl8oCaeXfcfGewMhkQ9QS/F8bfdCuXlizxZo5dldbg
 iSKw0l5fKTsKH6wDSKTPEzbHF24HD8n7jIm2xBs+nDjZORNLC6vTITPKQ9+CMl0MhmcPAcdAF
 6azBQyPW11nfn0JZx8H1NSYSnweoJBmwbdVDa5gtOkHf5gqnLBR6dXOWfY85b7mLV1Fy6YKoS
 gnCP7Dhsh2nl5PdzcIQ3G6pQKS6+UkZNiIyhvolGXdcDlILVWTGiDf17vYZ/F1dHxuIppeAQ4
 fRMxcAp4EWx75QQe40Ei6mVcKi7lpnqZ3qi+K7Cvqq2ZqzaQNWeo+DUfzVijC5DyU0hLwdG92
 DmqRsw8DU/+F8DAFgAyo9hZpG7Uyrxo266aQljCsnGkSSchLxczcGvLgeonaLt9pzSC0AOfYF
 DfVmaX+WmSu3QZoUW9GG2jasWHApNL91jX+5+n7pWp8z32Ti/rJdn0iPqVPD0CoSKFpbfYZ1+
 wZfLth3RdU9Ct9UWAsuhIsCF142OB2EqZj82m0ck6EPdDpdXc2zMtYfN4kK55w5nMRYRLz1V1
 yn0FuMI2PJE/gvIqP/bsLpBb9/t9uE7lUTSeSZIcht3hFMGdS+gqBu5UQktqfxcCeLn0EhMkz
 a98+8pe8HMFLuCEFR020mWT8ub2NTy95PKoF0U55kOqlRrc3Xvu23kgbMJn2Rmkp/uq/7Nfe3
 W8ZrclMdAKRBguaLxtdeFMqRA8N9rlafniHVMIr5wXO03jiigcbieoK9gRf4fSeiDba5zpCwi
 Si/vVyNfa1MGfWeRCHO2Az/0/LTDh0P0ZZ4nkQ851VEw68d/EoWOwVlLi9ctG4Ahk5VGAXNLm
 3Zcr6B/EQrbjAlGPSIuEXhwkFXvSikNs4iGSpLdhMfQBpffnPNT3TvGODW0iR239s+lTKNlmT
 xAW26VcPKrV077HTogwoh3UM31Z22tz7nW5GyH8+31TdozysB2v5hjgNSCeEfpjqNe0u/mK7W
 tWEqQaRvp1ltems18wzluiwt7RY1OHL2Y5jiJet6CVhYEziCh4blm/3ImNL/qAd0eDSA4zznW
 Oe2pXL6+cocsN7kxDbcYZFqrPg8ACBQOWAfoTMB1+N15aa/0jthI9hSBLroYUDx0E48HYITQO
 E3XDF1qjZ0Boo1zAEkvz1mIBtyGMDSLq2+GcpS/fU9hr//Y8MGbkLKYNXUUDhwXrIaXPgV4r4
 4p8AGpyGzMzibNtvrp0OmUSjz9BTwgGOrbAyzk5mr145NsJSk5CoKhAKWSXxWVSk6B3/I8doB
 c6j99CDedbIWKtldEjYttib7GnhuQnOI248zW8vLOYmG045BxMCfoHoSxK1booSAt7zxO/3t1
 bheFJx25/C0delEimuwkW7haAT/Q=

Am 17.03.25 um 15:43 schrieb Derek J. Clark:

> Adds lenovo-wmi-events driver. The events driver is designed as a
> general entrypoint for all Lenovo WMI Events. It acts as a notification
> chain head that will process event data and pass it on to registered
> drivers so they can react to the events.
>
> Currently only the Gamezone interface Thermal Mode Event GUID is
> implemented in this driver. It is documented in the Gamezone
> documentation.
>
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>   - Remove the Thermal Mode Event GUID from Gamezone and add this driver=
.
> ---
>   MAINTAINERS                              |   2 +
>   drivers/platform/x86/Kconfig             |   4 +
>   drivers/platform/x86/Makefile            |   1 +
>   drivers/platform/x86/lenovo-wmi-events.c | 132 +++++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-events.h |  21 ++++
>   5 files changed, 160 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-events.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a370a18b806..6dde75922aaf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,8 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-events.c
> +F:	drivers/platform/x86/lenovo-wmi-events.h
>   F:	drivers/platform/x86/lenovo-wmi-helpers.c
>   F:	drivers/platform/x86/lenovo-wmi-helpers.h
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index bece1ba61417..13b8f4ac5dc5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,10 @@ config IBM_RTL
>   	 state =3D 0 (BIOS SMIs on)
>   	 state =3D 1 (BIOS SMIs off)
>
> +config LENOVO_WMI_EVENTS
> +	tristate
> +	depends on ACPI_WMI
> +
>   config LENOVO_WMI_HELPERS
>   	tristate
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 5a9f4e94f78b..fc039839286a 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>   obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events.o
>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
>
>   # Intel
> diff --git a/drivers/platform/x86/lenovo-wmi-events.c b/drivers/platform=
/x86/lenovo-wmi-events.c
> new file mode 100644
> index 000000000000..3ea0face3c0d
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-events.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo WMI Events driver. Lenovo WMI interfaces provide various
> + * hardware triggered events that many drivers need to have propagated.
> + * This driver provides a uniform entrypoint for these events so that
> + * any driver that needs to respond to these events can subscribe to a
> + * notifier chain.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/list.h>
> +#include <linux/notifier.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +#include "lenovo-wmi-events.h"

Hi,

please also include linux/acpi.h, linux/export.h and linux/module.h. Also =
why do you import
linux/list.h?

> +
> +/* Interface GUIDs */
> +#define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> +
> +#define LENOVO_WMI_EVENT_DEVICE(guid, type)                        \
> +	.guid_string =3D (guid), .context =3D &(enum lwmi_events_type) \
> +	{                                                          \
> +		type                                               \
> +	}
> +
> +static BLOCKING_NOTIFIER_HEAD(events_chain_head);
> +
> +struct lwmi_events_priv {
> +	struct wmi_device *wdev;
> +	enum lwmi_events_type type;
> +};
> +
> +/* Notifier Methods */
> +int lwmi_events_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&events_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_events_register_notifier, "LENOVO_WMI_EVENTS"=
);
> +
> +int lwmi_events_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&events_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_events_unregister_notifier, "LENOVO_WMI_EVENT=
S");
> +
> +static void devm_lwmi_events_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb =3D data;
> +
> +	lwmi_events_unregister_notifier(nb);
> +}
> +
> +int devm_lwmi_events_register_notifier(struct device *dev,
> +				       struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret =3D lwmi_events_register_notifier(nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev,
> +				devm_lwmi_events_unregister_notifier, nb);

Please remove this line break here.

> +}
> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_events_register_notifier, "LENOVO_WMI_EV=
ENTS");
> +
> +/* Driver Methods */
> +static void lwmi_events_notify(struct wmi_device *wdev, union acpi_obje=
ct *obj)
> +{
> +	struct lwmi_events_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +	int sel_prof;
> +	int ret;
> +
> +	switch (priv->type) {
> +	case THERMAL_MODE_EVENT:
> +		if (obj->type !=3D ACPI_TYPE_INTEGER)
> +			return;
> +
> +		sel_prof =3D obj->integer.value;
> +		ret =3D blocking_notifier_call_chain(&events_chain_head,
> +						   THERMAL_MODE_EVENT, &sel_prof);
> +		if (ret =3D=3D NOTIFY_BAD)
> +			dev_err(&wdev->dev,
> +				"Failed to send notification to call chain for WMI Events\n");
> +		break;
> +	default:
> +		return;
> +	}
> +}
> +
> +static int lwmi_events_probe(struct wmi_device *wdev, const void *conte=
xt)
> +{
> +	struct lwmi_events_priv *priv;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (!context)
> +		return -EINVAL;
> +
> +	priv->wdev =3D wdev;
> +	priv->type =3D *(enum lwmi_events_type *)context;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lwmi_events_id_table[] =3D {
> +	{ LENOVO_WMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID,
> +				  THERMAL_MODE_EVENT) },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_events_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo_wmi_events",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lwmi_events_id_table,
> +	.probe =3D lwmi_events_probe,
> +	.notify =3D lwmi_events_notify,
> +	.no_singleton =3D true,
> +};
> +
> +module_wmi_driver(lwmi_events_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_events_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo WMI Events Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-events.h b/drivers/platform=
/x86/lenovo-wmi-events.h
> new file mode 100644
> index 000000000000..a3fa934eaa10
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-events.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later

The SPDX license identifier needs to be a separate comment.

With those minor issues being fixed:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/notifier.h>
> +#include <linux/types.h>
> +
> +#ifndef _LENOVO_WMI_EVENTS_H_
> +#define _LENOVO_WMI_EVENTS_H_
> +
> +enum lwmi_events_type {
> +	THERMAL_MODE_EVENT =3D 1,
> +};
> +
> +int lwmi_events_register_notifier(struct notifier_block *nb);
> +int lwmi_events_unregister_notifier(struct notifier_block *nb);
> +int devm_lwmi_events_register_notifier(struct device *dev,
> +				       struct notifier_block *nb);
> +
> +#endif /* !_LENOVO_WMI_EVENTS_H_ */
