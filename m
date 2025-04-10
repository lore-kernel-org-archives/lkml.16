Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8FEEB1;
	Thu, 10 Apr 2025 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744322803; cv=none; b=de/m4+zBrRAxMB4cmPRiXQMXSZIYF4k3lNDqIFFloJZgXd3OCkMCwUPDdQhgKmupKJG0N3FV2K6upATi4cXc2CmpAp8yPLMTe9rhP7wRarvvSmHvduAxhaW1ZWQ4T1UmqhNtI5lZsrcvX6Sys4+IBRZQ3wMvWRc0z7alFBaQ1DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744322803; c=relaxed/simple;
	bh=Jg6gNx0r4xnCZfOCVulJh/x/Sje4lcCTJVNC7IIghvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBAp7M0im+qMEvjo2Vk92yPBf/pyKrt+2twepE/TfLaC/cQSOks24vv6O/u0syXNdkoDr6KGCfSld1eaMxQr66Mpvie7laG1DrdtXz6yHEg9SuThqmLVUJprKv16C5/u2SxysvjvLVqohfD+/pIiSPETHsu7LIzmKfnikk6qXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2D93DAW; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2D93DAW"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3cfc8772469so4875225ab.3;
        Thu, 10 Apr 2025 15:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744322801; x=1744927601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7ICNZV18cZHr2vbkLA3GpRwRAJQKYpv6Yp1RF0PmOc=;
        b=a2D93DAWH5ZUJ4GdDEveCrIRRFH1J/cagI9KLZVuzPVx9ZeAHdkoBpn6biPU/IpejA
         tiZcjkf9CtsFRfRjNQAilzyyVuBtnYCkdDw3ChpI/CBSJXDjnV4x2f08uxTD8z1zcO8j
         syAg447XrMmMAcrlQGNMYsfzzErIH8ONSZhMi77dUEw3MPEiGNpR4pmVsOqBuLbzd7Zn
         W2I4z4RnWtJpWiud6peIki4jYI4BrXPvHwLNkizYyAVxvyFZgxJVbRlgTCNa4qBhfrxx
         IOwPzH+osp3ahb/NWVnfqwo+6c+w7LwUIPFrZZX5qBqunhLNSkgv2KACMFEfs3GcTSyp
         ZDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744322801; x=1744927601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7ICNZV18cZHr2vbkLA3GpRwRAJQKYpv6Yp1RF0PmOc=;
        b=mJxtg59x3BQiVLNAH3lh9hQGKEi+ZxzyuALWA1Ct19f9naXT8Tbq7nOGJQ3P/3NtBE
         e1jVY2uMlCc5YwTRqvBYPxY8ouAnO5CPwsISDlAS8o4wUOdlk/YtM2MB/ErLGVtW3Q5P
         q/URQUvQnlSlZfLa04YWHHC6g1TyH86nK0l6XEntpZfJI7bzSnhZJ6aaj+qNBEVxxLmX
         Bix22/6iV/zAKaMVA80qa7nsTd3C02wPvEA4XGcNBezhr+RonwGORAH/0OXvbfiuqRLe
         0tY/9NItfaTYdIlForMaKE0P/MoIL0oHPr3P1D8o3VpDSfL/QOXsxSYmnudyw5J+vWX1
         q0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKhEMN+oC34j1B//OgF3nJDzAfnZi/LhTWJlz2/cgvGMH2m6QgX4neNH2yeGp7/1sQWVyYter9oynel8LJrTg=@vger.kernel.org, AJvYcCXZP1b4MygSb/k3JCGCRcZ4nAbAtmhst8C19Snf7+VqkjB8/taB8L+wMoRaqvAPsD10ER9JhF8hz3hs5ZBU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5yO8CYGRd3rlgjdIlmxToTGD4C/cxTvdMe+fALUXUNN9EsRnD
	VAn2pmncHZ3dK9v04+GR9EU3RaGxpAYTJvmp6fpvWQLrdZHshUY+mnNBrueXyg3BmAVXvwU+TMm
	50Dtwa/o1oOf5kOLjW1ZmtV3alhg=
X-Gm-Gg: ASbGncvXkR1YFlnzTMBoiNPbRouKGF6PHsrHpna4U8+1JumJiugaEQ7jVzQQq0X0wqQ
	RbO9/zs/ho0gqk1sgs/SQnoXyMrDijFb42SE+5ICXS5vAgh0aEHtMueS/Ho/O22cfAXff7tpi2N
	Z+t5OKfhwAU1kmaCIuB/HryBSIt22bkyFQdPgtg3rFkrStmcX81Z1MwKTu
X-Google-Smtp-Source: AGHT+IEPRpH3UqQvP2ZHQTbc4I7CWqGnc1U/KINkDJ4Z6Yy1t8pFZOhHpeJPZSPZN4Ye+gf4xD7+v/NgFyUWDrafl80=
X-Received: by 2002:a92:c261:0:b0:3d3:e284:afbb with SMTP id
 e9e14a558f8ab-3d7ec2276f9mr6044675ab.11.1744322801057; Thu, 10 Apr 2025
 15:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mountain>
In-Reply-To: <c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mountain>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Apr 2025 15:06:28 -0700
X-Gm-Features: ATxdqUGor6TYjFwFif4Nt2sCrEKfvSFfALNnIVB1JHLShlwtHgWuM9y-gnK_g3U
Message-ID: <CAF6AEGshmGO0AAD3ndz-gN32r+xf2u=7gyf9aXbkZyb97AUXdA@mail.gmail.com>
Subject: Re: [PATCH next] drm/syncobj: Fix leak in drm_syncobj_import_sync_file_fence()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 9:33=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We need to cleanup if the chain =3D dma_fence_chain_alloc() allocation
> fails.  Now that we have multiple error returns in this function, switch
> to using an unwind ladder for cleanup.
>
> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline s=
yncobjs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 636cd83ca29e..c136d0c772dc 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -745,21 +745,24 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
>  {
>         struct dma_fence *fence =3D sync_file_get_fence(fd);
>         struct drm_syncobj *syncobj;
> +       int ret;
>
>         if (!fence)
>                 return -EINVAL;
>
>         syncobj =3D drm_syncobj_find(file_private, handle);
>         if (!syncobj) {
> -               dma_fence_put(fence);
> -               return -ENOENT;
> +               ret =3D -ENOENT;
> +               goto err_put_fence;
>         }
>
>         if (point) {
>                 struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
>
> -               if (!chain)
> -                       return -ENOMEM;
> +               if (!chain) {
> +                       ret =3D -ENOMEM;
> +                       goto err_put_syncobj;
> +               }
>
>                 drm_syncobj_add_point(syncobj, chain, fence, point);
>         } else {
> @@ -769,6 +772,13 @@ static int drm_syncobj_import_sync_file_fence(struct=
 drm_file *file_private,
>         dma_fence_put(fence);
>         drm_syncobj_put(syncobj);
>         return 0;
> +
> +err_put_syncobj:
> +       drm_syncobj_put(syncobj);
> +err_put_fence:
> +       dma_fence_put(fence);
> +
> +       return ret;

I suppose you could just initialize ret to zero and collapse the two
return paths?  Either way,

Reviewed-by: Rob Clark <robdclark@gmail.com>

>  }
>
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> --
> 2.47.2
>
