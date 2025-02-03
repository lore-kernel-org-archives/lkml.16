Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78237205E0A;
	Mon,  3 Feb 2025 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591806; cv=none; b=Y26IMEoFMMyDm5RmHzanVgykqhF6J0WZl5KWS9+Xcm99KMeG9p/Z1RqOwM+ZMBcDjdEABpGlgRCrp+kZo8m6LEs4h+yqCv5iNT6N9n5gcMwKnnN4LpnILV2NA0pzlvSeqmSoIIYljUp8RQMjNTvt1YTYuHDDQwKGcL2Mqgg4uXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591806; c=relaxed/simple;
	bh=7xm5H8o91nowEKmv66vJryMvUJUCjtxhGx1R+VkOLto=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z72sK825bLfpQ/0XGl6JBNYUHwIEJKOmg6MdoxF8IIYrpMuBE6rkHocxMkHpyDHJ0ZtBpxHUIWs+zli6mNgTFMBP/cdHSz6jnyEWW47X4JA+NNQaAyT+zSlZDvo2CX/mlnJunENDwSVO+V/RzzJheCSUo6rAn+azP4BXE4QEujU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEPTd/qh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEPTd/qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591805; x=1770127805;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7xm5H8o91nowEKmv66vJryMvUJUCjtxhGx1R+VkOLto=;
  b=lEPTd/qhYC1Pt0jzrP8rSmxyTSOq+CDDmU3NZuM7HkIkk+Qcf48xGfpM
   FLPKSa/br6fUErj18DySZCVOLFatGps0tQAdtyfO/08xGhiV8UKJevM4C
   XWlqPvXtgxqvnNMnbKqd0VtA7jfAwSYyl1tyFlFaKYUB5LzmpIYB/YRYh
   rxMLy20LJox2Hkpvmc8GGJ8T/KcdISejxOcaxYKeHpQeZ/L5hR9VRVUaq
   6OT44ByLehIfJFAQlAfsYf1X5Axvy1kenPb9KK5NUsyELTHg5+UfeDwf0
   hXTe0MUEdul7dpdwzJlode7g3ZuBkio7Zzmcgn5bpDDIvsfA46sOaFU/g
   Q==;
X-CSE-ConnectionGUID: RUmm6PnRRQaOOYIfSVIQcw==
X-CSE-MsgGUID: 16bOS351Q36TFWWGtpmQvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26686347"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="26686347"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:10:04 -0800
X-CSE-ConnectionGUID: /9aXfix4RC6U5XDaL5yNjg==
X-CSE-MsgGUID: wu+yLf4XS6Gi7GVbAsN13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114330804"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:10:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 16:09:59 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
In-Reply-To: <D7IV1P2LAXRV.21V72EQZ7RMFZ@gmail.com>
Message-ID: <a2086a6b-6e2a-faab-6dd1-d13d3bceccfa@linux.intel.com>
References: <20250203062055.2915-1-kuurtb@gmail.com> <c6e10cdd-6fba-6e8b-0913-66766cb9248e@linux.intel.com> <D7ISQ5PQLOLR.2P6D3M7W54PA3@gmail.com> <30f4bdff-caf7-45ce-5997-70c1c36a71ae@linux.intel.com> <D7IV1P2LAXRV.21V72EQZ7RMFZ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1338144458-1738591799=:934"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1338144458-1738591799=:934
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 3 Feb 2025, Kurt Borja wrote:

> On Mon Feb 3, 2025 at 7:55 AM -05, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 3 Feb 2025, Kurt Borja wrote:
> >
> >> On Mon Feb 3, 2025 at 4:20 AM -05, Ilpo J=C3=A4rvinen wrote:
> >> > On Mon, 3 Feb 2025, Kurt Borja wrote:
> >> >
> >> >> Hi!
> >> >>
> >> >> I bring some last minute modifications.
> >> >>=20
> >> >> I found commit
> >> >>=20
> >> >> =098d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
> >> >>=20
> >> >> which states that it's unnecesary to call device_remove_groups() wh=
en
> >> >> the device is removed, so I dropped it to simplify things.
> >> >
> >> > Hi Kurt,
> >>=20
> >> Hi Ilpo,
> >>=20
> >> >
> >> >> I also found commit
> >> >>=20
> >> >> =09957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to =
dev_groups")
> >> >>=20
> >> >> which states that no driver should add sysfs groups while probing t=
he
> >> >> device as it races with userspace, so I re-added PROBE_FORCE_SYNCHR=
ONOUS
> >> >> to the platform driver, so groups are added only after the device h=
as
> >> >> finished probing.
> >> >>
> >> >> I'm not 100% sure that the second commit message applies here, but =
it is
> >> >> revd-by Greg K-H so I added it just in case.
> >> >
> >> > Which is why .dev_groups should be used as it is able to avoid those=
=20
> >> > races on driver core level.
> >>=20
> >> In previous discussions with Armin we agreed it made more sense to mov=
e
> >> WMAX-only groups from alienware-wmi-base.c to alienware-wmi-wmax.c whe=
n
> >> splitting.
> >>=20
> >> I have no problem in moving them back to .dev_groups though.
> >>=20
> >> >
> >> > Why you call device_add_groups() at all? Can't you just insert it in=
to=20
> >> > .dev_groups member in alienware_wmax_wmi_driver?
> >>=20
> >> I'd love to do this as it would simplify things a LOT, but some
> >> user-space tools might expect this attributes to be exposed by the
> >> "fake" platform device located at
> >>=20
> >> /sys/devices/platform/alienware-wmi
> >>=20
> >> If it were not for this, I would expose every attribute in the WMI
> >> device.
> >
> > Ah, sorry, I didn't pay attention where they were added to. I vaguely=
=20
> > recall that discussion.
> >
> > But still, you could make the groups available through .h and just add=
=20
> > them directly into alienfx_groups (with an #ifdef/#else in .h), or is=
=20
> > there again something I don't see?
>=20
> What do you think about something like:
>=20
> alienware-wmi.h
> ---------------
>=20
> #if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
> #define WMAX_ONLY_GROUP(name)=09=09(wmax_##name)
>=20
> extern const struct attribute_group wmax_hdmi_attribute_group;
> ...
> #else
> #define WMAX_ONLY_GROUP(name)=09=09NULL
> #endif
>=20
> alienware-wmi-base.c
> --------------------
> ...
> static const struct attribute_group *alienfx_groups[] =3D {
> =09&zone_attribute_group,
> =09WMAX_ONLY_GROUP(hdmi_attribute_group),
> =09WMAX_ONLY_GROUP(amplifier_attribute_group),
> =09WMAX_ONLY_GROUP(deepsleep_attribute_group),

IMHO, just define WMAX_GROUPS in the header and use it here.

Similar to e.g. ARCH_PCI_DEV_GROUPS in drivers/pci/pci-sysfs.c.

> =09NULL
> ...
>=20
> };
>=20
> >
> > Obviously, .is_visible functions need to be extended slightly to filter=
=20
> > out by interface but that should be relatively easy too. Also, the grou=
p=20
> > variable names should be properly prefixed when making them cross file=
=20
> > boundary like that.
>=20

--=20
 i.

--8323328-1338144458-1738591799=:934--
