Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49772153EB;
	Thu, 27 Mar 2025 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079656; cv=none; b=emgFwEeB9MJpKIsQ3zIXmVPI6Ny4JUFNGe++W93LUk878Ysdl6d/aj5QtGIHAXuYDK6Er9Vxn5HMIKNStMXh4J4kPNy2CSq5roi/2MbMbt3f7c2ZfB9IrIApa99gleFVj2sBiwmhKxIghmaLTM/d8jccUBlg5IPGNacEurOWC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079656; c=relaxed/simple;
	bh=usAMiobjFxKRah9pWwPRgeZUpHFWYtn4e1pZQPUw4ms=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Xd3swFr8g8HWG/4zKODiC4nC6Xo7uTt4OL0wb1j3B0FSXs89hik1iMcsxQGpJIEp7e+88C96Bc9nowhF/uNCG2rmFnPn89JH7LLNpQG3djmktjU4jSDw7ywKyCIqQJaq+Z1gGt/ZcDytMBQhuMmpRaY0K0NwahHav+X+Lax2KrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q56eqkeo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q56eqkeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743079655; x=1774615655;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=usAMiobjFxKRah9pWwPRgeZUpHFWYtn4e1pZQPUw4ms=;
  b=Q56eqkeo4pgl/HLhyH42QAWbyUsNVGAKgwKL+Ez1fesjO5u9mEvbOFhi
   oCg9PuFtHSW1UMNyd/exc7k8FhfWSCWm0qQNcjeY29VvjFxgijpobo5Qn
   4EHYf6IoWWm5XFdroaJuwV4IMnSHclAULnf8ZdZjGVC5evTXhg5oWFweL
   /TKlBjRVKW4eQc4J1b3IHmv9oMMOWzu3mm5HgZ48iY1pUXPfbneactbkp
   kSpwlnaTliSbi1ryVaSCbFvVmxUzA3Td8SzuzJaTleNhDwLmU0oGZRqDK
   InZVKFRv02ZK1rxDQimPldPpqQTjLZknQhQDY6BTwjhw/0y/1NYSjNJKw
   A==;
X-CSE-ConnectionGUID: 5H8FFOtQRnOUvznsdb99eA==
X-CSE-MsgGUID: pjPpuUExQlyqVczTu6VCEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48192198"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="48192198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 05:47:34 -0700
X-CSE-ConnectionGUID: Y4I1KlL/Q92r467PwK54pQ==
X-CSE-MsgGUID: ZHa5QilpT6e92V//FhpJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="129283527"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 05:47:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 27 Mar 2025 14:47:24 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/6 RESEND] platform/x86: Add Lenovo WMI Events
 Driver
In-Reply-To: <20250317144326.5850-4-derekjohn.clark@gmail.com>
Message-ID: <59af0332-725b-fea2-0baf-37cf421a8229@linux.intel.com>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com> <20250317144326.5850-4-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Mar 2025, Derek J. Clark wrote:

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
>  - Remove the Thermal Mode Event GUID from Gamezone and add this driver.
> ---
>  MAINTAINERS                              |   2 +
>  drivers/platform/x86/Kconfig             |   4 +
>  drivers/platform/x86/Makefile            |   1 +
>  drivers/platform/x86/lenovo-wmi-events.c | 132 +++++++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-events.h |  21 ++++
>  5 files changed, 160 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-events.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a370a18b806..6dde75922aaf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,8 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-events.c
> +F:	drivers/platform/x86/lenovo-wmi-events.h
>  F:	drivers/platform/x86/lenovo-wmi-helpers.c
>  F:	drivers/platform/x86/lenovo-wmi-helpers.h
>  
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index bece1ba61417..13b8f4ac5dc5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,10 @@ config IBM_RTL
>  	 state = 0 (BIOS SMIs on)
>  	 state = 1 (BIOS SMIs off)
>  
> +config LENOVO_WMI_EVENTS
> +	tristate
> +	depends on ACPI_WMI
> +
>  config LENOVO_WMI_HELPERS
>  	tristate
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5a9f4e94f78b..fc039839286a 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>  obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>  obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
>  obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
>  
>  # Intel
> diff --git a/drivers/platform/x86/lenovo-wmi-events.c b/drivers/platform/x86/lenovo-wmi-events.c
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
> +
> +/* Interface GUIDs */
> +#define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> +
> +#define LENOVO_WMI_EVENT_DEVICE(guid, type)                        \
> +	.guid_string = (guid), .context = &(enum lwmi_events_type) \
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
> +EXPORT_SYMBOL_NS_GPL(lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
> +
> +int lwmi_events_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&events_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_events_unregister_notifier, "LENOVO_WMI_EVENTS");
> +
> +static void devm_lwmi_events_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb = data;
> +
> +	lwmi_events_unregister_notifier(nb);
> +}
> +
> +int devm_lwmi_events_register_notifier(struct device *dev,
> +				       struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret = lwmi_events_register_notifier(nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev,
> +				devm_lwmi_events_unregister_notifier, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
> +
> +/* Driver Methods */
> +static void lwmi_events_notify(struct wmi_device *wdev, union acpi_object *obj)
> +{
> +	struct lwmi_events_priv *priv = dev_get_drvdata(&wdev->dev);
> +	int sel_prof;
> +	int ret;
> +
> +	switch (priv->type) {
> +	case THERMAL_MODE_EVENT:
> +		if (obj->type != ACPI_TYPE_INTEGER)
> +			return;
> +
> +		sel_prof = obj->integer.value;
> +		ret = blocking_notifier_call_chain(&events_chain_head,
> +						   THERMAL_MODE_EVENT, &sel_prof);
> +		if (ret == NOTIFY_BAD)
> +			dev_err(&wdev->dev,
> +				"Failed to send notification to call chain for WMI Events\n");
> +		break;
> +	default:
> +		return;
> +	}
> +}
> +
> +static int lwmi_events_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct lwmi_events_priv *priv;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (!context)
> +		return -EINVAL;
> +
> +	priv->wdev = wdev;
> +	priv->type = *(enum lwmi_events_type *)context;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lwmi_events_id_table[] = {
> +	{ LENOVO_WMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID,
> +				  THERMAL_MODE_EVENT) },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_events_driver = {
> +	.driver = {
> +		.name = "lenovo_wmi_events",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = lwmi_events_id_table,
> +	.probe = lwmi_events_probe,
> +	.notify = lwmi_events_notify,
> +	.no_singleton = true,
> +};
> +
> +module_wmi_driver(lwmi_events_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_events_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo WMI Events Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-events.h b/drivers/platform/x86/lenovo-wmi-events.h
> new file mode 100644
> index 000000000000..a3fa934eaa10
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-events.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/notifier.h>
> +#include <linux/types.h>

Includes should appear after the ifndef/define, however, neither of these 
are neaded as you can just forward declare struct notifier_block.

> +
> +#ifndef _LENOVO_WMI_EVENTS_H_
> +#define _LENOVO_WMI_EVENTS_H_
> +
> +enum lwmi_events_type {
> +	THERMAL_MODE_EVENT = 1,
> +};
> +
> +int lwmi_events_register_notifier(struct notifier_block *nb);
> +int lwmi_events_unregister_notifier(struct notifier_block *nb);
> +int devm_lwmi_events_register_notifier(struct device *dev,

Please forward declare struct device too.

> +				       struct notifier_block *nb);
> +
> +#endif /* !_LENOVO_WMI_EVENTS_H_ */
> 

-- 
 i.

