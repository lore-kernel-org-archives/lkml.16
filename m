Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D335F239586;
	Thu, 17 Apr 2025 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889302; cv=none; b=k6H7FyBTMidi+1W/DHtB2HqQLNYe6F2vXzlA3hB9hXGbRV08pbTxD3pcsHjU4qmOi1f3Phtifsxqp0nsayR4a4zCzJPP6Ii0VLfIPbnMRBjjsx5I9pC0t3USldmn5UBfRFF5rBjD0jglGsA3bsfJe79BENQ9AqaRbK6+T9q7Ix0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889302; c=relaxed/simple;
	bh=cs4O7XXFIy6Qc3WN5GJl6FjUSo/LOyNVrBmbU74T9W8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Eegwqt75Zle+mpaWUFLPK52hpmP0cQQPd05hOUP+96eQGQu3FZBe/VQQMuvi8pkVnmg8ALPbpllN0ZahjvqTHDyyWpWTZdOoL1s+gE6eKOutbqjUDurKOyNL5O3s46oc1CZfOC8zeclYX2x0hyqO1qhXFXOp/gAo6KHXBLPbXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wnf3ZZx9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wnf3ZZx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744889301; x=1776425301;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=cs4O7XXFIy6Qc3WN5GJl6FjUSo/LOyNVrBmbU74T9W8=;
  b=Wnf3ZZx9WPDi757oj6/7J+KPXEgb+CIPaqrzyeKAFEL0FfUbwiqNjYTV
   hTTMHNi7AcZmjBLaJ6ybb+bR74Heml3eBHClEhyRnhENpULR/R5H2/j3h
   MU3+zj4BZwBNMB5g3s6Z7AoixyQHFIMpNEyVzgOhHuBh+FCT9C4hkUPYC
   4QdcoS89d30zIGTx3NezX04iWJW6SpSaRY2dQzVAifCX3dX8/IvD/+E/k
   i05uALoCzXxOJvHq2yRntERXvuGVyy5+sNa9Ooru8jrTrDHXMArq6altS
   BVhyfa+nTlfmFIrWnEwlHxs8Quo/Y5qKn1nDLAE9rNzIP7Pquj3tAPXSO
   Q==;
X-CSE-ConnectionGUID: GpqEMqyHTtuiKmTe8+U1OA==
X-CSE-MsgGUID: //MzNYTBShqEqWxBbLrGUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71857776"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71857776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:28:19 -0700
X-CSE-ConnectionGUID: tiZUrZo7Q0KQWiJXhKJiWA==
X-CSE-MsgGUID: TChb/UyMSBqrW2AVN4YZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135589771"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:28:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Apr 2025 14:28:13 +0300 (EEST)
To: =?ISO-8859-15?Q?Ga=A8per_Nemgar?= <gasper.nemgar@gmail.com>
cc: ikepanhc@gmail.com, Hans de Goede <hdegoede@redhat.com>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCHv5] platform/x86: ideapad-laptop: added support for some
 new buttons
In-Reply-To: <20250417112425.107749-1-gasper.nemgar@gmail.com>
Message-ID: <c024e668-1eb4-255b-d1e3-60ee46e759cd@linux.intel.com>
References: <20250417112425.107749-1-gasper.nemgar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-859231818-1744889216=:939"
Content-ID: <53167a7b-a489-1cd5-4940-bbb25f6fd7ba@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-859231818-1744889216=:939
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <40ba1a2f-0101-88ce-6e52-187b776115ca@linux.intel.com>

On Thu, 17 Apr 2025, Ga=A8per Nemgar wrote:

> Signed-off-by: Ga=A8per Nemgar <gasper.nemgar@gmail.com>"

This too seems wrong. Using git send-email might be helpful as it can send=
=20
directly the file from git format-patch.

> ---
> Changes in v5:
>  - Changed performance button to KE_KEY=20
> Changes in v4:
>  - Changed performace button to KE_IGNORE
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
> index 17a09b778..320ce9d2d 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] =3D=
 {
>  =09/* Specific to some newer models */
>  =09{ KE_KEY,=090x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  =09{ KE_KEY,=090x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +=09/* Star- (User Assignable Key) */
> +=09{ KE_KEY,=090x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +=09/* Eye */
> +=09{ KE_KEY,=090x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> +=09/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() =
*/
> +=09{ KE_IGNORE,=090x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
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
> +=09=09/* performance button triggered by 0x3d */
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
--8323328-859231818-1744889216=:939--
