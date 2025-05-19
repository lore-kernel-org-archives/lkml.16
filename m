Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC762853FF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667691; cv=none; b=MMtCu5RC2zVcbpPalYTHhevYXSvzGgwyVZOKVVvXGuCFBk1F++snTv4ULaHZhPSPRMDZ72Y4EZDFtuuMQrdK0YOb/G3hM3JihfSdyKUHAIVbz1MXUX1qvYhMu0P9BUpuLGAQVhOFCriqhnnAcIv7oZGJ5An1BC7k888iDSi4bcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667691; c=relaxed/simple;
	bh=7jeWlc3eTHA7YmtyvmjhMU+jNXG2C4BfsNcorU/SoCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgVb3GNVswZ3VTNqFldSmjAyEbP2bALNcNv3zrNq1JGhDAxkBs0xF6Dp/f1mdzTCrU59pZ5q2Bdl7pMvQanLCPbGymIQppBai6QlScpMcf4tf6TFUOLJpWLLqeZ5mRnNZ83upw2Okwpkdj7xU9j3VNPiJiOywgTqyUkErgFVqlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBIbJg+v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBIbJg+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747667690; x=1779203690;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7jeWlc3eTHA7YmtyvmjhMU+jNXG2C4BfsNcorU/SoCg=;
  b=bBIbJg+vOh1iaK77eeMSfyf9WOFpHGeDxDkRi/S6DNjPC1FWP7yV/L4c
   LNc0CCnmJ5WXthRvtzMdM3UsXDPKNmHV+ex+pjghT3GVUjzL57qUUDKRz
   rT11tcKqET19fZjOudvYBYyBK7GPsF2tPplpOJEVjC1WjJfo9SSXtaSB5
   P/xZaaG6zO71mg4gi2ZyFtbyVyCMqFGBMyTiQ1Bh7a33TrahFKbTqgrOM
   NFo/7z8eYAHbV1qYkjz3nw2h+g4XoaBbZLMQOSmVHZmTStRbmfROPPgHp
   cn7pQ9bvEcOpGU2RwNgXcYhfNnQe/0toRAqb4VgAoHfT/z3wwmlvzhOee
   g==;
X-CSE-ConnectionGUID: QLoWAa8XSYyl3Y+dZTN8ZA==
X-CSE-MsgGUID: FxJuBWtdQx6bsmTgs/oC9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="59802205"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="59802205"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:14:50 -0700
X-CSE-ConnectionGUID: 0BeUY0OZSreuyhFdA4pmoA==
X-CSE-MsgGUID: RsJdg5gUS7Gkw0yUhQH9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139441734"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.41]) ([10.245.245.41])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:14:47 -0700
Message-ID: <32da3736-9ac1-4524-94e6-28a81f23bf31@linux.intel.com>
Date: Mon, 19 May 2025 17:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Allow building as kernel built-in
To: Harry Austen <hpausten@protonmail.com>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250516104210.17969-1-hpausten@protonmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250516104210.17969-1-hpausten@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey,

On 2025-05-16 12:42, Harry Austen wrote:
> Fix Kconfig symbol dependency on KUNIT, which isn't actually required
> for XE to be built-in. However, if KUNIT is enabled, it must be built-in
> too.
> 
> Also, allow DRM_XE_DISPLAY to be built-in. But only as long as DRM_I915
> isn't, since that results in duplicate symbol errors.
> 
> Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=m")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---
> v4: Add Jani Nikula's Acked-by tag
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
> -	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
> +	depends on DRM && PCI && MMU
> +	depends on KUNIT || KUNIT=n
>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs
> @@ -51,7 +52,7 @@ config DRM_XE
>  
>  config DRM_XE_DISPLAY
>  	bool "Enable display support"
> -	depends on DRM_XE && DRM_XE=m && HAS_IOPORT
> +	depends on DRM_XE && (DRM_XE=m || DRM_I915!=y) && HAS_IOPORT
>  	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
>  	select I2C
>  	select I2C_ALGOBIT
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Can we also get rid of the IOSF_MBI select? Not even xe_display depends on it, leftover from initial porting. :)

