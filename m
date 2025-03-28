Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430B2C9A;
	Fri, 28 Mar 2025 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170566; cv=none; b=NK+EkHzPLEG/aXieZYip0rM8DII8y6+QRZ4z5/MiMn0Wun3u+KGYzJhNsRfsd49j0f2DW3+WFDG4CcdDKoO9ohCfC7CFzwTcr/Rw20cdDOn9TAvraUxFQPLYQK2MYheM4xzIZWV8MdbtdeVrZ29mMFSMq1pxFSymGwev2MtpCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170566; c=relaxed/simple;
	bh=nlYYEWBQMCeOE61SbM1GGp8VG9KGxxi30BBhoNGMW7A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sgn3qSNz/BPpfDdzkrJksC0cZABnz9pSn4/Zfo+MDCwFjhkgU4w4E9ecwnJKevq9eueLUVKCvPEGXGSegg3usKB3ruWKY/oKBupxRwyK2TpD1ro5n9hKjOV3F0hPt4nHV7JgQz4tKlI2svCCBlTJe+3r4Y8o/UWgMQgcTEs60NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVGpj2SV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVGpj2SV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743170564; x=1774706564;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nlYYEWBQMCeOE61SbM1GGp8VG9KGxxi30BBhoNGMW7A=;
  b=LVGpj2SVoa5IiErPhAp+SoqtQn5Yqm7dDgy28wBtmTqaUSR865ymrk2Q
   SvAkeK7PN0uWEfE93Am5do7QrC2QA/Hwn6lTzljJwYeioERMxM7are17c
   Teww+UgMrIP8eyEOUnMoCyi8/RpX4C+16X1yf2UC0pi0dok3s+/El/4eA
   RrGOSAiFMkECQCY+y8XDUOibUq2gjZDEgavF/k7Xea1OD+wRQ+USiTweR
   U0CdIHej4WfiPhvLlRl36uDk9qIjqeknbnJ7rGMFOoLxucmneT59tc+1H
   m30QNugdDIJ5lGQwwxHlpJ12l5zv/oZ1X7YYv1R/jxAiXFS7umHN58QBr
   g==;
X-CSE-ConnectionGUID: tjxraiH+S46BUv/z+gxp7g==
X-CSE-MsgGUID: fh040ytoRWG/uszrrfevtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="32134471"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="32134471"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:02:44 -0700
X-CSE-ConnectionGUID: +K2qMGG3Qv+l8z3ySYza1g==
X-CSE-MsgGUID: 7QtwsSITQfepydJgdn02KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="130308483"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:02:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 16:02:37 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/12] platform/x86: alienware-wmi-wmax: Rename thermal
 related symbols
In-Reply-To: <20250313-hwm-v6-1-17b57f787d77@gmail.com>
Message-ID: <474a861e-284e-fa15-5338-31d1c32ec37b@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-1-17b57f787d77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1260473303-1743170557=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1260473303-1743170557=:932
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Mar 2025, Kurt Borja wrote:

> The "thermal" features of the WMAX WMI device are only present on the
> host device if the ACPI _UID is "AWCC". Replace WMAX prefixes with
> "AWCC" to reflect this relationship.
>=20
> Thermal profiles with WMAX_PROFILE_BASIC prefix are also renamed to
> WMAX_PROFILE_LEGACY because they are only supported in older versions
> of this WMI device.
>=20
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

I note though that this also renames OPERATION -> OP, which is fine, it=20
just wasn't mentioned.

--=20
 i.


> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 173 +++++++++++++------=
------
>  1 file changed, 87 insertions(+), 86 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index 3d3014b5adf046c94c1ebf39a0e28a92622b40d6..ed70e12d73d7fe5d89f3364c5=
367820bf47e3c1e 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -24,16 +24,17 @@
>  #define WMAX_METHOD_DEEP_SLEEP_STATUS=09=090x0C
>  #define WMAX_METHOD_BRIGHTNESS=09=09=090x3
>  #define WMAX_METHOD_ZONE_CONTROL=09=090x4
> -#define WMAX_METHOD_THERMAL_INFORMATION=09=090x14
> -#define WMAX_METHOD_THERMAL_CONTROL=09=090x15
> -#define WMAX_METHOD_GAME_SHIFT_STATUS=09=090x25
> =20
> -#define WMAX_THERMAL_MODE_GMODE=09=09=090xAB
> +#define AWCC_METHOD_THERMAL_INFORMATION=09=090x14
> +#define AWCC_METHOD_THERMAL_CONTROL=09=090x15
> +#define AWCC_METHOD_GAME_SHIFT_STATUS=09=090x25
> =20
> -#define WMAX_FAILURE_CODE=09=09=090xFFFFFFFF
> -#define WMAX_THERMAL_TABLE_MASK=09=09=09GENMASK(7, 4)
> -#define WMAX_THERMAL_MODE_MASK=09=09=09GENMASK(3, 0)
> -#define WMAX_SENSOR_ID_MASK=09=09=09BIT(8)
> +#define AWCC_THERMAL_MODE_GMODE=09=09=090xAB
> +
> +#define AWCC_FAILURE_CODE=09=09=090xFFFFFFFF
> +#define AWCC_THERMAL_TABLE_MASK=09=09=09GENMASK(7, 4)
> +#define AWCC_THERMAL_MODE_MASK=09=09=09GENMASK(3, 0)
> +#define AWCC_SENSOR_ID_MASK=09=09=09BIT(8)
> =20
>  static bool force_platform_profile;
>  module_param_unsafe(force_platform_profile, bool, 0);
> @@ -151,38 +152,38 @@ static const struct dmi_system_id awcc_dmi_table[] =
__initconst =3D {
>  =09},
>  };
> =20
> -enum WMAX_THERMAL_INFORMATION_OPERATIONS {
> -=09WMAX_OPERATION_SYS_DESCRIPTION=09=09=3D 0x02,
> -=09WMAX_OPERATION_LIST_IDS=09=09=09=3D 0x03,
> -=09WMAX_OPERATION_CURRENT_PROFILE=09=09=3D 0x0B,
> +enum AWCC_THERMAL_INFORMATION_OPERATIONS {
> +=09AWCC_OP_GET_SYSTEM_DESCRIPTION=09=09=3D 0x02,
> +=09AWCC_OP_GET_RESOURCE_ID=09=09=09=3D 0x03,
> +=09AWCC_OP_GET_CURRENT_PROFILE=09=09=3D 0x0B,
>  };
> =20
> -enum WMAX_THERMAL_CONTROL_OPERATIONS {
> -=09WMAX_OPERATION_ACTIVATE_PROFILE=09=09=3D 0x01,
> +enum AWCC_THERMAL_CONTROL_OPERATIONS {
> +=09AWCC_OP_ACTIVATE_PROFILE=09=09=3D 0x01,
>  };
> =20
> -enum WMAX_GAME_SHIFT_STATUS_OPERATIONS {
> -=09WMAX_OPERATION_TOGGLE_GAME_SHIFT=09=3D 0x01,
> -=09WMAX_OPERATION_GET_GAME_SHIFT_STATUS=09=3D 0x02,
> +enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
> +=09AWCC_OP_TOGGLE_GAME_SHIFT=09=09=3D 0x01,
> +=09AWCC_OP_GET_GAME_SHIFT_STATUS=09=09=3D 0x02,
>  };
> =20
> -enum WMAX_THERMAL_TABLES {
> -=09WMAX_THERMAL_TABLE_BASIC=09=09=3D 0x90,
> -=09WMAX_THERMAL_TABLE_USTT=09=09=09=3D 0xA0,
> +enum AWCC_THERMAL_TABLES {
> +=09AWCC_THERMAL_TABLE_LEGACY=09=09=3D 0x90,
> +=09AWCC_THERMAL_TABLE_USTT=09=09=09=3D 0xA0,
>  };
> =20
> -enum wmax_thermal_mode {
> -=09THERMAL_MODE_USTT_BALANCED,
> -=09THERMAL_MODE_USTT_BALANCED_PERFORMANCE,
> -=09THERMAL_MODE_USTT_COOL,
> -=09THERMAL_MODE_USTT_QUIET,
> -=09THERMAL_MODE_USTT_PERFORMANCE,
> -=09THERMAL_MODE_USTT_LOW_POWER,
> -=09THERMAL_MODE_BASIC_QUIET,
> -=09THERMAL_MODE_BASIC_BALANCED,
> -=09THERMAL_MODE_BASIC_BALANCED_PERFORMANCE,
> -=09THERMAL_MODE_BASIC_PERFORMANCE,
> -=09THERMAL_MODE_LAST,
> +enum awcc_thermal_profile {
> +=09AWCC_PROFILE_USTT_BALANCED,
> +=09AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
> +=09AWCC_PROFILE_USTT_COOL,
> +=09AWCC_PROFILE_USTT_QUIET,
> +=09AWCC_PROFILE_USTT_PERFORMANCE,
> +=09AWCC_PROFILE_USTT_LOW_POWER,
> +=09AWCC_PROFILE_LEGACY_QUIET,
> +=09AWCC_PROFILE_LEGACY_BALANCED,
> +=09AWCC_PROFILE_LEGACY_BALANCED_PERFORMANCE,
> +=09AWCC_PROFILE_LEGACY_PERFORMANCE,
> +=09AWCC_PROFILE_LAST,
>  };
> =20
>  struct wmax_led_args {
> @@ -210,20 +211,20 @@ struct wmax_u32_args {
>  struct awcc_priv {
>  =09struct wmi_device *wdev;
>  =09struct device *ppdev;
> -=09enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LA=
ST];
> +=09enum awcc_thermal_profile supported_thermal_profiles[PLATFORM_PROFILE=
_LAST];
>  };
> =20
> -static const enum platform_profile_option wmax_mode_to_platform_profile[=
THERMAL_MODE_LAST] =3D {
> -=09[THERMAL_MODE_USTT_BALANCED]=09=09=09=3D PLATFORM_PROFILE_BALANCED,
> -=09[THERMAL_MODE_USTT_BALANCED_PERFORMANCE]=09=3D PLATFORM_PROFILE_BALAN=
CED_PERFORMANCE,
> -=09[THERMAL_MODE_USTT_COOL]=09=09=09=3D PLATFORM_PROFILE_COOL,
> -=09[THERMAL_MODE_USTT_QUIET]=09=09=09=3D PLATFORM_PROFILE_QUIET,
> -=09[THERMAL_MODE_USTT_PERFORMANCE]=09=09=09=3D PLATFORM_PROFILE_PERFORMA=
NCE,
> -=09[THERMAL_MODE_USTT_LOW_POWER]=09=09=09=3D PLATFORM_PROFILE_LOW_POWER,
> -=09[THERMAL_MODE_BASIC_QUIET]=09=09=09=3D PLATFORM_PROFILE_QUIET,
> -=09[THERMAL_MODE_BASIC_BALANCED]=09=09=09=3D PLATFORM_PROFILE_BALANCED,
> -=09[THERMAL_MODE_BASIC_BALANCED_PERFORMANCE]=09=3D PLATFORM_PROFILE_BALA=
NCED_PERFORMANCE,
> -=09[THERMAL_MODE_BASIC_PERFORMANCE]=09=09=3D PLATFORM_PROFILE_PERFORMANC=
E,
> +static const enum platform_profile_option awcc_mode_to_platform_profile[=
AWCC_PROFILE_LAST] =3D {
> +=09[AWCC_PROFILE_USTT_BALANCED]=09=09=09=3D PLATFORM_PROFILE_BALANCED,
> +=09[AWCC_PROFILE_USTT_BALANCED_PERFORMANCE]=09=3D PLATFORM_PROFILE_BALAN=
CED_PERFORMANCE,
> +=09[AWCC_PROFILE_USTT_COOL]=09=09=09=3D PLATFORM_PROFILE_COOL,
> +=09[AWCC_PROFILE_USTT_QUIET]=09=09=09=3D PLATFORM_PROFILE_QUIET,
> +=09[AWCC_PROFILE_USTT_PERFORMANCE]=09=09=09=3D PLATFORM_PROFILE_PERFORMA=
NCE,
> +=09[AWCC_PROFILE_USTT_LOW_POWER]=09=09=09=3D PLATFORM_PROFILE_LOW_POWER,
> +=09[AWCC_PROFILE_LEGACY_QUIET]=09=09=09=3D PLATFORM_PROFILE_QUIET,
> +=09[AWCC_PROFILE_LEGACY_BALANCED]=09=09=09=3D PLATFORM_PROFILE_BALANCED,
> +=09[AWCC_PROFILE_LEGACY_BALANCED_PERFORMANCE]=09=3D PLATFORM_PROFILE_BAL=
ANCED_PERFORMANCE,
> +=09[AWCC_PROFILE_LEGACY_PERFORMANCE]=09=09=3D PLATFORM_PROFILE_PERFORMAN=
CE,
>  };
> =20
>  static struct awcc_quirks *awcc;
> @@ -444,26 +445,26 @@ const struct attribute_group wmax_deepsleep_attribu=
te_group =3D {
>   * Thermal Profile control
>   *  - Provides thermal profile control through the Platform Profile API
>   */
> -static bool is_wmax_thermal_code(u32 code)
> +static bool is_awcc_thermal_mode(u32 code)
>  {
> -=09if (code & WMAX_SENSOR_ID_MASK)
> +=09if (code & AWCC_SENSOR_ID_MASK)
>  =09=09return false;
> =20
> -=09if ((code & WMAX_THERMAL_MODE_MASK) >=3D THERMAL_MODE_LAST)
> +=09if ((code & AWCC_THERMAL_MODE_MASK) >=3D AWCC_PROFILE_LAST)
>  =09=09return false;
> =20
> -=09if ((code & WMAX_THERMAL_TABLE_MASK) =3D=3D WMAX_THERMAL_TABLE_BASIC =
&&
> -=09    (code & WMAX_THERMAL_MODE_MASK) >=3D THERMAL_MODE_BASIC_QUIET)
> +=09if ((code & AWCC_THERMAL_TABLE_MASK) =3D=3D AWCC_THERMAL_TABLE_LEGACY=
 &&
> +=09    (code & AWCC_THERMAL_MODE_MASK) >=3D AWCC_PROFILE_LEGACY_QUIET)
>  =09=09return true;
> =20
> -=09if ((code & WMAX_THERMAL_TABLE_MASK) =3D=3D WMAX_THERMAL_TABLE_USTT &=
&
> -=09    (code & WMAX_THERMAL_MODE_MASK) <=3D THERMAL_MODE_USTT_LOW_POWER)
> +=09if ((code & AWCC_THERMAL_TABLE_MASK) =3D=3D AWCC_THERMAL_TABLE_USTT &=
&
> +=09    (code & AWCC_THERMAL_MODE_MASK) <=3D AWCC_PROFILE_USTT_LOW_POWER)
>  =09=09return true;
> =20
>  =09return false;
>  }
> =20
> -static int wmax_thermal_information(struct wmi_device *wdev, u8 operatio=
n,
> +static int awcc_thermal_information(struct wmi_device *wdev, u8 operatio=
n,
>  =09=09=09=09    u8 arg, u32 *out_data)
>  {
>  =09struct wmax_u32_args in_args =3D {
> @@ -474,21 +475,21 @@ static int wmax_thermal_information(struct wmi_devi=
ce *wdev, u8 operation,
>  =09};
>  =09int ret;
> =20
> -=09ret =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_INFORMATION,
> +=09ret =3D alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION,
>  =09=09=09=09    &in_args, sizeof(in_args), out_data);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09if (*out_data =3D=3D WMAX_FAILURE_CODE)
> +=09if (*out_data =3D=3D AWCC_FAILURE_CODE)
>  =09=09return -EBADRQC;
> =20
>  =09return 0;
>  }
> =20
> -static int wmax_thermal_control(struct wmi_device *wdev, u8 profile)
> +static int awcc_thermal_control(struct wmi_device *wdev, u8 profile)
>  {
>  =09struct wmax_u32_args in_args =3D {
> -=09=09.operation =3D WMAX_OPERATION_ACTIVATE_PROFILE,
> +=09=09.operation =3D AWCC_OP_ACTIVATE_PROFILE,
>  =09=09.arg1 =3D profile,
>  =09=09.arg2 =3D 0,
>  =09=09.arg3 =3D 0,
> @@ -496,18 +497,18 @@ static int wmax_thermal_control(struct wmi_device *=
wdev, u8 profile)
>  =09u32 out_data;
>  =09int ret;
> =20
> -=09ret =3D alienware_wmi_command(wdev, WMAX_METHOD_THERMAL_CONTROL,
> +=09ret =3D alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL,
>  =09=09=09=09    &in_args, sizeof(in_args), &out_data);
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09if (out_data =3D=3D WMAX_FAILURE_CODE)
> +=09if (out_data =3D=3D AWCC_FAILURE_CODE)
>  =09=09return -EBADRQC;
> =20
>  =09return 0;
>  }
> =20
> -static int wmax_game_shift_status(struct wmi_device *wdev, u8 operation,
> +static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,
>  =09=09=09=09  u32 *out_data)
>  {
>  =09struct wmax_u32_args in_args =3D {
> @@ -518,46 +519,46 @@ static int wmax_game_shift_status(struct wmi_device=
 *wdev, u8 operation,
>  =09};
>  =09int ret;
> =20
> -=09ret =3D alienware_wmi_command(wdev, WMAX_METHOD_GAME_SHIFT_STATUS,
> +=09ret =3D alienware_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS,
>  =09=09=09=09    &in_args, sizeof(in_args), out_data);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09if (*out_data =3D=3D WMAX_FAILURE_CODE)
> +=09if (*out_data =3D=3D AWCC_FAILURE_CODE)
>  =09=09return -EOPNOTSUPP;
> =20
>  =09return 0;
>  }
> =20
> -static int thermal_profile_get(struct device *dev,
> -=09=09=09       enum platform_profile_option *profile)
> +static int awcc_platform_profile_get(struct device *dev,
> +=09=09=09=09     enum platform_profile_option *profile)
>  {
>  =09struct awcc_priv *priv =3D dev_get_drvdata(dev);
>  =09u32 out_data;
>  =09int ret;
> =20
> -=09ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_CURRENT_P=
ROFILE,
> +=09ret =3D awcc_thermal_information(priv->wdev, AWCC_OP_GET_CURRENT_PROF=
ILE,
>  =09=09=09=09       0, &out_data);
> =20
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09if (out_data =3D=3D WMAX_THERMAL_MODE_GMODE) {
> +=09if (out_data =3D=3D AWCC_THERMAL_MODE_GMODE) {
>  =09=09*profile =3D PLATFORM_PROFILE_PERFORMANCE;
>  =09=09return 0;
>  =09}
> =20
> -=09if (!is_wmax_thermal_code(out_data))
> +=09if (!is_awcc_thermal_mode(out_data))
>  =09=09return -ENODATA;
> =20
> -=09out_data &=3D WMAX_THERMAL_MODE_MASK;
> -=09*profile =3D wmax_mode_to_platform_profile[out_data];
> +=09out_data &=3D AWCC_THERMAL_MODE_MASK;
> +=09*profile =3D awcc_mode_to_platform_profile[out_data];
> =20
>  =09return 0;
>  }
> =20
> -static int thermal_profile_set(struct device *dev,
> -=09=09=09       enum platform_profile_option profile)
> +static int awcc_platform_profile_set(struct device *dev,
> +=09=09=09=09     enum platform_profile_option profile)
>  {
>  =09struct awcc_priv *priv =3D dev_get_drvdata(dev);
> =20
> @@ -565,8 +566,8 @@ static int thermal_profile_set(struct device *dev,
>  =09=09u32 gmode_status;
>  =09=09int ret;
> =20
> -=09=09ret =3D wmax_game_shift_status(priv->wdev,
> -=09=09=09=09=09     WMAX_OPERATION_GET_GAME_SHIFT_STATUS,
> +=09=09ret =3D awcc_game_shift_status(priv->wdev,
> +=09=09=09=09=09     AWCC_OP_GET_GAME_SHIFT_STATUS,
>  =09=09=09=09=09     &gmode_status);
> =20
>  =09=09if (ret < 0)
> @@ -574,8 +575,8 @@ static int thermal_profile_set(struct device *dev,
> =20
>  =09=09if ((profile =3D=3D PLATFORM_PROFILE_PERFORMANCE && !gmode_status)=
 ||
>  =09=09    (profile !=3D PLATFORM_PROFILE_PERFORMANCE && gmode_status)) {
> -=09=09=09ret =3D wmax_game_shift_status(priv->wdev,
> -=09=09=09=09=09=09     WMAX_OPERATION_TOGGLE_GAME_SHIFT,
> +=09=09=09ret =3D awcc_game_shift_status(priv->wdev,
> +=09=09=09=09=09=09     AWCC_OP_TOGGLE_GAME_SHIFT,
>  =09=09=09=09=09=09     &gmode_status);
> =20
>  =09=09=09if (ret < 0)
> @@ -583,21 +584,21 @@ static int thermal_profile_set(struct device *dev,
>  =09=09}
>  =09}
> =20
> -=09return wmax_thermal_control(priv->wdev,
> +=09return awcc_thermal_control(priv->wdev,
>  =09=09=09=09    priv->supported_thermal_profiles[profile]);
>  }
> =20
> -static int thermal_profile_probe(void *drvdata, unsigned long *choices)
> +static int awcc_platform_profile_probe(void *drvdata, unsigned long *cho=
ices)
>  {
>  =09enum platform_profile_option profile;
>  =09struct awcc_priv *priv =3D drvdata;
> -=09enum wmax_thermal_mode mode;
> +=09enum awcc_thermal_profile mode;
>  =09u8 sys_desc[4];
>  =09u32 first_mode;
>  =09u32 out_data;
>  =09int ret;
> =20
> -=09ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCR=
IPTION,
> +=09ret =3D awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCR=
IPTION,
>  =09=09=09=09       0, (u32 *) &sys_desc);
>  =09if (ret < 0)
>  =09=09return ret;
> @@ -605,7 +606,7 @@ static int thermal_profile_probe(void *drvdata, unsig=
ned long *choices)
>  =09first_mode =3D sys_desc[0] + sys_desc[1];
> =20
>  =09for (u32 i =3D 0; i < sys_desc[3]; i++) {
> -=09=09ret =3D wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_I=
DS,
> +=09=09ret =3D awcc_thermal_information(priv->wdev, AWCC_OP_GET_RESOURCE_=
ID,
>  =09=09=09=09=09       i + first_mode, &out_data);
> =20
>  =09=09if (ret =3D=3D -EIO)
> @@ -614,11 +615,11 @@ static int thermal_profile_probe(void *drvdata, uns=
igned long *choices)
>  =09=09if (ret =3D=3D -EBADRQC)
>  =09=09=09break;
> =20
> -=09=09if (!is_wmax_thermal_code(out_data))
> +=09=09if (!is_awcc_thermal_mode(out_data))
>  =09=09=09continue;
> =20
> -=09=09mode =3D out_data & WMAX_THERMAL_MODE_MASK;
> -=09=09profile =3D wmax_mode_to_platform_profile[mode];
> +=09=09mode =3D out_data & AWCC_THERMAL_MODE_MASK;
> +=09=09profile =3D awcc_mode_to_platform_profile[mode];
>  =09=09priv->supported_thermal_profiles[profile] =3D out_data;
> =20
>  =09=09set_bit(profile, choices);
> @@ -629,7 +630,7 @@ static int thermal_profile_probe(void *drvdata, unsig=
ned long *choices)
> =20
>  =09if (awcc->gmode) {
>  =09=09priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
> -=09=09=09WMAX_THERMAL_MODE_GMODE;
> +=09=09=09AWCC_THERMAL_MODE_GMODE;
> =20
>  =09=09set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>  =09}
> @@ -638,9 +639,9 @@ static int thermal_profile_probe(void *drvdata, unsig=
ned long *choices)
>  }
> =20
>  static const struct platform_profile_ops awcc_platform_profile_ops =3D {
> -=09.probe =3D thermal_profile_probe,
> -=09.profile_get =3D thermal_profile_get,
> -=09.profile_set =3D thermal_profile_set,
> +=09.probe =3D awcc_platform_profile_probe,
> +=09.profile_get =3D awcc_platform_profile_get,
> +=09.profile_set =3D awcc_platform_profile_set,
>  };
> =20
>  static int awcc_platform_profile_init(struct wmi_device *wdev)
>=20
>=20
--8323328-1260473303-1743170557=:932--
