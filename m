Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D3C2571CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277622; cv=none; b=JbMEGAD/L/L3UjfSunpPLwJbXDqbvqGPsBHzahbOF4R1LiCn6pUFW2geTOdVyrWe29TpNDXcyV+QUKcL1yB+vJANcFDG7174wBxM5HlZazEp7KJj/MqGGWU40k5mx64OjR5LzT7pbp3cLTgtLG1ioROOXyCGUQ627ewznUzh6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277622; c=relaxed/simple;
	bh=yNTHmgA0vwiX9ZI5Od5QQa++dbX0ZMGjBIEVk8RBXbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWYn12YLvVo3vXSrvST50v9MXr4mAcD+zUP50TA0lBWciSU0x/XHfB8BqDfJdvc7KByEFtVb2phYJK/1L2cjxPJd/50o3sOvLaSYbZSrEYzv10Yoc+Wl7EZC3+cJMsu9EC+XNTRsp4IaXoHO/NLBYHn+gicE+FRr/TbNlV+KJdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRupQPsf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRupQPsf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so1289058a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744277618; x=1744882418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuO+brZQXiPJghd9emj1QQSfvrqSf5T0v7ZqHbwoZ40=;
        b=BRupQPsfWV/3H4wLs6StyMq8hlo/A1tc0G3PyFfcDDPb2hmhRWmughV81kXJuKYMYw
         mLAg2qvIOOSHVVaWQQxqJ6+jbJBrMQpTPMHhbDw9BsreKne+5Gb9Ojt/pIlwqOrIB6Le
         FtJ9q2F/kmtuC3hC/JNbjASI5NEVrmHBECZHshYZdPARkSzC60yNJa5vLbuKtXFi8Q+Q
         WYUuJji+JuGz32xBcnfWEnrTU0fQBozDXQ6V61NPRCnjFd3dOsV8IphTactJjcyMTZPZ
         aqiHQLA+ENZHCUEXuitjaSiPEtIYWDAHORZBsEUMU2a+pafBaaJObsudpvmBzeFKCUdV
         TO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277618; x=1744882418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EuO+brZQXiPJghd9emj1QQSfvrqSf5T0v7ZqHbwoZ40=;
        b=MUfwx68HPr5kwa3rBTLErmIvQMyRR28dc0/hVRlTITMXVJ2E6hcOBF0IShOzO+TczE
         ML0TKI9s00IWtRBSPqVyMHZQGydum8qovYYiOHPEK+0BPB0usFn+KKj5G9ke2rRGx5lh
         xQhlWK2QaBnmPa0ja9EVT3o8eTlZXLkolTPzsq80fOZYgeUcU2vsDxNQHeyKCx9IcIts
         JIyLzoN1yfj05xVNsyBSix6PAeAGqkzOUoaq/n2wjhQrjNZoLaCZV4lrRNaiAKY7nmGD
         zK2VMcXcX/UdXPmSPjlSayr2hnGnDjOGYbpP5VEqfaFlEwofDAuA+DXK9FlE2ak9NyI4
         KhGw==
X-Forwarded-Encrypted: i=1; AJvYcCVJWxwBMT+JuUYO7Prad1+TDK/C2MAS9M9FUdeT+beQ2uYkJ/zeIh1800WjJQHrcHC1voIRRzQobBXnaAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxckqWh/vwRIOpqkYcNaJv7eZBKgczLCZ4nekFYBXl92qVm0Qg8
	x4Rw7aMHxl/qvCVVuf08KSf4J2KFNnaIBAkbgWoPUXm5kv8lQWJJuSKo61Q8V498x3Ob88J4//Y
	3RUTWMQBPRwMoltR9nzn9nGZ5UmkHgyJ5N0aSzA==
X-Gm-Gg: ASbGncsmqeNbnx0V/VEqWf8k09f7lpZI5ZrBn55pLVGczTH0aKdqocDiw7KWF/v664H
	C5xU6CREWBj00E3zjdjmPTL9EeUsRWxHzbexWc/xrgje9n3kYtvkYkwUQF73FJkkariQmfm3w5i
	iCWbCZGKN/UsGKxRezDQBly3o=
X-Google-Smtp-Source: AGHT+IHQpxLbZAQQ13zaynRJL2c9HbhMeYqq42dawThUnx8xlULHCBD0an0leDkn4bmxDdtdUt3JkBMCX4J9/G92nTw=
X-Received: by 2002:a05:6402:5187:b0:5e0:82a0:50dd with SMTP id
 4fb4d7f45d1cf-5f329308bbdmr1628324a12.27.1744277618359; Thu, 10 Apr 2025
 02:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408154637.1637082-1-nunes.erico@gmail.com> <20250408154637.1637082-2-nunes.erico@gmail.com>
In-Reply-To: <20250408154637.1637082-2-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 10 Apr 2025 17:33:26 +0800
X-Gm-Features: ATxdqUEcyxfdU1-00StI0GqNWHnpq1Y0HdcuWsC3IvQXjDqGXE1seiA7fp9hAmM
Message-ID: <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: Erico Nunes <nunes.erico@gmail.com>
Cc: christian.koenig@amd.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:48=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> With this callback implemented, a terminating application will wait for
> the sched entity to be flushed out to the hardware and cancel all other
> pending jobs before destroying its context.

We do flush when file release in lima_ctx_mgr_fini. Why do we wait here
in flush? What's the difference?

> This prevents applications with multiple contexts from running into a
> race condition between running tasks and context destroy when
> terminating.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/lima/lima_ctx.h |  1 +
>  drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
>  3 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_=
ctx.c
> index 0e668fc1e0f9..e8fb5788ca69 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.c
> +++ b/drivers/gpu/drm/lima/lima_ctx.c
> @@ -100,3 +100,21 @@ void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr)
>         xa_destroy(&mgr->handles);
>         mutex_destroy(&mgr->lock);
>  }
> +
> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout)
> +{
> +       struct lima_ctx *ctx;
> +       unsigned long id;
> +
> +       mutex_lock(&mgr->lock);
> +       xa_for_each(&mgr->handles, id, ctx) {
> +               for (int i =3D 0; i < lima_pipe_num; i++) {
> +                       struct lima_sched_context *context =3D &ctx->cont=
ext[i];
> +                       struct drm_sched_entity *entity =3D &context->bas=
e;
> +
> +                       timeout =3D drm_sched_entity_flush(entity, timeou=
t);
> +               }
> +       }
> +       mutex_unlock(&mgr->lock);
> +       return timeout;
> +}
> diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_=
ctx.h
> index 5b1063ce968b..ff133db6ae4c 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.h
> +++ b/drivers/gpu/drm/lima/lima_ctx.h
> @@ -30,5 +30,6 @@ struct lima_ctx *lima_ctx_get(struct lima_ctx_mgr *mgr,=
 u32 id);
>  void lima_ctx_put(struct lima_ctx *ctx);
>  void lima_ctx_mgr_init(struct lima_ctx_mgr *mgr);
>  void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr);
> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout);
>
>  #endif
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index 11ace5cebf4c..08169b0d9c28 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -254,7 +254,22 @@ static const struct drm_ioctl_desc lima_drm_driver_i=
octls[] =3D {
>         DRM_IOCTL_DEF_DRV(LIMA_CTX_FREE, lima_ioctl_ctx_free, DRM_RENDER_=
ALLOW),
>  };
>
> -DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
> +static int lima_drm_driver_flush(struct file *filp, fl_owner_t id)
> +{
> +       struct drm_file *file =3D filp->private_data;
> +       struct lima_drm_priv *priv =3D file->driver_priv;
> +       long timeout =3D MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
> +
> +       timeout =3D lima_ctx_mgr_flush(&priv->ctx_mgr, timeout);
> +
> +       return timeout >=3D 0 ? 0 : timeout;
> +}
> +
> +static const struct file_operations lima_drm_driver_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       .flush =3D lima_drm_driver_flush,
> +       DRM_GEM_FOPS,
> +};
>
>  /*
>   * Changelog:
> --
> 2.49.0
>
