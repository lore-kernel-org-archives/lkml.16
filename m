Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082E1F5838;
	Thu, 24 Apr 2025 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495829; cv=none; b=HIftVZHwbunIh+H4VhebHMPJudn810j/GLHbke+OaG9BIrfHpKdBUiWL0UfL+Nyp3fLprNg28FdxCkFE4S0txCHv8ihgiXtf5dKdwMdpgzlDjpPE22yJxXEA3zK1lxABTMNXIFBFt5D712Xlhbev2yUWm+5s37djOYYkk09WYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495829; c=relaxed/simple;
	bh=TftTQmmaBTr51qQ95KUdDGB6/8wnhgmDg5o67uyiyOA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fYJBgzkjeA/nqtj6oyqpZn9FwPuBz4H9Fb5GCbOfFLkbM/Kwio81XIZYg9evS0hreeqvp6p/PXv97U3f4p68HUMCv6qnu+uVkH/7qqZC1qND83gNNZpThSvQWgmW4tDjud45H/h9+JyQOALuVPL7JGIklzOYNCsAIzF2GqP1HFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxDRZGHT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxDRZGHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745495828; x=1777031828;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=TftTQmmaBTr51qQ95KUdDGB6/8wnhgmDg5o67uyiyOA=;
  b=XxDRZGHTm+hYbRuU3ZLXh29BjxGvTVcaIr5D07/bwphvUjbaUXHv+va0
   /8TL99TiTaDbORb+q3X7ut+AggaXJXbgz88LFFKGibFolKu0GQ7ObGDZa
   sAylmt0CaBSM7cVs2CjN8tY8DTH0g3kVeTWM+RcPFF4nb7GBth4T/lLCD
   fj1QefuJG93WSYam8Ms63ZULlLUHkWGEb+M8ZZfSrhlmFHuTPFniz48tn
   7wK1SurQSCOpAxPJJ5/ny95wYdnSbd/FHdukkkrh3zPTra/9d4Ju62cer
   mng9RH0OHWNdazqzLrqbQcn/OH4duRjeGQZd81mag9jc/wOVP9K3/CtTU
   Q==;
X-CSE-ConnectionGUID: u5Kk+M0STP+Hf+K3AzMOZQ==
X-CSE-MsgGUID: DQp+aNZKT7yMOLtWyJij1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="34741071"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="34741071"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 04:57:07 -0700
X-CSE-ConnectionGUID: prhUqoe1QbqEeqQjSuHnUQ==
X-CSE-MsgGUID: h1ZKn4FRRGS3xpGaUQ0nKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132332690"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 04:57:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 24 Apr 2025 14:57:01 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Kurt Borja <kuurtb@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Lyndon Sanche <lsanche@lyndeno.ca>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
In-Reply-To: <3ae149b5-a936-45b4-8887-eb7cde1ee4b0@redhat.com>
Message-ID: <310fae71-d3b7-51b8-6012-c73b2ba7e282@linux.intel.com>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com> <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com> <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com> <1e8a6fe0-518d-4eac-9895-51179ca23f36@redhat.com> <D9E5H5B9X448.12FJT48775C50@gmail.com>
 <3ae149b5-a936-45b4-8887-eb7cde1ee4b0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-204378538-1745490498=:944"
Content-ID: <b593267b-e3f3-1c87-f1a8-2f91f29225b4@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-204378538-1745490498=:944
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0fbeb4e3-899a-f007-e176-e3fb96fb554c@linux.intel.com>

On Wed, 23 Apr 2025, Hans de Goede wrote:
> On 23-Apr-25 6:14 PM, Kurt Borja wrote:
> > On Wed Apr 23, 2025 at 10:44 AM -03, Hans de Goede wrote:
> >> On 23-Apr-25 3:27 PM, Ilpo J=E4rvinen wrote:
> >>> On Fri, 11 Apr 2025, Kurt Borja wrote:
> >>>
> >>>> Use a faux device parent for registering the platform_profile instea=
d of
> >>>> a "fake" platform device.
> >>>>
> >>>> The faux bus is a minimalistic, single driver bus designed for this
> >>>> purpose.
> >>>
> >>> Hi Kurt, Hans & Greg,
> >>>
> >>> I'm not sure about this change. So dell-pc not a platform device but
> >>> a "fake".
> >>
> >> Arguably the dell-pc driver does not need a struct device at all,
> >> since it just exports /sys/firmware/acpi/platform_profile sysfs
> >> interface by using the relevant Dell SMBIOS interfaces for this.
> >>
> >> As such maybe we should just completely get rid of the whole
> >> struct device here?
> >>
> >> If we do decide to keep the struct device, then since the struct devic=
e
> >> seems to just be there to tie the lifetime of the platform_profile
> >> handler to, I guess that calling it a faux device is fair.
> >=20
> > I think it's important to mention that a parent device is required to
> > register a platform profile, see [1].
>=20
> Ah ok, that is new, I guess that was changed with the new support
> for registering multiple platform-profile handlers.
>=20
> > I guess we could get away with removing the device altogether from here=
,
> > but that would require to find another suitable parent device. The
> > obvious choice would be the `dell-smbios` device, however that would
> > require exporting it in the first place.
> >=20
> > For some reason, exporting devices doesn't seem right to me, so IMO a
> > faux device is a good choice here.
>=20
> Agreed.
>=20
> > Another solution that would make more sense, lifetime wise, is to turn
> > this into an aux driver and let `dell-smbios` create the matching aux
> > device.

Well, that was what caused part of my confusion / uncertainty here as
I could see that aux bus between these two drivers. Obviously, it's not=20
there currently but conceptually this relationship looks what full-blown=20
aux bus was supposed to solve.

The other part was that as per Greg's simple classification, certainly=20
this driver needs to access platform resources. BUT, that access is routed=
=20
through another driver which is a case his answer/classification did not=20
cover.

> > I could do this, but I think it's overly complicated.
>
> Yes that does seem overly complicated, lets just go with the faux
> device.

Okay. In part, this was also to check whether replacing full-blown aux bus=
=20
with faux should be considered another kind of "abuse". I've no problem=20
with accepting faux for cases like this as I see these as policy /=20
convention decision more than one being right and another wrong. :-)

Thanks to all who answered.

--=20
 i.
--8323328-204378538-1745490498=:944--
