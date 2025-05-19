Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782FE6AD3;
	Mon, 19 May 2025 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666307; cv=none; b=lrUv70NMyYYYoveop2Og2DRbpYEXWMa2kLu0EI9l56KzY8HPKlu9F8wOqAsYkRIGOUOYiRAqvayaHwF4q7ulphLouhfxdnr5bMjOwopVliqaVBpXe+YgrIyy/q/cMM3D7mo9qhz28K7iQU9eZuEJTkcbzaPgYoX+VoTC3Zin+jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666307; c=relaxed/simple;
	bh=U5FB9cb2SHXZqHfU3RXssHvEXCVpVdPrUMPxJ9YmJsk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g2gjcIDH7Q/q0VlklHP/wDoRj6WTJVOaUiXchHvTqOz/wczgu3Ag13ADNW6OTNwhPwZuPxjbIs33wJnKD2txdCtQcM5pDVnEwjL+jSGt7pmcFPIsTkSdQlzzu66SCVzBnLRksMRnUWP3egZjvvkJao1rNklgI5j+Sadrw4gIkN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAPSZOLW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAPSZOLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747666306; x=1779202306;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U5FB9cb2SHXZqHfU3RXssHvEXCVpVdPrUMPxJ9YmJsk=;
  b=VAPSZOLWYv6rGrdbRTQ06t8C2JI30FpjVg1gq6Duz1MiGbdAaieN6ge3
   7z3iMRSm8/aGlJNQLBoQqPkrgo+yn5056Ry8sxhNc9pRm/H2msb3vArRq
   wOdA/16ifdepR4syhuf4lgQdIsyopNXfTsBW/bYRXSw+gAelzm0LwW4kT
   qT3oIU0zktoOr40FBjPaYgYjUXvjAxskwpBkM/CLkCFr5oRraAEYS6SnJ
   C/huFZWeZef2mlKmoLpSUL/aS9xVwwxSFx+amMo56hQC6MuTYsojrgEnK
   m7QyWR1oboEIfVbynaARbQrLYVbHTxvu1QB4j4pRM38eVH4DYzKP9zgwu
   Q==;
X-CSE-ConnectionGUID: yM9xqkzMQZCWIcH5ML9hMw==
X-CSE-MsgGUID: uQWnl49rTXOl/iCt4fDQ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="66983156"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="66983156"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:51:45 -0700
X-CSE-ConnectionGUID: 97KtGNq3R8ifMJ977IxJcg==
X-CSE-MsgGUID: ApwPRpLzSRKLYFrErkt5kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139909615"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:51:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 17:51:39 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: Hans de Goede <hdegoede@redhat.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: think-lmi: Fix attribute name usage for
 non-compliant items
In-Reply-To: <2072677c-069a-4e5a-9648-4c874d390712@app.fastmail.com>
Message-ID: <36cfd497-b8c3-8b93-4301-869f0b95a7e7@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20250517023825.2968200-1-mpearson-lenovo@squebb.ca> <0fbeced8-a225-4151-dda5-086490f8345a@linux.intel.com> <2072677c-069a-4e5a-9648-4c874d390712@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-590887510-1747666299=:928"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-590887510-1747666299=:928
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Mark Pearson wrote:

> Hi Ilpo,
>=20
> Thanks for the review
>=20
> On Mon, May 19, 2025, at 8:56 AM, Ilpo J=C3=A4rvinen wrote:
> > On Fri, 16 May 2025, Mark Pearson wrote:
> >
> >> A few, quite rare, WMI attributes have names that are not compatible w=
ith
> >> filenames. e.g. "Intel VT for Directed I/O (VT-d)".
> >
> > filenames. -> filenames,
>=20
> OK.
>=20
> >
> >> For these cases the '/' gets replaced with '\' for display, but doesn'=
t
> >> get switched again when doing the WMI access.
> >>=20
> >> Fix this by keeping the original attribute name and using that for sen=
ding
> >> commands to the BIOS
> >>=20
> >> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >
> > Fixes tag?
>=20
> This has been wrong since the very first implementation. I considered=20
> adding a fixes for the first commit, but wasn't sure that was=20
> reasonable.  Let me know if it should be added - I was a bit worried=20
> about triggering other work for the stable maintainers.=20

Please point Fixes into the first commit then. The first commit is no=20
different or special in that sense and can fixed like any other commit.

If it fails to apply, stable maintainers just drop the patch and send a=20
notification to you and you can provide the backported patch (AFAIK, they=
=20
won't track that, so if you don't provide a backport, nothing happens=20
beyond that). They won't try to backport them themselves if a patch=20
conflicts.

--=20
 i.

> >>  drivers/platform/x86/think-lmi.c | 27 +++++++++++++++------------
> >>  drivers/platform/x86/think-lmi.h |  1 +
> >>  2 files changed, 16 insertions(+), 12 deletions(-)
> >>=20
> >> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/t=
hink-lmi.c
> >> index 0fc275e461be..be01085055a1 100644
> >> --- a/drivers/platform/x86/think-lmi.c
> >> +++ b/drivers/platform/x86/think-lmi.c
> >> @@ -137,6 +137,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug comm=
and support");
> >>   * You must reboot the computer before the changes will take effect.
> >>   */
> >>  #define LENOVO_CLEAR_BIOS_CERT_GUID  "B2BC39A7-78DD-4D71-B059-A510DEC=
44890"
> >> +
> >>  /*
> >>   * Name: CertToPassword
> >>   * Description: Switch from certificate to password authentication.
> >
> > An unrelated change.
>=20
> Ah - my bad. I've been working on another patch (unrelated to this) and=
=20
> this change crept in when I removed those changes.=20
>=20
> >
> >> @@ -1061,8 +1062,8 @@ static ssize_t current_value_store(struct kobjec=
t *kobj,
> >>  =09=09=09ret =3D -EINVAL;
> >>  =09=09=09goto out;
> >>  =09=09}
> >> -=09=09set_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_=
name,
> >> -=09=09=09=09=09new_setting, tlmi_priv.pwd_admin->signature);
> >> +=09=09set_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s", setting->name,
> >> +=09=09=09=09    new_setting, tlmi_priv.pwd_admin->signature);
> >>  =09=09if (!set_str) {
> >>  =09=09=09ret =3D -ENOMEM;
> >>  =09=09=09goto out;
> >> @@ -1092,7 +1093,7 @@ static ssize_t current_value_store(struct kobjec=
t *kobj,
> >>  =09=09=09=09goto out;
> >>  =09=09}
> >> =20
> >> -=09=09set_str =3D kasprintf(GFP_KERNEL, "%s,%s;", setting->display_na=
me,
> >> +=09=09set_str =3D kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
> >>  =09=09=09=09    new_setting);
> >>  =09=09if (!set_str) {
> >>  =09=09=09ret =3D -ENOMEM;
> >> @@ -1120,11 +1121,11 @@ static ssize_t current_value_store(struct kobj=
ect *kobj,
> >>  =09=09}
> >> =20
> >>  =09=09if (auth_str)
> >> -=09=09=09set_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s", setting->displ=
ay_name,
> >> -=09=09=09=09=09new_setting, auth_str);
> >> +=09=09=09set_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s", setting->name,
> >> +=09=09=09=09=09    new_setting, auth_str);
> >>  =09=09else
> >> -=09=09=09set_str =3D kasprintf(GFP_KERNEL, "%s,%s;", setting->display=
_name,
> >> -=09=09=09=09=09new_setting);
> >> +=09=09=09set_str =3D kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
> >> +=09=09=09=09=09    new_setting);
> >>  =09=09if (!set_str) {
> >>  =09=09=09ret =3D -ENOMEM;
> >>  =09=09=09goto out;
> >> @@ -1629,9 +1630,6 @@ static int tlmi_analyze(struct wmi_device *wdev)
> >>  =09=09=09continue;
> >>  =09=09}
> >> =20
> >> -=09=09/* It is not allowed to have '/' for file name. Convert it into=
 '\'. */
> >> -=09=09strreplace(item, '/', '\\');
> >> -
> >>  =09=09/* Remove the value part */
> >>  =09=09strreplace(item, ',', '\0');
> >> =20
> >> @@ -1644,11 +1642,16 @@ static int tlmi_analyze(struct wmi_device *wde=
v)
> >>  =09=09}
> >>  =09=09setting->wdev =3D wdev;
> >>  =09=09setting->index =3D i;
> >> +
> >> +=09=09strscpy(setting->name, item);
> >> +=09=09/* It is not allowed to have '/' for file name. Convert it into=
 '\'. */
> >> +=09=09strreplace(item, '/', '\\');
> >>  =09=09strscpy(setting->display_name, item);
> >> +
> >>  =09=09/* If BIOS selections supported, load those */
> >>  =09=09if (tlmi_priv.can_get_bios_selections) {
> >> -=09=09=09ret =3D tlmi_get_bios_selections(setting->display_name,
> >> -=09=09=09=09=09&setting->possible_values);
> >> +=09=09=09ret =3D tlmi_get_bios_selections(setting->name,
> >> +=09=09=09=09=09=09       &setting->possible_values);
> >>  =09=09=09if (ret || !setting->possible_values)
> >>  =09=09=09=09pr_info("Error retrieving possible values for %d : %s\n",
> >>  =09=09=09=09=09=09i, setting->display_name);
> >> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/t=
hink-lmi.h
> >> index a80452482227..9b014644d316 100644
> >> --- a/drivers/platform/x86/think-lmi.h
> >> +++ b/drivers/platform/x86/think-lmi.h
> >> @@ -90,6 +90,7 @@ struct tlmi_attr_setting {
> >>  =09struct kobject kobj;
> >>  =09struct wmi_device *wdev;
> >>  =09int index;
> >> +=09char name[TLMI_SETTINGS_MAXLEN];
> >>  =09char display_name[TLMI_SETTINGS_MAXLEN];
> >>  =09char *possible_values;
> >>  };
> >>=20
> >
> > --=20
> >  i.
>=20
> Please confirm on if the fixes tag is needed or not, and I'll do v2 with=
=20
> those minor changes
>=20
> Thanks
> Mark
>=20
--8323328-590887510-1747666299=:928--
