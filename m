Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494117F7;
	Fri, 28 Mar 2025 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166286; cv=none; b=CBumvwSJMwGkSRe4/7FglHC9/bTWoi4Q5GTLBT2ALmTrU2/YhYuCs37MVymX8Fj68pV/0yu+uIvhD775+Dr9ZwOoRJKHYc9BHsi1+7+4gOWsor1OIU/kJvVGGVe+9hHfLFYbusbGC8133155XpNRO7wAaYR2pFUcJ4xO/UAFo8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166286; c=relaxed/simple;
	bh=L9uRCBTtAq/5vxPmFIj3Qbha6jlMxixiT8o9nF6PwNs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uHjaCKTKhMmRCn76PmIzgK00dDH5DfndWeoiw7gmoXOMGm+Hr6Mcr36IOVrIhM1+ICvuX/Zbhtnh0EdeW/LsKbuBLDL1zNHGLnnm3mUB5bsB0ehIa3zIr3uPR9DFl9LWkZn8UOX17LDpe6JMoEocQCYRs87xlwH96GLENaZT8r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBzcyOlh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBzcyOlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743166285; x=1774702285;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=L9uRCBTtAq/5vxPmFIj3Qbha6jlMxixiT8o9nF6PwNs=;
  b=JBzcyOlhG4xi6IKeFhUskHuT6Igqikcy80nZEV3NQmDUU6HcU8MvLaWg
   0PpS6J4lSUPAPStTZA70NC0hsU8QFeqVi39Cd2heudWeSkRnAjAhE123o
   C/+SLYx5/3s0cn8eGF2YRCXMzLMJ/dbxt4+GCLEccHuHTptM2uK+wQ43I
   z0Mg7t4+EFFvElx1i/++Ji4pBnRq/bcQ1Rggl/QmhNsDr/f+Wn5dz51ws
   bZ1fj7ohb/sXRtDvmHeRiwZ/G7drU86fuH95f89R16PPSxcErmy6KH/kZ
   PtV2ltS58S7TfB7RPqsdxM/iFNL/U1jKG90JMpbfygo6tGNzOOnSOx5NQ
   A==;
X-CSE-ConnectionGUID: eDBi6YzmSf+GuKalYcBiYg==
X-CSE-MsgGUID: kFRFUwpAT8erU373bg0Daw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44632436"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44632436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:51:16 -0700
X-CSE-ConnectionGUID: w41OFN2PTOi+L+xJ7Pjyhg==
X-CSE-MsgGUID: rBUmKlywQBeDkwQswXEhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="148616440"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:51:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 14:51:09 +0200 (EET)
To: =?ISO-8859-15?Q?Ga=A8per_Nemgar?= <gasper.nemgar@gmail.com>, 
    Hans de Goede <hdegoede@redhat.com>
cc: ikepanhc@gmail.com, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: added support for some
 new buttons
In-Reply-To: <20250328115107.110619-1-gasper.nemgar@gmail.com>
Message-ID: <a619a8bf-3d71-5b22-3ced-b0f9de95cc77@linux.intel.com>
References: <20250328115107.110619-1-gasper.nemgar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-15274290-1743166269=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-15274290-1743166269=:932
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 28 Mar 2025, Ga=C5=A1per Nemgar wrote:

> Added entries to unsuported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify in order to get wmi code 0x13d to trigger pla=
tform_profile_cycle
>=20
> Signed-off-by: Ga=C5=A1per Nemgar <gasper.nemgar@gmail.com>"
> ---
> Changes in v3:
>  - Minor changes
> Changes in v2:
>  - Added more codes that trigger with key combos (Fn+N, Fn+M, ...)
>  - Added performence toggle in wmi_notify()
> Changes in v1:
>  - Added codes for buttons on laptop(performance, star, ...)
> ---
>  drivers/platform/x86/ideapad-laptop.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86=
/ideapad-laptop.c
> index 17a09b778..8f8764554 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] =3D=
 {
>  =09/* Specific to some newer models */
>  =09{ KE_KEY,=090x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  =09{ KE_KEY,=090x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +=09/* Star- (User Asignable Key) */
> +=09{ KE_KEY,=090x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +=09/* Eye */
> +=09{ KE_KEY,=090x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> +=09/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() =
*/
> +=09{ KE_KEY,=090x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },

This doesn't fully address Hans' comment, please reread his comment=20
carefully:

https://lore.kernel.org/all/c487c00c-2900-42cf-b83b-08c5e1b866e1@redhat.com=
/

> +=09/* shift + prtsc */
> +=09{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +=09{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> +=09{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
> =20
>  =09{ KE_END },
>  };
> @@ -2080,6 +2090,14 @@ static void ideapad_wmi_notify(struct wmi_device *=
wdev, union acpi_object *data)
>  =09=09dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>  =09=09=09data->integer.value);
> =20
> +=09=09/* performance button triggered by 0x3d  */
> +=09=09if (data->integer.value =3D=3D 0x3d) {
> +=09=09=09if (priv->dytc) {
> +=09=09=09=09platform_profile_cycle();
> +=09=09=09=09break;
> +=09=09=09}
> +=09=09}
> +
>  =09=09/* 0x02 FnLock, 0x03 Esc */
>  =09=09if (data->integer.value =3D=3D 0x02 || data->integer.value =3D=3D =
0x03)
>  =09=09=09ideapad_fn_lock_led_notify(priv, data->integer.value =3D=3D 0x0=
2);
>=20

--=20
 i.

--8323328-15274290-1743166269=:932--
