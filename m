Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72BC79E1;
	Thu, 27 Mar 2025 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080195; cv=none; b=s+stUCjeD7xrT5xWTfLSXYDZ3brV2nlMQDiyGv42cdK08tSS86NnJXDe9QZqT6xTzQtzrMc1ybXYpLVp61pzgYnDKRV/btFrr18R2K16jZi7ckDu8LOiNK5NHcvLGr0E8E2NcO0zAWIr6v3EqYfauF7BCmHDGwDfKua4XMiYadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080195; c=relaxed/simple;
	bh=tDHUt24geHC80NQ1kHV6oKIsmJ0PCSqDZWCXP2rF9bA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Znxm0eRqF35bhZ4+2A6soaJy9iLmWN+gj+LJRmglPrYHXgWeqxg0gW5g0495dZmY9su8vs+EWo+DpJFk7Jwt2XJIMub9c7dC0YaJhrfLFLd4TH8CE4XWC1uRwiF71037w9P8++ZMW+kxGb+tfLMlB7gDSFvCuN7X9p68MY8ZEi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMw2xbeB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMw2xbeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743080194; x=1774616194;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tDHUt24geHC80NQ1kHV6oKIsmJ0PCSqDZWCXP2rF9bA=;
  b=cMw2xbeBag2bERBEj2SnsJH8gWrfzLmVhzDqthn7j5ZQbkvGWvSKHa5L
   6RRFPuj0HtjMsOFXScA3PxOFkRxM9iChFI8MNPnKNM0e/8x/t9LHqc2SP
   g1gWn01TbFTJhlWWEeBP6tE+Wnhi9uPcldxy+JE/MHFOLr4bmC+ymR0G0
   wbYR0Ca3ueIZAxkWIBgSPyaeNLfdxknQmB6TgXM0ibQyTdC8CyroeugfJ
   FjJwhArGSpsSF7TAyXFo0Qy5egv6b6Py+QdI2N7V9PtghLnmWke85dgOX
   +cLioSMm9MP/qhlDGxenQ2U5aXwsYolZtkpWPhrGshYvrB8HKF/THlQCh
   w==;
X-CSE-ConnectionGUID: uIJp85eES/SMrXeGH/+XpQ==
X-CSE-MsgGUID: JvQ88wyzSDOeWVQ8NL32Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55775456"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="55775456"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 05:56:34 -0700
X-CSE-ConnectionGUID: U3t9dQ2vR3uCZLNTM20yyg==
X-CSE-MsgGUID: 8G2r70iSQKOAfyu/0EG6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="130195723"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 05:56:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 27 Mar 2025 14:56:23 +0200 (EET)
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
Subject: Re: [PATCH v4 4/6 RESEND] platform/x86: Add Lenovo Capability Data
 01 WMI Driver
In-Reply-To: <20250317144326.5850-5-derekjohn.clark@gmail.com>
Message-ID: <9138d1c8-0713-e28a-3cdf-590b3f4e9449@linux.intel.com>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com> <20250317144326.5850-5-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Mar 2025, Derek J. Clark wrote:

> Adds lenovo-wmi-capdata01 driver which provides the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
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
>  drivers/platform/x86/lenovo-wmi-capdata01.c | 136 ++++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++++
>  5 files changed, 172 insertions(+)
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
> index 000000000000..b6876611ffd9
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver.

Add a empty comment line here, you might want to rephrase the opening of 
the paragraph after splitting these apart.

> This interface provides
> + * information on tunable attributes used by the "Other Mode" WMI interface,
> + * including if it is supported by the hardware, the default_value, max_value,
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

Add an empty line here please.

> +#include "lenovo-wmi-capdata01.h"
> +
> +/* Interface GUIDs */
> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
> +
> +struct lwmi_cd01_priv {
> +	struct wmi_device *wdev;
> +};
> +
> +/*
> + * lenovo_cd01_component_bind() - On master bind, caches all capability data on
> + * the master device.

Is this "On master bind" something that the caller should be doing? IMO, 
that would belong to description paragraph instead of the function 
summary.

> + * @cd01_dev: Pointer to the capability data 01 parent device.
> + * @om_dev: Pointer to the other mode parent device.
> + * @data: capdata01_list object pointer to return the capability data with.
> + *
> + * Returns: 0, or an error.

Return:

> + */
> +static int lenovo_cd01_component_bind(struct device *cd01_dev,
> +				      struct device *om_dev, void *data)
> +{
> +	struct lwmi_cd01_priv *priv = dev_get_drvdata(cd01_dev);
> +	int count, idx;
> +
> +	if (!priv)
> +		return -ENODEV;
> +
> +	count = wmidev_instance_count(priv->wdev);
> +
> +	if (count == 0)
> +		return -EINVAL;
> +
> +	((struct cd01_list *)data)->count = count;

Please create a local variable with the correct type and since data is 
void *, you don't need to cast it while assigning to that local variable.

> +	((struct cd01_list *)data)->data = devm_kmalloc_array(om_dev, count,
> +							      sizeof(struct capdata01 *),

sizeof() should preferrably take the type directly from ->data (with the 
correct amount of * chars).

> +							      GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	for (idx = 0; idx < count; idx++) {
> +		union acpi_object *ret_obj __free(kfree) = NULL;
> +
> +		ret_obj = wmidev_block_query(priv->wdev, idx);
> +		if (!ret_obj) {
> +			((struct cd01_list *)data)->data[idx] = NULL;
> +			continue;
> +		}
> +		if (ret_obj->type != ACPI_TYPE_BUFFER) {
> +			((struct cd01_list *)data)->data[idx] = NULL;
> +			continue;
> +		}
> +
> +		if (ret_obj->buffer.length != sizeof(struct capdata01)) {

You could consider joining these 3 if()s with || to avoid having to 
repeat the NULL assignment and continue.

> +			((struct cd01_list *)data)->data[idx] = NULL;
> +			continue;
> +		}
> +
> +		((struct cd01_list *)data)->data[idx] =
> +			devm_kmemdup(om_dev, ret_obj->buffer.pointer,
> +				     ret_obj->buffer.length, GFP_KERNEL);
> +	}
> +	return 0;
> +}
> +
> +static const struct component_ops lenovo_cd01_component_ops = {
> +	.bind = lenovo_cd01_component_bind,
> +};
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
> +	ret = component_add(&wdev->dev, &lenovo_cd01_component_ops);
> +
> +	return ret;
> +}
> +
> +static void lwmi_cd01_remove(struct wmi_device *wdev)
> +{
> +	component_del(&wdev->dev, &lenovo_cd01_component_ops);
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
> +int lwmi_cd01_match(struct device *dev, void *data)
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
> index 000000000000..c7067a8d0398
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *

Extra line

> + */
> +
> +#ifndef _LENOVO_WMI_CAPDATA01_H_
> +#define _LENOVO_WMI_CAPDATA01_H_
> +
> +#include <linux/device.h>

Please fwd declare struct device instead.

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
> +
> +int lwmi_cd01_match(struct device *dev, void *data);
> +
> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
> 

-- 
 i.

