Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152942914;
	Fri, 28 Mar 2025 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156102; cv=none; b=AEhyeVBqu/Fr8aDfWzBa8fmrSE7j9B/+E6yTgK4EmDRiH0JvL/GQN6w8sE/jIawwdp/5bV2lLByTS90NIgLeYsDBS8lzGsHZDQCuMN/b1VgYFDND+kcQOpLsGD+IKdrRBpnlrGZCNmsstop6FWmmNUA1rvXaB9XoWuQp999NCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156102; c=relaxed/simple;
	bh=9JzAPPP3hvCbJcCvWLR41hJrJ0FMf55tvFHA6eCg6H0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t1jt5xVCioPduogFRwcSyw2QMEkH8Ms4heVvm8q4hxWwIIGRQMAmSp+3g7qOEhcMByS6Xz9FD5qm8b+kGoPDXPuNII05EVJsT6R7xOVAHSkJVkm/dMLWC+fdF7MWNq/3Xv1G9w+hGOyGK5/Qnb1GQ2tNQ+Y7PTzWsyYpQapWxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcufYkoy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcufYkoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743156100; x=1774692100;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9JzAPPP3hvCbJcCvWLR41hJrJ0FMf55tvFHA6eCg6H0=;
  b=LcufYkoyTwnuuFUP7Q1ARbBSd4KQVG+GoFOJbCQlBRX85MbKOgyjb/aG
   qzMvvW0uM2NGJSGzYTpd9xIS+zGI4nYIRyFuGR2Rs6o7lDa9aoriJl6Jr
   uiOQHLxQAbe1hDAzKbCyolJOohdTe/8U1pJTDqM+JllM3B0W5vqTq+je1
   Sb7Vq4PncvURmDkpMsS3FIJzA6ZPPHwp0bNR9jigsQqPrs0JmAuWWw/uB
   +sMNC39cYlxIr3LNne0hZo5iWOvsUQpHgJ10zLB9Fj0++8PajfojIgKLw
   mzAqn+gteCXHVrjD3kkg635JUQlgxbbtAiBs3w7RmTtUnr4VHuV9+bcXq
   Q==;
X-CSE-ConnectionGUID: goIS9VlrQ+WFXaolqCasNQ==
X-CSE-MsgGUID: MUUr7hWtRRejFQs7ofz0vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55881076"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55881076"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:01:39 -0700
X-CSE-ConnectionGUID: dJ94W6DQQb+K/0ZLjwAKMg==
X-CSE-MsgGUID: RzpMdlSMSLmjcIxEs8AdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="129550425"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:01:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 12:01:33 +0200 (EET)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
    platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
    benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com, 
    dantony@amd.com
Subject: Re: [PATCH v3] platform/x86: Add AMD ISP platform config for
 OV05C10
In-Reply-To: <20250327221423.1248521-1-pratap.nirujogi@amd.com>
Message-ID: <496ab43a-1d84-6184-db66-7bb19893a7b5@linux.intel.com>
References: <20250327221423.1248521-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2025, Pratap Nirujogi wrote:

> ISP device specific configuration is not available in ACPI. Add
> swnode graph to configure the missing device properties for the
> OV05C10 camera device supported on amdisp platform.
> 
> Add support to create i2c-client dynamically when amdisp i2c
> adapter is available.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
> ---
> v2 -> v3:
> 
> - Remodelled as ACPI driver to bind the device when matching
> acpi sensor device is detected. This eliminated the need for
> dmi checks for platform validation.
> 
> - Added software nodes to align with camera device-tree format
> to capture the camera device properties missing in the ACPI.
> 
> - Constructed swnode graph in the below format to successfully
> parse the endpoint node using v4l2_fwnode_endpoint_alloc_parse().
> 
> OMNI5C10 {
> 	refclk = 24MHz;
> 	ports {
> 		port@ {
> 			endpoint {
> 				bus-type = 4;
> 				data-lanes = <1 2>;
> 				link-frequencies = 925MHz;
> 				remote-endpoint = &ov05c10_refs;
> 			};
> 		};
> 	};
> };
> 
> - GPIO sensor lookup is moved out of this driver scope, it is taken care
> in isp driver module init.
> 
> - This platform driver is specific to AMD ISP4, hence renamed driver
> name as "amd-isp4".
> 
>  drivers/platform/x86/amd/Kconfig    |  11 +
>  drivers/platform/x86/amd/Makefile   |   1 +
>  drivers/platform/x86/amd/amd_isp4.c | 354 ++++++++++++++++++++++++++++
>  3 files changed, 366 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/amd_isp4.c
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index c3e086ea64fc..4b373edd750d 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>  
>  	  This mechanism will only be activated on platforms that advertise a
>  	  need for it.
> +
> +config AMD_ISP_PLATFORM
> +	bool "AMD platform with ISP4 that supports Camera sensor device"
> +	depends on I2C && X86_64 && AMD_ISP4
> +	help
> +	  For AMD platform that support Image signal processor generation 4, it
> +	  is necessary to add platform specific camera sensor module board info
> +	  which includes the sensor driver device id and the i2c address.
> +
> +	  If you have a AMD platform that support ISP4 and with a sensor
> +	  connected to it, say Y here
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
> index 000000000000..c4dce3779543
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,354 @@
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
> + * AMD ISP platform definition to configure the device properites
> + * missing in the ACPI table.
> + */
> +struct amdisp_platform {
> +	const char *name;
> +	struct i2c_board_info board_info;
> +	u8 i2c_addr;
> +	struct i2c_client *i2c_dev;
> +	u8 max_num_swnodes;

I'd put u8 next to each other to avoid having unnecessary gaps in the 
layout (I understand you put them in this order likely due to logical 
connection between the integer and pointer but having u8 sprinkled 
around here and there leaves holes into the layout).

> +	struct software_node **swnodes;
> +};
> +
> +static struct amdisp_platform *ov05c10_amdisp;
> +
> +/* Top-level OV05C10 camera node property table */
> +static const struct property_entry ov05c10_camera_props[] __initconst = {
> +	PROPERTY_ENTRY_U32("refclk", 24 * HZ_PER_MHZ),
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
> +static const struct software_node_ref_args ov05c10_refs[] __initconst = {
> +	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> +};
> +
> +/* OV05C supports one single link frequency */
> +static const u64 ov05c10_link_freqs[] __initconst = {
> +	925 * HZ_PER_MHZ,
> +};
> +
> +/* OV05C supports only 2-lane configuration */
> +static const u32 ov05c10_data_lanes[] __initconst = {
> +	1,
> +	2,
> +};
> +
> +/* OV05C10 endpoint node properties table */
> +static const struct property_entry ov05c10_endpoint_props[] __initconst = {
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
> +	return !strncmp(adap->owner->name, "i2c_designware_amdisp", 48);

Eh, where that magic 48 comes from??? Why do you even need str_n_cmp() 
variant here?

> +}
> +
> +static void instantiate_isp_i2c_client(struct i2c_adapter *adap)
> +{
> +	struct i2c_board_info *info = &ov05c10_amdisp->board_info;
> +	struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
> +
> +	if (i2c_dev)
> +		return;
> +
> +	if (!info->addr) {
> +		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
> +			ov05c10_amdisp->i2c_addr);
> +		return;
> +	}
> +
> +	i2c_dev = i2c_new_client_device(adap, info);
> +	if (IS_ERR(i2c_dev)) {
> +		dev_err(&adap->dev, "error %ld registering isp i2c_client\n",
> +			PTR_ERR(i2c_dev));

Please use %pe.

> +		i2c_dev = NULL;
> +	} else {
> +		dev_dbg(&adap->dev, "registered amdisp i2c_client on address 0x%02x\n",
> +			info->addr);
> +	}
> +	i2c_put_adapter(adap);
> +}
> +
> +static int isp_i2c_bus_notify(struct notifier_block *nb,
> +			      unsigned long action, void *data)
> +{
> +	struct device *dev = data;
> +	struct i2c_client *client;
> +	struct i2c_adapter *adap;
> +	struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		adap = i2c_verify_adapter(dev);
> +		if (!adap)
> +			break;
> +		if (is_isp_i2c_adapter(adap))
> +			instantiate_isp_i2c_client(adap);
> +		break;
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +		client = i2c_verify_client(dev);
> +		if (!client)
> +			break;
> +		if (i2c_dev == client) {
> +			dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +			i2c_dev = NULL;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block isp_i2c_nb = { .notifier_call = isp_i2c_bus_notify };
> +
> +static int release_amdisp_swnode_props(struct software_node **swnodes,
> +				       u8 num_swnodes)
> +{
> +	int i;

unsigned int

> +
> +	for (i = 0; i < num_swnodes; i++) {
> +		if (swnodes[i] &&
> +		    !IS_ERR_OR_NULL(swnodes[i]->properties)) {

This fits to a sinle line and you can remove the braces too then.

> +			property_entries_free(swnodes[i]->properties);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int initialize_ov05c10_swnode_props(struct amdisp_platform *p)
> +{
> +	struct software_node *sw_node;
> +	int ret;
> +	int i;

unsigned int, please move it before ret as it will be then longer than 
"int ret;"

> +
> +	if (strncmp(p->name, AMDISP_OV05C10_PLAT_NAME,
> +		    strlen(AMDISP_OV05C10_PLAT_NAME)))

Why you need str_n_cmp()?? AMDISP_OV05C10_PLAT_NAME is NUL terminated so 
strlen(AMDISP_OV05C10_PLAT_NAME) "stop point" is meaningless.

> +		return -EINVAL;
> +
> +	/* Initialize platform specific props for each node */

This seems pretty unnecessary comment given the name of this function. I'd 
just drop it as it doesn't add much vlaue.

> +	for (i = 0; i < p->max_num_swnodes; i++) {
> +		sw_node = p->swnodes[i];
> +
> +		if (sw_node->properties) {

Please reverse the logic and use continue.

> +			sw_node->properties = property_entries_dup(sw_node->properties);
> +			if (IS_ERR(sw_node->properties)) {
> +				ret = PTR_ERR(sw_node->properties);
> +				goto error_release_node_props;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +
> +error_release_node_props:
> +	release_amdisp_swnode_props(p->swnodes, p->max_num_swnodes);
> +	return ret;
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
> +	ret = initialize_ov05c10_swnode_props(isp_ov05c10);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	info = &isp_ov05c10->board_info;
> +
> +	sw_nodes = (const struct software_node **)src->swnodes;
> +	ret = software_node_register_node_group(sw_nodes);
> +	if (ret)
> +		goto error_unregister_sw_node;
> +
> +	sw_node = (const struct software_node *)src->swnodes[0];
> +	info->fwnode = software_node_fwnode(sw_node);
> +	if (IS_ERR(info->fwnode)) {
> +		ret = PTR_ERR(info->fwnode);
> +		goto error_unregister_sw_node;
> +	}
> +
> +	return isp_ov05c10;
> +
> +error_unregister_sw_node:
> +	software_node_unregister_node_group(sw_nodes);
> +
> +error_free_platform:
> +	kfree(isp_ov05c10);
> +	return ERR_PTR(ret);
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ov05c10_amdisp = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
> +	if (IS_ERR(ov05c10_amdisp)) {
> +		pr_err("failed to prepare amdisp platform fw node");

Missing \n

dev_err_probe()

> +		return PTR_ERR(ov05c10_amdisp);
> +	}
> +
> +	/*
> +	 * Register notifier to instantiate i2c client when AMD ISP adapter
> +	 * is ready.

How is "when AMD ISP adapter is ready" related to what the code does below 
this comment?? If it only refers to "once we've setup everything", that's 
what probe is doing in general so why comment such obvious expectation. 
The first part of the comment can be read from the code below so I think 
this entire comment is useless.

> +	 */
> +	ret = bus_register_notifier(&i2c_bus_type, &isp_i2c_nb);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	return ret;
> +
> +error_free_platform:
> +	kfree(ov05c10_amdisp);

Is this really all you have to rollback??? It seems that 
prepare_amdisp_platform() does more rollback itself if it fails in the 
middle (and so does amd_isp_remove) so why those same rollbacks do not 
need to be done here?

> +	return ret;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	bus_unregister_notifier(&i2c_bus_type, &isp_i2c_nb);
> +	i2c_unregister_device(ov05c10_amdisp->i2c_dev);

I've my reservations about this when it comes to things being properly 
synchronized.

> +	release_amdisp_swnode_props(ov05c10_amdisp->swnodes,
> +				    ov05c10_amdisp->max_num_swnodes);
> +	software_node_unregister_node_group((const struct software_node **)
> +					    ov05c10_amdisp->swnodes);
> +	kfree(ov05c10_amdisp);
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

