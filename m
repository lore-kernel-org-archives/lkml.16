Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BB720CCF5;
	Fri,  2 May 2025 21:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746220510; cv=none; b=QvyVVCqpR0TYbXzHCgx0fxGKyQCELXU7qFaTw3r9rzmzk3aphDqB9l1WR/MpgWcerX4eTHnxKL4c3NEQe7JYG/M+68qNhyVBZUkqO7+rOZHtlS4nQWP6HZojoso4sc6D0RuqrdGpwWvH6wjMhdsfJLApnP/Qfy/ENucc9QLB+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746220510; c=relaxed/simple;
	bh=nJt2sbeF+c2I+32uKh0EWxWClJRIkk1YbflEtzn9R+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPQ0lOkUg2SqxPoS5JhsD70TkpVU/sCE7HFIH4uT7ni2kW82MENqD77bmoxrk5sk+nHRQPUuMnEkdHIrjb1c0NCsxP9s1f7CbKx1Xw7SMkSHTNFB64YlICEJT3+Q4MHex3Hvl2wJiEZODSo4dB5HZg/q+tn6kz88VQk0q6n2kK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LKeDQU4I; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LKeDQU4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746220501; x=1746825301; i=w_armin@gmx.de;
	bh=7J0Wf16ID19YiLXp20+2ln7SAH2jWH9a70iyU6KlJlE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LKeDQU4IQt+1XoCcmIWwXIvFjzsYxa/g7zJ84GBl1gbiIObCKMACZWnNy2JpvVkW
	 Isi6evSF0RHRtZBXkDgrI9KB14OAhegYZkfrHix/rguTnRmVpCaaok1qwtwhoCuY9
	 vnBBbgJlZhzKBCKKgHY8bPeE00h2M3E6xwggwL7Z/LciG5VqFlQvrZMzIOnSYFmC2
	 X7pY71g7iUDbxOscIiD5LC+uXk0iE9qcKY2h8WwczfoLMVlRIiOLqICFxSOumr8zW
	 Kv3LvlYQScsxkvgSVQdSvhQJHReC5dvlz5v5GlK2sRaIzZjjvvHjzGssFfclCc8hK
	 tCRkd8phoaOeZu019g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1v3cXi2QEI-00sFcw; Fri, 02
 May 2025 23:15:00 +0200
Message-ID: <f2909e89-fcc1-467d-a2a5-ea8942b755c4@gmx.de>
Date: Fri, 2 May 2025 23:14:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250502184736.2507703-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250502184736.2507703-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q/K+NSZUMwSAaplapL2281CCSxpehTqk2gas7Jqu3rpVhtgk5Zr
 XAqsK9Iq5TWiXFMRDNiwUabbzolK/4y4Mx41KtrGi4LZkvOXoWwLi5dGUtTIlbsf/YJ1pxa
 yWkU8B9xckCLi/LhD8EAmmCGY5pXqXFjw1XGhZ4ViBpp47KC3N952+Ydp661/UHXwR/oJMo
 tEAmZMymwqwn64ZjbYppg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:06EG70j+/e0=;sXhc2an4xUcoTNBwPBIICREAzRr
 +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

Am 02.05.25 um 20:46 schrieb Pratap Nirujogi:

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
> Changes v8 -> v9:
>
> * Add mutex protection in instantiate_isp_i2c_client()
>
>   drivers/platform/x86/amd/Kconfig    |  11 ++
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 283 ++++++++++++++++++++++++++++
>   3 files changed, 295 insertions(+)
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
> index 000000000000..312a92f60dcc
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,283 @@
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
> +	if (ov05c10->i2c_dev)
> +		return;
> +
> +	if (!info->addr) {
> +		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", info->addr);

I just noticed: could it be that info->addr is static? In this case this c=
heck would be pointless.

> +		return;
> +	}
> +
> +	guard(mutex)(&ov05c10->lock);

You need to guard the check of ov05c10->i2c_dev too since another thread m=
ight already have assigned i2c_dev
after you checked it. In this case you would leak the first value assigned=
 to i2c_dev.

Please move the guard above the check.

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

You need to guard that too, including the check.

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
> +	mutex_init(&isp_ov05c10->lock);

Please use devm_mutex_init().

Thanks,
Armin Wolf

> +	isp_ov05c10->board_info.dev_name =3D "ov05c10";
> +	strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
> +	isp_ov05c10->board_info.addr =3D AMDISP_OV05C10_I2C_ADDR;
> +
> +	ret =3D software_node_register_node_group(ov05c10_nodes);
> +	if (ret) {
> +		mutex_destroy(&isp_ov05c10->lock);
> +		return ERR_PTR(ret);
> +	}
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
> +	mutex_destroy(&ov05c10->lock);
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
> +	mutex_destroy(&ov05c10->lock);
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
