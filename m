Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F782046A1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515297; cv=none; b=LIGadlx36b5X6G+BWuaYe87x46F+Nk4H5EWGBU0wUdbcWPYHD/W89mEt09SyhMvlPaKQSvjo7rhuzTX8iuGMxzzCs17piozyzTj3G3fcgl8Gf/GydTBu5AwUVu74YN5+1iLfOUxidUzPfbhSy20W+D6OhFcmgAlzjoyi1NnKbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515297; c=relaxed/simple;
	bh=TZ0Wmnbwt9NR3N1+cfyPvR4a+8wr2pjZAD84vmdcvSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BACHQiP2f5vVaRHPLmcHz2tUoQn56+bbr8KZup95afpnAPhGRyLo6zps4j3pTgcQKINofjihvLRNlsx9M6aUj23dnYkXi06gtcYUbEpqa/hGBSiT9jnl3WXEERiQKBAwlYzySRQceEnq5wcrvcOVjNZBtiin9+G78r2BRMpkVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvm6WqU7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvm6WqU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743515295; x=1775051295;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=TZ0Wmnbwt9NR3N1+cfyPvR4a+8wr2pjZAD84vmdcvSU=;
  b=mvm6WqU74aTR7sa9+viAhpw0Q3HylLLzs1obpP9yzqYRIKvkb/tPMRWk
   dHqFvL8J4b9zVG0CvXWBigX1qO1lmlHNdd0pWEPTQeE4Xwr6bR14SBeax
   xAsoobaL/7/g8IU8M3IKH1yw8zbq1gjajp2Mn/IRcMPKzMV9vZmZfxPCX
   8Xvuq2pBjcxGuNH3H1MxZazUFMnQuXXVgFsIjWu4wA3Gu2x+jz//lUInI
   ZmPPLI7WvGHe2XRCVPicvntqG/ZewuSS2zZ34gGKqWKoAFqVQ8PaNr7ND
   trX9pRPuGVL+RWfsTv0U9C1MD5+j4F991A7NB8xYudDr32IQ5qXE87vco
   g==;
X-CSE-ConnectionGUID: f4XBnlhhTheee186vycAcw==
X-CSE-MsgGUID: 1eCF/JUtR62dtiqJ1RgUnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44550173"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="44550173"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 06:48:14 -0700
X-CSE-ConnectionGUID: 8LXhDeQOR4yAP9t/OrtvYg==
X-CSE-MsgGUID: IS9NcCS4T6SmK7dQL5C5Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126218599"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 06:48:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v6 5/8] drm/i915/display: Add drm_panic support
In-Reply-To: <20250401125818.333033-6-jfalempe@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-6-jfalempe@redhat.com>
Date: Tue, 01 Apr 2025 16:48:07 +0300
Message-ID: <87ldsk2dt4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 01 Apr 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> This adds drm_panic support for a wide range of Intel GPU. I've
> tested it only on 4 laptops, Haswell (with 128MB of eDRAM),
> Comet Lake, Raptor Lake, and Lunar Lake.
> For hardware using DPT, it's not possible to disable tiling, as you
> will need to reconfigure the way the GPU is accessing the
> framebuffer.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>
> v4:
>  * Add support for Xe driver.
>  
> v6:
>  * Use struct intel_display instead of drm_i915_private for intel_atomic_plane.c 
>
>  .../gpu/drm/i915/display/intel_atomic_plane.c | 79 ++++++++++++++++++-
>  1 file changed, 78 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 7276179df878..eebf20fafaeb 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -33,13 +33,16 @@
>  
>  #include <linux/dma-fence-chain.h>
>  #include <linux/dma-resv.h>
> +#include <linux/iosys-map.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
>  #include <drm/drm_damage_helper.h>
> +#include <drm/drm_cache.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_panic.h>
>  
>  #include "gem/i915_gem_object.h"
>  #include "i915_config.h"
> @@ -47,6 +50,7 @@
>  #include "i915_vma.h"
>  #include "i9xx_plane_regs.h"
>  #include "intel_atomic_plane.h"
> +#include "intel_bo.h"
>  #include "intel_cdclk.h"
>  #include "intel_cursor.h"
>  #include "intel_display_rps.h"
> @@ -54,6 +58,7 @@
>  #include "intel_display_types.h"
>  #include "intel_fb.h"
>  #include "intel_fb_pin.h"
> +#include "intel_fbdev.h"
>  #include "skl_scaler.h"
>  #include "skl_universal_plane.h"
>  #include "skl_watermark.h"
> @@ -1251,14 +1256,86 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>  	intel_plane_unpin_fb(old_plane_state);
>  }
>  
> +/* Only used by drm_panic get_scanout_buffer() and panic_flush(), so it is
> + * protected by the drm panic spinlock
> + */
> +static struct iosys_map panic_map;
> +
> +static void intel_panic_flush(struct drm_plane *plane)
> +{
> +	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
> +	struct intel_plane *iplane = to_intel_plane(plane);
> +	struct intel_display *display = to_intel_display(iplane);
> +	struct drm_framebuffer *fb = plane_state->hw.fb;
> +
> +	/* Force a cache flush, otherwise the new pixels won't show up */
> +	drm_clflush_virt_range(panic_map.vaddr, fb->height * fb->pitches[0]);
> +
> +	/* Don't disable tiling if it's the fbdev framebuffer.*/
> +	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
> +		return;
> +

Mismatched {}


> +	if (fb->modifier && iplane->disable_tiling)
> +		iplane->disable_tiling(iplane);
> +}
> +
> +static int intel_get_scanout_buffer(struct drm_plane *plane,
> +				    struct drm_scanout_buffer *sb)
> +{
> +	struct intel_plane_state *plane_state;
> +	struct drm_gem_object *obj;
> +	struct drm_framebuffer *fb;
> +	struct intel_display *display = to_intel_display(plane->dev);
> +
> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
> +		return -ENODEV;
> +
> +	plane_state = to_intel_plane_state(plane->state);
> +	fb = plane_state->hw.fb;
> +	obj = intel_fb_bo(fb);
> +	if (!obj)
> +		return -ENODEV;
> +
> +	iosys_map_clear(&panic_map);
> +	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
> +		intel_fbdev_get_map(display->fbdev.fbdev, &panic_map);
> +	} else {
> +		/* Can't disable tiling if DPT is in use */
> +		if (intel_fb_uses_dpt(fb))
> +			return -EOPNOTSUPP;
> +
> +		intel_bo_panic_map(obj, &panic_map);
> +	}
> +	if (iosys_map_is_null(&panic_map))
> +		return -ENOMEM;
> +
> +	sb->map[0] = panic_map;
> +	sb->width = fb->width;
> +	sb->height = fb->height;
> +	sb->format = fb->format;
> +	sb->pitch[0] = fb->pitches[0];
> +
> +	return 0;
> +}
> +
>  static const struct drm_plane_helper_funcs intel_plane_helper_funcs = {
>  	.prepare_fb = intel_prepare_plane_fb,
>  	.cleanup_fb = intel_cleanup_plane_fb,
>  };
>  
> +static const struct drm_plane_helper_funcs intel_primary_plane_helper_funcs = {
> +	.prepare_fb = intel_prepare_plane_fb,
> +	.cleanup_fb = intel_cleanup_plane_fb,
> +	.get_scanout_buffer = intel_get_scanout_buffer,
> +	.panic_flush = intel_panic_flush,
> +};
> +
>  void intel_plane_helper_add(struct intel_plane *plane)
>  {
> -	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
> +	if (plane->base.type == DRM_PLANE_TYPE_PRIMARY)
> +		drm_plane_helper_add(&plane->base, &intel_primary_plane_helper_funcs);
> +	else
> +		drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
>  }
>  
>  void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_state,

-- 
Jani Nikula, Intel
