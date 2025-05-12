Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16692AEE1;
	Mon, 12 May 2025 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083631; cv=none; b=ZX9uu7hjaQXf7c4xlOZj9kp/Q20QtRdsrYXt8PcTXJSR3XXj1t1MBx1zLnbNXXM+dOO8X0hy333mHYaYWOkbdN1YzB09aw/JUQWofu+yBL3NzwyGNMf8LD11KaMihHybC8ATLKcShHLmSeD1nRG3zyrTaXSpwNLrzqbOj+n+ya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083631; c=relaxed/simple;
	bh=5RKDK0GSrk50MaIn/HvTBR28C7ABijiXfTPTpwVqkmo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kwpS9w4Wa6c0S06jDyNM8dvFq4OmH5iWQBjeouWk0q0HtKTkGHxtvBJaee7JekNMEFcCPROiFAwvAYpNZb/x79r7QYOz9qXjLu+QOTna6rjzevVRXM1rMZoNq73GRYn0Gzc3+CPq75XCLSdv9mRUdmqBO2MnxViXQ6SSycaH7i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqGhR+Dg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqGhR+Dg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747083630; x=1778619630;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5RKDK0GSrk50MaIn/HvTBR28C7ABijiXfTPTpwVqkmo=;
  b=HqGhR+Dg4iVDaNuQHcfL446IHvSWcFSN0WDcYcq6djwD70Dchx9AxDx4
   +m/jxjkvfsXXcz4aQqUc6NG0g0SkHuKh6saUVR5J7mEqq1BoLUuEdCj0n
   cLbd9bKFWRXXSoOCNNYuhscA7vg+/R9Kop2EBv17+acwr2xOyaG1HScL0
   C4lbMu2+w7NVvb8YBhsKISVVtJnaATtsa+XCebobBADAZixvPImjN+NMM
   h9hSsf1DLrr68VXUEJGofhjACAKJsLGD8Bdyh5mK9OWZ2g1UreLG7P1QI
   f75LGqBY64RADtgMbomBcVh5r7J/ihZFl7aS37zPk1aeHEAmbRzxIxpgG
   w==;
X-CSE-ConnectionGUID: Y5Y5wP6MSJqn6tUqJRsCjA==
X-CSE-MsgGUID: NC3AlLz8SI6ddVsANgmlrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48777236"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="48777236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 14:00:29 -0700
X-CSE-ConnectionGUID: obczR+FBSCK634rXA+oPyQ==
X-CSE-MsgGUID: cvEi5GsuSwuqojxItnoHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="142360126"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.103])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 14:00:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 May 2025 00:00:22 +0300 (EEST)
To: "Nirujogi, Pratap" <pnirujog@amd.com>
cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v13] platform/x86: Add AMD ISP platform config for
 OV05C10
In-Reply-To: <7e46c769-7c5e-4a54-a216-c85c667446f9@amd.com>
Message-ID: <d2bdc8a6-1907-77cd-43a2-fb28439bd37f@linux.intel.com>
References: <20250509181220.1744783-1-pratap.nirujogi@amd.com> <6b649ebf-6f03-4050-18bb-788bbb3a664e@linux.intel.com> <7e46c769-7c5e-4a54-a216-c85c667446f9@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1360781558-1747083622=:961"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1360781558-1747083622=:961
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 12 May 2025, Nirujogi, Pratap wrote:

> Hi Ilpo,
>=20
> On 5/11/2025 6:54 PM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Fri, 9 May 2025, Pratap Nirujogi wrote:
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
> > > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > > Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > ---
> > > Changes v12 -> v13:
> > >=20
> > > * Add "struct amdisp_platform_info" to pass sensor specific
> > > configuration and make the driver generic to support OV05C10
> > > and other supported sensor modules in future.
> > >=20
> > > * Address cosmetic and other review comments.
> > >=20
> > >   drivers/platform/x86/amd/Kconfig    |  11 +
> > >   drivers/platform/x86/amd/Makefile   |   1 +
> > >   drivers/platform/x86/amd/amd_isp4.c | 309 +++++++++++++++++++++++++=
+++
> > >   3 files changed, 321 insertions(+)
> > >   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
> > >=20
> > > diff --git a/drivers/platform/x86/amd/Kconfig
> > > b/drivers/platform/x86/amd/Kconfig
> > > index c3e086ea64fc..152a68a470e8 100644
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
> > > +     depends on I2C && X86_64 && ACPI
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
> > > index 000000000000..27939020634c
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/amd/amd_isp4.c
> > > @@ -0,0 +1,309 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * AMD ISP platform driver for sensor i2-client instantiation
> > > + *
> > > + * Copyright 2025 Advanced Micro Devices, Inc.
> > > + */
> > > +
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/units.h>
> > > +
> > > +#define AMDISP_OV05C10_I2C_ADDR              0x10
> > > +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
> >=20
> > This is not used anywhere?
> >=20
> Thanks. Will remove it, its not used anymore.
>=20
> > > +#define AMDISP_OV05C10_HID           "OMNI5C10"
> > > +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
> > > +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
> > > +
> > > +/*
> > > + * AMD ISP platform info definition to initialize sensor
> > > + * specific platform configuration to prepare the amdisp
> > > + * platform.
> > > + */
> > > +struct amdisp_platform_info {
> > > +     struct i2c_board_info board_info;
> > > +     const struct software_node **swnodes;
> > > +};
> > > +
> > > +/*
> > > + * AMD ISP platform definition to configure the device properties
> > > + * missing in the ACPI table.
> > > + */
> > > +struct amdisp_platform {
> > > +     const struct amdisp_platform_info *pinfo;
> > > +     struct i2c_board_info board_info;
> > > +     struct notifier_block i2c_nb;
> > > +     struct i2c_client *i2c_dev;
> > > +     struct mutex lock;      /* protects i2c client creation */
> >=20
> > Missing #include.
> >=20
> ok, will #include <linux/mutex.h>. I have not included some of these head=
er
> files seprately as they are already part of one or the other existing hea=
ders
> in the patch.

We try to include what is used by the file itself but as there's no=20
ready to use tool to enforce it automatically, it largely depends on devs /
reviewers noticing what should be added. Whenever adding a call to=20
anything outside the .c file itself or use of non-local macro, it's good=20
to check if another #include needs to be added (but I understand devs, me=
=20
included, will often forget it).

There are a few obvious includes where the other one is not needed as the=
=20
path is practically guaranteed, typical examples: linux/xx.h including=20
asm/xx.h or uapi/linux/xx.h.

Relying intentionally on indirect includes creates very hard to track=20
dependencies making it complex to remove any header from another header=20
when the headerfile itself no longer needs that include. Build testing=20
will catch some resulting fallout from such removal but it's coverage is=20
not perfect.

--=20
 i.

--8323328-1360781558-1747083622=:961--
