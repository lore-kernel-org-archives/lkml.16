Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B19461
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743529120; cv=none; b=auMTwRYa2VOS87rJ6Dq6jXMKY+0uYxcy/VHNov0O4ZrcFmF5hM1lmAAI1DWAZOEXDBQnMmLdFd/ekKLAntTgu9jSJKHn/rm82HhlrBTh/khrA4BBy2Nh+BcDUIANiBdOzmbDbitkjjcTg5gJnZExbZmeOgL592xjVKvxp3z56dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743529120; c=relaxed/simple;
	bh=Iod/UQvgNMFHQ6yvYpoQEaY1lZII8IGt2u9U/Kuvu1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjK90KFKuj1GgNSOo+eyIwVp7C7mU1aT3fP+4g7+iqdDSU2R3Oq2mVlNG/GGJQ+01WFIG8T8wZ7O7StnkPMSyrdSXduLNJLR8LDYX91UjUxaf1gNzo+sJYa58QJ1O7OjUdAsZHWqc5d8OkH/cR76pBZxkINndkgeH/CUuQY2k6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlIpwmnd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlIpwmnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743529119; x=1775065119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Iod/UQvgNMFHQ6yvYpoQEaY1lZII8IGt2u9U/Kuvu1c=;
  b=nlIpwmndjbi1oTaKeldlCmChh0T4W1I0BY9TSySscCALLmlScGOj/vyL
   Yx56+8xmolqlh70akxkRBLBmelQJbHb3mAuOUjhfQkUdR+zRi/DTgGbSV
   VnCnttU+6QYruRObChFDYiFiK7ofpCD3766+AxNR0CFueCMLRzF04eQhY
   rCMkXSOj65IGd71uYr2FrNb0oIE3Z7DpFC93QV6UfbvEoDtjDXDkqf50V
   3uxAhNplN3QfqlTY51X3NNjS/vFV/HZ1OxRt6TorYktpxKyr+CDwO9HPK
   MTzLX7n524KtyVyAmo3BV59/Wg9IDEzGexfb6dtN6mSCFfaxRg7xb2xTb
   A==;
X-CSE-ConnectionGUID: JR0PbIKuRgK9TxxuLmtm4g==
X-CSE-MsgGUID: CuWK04bKT2yzWPVSxtwY+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48532843"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48532843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 10:38:38 -0700
X-CSE-ConnectionGUID: tw3whFPVSoKuDDBwDx4Z+A==
X-CSE-MsgGUID: GKouFZLuRdeFgP7OcEtaOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131654958"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orviesa005.jf.intel.com with SMTP; 01 Apr 2025 10:38:34 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 01 Apr 2025 20:38:33 +0300
Date: Tue, 1 Apr 2025 20:38:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/8] drm/i915/display/i9xx: Add a disable_tiling() for
 i9xx planes
Message-ID: <Z-wkmdNgCM2-Ye7m@intel.com>
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-3-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401125818.333033-3-jfalempe@redhat.com>
X-Patchwork-Hint: comment

On Tue, Apr 01, 2025 at 02:51:08PM +0200, Jocelyn Falempe wrote:
> drm_panic draws in linear framebuffer, so it's easier to re-use the
> current framebuffer, and disable tiling in the panic handler, to show
> the panic screen.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
>  .../drm/i915/display/intel_display_types.h    |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index 5e8344fdfc28..9c93d5ac7129 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -908,6 +908,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
>  	.format_mod_supported = i8xx_plane_format_mod_supported,
>  };
>  
> +static void i9xx_disable_tiling(struct intel_plane *plane)
> +{
> +	struct intel_display *display = to_intel_display(plane);
> +	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
> +	u32 dspcntr;
> +	u32 reg;
> +
> +	dspcntr = intel_de_read_fw(display, DSPCNTR(display, i9xx_plane));
> +	dspcntr &= ~DISP_TILED;
> +	intel_de_write_fw(display, DSPCNTR(display, i9xx_plane), dspcntr);

This fails to account all the different alignment/etc. restrictions
between linear vs. tiled. I don't think we want hacks like this.

> +
> +	if (DISPLAY_VER(display) >= 4) {
> +		reg = intel_de_read_fw(display, DSPSURF(display, i9xx_plane));
> +		intel_de_write_fw(display, DSPSURF(display, i9xx_plane), reg);
> +
> +	} else {
> +		reg = intel_de_read_fw(display, DSPADDR(display, i9xx_plane));
> +		intel_de_write_fw(display, DSPADDR(display, i9xx_plane), reg);
> +	}
> +}
> +
>  struct intel_plane *
>  intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>  {
> @@ -1050,6 +1071,8 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>  		}
>  	}
>  
> +	plane->disable_tiling = i9xx_disable_tiling;
> +
>  	modifiers = intel_fb_plane_get_modifiers(display, INTEL_PLANE_CAP_TILING_X);
>  
>  	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 367b53a9eae2..62d0785c9edf 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1512,6 +1512,8 @@ struct intel_plane {
>  			   bool async_flip);
>  	void (*enable_flip_done)(struct intel_plane *plane);
>  	void (*disable_flip_done)(struct intel_plane *plane);
> +	/* For drm_panic */
> +	void (*disable_tiling)(struct intel_plane *plane);
>  };
>  
>  #define to_intel_atomic_state(x) container_of(x, struct intel_atomic_state, base)
> -- 
> 2.49.0

-- 
Ville Syrjälä
Intel
