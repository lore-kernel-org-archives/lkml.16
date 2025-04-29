Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE31FCFC0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918530; cv=none; b=qE7mPPTiktTkHprpj8Ond5ekCemzlVFwLdLyP93DB2NjgBKMYDySZmn4L36cHQlj5pB/X7bR/7NWCu/fiHKrAkIWd6xF2VQLhMil0V9KVMwV874LAnGQ/mhaFytPqPO8xSykV5XSKVNKE/v6UDip1oFTLhVaNu/IXrtkkytBZl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918530; c=relaxed/simple;
	bh=Idoj+4hwbckVN4oPLEOPh5JODs+z9CwnDkjxq1GYS8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ERMvk42NRgioQlKHLYH3xMTLlATd6lb1CrUUSTtN7kEmrMBkus11QJczwSI3YnOhCkO0U1FLCz6+zdTGBSTNiOQxD3IejFYEsBzqadFNEk4VgA46FGvbhBQ73JTb21mQfbI2wxseLQPPz91yiBontu9j4yzk/9acLy05BqT0IYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeLQSq1e; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeLQSq1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745918528; x=1777454528;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Idoj+4hwbckVN4oPLEOPh5JODs+z9CwnDkjxq1GYS8k=;
  b=EeLQSq1ez06Mnq1XFuM61x5SQUSX/unXIRKuMD3tIdaibtFR+z5ODw+N
   Elwa9WEwREaocXP95ymivl/D70inApJocr+2Zui2er7OjDN8Hfe3WOA/v
   szMGfBbqPkclOB/ggDalCbdh4fPmIbZ+ghJUR2sMLly8B0HdiWx8E2+u6
   7t7iN5KuPWVJxCs2NK4SIO8hzrFF0ci0mUcm2BZXk5rUjpSvsemsn2IHV
   GpLf27oCoCirUO4q2kvoYBQ9zBmHDM2219gQX+CwBfflwO+rhBT3CXkQo
   AJSfeLviRk4ykuwo66m4OG92eM4fNsZNk1myXYt37RW0biL4dMh5DIUje
   g==;
X-CSE-ConnectionGUID: 8BJgWVxoRdWRjagIe6dVTA==
X-CSE-MsgGUID: 1PSJh+erSmuR84ZGKUFmeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50195647"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="50195647"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 02:22:07 -0700
X-CSE-ConnectionGUID: RDQbuHfrTaCLjjeUl19HIA==
X-CSE-MsgGUID: YvRXX3pqSkqXGLmAkijaTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="133663786"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.9])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 02:22:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
Date: Tue, 29 Apr 2025 12:22:00 +0300
Message-ID: <87o6wfwcef.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
> Hi Jani,
>
> On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
>> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
>> > Allocate panel via reference counting. Add _get() and _put() helper
>> > functions to ensure panel allocations are refcounted. Avoid use after
>> > free by ensuring panel pointer is valid and can be usable till the last
>> > reference is put.
>> >
>> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>> >
>> > ---
>> > v4: Add refcounting documentation in this patch (Maxime)
>> >
>> > v3: Add include in this patch (Luca)
>> >
>> > v2: Export drm_panel_put/get() (Maxime)
>> > - Change commit log with better workding (Luca, Maxime)
>> > - Change drm_panel_put() to return void (Luca)
>> > - Code Cleanups - add return in documentation, replace bridge to
>> > panel (Luca)
>> > ---
>> >  drivers/gpu/drm/drm_panel.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
>> >  include/drm/drm_panel.h     | 19 ++++++++++++++
>> >  2 files changed, 82 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
>> > index bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d2e4d8332f748 100644
>> > --- a/drivers/gpu/drm/drm_panel.c
>> > +++ b/drivers/gpu/drm/drm_panel.c
>> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
>> >  }
>> >  EXPORT_SYMBOL(of_drm_find_panel);
>> >  
>> > +static void __drm_panel_free(struct kref *kref)
>> > +{
>> > +	struct drm_panel *panel = container_of(kref, struct drm_panel, refcount);
>> > +
>> > +	kfree(panel->container);
>> > +}
>> > +
>> > +/**
>> > + * drm_panel_get - Acquire a panel reference
>> > + * @panel: DRM panel
>> > + *
>> > + * This function increments the panel's refcount.
>> > + * Returns:
>> > + * Pointer to @panel
>> > + */
>> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
>> > +{
>> > +	if (!panel)
>> > +		return panel;
>> > +
>> > +	kref_get(&panel->refcount);
>> > +
>> > +	return panel;
>> > +}
>> > +EXPORT_SYMBOL(drm_panel_get);
>> > +
>> > +/**
>> > + * drm_panel_put - Release a panel reference
>> > + * @panel: DRM panel
>> > + *
>> > + * This function decrements the panel's reference count and frees the
>> > + * object if the reference count drops to zero.
>> > + */
>> > +void drm_panel_put(struct drm_panel *panel)
>> > +{
>> > +	if (panel)
>> > +		kref_put(&panel->refcount, __drm_panel_free);
>> > +}
>> > +EXPORT_SYMBOL(drm_panel_put);
>> > +
>> > +/**
>> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a void pointer
>> > + *
>> > + * @data: pointer to @struct drm_panel, cast to a void pointer
>> > + *
>> > + * Wrapper of drm_panel_put() to be used when a function taking a void
>> > + * pointer is needed, for example as a devm action.
>> > + */
>> > +static void drm_panel_put_void(void *data)
>> > +{
>> > +	struct drm_panel *panel = (struct drm_panel *)data;
>> > +
>> > +	drm_panel_put(panel);
>> > +}
>> > +
>> >  void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
>> >  			     const struct drm_panel_funcs *funcs,
>> >  			     int connector_type)
>> >  {
>> >  	void *container;
>> >  	struct drm_panel *panel;
>> > +	int err;
>> >  
>> >  	if (!funcs) {
>> >  		dev_warn(dev, "Missing funcs pointer\n");
>> >  		return ERR_PTR(-EINVAL);
>> >  	}
>> >  
>> > -	container = devm_kzalloc(dev, size, GFP_KERNEL);
>> > +	container = kzalloc(size, GFP_KERNEL);
>> >  	if (!container)
>> >  		return ERR_PTR(-ENOMEM);
>> >  
>> >  	panel = container + offset;
>> > +	panel->container = container;
>> >  	panel->funcs = funcs;
>> > +	kref_init(&panel->refcount);
>> 
>> Hi Anusha, this should be done in drm_panel_init() instead.
>>
>> There are many users of drm_panel that don't use devm_drm_panel_alloc()
>> but allocate separately, and call drm_panel_init() only.
>
> That wouldn't really work, because then drivers would have allocated the
> panel with devm_kzalloc and thus the structure would be freed when the
> device is removed, no matter the reference counting state.
>
>> They'll all have refcount set to 0 instead of 1 like kref_init() does.
>> 
>> This means all subsequent get/put pairs on such panels will lead to
>> __drm_panel_free() being called! But through a lucky coincidence, that
>> will be a nop because panel->container is also not initialized...
>> 
>> I'm sorry to say, the drm refcounting interface is quite broken for such
>> use cases.
>
> The plan is to convert all panel drivers to that function, and Anusha
> already sent series to do. It still needs a bit of work, but it should
> land soon-ish.
>
> For the transitional period though, it's not clear to me what you think
> is broken at the moment, and / or what should be fixed.
>
> Would you prefer an explicit check on container not being 0, with a
> comment?

I'm looking at what it would take to add drm_panel support to i915 so
that you could have drm_panel_followers on it. There are gaps of course,
but initially it would mean allocating and freeing drm_panel ourselves,
not via devm_drm_panel_alloc() nor devm_kzalloc(), because none of the
other stuff is allocated that way. drm_panel would just sit as a
sub-struct inside struct intel_panel, which is a sub-struct of struct
intel_connector, which has its own allocation...

But basically in its current state, the refcounting would not be
reliable for that use case. I guess with panel->container being NULL
nothing happens, but the idea that the refcount drops back to 0 after a
get/put is a bit scary.

Anyway, I think there should be no harm in moving the kref init to
drm_panel_init(), right?

BR,
Jani.



-- 
Jani Nikula, Intel
