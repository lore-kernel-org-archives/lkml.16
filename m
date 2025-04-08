Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C414267731;
	Tue,  8 Apr 2025 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114859; cv=none; b=ueMJEhW8I3Flq9mMozKkGCXTIMKR3ZgTrDZCPD9O6LX03Bd/n2vdzwKF+nhk31CHaJDG32xo5icEcf+vCkZVuJIPRExoLF2CmtGJ2dMhn+l2RJsF7oqWmvJZMbtg5uNkt6DF1wyxGpF9NBLbENDdDXkKm3tGNPVbm7UxzhEp3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114859; c=relaxed/simple;
	bh=D6/cxbvHzVe8/mTkzIAWuvoO/NwmRZAvi/G22vjD2mA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jjFSEvvoAImjlgW7898vkgcRcgu3I2tsM3sVItTdHG/Ctr0kTZRLbqbPOEcylnzMO3SJQ7KJZJg4zQjTkUCxuLsLA+LHGf4mPQiNjQh8XMGMuE8/3TTW1d3PASPzCPBduQukDOV9yk+oTp55Ktp2of1L2MakTWcWB23DU3HzJzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3aVzPpt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3aVzPpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744114858; x=1775650858;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=D6/cxbvHzVe8/mTkzIAWuvoO/NwmRZAvi/G22vjD2mA=;
  b=k3aVzPpt2U33eUMpvNgJou2aX3cJEQoOK32Ofo5pjjWBgDO87Tn4t5J4
   jm0KkGIMlY7bcJYKt/Qd0J1DbynjLncAL7qXDff9CM7KRvhn4jL76anpY
   dYuVKEZHiYivZEOC7Ij24MvBT/xzhBcraST+8ki7EtqC0PLF9jkhlwY0Y
   1UFndZVO/xcHOI4pcej0gOWZFX4erAsOtV5L9azhuNEF7HyXkJmUT0ytR
   MObxko+kkervrBJXnNodKRxIukHgTIwZEFCIZ8cFMe0pGjmLY5xLnR6WD
   XtAc0vWH+VnYFfQ3gHYuEvXnCp/ASXMsVDlgQCPQrxk63Wsd8JKHIloXw
   g==;
X-CSE-ConnectionGUID: A1n4iHZiRUmkMyuvOXkQQA==
X-CSE-MsgGUID: JCb8+TnaRgCdV69fMpTxnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33146665"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="33146665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:20:57 -0700
X-CSE-ConnectionGUID: QH8sgvk2SQykDMHTd39wBg==
X-CSE-MsgGUID: wJWD6G9qTCyv0RUZLY4yLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133123135"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:20:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 15:20:48 +0300 (EEST)
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
Subject: Re: [PATCH v5 4/6] platform/x86: Add Lenovo Capability Data 01 WMI
 Driver
In-Reply-To: <20250408012815.1032357-5-derekjohn.clark@gmail.com>
Message-ID: <d62fa4b7-0232-9070-b24e-c2b73fc96a2b@linux.intel.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com> <20250408012815.1032357-5-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Apr 2025, Derek J. Clark wrote:

> Adds lenovo-wmi-capdata01 driver which provides the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
>  - Return to cache at device initialization. On component bind, pass a
>    pointer to lenovo-wmi-other.
>  - Fixes from v4 review.
> v4:
>  - Make driver data a private struct, remove references from Other Mode
>    driver.
>  - Don't cache data at device initialization. Instead, on component bind,
>    cache the data on a member variable of the Other Mode driver data
>    passed as a void pointer.
>  - Add header file for capdata01 structs.
>  - Add new struct to pass capdata01 array data and array length to Other
>    Mode.
> v3:
> - Add as component to lenovo-wmi-other driver.
> v2:
> - Use devm_kmalloc to ensure driver can be instanced, remove global
>   reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> - Use list to get the lenovo_wmi_cd01_priv instance in
>   lenovo_wmi_capdata01_get as none of the data provided by the macros
>   that will use it can pass a member of the struct for use in
>   container_of.
> ---
>  MAINTAINERS                                 |   2 +
>  drivers/platform/x86/Kconfig                |   4 +
>  drivers/platform/x86/Makefile               |   1 +
>  drivers/platform/x86/lenovo-wmi-capdata01.c | 168 ++++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-capdata01.h |  28 ++++
>  5 files changed, 203 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dde75922aaf..56ead241a053 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,8 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.c
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.h
>  F:	drivers/platform/x86/lenovo-wmi-events.c
>  F:	drivers/platform/x86/lenovo-wmi-events.h
>  F:	drivers/platform/x86/lenovo-wmi-helpers.c
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 13b8f4ac5dc5..64663667f0cb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
>  	tristate
>  	depends on ACPI_WMI
>  
> +config LENOVO_WMI_DATA01
> +	tristate
> +	depends on ACPI_WMI
> +
>  config IDEAPAD_LAPTOP
>  	tristate "Lenovo IdeaPad Laptop Extras"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index fc039839286a..7a35c77221b7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>  obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>  obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
>  obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
>  obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
>  
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/platform/x86/lenovo-wmi-capdata01.c
> new file mode 100644
> index 000000000000..a5255e080e87
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Capability Data 01 WMI Data Block driver.
> + *
> + * Lenovo Capability Data 01 provides information on tunable attributes used by
> + * the "Other Mode" WMI interface. The data includes if the attribute is
> + * supported by the hardware, the default_value, max_value, min_value, and step
> + * increment. Each attibute has multiple pages, one for each of the thermal
> + * modes managed by the Gamezone interface.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/gfp_types.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-capdata01.h"
> +
> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
> +
> +struct lwmi_cd01_priv {
> +	struct wmi_device *wdev;
> +	struct cd01_list *list;
> +};
> +
> +/**
> + * lwmi_cd01_component_bind() - Bind component to master device.
> + * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent device.
> + * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> + * @data: capdata01_list object pointer used to return the capability data.
> + *
> + * On lenovo-wmi-other's master bind, provide a pointer to the local capdata01
> + * list. This is used to look up attribute data by the lenovo-wmi-other driver.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_cd01_component_bind(struct device *cd01_dev,
> +				    struct device *om_dev, void *data)
> +{
> +	struct lwmi_cd01_priv *priv = dev_get_drvdata(cd01_dev);
> +	struct cd01_list **cd01_list = data;
> +
> +	if (!priv->list)
> +		return -ENODEV;
> +
> +	*cd01_list = priv->list;
> +
> +	return 0;
> +}
> +
> +static const struct component_ops lwmi_cd01_component_ops = {
> +	.bind = lwmi_cd01_component_bind,
> +};
> +
> +/**
> + * lwmi_cd01_setup() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata01 driver data.
> + *
> + * Allocate a cd01_list struct large enough to contain data from all WMI data
> + * blocks provided by the interface. Then loop through each data block and
> + * cache the data.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
> +{
> +	struct cd01_list *list;
> +	size_t list_size;
> +	int count, idx;
> +
> +	count = wmidev_instance_count(priv->wdev);
> +	list_size = struct_size(list, data, count);
> +
> +	list = devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
> +	if (!list)
> +		return -ENOMEM;
> +
> +	list->count = count;
> +
> +	for (idx = 0; idx < count; idx++) {
> +		union acpi_object *ret_obj __free(kfree) = NULL;
> +
> +		ret_obj = wmidev_block_query(priv->wdev, idx);
> +		if (!ret_obj)
> +			return -ENODEV;
> +
> +		if (ret_obj->type != ACPI_TYPE_BUFFER ||
> +		    ret_obj->buffer.length < sizeof(struct capdata01))
> +			continue;
> +
> +		memcpy(&list->data[idx], ret_obj->buffer.pointer,
> +		       ret_obj->buffer.length);
> +	}
> +
> +	priv->list = list;
> +
> +	return 0;
> +}
> +
> +static int lwmi_cd01_probe(struct wmi_device *wdev, const void *context)
> +
> +{
> +	struct lwmi_cd01_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	ret = lwmi_cd01_setup(priv);
> +	if (ret)
> +		return ret;
> +
> +	return component_add(&wdev->dev, &lwmi_cd01_component_ops);
> +}
> +
> +static void lwmi_cd01_remove(struct wmi_device *wdev)
> +{
> +	component_del(&wdev->dev, &lwmi_cd01_component_ops);
> +}
> +
> +static const struct wmi_device_id lwmi_cd01_id_table[] = {
> +	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_cd01_driver = {
> +	.driver = {
> +		.name = "lenovo_wmi_cd01",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = lwmi_cd01_id_table,
> +	.probe = lwmi_cd01_probe,
> +	.remove = lwmi_cd01_remove,
> +	.no_singleton = true,
> +};
> +
> +/**
> + * lwmi_cd01_match() - Match rule for the master driver.
> + * @dev: Pointer to the capability data 01 parent device.
> + * @data: Unused void pointer for passing match criteria.
> + *
> + * Return: bool.
> + */
> +int lwmi_cd01_match(struct device *dev, void *data)

"Return: bool" vs int ??? "bool" is a C type.

> +{
> +	return dev->driver == &lwmi_cd01_driver.driver;
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
> +
> +module_wmi_driver(lwmi_cd01_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.h b/drivers/platform/x86/lenovo-wmi-capdata01.h
> new file mode 100644
> index 000000000000..15974ce5e008
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> +
> +#ifndef _LENOVO_WMI_CAPDATA01_H_
> +#define _LENOVO_WMI_CAPDATA01_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
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
> +	u8 count;
> +	struct capdata01 data[];
> +};
> +
> +int lwmi_cd01_match(struct device *dev, void *data);
> +
> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
> 

-- 
 i.

