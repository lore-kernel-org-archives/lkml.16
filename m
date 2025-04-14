Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D41AF0C7;
	Mon, 14 Apr 2025 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624748; cv=none; b=usWEbtHKbJ2qyns+nz7pUVm5wxG1VegsIF6CAkScKQk6dmEpZOlC39X6PbUwUbQsWoaVnBqBplP/qZzBu6qO7ySl9oniX010c8lXbqxYQYLIrHMz6xZ92OACSCxf+Qms2rwtlU4BstQ8UrMDVf7MOYCA5HW4BWFQHDudLwQhN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624748; c=relaxed/simple;
	bh=iiGlU+g2oVx240PkE3U3Cu9+raOq3Nm4P3VB8HCHE/Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k8qvZCcOza4oVZbm8AZJnnIFgZvyNt4JTNYebgkls0ogJigOxfY3z6k9kFO/NDpGxBZpsZX++Mq8CwTGbOCqQeSmGa/gs1XMj8ihDosYdUnMDkTUVV5NEWEhFkqD55yXafBYmqlGMlLfKdvHGKUjfcP2tt4iYrc9/ybNWg+lcLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaaHOeOT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaaHOeOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744624746; x=1776160746;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=iiGlU+g2oVx240PkE3U3Cu9+raOq3Nm4P3VB8HCHE/Y=;
  b=JaaHOeOTNVETlLUzJQ5lKzREIIwAN8HLWnOI5HfuoXfHZX/98c/V6D23
   coedHwadO5Af9Pdlz3oOjECOgALJzwLVCvoZ8uFVJ4iqB3JHHuAjPbXqx
   ChzRVKjZzfw/lwQ8Ly2nx2BJaLhI3N82LPPnx6Q2/6Zvrztcj9Xcj0HqT
   ick4Fo+jRcus+1UW+3cGKsVz0C9vFAN4zg5S1pkNvOA3sbEqqh85MzArF
   Dj0hS/lb4lCqRWcQnsPvVm294LbY52IUMt+BNGTyE9CnMeOeMGvBVUI/4
   k4HkaxYovgvXMLFz1H/CVRqalOuDuV12lVGTiAFBkyS1LzyNcoxyRiPlo
   w==;
X-CSE-ConnectionGUID: 5xVpGeeeQLy8x8pmynsX1g==
X-CSE-MsgGUID: bfIzPFmrSVW9OIfyH31lKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45972025"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45972025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:59:06 -0700
X-CSE-ConnectionGUID: fWuUZwiLRKq+yXMJ4TUVlw==
X-CSE-MsgGUID: oBdR6hmjR7eWiVR0/iyY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134615731"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:59:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 14 Apr 2025 12:59:00 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hdegoede@redhat.com>, lkml@antheas.dev, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: msi-wmi-platform: Workaround a ACPI firmware
 bug
In-Reply-To: <05f7b5b4-c692-4647-96d3-4935280e4097@gmx.de>
Message-ID: <af2ee560-88f1-893a-1e21-47f67c5a1773@linux.intel.com>
References: <20250410212853.334891-1-W_Armin@gmx.de> <60a6574f-d6cd-671c-89d8-0307b440937e@linux.intel.com> <05f7b5b4-c692-4647-96d3-4935280e4097@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1502163799-1744624629=:7362"
Content-ID: <faa9d702-9e3c-459d-7cc0-94e1c130853e@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1502163799-1744624629=:7362
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <4c49b911-faf2-b57c-050c-4fb075e41e6f@linux.intel.com>

On Sat, 12 Apr 2025, Armin Wolf wrote:

> Am 11.04.25 um 15:53 schrieb Ilpo J=E4rvinen:
>=20
> > On Thu, 10 Apr 2025, Armin Wolf wrote:
> >=20
> > > The ACPI byte code inside the ACPI control method responsible for
> > > handling the WMI method calls uses a global buffer for constructing
> > > the return value, yet the ACPI control method itself is not marked
> > > as "Serialized".
> > > This means that calling WMI methods on this WMI device is not
> > > thread-safe, as concurrent WMI method calls will corrupt the global
> > > buffer.
> > Please avoid non-full lines in middle of a paragraph. Either make thing=
s
> > truly own paragraphs or reflow the text in the paragraph.
> >=20
> > > Fix this by serializing the WMI method calls using a mutex.
> > >=20
> > > Fixes: 9c0beb6b29e7 ("platform/x86: wmi: Add MSI WMI Platform driver"=
)
> > > Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   .../wmi/devices/msi-wmi-platform.rst          |  4 +
> > >   drivers/platform/x86/msi-wmi-platform.c       | 99 ++++++++++++----=
---
> > >   2 files changed, 67 insertions(+), 36 deletions(-)
> > >=20
> > > diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst
> > > b/Documentation/wmi/devices/msi-wmi-platform.rst
> > > index 31a136942892..73197b31926a 100644
> > > --- a/Documentation/wmi/devices/msi-wmi-platform.rst
> > > +++ b/Documentation/wmi/devices/msi-wmi-platform.rst
> > > @@ -138,6 +138,10 @@ input data, the meaning of which depends on the
> > > subfeature being accessed.
> > >   The output buffer contains a single byte which signals success or
> > > failure (``0x00`` on failure)
> > >   and 31 bytes of output data, the meaning if which depends on the
> > > subfeature being accessed.
> > >=20
> > > +.. note::
> > > +   The ACPI control method responsible for handling the WMI method c=
alls
> > > is not thread-safe.
> > > +   This is a firmware bug that needs to be handled inside the driver
> > > itself.
> > > +
> > >   WMI method Get_EC()
> > >   -------------------
> > >=20
> > > diff --git a/drivers/platform/x86/msi-wmi-platform.c
> > > b/drivers/platform/x86/msi-wmi-platform.c
> > > index 9b5c7f8c79b0..dc5e9878cb68 100644
> > > --- a/drivers/platform/x86/msi-wmi-platform.c
> > > +++ b/drivers/platform/x86/msi-wmi-platform.c
> > > @@ -10,6 +10,7 @@
> > >   #include <linux/acpi.h>
> > >   #include <linux/bits.h>
> > >   #include <linux/bitfield.h>
> > > +#include <linux/cleanup.h>
> > >   #include <linux/debugfs.h>
> > >   #include <linux/device.h>
> > >   #include <linux/device/driver.h>
> > > @@ -17,6 +18,7 @@
> > >   #include <linux/hwmon.h>
> > >   #include <linux/kernel.h>
> > >   #include <linux/module.h>
> > > +#include <linux/mutex.h>
> > >   #include <linux/printk.h>
> > >   #include <linux/rwsem.h>
> > >   #include <linux/types.h>
> > > @@ -76,8 +78,13 @@ enum msi_wmi_platform_method {
> > >   =09MSI_PLATFORM_GET_WMI=09=09=3D 0x1d,
> > >   };
> > >=20
> > > -struct msi_wmi_platform_debugfs_data {
> > > +struct msi_wmi_platform_data {
> > >   =09struct wmi_device *wdev;
> > > +=09struct mutex wmi_lock;=09/* Necessary when calling WMI methods */
> > > +};
> > > +
> > > +struct msi_wmi_platform_debugfs_data {
> > > +=09struct msi_wmi_platform_data *data;
> > >   =09enum msi_wmi_platform_method method;
> > >   =09struct rw_semaphore buffer_lock;=09/* Protects debugfs buffer */
> > >   =09size_t length;
> > > @@ -132,8 +139,9 @@ static int msi_wmi_platform_parse_buffer(union
> > > acpi_object *obj, u8 *output, siz
> > >   =09return 0;
> > >   }
> > >=20
> > > -static int msi_wmi_platform_query(struct wmi_device *wdev, enum
> > > msi_wmi_platform_method method,
> > > -=09=09=09=09  u8 *input, size_t input_length, u8 *output,
> > > size_t output_length)
> > > +static int msi_wmi_platform_query(struct msi_wmi_platform_data *data=
,
> > > +=09=09=09=09  enum msi_wmi_platform_method method, u8
> > > *input,
> > > +=09=09=09=09  size_t input_length, u8 *output, size_t
> > > output_length)
> > >   {
> > >   =09struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > >   =09struct acpi_buffer in =3D {
> > > @@ -147,9 +155,15 @@ static int msi_wmi_platform_query(struct wmi_dev=
ice
> > > *wdev, enum msi_wmi_platform
> > >   =09if (!input_length || !output_length)
> > >   =09=09return -EINVAL;
> > >=20
> > > -=09status =3D wmidev_evaluate_method(wdev, 0x0, method, &in, &out);
> > > -=09if (ACPI_FAILURE(status))
> > > -=09=09return -EIO;
> > > +=09/*
> > > +=09 * The ACPI control method responsible for handling the WMI metho=
d
> > > calls
> > > +=09 * is not thread-safe. Because of this we have to do the locking
> > > ourself.
> > > +=09 */
> > > +=09scoped_guard(mutex, &data->wmi_lock) {
> > > +=09=09status =3D wmidev_evaluate_method(data->wdev, 0x0, method, &in=
,
> > > &out);
> > > +=09=09if (ACPI_FAILURE(status))
> > > +=09=09=09return -EIO;
> > > +=09}
> > >=20
> > >   =09obj =3D out.pointer;
> > >   =09if (!obj)
> > > @@ -170,22 +184,22 @@ static umode_t msi_wmi_platform_is_visible(cons=
t
> > > void *drvdata, enum hwmon_senso
> > >   static int msi_wmi_platform_read(struct device *dev, enum
> > > hwmon_sensor_types type, u32 attr,
> > >   =09=09=09=09 int channel, long *val)
> > >   {
> > > -=09struct wmi_device *wdev =3D dev_get_drvdata(dev);
> > > +=09struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
> > >   =09u8 input[32] =3D { 0 };
> > >   =09u8 output[32];
> > > -=09u16 data;
> > > +=09u16 value;
> > >   =09int ret;
> > >=20
> > > -=09ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_FAN, input,
> > > sizeof(input), output,
> > > +=09ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, input,
> > > sizeof(input), output,
> > >   =09=09=09=09     sizeof(output));
> > >   =09if (ret < 0)
> > >   =09=09return ret;
> > >=20
> > > -=09data =3D get_unaligned_be16(&output[channel * 2 + 1]);
> > > -=09if (!data)
> > > +=09value =3D get_unaligned_be16(&output[channel * 2 + 1]);
> > > +=09if (!value)
> > >   =09=09*val =3D 0;
> > >   =09else
> > > -=09=09*val =3D 480000 / data;
> > > +=09=09*val =3D 480000 / value;
> > Please put this variable rename into own patch before the actual fix.
>=20
> Hi,
>=20
> the variable rename is necessary because there would be a naming conflict=
 with
> the struct msi_wmi_platform_data *data.
> Since the rename is rather small i would prefer keeping this as a single =
patch
> to make it easier for the stable
> team to backport.

Hi,

I'm not buying it's "easier" when due to the rename, the patch ends up=20
having one long context like that. Stable team is perfectly able to=20
backport prerequisite patches.

Please just split the rename into own patch, it will make the fix related=
=20
changes more obvious here, and the fix itself is quite long even without=20
the rename.

--=20
 i.
--8323328-1502163799-1744624629=:7362--
