Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49B16BE3A;
	Fri, 28 Mar 2025 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171445; cv=none; b=Zvv/N41GxxSLWNf897Lq914ffrueZvmrB07ViyE+QZ0Wl1OZXNxuwx/SBt+TGWzx8gFNZVX8YeYhQBZl8eyeOMW/Pla6ILYvh1QCxxWRikGnnSAOr45zB/HStkTdxSkVW/yJND7Otlm68WTOBk9zAg2CYUrSTBeyb5oE+/fZFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171445; c=relaxed/simple;
	bh=I/h0j6wRCZ3/U8LjbBitfUiDcjiwHZIxeoGg13dZk4g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I9GVLEApr4PoCe8U9Wlr1aQwOCs1Vt+9NvVOo2Rahis30WzvCpxLaINTtNaGO4evuMwK5UXBX00SRSSkTuSQ/J0ykLUT6b8FFfIXJ2AplzuJ/Clvwq6mcsnE0wwA/rrbNHeZLkoJ7l4xD6DXL2HGnboW9gzWXYs+bgkGKtA55n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEZvwjBj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEZvwjBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743171444; x=1774707444;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=I/h0j6wRCZ3/U8LjbBitfUiDcjiwHZIxeoGg13dZk4g=;
  b=aEZvwjBjtdvt2rOVP2vPQIss+oFNxZINhemziuADLQvo5GJum2eH1SWf
   mG0iFz12RSUGhMa7DtPxMy3xyZqHLqwSdOE7f8DAgpehUZjeCOPgx64nz
   e+dnhIUoKpem3oEDV+meC8LLNEGPnxltVAVKjNePlaNCOrZ7nkewmvXyK
   EYs8DgEyUYsBk5dNQGY/Iz7jEbaPMfaUTrQqIDxSRPbGUtFCQOYncgeEB
   HSl62IP09MAy6YrBfDUReIRowIy9vMCoXJ6uiJrcSMZGTZKB+NF3/J7nt
   I6udGSMHiEu1SihLKPCW4RmTLWue4Ul+sAW791AwFynrlkqmOb9XxWbZ7
   g==;
X-CSE-ConnectionGUID: tcqyOxzZTViBB8dUC/9mSA==
X-CSE-MsgGUID: AWR7TElhRae1ywyMR4IOsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="62067933"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="62067933"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:17:23 -0700
X-CSE-ConnectionGUID: bwTv2nRBQA2GGTmYjm9LvQ==
X-CSE-MsgGUID: E8svcWs0RAKMOZCRDYfJyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="130159642"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:17:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 16:17:17 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/12] platform/x86: alienware-wmi-wmax: Refactor
 is_awcc_thermal_mode()
In-Reply-To: <20250313-hwm-v6-2-17b57f787d77@gmail.com>
Message-ID: <be5a2029-a00f-7ed1-fb90-af1122b6f127@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-2-17b57f787d77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2100938146-1743171437=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2100938146-1743171437=:932
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Mar 2025, Kurt Borja wrote:

> Refactor is_awcc_thermal_mode() to use FIELD_GET() instead of bitwise
> operations. Drop the check for BIT(8) sensor flag and rename it to
> is_awcc_thermal_profile_id().
>=20
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 33 +++++++++++++-------=
------
>  1 file changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index ed70e12d73d7fe5d89f3364c5367820bf47e3c1e..80aefba5b22d6b4ac18aeb2ca=
356f8c911150abd 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -34,7 +34,8 @@
>  #define AWCC_FAILURE_CODE=09=09=090xFFFFFFFF
>  #define AWCC_THERMAL_TABLE_MASK=09=09=09GENMASK(7, 4)
>  #define AWCC_THERMAL_MODE_MASK=09=09=09GENMASK(3, 0)
> -#define AWCC_SENSOR_ID_MASK=09=09=09BIT(8)

I'd prefer leaving this in place even if it now becomes unused, or=20
actually I suggest you move it before the GENMASKs to keep the values in=20
order, and leave an empty row between failure code and these id related=20
masks.

> +/* Some IDs have a BIT(8) flag that we ignore */
> +#define AWCC_RESOURCE_ID_MASK=09=09=09GENMASK(7, 0)

(AWCC_THERMAL_TABLE_MASK | AWCC_THERMAL_MODE_MASK) ?
 =20
>  static bool force_platform_profile;
>  module_param_unsafe(force_platform_profile, bool, 0);
> @@ -168,8 +169,8 @@ enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
>  };
> =20
>  enum AWCC_THERMAL_TABLES {
> -=09AWCC_THERMAL_TABLE_LEGACY=09=09=3D 0x90,
> -=09AWCC_THERMAL_TABLE_USTT=09=09=09=3D 0xA0,
> +=09AWCC_THERMAL_TABLE_LEGACY=09=09=3D 0x9,
> +=09AWCC_THERMAL_TABLE_USTT=09=09=09=3D 0xA,
>  };
> =20
>  enum awcc_thermal_profile {
> @@ -445,20 +446,18 @@ const struct attribute_group wmax_deepsleep_attribu=
te_group =3D {
>   * Thermal Profile control
>   *  - Provides thermal profile control through the Platform Profile API
>   */
> -static bool is_awcc_thermal_mode(u32 code)
> +static bool is_awcc_thermal_profile_id(u8 code)
>  {
> -=09if (code & AWCC_SENSOR_ID_MASK)
> +=09u8 table =3D FIELD_GET(AWCC_THERMAL_TABLE_MASK, code);
> +=09u8 mode =3D FIELD_GET(AWCC_THERMAL_MODE_MASK, code);
> +
> +=09if (mode >=3D AWCC_PROFILE_LAST)
>  =09=09return false;
> =20
> -=09if ((code & AWCC_THERMAL_MODE_MASK) >=3D AWCC_PROFILE_LAST)
> -=09=09return false;
> -
> -=09if ((code & AWCC_THERMAL_TABLE_MASK) =3D=3D AWCC_THERMAL_TABLE_LEGACY=
 &&
> -=09    (code & AWCC_THERMAL_MODE_MASK) >=3D AWCC_PROFILE_LEGACY_QUIET)
> +=09if (table =3D=3D AWCC_THERMAL_TABLE_LEGACY && mode >=3D AWCC_PROFILE_=
LEGACY_QUIET)
>  =09=09return true;
> =20
> -=09if ((code & AWCC_THERMAL_TABLE_MASK) =3D=3D AWCC_THERMAL_TABLE_USTT &=
&
> -=09    (code & AWCC_THERMAL_MODE_MASK) <=3D AWCC_PROFILE_USTT_LOW_POWER)
> +=09if (table =3D=3D AWCC_THERMAL_TABLE_USTT && mode <=3D AWCC_PROFILE_US=
TT_LOW_POWER)
>  =09=09return true;
> =20
>  =09return false;
> @@ -548,7 +547,7 @@ static int awcc_platform_profile_get(struct device *d=
ev,
>  =09=09return 0;
>  =09}
> =20
> -=09if (!is_awcc_thermal_mode(out_data))
> +=09if (!is_awcc_thermal_profile_id(out_data))
>  =09=09return -ENODATA;
> =20
>  =09out_data &=3D AWCC_THERMAL_MODE_MASK;
> @@ -597,6 +596,7 @@ static int awcc_platform_profile_probe(void *drvdata,=
 unsigned long *choices)
>  =09u32 first_mode;
>  =09u32 out_data;
>  =09int ret;
> +=09u8 id;
> =20
>  =09ret =3D awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCR=
IPTION,
>  =09=09=09=09       0, (u32 *) &sys_desc);
> @@ -615,12 +615,13 @@ static int awcc_platform_profile_probe(void *drvdat=
a, unsigned long *choices)
>  =09=09if (ret =3D=3D -EBADRQC)
>  =09=09=09break;
> =20
> -=09=09if (!is_awcc_thermal_mode(out_data))
> +=09=09id =3D FIELD_GET(AWCC_RESOURCE_ID_MASK, out_data);
> +=09=09if (!is_awcc_thermal_profile_id(id))
>  =09=09=09continue;
> =20
> -=09=09mode =3D out_data & AWCC_THERMAL_MODE_MASK;
> +=09=09mode =3D FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
>  =09=09profile =3D awcc_mode_to_platform_profile[mode];
> -=09=09priv->supported_thermal_profiles[profile] =3D out_data;
> +=09=09priv->supported_thermal_profiles[profile] =3D id;
> =20
>  =09=09set_bit(profile, choices);
>  =09}

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2100938146-1743171437=:932--
