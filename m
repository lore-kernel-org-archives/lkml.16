Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337552E3385;
	Thu,  3 Apr 2025 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677648; cv=none; b=djxrzf6ZZzL9jaV9orazBeeWuUNyYji0coW6ta8L0O1ns5PyJu0AWec/E4lo7/X5hmohUSwzlcGTvVAhMkhE++eRFRSxirNN3AVqbd476fyyqvREF5JBNny0R4SerBoo+9PrV/cWhnsS2tTzffo+O/GyTfYh7kZe4jAfEj3Q4OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677648; c=relaxed/simple;
	bh=HL2bZeN/6TrOkvPvEDWvjU2rnNHuuFI0DJdwxDFEfpQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i7RX9XtfgVzO41xIQGaed2cve8zAJUtAlOul32sHg1Jz9s0SYjX2EcRDzEduyzt7sisgIKLyyQxyxrqaYwvxHtGzmykB2BENDUDSQDgc1KU0yf0yWBOR97ZMYdGsK5lvmhl19bXNaor/u7mZSrYaWRpaOzvEapSuwvleGanfAQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxLsZ69Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxLsZ69Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743677647; x=1775213647;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HL2bZeN/6TrOkvPvEDWvjU2rnNHuuFI0DJdwxDFEfpQ=;
  b=fxLsZ69ZQuXNqWczYBVh8FWa4j8pNYkCOaviXxqfEv3k/FQHl2bO9W5G
   5Wwvdmalmkt8yo/lpQUd8G0oNfCIH2tVPwxB8XaXRdBdc5H9LqKtThRWr
   LuDngDVZ/ZKBtJcNm4nlnrU2pXkY44h9u9YyjIc7LapF45iKBMCYYknLf
   jqj6Dg1oB8f8hLfV2GWUycmNA9k9NpZpf1lJ0SltbWW0leIOmghpdQemF
   EEiOm7JZFgMvL4AE1gWhjXExD4iVTNFj4UrJ2W7QtA5UcWtROIY6BsZeY
   kFPuXcVmPWXKQx127vRf4pyRJ3tjtNvs3xJSH+RnFWFm/V/ORNY3ltkOS
   A==;
X-CSE-ConnectionGUID: bjb5qYENSiKB3O9S1s5rFg==
X-CSE-MsgGUID: dRlBPgRnQBOw11var4MHQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44791483"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44791483"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:54:05 -0700
X-CSE-ConnectionGUID: oxi6xKPlS/ClIRGIeX+iFA==
X-CSE-MsgGUID: O7/WCy3ATK6shXcHXXc5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127483765"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:54:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Apr 2025 13:53:58 +0300 (EEST)
To: Derek John Clark <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/6 RESEND] platform/x86: Add Lenovo Gamezone WMI
 Driver
In-Reply-To: <CAFqHKTk30hV5UuXjpfHs_0CT=5cfbPkiW4im4uHO4dC=9d9AqQ@mail.gmail.com>
Message-ID: <345fc20a-5658-3c1d-3c3d-cfb3b2e31a3c@linux.intel.com>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com> <20250317144326.5850-7-derekjohn.clark@gmail.com> <be11f12b-d610-6130-180a-476d7958f2b9@linux.intel.com> <CAFqHKTk30hV5UuXjpfHs_0CT=5cfbPkiW4im4uHO4dC=9d9AqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1685862956-1743677638=:1302"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1685862956-1743677638=:1302
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 2 Apr 2025, Derek John Clark wrote:

> On Thu, Mar 27, 2025 at 6:56=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 17 Mar 2025, Derek J. Clark wrote:
> >
> > > Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WM=
I
> > > interface that comes on Lenovo "Gaming Series" hardware. Provides ACP=
I
> > > platform profiles over WMI.
> > >
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >
> > This has a few similar nits I flagged for the other patches but I won't
> > mark them here again but please go through the patches to find similar
> > cases.
> >
> > > ---
> > > v4:
> > > - Add notifier blocks for the Events and Other Mode drivers.
> > > - Remove notifier block chain head and all reference to Thermal Mode
> > >   Event GUID.
> > > - Add header for Gamezone specific structs and functions.
> > > - Various fixes from review.
> > > v3:
> > > - Use notifier chain to report platform profile changes to any
> > >   subscribed drivers.
> > > - Adds THERMAL_MODE_EVENT GUID and .notify function to trigger notifi=
er
> > >   chain.
> > > - Adds support for Extreme Mode profile on supported hardware, as wel=
l
> > >   as a DMI quirk table for some devices that report extreme mode vers=
ion
> > >   support but so not have it fully implemented.
> > > - Update to include recent changes to platform-profile.
> > > v2:
> > > - Use devm_kmalloc to ensure driver can be instanced, remove global
> > >   reference.
> > > - Ensure reverse Christmas tree for all variable declarations.
> > > - Remove extra whitespace.
> > > - Use guard(mutex) in all mutex instances, global mutex.
> > > - Use pr_fmt instead of adding the driver name to each pr_err.
> > > - Remove noisy pr_info usage.
> > > - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
> > > - Remove GZ_WMI symbol exporting.
> > > ---
> > >  MAINTAINERS                                |   2 +
> > >  drivers/platform/x86/Kconfig               |  13 +
> > >  drivers/platform/x86/Makefile              |   1 +
> > >  drivers/platform/x86/lenovo-wmi-gamezone.c | 380 +++++++++++++++++++=
++
> > >  drivers/platform/x86/lenovo-wmi-gamezone.h |  18 +
> > >  5 files changed, 414 insertions(+)
> > >  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
> > >  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
> > >

> > > diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.h b/drivers/pla=
tform/x86/lenovo-wmi-gamezone.h
> > > new file mode 100644
> > > index 000000000000..ac536803160b
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/lenovo-wmi-gamezone.h
> > > @@ -0,0 +1,18 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > > + *
> > > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > > + *
> > > + */
> > > +
> > > +#ifndef _LENOVO_WMI_GAMEZONE_H_
> > > +#define _LENOVO_WMI_GAMEZONE_H_
> > > +
> > > +enum thermal_mode {
> > > +     SMARTFAN_MODE_QUIET =3D 0x01,
> > > +     SMARTFAN_MODE_BALANCED =3D 0x02,
> > > +     SMARTFAN_MODE_PERFORMANCE =3D 0x03,
> > > +     SMARTFAN_MODE_EXTREME =3D 0xE0, /* Ver 6+ */
> > > +     SMARTFAN_MODE_CUSTOM =3D 0xFF,
> > > +};
> > > +
> > > +#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
> > >
> >
> > Are these going the be used by other .c files?
> >
>=20
> They are used across different c files in this series. The
> lenovo-wmi-other driver uses every header.

Oh, how can this then be the last patch of the series???

Won't the build fail before this patch for lenovo-wmi-other.c?

--=20
 i.

--8323328-1685862956-1743677638=:1302--
