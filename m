Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68720298D;
	Tue, 15 Apr 2025 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731737; cv=none; b=C6BamLOcP/K8+YNXXJAdERnMq39aVp49SB9Ufk1T3jJK2J8Hd9IQ3qJqK7TpKMY4lZ0BhoP7Nv2kQzEyufdYUB8dXxS3IJcIEAt3UWhZNZwvoz8X3Ls5OSpx1uG+eOajFA8qQxY9H/ww3pR6GjV7Kjj8ZQm8+/GDwP98cmbbvTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731737; c=relaxed/simple;
	bh=UGKtzN4aWO6U1O3ajTIdkODTuzeF0Vgi+tMgVObbm84=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q2bC+mNLx4nW77GtRsYD+JpaAhm/9Xv9WwYdvxjCB0NdVe7mqH6I04wp5rSrz6VUmdBgAmrlZ+xpjdwKIMfqxSmP6HbmaK7EjMqs9siUxQpWsLmDjGRlp/foSV5b62ODpKKoPh/IYQdI43V6DHsC7qTrp+EMHVUZe0j100UBmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mux0kKKV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mux0kKKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744731736; x=1776267736;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UGKtzN4aWO6U1O3ajTIdkODTuzeF0Vgi+tMgVObbm84=;
  b=Mux0kKKVtIzzey5/UdTbzwiqzbGOKiqxHP18IsxZHPO44jLxgrrrJ5oN
   N5G1Bh0NYZd0xGANZerBuscBFxKs1Eb1z2waV5h5i5jfZzgA4wr+2TdtJ
   fF71cpdqf6J6SUPrV1uIcC/v0liSWWRlZayTkKlbmi486QtlbqGbqUlOv
   EKwlFLP7OVKkxz0hn1EQF6HKHuv833eoArFZnSNQgLtQ4YoehxovwbxEZ
   2JeBiZkqeXNexpKaYaaUhgJrYGWmMG9monWqTy8NUBQ38VCzqKxf6yyiN
   2dwNTeSoj/IQII6ceNVxL119UiQgmBWZWWxOz8Fo2R8bakHyYwORD1XmQ
   Q==;
X-CSE-ConnectionGUID: sDjE0CRyTCmz9Hu43yS1gg==
X-CSE-MsgGUID: C5zy0IAyTY+TyAfnS2E5qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63790100"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="63790100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 08:42:15 -0700
X-CSE-ConnectionGUID: Ye6D+9loQNiOBrfe1MypMA==
X-CSE-MsgGUID: tKB5YzzWTpCwPkUPWosLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130016602"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 08:42:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Apr 2025 18:42:07 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v5] platform/x86: Add AMD ISP platform config for
 OV05C10
In-Reply-To: <20250408203330.801792-1-pratap.nirujogi@amd.com>
Message-ID: <128ded89-f8e2-6306-47eb-2275b3f33a6c@linux.intel.com>
References: <20250408203330.801792-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Apr 2025, Pratap Nirujogi wrote:

> ISP device specific configuration is not available in ACPI. Add
> swnode graph to configure the missing device properties for the
> OV05C10 camera device supported on amdisp platform.
> 
> Add support to create i2c-client dynamically when amdisp i2c
> adapter is available.
> 
> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
> Changes v4 -> v5:
> 
> * Avoid global variables and make driver reentrant following the
> state container design pattern.
> 
> * Fix coding error referencing i2c_dev variable of amdisp_platform
> in instantiate_isp_i2c_client().
> 
> * Remove i2c_put_adapter(). Not required as i2c_get_adapter() is not called.
> 
> * Use i2c_board_info->swnode instead of fwnode to fix refcount imbalance
> warnings when module is removed.
> 
> * Address review comments.
> 
>  drivers/platform/x86/amd/Kconfig    |  11 ++
>  drivers/platform/x86/amd/Makefile   |   1 +
>  drivers/platform/x86/amd/amd_isp4.c | 295 ++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/amd_isp4.c
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index c3e086ea64fc..ec755b5fc93c 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>  
>  	  This mechanism will only be activated on platforms that advertise a
>  	  need for it.
> +
> +config AMD_ISP_PLATFORM
> +	tristate "AMD ISP4 platform driver"
> +	depends on I2C && X86_64 && ACPI && AMD_ISP4
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
> index 000000000000..ad181ab96423
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * AMD ISP platform driver for sensor i2-client instantiation
> + *
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device/bus.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/units.h>
> +
> +#define AMDISP_OV05C10_I2C_ADDR		0x10
> +#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"
> +#define AMDISP_OV05C10_HID		"OMNI5C10"
> +#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
> +#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
> +
> +/*
> + * AMD ISP platform definition to configure the device properties
> + * missing in the ACPI table.
> + */
> +struct amdisp_platform {
> +	const char *name;
> +	u8 i2c_addr;
> +	u8 max_num_swnodes;
> +	struct i2c_board_info board_info;
> +	struct notifier_block i2c_nb;
> +	struct i2c_client *i2c_dev;
> +	struct software_node **swnodes;

Can't this too be const struct so you can avoid a few casts below?

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
> +#define NUM_SW_NODES 5
> +
> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
> +	&camera_node,
> +	&ports,
> +	&port_node,
> +	&endpoint_node,
> +	&remote_ep_isp_node,
> +	NULL
> +};
> +
> +/* OV05C10 specific AMD ISP platform configuration */
> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
> +	.name = AMDISP_OV05C10_PLAT_NAME,
> +	.board_info = {
> +		.dev_name = "ov05c10",
> +		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
> +	},
> +	.i2c_addr = AMDISP_OV05C10_I2C_ADDR,
> +	.max_num_swnodes = NUM_SW_NODES,
> +	.swnodes = (struct software_node **)ov05c10_nodes,
> +};
> +
> +static const struct acpi_device_id amdisp_sensor_ids[] = {
> +	{ AMDISP_OV05C10_HID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> +
> +static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> +{
> +	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> +}
> +
> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
> +{
> +	struct i2c_board_info *info = &ov05c10->board_info;
> +	struct i2c_client *i2c_dev;
> +
> +	if (ov05c10->i2c_dev)
> +		return;
> +
> +	if (!info->addr) {
> +		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
> +			ov05c10->i2c_addr);

Put on a single line, you've longer lines already than what this is.

> +		return;
> +	}
> +
> +	i2c_dev = i2c_new_client_device(adap, info);
> +	if (IS_ERR(i2c_dev)) {
> +		dev_err(&adap->dev, "error %pe registering isp i2c_client\n",
> +			i2c_dev);

Ditto.

> +		return;
> +	}
> +	ov05c10->i2c_dev = i2c_dev;
> +}
> +
> +static int isp_i2c_bus_notify(struct notifier_block *nb,
> +			      unsigned long action, void *data)
> +{
> +	struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
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
> +			instantiate_isp_i2c_client(ov05c10, adap);
> +		break;
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +		client = i2c_verify_client(dev);
> +		if (!client)
> +			break;
> +		if (ov05c10->i2c_dev == client) {
> +			dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +			ov05c10->i2c_dev = NULL;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	const struct software_node **sw_nodes;
> +	const struct software_node *sw_node;
> +	struct i2c_board_info *info;
> +	int ret;
> +
> +	isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);
> +
> +	info = &isp_ov05c10->board_info;
> +
> +	sw_nodes = (const struct software_node **)src->swnodes;
> +	ret = software_node_register_node_group(sw_nodes);
> +	if (ret)
> +		goto error_unregister_sw_node;
> +
> +	sw_node = (const struct software_node *)src->swnodes[0];
> +	info->swnode = sw_node;
> +
> +	return isp_ov05c10;
> +
> +error_unregister_sw_node:
> +	software_node_unregister_node_group(sw_nodes);

If register failed, why you are calling unregister for it?? 

> +	kfree(isp_ov05c10);
> +	return ERR_PTR(ret);
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10;
> +	int ret;
> +
> +	ov05c10 = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
> +	if (IS_ERR(ov05c10))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
> +				     "failed to prepare amdisp platform fw node\n");

fwnode

Please also capitalize properly as this is user visible message, AMD ISP ?

> +
> +	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
> +
> +	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	platform_set_drvdata(pdev, ov05c10);
> +	return ret;

return 0

> +
> +error_free_platform:
> +	kfree(ov05c10);
> +	return ret;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
> +
> +	if (IS_ERR_OR_NULL(ov05c10))

How can this happen??

> +		return;
> +
> +	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	i2c_unregister_device(ov05c10->i2c_dev);
> +	software_node_unregister_node_group((const struct software_node **)

Unnecessary cast?

> +					    ov05c10->swnodes);
> +	kfree(ov05c10);
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

