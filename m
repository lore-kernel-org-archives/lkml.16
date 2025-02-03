Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9CF2040A6;
	Mon,  3 Feb 2025 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587311; cv=none; b=I+EKyCOkgGI9AI4B57ctrm2jtX6SD/3aaWL6IY1MCQ+8mGI8i8fxYfpLCjoj2u328DRUODbHyDgWygJ7tQpcVHqLlAFiB91dFznIABn79A2qJ0OTJLRVLmbU294W/DJGa8YrKz3YfOHChOCSMWBTedYwQiogPaDGiSh+AnnAV5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587311; c=relaxed/simple;
	bh=MeY6uH2ARoh7Cb7jsYc6ETd6g0tfr5Job862/poiLYI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JBkPeBNHnjgtU6IRgPO3kS20M5vJ04rqI+LnYsYEwAZfzDe0iV57IEWQsAJk6Xhaxg7dLSM+zYzCBX4ezfOeXm20H8HJlLwW/1SInjbiE3jr1eDTLMgPNPxZTan8jEfKZNgk2IKFW2Kt3Qm1VyphMFrJBdjX6WOoCfNlH6isiR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcyhG7PM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcyhG7PM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738587310; x=1770123310;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MeY6uH2ARoh7Cb7jsYc6ETd6g0tfr5Job862/poiLYI=;
  b=PcyhG7PMKVrV4kYQOkdz3aMRIlFeztoO05WFYO4br+WlZtmYS/J2YXBp
   OsvEOL5s7ui6D8fObK61p79XJGIOKeQMffKRgZEx2yKXwklInl91m5/BU
   0dURiNrGhY48WkmyexLFW4rLo2hEdPs3d62EH3iRzvfRashGnNgi60nt8
   XtvDBuRhOCPCT0fKC0xqJxPMAoUXUl9sgiIEjgscb/2J0LWEle8ObBeEt
   gdiC2o/cVhGYwGcJLOCIV/oEic9FhWBITagoumDaRoE5viFXdX56svLN9
   frNF6fLgF5IXXtnheoLNSu5N7Qn9GjC2q6GodAod1LPRk0xlLJEAR7nE2
   A==;
X-CSE-ConnectionGUID: lRy9hj/1QNy7hSV45iWfTQ==
X-CSE-MsgGUID: MgtwiW5nSHmfPCj3uBD0qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50464718"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50464718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:55:09 -0800
X-CSE-ConnectionGUID: 32slTYCNQtWkGmmYbBhi9w==
X-CSE-MsgGUID: PenPCx9VQliCTweMwDacUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110039927"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:55:07 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 14:55:03 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
In-Reply-To: <D7ISQ5PQLOLR.2P6D3M7W54PA3@gmail.com>
Message-ID: <30f4bdff-caf7-45ce-5997-70c1c36a71ae@linux.intel.com>
References: <20250203062055.2915-1-kuurtb@gmail.com> <c6e10cdd-6fba-6e8b-0913-66766cb9248e@linux.intel.com> <D7ISQ5PQLOLR.2P6D3M7W54PA3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1128701905-1738587303=:934"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1128701905-1738587303=:934
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 3 Feb 2025, Kurt Borja wrote:

> On Mon Feb 3, 2025 at 4:20 AM -05, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 3 Feb 2025, Kurt Borja wrote:
> >
> >> Hi!
> >>
> >> I bring some last minute modifications.
> >>=20
> >> I found commit
> >>=20
> >> =098d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
> >>=20
> >> which states that it's unnecesary to call device_remove_groups() when
> >> the device is removed, so I dropped it to simplify things.
> >
> > Hi Kurt,
>=20
> Hi Ilpo,
>=20
> >
> >> I also found commit
> >>=20
> >> =09957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to dev=
_groups")
> >>=20
> >> which states that no driver should add sysfs groups while probing the
> >> device as it races with userspace, so I re-added PROBE_FORCE_SYNCHRONO=
US
> >> to the platform driver, so groups are added only after the device has
> >> finished probing.
> >>
> >> I'm not 100% sure that the second commit message applies here, but it =
is
> >> revd-by Greg K-H so I added it just in case.
> >
> > Which is why .dev_groups should be used as it is able to avoid those=20
> > races on driver core level.
>=20
> In previous discussions with Armin we agreed it made more sense to move
> WMAX-only groups from alienware-wmi-base.c to alienware-wmi-wmax.c when
> splitting.
>=20
> I have no problem in moving them back to .dev_groups though.
>=20
> >
> > Why you call device_add_groups() at all? Can't you just insert it into=
=20
> > .dev_groups member in alienware_wmax_wmi_driver?
>=20
> I'd love to do this as it would simplify things a LOT, but some
> user-space tools might expect this attributes to be exposed by the
> "fake" platform device located at
>=20
> /sys/devices/platform/alienware-wmi
>=20
> If it were not for this, I would expose every attribute in the WMI
> device.

Ah, sorry, I didn't pay attention where they were added to. I vaguely=20
recall that discussion.

But still, you could make the groups available through .h and just add=20
them directly into alienfx_groups (with an #ifdef/#else in .h), or is=20
there again something I don't see?

Obviously, .is_visible functions need to be extended slightly to filter=20
out by interface but that should be relatively easy too. Also, the group=20
variable names should be properly prefixed when making them cross file=20
boundary like that.

--=20
 i.

--8323328-1128701905-1738587303=:934--
