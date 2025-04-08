Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D9515A868;
	Tue,  8 Apr 2025 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120161; cv=none; b=I+7Z72Z7H+/Eh9CAdxHM8Tsf9GRBByipF3V92vV5Es7uwKd3fUAbKglQ/yeipx2fwXHEAMPz1qz2hqKb667PV/E29ciEfZ2KrctNRb0kBbyNj7XNVGF7ucYBhLfkCFmqkBN/SK/IgXuca5r8H9pGWqzVlMTYRSajjg6caFw+j9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120161; c=relaxed/simple;
	bh=yB/ojpOd7H6JAKFutmRFiJFqkuv2+SiCCcS3UK2wzP4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VtyDSXEuXPw/8l7xHZR1m6LpPhV5Ku+lP8kXlFd0Pyivja3WMk6Ex7m68Ll0VBjMuK2JlylSTKsAV7YOwCCzUyHrw3PCIDn98m/DpIwu7fTqvfnnTHzhYazZ+dzHGRaFTM35rWWVSeOLVfDf7hqW0UCxEh9uQuFyHCmSXMWzBPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuiLdHfg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuiLdHfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744120160; x=1775656160;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yB/ojpOd7H6JAKFutmRFiJFqkuv2+SiCCcS3UK2wzP4=;
  b=HuiLdHfg52GQsX2n7OMcBv30FNOsQaatTT0Rx9gS5oiCZ8Cu6pn/0DGP
   ef6TSV+BsZcwpUXTfwOVaf3qBLG119p2NmL3ZcEq8evoOnOWnYaczHiIg
   /Tenkie0MYArEOM861siODa0PC8BZMM0gclCPVdz0BMG2tlxznP3CYgiH
   4TF+JWBEs4ex9T68ani42s0CF7dhTsPVggUEy4vEDVFO9XJHrtNmUVnDU
   2REhJVfsMFalGHej85Lz2J/gDCOQPFDEF23/Q6F3+AKhHwYBf2u3kM7uC
   tcJHpWEIE+D+moa+Qp6JFtklmIUAioPzgdstnmBRa0+5sIpJlP1jCHXue
   Q==;
X-CSE-ConnectionGUID: XbYkZniHRKCv8dm4+9jNEw==
X-CSE-MsgGUID: lZEhk8dRQWGTClpaJ0uMvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68028190"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="68028190"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:49:19 -0700
X-CSE-ConnectionGUID: bK15kNzDTE+tjxXFR+ubVw==
X-CSE-MsgGUID: 0+Mx/8g5Sbyann8ZVZXvwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="129233040"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:49:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 16:49:12 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v8 3/8] platform/x86: asus-armoury: add panel_hd_mode
 attribute
In-Reply-To: <20250319065827.53478-4-luke@ljones.dev>
Message-ID: <1bd38d12-baa9-fa56-8033-37fe38ee6e00@linux.intel.com>
References: <20250319065827.53478-1-luke@ljones.dev> <20250319065827.53478-4-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-585564477-1744120152=:930"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-585564477-1744120152=:930
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 19 Mar 2025, Luke Jones wrote:

> From: "Luke D. Jones" <luke@ljones.dev>
>=20
> Add panel_hd_mode to toggle the panel mode between single and high
> definition modes.
>=20
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/asus-armoury.c        | 6 +++++-
>  include/linux/platform_data/x86/asus-wmi.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/a=
sus-armoury.c
> index 12acd851e6b2..a299471d78d5 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -86,7 +86,8 @@ static struct kobj_attribute pending_reboot =3D __ATTR_=
RO(pending_reboot);
> =20
>  static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>  {
> -=09return !strcmp(attr->attr.name, "gpu_mux_mode");
> +=09return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> +=09       !strcmp(attr->attr.name, "panel_hd_mode");
>  }
> =20
>  static int armoury_wmi_set_devstate(struct kobj_attribute *attr, u32 val=
ue, u32 wmi_dev)
> @@ -397,6 +398,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", AS=
US_WMI_DEVID_MCU_POWERSAVE,
>  =09=09   "Set MCU powersaving mode");
>  ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
>  =09=09   "Set the panel refresh overdrive");
> +ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_=
HD,
> +=09=09   "Set the panel HD mode to UHD<0> or FHD<1>");
>  ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU=
_CONNECTED,
>  =09=09   "Show the eGPU connection status");
> =20
> @@ -410,6 +413,7 @@ static const struct asus_attr_group armoury_attr_grou=
ps[] =3D {
>  =09{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
>  =09{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
>  =09{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
> +=09{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
>  };
> =20
>  static int asus_fw_attr_add(void)
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index 4574e30c53fc..62a9adb1af2f 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -76,6 +76,7 @@
>  #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
> =20
>  /* Misc */
> +#define ASUS_WMI_DEVID_PANEL_HD=09=090x0005001C
>  #define ASUS_WMI_DEVID_PANEL_OD=09=090x00050019
>  #define ASUS_WMI_DEVID_CAMERA=09=090x00060013
>  #define ASUS_WMI_DEVID_LID_FLIP=09=090x00060062
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-585564477-1744120152=:930--
