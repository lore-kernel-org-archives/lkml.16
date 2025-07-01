Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47731F0E4B;
	Tue,  1 Jul 2025 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351313; cv=none; b=eYzPjPEL7o5N/1a2l3IVln9ERCIrMvhmp8YTzTk9K4ZGoUUwnCqiO/L3egtD1oLvzUqPYvmigk65dL8EbUyq9+88yVhajnuzEL9PGaakWBhP7Qu1xCrzDleAZLIRlIFXQ8EmFRw6+ihq783SKNYM7EjAPTV6GWQA3hW91gje/yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351313; c=relaxed/simple;
	bh=2wxZIi4gIiYCNlqWQVBFfErN3PZGpEH+z0uZFe8pTVc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hJ37TorZgXxY44OZetJzEaGTgJQzRKASceq1AJIBeiVY1JD2ehmeuDmjFmT5heGrMRsLpQm/lrAdgL/9eKvDdZ1LxnagUYaRk4L6h80v0X3SOJ+fYj4BtHNlFdylwcaXjpxRvW+EPTdxtfZsCGpksURJyb4sYzLLZzdZmyQpAQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8kJ94W4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8kJ94W4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751351311; x=1782887311;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=2wxZIi4gIiYCNlqWQVBFfErN3PZGpEH+z0uZFe8pTVc=;
  b=a8kJ94W44v42gO4nx+YU1N02fsvmJzaw8uc5nMFoPDA8HZsO9uSek+Zr
   uM2AfgwzUpAnVyZdKyMriGmIFdsIk6FC7rTMYIrNJTHLJt0LJm3hrnks7
   vD2RGSvCxQn3knUbqanI71EU2WwJWizezwpZ7CNsdUlwbbC8o+1qtMuRD
   XR+Lhqs8dwuB4hgBBT0T+ZuA6n6GG9aUKZYMcoW1/KkDh2z1/UlCckWu9
   wqpBnim1YfkMSdz92eof29IWCgJuwy1NKKFxpvFFvIOKDlE2NvK/0r4LB
   HPsUaJ9vQQcWnXtifgViPLBKRB8OgO/Gnv75XfMMWz/eD2aM0c/nIn59F
   Q==;
X-CSE-ConnectionGUID: vRB6oKBWTra3xuf9d+7O3w==
X-CSE-MsgGUID: ekS3ScIGTbi+4YLxJok7eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="65043610"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="65043610"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 23:28:30 -0700
X-CSE-ConnectionGUID: b0z2PZPcQWiCmARapqI1rg==
X-CSE-MsgGUID: smPg3RhPTbmyJqqZ1EgBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159384160"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.239])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 23:28:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ruben Wauters <rubenru09@aol.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <arlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST
In-Reply-To: <20250701025426.262129-1-rubenru09@aol.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250701025426.262129-1-rubenru09.ref@aol.com>
 <20250701025426.262129-1-rubenru09@aol.com>
Date: Tue, 01 Jul 2025 09:28:23 +0300
Message-ID: <8a3ef0b42de25db3faf384260b7abdce468cb65f@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 01 Jul 2025, Ruben Wauters <rubenru09@aol.com> wrote:
> DRM_DEBUG_SELFTEST was replaced with DRM_KUNIT_TEST.
>
> This patch replaces the select in Kconfig.debug to use the replacement.

Why? That's the most important questions the commit messages should
answer.

BR,
Jani.

>
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
>  drivers/gpu/drm/i915/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index 1852e0804942..b15b1cecb3aa 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
>  	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
>  	select DRM_DEBUG_MM if DRM=y
>  	select DRM_EXPORT_FOR_TESTS if m
> -	select DRM_DEBUG_SELFTEST
> +	select DRM_KUNIT_TEST
>  	select DMABUF_SELFTESTS
>  	select SW_SYNC # signaling validation framework (igt/syncobj*)
>  	select DRM_I915_WERROR

-- 
Jani Nikula, Intel
