Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297A4126C02;
	Tue, 29 Apr 2025 20:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959975; cv=none; b=QmP6iE805f4xdPP7T4zr4dEMlqetNgkTacUxmOh2zShmG4d+m0MWxZ91sWsA1v6XuEt7Bp6TLFC7Rc3WP0XsbqT0Wo01wHtdyzFPiCB8eEyedmU+G3n8hpQWEC4MXFkAi/ZCPlHRlXzlVrXBScY38k7McJBFrk4GBNy9EWBc4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959975; c=relaxed/simple;
	bh=hbksV0AJM5E/Wu1rnE8NF4NL2B0IluKCnOTRkIKqnJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKCHon0y9+8LAOm1kv3zrQHCLbZhx5U2UOifxWEJwb391wgjAqa/BYbW7tD/GK5vh+8dbCLr3CgaP0xcW4x8/PE5VbTBIWlda95Y80m4AWYfjKYehlTOSO3gVrQ7vwJPzCVoif7M/ThwqIAHTa5dkhW4J5LgdfUi5jdJRhFkCOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uX+aLaC1; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uX+aLaC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745959961; x=1746564761; i=w_armin@gmx.de;
	bh=hbksV0AJM5E/Wu1rnE8NF4NL2B0IluKCnOTRkIKqnJA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uX+aLaC1N3E2oNl9C3muBmJ3VO/MplqUwyxSRo9wTiWNgDLg352tv37jscy2+odG
	 nNFlgfvML8BqC35B1UvzvnKAILYdBzuSQsboKOGu45MHhkqu1tX2tzxfg67V5HzqA
	 +ucUccTWihMjXDxo9m3IseJ4XGtdrx+cGFEa7OO7opye3Kwf6gfZ955B8DNVo9Ssp
	 /N5Orr1SSYrawT69Nm3xmLYWhLzvtiXPTCeynlNyQ93Dzx33nd6H/4T3VC8L66AyF
	 +XmOahzweK7TR6wWRN8clHbfTLFXl8RZ0rt2D0xOSSYhlqnElnllbE2YGQySD4FcM
	 r9a77onIxEVFyqzLLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp9Y-1uZAjE4B5w-00NFWc; Tue, 29
 Apr 2025 22:52:41 +0200
Message-ID: <815f1029-fc0c-4211-ab47-c9ca985f52f1@gmx.de>
Date: Tue, 29 Apr 2025 22:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] platform/x86: Add AMD ISP platform config for OV05C10
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
 <b6701589-4aa9-4988-8b28-4b0ae60daa43@gmx.de>
 <7d17ec49-e075-4b04-ab00-3eeabf58c4f2@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7d17ec49-e075-4b04-ab00-3eeabf58c4f2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C4zzU7Z3x0znQ+pxmDXAJRzBAHBfqQEj0a2nkHMmpW3tbArOmiM
 tk4qrQ0lw/Y2HYpHn/MDV8Hxb9BXLoyrJ22c6llqCX4RYbrpA4IRFheCU/llYLPIPoff8O3
 KAcREO+23YzQ4Gz+DAQei/pu93oefZVzqXTLRqJq+4t61DcjXEEGRz6THgkFk2jQhGqp6Te
 HIXFTplbQUqaGP936MFnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UWynnNXefjc=;r97hWM2F/n0zHBKYVXxSwEPKdiL
 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

Am 29.04.25 um 20:33 schrieb Nirujogi, Pratap:

> Hi Armin,
>
> On 4/26/2025 8:25 PM, Armin Wolf wrote:
>> Caution: This message originated from an External Source. Use proper=20
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Am 17.04.25 um 20:28 schrieb Pratap Nirujogi:
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
>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>> ---
>>> Changes v6 -> v7:
>>>
>>> * Use devm_kzalloc() inplace of kmemdup()
>>> * Use IS_ERR() inplace of i2c_client_has_driver()
>>> * Remove the extra cast
>>>
>>> =C2=A0 drivers/platform/x86/amd/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +=
+
>>> =C2=A0 drivers/platform/x86/amd/Makefile=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 drivers/platform/x86/amd/amd_isp4.c | 269=20
>>> ++++++++++++++++++++++++++++
>>> =C2=A0 3 files changed, 281 insertions(+)
>>> =C2=A0 create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>>
>>> diff --git a/drivers/platform/x86/amd/Kconfig=20
>>> b/drivers/platform/x86/ amd/Kconfig
>>> index c3e086ea64fc..ec755b5fc93c 100644
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
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 depends on I2C && X86_64 && ACPI && AMD_ISP4
>>
>> Hi,
>>
>> just a question: when will the CONFIG_AMD_ISP4 symbol be introduced?
>>
> CONFIG_AMD_ISP4 will be introduced in the V4L2 ISP driver patches. We=20
> are working on isp driver patches and planning to submit once the=20
> review for x86/platform and sensor driver patches completes.

Alright.

>
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
>>> index 000000000000..461a10be5ccd
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>> @@ -0,0 +1,269 @@
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
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const char *name;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 u8 i2c_addr;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 u8 max_num_swnodes;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_board_info board_info;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct notifier_block i2c_nb;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_client *i2c_dev;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct software_node **swnodes;
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
>>> +/* OV05C10 specific AMD ISP platform configuration */
>>> +static const struct amdisp_platform amdisp_ov05c10_platform_config =
=3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D AMDISP_OV05C10_PLAT_NAME,
>>
>> Where is this field being used?
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .board_info =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .dev_name =3D "ov05c10",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .i2c_addr =3D AMDISP_OV05C10_I2C_ADDR,
>>
>> Please reuse board_info->addr.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .max_num_swnodes =3D NUM_SW_NODES,
>>
>> Where is max_num_swnodes being used?
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 .swnodes =3D ov05c10_nodes,
>>
>> Why not drop .swnodes and referencing ov05c10_nodes directly?
>>
> Thanks. Some of the variables phased out with the ongoing development=20
> and patching. I will take care of removing the unused and redudant=20
> variables in 'struct amdisp_platform'.
>
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
>>> detected\n", ov05c10->i2c_addr);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
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
>>
>> You still need to handle the situation where the AMD I2C adapter is=20
>> already registered when
>> registering the bus notifier. In this case you will miss the=20
>> BUS_NOTIFY_ADD_DEVICE event.
>>
> Thanks. I will cover this case using the below sequence.
>
> 1. bus_register_notifier()
> 2. i2c_for_each_dev()
>
> If at all i2c adapter is registered by the time=20
> bus_register_notifier() is called, it should be detected in=20
> i2c_for_each_dev(). I will add checks to avoid creation of duplicate=20
> i2c_client devices when both notifier callback and i2c_for_each_dev()=20
> passes especially when i2c adapter gets added between 1 and 2.
>
> Please suggest if there is an alternate better approach that I should=20
> use to handle this case.
>
This approach seems good to me, i2c-dev uses something similar.

Thanks,
Armin Wolf

>>> +}
>>> +
>>> +static struct amdisp_platform *prepare_amdisp_platform(struct=20
>>> device *dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 const struct=20
>>> amdisp_platform *src)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct amdisp_platform *isp_ov05c10;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_board_info *info;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 isp_ov05c10 =3D devm_kzalloc(dev, sizeof(*is=
p_ov05c10),=20
>>> GFP_KERNEL);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!isp_ov05c10)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ERR_PTR(-ENOMEM);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(isp_ov05c10, src, sizeof(*isp_ov05c10=
));
>>
>> This is not what i meant. I was complaining that=20
>> amdisp_ov05c10_platform_config contains both
>> static data (swnodes) and data assigned during runtime (board_info-=20
>> =C2=A0>swnode, i2c_dev, ...).
>>
>> Please do not use a global instance of struct amdisp_platform for=20
>> initialization. Instead initialize a
>> fresh instance of this struct inside prepare_amdisp_platform().
>>
> sure, will remove the global variable=20
> 'amdisp_ov05c10_platform_config', and will take care of initializing=20
> the amdisp_platform instance in the prepare_amdisp_platform().
>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 info =3D &isp_ov05c10->board_info;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D software_node_register_node_group(sr=
c->swnodes);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ERR_PTR(ret);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 info->swnode =3D src->swnodes[0];
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return isp_ov05c10;
>>> +}
>>> +
>>> +static int amd_isp_probe(struct platform_device *pdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct amdisp_platform *ov05c10;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ov05c10 =3D prepare_amdisp_platform(&pdev->d=
ev,=20
>>> &amdisp_ov05c10_platform_config);
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
=A0 return ret;
>>
>> You need to call software_node_unregister_node_group() here when=20
>> bus_register_notifier() fails.
>>
> Thanks. I will fix this in the next V8 patch.
>
>> Thanks,
>> Armin Wolf>
> Thanks,
> Pratap
>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 platform_set_drvdata(pdev, ov05c10);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
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
>>> + software_node_unregister_node_group(ov05c10->swnodes);
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
>
