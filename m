Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA582E40E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623917; cv=none; b=IcZvbXL1LOQpGl62VYY7jJQ5nzK7Oa9R2uuSDTvtpBD4rQ1kL+51WeOm+/AK6dhszsdEt0777/D+ixClxfS2kcHzdDQLCqZMiZ5hI6+pVVQZJ0YNHRWsew5Qb6R6hAM6p8/8KXdQSvip6rPNVVoFtJDnCl0R6FdwKeV0YlDLmp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623917; c=relaxed/simple;
	bh=rC8MjQhwGQeqZYtvOetoLdpalN10pzZdQu0YjQOOTjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFesbcljThGC6wTMXT70KrNxp79R4goUuryIKBN38vTQWXEG1gRNGxoHDuYST6LvGkhIzpLeBMoJvHqeALqpR/UEenSXzY7qC2ibARhK3ONXAr2U1zyc/ESfNzcWfbGknTSuAzlmaEUwbjATtWSexotAZjUBL6eGdobT7X0ny/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2361F339;
	Wed,  7 May 2025 06:18:24 -0700 (PDT)
Received: from [10.57.20.214] (unknown [10.57.20.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 334C63F58B;
	Wed,  7 May 2025 06:18:32 -0700 (PDT)
Message-ID: <24ee069c-b66a-4810-b8aa-4aa88d8fdab4@arm.com>
Date: Wed, 7 May 2025 14:18:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/panfrost: Add BO labelling to Panfrost
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
 <20250424022138.709303-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250424022138.709303-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2025 03:21, Adrián Larumbe wrote:
> Unlike in Panthor, from where this change is based on, there is no need
> to support tagging of BO's other than UM-exposed ones, so all strings
> can be freed with kfree().
> 
> This commit is done in preparation of a following one that will allow
> UM to set BO labels through a new ioctl().
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

But one comment below

> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h | 16 ++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 963f04ba2de6..a7a29974d8b1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/dma-buf.h>
> @@ -35,6 +36,9 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
>  	 */
>  	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
>  
> +	kfree(bo->label.str);
> +	mutex_destroy(&bo->label.lock);
> +
>  	if (bo->sgts) {
>  		int i;
>  		int n_sgt = bo->base.base.size / SZ_2M;
> @@ -260,6 +264,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
>  	mutex_init(&obj->mappings.lock);
>  	obj->base.base.funcs = &panfrost_gem_funcs;
>  	obj->base.map_wc = !pfdev->coherent;
> +	mutex_init(&obj->label.lock);
>  
>  	return &obj->base.base;
>  }
> @@ -302,3 +307,17 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
>  
>  	return obj;
>  }
> +
> +void
> +panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +	const char *old_label;
> +
> +	scoped_guard(mutex, &bo->label.lock) {
> +		old_label = bo->label.str;
> +		bo->label.str = label;
> +	}
> +
> +	kfree(old_label);
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index 7516b7ecf7fe..c0be2934f229 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -41,6 +41,20 @@ struct panfrost_gem_object {
>  	 */
>  	size_t heap_rss_size;
>  
> +	/**
> +	 * @label: BO tagging fields. The label can be assigned within the
> +	 * driver itself or through a specific IOCTL.

From the commit message (about the use of kfree()) I assume we are not
expecting this to be assigned "within the driver itself"?

Thanks,
Steve

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
> +
>  	bool noexec		:1;
>  	bool is_heap		:1;
>  };
> @@ -89,4 +103,6 @@ void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
>  int panfrost_gem_shrinker_init(struct drm_device *dev);
>  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
>  
> +void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
> +
>  #endif /* __PANFROST_GEM_H__ */

