Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E6074BED
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899902; cv=none; b=HZYwBwFrPMiHd45DvM+0rdp0vKdijmawSbOvyrNZPeiGBzBmvDAFAMSEY0z5mugUWV3gPNuDdrFb6Wy045kU/u987NmedulHd4iCRtJE1f7PspvMBxp/mbDaLFpC36J0U+8I8LIZhZcQ0rJ+iWi89TW2+48pptr/G2ahS4MaOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899902; c=relaxed/simple;
	bh=fm3tSkk1uiZ17wtiMVDFxgwZiANGJ692DPmParqNIRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/cqX47r/wORhhJiLm2WsZXOGkhivI5RVIWaehHOKIBsMaFbNzLOw9+4NfUmcDmC9IkNbEDLDMIeEjInyahvPdCBEe1MBYwgL0ZVsGN0npvclwWic5E9ydZDWoDrUcCynQ8BqHbsf4QyNHjse+mDPLs/qdjSDfuPh8L/Gvru/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10BAE1515;
	Thu, 17 Apr 2025 07:24:57 -0700 (PDT)
Received: from [10.1.37.32] (e122027.cambridge.arm.com [10.1.37.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20BC13F694;
	Thu, 17 Apr 2025 07:24:56 -0700 (PDT)
Message-ID: <da7435d8-1618-4296-bf4a-beec646134a5@arm.com>
Date: Thu, 17 Apr 2025 15:24:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] drm/panthor: Introduce BO labeling
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250415191539.55258-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250415191539.55258-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/04/2025 20:15, Adrián Larumbe wrote:
> Add a new character string Panthor BO field, and a function that allows
> setting it from within the driver.
> 
> Driver takes care of freeing the string when it's replaced or no longer
> needed at object destruction time, but allocating it is the responsibility
> of callers.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 46 +++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 8244a4e6c2a2..8dd7fa63f1ff 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  /* Copyright 2023 Collabora ltd. */
>  
> +#include <linux/cleanup.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> @@ -18,6 +19,14 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>  	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
>  
> +	/*
> +	 * Label might have been allocated with kstrdup_const(),
> +	 * we need to take that into account when freeing the memory
> +	 */
> +	kfree_const(bo->label.str);
> +
> +	mutex_destroy(&bo->label.lock);
> +
>  	drm_gem_free_mmap_offset(&bo->base.base);
>  	mutex_destroy(&bo->gpuva_list_lock);
>  	drm_gem_shmem_free(&bo->base);
> @@ -196,6 +205,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
>  	obj->base.map_wc = !ptdev->coherent;
>  	mutex_init(&obj->gpuva_list_lock);
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> +	mutex_init(&obj->label.lock);
>  
>  	return &obj->base.base;
>  }
> @@ -247,3 +257,39 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  
>  	return ret;
>  }
> +
> +void
> +panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
> +{
> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> +	const char *old_label;
> +
> +	scoped_guard(mutex, &bo->label.lock) {
> +		old_label = bo->label.str;
> +		bo->label.str = label;
> +	}
> +
> +	kfree_const(old_label);
> +}
> +
> +void
> +panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
> +{
> +	const char *str;
> +
> +	/* We should never attempt labelling a UM-exposed GEM object */
> +	if (drm_WARN_ON(bo->obj->dev, bo->obj->handle_count > 0))
> +		return;
> +
> +	if (!label)
> +		return;
> +
> +	str = kstrdup_const(label, GFP_KERNEL);
> +	if (!str) {
> +		/* Failing to allocate memory for a label isn't a fatal condition */
> +		drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
> +		return;
> +	}
> +
> +	panthor_gem_bo_set_label(bo->obj, str);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 1a363bb814f4..af0d77338860 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -46,6 +46,20 @@ struct panthor_gem_object {
>  
>  	/** @flags: Combination of drm_panthor_bo_flags flags. */
>  	u32 flags;
> +
> +	/**
> +	 * @label: BO tagging fields. The label can be assigned within the
> +	 * driver itself or through a specific IOCTL.
> +	 */
> +	struct {
> +		/**
> +		 * @label.str: Pointer to NULL-terminated string,
> +		 */
> +		const char *str;
> +
> +		/** @lock.str: Protects access to the @label.str field. */
> +		struct mutex lock;
> +	} label;
>  };
>  
>  /**
> @@ -91,6 +105,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  			       struct panthor_vm *exclusive_vm,
>  			       u64 *size, u32 flags, uint32_t *handle);
>  
> +void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
> +void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
> +
>  static inline u64
>  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
>  {

