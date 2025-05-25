Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C61ACEDC;
	Sun, 25 May 2025 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206805; cv=none; b=fQtBh7sEfXDrxd5IDwIin3hk5j9xNTUBw+OZBQ8t0pDn5LCQzZ/0L+uJ2pYBCVE97i3hmVd+Ubo1jdLye7vFcBcvvCYFlniy7+IYlIe98KxlE9/2D8z3DUID4JI1r5fgP05KYs8/XEUSeIGx6k63LQ8R7wzxdoHa0GnRMZQgz44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206805; c=relaxed/simple;
	bh=UVQpbghoGLikWoMYHWdmkTEFbU5Pl2j2w3h6WzBZe3k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qjLkIXhHoP2m27BdwxwKmSFjcKaUZDQ/L4CBIEMMcbKq2Cbi0yUk+8ZV/as2gBGwUhP84rXyLU3MbCJZOJkl61+DfsQzhA2vVqJYg8NhvqQc31TO2vmFfcAHbngxMfDhlZMTS+sBI75/yEpAk3EfEEl+PinOTJf8qJNjYnUYeMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPjh7MF4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPjh7MF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748206805; x=1779742805;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UVQpbghoGLikWoMYHWdmkTEFbU5Pl2j2w3h6WzBZe3k=;
  b=PPjh7MF4xo0Cojl46fxxj/Az4PtjFWd3/ydLszN/PHQZQiuXHAD6LzEe
   6hxamPzG3IhzqkT3Et93CAa4tO8TrFc6aL4KphhcbVzn4BQzIrwYzw4T9
   K7WoB/Ao0av9Hr6pztk7vk7odh0CK/+pu90/QFLaSC8LiYIkuCO+1g/W8
   tp9JX5hQOnSeEp9ozLyfv0ApuSGMQOjODmeXywcQVK9mwtXYkZe+p0qlL
   GWjWPfzcSzumI/733TeI1bMkuB3lItNt5xYo0d7P+gL+FM+rDSM+G72WO
   wn5PWEU60lDQQD3k513DSCKu6lHxWJooQHcRZ1z+bTHAkuT79EoM9F3Ui
   w==;
X-CSE-ConnectionGUID: CXbGm4IFQpSL4T9PlSypdQ==
X-CSE-MsgGUID: QHq3J96VTq2BwP2kb7guwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="61537064"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="61537064"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:00:04 -0700
X-CSE-ConnectionGUID: P48Ki6zGSvew3cGfCCPR6Q==
X-CSE-MsgGUID: jUfjBM/3RDWta28esQwJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="172993775"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 13:59:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 25 May 2025 23:59:55 +0300 (EEST)
To: Suma Hegde <Suma.Hegde@amd.com>, Arnd Bergmann <arnd@kernel.org>
cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
    Carlos Bilbao <carlos.bilbao@kernel.org>, 
    Yazen Ghannam <yazen.ghannam@amd.com>, 
    "Borislav Petkov (AMD)" <bp@alien8.de>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/amd/hsmp: fix building with
 CONFIG_HWMON=m
In-Reply-To: <35537263-47cf-4cc3-9808-7a93361d3ba8@amd.com>
Message-ID: <8123c1ca-f06c-8d42-7553-c0907580ef52@linux.intel.com>
References: <20250522144422.2824083-1-arnd@kernel.org> <35537263-47cf-4cc3-9808-7a93361d3ba8@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-96070654-1748206795=:933"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-96070654-1748206795=:933
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 23 May 2025, Suma Hegde wrote:

> Hi Arnd,
>=20
>=20
> On 5/22/2025 8:08 PM, Arnd Bergmann wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > When CONFIG_HWMON is built as a loadable module, the HSMP drivers
> > cannot be built-in:
> >=20
> > ERROR: modpost: "hsmp_create_sensor"
> > [drivers/platform/x86/amd/hsmp/amd_hsmp.ko] undefined!
> > ERROR: modpost: "hsmp_create_sensor"
> > [drivers/platform/x86/amd/hsmp/hsmp_acpi.ko] undefined!
> >=20
> > Enforce that through the usual Kconfig dependnecy trick.
> >=20
> > Fixes: 92c025db52bb ("platform/x86/amd/hsmp: Report power via hwmon
> > sensors")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >   drivers/platform/x86/amd/hsmp/Kconfig | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/amd/hsmp/Kconfig
> > b/drivers/platform/x86/amd/hsmp/Kconfig
> > index d6f7a62d55b5..2911120792e8 100644
> > --- a/drivers/platform/x86/amd/hsmp/Kconfig
> > +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> > @@ -12,6 +12,7 @@ menu "AMD HSMP Driver"
> >   config AMD_HSMP_ACPI
> >          tristate "AMD HSMP ACPI device driver"
> >          depends on ACPI
> > +       depends on HWMON || !HWMON
>=20
>=20
> Thanks for sending this fix.=C2=A0 I verified it.
>=20
> Along with this=C2=A0 fix, I will change IS_REACHABLE() to IS_ENABLED() i=
n hsmp.h
> as its not necessary and send v2 of this patch.
>=20
> -#if IS_REACHABLE(CONFIG_HWMON)
> +#if IS_ENABLED(CONFIG_HWMON)
> =C2=A0int hsmp_create_sensor(struct device *dev, u16 sock_ind);
> =C2=A0#else
> static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) {
> return 0; }
> #endif
>=20
> >          select AMD_HSMP
> >          help
> >            Host System Management Port (HSMP) interface is a mailbox
> > interface
> > @@ -29,6 +30,7 @@ config AMD_HSMP_ACPI
> >=20
> >   config AMD_HSMP_PLAT
> >          tristate "AMD HSMP platform device driver"
> > +       depends on HWMON || !HWMON
> >          select AMD_HSMP
> >          help
> >            Host System Management Port (HSMP) interface is a mailbox
> > interface

Hi,

I've taken Arnd's patch now as the merge window is pressing in and this=20
issue is disturbing build testing.

--=20
 i.

--8323328-96070654-1748206795=:933--
