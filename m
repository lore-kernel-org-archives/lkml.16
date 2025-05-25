Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82AB1A3178;
	Sun, 25 May 2025 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206369; cv=none; b=gx1hQ9916nvJ18jwK9vXUprMRKZdUOoyngBjMM9NFBW+CIJLddZlsFT6WS4Pjt7ct5hqfzmNbTMQFN0JcCYAE3hPxkyh7KMUSDLu/rbXPVblnPeMTnV7ivrCiZLPnuJrBodIOMYdAFUyZ4SW2tt/WmMLEOfcrnHTS0jWFTnf1bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206369; c=relaxed/simple;
	bh=fdAnDv+w64nAvZzngYOOh1GV5frHnbKNivMHASAmyrc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oOYer6HBy4BRQwgNMwwkJ/JFiishpkTNtZAS8l4v4lFIW3cXRJpwizKIkVr1cd8mJxmcbdMZFyZwed1cJEmr2HEbFirBxcZTObk/MABB5hrG8GIKtxaszDVht586EVK0w0XH+eprd3hO+jAKiXOe1WiOJ1KyQhuoNy1gSTu3bOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVNlkfJp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVNlkfJp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748206368; x=1779742368;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fdAnDv+w64nAvZzngYOOh1GV5frHnbKNivMHASAmyrc=;
  b=CVNlkfJp8zMoRx1FnfD8YkREeXV3sWgdb4ayHf1KAINdiCOTZ5TIgMpu
   Qbl9g7peeAzBAEeWY2kDFAElw/rcPGeEeYhlTC/gY13SnQmSPJ2cjSzGu
   i3BgLCSmNZCm/WgMBo4ao8ouJ49vdrYmWYQJH8E/u/Xg47z+fc+I8uyXz
   FvVerOo3UtomM9gvK+G0wQhn2OZY4Pqs0OSj9of/bdmweJWsTy7eOUmH2
   TX2uC476mV29CVBShC03ZqCsTBmfjljdaKOctLPdEgLo65G8yufesCWz/
   Os28gAu4+8+E2RXB5e9+LIMdw2u76G681lMyONsJggakauNrkMZtlXlX0
   w==;
X-CSE-ConnectionGUID: ebsP6OYuSFqc5BTVKJycdg==
X-CSE-MsgGUID: Q2eNugkqS8yPnZsXPx7vFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="49295964"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="49295964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 13:52:47 -0700
X-CSE-ConnectionGUID: 0zcN2tXYT6i+6LniVpf4kg==
X-CSE-MsgGUID: h/k1RPxoQ3C196AgeCNsHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="141972195"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 13:52:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 25 May 2025 23:52:40 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] platform/x86: asus-wmi: fix build without
 CONFIG_SUSPEND
In-Reply-To: <5128b201-ab6e-4536-8c24-8263789a3d78@app.fastmail.com>
Message-ID: <560511d7-06da-2afb-07e2-1589a6b55a16@linux.intel.com>
References: <20250523131451.1942578-1-luke@ljones.dev> <20250523131451.1942578-2-luke@ljones.dev> <0dc0316d-a9ae-c152-3737-be1c73a415b1@linux.intel.com> <5128b201-ab6e-4536-8c24-8263789a3d78@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1695216397-1748206360=:933"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1695216397-1748206360=:933
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 23 May 2025, Luke Jones wrote:

> On Fri, 23 May 2025, at 3:25 PM, Ilpo J=C3=A4rvinen wrote:
> > On Fri, 23 May 2025, Luke Jones wrote:
> >
> >> The patch "Refactor Ally suspend/resume" introduced an
> >
> > The commit feea7bd6b02d ("...")
> >
> >> acpi_s2idle_dev_ops for use with ROG Ally which caused a build error
> >> if CONFIG_SUSPEND was not defined.
> >>=20
> >> Signed-off-by: Luke Jones <luke@ljones.dev>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe4i-lk=
p@intel.com/
> >> Fixes: feea7bd6b02d ("platform/x86: asus-wmi: Refactor Ally suspend/re=
sume")
> >> ---
> >>  drivers/platform/x86/asus-wmi.c | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>=20
> >> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/as=
us-wmi.c
> >> index 27f11643a00d..087318e0d595 100644
> >> --- a/drivers/platform/x86/asus-wmi.c
> >> +++ b/drivers/platform/x86/asus-wmi.c
> >> @@ -5005,6 +5005,7 @@ static int asus_hotk_restore(struct device *devi=
ce)
> >>  =09return 0;
> >>  }
> >> =20
> >> +#if defined(CONFIG_SUSPEND)
> >>  static void asus_ally_s2idle_restore(void)
> >>  {
> >>  =09if (use_ally_mcu_hack =3D=3D ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
> >> @@ -5013,6 +5014,7 @@ static void asus_ally_s2idle_restore(void)
> >>  =09=09msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> >>  =09}
> >>  }
> >> +#endif /* CONFIG_SUSPEND */
> >
> > Move this function below asus_hotk_prepare() next to ops, so that only =
one=20
> > #if block is needed for them.
> >
>=20
> Done
>=20
> >> =20
> >>  static int asus_hotk_prepare(struct device *device)
> >>  {
> >> @@ -5025,9 +5027,11 @@ static int asus_hotk_prepare(struct device *dev=
ice)
> >>  }
> >> =20
> >>  /* Use only for Ally devices due to the wake_on_ac */
> >> +#if defined(CONFIG_SUSPEND)
> >>  static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops =3D {
> >>  =09.restore =3D asus_ally_s2idle_restore,
> >>  };
> >> +#endif /* CONFIG_SUSPEND */
> >> =20
> >>  static const struct dev_pm_ops asus_pm_ops =3D {
> >>  =09.thaw =3D asus_hotk_thaw,
> >> @@ -5060,9 +5064,11 @@ static int asus_wmi_probe(struct platform_devic=
e *pdev)
> >>  =09=09=09return ret;
> >>  =09}
> >> =20
> >> +=09#if defined(CONFIG_SUSPEND)
> >>  =09ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> >>  =09if (ret)
> >>  =09=09pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> >> +=09#endif /* CONFIG_SUSPEND */
> >> =20
> >>  =09return asus_wmi_add(pdev);
> >>  }
> >> @@ -5096,7 +5102,10 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
> >> =20
> >>  void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
> >>  {
> >> +=09#if defined(CONFIG_SUSPEND)
> >>  =09acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
> >> +=09#endif /* CONFIG_SUSPEND */
> >
> > I'd have preferred these reg/unreg be solved with wrappers (see=20
> > pmc_atom.c).
>=20
> Can do, but I don't really understand the difference it makes in this con=
text. Should I log that  CONFIG_SUSPEND was not enabled? Otherwise it's jus=
t as good as not there, right?

I just want to limit the use of ifdeffery to minimum and prefer using=20
#else + a stub over sprinkling ifdefs all over the place. And it's=20
orthogonal whether the CONFIG_SUSPEND=3Dn should print a warning or not.

I'll take the v3.

--=20
 i.

--8323328-1695216397-1748206360=:933--
