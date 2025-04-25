Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9B231A51
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567963; cv=none; b=XrryYY5iOc3NkxSnpiiaeUg+rKVjgSCuRXWSFJuxGjsedkmJSpOya+GR06D2zFB5+/WvGSQ7sojGi44S5CeM/6jNQ9jlK1UdbkYccxsTZTYO2hry/BDvDxCTighCwSvxmcftntofe5Lo4wVqNxTbUSO0k+bSV4RrL2WslhJrdWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567963; c=relaxed/simple;
	bh=h4iOBZ59fktIHjN9U/oodWigLneksyn9qeVhjdbT7/I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OQf7feViHIqCb/5OqJH05rzUE0joH3iqepsGKyhGtqgKTfe59KiDqzwe7jYBb7HGANlKnIvV4ed2A8SwrIU07kcj9DPd3I44dlYRF4+XezdYqHLv3i9OSCLaFsfID/rrjvDxXnscTwQZ6nwG0dBzXMSTw071ZI2K6hnwPSldUIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkVkQwnt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkVkQwnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745567962; x=1777103962;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=h4iOBZ59fktIHjN9U/oodWigLneksyn9qeVhjdbT7/I=;
  b=VkVkQwntTeWpoSJ4dzBSFGGoUG16N5ZPP1aVBZ+FvGVavU6FvTnn70Pc
   fe/n6EpsPDNW2PX2m1KfMqabBJx6wfIgsR2BM6B//2GM6naMKnsZr9ya0
   pAuqFHBpvmwmtLQQQq+bFk8YkyOb7cmJiOqSoa2YRLeEJ2cOkptROt59j
   v91lYFvZRKO/AGRO4TfbYX92uCI5m/mk5f9hndYgxFSDHqF51CQPymMMk
   eNaunbRb82ogPcD0MxTsTQGLLvjsJMGH4nx3rji2FIGInLv3K+jucGuA1
   7YqD8nBivcfzx7Y/Y5gXP26Rv94Z91GjC63YOVnz2U+3QwmGSALbBcux1
   w==;
X-CSE-ConnectionGUID: +253/tEDSJiiTsUlRAsBwg==
X-CSE-MsgGUID: rY+AgvusSNmQzdCOeQipZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50889547"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="50889547"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:59:20 -0700
X-CSE-ConnectionGUID: mLApreHQRv2F+ccffiznuA==
X-CSE-MsgGUID: iogPStJpTTGNOTRU+QdKJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132724960"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.83])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:59:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Harry Austen <hpausten@protonmail.com>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Harry
 Austen <hpausten@protonmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Allow building as kernel built-in
In-Reply-To: <20250425073534.101976-1-hpausten@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250425073534.101976-1-hpausten@protonmail.com>
Date: Fri, 25 Apr 2025 10:59:12 +0300
Message-ID: <87y0voy8mn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Apr 2025, Harry Austen <hpausten@protonmail.com> wrote:
> Fix Kconfig symbol dependency on KUNIT, which isn't actually required
> for XE to be built-in. However, if KUNIT is enabled, it must be built-in
> too.
>
> Also, allow DRM_XE_DISPLAY to be built-in. But only as long as DRM_I915
> isn't, since that results in duplicate symbol errors.
>
> Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=3Dm")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> ---
> v2: Ensure DRM_XE_DISPLAY and DRM_I915 can't both be built-in
>
>  drivers/gpu/drm/xe/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 9bce047901b22..bc63c396d7fef 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe Graphics"
> -	depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
> +	depends on DRM && PCI && MMU && (m || (y && KUNIT!=3Dm))

I can't make heads or tails about that. I think expressing the kunit
dependency on a separate line like this is both much more common and
clear:

	depends on KUNIT || KUNIT=3Dn

>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs
> @@ -51,7 +51,7 @@ config DRM_XE
>=20=20
>  config DRM_XE_DISPLAY
>  	bool "Enable display support"
> -	depends on DRM_XE && DRM_XE=3Dm && HAS_IOPORT
> +	depends on DRM_XE && (DRM_XE=3Dm || DRM_I915!=3Dy) && HAS_IOPORT
>  	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
>  	select I2C
>  	select I2C_ALGOBIT

--=20
Jani Nikula, Intel
