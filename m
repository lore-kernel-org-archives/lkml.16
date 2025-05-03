Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE8B143895
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746283221; cv=none; b=jpJSKaPq9KxLA984xDqG3nTWiSdkFSPlZ3CQkQPSLdj5pNAdmLviU3zTisSThfYbguwpyLBJPTPS8wJOTt9Vtjk/tFV1Sk3RP5nTyQzm/eDwMOeco5krYHE64DjuxgjkIpx3Z/A//k1wQ35EiAeGtk+044r+x69DFxtbbFrFoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746283221; c=relaxed/simple;
	bh=2SGmPxc8OXDu6vuQvPrf+siPubdvuqhV6dyqhh5pGAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaG/OBEGyhj7bQ7X1VgVZ5BdIqYg5OHwwAL1g64os7FT0KKuz/Cwpky+foFWZdEixmvUJftFsT34HE7eTyuVDnoPgJei22JZQAEqdwAzi1oVSv/UNnwsbe654/yJe8TKRrFJNThNudvNOUyVpOd6Gt/8ChUXxTFKPscqcpWLdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eqvBaJil; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eqvBaJil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746283217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDwBV6OXFyS5FZUPC7dpKMGhnIUoAd0ClRRWeFrUBGQ=;
	b=eqvBaJilHCoomfddTw5EbvOE7QRXvNQ0XDTgFlJnII/oN1TLFgo07CgTT7ooSmeZOpbbfU
	FFOI4h7NPzfP4NakzONQD6ofBzcAOys9UCXdMGmzl/5d2ZERQpBuSfa7lYivJOT40RjC28
	f+zdc3G411KU1m6M9Kxe8gE9h2VWPkI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-dziLG2WbNBmQpx5tDMNLwQ-1; Sat, 03 May 2025 10:40:16 -0400
X-MC-Unique: dziLG2WbNBmQpx5tDMNLwQ-1
X-Mimecast-MFC-AGG-ID: dziLG2WbNBmQpx5tDMNLwQ_1746283215
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac6ef2d1b7dso286273566b.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 07:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746283215; x=1746888015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDwBV6OXFyS5FZUPC7dpKMGhnIUoAd0ClRRWeFrUBGQ=;
        b=p2bb/l5p21p4rlLG88jR/yPyZSQ6fXoT8d/IkFAXrk+YNvk8hdB7OWo94HAKQ853pW
         Kcg7vkxtnWSWOnvmCqaMu9Eb2QRvEJg1J+EUERe0FWna2xWqhBgng/YvMAy31G9XtIFr
         1TA5SddLPxCzfDGCto4llCyx/JROPAlUmM5NKGH7zs6Lm+r4j9vCmdGQXMoB3HdoRylk
         UuSd+FyWVyTNWpHdFlIdzWGdIBTX7T3E+GCbrPVhqGNAVLvd0oBwrXgP7QFRxar9m+SB
         Bk30OVvkEK1HGn5Iyn8vN6QopnxMwEcd8mTFT2s/5Di1mjJxX+Z0FESuBG02fqmInrr5
         qgpA==
X-Forwarded-Encrypted: i=1; AJvYcCVUrHn/UEwbMTQ75XykB3b6OFPjqrH28TQFUSIIw5eSSe9ypHKHparQygfnhURIjgy8OIqGr9i7Dr9se40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwavedo4DdMWjJTpXXr3qSzyYvFEosyaJM95rUNYpX2e/GUZwc
	5NVXRt3Uhi6Ho956H3+upSl7GvqPtdcrdj0OLKNvA+RW7O5/92clJjluXQkcY+tmnhNOkd+BPWz
	fB6MkurHsmU1esIZvvtVpp+jx7EX6mPzt542NhAdhIwLB8s0En1TFah6SRPZfpA==
X-Gm-Gg: ASbGncsaY0XgOUqCOIz5mXsrYIDjEIaMCB7lgFFiQZ3ppAJ/poYPgeO3q/pWZVRFMFV
	l1zxSL5Ubxn/0mc09p6qktWH45W6hy6VdJlypaYEhQJOJlrShS7036SjLSEjTJXBeXDlCA63+fw
	aITdCeJ/4JzmEy5Oe+9f76kIq1fqTdookz9WN4uowXh1LCz7NwTzWpc1wshko/KWD+MZq1Nbky0
	nRqj1Je+zh/Ch99eTUGbYw59hepGb1T7tEaBidpZJraMtOlEOyTMGO77EvSlEHVGQ7Zwl+k+08J
	EH9vxvE4BlkaeLn+BuddUr3pSEsJZVRrdsDsdCoEk2svURgskop41TKT/1J47mDeQeIHuLnrVK0
	59rMEncx6iBiwHmC8FGqS5/AAjIp99345r6mttfBBT3V8OvaLdixN96tcQh+bLA==
X-Received: by 2002:a17:907:7f8b:b0:ace:9d31:d4b5 with SMTP id a640c23a62f3a-ad1a48bc604mr122720066b.12.1746283214934;
        Sat, 03 May 2025 07:40:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcLt2z7qlUsevuvpzDh9OQ5UbFPLKPbGlQAF2LB8Wj/jhU3Qge+5mZ7KhIO+rQuSZW2qWg+w==
X-Received: by 2002:a17:907:7f8b:b0:ace:9d31:d4b5 with SMTP id a640c23a62f3a-ad1a48bc604mr122718366b.12.1746283214511;
        Sat, 03 May 2025 07:40:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3d01sm202924066b.62.2025.05.03.07.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 07:40:13 -0700 (PDT)
Message-ID: <599f5f0a-0aa7-4973-a16f-bb88889859fb@redhat.com>
Date: Sat, 3 May 2025 16:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, W_Armin@gmx.de,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250503002448.3753937-1-pratap.nirujogi@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250503002448.3753937-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Pratap,

On 3-May-25 2:24 AM, Pratap Nirujogi wrote:
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

Thank you for writing a new driver using the new approach
we discussed a while ago.

Also thanks to everyone else involved for all the reviews.

Overall this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> ---
> Changes v9 -> v10:
> 
> * Remove i2c_board_info->addr check in instantiate_isp_i2c_client().
> * Update mutex protection regions as suggested in the review feedback.
> * Switch to devm_mutex_init() and skip mutex_destroy calls.
> 
>  drivers/platform/x86/amd/Kconfig    |  11 ++
>  drivers/platform/x86/amd/Makefile   |   1 +
>  drivers/platform/x86/amd/amd_isp4.c | 277 ++++++++++++++++++++++++++++
>  3 files changed, 289 insertions(+)
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
> +	devm_mutex_init(dev, &isp_ov05c10->lock);
> +	isp_ov05c10->board_info.dev_name = "ov05c10";
> +	strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
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

