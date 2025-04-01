Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E02E2040A4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530237; cv=none; b=oMs7Qbc4LYq946s68Iu3vcqvkjBUV9XXCvI/VPlPkqpsGAgZ6/ip48eELoM3mXr/nv3infFVq/tyVFaOdAnjWwROnjGFLjgqPN19A2SlfsI7dwHOGBCrjOOX/3Obq8+q8imocmqxy6IpDTy2u4p+qljMLS0B6hZzzWPLU+rL/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530237; c=relaxed/simple;
	bh=Y8po2mG+ZdaKzrhPAKY3Rl4zdUDsFxDOPIFpWcJDdv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6U4FRj09xKTPxTk+dlVaT8pezac0koL6mwqPri1Qbm+N8Hgiev5Nzg6VVPK9SNDgrpCE5irD/WKCnoJMwlBWkTOkrbD+T6lyxoes9Vs5xxX56ryp6OZc7bVxwkE6i83KPyLzgbrKgXsG2VgZk5EHPWDm5ROIl8s14Sv2/lc814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnXtfwxU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnXtfwxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743530235; x=1775066235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Y8po2mG+ZdaKzrhPAKY3Rl4zdUDsFxDOPIFpWcJDdv0=;
  b=ZnXtfwxUt14Ne1Rq90kXqRB1kINz4uBFiIVmpbZ/MLhNPW6NkxD4LzA0
   iahPySUHGWNXlBm5tlOaJz8BVjLA1cPnP3+M9mMMkxAkoGfQtTbUjJqqk
   00bU5QnjP+7UMB0S6gC1TbUEf36VuTCdsb/1Xh0mdYBBKipObAAWfkEgi
   pRkxPSqhIE1r7iaVfIwd68zL4WE1jW9qQKZ3TwiwjiwfliDTdGLTALACr
   fAw09sKg3Yt/syHyrmvISE4p/4GW434baSmvhBPB5SileDiHKS/ngRQgs
   htSb32I1C8F/SCeIjl3vJp80rRewJVZbN3Lw7K4e/Hvy5GyeemRxnVv6I
   Q==;
X-CSE-ConnectionGUID: NoxcFzqLTN6linw1pIVT4A==
X-CSE-MsgGUID: mb2+fDIkQSKdESF0hHD4uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55067313"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="55067313"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 10:57:14 -0700
X-CSE-ConnectionGUID: umPCKkn0S/CmVVIWh/SdPA==
X-CSE-MsgGUID: MGn87gW3SuSRxx6RaXap2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131660814"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orviesa005.jf.intel.com with SMTP; 01 Apr 2025 10:57:09 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 01 Apr 2025 20:57:09 +0300
Date: Tue, 1 Apr 2025 20:57:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/8] drm/i915/gem: Add i915_gem_object_panic_map()
Message-ID: <Z-wo9W5SnvVQDEDt@intel.com>
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-5-jfalempe@redhat.com>
 <Z-wmxijRKQiZFyup@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-wmxijRKQiZFyup@intel.com>
X-Patchwork-Hint: comment

On Tue, Apr 01, 2025 at 08:47:50PM +0300, Ville Syrjälä wrote:
> On Tue, Apr 01, 2025 at 02:51:10PM +0200, Jocelyn Falempe wrote:
> > Prepare the work for drm_panic support. This is used to map the
> > current framebuffer, so the CPU can overwrite it with the panic
> > message.
> > 
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > ---
> > 
> > v5:
> >  * Use iosys_map for intel_bo_panic_map().
> > 
> >  drivers/gpu/drm/i915/display/intel_bo.c    |  5 ++++
> >  drivers/gpu/drm/i915/display/intel_bo.h    |  1 +
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
> >  drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 29 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/display/intel_bo.c      | 10 ++++++++
> >  5 files changed, 47 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
> > index fbd16d7b58d9..ac904e9ec7d5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_bo.c
> > +++ b/drivers/gpu/drm/i915/display/intel_bo.c
> > @@ -57,3 +57,8 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
> >  {
> >  	i915_debugfs_describe_obj(m, to_intel_bo(obj));
> >  }
> > +
> > +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
> > +{
> > +	i915_gem_object_panic_map(to_intel_bo(obj), map);
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
> > index ea7a2253aaa5..5b6c63d99786 100644
> > --- a/drivers/gpu/drm/i915/display/intel_bo.h
> > +++ b/drivers/gpu/drm/i915/display/intel_bo.h
> > @@ -23,5 +23,6 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
> >  						   struct intel_frontbuffer *front);
> >  
> >  void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
> > +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map);
> >  
> >  #endif /* __INTEL_BO__ */
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > index a5f34542135c..b16092707ea5 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -692,6 +692,8 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
> >  int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
> >  int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
> >  
> > +void i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map);
> > +
> >  /**
> >   * i915_gem_object_pin_map - return a contiguous mapping of the entire object
> >   * @obj: the object to map into kernel address space
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> > index 8780aa243105..718bea6474d7 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> > @@ -355,6 +355,35 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
> >  	return vaddr ?: ERR_PTR(-ENOMEM);
> >  }
> >  
> > +/* Map the current framebuffer for CPU access. Called from panic handler, so no
> > + * need to pin or cleanup.
> > + */
> > +void i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map)
> > +{
> > +	enum i915_map_type has_type;
> > +	void *ptr;
> > +
> > +	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
> > +
> > +
> > +	if (!ptr) {
> > +		if (i915_gem_object_has_struct_page(obj))
> > +			ptr = i915_gem_object_map_page(obj, I915_MAP_WB);
> > +		else
> > +			ptr = i915_gem_object_map_pfn(obj, I915_MAP_WB);
> 
> WB mapping would require clflushing to make it to the display.
> Is that being done somewhere?

This also seems to have a bunch of race conditions:
- what happens if the oops happens before the pages have
  even been swapped in?
- what happens if the oops happens before we've committed
  the fb to the hardware?

> 
> > +
> > +		if (IS_ERR(ptr))
> > +			return;
> 
> What happens when the mapping fails?
> 
> > +
> > +		obj->mm.mapping = page_pack_bits(ptr, I915_MAP_WB);
> > +	}
> > +
> > +	if (i915_gem_object_has_iomem(obj))
> > +		iosys_map_set_vaddr_iomem(map, (void __iomem *) ptr);
> > +	else
> > +		iosys_map_set_vaddr(map, ptr);
> > +}
> > +
> >  /* get, pin, and map the pages of the object into kernel space */
> >  void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
> >  			      enum i915_map_type type)
> > diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
> > index 27437c22bd70..c68166a64336 100644
> > --- a/drivers/gpu/drm/xe/display/intel_bo.c
> > +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> > @@ -59,3 +59,13 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
> >  {
> >  	/* FIXME */
> >  }
> > +
> > +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
> > +{
> > +	struct xe_bo *bo = gem_to_xe_bo(obj);
> > +	int ret;
> > +
> > +	ret = ttm_bo_vmap(&bo->ttm, map);
> > +	if (ret)
> > +		iosys_map_clear(map);
> > +}
> > -- 
> > 2.49.0
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
