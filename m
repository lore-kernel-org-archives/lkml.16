Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AB79444;
	Fri, 13 Jun 2025 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826207; cv=none; b=XtO84etifkCO65GB4ud6gj5yZObjFzRdLm0nioj4l+ppvXdF2JsytyV+roI5Ex2ZZCFqemjmZiTdKqex9ZTDKZH4YW1MaRJeucm+kKT7ZITfeLpvwjRqRq0AiIsFXrefGMuAWbo2nVX52nUzb86auAV1xcFU7TktESNsVMTIwPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826207; c=relaxed/simple;
	bh=kGZKovHZAOMAY4BdLaB6MT6J2cwBbIHh1UlazvQlbCI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o2zWv4wDaUMDMKu58AI7dpFJv6B+6jkMpYjNYPDOGwX/h3X4RbySzk/qPNQ6nCkkhtxvT5xjcQ4a2d+GH3jqOXnYNEBsxi2S1yPNQ1hCGSW3D6wd6yup2/mc0oaq99HEoVxBzJcgnekE2qufT+kgJ/HrlTP2PZrXaeEVqLDNkao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evBQHyr8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evBQHyr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749826206; x=1781362206;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kGZKovHZAOMAY4BdLaB6MT6J2cwBbIHh1UlazvQlbCI=;
  b=evBQHyr8jFfCZM3J+gQdIZIXmlTqTjeeMggYZdwk7b477cvogMFNbLp7
   Ium/0rWHaVmw2WrL81I4oYSN1AqQex5Nt16P4mBpNQQxRO5dtwxbI7who
   6+iqodntR/1mnCgC4RPE0uV0nM8MRbOTE6qudoM4LkyFAnIVwj8fFKlBP
   McrHlV6DvL0aVCfzp+4QESpClbQcpiqJirM/W9WzDCM6i0PKAIJI69cXw
   62nCXG5ey3BFeZlMCEbp+kT9MaHkFOyl6TUck2cnB3oIZmOdMMe//0Duz
   WiM5ObBXTPo52t3/Z1H3i4r4aHSCwZWeJdcU/r8AyXad223Qz1BG69aWA
   Q==;
X-CSE-ConnectionGUID: rLku5JqYRsurMN3iiZumxw==
X-CSE-MsgGUID: JY5LCvacRceBaRmlipOeqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55844493"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="55844493"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 07:50:03 -0700
X-CSE-ConnectionGUID: nKyBa/ycQQeHYgj4/TeZgA==
X-CSE-MsgGUID: Mn1CZcZJRcuBRsZIkU8k+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="178742234"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 07:49:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Jun 2025 17:49:54 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>, 
    Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 0/6] platform/x86: Add Lenovo WMI Gaming Series
 Drivers
In-Reply-To: <8933A696-ABA4-4C79-90D3-347016B26911@gmail.com>
Message-ID: <a9faa172-de05-8af6-1fdb-bae50849e087@linux.intel.com>
References: <20250609185027.7378-1-derekjohn.clark@gmail.com> <facbb66b-ea34-bc57-d673-adb84f79fb8d@linux.intel.com> <8933A696-ABA4-4C79-90D3-347016B26911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1542103684-1749826194=:948"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1542103684-1749826194=:948
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 13 Jun 2025, Derek J. Clark wrote:

>=20
>=20
> On June 13, 2025 2:07:14 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linu=
x.intel.com> wrote:
> >On Mon, 9 Jun 2025, Derek J. Clark wrote:
> >
> >> Adds support for the Lenovo "Gaming Series" of laptop hardware that us=
e
> >> WMI interfaces that control various power settings. There are multiple=
 WMI
> >> interfaces that work in concert to provide getting and setting values =
as
> >> well as validation of input. Currently only the "Gamezone", "Other
> >> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> >> I attempted to structure the driver so that adding the "Custom Mode",
> >> "Lighting", and other data block interfaces would be trivial in later
> >> patches.
> >>=20
> >> This driver attempts to standardize the exposed sysfs by mirroring the
> >> asus-armoury driver currently under review. As such, a lot of
> >> inspiration has been drawn from that driver.
> >> https://lore.kernel.org/platform-driver-x86/20250319065827.53478-1-luk=
e@ljones.dev/#t
> >>=20
> >> The drivers have been tested by me on the Lenovo Legion Go and Legion =
Go
> >> S.
> >>=20
> >> Suggested-by: Mario Limonciello <superm1@kernel.org>
> >> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> ---
> >> v12:
> >>  - Fix warnings from make W=3D1
> >> v11:
> >> v10:
> >> https://lore.kernel.org/platform-driver-x86/20250515182224.8277-1-dere=
kjohn.clark@gmail.com/
> >> v9:
> >> https://lore.kernel.org/platform-driver-x86/20250508235217.12256-1-der=
ekjohn.clark@gmail.com/
> >> v8:
> >> https://lore.kernel.org/platform-driver-x86/20250505010659.1450984-1-d=
erekjohn.clark@gmail.com/
> >> v7:
> >> https://lore.kernel.org/platform-driver-x86/20250503000142.1190354-1-d=
erekjohn.clark@gmail.com/
> >> v6:
> >> https://lore.kernel.org/platform-driver-x86/20250428012029.970017-1-de=
rekjohn.clark@gmail.com/
> >> v5:
> >> https://lore.kernel.org/platform-driver-x86/20250408012815.1032357-1-d=
erekjohn.clark@gmail.com/
> >> v4:
> >> https://lore.kernel.org/platform-driver-x86/20250317144326.5850-1-dere=
kjohn.clark@gmail.com/
> >> v3:
> >> https://lore.kernel.org/platform-driver-x86/20250225220037.16073-1-der=
ekjohn.clark@gmail.com/
> >> v2:
> >> https://lore.kernel.org/platform-driver-x86/20250102004854.14874-1-der=
ekjohn.clark@gmail.com/
> >> v1:
> >> https://lore.kernel.org/platform-driver-x86/20241217230645.15027-1-der=
ekjohn.clark@gmail.com/
> >>=20
> >> Derek J. Clark (6):
> >>   platform/x86: Add lenovo-wmi-* driver Documentation
> >>   platform/x86: Add lenovo-wmi-helpers
> >>   platform/x86: Add Lenovo WMI Events Driver
> >>   platform/x86: Add Lenovo Capability Data 01 WMI Driver
> >>   platform/x86: Add Lenovo Gamezone WMI Driver
> >>   platform/x86: Add Lenovo Other Mode WMI Driver
> >>=20
> >>  .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 ++++++
> >>  .../wmi/devices/lenovo-wmi-other.rst          | 108 +++
> >>  MAINTAINERS                                   |  12 +
> >>  drivers/platform/x86/Kconfig                  |  41 ++
> >>  drivers/platform/x86/Makefile                 |   5 +
> >>  drivers/platform/x86/lenovo-wmi-capdata01.c   | 302 ++++++++
> >>  drivers/platform/x86/lenovo-wmi-capdata01.h   |  25 +
> >>  drivers/platform/x86/lenovo-wmi-events.c      | 196 ++++++
> >>  drivers/platform/x86/lenovo-wmi-events.h      |  20 +
> >>  drivers/platform/x86/lenovo-wmi-gamezone.c    | 409 +++++++++++
> >>  drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
> >>  drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
> >>  drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
> >>  drivers/platform/x86/lenovo-wmi-other.c       | 665 +++++++++++++++++=
+
> >>  drivers/platform/x86/lenovo-wmi-other.h       |  16 +
> >>  15 files changed, 2116 insertions(+)
> >>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-other.rst
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-events.h
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> >>  create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
> >
> >Hi Derek,
> >
> >Could you please rebase this on top of for-next placing the files under=
=20
> >lenovo/ folder which we just created. I could have easily changed the=20
> >placement of the files themselves, but making the Kconfig & Makefile=20
> >changes into the new files while applying would have been more=20
> >complicated. It is better you do it so I won't end up messing up anythin=
g.
> >
> >There's the lenovo-target in lenovo/Makefile which will auto add the=20
> >'lenovo-' prefix to the files so you can basically rename the files like=
=20
> >this:
> >
> >drivers/platform/x86/lenovo-wmi-other.c ->
> >drivers/platform/x86/lenovo/wmi-other.c
> >
> >...and add them using that lenovo-target.
> >
>=20
> Sure. I'm on travel so it may be a few days. I'll attempt to get it done =
today if I can though.

Take your time, we're at -rc1 at this point so we'll have plenty of time=20
in this cycle still. :-)

> Should I change the docs at all for this?

I quickly browsed through the documentation patch and I didn't notice
anything there that would need to be changed.

But, MAINTAINERS entries of the code files should be updated as well to=20
reflect the new location, those are usually easy to forget.

--=20
 i.

--8323328-1542103684-1749826194=:948--
