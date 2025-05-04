Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE4233E7;
	Sun,  4 May 2025 02:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746324696; cv=none; b=JBDOnB3sgfdqGbFfYAwxnOajFlksuU/Sq1yJnWdjEoCI9vs74UGbEtKDekdikS0OogVK52VmLimP1kafXWfs7fRaBIDGAVQJ+KQUmqO/DOOhzHvgT+Dl+oQstYB+swmnLSs3pCUE7msTjrkmD/jV8BRcaEhJiqBRPizeQf20ayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746324696; c=relaxed/simple;
	bh=rP7ZaULZ8dw3cDdxNiWGLBzpnBtXryMiqg7avkZ4nsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itzcgHWM7Awz1XRATZ0Nba8PoJtcoogAxvfRZWzfKtIBltHvDlM+4W+kkpFAzapNOWhPZu6tULQYwIFvVrYq1OoKKdihyh5pTUxgz8+IV5dj4EQZcyzfjepUXyAOOtY7LiwcO3cwJ3v7T2z0uRMPP2Psyy9O9J318YVl/xADHDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FsSvkXHl; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FsSvkXHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746324684; x=1746929484; i=w_armin@gmx.de;
	bh=HYdrFLaX2JRl1WWxsnw2rdzRTapFF52eFctfYhWjKJE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FsSvkXHllB2U8lvIGAzZnNiJenBd31OJT0MAiWG0FU4VyDQeRxazRZp/BALDMZ0h
	 0nE2ePPMrLmmY/diI236/H1pDVjjoBMXRyTfbkVdX5s5N2uqkqJic93JKJaXSzDNv
	 ycP6muIG6lcKXRo7AmNYrcUqjp1oHDoeaAYPICvr+ftQBLvCzlp0hywlayWAC3Ccg
	 3HqJkE3X4t5LJCOYH/6XtMFZm9NDVc5CK6z+AsCiU9+PU7CKeNwncbwFYn4IYlwrm
	 TiPG5TiVzWDDa/c9m4OxkVbhnBKkWtDxgq8X2c30n8Mpi5HQ26t4BXUvDtzfJ4Xky
	 8tLKDOZLdX5t+MlckA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1ucqm00aaa-00Sa0z; Sun, 04
 May 2025 04:11:24 +0200
Message-ID: <2d640cdf-0347-4283-a5b1-880f6b7e1f85@gmx.de>
Date: Sun, 4 May 2025 04:11:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250503002448.3753937-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250503002448.3753937-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3FuNMU6jbbl5LpXmIt6QObM50KijcXpZxgJIr/SzxppFJ02/XLC
 En7vNhGR/ZfE1RztRif40yfipskzrEvzetdQVk1oUyuXJU0uTtYejnaCIpXO+5xyGzzGWpe
 XE+JK+rn4iJcCnnnVZ4KmYDHkyOylnkQFcX6fXPzjeMvu221s/V6aDxaMLOI/qJdY/bcosq
 bD8yVMGQTuplSpRNyl1Dg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QuwXcvBsgEM=;hqo3Bt4WgxGZjyhsUW9q6J7dagW
 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

Am 03.05.25 um 02:24 schrieb Pratap Nirujogi:

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
> Changes v9 -> v10:
>
> * Remove i2c_board_info->addr check in instantiate_isp_i2c_client().
> * Update mutex protection regions as suggested in the review feedback.
> * Switch to devm_mutex_init() and skip mutex_destroy calls.
>
>   drivers/platform/x86/amd/Kconfig    |  11 ++
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 277 ++++++++++++++++++++++++++++
>   3 files changed, 289 insertions(+)
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
> index 000000000000..336ac3da2041
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,277 @@
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
> +	guard(mutex)(&ov05c10->lock);
> +
> +	if (ov05c10->i2c_dev)
> +		return;
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
> +
> +		scoped_guard(mutex, &ov05c10->lock) {
> +			if (ov05c10->i2c_dev =3D=3D client) {
> +				dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +				ov05c10->i2c_dev =3D NULL;
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
> +	devm_mutex_init(dev, &isp_ov05c10->lock);

Hi,

you should check the return value of devm_mutex_init().

With that being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
