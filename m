Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3360F1DFDAB;
	Fri, 25 Apr 2025 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581857; cv=none; b=h1y5IhxkNyVOrYQGBn1QxDgxw2d3hB3HtnNKdhzf3M8mF0vdZQfBZGBEZfeXOk5aFcG2G+/+6UCdLpu3GDkez4NPkeVjmi5DVvWSsWS9JMO3MzGmCzC/GaZ9WU36RyMJUdf3UnNQs5xVx9czGadAAvrUYu2K59QWJARYPEMk3o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581857; c=relaxed/simple;
	bh=jp7CW0jMip0mu96ZaPV8aWGPcKtayqBYqfPssR5Wm4s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Tukg9FC5fwx1yOdqqxk+MCr2V827qqa6fwNyAf4lW4ib9jMfqwydl0/xQ10gR+H+z15wkIHTu3OgFQstdoZ83zWwqC7h66W4ctne4Lt/yBigPuoHgrDIyDVx6Mqh6vuI9/cSUcK1gtOhtnTUsItF/7XRyTFcy4qSpSamvpaJ7LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SE14gzRi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SE14gzRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745581856; x=1777117856;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jp7CW0jMip0mu96ZaPV8aWGPcKtayqBYqfPssR5Wm4s=;
  b=SE14gzRiEcQHfFxlXkCbQAhVM1ob0oyYHAd3MDGeJuQkDNtrXpQ+Jf0i
   cqE7kHqWGuokLqv5OSxWgoNxuO0To8twOUJKlJ5DSXwzmvniemPvogL28
   aXZ7DW7Gox4G3rM08aqVeweWcnb5C1KckZ5N6mvB91xcUyI00akuwURg5
   Txk1mvN+ZGeNk9rZksAyBVTaxv6v2m9QNLjNuu3QTruMcgSk9jemZDOIz
   IPgC7YX9HjAn/iKeA0VPOHem2IMldevHErLD4M1tONln+FfB8j48nu77f
   FxIR36Ynm2XiICJW9ZVZlYv4YmFzPJRctuVQAcm3uz7X2O+5dxitz3ERB
   g==;
X-CSE-ConnectionGUID: 9IjN1KjwT2ixd1KsHps7sA==
X-CSE-MsgGUID: E42F9viVSzG+fPN4j3rezA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="58229731"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="58229731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:50:55 -0700
X-CSE-ConnectionGUID: ufGcPR41RJKwjBYFn69uhw==
X-CSE-MsgGUID: u3EHhBF6RAWtbpyvWd9knQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133198696"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:50:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 25 Apr 2025 14:50:47 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Lyndon Sanche <lsanche@lyndeno.ca>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
In-Reply-To: <D9FJYO87PWNU.1296TXH1IPP66@gmail.com>
Message-ID: <9773453e-83ac-de8d-ca53-d9af6f4f9b93@linux.intel.com>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com> <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com> <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com> <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com> <D9E5H5B9X448.12FJT48775C50@gmail.com>
 <3ae149b5-a936-45b4-8887-eb7cde1ee4b0@redhat.com> <310fae71-d3b7-51b8-6012-c73b2ba7e282@linux.intel.com> <D9FJYO87PWNU.1296TXH1IPP66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-111214098-1745581847=:950"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-111214098-1745581847=:950
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 25 Apr 2025, Kurt Borja wrote:

> On Thu Apr 24, 2025 at 8:57 AM -03, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 23 Apr 2025, Hans de Goede wrote:
> >> On 23-Apr-25 6:14 PM, Kurt Borja wrote:
> >> > On Wed Apr 23, 2025 at 10:44 AM -03, Hans de Goede wrote:
> >> >> On 23-Apr-25 3:27 PM, Ilpo J=C3=A4rvinen wrote:
> >> >>> On Fri, 11 Apr 2025, Kurt Borja wrote:
> >> >>>
> >> >>>> Use a faux device parent for registering the platform_profile ins=
tead of
> >> >>>> a "fake" platform device.
> >> >>>>
> >> >>>> The faux bus is a minimalistic, single driver bus designed for th=
is
> >> >>>> purpose.
> >> >>>
> >> >>> Hi Kurt, Hans & Greg,
> >> >>>
> >> >>> I'm not sure about this change. So dell-pc not a platform device b=
ut
> >> >>> a "fake".
> >> >>
> >> >> Arguably the dell-pc driver does not need a struct device at all,
> >> >> since it just exports /sys/firmware/acpi/platform_profile sysfs
> >> >> interface by using the relevant Dell SMBIOS interfaces for this.
> >> >>
> >> >> As such maybe we should just completely get rid of the whole
> >> >> struct device here?
> >> >>
> >> >> If we do decide to keep the struct device, then since the struct de=
vice
> >> >> seems to just be there to tie the lifetime of the platform_profile
> >> >> handler to, I guess that calling it a faux device is fair.
> >> >=20
> >> > I think it's important to mention that a parent device is required t=
o
> >> > register a platform profile, see [1].
> >>=20
> >> Ah ok, that is new, I guess that was changed with the new support
> >> for registering multiple platform-profile handlers.
> >>=20
> >> > I guess we could get away with removing the device altogether from h=
ere,
> >> > but that would require to find another suitable parent device. The
> >> > obvious choice would be the `dell-smbios` device, however that would
> >> > require exporting it in the first place.
> >> >=20
> >> > For some reason, exporting devices doesn't seem right to me, so IMO =
a
> >> > faux device is a good choice here.
> >>=20
> >> Agreed.
> >>=20
> >> > Another solution that would make more sense, lifetime wise, is to tu=
rn
> >> > this into an aux driver and let `dell-smbios` create the matching au=
x
> >> > device.
> >
> > Well, that was what caused part of my confusion / uncertainty here as
> > I could see that aux bus between these two drivers. Obviously, it's not=
=20
> > there currently but conceptually this relationship looks what full-blow=
n=20
> > aux bus was supposed to solve.
> >
> > The other part was that as per Greg's simple classification, certainly=
=20
> > this driver needs to access platform resources. BUT, that access is rou=
ted=20
> > through another driver which is a case his answer/classification did no=
t=20
> > cover.
>=20
> Perhaps it didn't cover it because, as you mentioned, this falls under
> the aux bus use cases.
>=20
> >
> >> > I could do this, but I think it's overly complicated.
> >>
> >> Yes that does seem overly complicated, lets just go with the faux
> >> device.
> >
> > Okay. In part, this was also to check whether replacing full-blown aux =
bus=20
> > with faux should be considered another kind of "abuse". I've no problem=
=20
> > with accepting faux for cases like this as I see these as policy /=20
> > convention decision more than one being right and another wrong. :-)
>=20
> Now that you put it that way, I guess this still is kind of "abusive",
> but is still an improvement over creating a full platform device.
>=20
> Nevertheless, although this driver do access platform resources, it does
> it completely detached from the "dell-smbios" device. The only use of
> the platform device here was `&pdev->dev` :p

Perhaps "completely detached" is just a synonym for the common assumption=
=20
that there can be only one and abuse of statics, which are generally=20
frowned upon but also commonly used in platform drivers regardless. So=20
there are these caveats in that supposed complete detatchedness.

But yeah, in some case it makes things easier.

--=20
 i.

--8323328-111214098-1745581847=:950--
