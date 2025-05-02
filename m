Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECA028F1;
	Fri,  2 May 2025 22:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225102; cv=none; b=Y4aODFlVdqxB2nziqK4jKPEeR/PFJtD9eV7+BOClqGglGnbiR6+9Yn11ot3+JQggzsAIfF1kjFnPxY6IKlIB9oWj2Ee2rpH9p0HWXPIWUrkU8lXSbZZw5coSSAH6Vd009mYMxLXwBee2K8FH8IqOOyQySpCUoFjfBy7CiMqoATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225102; c=relaxed/simple;
	bh=KPZ5CX8rljyZ0wsd3A4RGSD+bhRD4VZc9RstMwtpcrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5thBtnfEvj0EWTOV5dq+aABXbvXFX3KMDzN2Py4dtjq2z3xZkVmOm207XPzjdQK7EyFYSRWT8kWidFdG9mpeHVb5hr0tpSon56zO95IxmPpjt1Q9l3ApmjJvayuPaL7lCD3H8hCc5jEsYPjj8871aMt9tMVR9rKlG8e7UD1rag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NXsg9p1U; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NXsg9p1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746225094; x=1746829894; i=w_armin@gmx.de;
	bh=KPZ5CX8rljyZ0wsd3A4RGSD+bhRD4VZc9RstMwtpcrM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NXsg9p1USoNAM0yCfi3Z6CSdeiVierjDrHxoZCQ1dqT3796Durag2QCzKhR1+RMh
	 EAczuxJkNl9DfB06yYYjbCZ+zXbPnzJ8dtncgs0T28vtdb2CUd4j4X0thXgitLv1E
	 m9HKN06b1DdcriMe1RJ7Iukit+9U6kzkiCPTvZeJqq3TzxIxPZGcxilGkgjWDG+4i
	 adEFfZkzf0RZwhhPh8zp3m+j0DvT8VuIxHBqr8z5Lu5X2s0v4n6ek3AZL1Et/7lJo
	 adjQpj9LHR73Lk33pJoB3rnXsp5xqApmQSjZm4tfqKUNFw+FS17ZsuCD1mw1zeL0y
	 z/jfMObsfk4xAvhGYw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMyZ-1uNqwG3puD-00OnCp; Sat, 03
 May 2025 00:31:34 +0200
Message-ID: <d9b24a50-f92b-4653-98c7-28ed5c5dad46@gmx.de>
Date: Sat, 3 May 2025 00:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] platform/x86: Add AMD ISP platform config for OV05C10
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250502184736.2507703-1-pratap.nirujogi@amd.com>
 <f2909e89-fcc1-467d-a2a5-ea8942b755c4@gmx.de>
 <dc625df0-7053-42c9-b79a-0cfaffc9392c@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <dc625df0-7053-42c9-b79a-0cfaffc9392c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xlH9+dhlbqldcwH9EyIJ6sHar4NCh8y+hw4mpvmiuOvkt6GhmvP
 zq/g0VLrpph41M+QtrynaDz+zxTNrKxDtOdBHpsQ4hnSrrkZRL8h17utEuoD1BFYUOoV9DH
 kNl7N7E4tW8w5tvNZ+1be08wz5NyeDGIgstu0qYVyM41oisbKHJot1dpP6xE0cn8ZjkC+Io
 t3euX9SrTNZhpS8s8u0MQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sjvzF9LL/B4=;4zFQQl1ub/RZvbTvDx4MaLphKzo
 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

> Hi Armin,
>
> On 5/2/2025 5:14 PM, Armin Wolf wrote:
>> Caution: This message originated from an External Source. Use proper=20
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Am 02.05.25 um 20:46 schrieb Pratap Nirujogi:
>>
>>> ISP device specific configuration is not available in ACPI. Add
>>> swnode graph to configure the missing device properties for the
>>> OV05C10 camera device supported on amdisp platform.
>>>
>>> Add support to create i2c-client dynamically when amdisp i2c
>>> adapter is available.
>>>
>>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>> ---
>>> Changes v8 -> v9:
>>>
>>> * Add mutex protection in instantiate_isp_i2c_client()
>>>
>>> =C2=A0 drivers/platform/x86/amd/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +=
+
>>> =C2=A0 drivers/platform/x86/amd/Makefile=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 drivers/platform/x86/amd/amd_isp4.c | 283=20
>>> ++++++++++++++++++++++++++++
>>> =C2=A0 3 files changed, 295 insertions(+)
>>> =C2=A0 create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>>
>>> diff --git a/drivers/platform/x86/amd/Kconfig=20
>>> b/drivers/platform/x86/ amd/Kconfig
>>> index c3e086ea64fc..152a68a470e8 100644
>>> --- a/drivers/platform/x86/amd/Kconfig
>>> +++ b/drivers/platform/x86/amd/Kconfig
>>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This mechanism will only be=
 activated on platforms that=20
>>> advertise a
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 need for it.
>>> +
>>> +config AMD_ISP_PLATFORM
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tristate "AMD ISP4 platform driver"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 depends on I2C && X86_64 && ACPI
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 help
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Platform driver for AMD platform=
s containing image signal=20
>>> processor
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen 4. Provides camera sensor mo=
dule board information to allow
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sensor and V4L drivers to work p=
roperly.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This driver can also be built as=
 a module.=C2=A0 If so, the module
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will be called amd_isp4.
>>> diff --git a/drivers/platform/x86/amd/Makefile=20
>>> b/drivers/platform/x86/ amd/Makefile
>>> index c6c40bdcbded..b0e284b5d497 100644
>>> --- a/drivers/platform/x86/amd/Makefile
>>> +++ b/drivers/platform/x86/amd/Makefile
>>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D pmc/
>>> =C2=A0 obj-$(CONFIG_AMD_HSMP)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D hsmp/
>>> =C2=A0 obj-$(CONFIG_AMD_PMF)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D pmf/
>>> =C2=A0 obj-$(CONFIG_AMD_WBRF)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D wbrf.o
>>> +obj-$(CONFIG_AMD_ISP_PLATFORM)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=
=3D amd_isp4.o
>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/=
=20
>>> x86/amd/amd_isp4.c
>>> new file mode 100644
>>> index 000000000000..312a92f60dcc
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>> @@ -0,0 +1,283 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * AMD ISP platform driver for sensor i2-client instantiation
>>> + *
>>> + * Copyright 2025 Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/property.h>
>>> +#include <linux/units.h>
>>> +
>>> +#define AMDISP_OV05C10_I2C_ADDR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x10
>>> +#define AMDISP_OV05C10_PLAT_NAME "amdisp_ov05c10_platform"
>>> +#define AMDISP_OV05C10_HID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "OMNI5C10"
>>> +#define AMDISP_OV05C10_REMOTE_EP_NAME "ov05c10_isp_4_1_1"
>>> +#define AMD_ISP_PLAT_DRV_NAME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "amd-isp4"
>>> +
>>> +/*
>>> + * AMD ISP platform definition to configure the device properties
>>> + * missing in the ACPI table.
>>> + */
>>> +struct amdisp_platform {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_board_info board_info;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct notifier_block i2c_nb;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_client *i2c_dev;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex lock; /* protects i2c client cr=
eation */
>>> +};
>>> +
>>> +/* Top-level OV05C10 camera node property table */
>>> +static const struct property_entry ov05c10_camera_props[] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 PROPERTY_ENTRY_U32("clock-frequency", 24 * H=
Z_PER_MHZ),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 { }
>>> +};
>>> +
>>> +/* Root AMD ISP OV05C10 camera node definition */
>>> +static const struct software_node camera_node =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D AMDISP_OV05C10_HID,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .properties =3D ov05c10_camera_props,
>>> +};
>>> +
>>> +/*
>>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>>> + * ports node for OV05C10.
>>> + */
>>> +static const struct software_node ports =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "ports",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .parent =3D &camera_node,
>>> +};
>>> +
>>> +/*
>>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>>> + * port node for OV05C10.
>>> + */
>>> +static const struct software_node port_node =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "port@",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .parent =3D &ports,
>>> +};
>>> +
>>> +/*
>>> + * Remote endpoint AMD ISP node definition. No properties defined for
>>> + * remote endpoint node for OV05C10.
>>> + */
>>> +static const struct software_node remote_ep_isp_node =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D AMDISP_OV05C10_REMOTE_EP_NAME,
>>> +};
>>> +
>>> +/*
>>> + * Remote endpoint reference for isp node included in the
>>> + * OV05C10 endpoint.
>>> + */
>>> +static const struct software_node_ref_args ov05c10_refs[] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node)=
,
>>> +};
>>> +
>>> +/* OV05C supports one single link frequency */
>>> +static const u64 ov05c10_link_freqs[] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 925 * HZ_PER_MHZ,
>>> +};
>>> +
>>> +/* OV05C supports only 2-lane configuration */
>>> +static const u32 ov05c10_data_lanes[] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 1,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 2,
>>> +};
>>> +
>>> +/* OV05C10 endpoint node properties table */
>>> +static const struct property_entry ov05c10_endpoint_props[] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 PROPERTY_ENTRY_U32("bus-type", 4),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", o=
v05c10_data_lanes,
>>> + ARRAY_SIZE(ov05c10_data_lanes)),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequenci=
es",=20
>>> ov05c10_link_freqs,
>>> + ARRAY_SIZE(ov05c10_link_freqs)),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", =
ov05c10_refs),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 { }
>>> +};
>>> +
>>> +/* AMD ISP endpoint node definition */
>>> +static const struct software_node endpoint_node =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "endpoint",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .parent =3D &port_node,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .properties =3D ov05c10_endpoint_props,
>>> +};
>>> +
>>> +/*
>>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>>> + * fixed to align with the structure that v4l2 expects for successful
>>> + * endpoint fwnode parsing.
>>> + *
>>> + * It is only the node property_entries that will vary for each=20
>>> platform
>>> + * supporting different sensor modules.
>>> + */
>>> +#define NUM_SW_NODES 5
>>> +
>>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] =
=3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 &camera_node,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 &ports,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 &port_node,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 &endpoint_node,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 &remote_ep_isp_node,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 NULL
>>> +};
>>> +
>>> +static const struct acpi_device_id amdisp_sensor_ids[] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 { AMDISP_OV05C10_HID },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 { }
>>> +};
>>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>> +
>>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return !strcmp(adap->owner->name, "i2c_desig=
nware_amdisp");
>>> +}
>>> +
>>> +static void instantiate_isp_i2c_client(struct amdisp_platform=20
>>> *ov05c10, struct i2c_adapter *adap)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_board_info *info =3D &ov05c10->bo=
ard_info;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_client *i2c_dev;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ov05c10->i2c_dev)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!info->addr) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_err(&adap->dev, "invalid i2c_addr 0x%x=20
>>> detected\n", info->addr);
>>
>> I just noticed: could it be that info->addr is static? In this case=20
>> this check would be pointless.
>>
> I agree this check is not important. I will remove it.
>
> Instead of moving i2c_board_info variable outside 'struct=20
> amdisp_platform' to make it static, I think the existing definition is=
=20
> still valid to use. Its because 'struct amdisp_platform' variable is=20
> passed to notifier_call and i2c_for_each_dev() only after it is=20
> initialized with valid params in prepare_amdisp_platform().
>
> Should I keep the 'struct amdisp_platform' definition as it is and=20
> only remove the check? Please let me know your opinion.

Please just remove this check.

Thanks,
Armin Wolf

>
>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 guard(mutex)(&ov05c10->lock);
>>
>> You need to guard the check of ov05c10->i2c_dev too since another=20
>> thread might already have assigned i2c_dev
>> after you checked it. In this case you would leak the first value=20
>> assigned to i2c_dev.
>>
>> Please move the guard above the check.
>>
> thanks, will move guard above ov05c10->i2c_dev check.
>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev =3D i2c_new_client_device(adap, info=
);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(i2c_dev)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_err(&adap->dev, "error %pe registering isp=20
>>> i2c_client\n", i2c_dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ov05c10->i2c_dev =3D i2c_dev;
>>> +}
>>> +
>>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned long action, void *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct amdisp_platform *ov05c10 =3D containe=
r_of(nb, struct=20
>>> amdisp_platform, i2c_nb);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev =3D data;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_client *client;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_adapter *adap;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 switch (action) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 case BUS_NOTIFY_ADD_DEVICE:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 adap =3D i2c_verify_adapter(dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (!adap)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (is_isp_i2c_adapter(adap))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 instantiate_isp_i2c_cl=
ient(ov05c10, adap);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 case BUS_NOTIFY_REMOVED_DEVICE:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 client =3D i2c_verify_client(dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (!client)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (ov05c10->i2c_dev =3D=3D client) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&client->adapt=
er->dev, "amdisp=20
>>> i2c_client removed\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ov05c10->i2c_dev =3D N=
ULL;
>>
>> You need to guard that too, including the check.
>>
> thanks, will place guard before ov05c10->i2c_dev usage.
>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_DONE;
>>> +}
>>> +
>>> +static struct amdisp_platform *prepare_amdisp_platform(struct=20
>>> device *dev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct amdisp_platform *isp_ov05c10;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 isp_ov05c10 =3D devm_kzalloc(dev, sizeof(*is=
p_ov05c10),=20
>>> GFP_KERNEL);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!isp_ov05c10)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ERR_PTR(-ENOMEM);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 mutex_init(&isp_ov05c10->lock);
>>
>> Please use devm_mutex_init().
>>
> thanks, will switch to devm_mutex_init() and remove the mutex_destroy=20
> calls.
>
> Thanks,
> Pratap
>
>> Thanks,
>> Armin Wolf
>>
>>> + isp_ov05c10->board_info.dev_name =3D "ov05c10";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 strscpy(isp_ov05c10->board_info.type, "ov05c=
10", I2C_NAME_SIZE);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 isp_ov05c10->board_info.addr =3D AMDISP_OV05=
C10_I2C_ADDR;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D software_node_register_node_group(ov=
05c10_nodes);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mutex_destroy(&isp_ov05c10->lock);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ERR_PTR(ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 isp_ov05c10->board_info.swnode =3D ov05c10_n=
odes[0];
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return isp_ov05c10;
>>> +}
>>> +
>>> +static int try_to_instantiate_i2c_client(struct device *dev, void=20
>>> *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct amdisp_platform *ov05c10 =3D (struct =
amdisp_platform *)data;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_adapter *adap =3D i2c_verify_adap=
ter(dev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!ov05c10 || !adap)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!adap->owner)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (is_isp_i2c_adapter(adap))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 instantiate_isp_i2c_client(ov05c10, adap);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static int amd_isp_probe(struct platform_device *pdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct amdisp_platform *ov05c10;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ov05c10 =3D prepare_amdisp_platform(&pdev->d=
ev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(ov05c10))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to prepa=
re AMD ISP=20
>>> platform fwnode\n");
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ov05c10->i2c_nb.notifier_call =3D isp_i2c_bu=
s_notify;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D bus_register_notifier(&i2c_bus_type,=
 &ov05c10->i2c_nb);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto error_unregister_sw_node;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* check if adapter is already registered an=
d create i2c=20
>>> client instance */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 i2c_for_each_dev((void *)ov05c10, try_to_ins=
tantiate_i2c_client);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 platform_set_drvdata(pdev, ov05c10);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +error_unregister_sw_node:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 software_node_unregister_node_group(ov05c10_=
nodes);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 mutex_destroy(&ov05c10->lock);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>>> +
>>> +static void amd_isp_remove(struct platform_device *pdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct amdisp_platform *ov05c10 =3D platform=
_get_drvdata(pdev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 bus_unregister_notifier(&i2c_bus_type, &ov05=
c10->i2c_nb);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 i2c_unregister_device(ov05c10->i2c_dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 software_node_unregister_node_group(ov05c10_=
nodes);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 mutex_destroy(&ov05c10->lock);
>>> +}
>>> +
>>> +static struct platform_driver amd_isp_platform_driver =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .driver =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D AMD_ISP_PLAT_DRV_NAME,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .acpi_match_table=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D amdisp_senso=
r_ids,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .probe=C2=A0 =3D amd_isp_probe,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .remove =3D amd_isp_remove,
>>> +};
>>> +
>>> +module_platform_driver(amd_isp_platform_driver);
>>> +
>>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>>> +MODULE_LICENSE("GPL");
>
