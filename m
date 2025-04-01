Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6621DBB2E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537220; cv=none; b=W4QargUob07KqmhP/RYzSPuFF4sMzCENXQSVJLEQS5EoNJEI61LOShOo1Pht58JYfMuIxvjCUkjeYgdg4elMBSEgiXJRndasUviJVaR8WADxXt/kNy90DbjkkU7KH3xxmcbHhkzDJWJqNwY5XsEJhBt0UwjG08ge9buGdsGkRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537220; c=relaxed/simple;
	bh=zPfW6zElnlUyhJ3e8iC6TcgDU1kGgEtSygY6fjC98wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rljPQYP2AXoZc1d3hVIwQK9cHoExvM8xTsp0S981TNVU0z8Rtv9DFUFM9rLQXLtuz7XY966LcstN3srwMMcPI2D053cKrG60UxTkzcr2j5l6T22TEOOdG/dVA+GM4RQHoOKXKrGqT+98JrHE/tv5FTPtMtnfdEVSSOT/fShHLOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK/MTG0b; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK/MTG0b"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85b5e49615aso562898739f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743537218; x=1744142018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gc7B5TWF5E7dS0lIFexpVCDTxyXmK4Y/wIY/rEIEhGo=;
        b=XK/MTG0bwaGGArE03YZTBLwgdK39n5H/nKYgWK7shOlo7j4J4r4yx4QkPVR2RU85TD
         /xdq+Wc1e5UKuanOFtR3+rj/QWFo8j4x1LByRkJAeNN/5uIRAbf8FaiWROhO9Gejl7Ye
         UGTY4ibOM1r6jocvZowsc59uiEjPqXk/kHSOaS75q5FFWMmDbe4KFeaGSHkV9lLjrzTM
         f35kERZu3qHAmnS3wwytbV77agOswUIQqUIZGekkf40sa4ITkOWDe+0bPIpb5XJiy4OS
         PHT3IDVcOCN1RlIKmNV0d2vcqtBQ2Cd9MjJprpnofhCTQ9NSSo7+MUIICnqznquJC12r
         tnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537218; x=1744142018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gc7B5TWF5E7dS0lIFexpVCDTxyXmK4Y/wIY/rEIEhGo=;
        b=exEkZZxA+DQyx0tyFnMM9stTMoqWH2D6I2+/y+fVQbENQwRX7+XCU/7QTr55mjdiZx
         xw6ftPgfQTefgWDUERoOGegmt360nH5Px6UHcNvJ/ie33HHj2goQ9ZrDlluGlwiAu59x
         0GWoIJ5oL1DW66Sz5lp1S3KgPTVleI9vU/FLpWMrKu5t2wzsKk3eW5HpkUwzTNh28fGR
         zQ8yddbnn9MF65BgO2IBKvtS+WmPVA5MrxRGDWAr3K3IPf/aWbQ4VSrRiHFbCSnlc/KX
         oqjMVtwuplkyNBnfqXA3M7jOs+nggLqdbg5qQXWYI4+8DwLhW0AwTG7niVy/JRo2ApVY
         U4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVffbMlyK7FJuZfNTK0da/t88s0/byH98qVfB1mM1A9p9tJ1QQRLIbHmr4mak2IqqH76RIUOXy14wlN8Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGrl8aoy2bjx4tSTxHnDbRJPpIfYEfqofX1ToPOA/mUeDj098y
	Lwqd0c48DI4k7Z7RPP8OFIUhNN7+URMcR69efp/t+1L4MNYef+hSpby1JBDLpT32n7z3pCiz1D+
	JhDR3dO7h5MsLPvJX9WzcSAzC1N4=
X-Gm-Gg: ASbGncuh6Xn94pkv9WWH0zUXdsHMKOIoO39VKh9tkmEIAe+EzV7GqZLLeuSLk6GPP2m
	89AaSUuCSlv/X+9sRp5ugmtAw4IQXIwctHCoLPRz7Cbv2goT3x69XlAjmI+gYMU9ZQJnSQ5WNhV
	HeypzguC9xib+7KIijBtNcJx0znMNf4dvpqqNgyH8ApjAiCCL/VckPa77k
X-Google-Smtp-Source: AGHT+IH3S71OAEwFMQD4R/OEKTAMcAKSmJhwYs7vzK+zU99RQKuLFvb95AfvxDZWWU8kud8NGXbifBK7Do0dL2fI2Sw=
X-Received: by 2002:a05:6e02:4401:10b0:3d1:9999:4f62 with SMTP id
 e9e14a558f8ab-3d6ca5b1852mr42452585ab.2.1743537217735; Tue, 01 Apr 2025
 12:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401123842.2232205-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20250401123842.2232205-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Apr 2025 12:53:25 -0700
X-Gm-Features: AQ5f1JoQHRRLbQWDkENOEX3GOQ6LDd-52WdH18mm3il4tRiQyy7pyqd6guv7zl8
Message-ID: <CAF6AEGu8XZktM9Y0t=KEF68uGLz7D_+9H1GnAPnZqc1YsT8iGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/virtio: Don't attach GEM to a non-created
 context in gem_object_open()
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 5:39=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> The vfpriv->ctx_id is always initialized to a non-zero value. Check wheth=
er
> context was created before attaching GEM to this context ID. This left
> unnoticed previously because host silently skips attachment if context
> doesn't exist, still we shouldn't do that for consistency.
>
> Fixes: 086b9f27f0ab ("drm/virtio: Don't create a context with default par=
am if context_init is supported")
> Cc: <stable@vger.kernel.org> # v6.14+
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virti=
o/virtgpu_gem.c
> index 5aab588fc400..3d6aa26fdb53 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -115,13 +115,14 @@ int virtio_gpu_gem_object_open(struct drm_gem_objec=
t *obj,
>         if (!vgdev->has_context_init)
>                 virtio_gpu_create_context(obj->dev, file);
>
> -       objs =3D virtio_gpu_array_alloc(1);
> -       if (!objs)
> -               return -ENOMEM;
> -       virtio_gpu_array_add_obj(objs, obj);
> +       if (vfpriv->context_created) {
> +               objs =3D virtio_gpu_array_alloc(1);
> +               if (!objs)
> +                       return -ENOMEM;
> +               virtio_gpu_array_add_obj(objs, obj);
>
> -       if (vfpriv->ctx_id)
>                 virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx=
_id, objs);
> +       }
>
>  out_notify:
>         virtio_gpu_notify(vgdev);
> --
> 2.49.0
>
