Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3DD224B0B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690657; cv=none; b=VlHHBiV5D07rqVcqBqigUorqqtPObWAEk/z6MMGop6z3lAtFukbShVmdbZLqxY3BW/DmysKFuoWaEJCkLZmGMtaoH5XFMfwi13ZUO0H9VAaFkgXJfHWNkQWt+JD3wBHHv8kRnTFY5uaLzbCPEaAe3dSFPZHh8hqnGtR6IYeszgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690657; c=relaxed/simple;
	bh=8sUwQ/gR6C8FYDEcOLVuxKNcdIng4fl8px+2OUlTGhE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzeDnfTDg0VmCQMC6itE7/5mlsV7Is9lRqGVaO6Mqbinp1nFVYYQM13dXvWnI20rLGq6q8pqilnQaE+bnebDNhhvZZratoWbxJwrRKzcdPAf29OODS1lHVavFLfFsb8Y7rphXXd7hMsREXSx5DdLV/sdz+pnEB8nl+IfX0gcAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HtLx2qEg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HtLx2qEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743690653;
	bh=8sUwQ/gR6C8FYDEcOLVuxKNcdIng4fl8px+2OUlTGhE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HtLx2qEgGJInf+4mIwGxb640gJQ9G39la8nrlQu0ClhNa+EBad6jC+4e1IUJSwlEP
	 wKTWcANYgo0Jy0D9nrRqiC9YhwXZwCFo0aYX5BRqLSzxV/dUGW+mT2LV4tZ4Em0mnC
	 YuymkuX02tMkQp6kkiOfeKbLD2a7GidqGXXN7rRaZfxSOW40WmVQootpiHVfh7gN1D
	 tyqnsPA1wnlzZZOdSHFPTL8YE75L7pgDYGxRdJtBWykgd6KVeroqTNSjJ8BNtrkVP6
	 mkut3CqaTMscbi+fWiv97FYO2BkiUpMk7VAAY09rPL9hRgLOZpectai9G1A7m/lTnQ
	 LfGuZELhvjV1g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08E1417E0391;
	Thu,  3 Apr 2025 16:30:52 +0200 (CEST)
Date: Thu, 3 Apr 2025 16:30:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v1] drm/shmem-helper: Fix unsetting shmem vaddr while
 vmap refcount > 0
Message-ID: <20250403163047.63929f63@collabora.com>
In-Reply-To: <20250403142633.484660-1-dmitry.osipenko@collabora.com>
References: <20250403142633.484660-1-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Apr 2025 17:26:33 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> We switched to use refcount_t for vmaps and missed to change the vunmap
> code to properly unset the vmap pointer, which is now cleared while vmap's
> refcount > 0. Clear the cached vmap pointer only when refcounting drops to
> zero to fix the bug.
> 
> Fixes: e1fc39a92332 ("drm/shmem-helper: Use refcount_t for vmap_use_count")
> Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Closes: https://lore.kernel.org/dri-devel/20250403105053.788b0f6e@collabora.com/T/#m3dca6d81bedc8d6146a56b82694624fbc6fa4c96
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 2d924d547a51..aa43265f4f4f 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -415,11 +415,11 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>  
>  		if (refcount_dec_and_test(&shmem->vmap_use_count)) {
>  			vunmap(shmem->vaddr);
> +			shmem->vaddr = NULL;
> +
>  			drm_gem_shmem_unpin_locked(shmem);
>  		}
>  	}
> -
> -	shmem->vaddr = NULL;
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap_locked);
>  

