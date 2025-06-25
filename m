Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12C52609F7;
	Wed, 25 Jun 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857244; cv=none; b=KaxxK8qTxdWJcVBStpLix5MB3FsesnqYEGS+t2y4/2tNAYxR2nHMM2oNrossn/JorkIqAcDQ+bSH/sUHweCM3cEkefR6cdtNpgd6TLjhYVFq6r+Rhq7OsQVyPkNVYJKWQoH/xJERZ53yBoUXH8uyJO4ZuXL8qb5t0wyls8AaC/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857244; c=relaxed/simple;
	bh=MYabgvzLNpw0hpi+SGZrcpfwAH21zFeJ+Bbfq8cVmoc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XnUd6kR643J8P8FDwZcriZ+ogzTK142qdf9+DEpA/hupeD6MdzWyj52RoU4bQlavKxDaxwm7AXateJGfujQgTo18aYm12dcLj2BoqNM4MztzGglp+UbyjHxeVhve5A683N1y3+nySLEdopSH6suUwHpbRf3MC2/CiaWW02zSPvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVf3TzAp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVf3TzAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750857242; x=1782393242;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MYabgvzLNpw0hpi+SGZrcpfwAH21zFeJ+Bbfq8cVmoc=;
  b=UVf3TzApLUKbMfcPhFri4DbvyBODH7ZnPDLWtlajUHOJTJEc9+mhPX6Q
   c51GfxdR5pUxD1oL3a9gUv3O4t87LYlPEe5F9ISG+1tj1kXTcHqtBFug2
   dT9sMZ7ttOUv7BcGA3f6i4HVkfP43JHehjWjUc5NfrCzQzfqeon+n+tCG
   /yRK3nlk3oU0P2thr7nN4ejk3FN4Q2JPBQZ+wplZid3YbILczcRJ4dk4v
   DZQsw0vq1vVCVK/kv3TCqKngpKgR7ngXNkyH9NjVl+dY9ZwtDzQfLW8O7
   LR37gz5Zy12o4JSheoiLthaFdZq1Qg5tKXdr1KILJ+ErE8om6Ywj0XJZe
   A==;
X-CSE-ConnectionGUID: 3kcOVRukQm2hSIlaeCcrWg==
X-CSE-MsgGUID: aAzx5wW6RnKdzRlZNlL1iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75665328"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="75665328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:14:01 -0700
X-CSE-ConnectionGUID: Qr3Y5JoqQracMbXzx4oBig==
X-CSE-MsgGUID: EeF6PaKNTeqwp4BuQc7vyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156492988"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:13:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Jun 2025 16:13:56 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: dimich.dmb@gmail.com, Hans de Goede <hdegoede@redhat.com>, 
    kuurtb@gmail.com, corbet@lwn.net, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: wmi: Fix WMI event enablement
In-Reply-To: <b32b6f01-cac7-4cd4-b73b-eb4bbce63039@gmx.de>
Message-ID: <bbc53a25-1b8d-ad3f-fc67-381c7d11a9b1@linux.intel.com>
References: <20250619221440.6737-1-W_Armin@gmx.de> <e23ffd29-13db-bb11-ee06-0f1203269902@linux.intel.com> <b32b6f01-cac7-4cd4-b73b-eb4bbce63039@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-227557134-1750857236=:944"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-227557134-1750857236=:944
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 25 Jun 2025, Armin Wolf wrote:
> Am 25.06.25 um 14:28 schrieb Ilpo J=C3=A4rvinen:
> > On Fri, 20 Jun 2025, Armin Wolf wrote:
> >=20
> > > It turns out that the Windows WMI-ACPI driver always enables/disables
> > > WMI events regardless of whether they are marked as expensive or not.
> > > This finding is further reinforced when reading the documentation of
> > > the WMI_FUNCTION_CONTROL_CALLBACK callback used by Windows drivers
> > > for enabling/disabling WMI devices:
> > >=20
> > > =09The DpWmiFunctionControl routine enables or disables
> > > =09notification of events, and enables or disables data
> > > =09collection for data blocks that the driver registered
> > > =09as expensive to collect.
> > >=20
> > > Follow this behavior to fix the WMI event used for reporting hotkey
> > > events on the Dell Latitude 5400 and likely many more devices.
> > >=20
> > > Reported-by: Dmytro Bagrii <dimich.dmb@gmail.com>
> > > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220246
> > > Tested-by: Dmytro Bagrii <dimich.dmb@gmail.com>
> > > Fixes: 656f0961d126 ("platform/x86: wmi: Rework WCxx/WExx ACPI method
> > > handling")
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   drivers/platform/x86/wmi.c | 16 +++++++++++-----
> > >   1 file changed, 11 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> > > index 21b7e54bd7ab..4e86a422f05f 100644
> > > --- a/drivers/platform/x86/wmi.c
> > > +++ b/drivers/platform/x86/wmi.c
> > > @@ -180,16 +180,22 @@ static int wmi_device_enable(struct wmi_device
> > > *wdev, bool enable)
> > >   =09acpi_handle handle;
> > >   =09acpi_status status;
> > >   -=09if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
> > > -=09=09return 0;
> > > -
> > >   =09if (wblock->dev.dev.type =3D=3D &wmi_type_method)
> > >   =09=09return 0;
> > >   -=09if (wblock->dev.dev.type =3D=3D &wmi_type_event)
> > > +=09if (wblock->dev.dev.type =3D=3D &wmi_type_event) {
> > > +=09=09/*
> > > +=09=09 * Windows always enables/disables WMI events, even when they
> > > are
> > > +=09=09 * not marked as being expensive. We follow this behavior for
> > Hi Armin,
> >=20
> > Is the wording in the comment reversed? (I suspect you didn't mean to
> > include "not" into that statement?)
>=20
> Actually i did.
>=20
> The WMI-ACPI spec seemed to suggest that WMI events should be enabled/dis=
abled
> only if they are being marked as expensive, however it turned out that WM=
I
> events
> should also be enabled/disabled even if _not_ marked as being expensive.

Okay, fine. I seemingly missed the negation in the ACPI_WMI_EXPENSIVE=20
check.

--=20
 i.

> Besides that another user tested this patch on his machine, so:
>=20
> Tested-by: Grzegorz Suwaj <grzegorzssuwaj@gmail.com>
>=20
> Thanks,
> Armin Wolf
>=20
> > > +=09=09 * compatibility reasons.
> > > +=09=09 */
> > >   =09=09snprintf(method, sizeof(method), "WE%02X",
> > > wblock->gblock.notify_id);
> > > -=09else
> > > +=09} else {
> > > +=09=09if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
> > > +=09=09=09return 0;
> > > +
> > >   =09=09get_acpi_method_name(wblock, 'C', method);
> > > +=09}
> > >     =09/*
> > >   =09 * Not all WMI devices marked as expensive actually implement th=
e
> > >=20
>=20
--8323328-227557134-1750857236=:944--
