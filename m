Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFB821C19F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842765; cv=none; b=RxyFXmiR68z4y5oeso5v6NVX54Zj8yRpWNBcuzdgCyDceaMABdiXbfawvYR8eOGJQ86Mwtqxs0pLVs0GvahfE2kHq93mvFulFNtFDmDLeUoT2pLGMAQYbLud8jHPakqk95piOBGQxxc1miDppCFT0oLatOUCF/uwVxaOFgUvELo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842765; c=relaxed/simple;
	bh=62QbmXK0GwsKDw4Ad5OcPzH+bRvRp41PR9RE8v8QHD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hb26eCB/alHV6Nyn79weKFDbqq56DOe3LUs5Lo8GQW+KllRb9l15UF8xsyfFBeS7Wyirp4X1Js3f7heJPQ09T88IP2UjJxJS01tLsxN76XbggTqkWhkrHoeBGNGtxtb7fKhazDDsUC+mtfxKMj/Be6JNi/Yu1XnQZw22Blb2LLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA7E91515;
	Wed, 21 May 2025 08:52:26 -0700 (PDT)
Received: from [10.57.23.70] (unknown [10.57.23.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 143A73F6A8;
	Wed, 21 May 2025 08:52:37 -0700 (PDT)
Message-ID: <41515a2d-75c0-4537-888a-8d27c2050a80@arm.com>
Date: Wed, 21 May 2025 16:52:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/panfrost: Internally label some BOs
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
 <20250520174634.353267-3-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250520174634.353267-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2025 18:43, Adrián Larumbe wrote:
> Perfcnt samples buffer is not exposed to UM, but we would like to keep
> a tag on it as a potential debug aid.
> 
> PRIME imported GEM buffers are UM exposed, but since the usual Panfrost
> UM driver code path is not followed in their creation, they might remain
> unlabelled for their entire lifetime, so a generic tag was deemed
> preferable. The tag is assigned before a UM handle is created so it
> doesn't contradict the logic about labelling internal BOs.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c     | 10 ++++++++++
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 4c5be7ccc9cc..04483d5fb45d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -305,6 +305,16 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
>  	bo = to_panfrost_bo(obj);
>  	bo->noexec = true;
>  
> +	/*
> +	 * We assign this generic label because this function cannot
> +	 * be reached through any of the Panfrost UM driver-specific
> +	 * code paths, unless one is given by explicitly calling the
> +	 * SET_LABEL_BO ioctl. It is therefore preferable to have a
> +	 * blanket BO tag that tells us the object was imported from
> +	 * another driver than nothing at all.
> +	 */
> +	panfrost_gem_internal_set_label(obj, "GEM PRIME buffer");
> +
>  	return obj;
>  }
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index 52befead08c6..563f16bae543 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -111,6 +111,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  		goto err_put_mapping;
>  	perfcnt->buf = map.vaddr;
>  
> +	panfrost_gem_internal_set_label(&bo->base, "Perfcnt sample buffer");
> +
>  	/*
>  	 * Invalidate the cache and clear the counters to start from a fresh
>  	 * state.

