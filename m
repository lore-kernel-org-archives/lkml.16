Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB9F23AD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877859; cv=none; b=Onbr9O2qrOJ7hSEq3F+f0aRYTfzBSElfTKOX/zqON5pb8ERIrn/TLrNVPkyavsaO9nRr2Di1xujucturiq9E+NAfwB07Ps6spIM70JtRJjI2LTU/dOXV6hoUeiu+QTG7ijmicYZ9+kAwJEgC9JcS51zulsQMPYXw24NwzzWXqs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877859; c=relaxed/simple;
	bh=famL4S7dSUz6ZqSkOhO5qr/jBogojbZQw/LDmQPBaJY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rFDNHJEOrqQj6kMc93lxTeBHy0BpoyIPXIsp7g6DLYf+LuOh5+8oT7gm4PkydtelDAtcf8GW8a/y1sTDG1A/eVhO9ItDaqkTLcPAyECPcRBY97n8ahnBjMa5sxsh8JYYaGGzS/v99qTt6JZug6L+gDrGBIUXUFd7zz+koHZ9Th0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deOZ9+sT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deOZ9+sT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744877857; x=1776413857;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=famL4S7dSUz6ZqSkOhO5qr/jBogojbZQw/LDmQPBaJY=;
  b=deOZ9+sTos5QXRuWHy1O9t8j9rnvHBnOI5OSBT3NCkCQBF1PrjesO5Kp
   /kWpJ1jxQW8yIvGF58lpAH9vNfZF1P2nfh8KEyIOZL4m8We257NRQtxOo
   t6gybaQ1CYio0AUGRxQ8Gxl3qBilqkuHDN9UONV5G3I63kQ2PNsA7JEZB
   px2gIwsMeLsZIrIr67lCg5QXF6B7unLoy25oFESKustVLXclBO+62ZsxQ
   60fwBOpOWkMLrntHKiav285siwvt75hBshKNDW0ZNK5tnSI6Ts11eYn6H
   EBPRfzZPE4fWwY7cM0/LoO9LcisYQhEWMbWsNSGyQwhA6oJfRXNU5u4W7
   A==;
X-CSE-ConnectionGUID: KuGDQMnUS4G4E4t7PGEcXQ==
X-CSE-MsgGUID: 2L9YoYx+S7CZcGcXrkD2yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46350301"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46350301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:17:37 -0700
X-CSE-ConnectionGUID: 1dMtVV7VSHycZhybUS0TLg==
X-CSE-MsgGUID: YKdHnijbSj63DUoadOSldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131264234"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.139])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:17:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: feijuan.li@samsung.com, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: =?utf-8?B?5ZSQ57qi6aOe?= <hongfei.tang@samsung.com>, =?utf-8?B?5Lil?=
 =?utf-8?B?5piO6LS1?= <minggui.yan@samsung.com>
Subject: Re: [PATCH] drm/edid: fixed the bug that hdr metadata was not cleared
In-Reply-To: <20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
 <20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
Date: Thu, 17 Apr 2025 11:17:23 +0300
Message-ID: <87cydbp5gs.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Apr 2025, =E6=9D=8E=E9=A3=9E=E5=A8=9F <feijuan.li@samsung.com> w=
rote:
> From a34a1e2dd7aacd45f18775564fce12b03ae4009c Mon Sep 17 00:00:00 2001
> From: "feijuan.li" <feijuan.li@samsung.com>
> Date: Wed, 16 Apr 2025 11:07:39 +0000
> Subject: [PATCH] drm/edid: fixed the bug that hdr metadata was not cleared
>
> When DP connected to a device with HDR capability,
> the hdr structure was filled.Then connected to another
> sink device without hdr capability, but the hdr info
> still exist.
>
> Signed-off-by: feijuan.li <feijuan.li@samsung.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..5cf5d30321b6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5607,6 +5607,7 @@ static void clear_eld(struct drm_connector *connect=
or)
>  {
>  	mutex_lock(&connector->eld_mutex);
>  	memset(connector->eld, 0, sizeof(connector->eld));
> +	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_met=
adata));

hdr_sink_metadata is not related to ELD, and should not be cleared
within clear_eld().

I think this should be cleared in drm_reset_display_info(), and
long-term fields like this should be moved within display info.

BR,
Jani.

>  	mutex_unlock(&connector->eld_mutex);
>=20=20
>  	connector->latency_present[0] =3D false;

--=20
Jani Nikula, Intel
