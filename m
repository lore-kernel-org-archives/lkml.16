Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1D625D1EC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830389; cv=none; b=RbaacPXg1jNu7gSw/E5r+VJWFyIRzfspxNvsfg1e9kYRRPNVhNTchv/D9pBVzb3teNsRWOqBwV+yqC+8GnZflXK1ZrVOoSZfJsdmwmQyjVO4a3UCxp/a+yg2y2CKbUxvBR/DRk9VA+TnhkzLCqNsSk728VNBKZ2cO8lSr/cX2vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830389; c=relaxed/simple;
	bh=hXXBsFE8riXQa5TAdgOA67GWKs4Sj0+TLCvhE8tlHO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBoiXI8TzyPp0uKtkEK4CEc8hAxuzbI+grZ/do5KtYbZLU2GUTTnVmgHmZV89IvQQV1x4edUZOxojEv0he0zLZUAvd4HlLECfo7nNrR0txjx2dF0mtamoiYd2oBGC6BJE2Zgim5C90+6kaGw+U16Btvnc/bro0nw61svXmlqLTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79B881595;
	Mon, 28 Apr 2025 01:52:59 -0700 (PDT)
Received: from [10.57.19.90] (unknown [10.57.19.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7B203F673;
	Mon, 28 Apr 2025 01:53:03 -0700 (PDT)
Message-ID: <1ae2f636-2695-4349-8590-c9893ff813ec@arm.com>
Date: Mon, 28 Apr 2025 09:53:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix build warning when DEBUG_FS is disabled
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250424184041.356191-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250424184041.356191-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2025 19:40, Adrián Larumbe wrote:
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

Reviewed-by: Steven Price <steven.price@arm.com>

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

