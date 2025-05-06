Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A45724BBF3;
	Tue,  6 May 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536431; cv=none; b=U9trdHbotv5IabgUhMo202av+jPsK8KxyfhlV3HQ6EuT7D0hFLCnVrolJ2IZxxLfI+vRvaE5jBNaZQLA5SLnSqrD85YYvifnYO8tQ3NNjfyQBgnbN4aYOORjB4pQ/xT7S+pLI5mqko2i9ecokg3HtoRP0MYs7BHJl5R6FQvab24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536431; c=relaxed/simple;
	bh=eOdYWkcepMZABeD/EA8+r075t5CWSCXL6jIPVtQItD8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dyL1et/SvWxbU0ZWeV7Am1XAGZFtS7NLF9hlsDMOl0V9pBgs/eLF8qr9ULHpXinDWYnK3vnd3sAMPgTzKFO2EPQauIUAvIuT+/MprVPjKPg/9pQgHuzLWxDivrwFdFpUoHW9JdwdALmPpQbXkX5zvOuZC3+sF7PA80+ccCSyNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsUdNNiM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsUdNNiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746536429; x=1778072429;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eOdYWkcepMZABeD/EA8+r075t5CWSCXL6jIPVtQItD8=;
  b=RsUdNNiM8T7AqXHm5CsSq0N4wcZollWy0E7tZLJS1fxHNEvWtn9ewMnW
   rd90/ajsx8w8hzvcKK2o8be8cx6uwOwn6nW/+5iQxD75O6QmalbwqL+Si
   665dbl0IG8FkSk44ENe7pcXicftwuWyAxnLCK01qYimOqvyVv5Xoe5RHm
   z3Vya2/XwyFLuznZCat2fq/JZGCpvSI0DTPiDt34SVMCs0KsYic/dcXnA
   +y93CYPzPd+AEx3imFJV6idmN3qaaO5RMFYigBep2D5KVjGnpS6PqYM64
   drFZa1jDVwQWzjK5y4V6S93aMj5oKdhkqQJl+OUMmbjdzkVpelt3ZahGt
   Q==;
X-CSE-ConnectionGUID: q26whnrxQhahnLQjN4zOxg==
X-CSE-MsgGUID: PmINmNF3SfOFAdnARCVUPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59592933"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="59592933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 06:00:28 -0700
X-CSE-ConnectionGUID: acxHd2tlR8uut8RjAFrZ9Q==
X-CSE-MsgGUID: qRwi0E2YTv6iJN2zmejlfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="140732085"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.207])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 06:00:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 May 2025 16:00:21 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for
 OV05C10
In-Reply-To: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
Message-ID: <51708888-3568-2529-2c99-c1df291f4cac@linux.intel.com>
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Pratap Nirujogi wrote:

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
> Changes v11 -> v12:
> 
> * Add missing space before the open parenthesis '('
> 
>  drivers/platform/x86/amd/Kconfig    |  11 ++
>  drivers/platform/x86/amd/Makefile   |   1 +
>  drivers/platform/x86/amd/amd_isp4.c | 280 ++++++++++++++++++++++++++++
>  3 files changed, 292 insertions(+)
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
> index 000000000000..1520ebb94507
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,280 @@
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
> +#define AMDISP_OV05C10_HID		"OMNI5C10"
> +#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
> +#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
> +
> +/*
> + * AMD ISP platform definition to configure the device properties
> + * missing in the ACPI table.
> + */
> +struct amdisp_platform {
> +	struct i2c_board_info board_info;
> +	struct notifier_block i2c_nb;
> +	struct i2c_client *i2c_dev;
> +	struct mutex lock; /* protects i2c client creation */

Please add one tab before the comment such that it moves a bit more right.

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
> +static const struct acpi_device_id amdisp_sensor_ids[] = {
> +	{ AMDISP_OV05C10_HID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> +
> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> +{
> +	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> +}
> +
> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
> +{
> +	struct i2c_board_info *info = &ov05c10->board_info;
> +	struct i2c_client *i2c_dev;
> +
> +	guard(mutex)(&ov05c10->lock);
> +
> +	if (ov05c10->i2c_dev)
> +		return;
> +
> +	i2c_dev = i2c_new_client_device(adap, info);
> +	if (IS_ERR(i2c_dev)) {
> +		dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
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
> +
> +		scoped_guard(mutex, &ov05c10->lock) {
> +			if (ov05c10->i2c_dev == client) {
> +				dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +				ov05c10->i2c_dev = NULL;
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
> +static struct amdisp_platform *prepare_amdisp_platform(struct device *dev)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	int ret;
> +
> +	isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = devm_mutex_init(dev, &isp_ov05c10->lock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	isp_ov05c10->board_info.dev_name = "ov05c10";
> +	strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);

There's some clever VA_ARGS magic in the strscpy() macro such that the 
size parameter is optional in many cases. Thus, in cases where the size 
parameter is the same as the size of the dst known to the compiler, please 
only provide dst and src to strscpy().

-- 
 i.

> +	isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
> +
> +	ret = software_node_register_node_group(ov05c10_nodes);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
> +
> +	return isp_ov05c10;
> +}
> +
> +static int try_to_instantiate_i2c_client(struct device *dev, void *data)
> +{
> +	struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
> +	struct i2c_adapter *adap = i2c_verify_adapter(dev);
> +
> +	if (!ov05c10 || !adap)
> +		return 0;
> +	if (!adap->owner)
> +		return 0;
> +
> +	if (is_isp_i2c_adapter(adap))
> +		instantiate_isp_i2c_client(ov05c10, adap);
> +
> +	return 0;
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10;
> +	int ret;
> +
> +	ov05c10 = prepare_amdisp_platform(&pdev->dev);
> +	if (IS_ERR(ov05c10))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
> +				     "failed to prepare AMD ISP platform fwnode\n");
> +
> +	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
> +	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	if (ret)
> +		goto error_unregister_sw_node;
> +
> +	/* check if adapter is already registered and create i2c client instance */
> +	i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
> +
> +	platform_set_drvdata(pdev, ov05c10);
> +	return 0;
> +
> +error_unregister_sw_node:
> +	software_node_unregister_node_group(ov05c10_nodes);
> +	return ret;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	i2c_unregister_device(ov05c10->i2c_dev);
> +	software_node_unregister_node_group(ov05c10_nodes);
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
