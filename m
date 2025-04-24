Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CB134CF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520428; cv=pass; b=euqWxvAcJvw2Tyl20JO1lTwbmaRa7/pMOBt5DBK/i3cmN0FsGO0LpKWC0g9iDfBieW3FTXlA6kKeQn4ncA/3l80ECfL4LtK1ORdLZigIqzyKPAPCxupKuai0zaE9OEykMu1JXDPrqbv/r8GvpCTdyloZ6Aved/VvixYt7QPpNCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520428; c=relaxed/simple;
	bh=M3ftcjhiOcnvQhOVFp+zBAQnvmbzOiQ42FEGquCgVQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnW4nb0Df8AbebDvL3ou3+O9H5/T0Bp/7mxXA1py+xSKotxNLKjEqEjL3b8MyuWwj522nl7lwvpc3oZgDgPw/WCO65QsR8eeSkOAq3ERwz+zJmzFjGrr9A1VaIxUE8aMYVe7sisAr1Cc60TLh1BjNolHPi9lwq1BjxpEMqLzDOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=NehH5t5P; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NehH5t5P"
ARC-Seal: i=1; a=rsa-sha256; t=1745520412; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n9Hih4Y/kZKdFwnTcatSV+iTG0xfq6bNanI6svWMjxAR0dTizQ/kQElG08MCb3FVQh9Cvqtt7DNJUKkwtVTqaBiCi/3BhpNtA8UPhHFZL9BRQ1fRmktyenCwgM614mh/rYFiK66FJa9hUQVCMNpTGuTZWnW1Ok8P7sGEef2ztbM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745520412; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VnIRty3DmgrQ8Fp/zhn4k4TcM1bh8jcN0GPwYNWxrDM=; 
	b=YvWtlcYz0xPvI47VRy/NKuJzY3IPSFW4ea7WlJg25e6Q5+7jcAjBqVA52C1YtcN1CpV/XeMOwbvo10EoNGSgxEYyXje/AKDD2Br4Xix8EX1kc2sEE/hxwnYruPT/v+qD326retgM/3YLuuxHRYFj2Tfkhk1z/CW5QvGeb0i8kwY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745520412;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=VnIRty3DmgrQ8Fp/zhn4k4TcM1bh8jcN0GPwYNWxrDM=;
	b=NehH5t5PGXpo+WQlmxgvCzIvtkVKC3C4KzGIkRpNEHM6WcZtA7TWB+7xxROEHn+b
	bNTI/iM9fyXro4phR9Izi4klecwJOv1qej/1+BcTrC8EEQxN2KeEs4BA/LKZ31aX6MS
	KzufsL+vaOQrX7uZF4DPqeU5122cYU/Fh+WF/q0E=
Received: by mx.zohomail.com with SMTPS id 1745520410522235.14216279771347;
	Thu, 24 Apr 2025 11:46:50 -0700 (PDT)
Date: Thu, 24 Apr 2025 19:46:45 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Florent Tomasin <florent.tomasin@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: fix building without CONFIG_DEBUG_FS
Message-ID: <sv54dpnwhkx7kh5rqwdqgahtno746ylpazvlclypetrcy2hazq@hztdh5jwrke5>
References: <20250424112637.3432563-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424112637.3432563-1-arnd@kernel.org>

Hi Arnd,

Thanks for the fix. I've already submitted a second attempt because I thought the build being broken
is something we ought to deal with ASAP. I've added you as a bug reporter and also made mention
of this thread in the new patch.

Kind Regards,
Adrian

On 24.04.2025 13:25, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When debugfs is disabled, including panthor_gem.h causes warnings
> about a non-static global function defined in a header:
>
> In file included from drivers/gpu/drm/panthor/panthor_drv.c:30:
> drivers/gpu/drm/panthor/panthor_gem.h:222:6: error: no previous prototype for 'panthor_gem_debugfs_set_usage_flags' [-Werror=missing-prototypes]
>   222 | void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
>
> This could be changed to a static inline function, but as the normal
> one is also static inline, just move the #ifdef check in there.
> The #ifdef is still needed to avoid accessing a struct member that
> does not exist without debugfs.
>
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.h | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 4641994ddd7f..693842e10dee 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -209,17 +209,14 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
>
> -#ifdef CONFIG_DEBUG_FS
>  void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
>  				   struct seq_file *m);
>  static inline void
>  panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
>  {
> +#ifdef CONFIG_DEBUG_FS
>  	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> -}
> -
> -#else
> -void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
>  #endif
> +}
>
>  #endif /* __PANTHOR_GEM_H__ */
> --
> 2.39.5
