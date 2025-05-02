Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54F42A8B;
	Fri,  2 May 2025 02:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746154235; cv=none; b=ib+hFiMFgyH2xyoRGnSXTxW9BsH7uIBMd+pDZ+nf6pW5SMbjH5NaqA7NniSsi6km2FEwLs2lVgZdbpK2NzglgW6wSv1KWrBhUznyssiXR3jDsEyuKW9xd/gyoviURwBZS5UqNoC6N9b8i0Qwuewsj+QjijSlSw+KRR7IepuawEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746154235; c=relaxed/simple;
	bh=EdpMPdtrrTc/4nvG+l9BYzTsQ+gM1acO/neBN9sWIt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ucgnOfM9h/yoemSLmQK/fJmTcV3NuuncWzhKxCSPiHbigMcoyyAW4xOgG2rUdGvuf8c69vyzeptX9JZCdCirBZkElleq9MDk9Z8VQpQF4Jl8ywhh5o1yQNTpGWt5Z+as8mB3rCopCoEJJ8k+XOwo4t61bDx5HLZpir/968iiGBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XdXYeFgE; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XdXYeFgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746154231; x=1746759031; i=w_armin@gmx.de;
	bh=9/aXeF5MrorMJ6EHdwnrwRF0tu3a8B0wZ+HkmNiwEUk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XdXYeFgEfhIvMUvO7kdDgyq+oLkLJ/LEifyhXtfIIgVa9Vjufx5N1pStUnqFZgWU
	 +YBPOLY19lfbMvkr50JGdfaYFZdnj+adDwj0a58x7nYdhJBE9Mp3S+QJpU+nbz7qD
	 hsFEC7q/u4RbPsbDUg65Vtio2lPxXTIuO8DoNehxyLMRzZ8m/aX+eZ5mmkCH7rwLx
	 8lVIEIkqPQTNglku1y91t/il3wjpKOl7oSSdjYA4vSzdxKrmhXdqFvc774hulI+1n
	 Sjb8tqMfi5D5Z0DpDqjCGbA6EyqVPmLCaSCY+A0hRUwMvDmhjcTioumjHtw+ih1pc
	 Dwr5mJI1xOTDr4cqbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1uoulo2rWk-00gQ0W; Fri, 02
 May 2025 04:50:30 +0200
Message-ID: <19b7809a-db43-4134-bd81-2ace25907035@gmx.de>
Date: Fri, 2 May 2025 04:50:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250430171429.1043759-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250430171429.1043759-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dOEkIOOFhIKaWRgmvTrB8EhD/LXSVVJDpkqEqzZ9fw3Cl+Yua/Y
 udHjuimdXV0lDZLHGdqe2gqiJG1Cafuw9YHKosIzfFnVCdhQ157GSEQVy+Pp3M4gMJQJVKK
 CsxfkbOYUSYfHWIniXUeSKLsAIbvSrD6GDMhVyMchZmp5XUPQpLuNzuAnb1n6lf1v/t/7mQ
 +CT7r1MWTDc3rc/SI81UA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Xi8f5ZjegrA=;5AEnrv/DpqOTlkYXqutFjI4E2OS
 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

Am 30.04.25 um 19:11 schrieb Pratap Nirujogi:

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
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
> Changes v7 -> v8:
>
> * Create I2C client instance incase AMD ISP I2C device is registered
> prior to bus notifier registration.
> * Remove unused and duplicate variables in 'struct amdisp_platform'.
> * Remove global variable 'struct amdisp_platform amdisp_ov05c10_platform=
_config'.
> * Remove dependency on CONFIG_AMD_ISP4.
> * Call software_node_unregister_node_group() incase of amd_isp_probe() f=
ailures
> after prepare_amdisp_platform().
>
>   drivers/platform/x86/amd/Kconfig    |  11 ++
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 275 ++++++++++++++++++++++++++++
>   3 files changed, 287 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig
> index c3e086ea64fc..152a68a470e8 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>  =20
>   	  This mechanism will only be activated on platforms that advertise a
>   	  need for it.
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
> index 000000000000..6164915d8426
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,275 @@
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

Since this function can be called by the bus notifier and i2c_for_each_dev=
() you need to protect
the i2c client registration and the assignment of ov05c10->i2c_dev with a =
mutex.

Thanks,
Armin Wolf

> +
> +	if (!info->addr) {
> +		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", info->addr);
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
> +}
> +
> +static struct amdisp_platform *prepare_amdisp_platform(struct device *d=
ev)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	int ret;
> +
> +	isp_ov05c10 =3D devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);
> +
> +	isp_ov05c10->board_info.dev_name =3D "ov05c10";
> +	strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
> +	isp_ov05c10->board_info.addr =3D AMDISP_OV05C10_I2C_ADDR;
> +
> +	ret =3D software_node_register_node_group(ov05c10_nodes);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	isp_ov05c10->board_info.swnode =3D ov05c10_nodes[0];
> +
> +	return isp_ov05c10;
> +}
> +
> +static int try_to_instantiate_i2c_client(struct device *dev, void *data=
)
> +{
> +	struct amdisp_platform *ov05c10 =3D (struct amdisp_platform *)data;
> +	struct i2c_adapter *adap =3D i2c_verify_adapter(dev);
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
> +	ov05c10 =3D prepare_amdisp_platform(&pdev->dev);
> +	if (IS_ERR(ov05c10))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
> +				     "failed to prepare AMD ISP platform fwnode\n");
> +
> +	ov05c10->i2c_nb.notifier_call =3D isp_i2c_bus_notify;
> +	ret =3D bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	if (ret)
> +		goto error_unregister_sw_node;
> +
> +	/* check if adapter is already registered and create i2c client instan=
ce */
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
> +	struct amdisp_platform *ov05c10 =3D platform_get_drvdata(pdev);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> +	i2c_unregister_device(ov05c10->i2c_dev);
> +	software_node_unregister_node_group(ov05c10_nodes);
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
