Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE0A1FE478
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927819; cv=none; b=ct8Qe0D8Bpn+DIJNQi5vZmZiylc6knKIdzzZqyayAL5wsE09h01507f5cT6/+ns2K4FgnWMqvg5GFSHqiCPUo3TlLOQ+PIskM6u7VTSkED+DjPOIbJRo7UNo/vK/QItg4qiip6WY4B3EJ0bRRXLjo/7kB/Bq3YSX0dEIIe0fYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927819; c=relaxed/simple;
	bh=nWH+xT2ovDwUcvgunaecQlN8B7WTLKW1oC/M0WWGFnY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=okpLhmHLAsE1PaRpGRaStDx562hl8u+pSHZxG4cS+fTnm8tRIV83vyQTHYgpTz8NWoCecjSPqqa3mdrpleI5R2NdR2FCXh7cNu/h4G1vGLeBmf2U+XLLLuK2dUc8bAT5sacVAOdjYUqhj87IRRCY7LKN57LgfmTbsvzlLocX774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkKM5a6Y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkKM5a6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745927818; x=1777463818;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=nWH+xT2ovDwUcvgunaecQlN8B7WTLKW1oC/M0WWGFnY=;
  b=QkKM5a6Yo8gxzoU5fQv0USWm91YO8CYdIof9IEQZqZd0c4cqTmsknMg4
   UuIxkBohIscJRJ8Q44b2++ByZ8mmpIVMhY/NumHgX9nd3vOCVB3vwlgTx
   Ad4GlWPiPIrjmGH6m0yTMeJuIUrSlkyTLxMyRBCzKxrv2a9eLZazSECVK
   SuX+ingO57A8KLAzFWnCL8OxxxxLKyOcrw/m7ZoJghwscHnKSQashOEXT
   0cv8r6sREGId2T1QGlowwps6CVKi7ctr2njbsy8I74eBE96LbJbcCC/Fm
   nQtW/qqfLT2J7CQ2QXOqaqgmq/PplZ0U8HH7F7ja9DMIIizdjXItrkG3R
   Q==;
X-CSE-ConnectionGUID: LF/yoyhcSgOt+RzuWKA/5Q==
X-CSE-MsgGUID: umAfPUkjQ4G20gMPZCDfzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72921149"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="72921149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 04:56:57 -0700
X-CSE-ConnectionGUID: lWmI91a3TnKrKmhQK9fY+Q==
X-CSE-MsgGUID: mH0psiiZSmW8zbUhsIJoTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="164892670"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.9])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 04:56:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Harry Austen <hpausten@protonmail.com>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Harry
 Austen <hpausten@protonmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Allow building as kernel built-in
In-Reply-To: <20250425115148.12815-1-hpausten@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250425115148.12815-1-hpausten@protonmail.com>
Date: Tue, 29 Apr 2025 14:56:51 +0300
Message-ID: <874iy7w58c.fsf@intel.com>
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

I didn't test this, but it makes sense to me.

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
> v3: Simplify KUNIT dependency, as suggested by Jani Nikula
> v2: Ensure DRM_XE_DISPLAY and DRM_I915 can't both be built-in
>
>  drivers/gpu/drm/xe/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 9bce047901b22..214f40264fa12 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe Graphics"
> -	depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
> +	depends on DRM && PCI && MMU
> +	depends on KUNIT || KUNIT=3Dn
>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs
> @@ -51,7 +52,7 @@ config DRM_XE
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
