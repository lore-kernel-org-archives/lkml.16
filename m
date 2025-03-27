Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D2FD528;
	Thu, 27 Mar 2025 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743038976; cv=none; b=nqydTNG7C3GzNPaRc7bsF9w3BGshkq85fYrV5WigJTv+pQce5eocAsqQlc2vmhy//Qe/UUpc0Pm0RgJm40vtQ5TNGJPf3XTDkChAsGC3I4mYzWn9eeyZOjLOn6HPEfgk4hp5Zrx6tFqUv54F0XJE/cbqs5YA5NPLvZxB3HJVzxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743038976; c=relaxed/simple;
	bh=4JHEq/R2niCnv9TzGSXCED/IYJdG6Te2R1KQEHQ+2N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXgXh9K2AeVF2hTFmbswrTMKhxzDRUexa71AwLDhD9r3R6paGKoVbfrwFFR1zMzn2oldfwPywR2PlVNdonBd9t+Trie5/gF7UV2ZpOr15NsA6MTFYdoG0HuUUTIYEC3vfvJFry+DYtGrV/pB5SD544ZCEWAfBRSPweEzWAq5EDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lk5PAmP6; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lk5PAmP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743038962; x=1743643762; i=w_armin@gmx.de;
	bh=gzeemrUdDB9vumByPIRwDPG+9QKueWgOgdidQ1OznHM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lk5PAmP6FGdvSTKqsEmysfhUeyTxwq+ctlg9tJuxlbAucIK0qrP6avjat9cyTXI6
	 pGrBoK8uIjxdOWawiFXtFn3HHNDklbqAHEp1V/GJ6o5PTGz7NU6yLZ8seJA4N1Tut
	 zX1L8ikiiGaN2JHbZa/p2jeYEHOqiOvtGqLeUr796z7hm4N9RvN0GQRvBmnAjotOW
	 E2I6m2Ja/aQODpGqrwm1iEZb7kM5FMmLhI2mGDIpldEFtUzOl4IuWM8S/SjMzPjG+
	 CK3moC7PzBca1FZJrjAyzNPq5MHhbDWlxLA3G+ippDG1Qp8g1gSNQlWcvD3hQeN+4
	 HA9l28hdqfNXbwV/CA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6qC-1tGXT401Ay-00g60Z; Thu, 27
 Mar 2025 02:29:22 +0100
Message-ID: <de122cb5-e245-43e9-8bd7-2fcff1426203@gmx.de>
Date: Thu, 27 Mar 2025 02:29:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6 RESEND] platform/x86: Add Lenovo Capability Data 01
 WMI Driver
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
 <20250317144326.5850-5-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250317144326.5850-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p/sbVTNAu46QKOBc178gKhRCm/ooaDgacYsmHKhcqbJUi7PCRvc
 Qed52wYbKCOm1yYjJFDABgybdPIxMbpBW47wx7MCH9PaDfFf1RcuKwfem4YBMeh9mfxQr3n
 L7vjEZrDCeRt1IcgVTq2IZkJ63kdWMbKg0xms0rYOCI0LahWWIxMiIM9YRpv8jDCu8RyIK1
 El9lXUZ/f4jlJMevKMygg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wLfaieW8mcA=;9JQR8JtzjJKcqiE//rPJmNo+i6M
 D7pIyqCYl5LK2H5NJR/ZLrgc05ylxrcQaHHUYPStdb8M27wsrVzoSzTwXh+J+yMGufkBNe9Ru
 nY7HCex4z8tXfWHSOSkYo9UrOrulsSFHaUi2pjCvOwSXgGki7odsBYtlnj61zHkWLMgBnopnj
 sOtyke90qNfF4nd2Au4gKz8vweS7nWskfc5GbR3Np9gyC5WZlZrDYkYPwVl9oNCM5bq03vlX3
 htuplu2GBmI8/S8z/z1aQyqZLEoxNL98mOFvD8kUhnhzRcsx1toRKI7CQr55lwbn2XwRCVP51
 q5pg3E7yNIVt++ETVnqyfG8Qe8r9Et+HAJWD+hlcOo9KnmjBEBKCe7ba5B2IArlWu0rUI2sZY
 6+ulFvxqzeWK+qiN1oPy0d5ewzRUYK0tbM1qsY92CCdrpKbeX19WIChQEWkn22IQU2vIAfFD7
 kKP5jMayeS4MKJjaOqkonWxKSGZ4UQ9CdsIRicZwP6ymwoMOzOzUVqrPcASE7pgA0WFjK3zn+
 QedZuw8XN60ORJN7zkEk4wF5LYj1MnsdL7eDT4Htwl9V3pe2RlPUQaszdXXimooFre28aEylO
 hbT5xIsgP+KQ+wySkFPOYfnt8xLUz+nlZPZpJoYS9Fx5nouVvw4U3v2joh5uRqNNIUjEzbKt3
 aqXCEYeHTFsccZ2GE3RQlaScbe83m+ivWknwibbU2PxQ0cQLWbH8szM7Wq9FvOEVND/evv3Zx
 Rq8wSPifH4+s+h8mv860Ovcg7Cd/tPNV/bFs2Kb7T++XR6b142qZQ0B1gpvHMeuwIDOQsT2vL
 phRXEP3EcrbQZ4u1xR9Aa5rwV6b7KoUBo/vlDqEG/Xneh287d4qpBPz5z8VbmXer5j7ro8hQ0
 HGaOBP6BGLkQs9CEkVuPUzl5b2XI06fdkbu49KFyMFQKoyrPfbhzOiI9zcAt0AVGo/vGrX4S1
 ooO2/si3gFqZTxNhHkBnFdhtOkmVvDIYuWIQC0sQpZq/Jpd6acsdsJg87OQ9tlcT7jCw2SCUh
 Bu5BCJiNPjaXyfuATIdvJ0LR4iaSeMsrenEz82ytKoh7VwSc0oy3aVZfhRIM9x0M9KIMza25x
 pj72fbmG4/DEHGzckiBQzRV/5k2CG1DDIN63+XBSt/k879rpKEGPAGtp1xBJB7jbWyNmmZrHa
 q0WXIjQpacmKf58ERklbMFyyCqzp85NoDbD4dZUMx9IHssQXqnF77LLQgZ6teGBDZ4zXvn/5m
 aW0c0/6p4xKtO0R/9b8Q60EWY+NT5pY6z38RHnn7+Xk27nsCsHqZoNsLMNlnZEGBicSmMd65C
 0aO3WgcvfhCDBcNO7mNLmseTiQt41CzWLJaUNtpo6QzrS8ZWSU1fDGCq4VUw0tQ7Wzxh15Z4Z
 bwUD8FmriVzZOfwjA1d0m6nf7vCwpsZb5nxOn2kPalKGLXApzrFislJbd97ambOKrf7igdbVZ
 +Q9FtJvXTWaR1q/uWyBpTYQza8aE=

Am 17.03.25 um 15:43 schrieb Derek J. Clark:

> Adds lenovo-wmi-capdata01 driver which provides the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>   - Make driver data a private struct, remove references from Other Mode
>     driver.
>   - Don't cache data at device initialization. Instead, on component bin=
d,
>     cache the data on a member variable of the Other Mode driver data
>     passed as a void pointer.
>   - Add header file for capdata01 structs.
>   - Add new struct to pass capdata01 array data and array length to Othe=
r
>     Mode.
> v3:
> - Add as component to lenovo-wmi-other driver.
> v2:
> - Use devm_kmalloc to ensure driver can be instanced, remove global
>    reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> - Use list to get the lenovo_wmi_cd01_priv instance in
>    lenovo_wmi_capdata01_get as none of the data provided by the macros
>    that will use it can pass a member of the struct for use in
>    container_of.
> ---
>   MAINTAINERS                                 |   2 +
>   drivers/platform/x86/Kconfig                |   4 +
>   drivers/platform/x86/Makefile               |   1 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c | 136 ++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++++
>   5 files changed, 172 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dde75922aaf..56ead241a053 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,8 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.c
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.h
>   F:	drivers/platform/x86/lenovo-wmi-events.c
>   F:	drivers/platform/x86/lenovo-wmi-events.h
>   F:	drivers/platform/x86/lenovo-wmi-helpers.c
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 13b8f4ac5dc5..64663667f0cb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
>   	tristate
>   	depends on ACPI_WMI
>
> +config LENOVO_WMI_DATA01
> +	tristate
> +	depends on ACPI_WMI
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index fc039839286a..7a35c77221b7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>   obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdata01.o
>   obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events.o
>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
>
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/platf=
orm/x86/lenovo-wmi-capdata01.c
> new file mode 100644
> index 000000000000..b6876611ffd9
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface prov=
ides
> + * information on tunable attributes used by the "Other Mode" WMI inter=
face,
> + * including if it is supported by the hardware, the default_value, max=
_value,
> + * min_value, and step increment.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/gfp_types.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +#include "lenovo-wmi-capdata01.h"

Hi,

please also include linux/acpi.h, linux/export.h and linux/module.h.

> +
> +/* Interface GUIDs */
> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE0=
18154"
> +
> +struct lwmi_cd01_priv {
> +	struct wmi_device *wdev;
> +};
> +
> +/*

/* -> /**

> + * lenovo_cd01_component_bind() - On master bind, caches all capability=
 data on
> + * the master device.
> + * @cd01_dev: Pointer to the capability data 01 parent device.
> + * @om_dev: Pointer to the other mode parent device.
> + * @data: capdata01_list object pointer to return the capability data w=
ith.
> + *
> + * Returns: 0, or an error.
> + */
> +static int lenovo_cd01_component_bind(struct device *cd01_dev,
> +				      struct device *om_dev, void *data)
> +{
> +	struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
> +	int count, idx;
> +
> +	if (!priv)
> +		return -ENODEV;

This check is unnecessary, please drop.

> +
> +	count =3D wmidev_instance_count(priv->wdev);
> +
> +	if (count =3D=3D 0)
> +		return -EINVAL;

The WMI driver core already ensures that WMI devices with 0 instances are
rejected. Please drop this check.

> +
> +	((struct cd01_list *)data)->count =3D count;
> +	((struct cd01_list *)data)->data =3D devm_kmalloc_array(om_dev, count,
> +							      sizeof(struct capdata01 *),
> +							      GFP_KERNEL);

Two things:

  - using a local variable with a type of struct cd01_list * results in cl=
eaner source code here

  - using devres is not possible inside the component callbacks, since the=
 lifetime of the component
    device is not necessarily tied to the lifetime of the underlying devic=
e.

I suggest you move the whole WMI data querying into lwmi_cd01_probe(), bec=
ause then you can keep using
devres.

> +	if (!data)
> +		return -ENOMEM;
> +
> +	for (idx =3D 0; idx < count; idx++) {
> +		union acpi_object *ret_obj __free(kfree) =3D NULL;
> +
> +		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> +		if (!ret_obj) {
> +			((struct cd01_list *)data)->data[idx] =3D NULL;
> +			continue;
> +		}
> +		if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> +			((struct cd01_list *)data)->data[idx] =3D NULL;
> +			continue;
> +		}
> +
> +		if (ret_obj->buffer.length !=3D sizeof(struct capdata01)) {
> +			((struct cd01_list *)data)->data[idx] =3D NULL;
> +			continue;
> +		}
> +
> +		((struct cd01_list *)data)->data[idx] =3D
> +			devm_kmemdup(om_dev, ret_obj->buffer.pointer,
> +				     ret_obj->buffer.length, GFP_KERNEL);
> +	}
> +	return 0;
> +}
> +
> +static const struct component_ops lenovo_cd01_component_ops =3D {
> +	.bind =3D lenovo_cd01_component_bind,
> +};
> +
> +static int lwmi_cd01_probe(struct wmi_device *wdev, const void *context=
)
> +
> +{
> +	struct lwmi_cd01_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev =3D wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	ret =3D component_add(&wdev->dev, &lenovo_cd01_component_ops);
> +
> +	return ret;

Please just omit the local variable here and return the result of componen=
t_add() directly here.

> +}
> +
> +static void lwmi_cd01_remove(struct wmi_device *wdev)
> +{
> +	component_del(&wdev->dev, &lenovo_cd01_component_ops);
> +}
> +
> +static const struct wmi_device_id lwmi_cd01_id_table[] =3D {
> +	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_cd01_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo_wmi_cd01",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lwmi_cd01_id_table,
> +	.probe =3D lwmi_cd01_probe,
> +	.remove =3D lwmi_cd01_remove,
> +	.no_singleton =3D true,
> +};
> +
> +int lwmi_cd01_match(struct device *dev, void *data)
> +{
> +	return dev->driver =3D=3D &lwmi_cd01_driver.driver;
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
> +
> +module_wmi_driver(lwmi_cd01_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.h b/drivers/platf=
orm/x86/lenovo-wmi-capdata01.h
> new file mode 100644
> index 000000000000..c7067a8d0398
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later

SPDX license identifiers need to be a separate comment.

> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *
> + */
> +
> +#ifndef _LENOVO_WMI_CAPDATA01_H_
> +#define _LENOVO_WMI_CAPDATA01_H_
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +struct capdata01 {
> +	u32 id;
> +	u32 supported;
> +	u32 default_value;
> +	u32 step;
> +	u32 min_value;
> +	u32 max_value;
> +};
> +
> +struct cd01_list {
> +	struct capdata01 **data;
> +	int count;
> +};

In order to save memory you could try something like this:

struct cd01_list {
	size_t count;
	struct capdata01 data[];
};

This way you

1. Avoid the memory fragmentation resulting from multiple memory allocatio=
ns.

2. Omit two pointers when accessing the data.

You can use struct_size() from linux/overflow.h to calculate the size of s=
uch
an array with a trailing flexible array.

Thanks,
Armin Wolf

> +
> +int lwmi_cd01_match(struct device *dev, void *data);
> +
> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
