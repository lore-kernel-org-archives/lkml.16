Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E91EA65
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857920; cv=none; b=SkdUDGoHfUf9kpKE0+e/M798esmw50KsWR5aUfM6zcUzZa/7GIDKZiXe5bDsDM01+0AA7ocWyJJaf+bX4Wsx3hnbLbJN195Ol+EpGwRykTLfUoHxcTRL5JU254B+G35zh8aq1JFnp2GrW/43uAndJevVcsncQWmofcjyrb8PgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857920; c=relaxed/simple;
	bh=2flk/hePgzpEnCa5tkTmVPtt3EsWIE0IUFHUsusXdX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iH1R8VoKlUvHaSwYMw2CRCB3RVku/+NSwpt2quhk0e6/9tqT7GJD6cQYQnthj0v3NaV/MxT2QI/yFmeiVWXuK3ClZG951iGCouoAcTBNNXX/LXfLREaMAecx7rskP2iL9hXm3WqiJre8kuy0vA+bAPtnBS43otwksWm7L+CMxRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hITa48Ks; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hITa48Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745857918; x=1777393918;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=2flk/hePgzpEnCa5tkTmVPtt3EsWIE0IUFHUsusXdX4=;
  b=hITa48KsmkzgkpOcovSAoq4eF/U3COxGaDCjPgfCxPp52N3+SX8u+aPD
   P36HvTzrkyP4RMRWC8FSoF5A8K+aNOcdq6NAYwNdAShN5oDnhkFH2C7GZ
   tsViJfTYS7WGarEysFhASmZnpzIgNdTLSDwqGwlLeZbv064a/nZe46XGY
   pDmSbj9UHlhyS6VsBDV6/lVB4A7mvE1oEvFcYLwo5MfSVnEAN39j8a+Yt
   DR9FNNdWhdoTZg0wSm9QhR89eS11sdBbJwy7sxAmMhMOyH4rMUnj74JiB
   gjffK6eolGkKSR8gkFdtOq8U/DSxKTkRvEK+pXXu/JrQ/4sY/9szWXacX
   g==;
X-CSE-ConnectionGUID: 8fAY3bD0QAKC+RDyFtQOiA==
X-CSE-MsgGUID: f19kwnz9QpmCb2jxfeRXZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="64990938"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="64990938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:31:57 -0700
X-CSE-ConnectionGUID: ZjDgHR9hQyqRRRf05YluIg==
X-CSE-MsgGUID: xtdCujlnSJiUCj8kRmLw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133460477"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.174])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:31:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Anusha Srivatsa
 <asrivats@redhat.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
Date: Mon, 28 Apr 2025 19:31:50 +0300
Message-ID: <87y0vkw8ll.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> Allocate panel via reference counting. Add _get() and _put() helper
> functions to ensure panel allocations are refcounted. Avoid use after
> free by ensuring panel pointer is valid and can be usable till the last
> reference is put.
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>
> ---
> v4: Add refcounting documentation in this patch (Maxime)
>
> v3: Add include in this patch (Luca)
>
> v2: Export drm_panel_put/get() (Maxime)
> - Change commit log with better workding (Luca, Maxime)
> - Change drm_panel_put() to return void (Luca)
> - Code Cleanups - add return in documentation, replace bridge to
> panel (Luca)
> ---
>  drivers/gpu/drm/drm_panel.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
>  include/drm/drm_panel.h     | 19 ++++++++++++++
>  2 files changed, 82 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d2e4d8332f748 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  }
>  EXPORT_SYMBOL(of_drm_find_panel);
>  
> +static void __drm_panel_free(struct kref *kref)
> +{
> +	struct drm_panel *panel = container_of(kref, struct drm_panel, refcount);
> +
> +	kfree(panel->container);
> +}
> +
> +/**
> + * drm_panel_get - Acquire a panel reference
> + * @panel: DRM panel
> + *
> + * This function increments the panel's refcount.
> + * Returns:
> + * Pointer to @panel
> + */
> +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> +{
> +	if (!panel)
> +		return panel;
> +
> +	kref_get(&panel->refcount);
> +
> +	return panel;
> +}
> +EXPORT_SYMBOL(drm_panel_get);
> +
> +/**
> + * drm_panel_put - Release a panel reference
> + * @panel: DRM panel
> + *
> + * This function decrements the panel's reference count and frees the
> + * object if the reference count drops to zero.
> + */
> +void drm_panel_put(struct drm_panel *panel)
> +{
> +	if (panel)
> +		kref_put(&panel->refcount, __drm_panel_free);
> +}
> +EXPORT_SYMBOL(drm_panel_put);
> +
> +/**
> + * drm_panel_put_void - wrapper to drm_panel_put() taking a void pointer
> + *
> + * @data: pointer to @struct drm_panel, cast to a void pointer
> + *
> + * Wrapper of drm_panel_put() to be used when a function taking a void
> + * pointer is needed, for example as a devm action.
> + */
> +static void drm_panel_put_void(void *data)
> +{
> +	struct drm_panel *panel = (struct drm_panel *)data;
> +
> +	drm_panel_put(panel);
> +}
> +
>  void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
>  			     const struct drm_panel_funcs *funcs,
>  			     int connector_type)
>  {
>  	void *container;
>  	struct drm_panel *panel;
> +	int err;
>  
>  	if (!funcs) {
>  		dev_warn(dev, "Missing funcs pointer\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	container = devm_kzalloc(dev, size, GFP_KERNEL);
> +	container = kzalloc(size, GFP_KERNEL);
>  	if (!container)
>  		return ERR_PTR(-ENOMEM);
>  
>  	panel = container + offset;
> +	panel->container = container;
>  	panel->funcs = funcs;
> +	kref_init(&panel->refcount);

Hi Anusha, this should be done in drm_panel_init() instead.

There are many users of drm_panel that don't use devm_drm_panel_alloc()
but allocate separately, and call drm_panel_init() only. They'll all
have refcount set to 0 instead of 1 like kref_init() does.

This means all subsequent get/put pairs on such panels will lead to
__drm_panel_free() being called! But through a lucky coincidence, that
will be a nop because panel->container is also not initialized...

I'm sorry to say, the drm refcounting interface is quite broken for such
use cases.


BR,
Jani.


> +
> +	err = devm_add_action_or_reset(dev, drm_panel_put_void, panel);
> +	if (err)
> +		return ERR_PTR(err);
>  
>  	drm_panel_init(panel, dev, funcs, connector_type);
>  
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 415e85e8b76a15679f59c944ea152367dc3e0488..31d84f901c514c93ab6cbc09f445853ef897bc95 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -28,6 +28,7 @@
>  #include <linux/errno.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/kref.h>
>  
>  struct backlight_device;
>  struct dentry;
> @@ -266,6 +267,17 @@ struct drm_panel {
>  	 * If true then the panel has been enabled.
>  	 */
>  	bool enabled;
> +
> +	/**
> +	 * @container: Pointer to the private driver struct embedding this
> +	 * @struct drm_panel.
> +	 */
> +	void *container;
> +
> +	/**
> +	 * @refcount: reference count of users referencing this panel.
> +	 */
> +	struct kref refcount;
>  };
>  
>  void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
> @@ -282,6 +294,10 @@ void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
>   * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
>   * the panel interface
>   *
> + * The reference count of the returned panel is initialized to 1. This
> + * reference will be automatically dropped via devm (by calling
> + * drm_panel_put()) when @dev is removed.
> + *
>   * Returns:
>   * Pointer to container structure embedding the panel, ERR_PTR on failure.
>   */
> @@ -294,6 +310,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
>  		    const struct drm_panel_funcs *funcs,
>  		    int connector_type);
>  
> +struct drm_panel *drm_panel_get(struct drm_panel *panel);
> +void drm_panel_put(struct drm_panel *panel);
> +
>  void drm_panel_add(struct drm_panel *panel);
>  void drm_panel_remove(struct drm_panel *panel);

-- 
Jani Nikula, Intel
