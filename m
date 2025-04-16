Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BE20FAA4;
	Wed, 16 Apr 2025 23:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845736; cv=none; b=Wg+qWX1DoIk3iUGvocSaJrMVP5maFKuJiclvMXLGbO4F8DtvBzfLMSwlYDTAGDc/iHfF42Fe4QCsgX0Pna1D81uxsOu7wOCSZNJciIk4VDAj65oz0KHkwwVOR0AY8rg7MjRD3vZFuyfTJZdCtzXzdiPp4TR+q68UjM0NP8U4TZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845736; c=relaxed/simple;
	bh=rNlhu+JyNQuOu0p92AcfJuF7dduBVtk8osDAJzej6uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UB0wb8rTK0XHdNARyi/G+wJ0/iZ1X2GuzszRlNX8//Wu+x9AzF5qejXcRdorIW/iOmdEm4dmT1BHgmRTDcIHdgZzELwXumQ5qC7VfxPtkvBr6sDIp8+cdxJyqNot2mZMI0ubSLbTQwzyIp5DIXk4W+m1VrDEPTy//lr+ij2/GPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mWbj+h+n; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mWbj+h+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744845722; x=1745450522; i=w_armin@gmx.de;
	bh=a7WurzIvyfRCfmzoW83jbFpkas/kcO+LElQlUDiryRg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mWbj+h+nETcebQ1uAr8dVIqn3W0ZpnwVu+bV9alrm9D5e8l00YKaIWuoGDdoHz/E
	 O60q1soJoU1k92Y1+yWbspic0bCmm9YWsrC00jgvu7fTx5xUVZlVY+phmyemjLCd8
	 glSf4z4chZFqn9H4Q+xnYnpzh5AP9jlbXij0XyUfJqkl32a54XYjJ51r1R3D/OHep
	 NcQetJq+hcdS2+iF3L8BOSU8TIGFp8TseRZxkC8pGbENMMXKGhzcS1RhLIPzY7bAH
	 cETuJe3gX8VzrdL72rLb1Te4YMHl1wj8UrcQ1fOELbb8YyRsx+J+YwXhp2e1qhQKp
	 Ijpf+i5L3nvIT5AhUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhuK-1uItCK1Crq-002x6D; Thu, 17
 Apr 2025 01:22:02 +0200
Message-ID: <9c657496-05b4-49c6-b24c-57be45ef8cc1@gmx.de>
Date: Thu, 17 Apr 2025 01:22:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250416191411.1482060-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250416191411.1482060-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kCUOoS1tDc+ltte+odTmLL4e23qVVNsy8dPbrDhRoNBrR3b0NyV
 URSsxn0/CvlqwIPD6G2sal8U1UQqfZrl0BsV/BHxN78sd5dDa2KPUVUn8oMVC0iT2BBfhSn
 0b+K5DtP8Am3M9uLwapAvExdtyEQvltQLY0rd0+yIlqcdoCX6AMUiZyIT9UspwrxExMPVQs
 vTUs2iaBR8tjjqyhU2dHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:S+mAluLHO6k=;SSEENUvUSeD44xlqiR6Tu4WLmwh
 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
 wWWHYABJYuG1mrMg41I6FM=

Am 16.04.25 um 21:13 schrieb Pratap Nirujogi:

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
> Changes v5 -> v6:
>
> * Cleanup header files
> * Avoid unnecessary casts
> * Fix coding error with software_node_unregister_node_group()
> * Use i2c_client_has_driver() to validate i2c client handle
> * Address other cosmetic errors
>
>   drivers/platform/x86/amd/Kconfig    |  11 ++
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 278 ++++++++++++++++++++++++++++
>   3 files changed, 290 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig
> index c3e086ea64fc..ec755b5fc93c 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>  =20
>   	  This mechanism will only be activated on platforms that advertise a
>   	  need for it.
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
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/am=
d/Makefile
> index c6c40bdcbded..b0e284b5d497 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)		+=3D pmc/
>   obj-$(CONFIG_AMD_HSMP)		+=3D hsmp/
>   obj-$(CONFIG_AMD_PMF)		+=3D pmf/
>   obj-$(CONFIG_AMD_WBRF)		+=3D wbrf.o
> +obj-$(CONFIG_AMD_ISP_PLATFORM)	+=3D amd_isp4.o
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/=
amd/amd_isp4.c
> new file mode 100644
> index 000000000000..9d1abbcc915f
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,278 @@
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
> +	const char *name;
> +	u8 i2c_addr;
> +	u8 max_num_swnodes;
> +	struct i2c_board_info board_info;
> +	struct notifier_block i2c_nb;
> +	struct i2c_client *i2c_dev;
> +	const struct software_node **swnodes;
> +};
> +
> +/* Top-level OV05C10 camera node property table */
> +static const struct property_entry ov05c10_camera_props[] =3D {
> +	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
> +	{ }
> +};
> +
> +/* Root AMD ISP OV05C10 camera node definition */
> +static const struct software_node camera_node =3D {
> +	.name =3D AMDISP_OV05C10_HID,
> +	.properties =3D ov05c10_camera_props,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Ports node definition. No properties defined for
> + * ports node for OV05C10.
> + */
> +static const struct software_node ports =3D {
> +	.name =3D "ports",
> +	.parent =3D &camera_node,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Port node definition. No properties defined for
> + * port node for OV05C10.
> + */
> +static const struct software_node port_node =3D {
> +	.name =3D "port@",
> +	.parent =3D &ports,
> +};
> +
> +/*
> + * Remote endpoint AMD ISP node definition. No properties defined for
> + * remote endpoint node for OV05C10.
> + */
> +static const struct software_node remote_ep_isp_node =3D {
> +	.name =3D AMDISP_OV05C10_REMOTE_EP_NAME,
> +};
> +
> +/*
> + * Remote endpoint reference for isp node included in the
> + * OV05C10 endpoint.
> + */
> +static const struct software_node_ref_args ov05c10_refs[] =3D {
> +	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> +};
> +
> +/* OV05C supports one single link frequency */
> +static const u64 ov05c10_link_freqs[] =3D {
> +	925 * HZ_PER_MHZ,
> +};
> +
> +/* OV05C supports only 2-lane configuration */
> +static const u32 ov05c10_data_lanes[] =3D {
> +	1,
> +	2,
> +};
> +
> +/* OV05C10 endpoint node properties table */
> +static const struct property_entry ov05c10_endpoint_props[] =3D {
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
> +static const struct software_node endpoint_node =3D {
> +	.name =3D "endpoint",
> +	.parent =3D &port_node,
> +	.properties =3D ov05c10_endpoint_props,
> +};
> +
> +/*
> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
> + * fixed to align with the structure that v4l2 expects for successful
> + * endpoint fwnode parsing.
> + *
> + * It is only the node property_entries that will vary for each platfor=
m
> + * supporting different sensor modules.
> + */
> +#define NUM_SW_NODES 5
> +
> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] =3D =
{
> +	&camera_node,
> +	&ports,
> +	&port_node,
> +	&endpoint_node,
> +	&remote_ep_isp_node,
> +	NULL
> +};
> +
> +/* OV05C10 specific AMD ISP platform configuration */
> +static const struct amdisp_platform amdisp_ov05c10_platform_config =3D =
{
> +	.name =3D AMDISP_OV05C10_PLAT_NAME,
> +	.board_info =3D {
> +		.dev_name =3D "ov05c10",
> +		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
> +	},
> +	.i2c_addr =3D AMDISP_OV05C10_I2C_ADDR,
> +	.max_num_swnodes =3D NUM_SW_NODES,
> +	.swnodes =3D ov05c10_nodes,
> +};
> +
> +static const struct acpi_device_id amdisp_sensor_ids[] =3D {
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
> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10,=
 struct i2c_adapter *adap)
> +{
> +	struct i2c_board_info *info =3D &ov05c10->board_info;
> +	struct i2c_client *i2c_dev;
> +
> +	if (ov05c10->i2c_dev)
> +		return;
> +
> +	if (!info->addr) {
> +		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", ov05c10->i2c_=
addr);
> +		return;
> +	}
> +
> +	i2c_dev =3D i2c_new_client_device(adap, info);
> +	if (!i2c_client_has_driver(i2c_dev)) {

Hi,

i think you meant to use IS_ERR() here instead of i2c_client_has_driver().

> +		dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev=
);
> +		return;
> +	}
> +	ov05c10->i2c_dev =3D i2c_dev;
> +}
> +
> +static int isp_i2c_bus_notify(struct notifier_block *nb,
> +			      unsigned long action, void *data)
> +{
> +	struct amdisp_platform *ov05c10 =3D container_of(nb, struct amdisp_pla=
tform, i2c_nb);
> +	struct device *dev =3D data;
> +	struct i2c_client *client;
> +	struct i2c_adapter *adap;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		adap =3D i2c_verify_adapter(dev);
> +		if (!adap)
> +			break;
> +		if (is_isp_i2c_adapter(adap))
> +			instantiate_isp_i2c_client(ov05c10, adap);
> +		break;
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +		client =3D i2c_verify_client(dev);
> +		if (!client)
> +			break;
> +		if (ov05c10->i2c_dev =3D=3D client) {
> +			dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +			ov05c10->i2c_dev =3D NULL;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct amdisp_platform *prepare_amdisp_platform(const struct amd=
isp_platform *src)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	const struct software_node **sw_nodes;
> +	struct i2c_board_info *info;
> +	int ret;
> +
> +	isp_ov05c10 =3D kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);

Please allocate a fresh instance of amd_platform using devm_kzalloc() and =
perform the initialization
there. Using kmemdup() means that we waste memory by having a useless stru=
ct amd_platform in memory.

Thanks,
Armin Wolf

> +
> +	info =3D &isp_ov05c10->board_info;
> +
> +	sw_nodes =3D (const struct software_node **)src->swnodes;
> +	ret =3D software_node_register_node_group(sw_nodes);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	info->swnode =3D src->swnodes[0];
> +
> +	return isp_ov05c10;
> +
> +error_free_platform:
> +	kfree(isp_ov05c10);
> +	return ERR_PTR(ret);
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10;
> +	int ret;
> +
> +	ov05c10 =3D prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
> +	if (IS_ERR(ov05c10))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
> +				     "failed to prepare AMD ISP platform fwnode\n");
> +
> +	ov05c10->i2c_nb.notifier_call =3D isp_i2c_bus_notify;
> +	ret =3D bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	platform_set_drvdata(pdev, ov05c10);
> +	return 0;
> +
> +error_free_platform:
> +	kfree(ov05c10);
> +	return ret;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10 =3D platform_get_drvdata(pdev);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	i2c_unregister_device(ov05c10->i2c_dev);
> +	software_node_unregister_node_group(ov05c10->swnodes);
> +	kfree(ov05c10);
> +}
> +
> +static struct platform_driver amd_isp_platform_driver =3D {
> +	.driver	=3D {
> +		.name			=3D AMD_ISP_PLAT_DRV_NAME,
> +		.acpi_match_table	=3D amdisp_sensor_ids,
> +	},
> +	.probe	=3D amd_isp_probe,
> +	.remove	=3D amd_isp_remove,
> +};
> +
> +module_platform_driver(amd_isp_platform_driver);
> +
> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
> +MODULE_LICENSE("GPL");
