Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC20188CB1;
	Sun, 27 Apr 2025 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745713539; cv=none; b=CofKdM0Lm71f5nyr2MgjHT1ns3+gfdpTPOCEcb9m3qODzN/Fix5zWU1vUejfMxUbzS2upqCotthOMdNFfowWgjj8Y3aFhsJRFIpjVsPcOViKmv8Ol/vYJE/ntB/EMqK1iFOD1/c6cyd1YFkMqWEU9vLuj100glCwZZW5FwC7R1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745713539; c=relaxed/simple;
	bh=BBwWu0qAws8Yr2jJeXUz+N5WTPCifHv4wfoYHrN0JQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXWna0VMO5IfhTaVfLe/OjxNWS+haqEF3Cc6EjotNTIs2MQuXosxbwe2Hw5E9uwAi6JNY7at/+4KthA8rcHyWQ+FqJMHhDi7NJM6ZM2AuHtex52yMEJx3GqjQtPccnOf2H72p2N+JjOIbxksy7KpZoE2Dg32w6GA4IJDPJydiKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SZ2GgWt9; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SZ2GgWt9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745713534; x=1746318334; i=w_armin@gmx.de;
	bh=GfztAnkuFaSphIqqNYumDLGz3moZCqdnfmmVDKIba0M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SZ2GgWt9VsEf9FgiSRLBthVot6aoa3cmmtPTvRKRZK8+EdPx3gnqeJ8bqkDgQtGa
	 sa5/BcEJbBHTSalCjtXfnjEcCxrJzfG9SmdNMG+hI40qKsfDPACXKT/Rg7HyQeS1U
	 A638rQbh7KOt+zaG8ys/Ibe5JBeF/2vjhwddy9nn10EyGwNtsqLUmEl27qGWKRUhp
	 8R1Jn2M8bLZ2dGe54ZW2ye18zZhqjh04Dt2RegAfDh/plULsLTE0soazSCYym+xtn
	 m0ON+Ar7AO5erjKGSKUvu/eNrKj6ifTthJkV7re2wOBfkp4x3e1kD9erFHNf9a1gN
	 aloddl1aj4uplSRLcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO6M-1ut6rm0tBo-00ZIAO; Sun, 27
 Apr 2025 02:25:34 +0200
Message-ID: <b6701589-4aa9-4988-8b28-4b0ae60daa43@gmx.de>
Date: Sun, 27 Apr 2025 02:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T/IUNXVIzXrUXwBNpvq+/3SbSmkGMtRvjqPdOEuIemBsTzBeG5M
 bRwzCveFY5YsdCp4+3AzqteWMI5ZEW+eR3hOzA4RGDJAwRyvkTNrOy0zFnw1r/HD1/YwiRt
 FBgyA0cpbSCW/jbqYQ1MYjal6kgkeiASHUSJ07QT+9mZ+gtEuYobc8CaV9XZKDbpJjLbBay
 sYPFQUCjEDXlGAD+F2Ypg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BseB6f9qnAw=;x7+3G+Sspxl0tVUTJmWxcV7aEge
 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
 EjzfzBjOWm1gGzjV6Gz7vk=

Am 17.04.25 um 20:28 schrieb Pratap Nirujogi:

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
> Changes v6 -> v7:
>
> * Use devm_kzalloc() inplace of kmemdup()
> * Use IS_ERR() inplace of i2c_client_has_driver()
> * Remove the extra cast
>
>   drivers/platform/x86/amd/Kconfig    |  11 ++
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 269 ++++++++++++++++++++++++++++
>   3 files changed, 281 insertions(+)
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

Hi,

just a question: when will the CONFIG_AMD_ISP4 symbol be introduced?

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
> index 000000000000..461a10be5ccd
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,269 @@
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

Where is this field being used?

> +	.board_info =3D {
> +		.dev_name =3D "ov05c10",
> +		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
> +	},
> +	.i2c_addr =3D AMDISP_OV05C10_I2C_ADDR,

Please reuse board_info->addr.

> +	.max_num_swnodes =3D NUM_SW_NODES,

Where is max_num_swnodes being used?

> +	.swnodes =3D ov05c10_nodes,

Why not drop .swnodes and referencing ov05c10_nodes directly?

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
> +	if (IS_ERR(i2c_dev)) {
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

You still need to handle the situation where the AMD I2C adapter is alread=
y registered when
registering the bus notifier. In this case you will miss the BUS_NOTIFY_AD=
D_DEVICE event.

> +}
> +
> +static struct amdisp_platform *prepare_amdisp_platform(struct device *d=
ev,
> +						       const struct amdisp_platform *src)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	struct i2c_board_info *info;
> +	int ret;
> +
> +	isp_ov05c10 =3D devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);
> +	memcpy(isp_ov05c10, src, sizeof(*isp_ov05c10));

This is not what i meant. I was complaining that amdisp_ov05c10_platform_c=
onfig contains both
static data (swnodes) and data assigned during runtime (board_info->swnode=
, i2c_dev, ...).

Please do not use a global instance of struct amdisp_platform for initiali=
zation. Instead initialize a
fresh instance of this struct inside prepare_amdisp_platform().

> +
> +	info =3D &isp_ov05c10->board_info;
> +
> +	ret =3D software_node_register_node_group(src->swnodes);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	info->swnode =3D src->swnodes[0];
> +
> +	return isp_ov05c10;
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10;
> +	int ret;
> +
> +	ov05c10 =3D prepare_amdisp_platform(&pdev->dev, &amdisp_ov05c10_platfo=
rm_config);
> +	if (IS_ERR(ov05c10))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
> +				     "failed to prepare AMD ISP platform fwnode\n");
> +
> +	ov05c10->i2c_nb.notifier_call =3D isp_i2c_bus_notify;
> +	ret =3D bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	if (ret)
> +		return ret;

You need to call software_node_unregister_node_group() here when bus_regis=
ter_notifier() fails.

Thanks,
Armin Wolf

> +
> +	platform_set_drvdata(pdev, ov05c10);
> +	return 0;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	struct amdisp_platform *ov05c10 =3D platform_get_drvdata(pdev);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	i2c_unregister_device(ov05c10->i2c_dev);
> +	software_node_unregister_node_group(ov05c10->swnodes);
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
