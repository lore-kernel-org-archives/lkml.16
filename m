Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A2219922D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006563; cv=none; b=PjKCHtdRo81HAADTO4ThZWNittml2IcvnS+NBbix3bSbWVv2PuHbUxuzV8CeNy/WyEV7mGU29MX1hJdDWygBds7x2wdbKmMWZjB8RySOgT0as5QbEjPRqOTpCzb12nZ46Lz41B0yGkQIKVg6RpkvAdN/6ADlywb4QVdwgFBrTU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006563; c=relaxed/simple;
	bh=Gtg5XkVcgEtOgaNbPaSn4NN4C+K7EofpFq4BGBA1nzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GR4jwMNAtmRZTL6ZsZIByuXzZq51PGB4YxTchBzLMhrKQGeDp8RFJ/XN0AXGZ+9zCtNYCl0C36wic0LD7U3t+u+RfO+mOxg6EpK6O2+cE+c7U+r+Gju9orPCX8drPjaNtXRBuaHEsX8vm0ajll/+4B+Hbfo0ex83PrYRYLDQvcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mODo3ST6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mODo3ST6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a07a7b4ac7so2324951f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746006557; x=1746611357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LLFFbFj4LwW7R7V2JhHGReQ4jijzBvrTImoxET+7TD4=;
        b=mODo3ST6E+dncjv5CR6H4o18W0tG2XFNrffnj1Y37Xli7cBqyKysyd4j4X9GaGhlzt
         VOLgOCHhJNm0tHWR+GKLmsDCPz3VGYGotz3ye5eqfoVHQ/NiNm6ebnV3Pj2v17HsRvM7
         pgVUl7kd22IuJ2Rb/pgMtr1gRjQRiY+SVcCKcylvMcxbPBQYuSsAT1rJGdOtZniRhA4e
         +y3QGnvr4iMPRNKvGEWHkgl2LuUkpsN7clDwoSpj/T1z42Pj+dzA14Yr+AILcuy2CAoV
         annUuukbALivc3R4xv15k31EgOCRDElJQau4UGj7nWrtug/ylqdsHpjdsoWvT6NOgYRs
         4c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746006557; x=1746611357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLFFbFj4LwW7R7V2JhHGReQ4jijzBvrTImoxET+7TD4=;
        b=bU5BqPsQWlSHx2scQwcKaB3hX6xtQlRqm49M9hiX4fxkgHytoLWE/Go5Iu73UtZD99
         c5sbhekLS8p1GJIkQWkJ7lldoY3ksf0St85zjr2tYsuYquQt5tPlm1mDnMOwfFRasbo9
         v7VBRi3dsvXkTE04EbzYiXYRjPlei/arGUvj6d80Cc9cHtFfKm9Njwfv9pm/2n2b8nEk
         PbEwLbcZJNR/MgAUJVz8IZsELUJoUOlsTk3uqdeHf8/nMGdHQshkTy+qyl9csh8cuFam
         5dqmh55xS0vP2CboSuKpVBRpAIHqeOdKZ9elPokRw+X+fFrN2OFsEq9DuXILEcQO5EUr
         vH8A==
X-Forwarded-Encrypted: i=1; AJvYcCXpx0IrhvNnzsg03L6pla+YenlfLQDHv0yPqwycaJ7VxCmXJ18IE87UABncoDM1KOGJSDkBN75HXvgZSR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwblWbpeXL7iBDUFvI/w13Gx3+hglnKhOyNU5dLMRsI1RCXPLrd
	ZiBUT/nbL6voZjuEtqWpRnxhlDfutthkOxB7Kf7vzYznB/refiglNlkUfX1Ro6c=
X-Gm-Gg: ASbGnct3WRJ7DdKGO/sKfDxphLHNqEgE9DD99lSLV32ZiCuXDmciUM37PnTa1Y6+h68
	ryLZPKcjVnYUA2Mqx1O4eB1bln21Bm78BQJl+0L8ABz+NBdaee0cR6FJfKvMjHxVSAmyBrzqnye
	/T7X4tSw+qZ3qmV1fXIyofA0/eNTze+6yC3RQBbYuc8k4vIni72cqkFnLZa3sk16LAreQIHTqG1
	gy6PbPAV4z8EjGk59w/Mr2DdzIEk8+6/0nVxL+OPRzM+T8XLJGuy+WQacPH3rfNuw+6n1tuwPAW
	vBNK0fl1oUAi1Cdph6OtrpkscJgyKGHaWVh/F49AXn1ZXHSutC2EDVcp
X-Google-Smtp-Source: AGHT+IEK9MNRUEuA0t/++NHkSN+uAgTx0QHITofMQSiawq0yr1kRwXaeYfFa/CByGh7RO0Ly8OPlsA==
X-Received: by 2002:a05:6000:420e:b0:39e:dbb0:310f with SMTP id ffacd0b85a97d-3a08f7c862emr2373168f8f.39.1746006557355;
        Wed, 30 Apr 2025 02:49:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8d1a5sm16918149f8f.13.2025.04.30.02.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:49:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:49:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Khatri, Sunil" <Sunil.Khatri@amd.com>,
	"Yadav, Arvind" <Arvind.Yadav@amd.com>,
	"Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
Message-ID: <ac039a7e-4152-4df5-af3d-c952cedfa6dd@stanley.mountain>
References: <aBHZuejTTKkdnGaZ@stanley.mountain>
 <MW4PR12MB566769E097E394ED607DBD9CF2832@MW4PR12MB5667.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR12MB566769E097E394ED607DBD9CF2832@MW4PR12MB5667.namprd12.prod.outlook.com>

On Wed, Apr 30, 2025 at 09:28:59AM +0000, Sharma, Shashank wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hello Dan,
> 
> ________________________________
> From: Dan Carpenter
> Sent: Wednesday, April 30, 2025 10:05 AM
> To: Deucher, Alexander
> Cc: Koenig, Christian; David Airlie; Simona Vetter; Sharma, Shashank; Khatri, Sunil; Yadav, Arvind; Paneer Selvam, Arunpravin; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
> 
> The "ticket" pointer points to in the middle of the &exec struct so it
> can't be NULL.  Remove the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> index b0e8098a3988..7505d920fb3d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
>                          clear = false;
>                          unlock = true;
>                  /* The caller is already holding the reservation lock */
> -               } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
> +               } else if (dma_resv_locking_ctx(resv) == ticket) {
> 
> Its a Nack for me, There are a few situations (particularly during the
> first launch of the desktop, and also when eviction fence and new queue
> creation are working in parallel) where this ticket can be NULL, we
> observed it during the stress validation and hence added this check,
> 

It shouldn't be NULL.  It sounds like you are experiencing stack
corruption and this is just a bandaid.

drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
   566  static int
   567  amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
   568  {
   569          struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
   570          struct amdgpu_vm *vm = &fpriv->vm;
   571          struct amdgpu_device *adev = uq_mgr->adev;
   572          struct amdgpu_bo_va *bo_va;
   573          struct ww_acquire_ctx *ticket;
   574          struct drm_exec exec;
                ^^^^^^^^^^^^^^^^^^^^^
The "exec" struct is declared on the stack.

   575          struct amdgpu_bo *bo;
   576          struct dma_resv *resv;
   577          bool clear, unlock;
   578          int ret = 0;
   579  
   580          drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
   581          drm_exec_until_all_locked(&exec) {
   582                  ret = amdgpu_vm_lock_pd(vm, &exec, 2);
   583                  drm_exec_retry_on_contention(&exec);
   584                  if (unlikely(ret)) {
   585                          DRM_ERROR("Failed to lock PD\n");
   586                          goto unlock_all;
   587                  }
   588  
   589                  /* Lock the done list */
   590                  list_for_each_entry(bo_va, &vm->done, base.vm_status) {
   591                          bo = bo_va->base.bo;
   592                          if (!bo)
   593                                  continue;
   594  
   595                          ret = drm_exec_lock_obj(&exec, &bo->tbo.base);
   596                          drm_exec_retry_on_contention(&exec);
   597                          if (unlikely(ret))
   598                                  goto unlock_all;
   599                  }
   600          }
   601  
   602          spin_lock(&vm->status_lock);
   603          while (!list_empty(&vm->moved)) {
   604                  bo_va = list_first_entry(&vm->moved, struct amdgpu_bo_va,
   605                                           base.vm_status);
   606                  spin_unlock(&vm->status_lock);
   607  
   608                  /* Per VM BOs never need to bo cleared in the page tables */
   609                  ret = amdgpu_vm_bo_update(adev, bo_va, false);
   610                  if (ret)
   611                          goto unlock_all;
   612                  spin_lock(&vm->status_lock);
   613          }
   614  
   615          ticket = &exec.ticket;
                ^^^^^^^^^^^^^^^^^^^^^
ticket is only set here.  We know that &exec is non-NULL because it's
declared on the stack.  ticket is 4 bytes into the middle of a non-NULL
struct.  It is impossible for ticket to be NULL here.

   616          while (!list_empty(&vm->invalidated)) {
   617                  bo_va = list_first_entry(&vm->invalidated, struct amdgpu_bo_va,
   618                                           base.vm_status);
   619                  resv = bo_va->base.bo->tbo.base.resv;
   620                  spin_unlock(&vm->status_lock);
   621  
   622                  bo = bo_va->base.bo;
   623                  ret = amdgpu_userq_validate_vm_bo(NULL, bo);
   624                  if (ret) {
   625                          DRM_ERROR("Failed to validate BO\n");
   626                          goto unlock_all;
   627                  }
   628  
   629                  /* Try to reserve the BO to avoid clearing its ptes */
   630                  if (!adev->debug_vm && dma_resv_trylock(resv)) {
   631                          clear = false;
   632                          unlock = true;
   633                  /* The caller is already holding the reservation lock */
   634                  } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {

I've included the whole rest of the function so that we can see it is not
set a second time.

regards,
dan carpenter

   635                          clear = false;
   636                          unlock = false;
   637                  /* Somebody else is using the BO right now */
   638                  } else {
   639                          clear = true;
   640                          unlock = false;
   641                  }
   642  
   643                  ret = amdgpu_vm_bo_update(adev, bo_va, clear);
   644  
   645                  if (unlock)
   646                          dma_resv_unlock(resv);
   647                  if (ret)
   648                          goto unlock_all;
   649  
   650                  spin_lock(&vm->status_lock);
   651          }
   652          spin_unlock(&vm->status_lock);
   653  
   654          ret = amdgpu_eviction_fence_replace_fence(&fpriv->evf_mgr, &exec);
   655          if (ret)
   656                  DRM_ERROR("Failed to replace eviction fence\n");
   657  
   658  unlock_all:
   659          drm_exec_fini(&exec);
   660          return ret;
   661  }


