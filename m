Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B565D634;
	Tue, 15 Apr 2025 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744739389; cv=none; b=orb0vOlsPdAhXE5xXMajhQqDBsX9TUAO2h47IGkL+Rw044UZC8b+cJH3nEZSdTz1fSgTGJz4dhDKhNzUZoUj3BmZvAAwRN4ANLCL1HGauzQZ8k7beftB9lv6Okgi5TAewltz78fqtHxGyuAaMkReUV4tzoJSxNzLr1Jd8dlf7o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744739389; c=relaxed/simple;
	bh=rsmEOBPMnJ5iKQufNvUZ5EZDe6TaH17Q2MKd5yt8Zkg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Sasex9/zsoisL+oBwGlYLxRgbKOrVNaJIwfdhHJWKU1KbNx4SScRVZTcggqhUA4z506OM12wUVbpbLPx4tR7v7Pp33GukPeKw7bkDMJa/+/rOiwQpRordz3wwUYKWhZrSTO4quMZ16h9FykKq9LNwq24vMpRpLJx0+qtQep+Gx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eplQV+1v; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eplQV+1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744739387; x=1776275387;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rsmEOBPMnJ5iKQufNvUZ5EZDe6TaH17Q2MKd5yt8Zkg=;
  b=eplQV+1v24UgGEpXKHtlh9w92mT1ab1No9T/qoPHF9hanIu0mFUMwQ0r
   CvV8/5rPtZX0M+ljSXvjfXPp+CdAOctSfuYeJMFuM7qt+zjHZFv3rM91q
   wecgxyj0gYg7fEr6fJUnw5lGOnCahy4HWvDJyeSHprDlMSwjoFL/Mb8h+
   Cy1OrBH9sjVqpaLCUBcWZTB03LzwNUeUI4Tty+vsj93PHzmvdJwpkVdjS
   /Yb+7LHsIU0yAiOH38dbAIK9wt4pmtnVLbpMeuvA59mHIAtEoxxnc/gBU
   cX34SpLukqjWW5/5naIjyqRHLdRlBqFGTFviBlKcI3qZyFERkE4XDJHCd
   Q==;
X-CSE-ConnectionGUID: fAZBYCe1Q3qytNQ/ePk+YQ==
X-CSE-MsgGUID: PSmVMlSLQKS4K9Pa5IBrNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46183488"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46183488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 10:49:46 -0700
X-CSE-ConnectionGUID: tD54hPMPSuqJgWUR+5I16Q==
X-CSE-MsgGUID: LgwSkNPoR2Cr3gNqhXkg/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161152485"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 10:49:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Apr 2025 20:49:38 +0300 (EEST)
To: "Nirujogi, Pratap" <pnirujog@amd.com>
cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v5] platform/x86: Add AMD ISP platform config for
 OV05C10
In-Reply-To: <9eca90b4-af50-4f10-91c7-ea76c4a05906@amd.com>
Message-ID: <4954843f-6e5c-a025-257e-08cc620d34af@linux.intel.com>
References: <20250408203330.801792-1-pratap.nirujogi@amd.com> <128ded89-f8e2-6306-47eb-2275b3f33a6c@linux.intel.com> <9eca90b4-af50-4f10-91c7-ea76c4a05906@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-61244498-1744739378=:942"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-61244498-1744739378=:942
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Apr 2025, Nirujogi, Pratap wrote:

> Hi Ilpo,
>=20
> Thanks for the review feedback.
>=20
> Thanks,
> Pratap
>=20
> On 4/15/2025 11:42 AM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Tue, 8 Apr 2025, Pratap Nirujogi wrote:
> >=20
> > > ISP device specific configuration is not available in ACPI. Add
> > > swnode graph to configure the missing device properties for the
> > > OV05C10 camera device supported on amdisp platform.
> > >=20
> > > Add support to create i2c-client dynamically when amdisp i2c
> > > adapter is available.
> > >=20
> > > Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
> > > Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
> > > Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > ---
> > > Changes v4 -> v5:
> > >=20
> > > * Avoid global variables and make driver reentrant following the
> > > state container design pattern.
> > >=20
> > > * Fix coding error referencing i2c_dev variable of amdisp_platform
> > > in instantiate_isp_i2c_client().
> > >=20
> > > * Remove i2c_put_adapter(). Not required as i2c_get_adapter() is not
> > > called.
> > >=20
> > > * Use i2c_board_info->swnode instead of fwnode to fix refcount imbala=
nce
> > > warnings when module is removed.
> > >=20
> > > * Address review comments.
> > >=20
> > >   drivers/platform/x86/amd/Kconfig    |  11 ++
> > >   drivers/platform/x86/amd/Makefile   |   1 +
> > >   drivers/platform/x86/amd/amd_isp4.c | 295 +++++++++++++++++++++++++=
+++
> > >   3 files changed, 307 insertions(+)
> > >   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
> > >=20
> > > diff --git a/drivers/platform/x86/amd/Kconfig
> > > b/drivers/platform/x86/amd/Kconfig
> > > index c3e086ea64fc..ec755b5fc93c 100644
> > > --- a/drivers/platform/x86/amd/Kconfig
> > > +++ b/drivers/platform/x86/amd/Kconfig
> > > @@ -32,3 +32,14 @@ config AMD_WBRF
> > >=20
> > >          This mechanism will only be activated on platforms that adve=
rtise
> > > a
> > >          need for it.
> > > +
> > > +config AMD_ISP_PLATFORM
> > > +     tristate "AMD ISP4 platform driver"
> > > +     depends on I2C && X86_64 && ACPI && AMD_ISP4
> > > +     help
> > > +       Platform driver for AMD platforms containing image signal
> > > processor
> > > +       gen 4. Provides camera sensor module board information to all=
ow
> > > +       sensor and V4L drivers to work properly.
> > > +
> > > +       This driver can also be built as a module.  If so, the module
> > > +       will be called amd_isp4.
> > > diff --git a/drivers/platform/x86/amd/Makefile
> > > b/drivers/platform/x86/amd/Makefile
> > > index c6c40bdcbded..b0e284b5d497 100644
> > > --- a/drivers/platform/x86/amd/Makefile
> > > +++ b/drivers/platform/x86/amd/Makefile
> > > @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               +=3D pmc/
> > >   obj-$(CONFIG_AMD_HSMP)               +=3D hsmp/
> > >   obj-$(CONFIG_AMD_PMF)                +=3D pmf/
> > >   obj-$(CONFIG_AMD_WBRF)               +=3D wbrf.o
> > > +obj-$(CONFIG_AMD_ISP_PLATFORM)       +=3D amd_isp4.o
> > > diff --git a/drivers/platform/x86/amd/amd_isp4.c
> > > b/drivers/platform/x86/amd/amd_isp4.c
> > > new file mode 100644
> > > index 000000000000..ad181ab96423
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/amd/amd_isp4.c
> > > @@ -0,0 +1,295 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * AMD ISP platform driver for sensor i2-client instantiation
> > > + *
> > > + * Copyright 2025 Advanced Micro Devices, Inc.
> > > + */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/device/bus.h>
> > > +#include <linux/dmi.h>
> > > +#include <linux/gpio/machine.h>
> > > +#include <linux/init.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/units.h>
> > > +
> > > +#define AMDISP_OV05C10_I2C_ADDR              0x10
> > > +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
> > > +#define AMDISP_OV05C10_HID           "OMNI5C10"
> > > +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
> > > +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
> > > +
> > > +/*
> > > + * AMD ISP platform definition to configure the device properties
> > > + * missing in the ACPI table.
> > > + */
> > > +struct amdisp_platform {
> > > +     const char *name;
> > > +     u8 i2c_addr;
> > > +     u8 max_num_swnodes;
> > > +     struct i2c_board_info board_info;
> > > +     struct notifier_block i2c_nb;
> > > +     struct i2c_client *i2c_dev;
> > > +     struct software_node **swnodes;
> >=20
> > Can't this too be const struct so you can avoid a few casts below?
> >=20
> Thanks. I will make it a const and remove the unnecessary casts in V6.
>=20
> > > +};
> > > +
> > > +/* Top-level OV05C10 camera node property table */
> > > +static const struct property_entry ov05c10_camera_props[] =3D {
> > > +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
> > > +     { }
> > > +};
> > > +
> > > +/* Root AMD ISP OV05C10 camera node definition */
> > > +static const struct software_node camera_node =3D {
> > > +     .name =3D AMDISP_OV05C10_HID,
> > > +     .properties =3D ov05c10_camera_props,
> > > +};
> > > +
> > > +/*
> > > + * AMD ISP OV05C10 Ports node definition. No properties defined for
> > > + * ports node for OV05C10.
> > > + */
> > > +static const struct software_node ports =3D {
> > > +     .name =3D "ports",
> > > +     .parent =3D &camera_node,
> > > +};
> > > +
> > > +/*
> > > + * AMD ISP OV05C10 Port node definition. No properties defined for
> > > + * port node for OV05C10.
> > > + */
> > > +static const struct software_node port_node =3D {
> > > +     .name =3D "port@",
> > > +     .parent =3D &ports,
> > > +};
> > > +
> > > +/*
> > > + * Remote endpoint AMD ISP node definition. No properties defined fo=
r
> > > + * remote endpoint node for OV05C10.
> > > + */
> > > +static const struct software_node remote_ep_isp_node =3D {
> > > +     .name =3D AMDISP_OV05C10_REMOTE_EP_NAME,
> > > +};
> > > +
> > > +/*
> > > + * Remote endpoint reference for isp node included in the
> > > + * OV05C10 endpoint.
> > > + */
> > > +static const struct software_node_ref_args ov05c10_refs[] =3D {
> > > +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> > > +};
> > > +
> > > +/* OV05C supports one single link frequency */
> > > +static const u64 ov05c10_link_freqs[] =3D {
> > > +     925 * HZ_PER_MHZ,
> > > +};
> > > +
> > > +/* OV05C supports only 2-lane configuration */
> > > +static const u32 ov05c10_data_lanes[] =3D {
> > > +     1,
> > > +     2,
> > > +};
> > > +
> > > +/* OV05C10 endpoint node properties table */
> > > +static const struct property_entry ov05c10_endpoint_props[] =3D {
> > > +     PROPERTY_ENTRY_U32("bus-type", 4),
> > > +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
> > > +                                  ARRAY_SIZE(ov05c10_data_lanes)),
> > > +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_f=
reqs,
> > > +                                  ARRAY_SIZE(ov05c10_link_freqs)),
> > > +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
> > > +     { }
> > > +};
> > > +
> > > +/* AMD ISP endpoint node definition */
> > > +static const struct software_node endpoint_node =3D {
> > > +     .name =3D "endpoint",
> > > +     .parent =3D &port_node,
> > > +     .properties =3D ov05c10_endpoint_props,
> > > +};
> > > +
> > > +/*
> > > + * AMD ISP swnode graph uses 5 nodes and also its relationship is
> > > + * fixed to align with the structure that v4l2 expects for successfu=
l
> > > + * endpoint fwnode parsing.
> > > + *
> > > + * It is only the node property_entries that will vary for each plat=
form
> > > + * supporting different sensor modules.
> > > + */
> > > +#define NUM_SW_NODES 5
> > > +
> > > +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] =
=3D {
> > > +     &camera_node,
> > > +     &ports,
> > > +     &port_node,
> > > +     &endpoint_node,
> > > +     &remote_ep_isp_node,
> > > +     NULL
> > > +};
> > > +
> > > +/* OV05C10 specific AMD ISP platform configuration */
> > > +static const struct amdisp_platform amdisp_ov05c10_platform_config =
=3D {
> > > +     .name =3D AMDISP_OV05C10_PLAT_NAME,
> > > +     .board_info =3D {
> > > +             .dev_name =3D "ov05c10",
> > > +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
> > > +     },
> > > +     .i2c_addr =3D AMDISP_OV05C10_I2C_ADDR,
> > > +     .max_num_swnodes =3D NUM_SW_NODES,
> > > +     .swnodes =3D (struct software_node **)ov05c10_nodes,
> > > +};
> > > +
> > > +static const struct acpi_device_id amdisp_sensor_ids[] =3D {
> > > +     { AMDISP_OV05C10_HID },
> > > +     { }
> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> > > +
> > > +static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> > > +{
> > > +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> > > +}
> > > +
> > > +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c=
10,
> > > struct i2c_adapter *adap)
> > > +{
> > > +     struct i2c_board_info *info =3D &ov05c10->board_info;
> > > +     struct i2c_client *i2c_dev;
> > > +
> > > +     if (ov05c10->i2c_dev)
> > > +             return;
> > > +
> > > +     if (!info->addr) {
> > > +             dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
> > > +                     ov05c10->i2c_addr);
> >=20
> > Put on a single line, you've longer lines already than what this is.
> >=20
> sure, will fix this in V6.
>=20
> > > +             return;
> > > +     }
> > > +
> > > +     i2c_dev =3D i2c_new_client_device(adap, info);
> > > +     if (IS_ERR(i2c_dev)) {
> > > +             dev_err(&adap->dev, "error %pe registering isp
> > > i2c_client\n",
> > > +                     i2c_dev);
> >=20
> > Ditto.
> >=20
> sure, will fix this in V6.
>=20
> > > +             return;
> > > +     }
> > > +     ov05c10->i2c_dev =3D i2c_dev;
> > > +}
> > > +
> > > +static int isp_i2c_bus_notify(struct notifier_block *nb,
> > > +                           unsigned long action, void *data)
> > > +{
> > > +     struct amdisp_platform *ov05c10 =3D container_of(nb, struct
> > > amdisp_platform, i2c_nb);
> > > +     struct device *dev =3D data;
> > > +     struct i2c_client *client;
> > > +     struct i2c_adapter *adap;
> > > +
> > > +     switch (action) {
> > > +     case BUS_NOTIFY_ADD_DEVICE:
> > > +             adap =3D i2c_verify_adapter(dev);
> > > +             if (!adap)
> > > +                     break;
> > > +             if (is_isp_i2c_adapter(adap))
> > > +                     instantiate_isp_i2c_client(ov05c10, adap);
> > > +             break;
> > > +     case BUS_NOTIFY_REMOVED_DEVICE:
> > > +             client =3D i2c_verify_client(dev);
> > > +             if (!client)
> > > +                     break;
> > > +             if (ov05c10->i2c_dev =3D=3D client) {
> > > +                     dev_dbg(&client->adapter->dev, "amdisp i2c_clie=
nt
> > > removed\n");
> > > +                     ov05c10->i2c_dev =3D NULL;
> > > +             }
> > > +             break;
> > > +     default:
> > > +             break;
> > > +     }
> > > +
> > > +     return NOTIFY_DONE;
> > > +}
> > > +
> > > +static struct amdisp_platform *prepare_amdisp_platform(const struct
> > > amdisp_platform *src)
> > > +{
> > > +     struct amdisp_platform *isp_ov05c10;
> > > +     const struct software_node **sw_nodes;
> > > +     const struct software_node *sw_node;
> > > +     struct i2c_board_info *info;
> > > +     int ret;
> > > +
> > > +     isp_ov05c10 =3D kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
> > > +     if (!isp_ov05c10)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     info =3D &isp_ov05c10->board_info;
> > > +
> > > +     sw_nodes =3D (const struct software_node **)src->swnodes;
> > > +     ret =3D software_node_register_node_group(sw_nodes);
> > > +     if (ret)
> > > +             goto error_unregister_sw_node;
> > > +
> > > +     sw_node =3D (const struct software_node *)src->swnodes[0];
> > > +     info->swnode =3D sw_node;
> > > +
> > > +     return isp_ov05c10;
> > > +
> > > +error_unregister_sw_node:
> > > +     software_node_unregister_node_group(sw_nodes);
> >=20
> > If register failed, why you are calling unregister for it??
> >=20
> This is not intended, thanks for catching this, will fix it in V6.
>=20
>=20
> > > +     kfree(isp_ov05c10);
> > > +     return ERR_PTR(ret);
> > > +}
> > > +
> > > +static int amd_isp_probe(struct platform_device *pdev)
> > > +{
> > > +     struct amdisp_platform *ov05c10;
> > > +     int ret;
> > > +
> > > +     ov05c10 =3D prepare_amdisp_platform(&amdisp_ov05c10_platform_co=
nfig);
> > > +     if (IS_ERR(ov05c10))
> > > +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
> > > +                                  "failed to prepare amdisp platform=
 fw
> > > node\n");
> >=20
> > fwnode
> >=20
> > Please also capitalize properly as this is user visible message, AMD IS=
P ?
> >=20
> sure, I will capitalize the words and fix the spacing as suggested in V6.
>=20
> > > +
> > > +     ov05c10->i2c_nb.notifier_call =3D isp_i2c_bus_notify;
> > > +
> > > +     ret =3D bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
> > > +     if (ret)
> > > +             goto error_free_platform;
> > > +
> > > +     platform_set_drvdata(pdev, ov05c10);
> > > +     return ret;
> >=20
> > return 0
> >=20
> > > +
> > > +error_free_platform:
> > > +     kfree(ov05c10);
> > > +     return ret;
> > > +}
> > > +
> > > +static void amd_isp_remove(struct platform_device *pdev)
> > > +{
> > > +     struct amdisp_platform *ov05c10 =3D platform_get_drvdata(pdev);
> > > +
> > > +     if (IS_ERR_OR_NULL(ov05c10))
> >=20
> > How can this happen??
> >=20
> I agree this can never happen in the current driver. The only possibility=
 that
> it can happen is when platform_set_drvdata() is missed in the probe().

Just remove the unnecessary check then.

--=20
 i.

--8323328-61244498-1744739378=:942--
