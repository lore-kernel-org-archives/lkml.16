Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467F20D514;
	Thu, 27 Mar 2025 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079441; cv=none; b=pnoRwwWUhX8u02Y2HNebt5hgtea54yuclmmxkVuxu6n521Y5XiA0Y0tKWrOrTh0KW2UreqcN4ij7d3jYenDnDY44KwKvAKhsPQr/NXkumX0WRnhwMpoPQuMoXeeE/GDs+iW6NJ90Hv6I4F1WI45rtD++UrsZIDjoVoPTbjDrac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079441; c=relaxed/simple;
	bh=WNbKcJQijQM2HGSgyIqo+egJpxS5R4LhQmjbj7x2AGM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IhIzFDqDH8zWS50ZwECrn3X//C/BiZEGCAk33BXjUNukoeg8GV6MwI37YoMAxD88vxcNiPhjupN6pt60CMp4NrA8eSfE/v/W1bYEY0b/A3KyU5trEEAbXI0MgSEBv+Oyh/yZ9qgQVEv3bwBlr28tdBJ9ZGTPC1JZR8hgesVQPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqzRy/ej; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqzRy/ej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743079440; x=1774615440;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WNbKcJQijQM2HGSgyIqo+egJpxS5R4LhQmjbj7x2AGM=;
  b=gqzRy/ejIsQaeldIa7MNnKuyQ3yVMEuBFXQ4Dr9JBUHBFCCjtRakqypj
   zgEmIBXH15RPU79pp7b2/feAH8ZNHCVDYVkFhlAaLnrclc6Nj7w3p778i
   oUjEMtM2sL4a5w/jJu8RToItRdreddNmf0pgPjKyEBqMG0ydhl3T+AG3r
   QyaXVuV/2oh61usLKpwG9tqhGxESIvVPwKc17pZKelOkM7sYhCi7Om3AD
   8Q6AJPLVJeXg+3zwQXlIUWBfM10GbwVTUe+DjlefRAppBtiCN236z8QUb
   CaZEnnGtYVlJGs9mg4+KJ0cvO5xJhOEa6d6DmLpy9qFOVTHxNd84vau0f
   g==;
X-CSE-ConnectionGUID: 9qjCIHe5SouZ2wZOVs6JTw==
X-CSE-MsgGUID: kJ7JI0Y4Qp2IDxsJH33Olw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55774543"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="55774543"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 05:43:59 -0700
X-CSE-ConnectionGUID: zn3R2BrGTl2uMD695FP+qg==
X-CSE-MsgGUID: ZLYdCT56Ri6Ji4/qial2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="156113464"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 05:43:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 27 Mar 2025 14:43:50 +0200 (EET)
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
Subject: Re: [PATCH v4 2/6 RESEND] platform/x86: Add lenovo-wmi-helpers
In-Reply-To: <20250317144326.5850-3-derekjohn.clark@gmail.com>
Message-ID: <da344af9-4da8-e7e2-bdcf-e6d9c257cc30@linux.intel.com>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com> <20250317144326.5850-3-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Mar 2025, Derek J. Clark wrote:

> Adds documentation for all new lenovo-wmi drivers.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>  - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
>  - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
>  - Removed structs and functions implemented by other drivers.
> ---
>  MAINTAINERS                               |  2 +
>  drivers/platform/x86/Kconfig              |  4 ++
>  drivers/platform/x86/Makefile             |  1 +
>  drivers/platform/x86/lenovo-wmi-helpers.c | 64 +++++++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-helpers.h | 24 +++++++++
>  5 files changed, 95 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 675f4b26426d..3a370a18b806 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,8 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-helpers.c
> +F:	drivers/platform/x86/lenovo-wmi-helpers.h
>  
>  LENOVO WMI HOTKEY UTILITIES DRIVER
>  M:	Jackie Dong <xy-jackie@139.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..bece1ba61417 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,10 @@ config IBM_RTL
>  	 state = 0 (BIOS SMIs on)
>  	 state = 1 (BIOS SMIs off)
>  
> +config LENOVO_WMI_HELPERS
> +	tristate
> +	depends on ACPI_WMI
> +
>  config IDEAPAD_LAPTOP
>  	tristate "Lenovo IdeaPad Laptop Extras"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 650dfbebb6c8..5a9f4e94f78b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>  obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>  obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
>  
>  # Intel
>  obj-y				+= intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.c b/drivers/platform/x86/lenovo-wmi-helpers.c
> new file mode 100644
> index 000000000000..36d553502223
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Legion WMI helpers driver.

Please add empty comment row here.

>  The Lenovo Legion WMI interface is
> + * broken up into multiple GUID interfaces that require cross-references
> + * between GUID's for some functionality. The "Custom Method" interface is a
> + * legacy interface for managing and displaying CPU & GPU power and hwmon
> + * settings and readings. The "Other Mode" interface is a modern interface
> + * that replaces or extends the "Custom Method" interface methods. The
> + * "Gamezone" interface adds advanced features such as fan profiles and
> + * overclocking. The "Lighting" interface adds control of various status
> + * lights related to different hardware components. Each of these drivers
> + * uses a common procedure to get data fro the WMI interface, enumerated here.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *
> + */
> +
> +#include <linux/wmi.h>
> +#include "lenovo-wmi-helpers.h"

Put a space between these lines

> +
> +/*
> + * lwmi_dev_evaluate_method() - Helper function to call wmidev_evaluate_method
> + * for Lenovo WMI device method calls that return an ACPI integer.

This should be a shorter summary and the rest should be put into own 
paragraph between the arguments and Return: 

> + * @wdev: Pointer to the WMI device to be called.
> + * @instance: Instance of the called method.
> + * @method_id: WMI Method ID for the method to be called.
> + * @buf: Buffer of all arguments for the given method_id.
> + * @size: Length of the buffer.
> + * @retval: Pointer for the return value to be assigned.
> + *
> + * Returns: 0, or an error.

Return:

> + */
> +int lwmi_dev_evaluate_method(struct wmi_device *wdev, u8 instance,
> +			     u32 method_id, unsigned char *buf, size_t size,
> +			     u32 *retval)
> +{
> +	struct acpi_buffer input = { size, buf };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ret_obj __free(kfree) = NULL;
> +	acpi_status status;
> +
> +	status = wmidev_evaluate_method(wdev, instance, method_id, &input,
> +					&output);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	if (retval) {
> +		ret_obj = output.pointer;
> +		if (!ret_obj)
> +			return -ENODATA;
> +
> +		if (ret_obj->type != ACPI_TYPE_INTEGER)
> +			return -ENXIO;
> +
> +		*retval = (u32)ret_obj->integer.value;
> +	}
> +	return 0;
> +};
> +EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_method, "LENOVO_WMI_HELPERS");
> +
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.h b/drivers/platform/x86/lenovo-wmi-helpers.h
> new file mode 100644
> index 000000000000..7e0d7870790e
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *

Please remove this extra line.

> + */
> +#include <linux/notifier.h>
> +#include <linux/platform_profile.h>

What? Why are these on this side of the ifndef??? And neither is needed by 
this header AFAICT so please drop them.

> +#ifndef _LENOVO_WMI_HELPERS_H_
> +#define _LENOVO_WMI_HELPERS_H_
> +
> +#include <linux/types.h>
> +#include <linux/wmi.h>

This include is not needed (since you're only using it as a pointer). Do a 
forward declaration instead:

struct wmi_device;

> +
> +struct wmi_method_args_32 {
> +	u32 arg0;
> +	u32 arg1;
> +};
> +
> +int lwmi_dev_evaluate_method(struct wmi_device *wdev, u8 instance,
> +			     u32 method_id, unsigned char *buf, size_t size,
> +			     u32 *retval);
> +
> +#endif /* !_LENOVO_WMI_HELPERS_H_ */
> 

-- 
 i.

