Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD45269AE4;
	Tue,  8 Apr 2025 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114560; cv=none; b=BjzuH0xaiUzQtKcFypEiKLgD7/PxOdB33nvea2iNJ/lrKtxVLOlnxctt/ao2YPs60aCHKF+Nv4pq9e5XjS2/Mv6jdZl51kdrT8l7mKGYrBek1aAuIC3s7UGrihknEMK4JqHfFJqIVRi2iW5fpEhufiNuz/6vpxNBZgw3h89KxCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114560; c=relaxed/simple;
	bh=0At7IzwdatWGZBhdK9Dv1ozq8/63R2hw8yDEq6H5d7g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ATllasZ8vMopjI++Y80TTNfWYsJnxoe8bCJy/eXCIAtl+CAjWWHRttLWazaMPLcOLlPGktBhPh1HdfLqS4upfo32cSAy3hpLyasbohmvLlse+DPWGW5LsbiVO93W38iDdQusdFX0gwfSp1kUomW3P39R+I3cDakxtGFK2FjnXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABdse7Ux; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABdse7Ux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744114558; x=1775650558;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0At7IzwdatWGZBhdK9Dv1ozq8/63R2hw8yDEq6H5d7g=;
  b=ABdse7UxQZJ4Zi5fZSqMFzTxirookbxQDfKYdMFUqe+Qh+x1+jrWIagJ
   p/CWRf/Hm0S2OnOK6/dY0BOMN6uSCbued9OdTG2D+uaVtvp5TzdTMmTjq
   UvTFCgWAe9BO6mIkdL3UgOGFYk6G43p7MTLJ+ghNE4B2wIxHLS5aawy22
   cUkuOKSF8OWA1Ll1B5uHK/2qlY2gv25mGjqvKL1t0iHrhnJ/sJsV/pzJP
   2cDNpmnC8hH07XNF//zVcSzAm7aUM6QypmeIywcbygCcSybPvzZ2ymsFi
   S2C6y4kaGW7Sye3+0+nG5DRaCDSdtrA2ubWFPnEcobJ6B+9th/nyqXR0u
   A==;
X-CSE-ConnectionGUID: i4wsa2yARUi20GMtvOBeRw==
X-CSE-MsgGUID: EgQvmsjFSYGgdYgPeGLoug==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62945043"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="62945043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:15:57 -0700
X-CSE-ConnectionGUID: tX5oH5FaT6CZwQ54XW+SAw==
X-CSE-MsgGUID: 1KzW7T8WS3m8zK1CA5ghJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128773776"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:15:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 15:15:48 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v5 2/6] platform/x86: Add lenovo-wmi-helpers
In-Reply-To: <20250408012815.1032357-3-derekjohn.clark@gmail.com>
Message-ID: <a1eb6081-74ed-6413-9534-42e1d38ed96e@linux.intel.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com> <20250408012815.1032357-3-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Apr 2025, Derek J. Clark wrote:

> Adds lenovo-wmi-helpers, which provides a common wrapper function for
> wmidev_evaluate_method that does data validation and error handling.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
>  - Fixes from v4 review.
>  - Combine all previous methods into a single function that takes a
>    buffer for the wmi method arguments.
> v4:
>  - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
>  - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
>  - Removed structs and functions implemented by other drivers.
> ---
>  MAINTAINERS                               |  2 +
>  drivers/platform/x86/Kconfig              |  4 ++
>  drivers/platform/x86/Makefile             |  1 +
>  drivers/platform/x86/lenovo-wmi-helpers.c | 74 +++++++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-helpers.h | 20 ++++++
>  5 files changed, 101 insertions(+)
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

You can use a wildcard so you don't need to give .c and .h separately.

-- 
 i.

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
> index 000000000000..166e87fef156
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Legion WMI helpers driver.
> + *
> + * The Lenovo Legion WMI interface is broken up into multiple GUID interfaces
> + * that require cross-references between GUID's for some functionality. The
> + * "Custom Mode" interface is a legacy interface for managing and displaying
> + * CPU & GPU power and hwmon settings and readings. The "Other Mode" interface
> + * is a modern interface that replaces or extends the "Custom Mode" interface
> + * methods. The "Gamezone" interface adds advanced features such as fan
> + * profiles and overclocking. The "Lighting" interface adds control of various
> + * status lights related to different hardware components. Each of these
> + * drivers uses a common procedure to get data from the WMI interface,
> + * enumerated here.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-helpers.h"
> +
> +/**
> + * lwmi_dev_evaluate_int() - Helper function for calling WMI methods that
> + * return an integer.
> + * @wdev: Pointer to the WMI device to be called.
> + * @instance: Instance of the called method.
> + * @method_id: WMI Method ID for the method to be called.
> + * @buf: Buffer of all arguments for the given method_id.
> + * @size: Length of the buffer.
> + * @retval: Pointer for the return value to be assigned.
> + *
> + * Calls wmidev_valuate_method for Lenovo WMI devices that return an ACPI
> + * integer. Validates the return value type and assigns the value to the
> + * retval pointer.
> + *
> + * Return: 0 on success, or on error.
> + */
> +int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
> +			  unsigned char *buf, size_t size, u32 *retval)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ret_obj __free(kfree) = NULL;
> +	struct acpi_buffer input = { size, buf };
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
> +EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_int, "LENOVO_WMI_HELPERS");
> +
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-helpers.h b/drivers/platform/x86/lenovo-wmi-helpers.h
> new file mode 100644
> index 000000000000..b76633603dcc
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-helpers.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> +
> +#ifndef _LENOVO_WMI_HELPERS_H_
> +#define _LENOVO_WMI_HELPERS_H_
> +
> +#include <linux/types.h>
> +
> +struct wmi_device;
> +
> +struct wmi_method_args_32 {
> +	u32 arg0;
> +	u32 arg1;
> +};
> +
> +int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
> +			  unsigned char *buf, size_t size, u32 *retval);
> +
> +#endif /* !_LENOVO_WMI_HELPERS_H_ */
> 
