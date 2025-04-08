Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A91DBB0C;
	Tue,  8 Apr 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123059; cv=none; b=rCAs9mKyn2tLu1KWxmTwoKcdiTz59lryzRUniMHD6yEv756xLUIAaU6mo27F11sGnCDs//pb8NhDOuUHtt2uMO/1Va+dAsJ/rPcaSB5CGCVVq+5NkGdAGBPSF34B3hBq5h7T+hORHvf/IxHSZOG65K/elRLrjZzfxNqBS/WqxmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123059; c=relaxed/simple;
	bh=G742PKXiiYwWDswFW4hAR6scsLht0+Tor8wW8ZThYYA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oxsMUGvJYjA0czp2am6AtqxiAeFxUfll+lK0xiKlk24bCYSiuFKeXoZ3lyGLaq518CwV+Yv6dIAbGKKtBGxswnPJWnRvnsupfhNu4jsJmN/aacq0y+LjJCoYPKAt16lu2spY0LhAh8O4SQdd50OgKgnUcSN8wn+LWkNmpoGVtaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDlRlE7/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDlRlE7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744123058; x=1775659058;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=G742PKXiiYwWDswFW4hAR6scsLht0+Tor8wW8ZThYYA=;
  b=IDlRlE7/w/4JodfCtnkfiGTXjIe+vuoRecUJaUPjNTbg5oN5TpvItOZK
   wLlCk7o/GZdQPiWPcbA5NQWW1fK7wHBq1i2vC3RGI3r7N6g9oSwtoI/Yf
   +W/5MPDTAFtCP+E2J1j0GvsFpc4/EVkvN/ZbcuwJBbB2v/gDMNgt0uoaP
   wCCr2p6UfaoxNaPuul76ZR1mkcEmrecNXV4AJZz8gNLWDqaprnc2h8uRc
   rULdobm2vL/BFnDE3WTuml5LEmeR6HfBgl0YxyTHPIw9nP3CVknlCzEwg
   Nds2pRwEd/d6P8nH6f/3uXDYY1ckWVMbJfzA6oybpJN+Cpk18yO/dVrQq
   w==;
X-CSE-ConnectionGUID: xl8yTVRZQUmSm3dAKhTUOA==
X-CSE-MsgGUID: LBPYZcDtSaqkL9AwFIhTOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49405336"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49405336"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:37:35 -0700
X-CSE-ConnectionGUID: r0mfxXzTR/GsIztWkBbXpQ==
X-CSE-MsgGUID: bv502igSTm+JFAxUFYY5yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128280535"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:37:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 17:37:28 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v8 6/8] platform/x86: asus-armoury: add screen auto-brightness
 toggle
In-Reply-To: <20250319065827.53478-7-luke@ljones.dev>
Message-ID: <4379b33f-564a-70f2-19a6-d3a35879c080@linux.intel.com>
References: <20250319065827.53478-1-luke@ljones.dev> <20250319065827.53478-7-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1390500884-1744123048=:930"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1390500884-1744123048=:930
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 19 Mar 2025, Luke Jones wrote:

> Add screen_auto_brightness toggle supported on some laptops.
>=20
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-armoury.c        | 3 +++
>  include/linux/platform_data/x86/asus-wmi.h | 1 +
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/a=
sus-armoury.c
> index b36e19b9d2bf..802c304e2ebc 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -752,6 +752,9 @@ ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_=
WMI_DEVID_PANEL_OD,
>  =09=09   "Set the panel refresh overdrive");
>  ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_=
HD,
>  =09=09   "Set the panel HD mode to UHD<0> or FHD<1>");
> +ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
> +=09=09   ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS,
> +=09=09   "Set the panel brightness to Off<0> or On<1>");
>  ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU=
_CONNECTED,
>  =09=09   "Show the eGPU connection status");
> =20
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index e735f35b423c..92fea0710ada 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -83,6 +83,7 @@
>  #define ASUS_WMI_DEVID_LID_FLIP_ROG=090x00060077
>  #define ASUS_WMI_DEVID_MINI_LED_MODE=090x0005001E
>  #define ASUS_WMI_DEVID_MINI_LED_MODE2=090x0005002E
> +#define ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS=090x0005002A
> =20
>  /* Storage */
>  #define ASUS_WMI_DEVID_CARDREADER=090x00080013
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-1390500884-1744123048=:930--
