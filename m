Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2515C4A33;
	Mon, 16 Jun 2025 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065695; cv=none; b=IZB9dfAwLVPjcePgHHWHXByoL/SZ9rgTnaH1kTYQBA9OCAIfXDYucqtg1/n7WW7tU3M9IzBbgMjiwwfb4gjMk+vGHZDscs1fhE0jbOpf1vUlpsFn11hCgi6x7TZLyiZUW44mrUTwlt3APmA7lZboppjRjmKlHR1N8u/zNHnMNRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065695; c=relaxed/simple;
	bh=F5KAkKBRvMmgLQwEQfJPDviEgn8ekPbT601F5MS3B7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AH2Rys/TS/spyxT5Fzz9z/gNCYXD02A60GheSp2hz0A26uFmO//B8aqLkPYsMvsZmrIXNlNt4BgTWSX51+tzYQjsk8TBR+r3hO4bTrVoeojpIr06fP02Zo0rg0bKPvzc3mxRlJO40V0VSGuJOBPtKiJ1Fo9Npku0Ab4Hw7h88MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzJFyXSz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzJFyXSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66219C4CEEA;
	Mon, 16 Jun 2025 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750065695;
	bh=F5KAkKBRvMmgLQwEQfJPDviEgn8ekPbT601F5MS3B7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QzJFyXSzLIRErXwhpt1hk0RoMEQp3TuvRBXJd72O8VSI4mfde3YhLVV+tI/2yLLlm
	 kR0FoPrwehHVfU7k3r2aqtI5Fl7bIniRQgiuLkF3+jXsF8J/LC2rf4iODNqtpIDntf
	 b4kfmHr7UO2Mr/6CJ7dzuVDkW2QzLBBv9TTfsYArvWRYB6X39J2T7eAujBUIqjdG2d
	 Q4vdGkbooP81JxIRdGqT2SpA2KbSxV3JywPQTFCKst8YZYCYRfKP8dEfFNuqSOM9ic
	 9k9h+EuD8giVGWkVTNmxNBq40iDht4w4OOGTPr70a9P+uADCIMgKypaPWKdKTzvJ2F
	 Jk/OXYf/+8eCA==
Message-ID: <77da5151-ddbd-409f-8b48-28029a96d5d8@kernel.org>
Date: Mon, 16 Jun 2025 11:21:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-2-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250615175957.9781-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15-Jun-25 19:59, Armin Wolf wrote:
> Add a new driver for handling WMI events on Uniwill laptops.
> The driver sadly cannot use the WMI GUID for autoloading since Uniwill
> just copied it from the Windows driver example.
> 
> The driver is reverse-engineered based on the following information:
> - https://github.com/pobrn/qc71_laptop
> - https://github.com/tuxedocomputers/tuxedo-drivers
> - various OEM software
> 
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/wmi/devices/uniwill-wmi.rst  |  52 ++++++
>  MAINTAINERS                                |   8 +
>  drivers/platform/x86/Kconfig               |   2 +
>  drivers/platform/x86/Makefile              |   3 +
>  drivers/platform/x86/uniwill/Kconfig       |  32 ++++
>  drivers/platform/x86/uniwill/Makefile      |   7 +
>  drivers/platform/x86/uniwill/uniwill-wmi.c | 177 +++++++++++++++++++++
>  drivers/platform/x86/uniwill/uniwill-wmi.h | 122 ++++++++++++++
>  8 files changed, 403 insertions(+)
>  create mode 100644 Documentation/wmi/devices/uniwill-wmi.rst
>  create mode 100644 drivers/platform/x86/uniwill/Kconfig
>  create mode 100644 drivers/platform/x86/uniwill/Makefile
>  create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>  create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
> 
> diff --git a/Documentation/wmi/devices/uniwill-wmi.rst b/Documentation/wmi/devices/uniwill-wmi.rst
> new file mode 100644
> index 000000000000..232fa8349611
> --- /dev/null
> +++ b/Documentation/wmi/devices/uniwill-wmi.rst
> @@ -0,0 +1,52 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +======================================
> +Uniwill WMI event driver (uniwill-wmi)
> +======================================
> +
> +Introduction
> +============
> +
> +Many notebooks manufactured by Uniwill (either directly or as ODM) provide an WMI-based
> +event interface for various platform events like hotkeys. This interface is used by the
> +``uniwill-wmi`` driver to react to hotkey presses.
> +
> +WMI interface description
> +=========================
> +
> +The WMI interface description can be decoded from the embedded binary MOF (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> +   Description("Class containing event generated ULong data"),
> +   guid("{ABBC0F72-8EA1-11d1-00A0-C90629100000}")]
> +  class AcpiTest_EventULong : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, write, Description("ULong Data")] uint32 ULong;
> +  };
> +
> +Most of the WMI-related code was copied from the Windows driver samples, which unfortunately means
> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable for autoloading.
> +
> +WMI event data
> +--------------
> +
> +The WMI event data contains a single 32-bit value which is used to indicate various platform events.
> +Many non-hotkey events are not directly consumed by the driver itself, but are instead handled by
> +the ``uniwill-laptop`` driver.
> +
> +Reverse-Engineering the Uniwill WMI event interface
> +===================================================
> +
> +The driver logs debug messages when receiving a WMI event. Thus enabling debug messages will be
> +useful for finding unknown event codes.
> +
> +Special thanks go to github user `pobrn` which developed the
> +`qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
> +The same is true for Tuxedo Computers, which developed the
> +`tuxedo-drivers <https://github.com/tuxedocomputers/tuxedo-drivers>`_ package which also served as
> +a foundation for this driver.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c14614613377..53876ec2d111 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25496,6 +25496,14 @@ L:	linux-scsi@vger.kernel.org
>  S:	Maintained
>  F:	drivers/ufs/host/ufs-renesas.c
>  
> +UNIWILL WMI DRIVER
> +M:	Armin Wolf <W_Armin@gmx.de>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/wmi/devices/uniwill-wmi.rst
> +F:	drivers/platform/x86/uniwill/uniwill-wmi.c
> +F:	drivers/platform/x86/uniwill/uniwill-wmi.h
> +
>  UNSORTED BLOCK IMAGES (UBI)
>  M:	Richard Weinberger <richard@nod.at>
>  R:	Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43055df44827..ba9d65f01332 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -65,6 +65,8 @@ config HUAWEI_WMI
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called huawei-wmi.
>  
> +source "drivers/platform/x86/uniwill/Kconfig"
> +
>  config UV_SYSFS
>  	tristate "Sysfs structure for UV systems"
>  	depends on X86_UV
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 0530a224bebd..1549c56ced91 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -107,6 +107,9 @@ obj-$(CONFIG_TOSHIBA_WMI)	+= toshiba-wmi.o
>  # before toshiba_acpi initializes
>  obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
>  
> +# Uniwill
> +obj-y				+= uniwill/
> +
>  # Inspur
>  obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+= inspur_platform_profile.o
>  
> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/uniwill/Kconfig
> new file mode 100644
> index 000000000000..5f1ea3e9e72f
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/Kconfig
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Uniwill X86 Platform Specific Drivers
> +#
> +
> +menuconfig X86_PLATFORM_DRIVERS_UNIWILL
> +	bool "Uniwill X86 Platform Specific Device Drivers"
> +	depends on X86_PLATFORM_DEVICES
> +	help
> +	  Say Y here to get to see options for device drivers for various
> +	  Uniwill X86 platforms, including many OEM laptops originally
> +	  manufactured by Uniwill.
> +	  This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and disabled.
> +
> +if X86_PLATFORM_DRIVERS_UNIWILL
> +
> +config UNIWILL_WMI
> +	tristate "Uniwill WMI Event Driver"
> +	default m
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This driver adds support for various hotkey events on Uniwill laptops,
> +	  like rfkill and other special buttons. It also supports many OEM laptops
> +	  originally manufactured by Uniwill.
> +
> +	  If you have such a laptop, say Y or M here.
> +
> +endif
> diff --git a/drivers/platform/x86/uniwill/Makefile b/drivers/platform/x86/uniwill/Makefile
> new file mode 100644
> index 000000000000..a5a300be63f3
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Makefile for linux/drivers/platform/x86/uniwill
> +# Uniwill X86 Platform Specific Drivers
> +#
> +
> +obj-$(CONFIG_UNIWILL_WMI)	+= uniwill-wmi.o
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform/x86/uniwill/uniwill-wmi.c
> new file mode 100644
> index 000000000000..b95a0d68ce6a
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux hotkey driver for Uniwill notebooks.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/printk.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "uniwill-wmi.h"
> +
> +#define DRIVER_NAME		"uniwill-wmi"
> +#define UNIWILL_EVENT_GUID	"ABBC0F72-8EA1-11D1-00A0-C90629100000"
> +
> +struct uniwill_wmi_data {
> +	struct mutex input_lock;	/* Protects input sequence during notify */
> +	struct input_dev *input_device;
> +};
> +
> +static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
> +
> +static const struct key_entry uniwill_wmi_keymap[] = {
> +	/* Reported via keyboard controller */
> +	{ KE_IGNORE,	UNIWILL_OSD_CAPSLOCK,			{ KEY_CAPSLOCK }},
> +	{ KE_IGNORE,	UNIWILL_OSD_NUMLOCK,			{ KEY_NUMLOCK }},
> +
> +	/* Reported when the user locks/unlocks the super key */
> +	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,	{ KEY_UNKNOWN }},
> +	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,	{ KEY_UNKNOWN }},
> +
> +	/* Reported in manual mode when toggling the airplane mode status */
> +	{ KE_KEY,	UNIWILL_OSD_RFKILL,			{ KEY_RFKILL }},
> +
> +	/* Reported when user wants to cycle the platform profile */
> +	{ KE_IGNORE,	UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,	{ KEY_UNKNOWN }},
> +
> +	/* Reported when the user wants to toggle the microphone mute status */
> +	{ KE_KEY,	UNIWILL_OSD_MIC_MUTE,			{ KEY_MICMUTE }},
> +
> +	/* Reported when the user locks/unlocks the Fn key */
> +	{ KE_IGNORE,	UNIWILL_OSD_FN_LOCK,			{ KEY_FN_ESC }},
> +
> +	/* Reported when the user wants to toggle the brightness of the keyboard */
> +	{ KE_KEY,	UNIWILL_OSD_KBDILLUMTOGGLE,		{ KEY_KBDILLUMTOGGLE }},
> +
> +	/* FIXME: find out the exact meaning of those events */
> +	{ KE_IGNORE,	UNIWILL_OSD_BAT_CHARGE_FULL_24_H,	{ KEY_UNKNOWN }},
> +	{ KE_IGNORE,	UNIWILL_OSD_BAT_ERM_UPDATE,		{ KEY_UNKNOWN }},
> +
> +	/* Reported when the user wants to toggle the benchmark mode status */
> +	{ KE_IGNORE,	UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,	{ KEY_UNKNOWN }},
> +
> +	{ KE_END }
> +};
> +
> +int uniwill_wmi_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&uniwill_wmi_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(uniwill_wmi_register_notifier, "UNIWILL");
> +
> +int uniwill_wmi_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(uniwill_wmi_unregister_notifier, "UNIWILL");
> +
> +static void devm_uniwill_wmi_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb = data;
> +
> +	uniwill_wmi_unregister_notifier(nb);
> +}
> +
> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret = uniwill_wmi_register_notifier(nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_uniwill_wmi_unregister_notifier, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_uniwill_wmi_register_notifier, "UNIWILL");
> +
> +static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
> +{
> +	struct uniwill_wmi_data *data = dev_get_drvdata(&wdev->dev);
> +	u32 value;
> +	int ret;
> +
> +	if (obj->type != ACPI_TYPE_INTEGER)
> +		return;
> +
> +	value = obj->integer.value;
> +
> +	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
> +
> +	ret = blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
> +	if (ret == NOTIFY_BAD)
> +		return;
> +
> +	mutex_lock(&data->input_lock);
> +	sparse_keymap_report_event(data->input_device, value, 1, true);
> +	mutex_unlock(&data->input_lock);
> +}
> +
> +static int uniwill_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct uniwill_wmi_data *data;
> +	int ret;

Hmm, if someone manually modprobe-s this because they think it will
help it will still load despite the generic GUID thing.

I think this should the same DMI allow-list as the -laptop driver?

Or maybe just export the driver as a symbol and have -laptop do
the actual registering of the driver ? Then if e.g. a force module
option gets added to the -laptop driver that will not need to
be duplicated here ...

Regards,

Hans



> +
> +	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&wdev->dev, &data->input_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	data->input_device = devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_device)
> +		return -ENOMEM;
> +
> +	ret = sparse_keymap_setup(data->input_device, uniwill_wmi_keymap, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->input_device->name = "Uniwill WMI hotkeys";
> +	data->input_device->phys = "wmi/input0";
> +	data->input_device->id.bustype = BUS_HOST;
> +
> +	return input_register_device(data->input_device);
> +}
> +
> +/*
> + * We cannot fully trust this GUID since Uniwill just copied the WMI GUID
> + * from the Windows driver example, and others probably did the same.
> + *
> + * Because of this we cannot use this WMI GUID for autoloading.
> + */
> +static const struct wmi_device_id uniwill_wmi_id_table[] = {
> +	{ UNIWILL_EVENT_GUID, NULL },
> +	{ }
> +};
> +
> +static struct wmi_driver uniwill_wmi_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = uniwill_wmi_id_table,
> +	.probe = uniwill_wmi_probe,
> +	.notify = uniwill_wmi_notify,
> +	.no_singleton = true,
> +};
> +module_wmi_driver(uniwill_wmi_driver);
> +
> +MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
> +MODULE_DESCRIPTION("Uniwill notebook hotkey driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform/x86/uniwill/uniwill-wmi.h
> new file mode 100644
> index 000000000000..41662ece0675
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Linux hotkey driver for Uniwill notebooks.
> + *
> + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> + */
> +
> +#ifndef UNIWILL_WMI_H
> +#define UNIWILL_WMI_H
> +
> +#define UNIWILL_OSD_CAPSLOCK			0x01
> +#define UNIWILL_OSD_NUMLOCK			0x02
> +#define UNIWILL_OSD_SCROLLLOCK			0x03
> +
> +#define UNIWILL_OSD_TOUCHPAD_ON			0x04
> +#define UNIWILL_OSD_TOUCHPAD_OFF		0x05
> +
> +#define UNIWILL_OSD_SILENT_MODE_ON		0x06
> +#define UNIWILL_OSD_SILENT_MODE_OFF		0x07
> +
> +#define UNIWILL_OSD_WLAN_ON			0x08
> +#define UNIWILL_OSD_WLAN_OFF			0x09
> +
> +#define UNIWILL_OSD_WIMAX_ON			0x0A
> +#define UNIWILL_OSD_WIMAX_OFF			0x0B
> +
> +#define UNIWILL_OSD_BLUETOOTH_ON		0x0C
> +#define UNIWILL_KEY_BLUETOOTH_OFF		0x0D
> +
> +#define UNIWILL_OSD_RF_ON			0x0E
> +#define UNIWILL_OSD_RF_OFF			0x0F
> +
> +#define UNIWILL_OSD_3G_ON			0x10
> +#define UNIWILL_OSD_3G_OFF			0x11
> +
> +#define UNIWILL_OSD_WEBCAM_ON			0x12
> +#define UNIWILL_OSD_WEBCAM_OFF			0x13
> +
> +#define UNIWILL_OSD_BRIGHTNESSUP		0x14
> +#define UNIWILL_OSD_BRIGHTNESSDOWN		0x15
> +
> +#define UNIWILL_OSD_RADIOON			0x1A
> +#define UNIWILL_OSD_RADIOOFF			0x1B
> +
> +#define UNIWILL_OSD_POWERSAVE_ON		0x31
> +#define UNIWILL_OSD_POWERSAVE_OFF		0x32
> +
> +#define UNIWILL_OSD_MENU			0x34
> +
> +#define UNIWILL_OSD_MUTE			0x35
> +#define UNIWILL_OSD_VOLUMEDOWN			0x36
> +#define UNIWILL_OSD_VOLUMEUP			0x37
> +
> +#define UNIWILL_OSD_MENU_2			0x38
> +
> +#define UNIWILL_OSD_LIGHTBAR_ON			0x39
> +#define UNIWILL_OSD_LIGHTBAR_OFF		0x3A
> +
> +#define UNIWILL_OSD_KB_LED_LEVEL0		0x3B
> +#define UNIWILL_OSD_KB_LED_LEVEL1		0x3C
> +#define UNIWILL_OSD_KB_LED_LEVEL2		0x3D
> +#define UNIWILL_OSD_KB_LED_LEVEL3		0x3E
> +#define UNIWILL_OSD_KB_LED_LEVEL4		0x3F
> +
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE	0x40
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE	0x41
> +
> +#define UNIWILL_OSD_MENU_JP			0x42
> +
> +#define UNIWILL_OSD_CAMERA_ON			0x90
> +#define UNIWILL_OSD_CAMERA_OFF			0x91
> +
> +#define UNIWILL_OSD_RFKILL			0xA4
> +
> +#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED	0xA5
> +
> +#define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED	0xA6
> +
> +#define UNIWILL_OSD_FAN_BOOST_STATE_CHANGED	0xA7
> +
> +#define UNIWILL_OSD_LCD_SW			0xA9
> +
> +#define UNIWILL_OSD_FAN_OVERTEMP		0xAA
> +
> +#define UNIWILL_OSD_DC_ADAPTER_CHANGED		0xAB
> +
> +#define UNIWILL_OSD_BAT_HP_OFF			0xAC
> +
> +#define UNIWILL_OSD_FAN_DOWN_TEMP		0xAD
> +
> +#define UNIWILL_OSD_BATTERY_ALERT		0xAE
> +
> +#define UNIWILL_OSD_TIMAP_HAIERLB_SW		0xAF
> +
> +#define UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE	0xB0
> +
> +#define UNIWILL_OSD_KBDILLUMDOWN		0xB1
> +#define UNIWILL_OSD_KBDILLUMUP			0xB2
> +
> +#define UNIWILL_OSD_BACKLIGHT_LEVEL_CHANGE	0xB3
> +#define UNIWILL_OSD_BACKLIGHT_POWER_CHANGE	0xB4
> +
> +#define UNIWILL_OSD_MIC_MUTE			0xB7
> +
> +#define UNIWILL_OSD_FN_LOCK			0xB8
> +#define UNIWILL_OSD_KBDILLUMTOGGLE		0xB9
> +
> +#define UNIWILL_OSD_BAT_CHARGE_FULL_24_H	0xBE
> +
> +#define UNIWILL_OSD_BAT_ERM_UPDATE		0xBF
> +
> +#define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
> +
> +#define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
> +
> +struct notifier_block;
> +
> +int uniwill_wmi_register_notifier(struct notifier_block *nb);
> +int uniwill_wmi_unregister_notifier(struct notifier_block *nb);
> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct notifier_block *nb);
> +
> +#endif /* UNIWILL_WMI_H */

