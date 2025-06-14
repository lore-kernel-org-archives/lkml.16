Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266124B26
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897545; cv=none; b=JeV7fZYSRyD/9p7UvAWg3KLL5oKID7EBT1QR2MIRcSJzwa8F9gQ7TdiHL6mlTmmMB5Nt87WBrXbSP0DXi9c+ikB1Ej4AXSNSo39QjGUcHCwalzkw40vm2RFWtAsa0WA8Zqldx/4p5e6gLDdRHHWYyfF3XhoVJzhcRepdY88H6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897545; c=relaxed/simple;
	bh=pPgjRoj5orgLQLzyVoWNsFO95k32W7oj9FSd8YcExp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMMuf+YnW/aGaQmRn0JRViUwMkJNN0296RZvlL/7k+baM1+D+9at2hjHwf7Phic8PO+WN21jcs5EVSOmkmknYnIDyOKaCHwNKIa+d7Gl0JZc9tR1t1ODaE9/Bborc8HmZI2jBiaaIfWTxgipjuuiBYkZpxfQraD48STTWaUXSGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KzZd7mQt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KzZd7mQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749897541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIANWIB6nwffMmsTBbNFHDHGCg1L4aQoyezG8SSvfNg=;
	b=KzZd7mQtyfcqYxPtaie9BR5zQnAY/PvEUMxV5QkSI1WLAqUuwn3LTzOTa8iuXPqWwS6sIj
	RiMU8evDiJ9cMrG0ko43JMOuNSLaXWSKW4IFZjeEEkuPdF9z9JJjMkrOs4y14045jMPuUV
	ZLJZAboiy6Rq7SPRsXa25+f5ofZpINY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-MZjoBODsM_2_7IRauQ0D7g-1; Sat, 14 Jun 2025 06:38:58 -0400
X-MC-Unique: MZjoBODsM_2_7IRauQ0D7g-1
X-Mimecast-MFC-AGG-ID: MZjoBODsM_2_7IRauQ0D7g_1749897537
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450de98b28eso21562825e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 03:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749897537; x=1750502337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIANWIB6nwffMmsTBbNFHDHGCg1L4aQoyezG8SSvfNg=;
        b=v7A0Ypdj08k+NCrTXPs3w1uj+vUYGndXQLGnrexGhZk6BZC4a+8yO783/TG8LLh0im
         F9UKMJar8eY/3pnSZp4bMXZm4Dn68+CTG913duTXUMijk10612ygTvC8ZFKjMh8JTYzI
         X1KtP278mjS7B7h1Y/gXbaq1rmMjedae8jPTyI3cg5OGXHqj4gHyNzrI0VprorhhcrCw
         /eMpDlPNPgMqZ+u+4iRHUikXn9DiUraaN+eSwbOZ24OAj/RGYPfyeKKWA4KphoEC2VTp
         sN/lGsi3yuF2dzcBw0RkU2avPyk1k5aL7GT3EMgiDtpl9XJaUG3ALoXyOa8hi1Tcfr0W
         +XZw==
X-Forwarded-Encrypted: i=1; AJvYcCURQqgQsDhR3f4zcwnPJvtQsiDeNLs9hikB7j8GhvlGoj/SO7nc63BEpKw2HtG6bmk/LkGsHUsXgtF12wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWrpoYPMjW6bCH0soXwo7VC6j709zh1J3uGCw+fSN7RdJJjh5h
	i9XnXEfccC/DkQOyUqIewzSTNiRQUs6sltxxu9Uzi6HUbELoR0+0ZOLgpnxfNyhNwWe0T85t1lc
	Ft5CgZaODURgN45jFckkvn1OIdya6glMMZVGcqDsnboJCCzlAaWuYsqW//IcYjh7ssQ==
X-Gm-Gg: ASbGncuMQcXLIKExDOM9/vRAMjc0uAh3G9vcLkWxfaOSTTvfcBJscX/bmcsJgIclsX0
	BG/VJAgDYnE4Y1X4DYppLBlH5X/nTE3QaesDyHujcvwAbP2UCjL9A7JcNEURlgt8un2f2cV8OpQ
	KkGwsWjXfKmwjqr85B4wQybsBzJKWBYpND4iyHtGyp7dJjWvFVJKyDBRFO3GTqelvhTicSKRdxc
	PfvLRQ0lH57H0hMETyp11sZGXCsVAl2+XcZMjqdrTDGINFiJltc/b1pdO3mA9Ft9yxZWszyCJqw
	ZqQuV1xGrH4=
X-Received: by 2002:a05:6000:1787:b0:3a4:da0e:5170 with SMTP id ffacd0b85a97d-3a56d84b061mr4246574f8f.27.1749897536728;
        Sat, 14 Jun 2025 03:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHukkp3GXm05X8ih8L/6TcAy+frWDO/6fM05ksvQmhRxI5FcoJb191KQKxBwD3XgtEhegeu5Q==
X-Received: by 2002:a05:6000:1787:b0:3a4:da0e:5170 with SMTP id ffacd0b85a97d-3a56d84b061mr4246560f8f.27.1749897536294;
        Sat, 14 Jun 2025 03:38:56 -0700 (PDT)
Received: from pollux ([2a00:79c0:666:b300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14f283sm79561175e9.27.2025.06.14.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 03:38:55 -0700 (PDT)
Date: Sat, 14 Jun 2025 12:38:53 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
Message-ID: <aE1RPZ_-oFyM4COy@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>

On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> For UNMAP/REMAP steps we could be needing to lock objects that are not
> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> VAs.  These helpers handle locking/preparing the needed objects.

Yes, that's a common use-case. I think drivers typically iterate through their
drm_gpuva_ops to lock those objects.

I had a look at you link [1] and it seems that you keep a list of ops as well by
calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.

Please note that for exactly this case there is the op_alloc callback in
struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
msm_vm_op) that embedds a struct drm_gpuva_op.

Given that, I think the proposed locking helpers here would make more sense to
operate on struct drm_gpuva_ops, rather than the callbacks.

Besides that, few comments below.

--

One additional unrelated note, please don't use BUG_ON() in your default op
switch case. Hitting this case in a driver does not justify to panic the whole
kernel. BUG() should only be used if the machine really hits an unrecoverable
state. Please prefer a WARN_ON() splat instead.

[1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drivers/gpu/drm/msm/msm_gem_vma.c?ref_type=heads#L1150

> Note that these functions do not strictly require the VM changes to be
> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> call result in a differing sequence of steps when the VM changes are
> actually applied, it will be the same set of GEM objects involved, so
> the locking is still correct.

I'm not sure about this part, how can we be sure that's the case?

> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpuvm.h     |  8 ++++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 0ca717130541..197066dd390b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
>  
> +static int
> +drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
> +{
> +	struct drm_exec *exec = priv;
> +
> +	switch (op->op) {
> +	case DRM_GPUVA_OP_REMAP:
> +		if (op->remap.unmap->va->gem.obj)
> +			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
> +		return 0;
> +	case DRM_GPUVA_OP_UNMAP:
> +		if (op->unmap.va->gem.obj)
> +			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
> +		return 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct drm_gpuvm_ops lock_ops = {
> +	.sm_step_map = drm_gpuva_sm_step_lock,
> +	.sm_step_remap = drm_gpuva_sm_step_lock,
> +	.sm_step_unmap = drm_gpuva_sm_step_lock,
> +};
> +
> +/**
> + * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_sm_map()

I think we should name this drm_gpuvm_sm_map_exec_lock() since it only makes
sense to call this from some drm_exec loop.

> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @exec: the &drm_exec locking context
> + * @num_fences: for newly mapped objects, the # of fences to reserve
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + * @req_obj: the &drm_gem_object to map
> + * @req_offset: the offset within the &drm_gem_object
> + *
> + * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
> + * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> + * will be newly mapped.
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
> +		      struct drm_exec *exec, unsigned int num_fences,
> +		      u64 req_addr, u64 req_range,
> +		      struct drm_gem_object *req_obj, u64 req_offset)
> +{
> +	if (req_obj) {
> +		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
> +		if (ret)
> +			return ret;
> +	}

Let's move this to drm_gpuva_sm_step_lock().

> +
> +	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> +				  req_addr, req_range,
> +				  req_obj, req_offset);
> +
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_lock);

