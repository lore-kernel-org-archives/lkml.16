Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B862820B5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524201; cv=none; b=D4BQ3uVb1uT4AWUBLOCHY81KxwQQ/qWOcEfObXfQujXwBNSaIvyTyNnBobBTlLzqBXmWkdwMhqXqiYwSSzcHOoi8x9BIprDzMHGYETlpRvl8WHRkBi5fMrC2Ngb3l6WCac/ztVLG965ZrTDioKUyb3YJ3t8Xu/i3RsJdvSvQAws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524201; c=relaxed/simple;
	bh=155gCE+VJ5BfbnUMdEyO9Y9pTw41QLuUqjNmUDlAaVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM/IXjtDP3/GuoxYUmq9eARxN+Rhyd/ZvlnDQWtG+tYXVr41RzslZ7yJtR0jpbas8ynttMVknYg7cdhHWxQFPE6LhisR9IHj4WTi0vcIywJHVdi13IZ2sH+u8eMA/kj6ovsgYXr1eecRo/T+ms0fqxR1IPcvhDpMO2uBk8XLs0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E44C106F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:49:52 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3598A3F59E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:49:57 -0700 (PDT)
Date: Thu, 24 Apr 2025 20:49:55 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panthor: Fix build warning when DEBUG_FS is disabled
Message-ID: <aAqV40nvvh2o3ztZ@e110455-lin.cambridge.arm.com>
References: <20250424184041.356191-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424184041.356191-1-adrian.larumbe@collabora.com>

On Thu, Apr 24, 2025 at 07:40:34PM +0100, Adrián Larumbe wrote:
> Commit a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM
> objects over DebugFS") causes a build warning and linking error when
> built without support for DebugFS, because of a non-inline non-static
> function declaration in a header file.
> 
> On top of that, the function is only being used inside a single
> compilation unit, so there is no point in exposing it as a global
> symbol.
> 
> This is a follow-up from Arnd Bergmann's first fix.
> Also move panthor_gem_debugfs_set_usage_flags() into panthor_gem.c and
> declare it static.
> 
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Closes: https://lore.kernel.org/dri-devel/20250424142419.47b9d457@collabora.com/T/#t
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 5 +++++
>  drivers/gpu/drm/panthor/panthor_gem.h | 8 --------
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 2dcf308094b2..7c00fd77758b 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -42,11 +42,16 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
>  	mutex_unlock(&ptdev->gems.lock);
>  }
>  
> +static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
> +{
> +	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> +}
>  #else
>  static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
>  				       struct panthor_gem_object *bo)
>  {}
>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> +static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
>  #endif
>  
>  static void panthor_gem_free_object(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 4641994ddd7f..4dd732dcd59f 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -212,14 +212,6 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
>  #ifdef CONFIG_DEBUG_FS
>  void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
>  				   struct seq_file *m);
> -static inline void
> -panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
> -{
> -	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> -}
> -
> -#else
> -void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
>  #endif
>  
>  #endif /* __PANTHOR_GEM_H__ */
> 
> base-commit: 3a2b7389feea9a7afd18d58cda59b7a989445f38
> -- 
> 2.48.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
