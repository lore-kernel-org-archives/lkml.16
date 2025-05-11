Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2821917CD;
	Sun, 11 May 2025 22:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004051; cv=none; b=I+u8KaZAENX0jLS7gAfngFHwNp/YW0cWV9EpiTuitZJIkmlA0b7vvcrvh7cM5qrhUWj3BDgBOtncGrTJzQx2+iowv/D+B/7D1PMSzy2/QhS2yM41bBISR/+S2tYO9VXRdfLdq93OJ1/8bF4MPVJieJA8H+3BlOSrVW4J1CphhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004051; c=relaxed/simple;
	bh=kQ8hGhzbS5NT85smkTyj8CfxpEUPiILxDtS8kM8Hq5E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jEpF7ZJzT8+09W76TdNiOuBh364VyUqDAjy0JbKfeA2eabHbEx1mQAXkgmetKPQEmNL/YWxcB1pQPmlP8sOuthB5KkDu73b7M9tFppCizRb2iMqKprYGTvQaMr8HFjy0ZcelU58ky9mH47bwMHay8q/AWJGO0MD45+yMzvlgOvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGWuEvzS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGWuEvzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747004050; x=1778540050;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kQ8hGhzbS5NT85smkTyj8CfxpEUPiILxDtS8kM8Hq5E=;
  b=GGWuEvzSlNVFbd9UxnIdhodpucZ0W3clWKD68hMR4EjR5GyvPtFqdaGz
   4Fw1pX/NLfyFhGDm2AWx4hJnxAoXxQ15EsEwAt8tGVOX8q4Qyk2EyqRL+
   je6GMdAGtcBH2F8InMl9m4Zo2+9Jc/nKJxMYPviSFNuSuBsvmdPJEzo3z
   zH0LiIiyx3bA3OF2kf0mcDJXFinJdVWwrTvbMgyrIRLBKPxQd17HTBuNd
   j7JZycyh6xSadJ7erMztbBCOGRQtWuYkqZmNd1zMv8wJg+hw8ocaUlK7Y
   VVRBmK89Q6MKwC8GB/aLKsi1dlnLiSPaEV6UcDP2s93XBS2ZvT0hpOe6Q
   w==;
X-CSE-ConnectionGUID: 7kK3Co5oSEmJ48pUnvC/bw==
X-CSE-MsgGUID: AlM7uQ+HQuC84tzNaBV3OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66192177"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="66192177"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 15:54:10 -0700
X-CSE-ConnectionGUID: 8wtEbG1dTT+dSlOHI/vE1w==
X-CSE-MsgGUID: YRIoJXh9SkSDLavB56AzqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142168315"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 15:54:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 May 2025 01:54:01 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v13] platform/x86: Add AMD ISP platform config for
 OV05C10
In-Reply-To: <20250509181220.1744783-1-pratap.nirujogi@amd.com>
Message-ID: <6b649ebf-6f03-4050-18bb-788bbb3a664e@linux.intel.com>
References: <20250509181220.1744783-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 May 2025, Pratap Nirujogi wrote:

> ISP device specific configuration is not available in ACPI. Add
> swnode graph to configure the missing device properties for the
> OV05C10 camera device supported on amdisp platform.
> 
> Add support to create i2c-client dynamically when amdisp i2c
> adapter is available.
> 
> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
> Changes v12 -> v13:
> 
> * Add "struct amdisp_platform_info" to pass sensor specific
> configuration and make the driver generic to support OV05C10
> and other supported sensor modules in future.
> 
> * Address cosmetic and other review comments.
> 
>  drivers/platform/x86/amd/Kconfig    |  11 +
>  drivers/platform/x86/amd/Makefile   |   1 +
>  drivers/platform/x86/amd/amd_isp4.c | 309 ++++++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/amd_isp4.c
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index c3e086ea64fc..152a68a470e8 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>  
>  	  This mechanism will only be activated on platforms that advertise a
>  	  need for it.
> +
> +config AMD_ISP_PLATFORM
> +	tristate "AMD ISP4 platform driver"
> +	depends on I2C && X86_64 && ACPI
> +	help
> +	  Platform driver for AMD platforms containing image signal processor
> +	  gen 4. Provides camera sensor module board information to allow
> +	  sensor and V4L drivers to work properly.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called amd_isp4.
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index c6c40bdcbded..b0e284b5d497 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
>  obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>  obj-$(CONFIG_AMD_PMF)		+= pmf/
>  obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> +obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> new file mode 100644
> index 000000000000..27939020634c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,309 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * AMD ISP platform driver for sensor i2-client instantiation
> + *
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/units.h>
> +
> +#define AMDISP_OV05C10_I2C_ADDR		0x10
> +#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"

This is not used anywhere?

> +#define AMDISP_OV05C10_HID		"OMNI5C10"
> +#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
> +#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
> +
> +/*
> + * AMD ISP platform info definition to initialize sensor
> + * specific platform configuration to prepare the amdisp
> + * platform.
> + */
> +struct amdisp_platform_info {
> +	struct i2c_board_info board_info;
> +	const struct software_node **swnodes;
> +};
> +
> +/*
> + * AMD ISP platform definition to configure the device properties
> + * missing in the ACPI table.
> + */
> +struct amdisp_platform {
> +	const struct amdisp_platform_info *pinfo;
> +	struct i2c_board_info board_info;
> +	struct notifier_block i2c_nb;
> +	struct i2c_client *i2c_dev;
> +	struct mutex lock;	/* protects i2c client creation */

Missing #include.

> +};
> +
> +/* Top-level OV05C10 camera node property table */
> +static const struct property_entry ov05c10_camera_props[] = {
> +	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
> +	{ }
> +};
> +
> +/* Root AMD ISP OV05C10 camera node definition */
> +static const struct software_node camera_node = {
> +	.name = AMDISP_OV05C10_HID,
> +	.properties = ov05c10_camera_props,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Ports node definition. No properties defined for
> + * ports node for OV05C10.
> + */
> +static const struct software_node ports = {
> +	.name = "ports",
> +	.parent = &camera_node,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Port node definition. No properties defined for
> + * port node for OV05C10.
> + */
> +static const struct software_node port_node = {
> +	.name = "port@",
> +	.parent = &ports,
> +};
> +
> +/*
> + * Remote endpoint AMD ISP node definition. No properties defined for
> + * remote endpoint node for OV05C10.
> + */
> +static const struct software_node remote_ep_isp_node = {
> +	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
> +};
> +
> +/*
> + * Remote endpoint reference for isp node included in the
> + * OV05C10 endpoint.
> + */
> +static const struct software_node_ref_args ov05c10_refs[] = {
> +	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> +};
> +
> +/* OV05C supports one single link frequency */
> +static const u64 ov05c10_link_freqs[] = {

+ #include <linux/types.h>

> +	925 * HZ_PER_MHZ,
> +};
> +
> +/* OV05C supports only 2-lane configuration */
> +static const u32 ov05c10_data_lanes[] = {
> +	1,
> +	2,
> +};
> +
> +/* OV05C10 endpoint node properties table */
> +static const struct property_entry ov05c10_endpoint_props[] = {
> +	PROPERTY_ENTRY_U32("bus-type", 4),
> +	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
> +				     ARRAY_SIZE(ov05c10_data_lanes)),
> +	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
> +				     ARRAY_SIZE(ov05c10_link_freqs)),
> +	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
> +	{ }
> +};
> +
> +/* AMD ISP endpoint node definition */
> +static const struct software_node endpoint_node = {
> +	.name = "endpoint",
> +	.parent = &port_node,
> +	.properties = ov05c10_endpoint_props,
> +};
> +
> +/*
> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
> + * fixed to align with the structure that v4l2 expects for successful
> + * endpoint fwnode parsing.
> + *
> + * It is only the node property_entries that will vary for each platform
> + * supporting different sensor modules.
> + */
> +static const struct software_node *ov05c10_nodes[] = {
> +	&camera_node,
> +	&ports,
> +	&port_node,
> +	&endpoint_node,
> +	&remote_ep_isp_node,
> +	NULL
> +};
> +
> +/* OV05C10 specific AMD ISP platform configuration */
> +static const struct amdisp_platform_info ov05c10_platform_config = {
> +	.board_info = {
> +		.dev_name = "ov05c10",
> +		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
> +	},
> +	.swnodes = ov05c10_nodes,
> +};
> +
> +static const struct acpi_device_id amdisp_sensor_ids[] = {
> +	{ AMDISP_OV05C10_HID, (kernel_ulong_t)&ov05c10_platform_config },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> +
> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> +{
> +	return !strcmp(adap->owner->name, "i2c_designware_amdisp");

Missing #include.

> +}
> +
> +static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_platform,
> +				       struct i2c_adapter *adap)
> +{
> +	struct i2c_board_info *info = &isp4_platform->board_info;
> +	struct i2c_client *i2c_dev;
> +
> +	guard(mutex)(&isp4_platform->lock);
> +
> +	if (isp4_platform->i2c_dev)
> +		return;
> +
> +	i2c_dev = i2c_new_client_device(adap, info);
> +	if (IS_ERR(i2c_dev)) {

Missing #include.

> +		dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
> +		return;
> +	}
> +	isp4_platform->i2c_dev = i2c_dev;
> +}
> +
> +static int isp_i2c_bus_notify(struct notifier_block *nb,
> +			      unsigned long action, void *data)
> +{
> +	struct amdisp_platform *isp4_platform =
> +		container_of(nb, struct amdisp_platform, i2c_nb);
> +	struct device *dev = data;
> +	struct i2c_client *client;
> +	struct i2c_adapter *adap;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		adap = i2c_verify_adapter(dev);
> +		if (!adap)
> +			break;
> +		if (is_isp_i2c_adapter(adap))
> +			instantiate_isp_i2c_client(isp4_platform, adap);
> +		break;
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +		client = i2c_verify_client(dev);
> +		if (!client)
> +			break;
> +
> +		scoped_guard(mutex, &isp4_platform->lock) {
> +			if (isp4_platform->i2c_dev == client) {
> +				dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +				isp4_platform->i2c_dev = NULL;
> +			}
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct amdisp_platform *prepare_amdisp_platform(struct device *dev,
> +						       const struct amdisp_platform_info *src)
> +{
> +	struct amdisp_platform *isp4_platform;
> +	int ret;
> +
> +	isp4_platform = devm_kzalloc(dev, sizeof(*isp4_platform), GFP_KERNEL);
> +	if (!isp4_platform)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = devm_mutex_init(dev, &isp4_platform->lock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	isp4_platform->board_info.dev_name = src->board_info.dev_name;
> +	strscpy(isp4_platform->board_info.type, src->board_info.type);
> +	isp4_platform->board_info.addr = src->board_info.addr;
> +	isp4_platform->pinfo = src;
> +
> +	ret = software_node_register_node_group(src->swnodes);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	isp4_platform->board_info.swnode = src->swnodes[0];
> +
> +	return isp4_platform;
> +}
> +
> +static int try_to_instantiate_i2c_client(struct device *dev, void *data)
> +{
> +	struct amdisp_platform *isp4_platform = (struct amdisp_platform *)data;

No need to cast from void *.

> +	struct i2c_adapter *adap = i2c_verify_adapter(dev);
> +
> +	if (!isp4_platform || !adap)
> +		return 0;
> +	if (!adap->owner)
> +		return 0;
> +
> +	if (is_isp_i2c_adapter(adap))
> +		instantiate_isp_i2c_client(isp4_platform, adap);
> +
> +	return 0;
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	const struct amdisp_platform_info *pinfo;
> +	struct amdisp_platform *isp4_platform;
> +	int ret;
> +
> +	pinfo = device_get_match_data(&pdev->dev);
> +	if (!pinfo) {
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "failed to get valid ACPI data\n");
> +	}
> +
> +	isp4_platform = prepare_amdisp_platform(&pdev->dev, pinfo);
> +	if (IS_ERR(isp4_platform))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(isp4_platform),
> +				     "failed to prepare AMD ISP platform fwnode\n");
> +
> +	isp4_platform->i2c_nb.notifier_call = isp_i2c_bus_notify;
> +	ret = bus_register_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
> +	if (ret)
> +		goto error_unregister_sw_node;
> +
> +	/* check if adapter is already registered and create i2c client instance */
> +	i2c_for_each_dev((void *)isp4_platform, try_to_instantiate_i2c_client);

No need to case pointer to/from void *.

> +
> +	platform_set_drvdata(pdev, isp4_platform);
> +	return 0;
> +
> +error_unregister_sw_node:
> +	software_node_unregister_node_group(isp4_platform->pinfo->swnodes);
> +	return ret;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *isp4_platform = platform_get_drvdata(pdev);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
> +	i2c_unregister_device(isp4_platform->i2c_dev);
> +	software_node_unregister_node_group(isp4_platform->pinfo->swnodes);
> +}
> +
> +static struct platform_driver amd_isp_platform_driver = {
> +	.driver	= {
> +		.name			= AMD_ISP_PLAT_DRV_NAME,
> +		.acpi_match_table	= amdisp_sensor_ids,
> +	},
> +	.probe	= amd_isp_probe,
> +	.remove	= amd_isp_remove,
> +};
> +
> +module_platform_driver(amd_isp_platform_driver);
> +
> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.

