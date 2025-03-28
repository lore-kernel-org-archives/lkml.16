Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C71BBBD4;
	Fri, 28 Mar 2025 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174366; cv=none; b=qQufI8SnGQ61+muUAJK2OLfODRJRSj1AuWkMBjQIsJ/Cbk+Y1JyYvhu/kPMlw4OSH9g68KpslFsL6iPe4eoVsrGUErABdBu1YwcZMaNOBjs5ER9JyEqaj1Bzw0JoddtrrOKxKaeNzFWM7vdiSP/YE4mcKIcQypUWIDcFoFB3ywQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174366; c=relaxed/simple;
	bh=4vH685Tb4jxWzrnxI4M3J8jAnCKnkC0Y5Nt7TGHd7oE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ykro8tXKnQhOWGG0TEVJcAWk4vHPSwb2rx9ZzmaP+HxyzN9V2mJn5omq1KTB+ZQ8UlqIs/eRQRUcQndMtfdBbI5Ffv1iAasvcbVrsikmQ172JmE6nFAZ9WF3dI0SbYaJz229B/yk2aojcy7QJuA+cGfhp0ZsRarsCez/+9k6LOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Crxb7MXM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Crxb7MXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743174363; x=1774710363;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4vH685Tb4jxWzrnxI4M3J8jAnCKnkC0Y5Nt7TGHd7oE=;
  b=Crxb7MXMdmaoFSsRPFAQ1vQ7mQ8cIZaTUpr/cM4wQnuH5mJ04qmarpXA
   NbUNpEawBVNLFGmRQiwBHOqSD3jvyW/bvPGG/OnjO3v7GcRnwEgRB8H/B
   j+qDcXcS/gM8g6MudYe8Gtd+moqsn+s43gcY8kNEKHl1JoPp8vmnZTQwT
   yVHn2SlKEl/emf/w2D5K51dJbFmNBTRk/T6x85ET7vwcdSyjmGAKtq+d0
   /T/qlk3dB1BIFeZ6DQYKUdLhKpNyXM0fjR/vCKvseBx1A/I8A6HxqNg9z
   4t6ior01v7Yt9O0U1//rBqGxOW0b+dWkMryYMmYsJEUYm3r58j0SgnIoi
   A==;
X-CSE-ConnectionGUID: orIqwZHwQYSBBatl1YANAA==
X-CSE-MsgGUID: PuJDPE1eQNiQExLrkKD9ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55907940"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55907940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 08:06:02 -0700
X-CSE-ConnectionGUID: Rp8CfLZlRrGJrur5w3IiuA==
X-CSE-MsgGUID: HKeOa/r6RSW9p2/4u62Hzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125230667"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 08:06:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 17:05:56 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 06/12] platform/x86: alienware-wmi-wmax: Add support
 for the "custom" thermal profile
In-Reply-To: <20250313-hwm-v6-6-17b57f787d77@gmail.com>
Message-ID: <44ee0740-b47b-0980-e5c7-27cb94a772d9@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-6-17b57f787d77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1614277634-1743174356=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1614277634-1743174356=:932
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Mar 2025, Kurt Borja wrote:

> All models with the "AWCC" WMAX device support a "custom" thermal
> profile. In some models this profile signals user-space that the user
> wants to manually control the fans, which are always unlocked. In other
> models it actually unlocks manual fan control.
>=20
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 23 +++++++++++++++++++-=
---
>  1 file changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index 0530f25b956f73f47c0354f40dac2910448c894e..3b37e4456482bc284b8e867c1=
c5b6255fc6c8ef2 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -29,8 +29,6 @@
>  #define AWCC_METHOD_THERMAL_CONTROL=09=090x15
>  #define AWCC_METHOD_GAME_SHIFT_STATUS=09=090x25
> =20
> -#define AWCC_THERMAL_MODE_GMODE=09=09=090xAB
> -
>  #define AWCC_FAILURE_CODE=09=09=090xFFFFFFFF
>  #define AWCC_FAILURE_CODE_2=09=09=090xFFFFFFFE
>  #define AWCC_THERMAL_TABLE_MASK=09=09=09GENMASK(7, 4)
> @@ -177,6 +175,11 @@ enum AWCC_THERMAL_TABLES {
>  =09AWCC_THERMAL_TABLE_USTT=09=09=09=3D 0xA,
>  };
> =20
> +enum AWCC_SPECIAL_THERMAL_CODES {
> +=09AWCC_SPECIAL_PROFILE_CUSTOM=09=09=3D 0x00,
> +=09AWCC_SPECIAL_PROFILE_GMODE=09=09=3D 0xAB,
> +};
> +
>  enum awcc_thermal_profile {
>  =09AWCC_PROFILE_USTT_BALANCED,
>  =09AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
> @@ -589,9 +592,15 @@ static int awcc_platform_profile_get(struct device *=
dev,
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09if (out_data =3D=3D AWCC_THERMAL_MODE_GMODE) {
> +=09switch (out_data) {
> +=09case AWCC_SPECIAL_PROFILE_CUSTOM:
> +=09=09*profile =3D PLATFORM_PROFILE_CUSTOM;
> +=09=09return 0;
> +=09case AWCC_SPECIAL_PROFILE_GMODE:
>  =09=09*profile =3D PLATFORM_PROFILE_PERFORMANCE;
>  =09=09return 0;
> +=09default:
> +=09=09break;
>  =09}
> =20
>  =09if (!is_awcc_thermal_profile_id(out_data))
> @@ -679,11 +688,17 @@ static int awcc_platform_profile_probe(void *drvdat=
a, unsigned long *choices)
> =20
>  =09if (awcc->gmode) {
>  =09=09priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
> -=09=09=09AWCC_THERMAL_MODE_GMODE;
> +=09=09=09AWCC_SPECIAL_PROFILE_GMODE;
> =20
>  =09=09__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>  =09}
> =20
> +=09/* Every model supports the "custom" profile */
> +=09priv->supported_profiles[PLATFORM_PROFILE_CUSTOM] =3D
> +=09=09AWCC_SPECIAL_PROFILE_CUSTOM;
> +
> +=09__set_bit(PLATFORM_PROFILE_CUSTOM, choices);
> +
>  =09return 0;
>  }
> =20
>=20
>=20
--8323328-1614277634-1743174356=:932--
