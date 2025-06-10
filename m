Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFED528C028
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749598390; cv=none; b=kAn8W0I1/2MwCwAGEkG8/dqYryOhbK0vIkbe1Hy45C1hNhGHqqNhTSM7Ko6ZOqoHvDrY/CC+UNke8B5jywFsea45T3sqZtq+gaPKNZxDGQFwFXRku2OEOvuz7Tp9UgsxRrF58b+37aMuvojrohKGl1TEYsk4gCxEiy4pwZXW1gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749598390; c=relaxed/simple;
	bh=QWbWWYTT8vFmzPY01VNI05a6ihr26mafD98b/pWDI8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDNHLuhkO8gj582vBw2rJybYfg9sfDY7w1y2qkwwT0WHPqdvrFI97r8G02Ic5NMuM/mlRADxqG8afXmtPrCEkBvORHXuf7kQaYH2euTKytUzhsnXmhKfpOQL3h8rdSwj4sjKcXQRXcTvVxQ63QY9LyBXIbTwofRoiacYjl7WDQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T24+Ue6e; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T24+Ue6e"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70f94fe1e40so3939497b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749598387; x=1750203187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlG8KwxfPBX8caQBZm1QvHCHRc2s6v2Ip6KIurSeMk4=;
        b=T24+Ue6ebqs65IwIV9b0VLA/tMfnBZiHjzs9Xi6n0zrCwRrLIQmVZHbdaSJUpr6QJC
         TAarhLXTyf6IQt0dWa16lZYyuWJ/UOZxIKfkGMri3fpfbzK9KLj1nkeatnzQbQHmlJRj
         qYIKJHaPG7Z72rMJzKYw2ptNSoAdLcDekWG/e9aKAMtnkNhBJeMRqUfHbWe2rNbO8hCJ
         8dp55wILEZdCrxpbh/8jx98wdr4LlPT3D0fSUS+R4uH8cS6eIBDxzIO0e0GftcG24A/H
         SmGAThiMFi1tUYGKiVQhfvqXnjNv6T2F4rdMSRHbveSWoQsTc+K8xSMvIx00Y9uXGxcV
         seqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749598387; x=1750203187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlG8KwxfPBX8caQBZm1QvHCHRc2s6v2Ip6KIurSeMk4=;
        b=VrlJzDL4lO2Dc8KqBwflhh5QdpwX4Kd5hIaGfKXAcW+4P3CJi0/4eaA9/jvuB04vcv
         U9LtErzYF7h7equzyC7/RR4cIA6mreNNEfIPQqgjm3SGr61QHjFonl7hnBC2h5wbbbsa
         fNDAwAoRnaAbd+JQdnknqRfJGtv8n67RQYRNBQZymxaF4IvdKu/59jq7eiti/CQJRU5Y
         h7TBiF8/krQWzNzyS2uiHjRyt9cpAH2JeA9I0gggF2nqU6hOX+0CLkWJboy9xqw17+5P
         FsuNH9syXHqy7vOeSUTrMm9gxS+m1Z6lqRDGEyOsJc7EpNko4ELDd+kISZA/3+O5rBR0
         SQLA==
X-Forwarded-Encrypted: i=1; AJvYcCXQYPN7oIquS6XZOLGhuNX+1QdApGhR981yKjtiHs6/76mQVZFnR2kDB3no1avyoTeWFSjhPWDC4C7fRjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK28e1XDg6LtVYnEfOtZh3ZsojbvqXz/8yvU01yMoHJecrFM1G
	ywgNaNqaw2DiR3MACRWTYYs2XIeQljJjBO2QsQC920dRvEcfi1NL+RuEx0JUennO2a+u8Iqdaf+
	XV/+Eo2wSktL4iYKHs57MSZw4Tax8cq0=
X-Gm-Gg: ASbGncvng6yvfQLIxiJkFCKe69HQ9X48q20T9KNp1py898Z5eRMHCcDINIrXTyNORXo
	4VSbNf6pMHHKD3tMjN7hd/+7jtWZpV/0tMXqNmIRADVyIH0TUeSr9Xj5WkjnxmFNz8YzGelWe34
	3ejtt/eT4vyXcET7duILtxRTJrmRBViGW6ZVycWK3RdgMvZs2gp81hPJMgEfIid0puqLm8cVuZ9
	7Fk
X-Google-Smtp-Source: AGHT+IGVrr9uX5LKYo7QPgj60De7se7ytrmqfvIsOMv3rt1Jnm8vWg4Kull3rCOJt0sC5X+Ks7kUo+LohLVoNkEu+iw=
X-Received: by 2002:a05:690c:6d02:b0:70d:8e1f:ec2b with SMTP id
 00721157ae682-71140a03d6cmr20654027b3.6.1749598387571; Tue, 10 Jun 2025
 16:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602143216.2621881-1-karunika.choo@arm.com> <20250602143216.2621881-4-karunika.choo@arm.com>
In-Reply-To: <20250602143216.2621881-4-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 10 Jun 2025 16:32:56 -0700
X-Gm-Features: AX0GCFvOCbEP8MnPbQ6VEYV4dkCIrXnlZn4I2acKhzd06nQBGDO0OcRQYsCgnt0
Message-ID: <CAPaKu7T5Rf+N-T7f-Vh0tB72AdDWx+nipqGjfWDnvDk=sOosGA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm/panthor: Simplify getting the GPU model name
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 8:16=E2=80=AFAM Karunika Choo <karunika.choo@arm.com=
> wrote:
>
> This patch replaces the panthor_model structure with a simple switch
> case based on the product_id which is in the format of:
>         ((arch_major << 24) | product_major)
>
> This simplifies comparison and allows extending of the function to
> accommodate naming differences based on supported GPU features.
>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
>  drivers/gpu/drm/panthor/panthor_regs.h |  2 +
>  2 files changed, 19 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panth=
or/panthor_hw.c
> index 576cda231c1c..421f84fde7d0 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
<snipped>
>  static void panthor_hw_info_init(struct panthor_device *ptdev)
>  {
> -       const struct panthor_model *model;
> -       u32 arch_major, product_major;
> +       const char *gpu_model_name =3D get_gpu_model_name(ptdev);
Move this to after panthor_gpu_info_init below.

We want to init gpu info before dumping it in general.  And in fact,
get_gpu_model_name will depend on gpu_features/shader_present in a
later patch so this is a real bug.
>         u32 major, minor, status;
>
>         panthor_gpu_info_init(ptdev);
>
> -       arch_major =3D GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> -       product_major =3D GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
>         major =3D GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
>         minor =3D GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
>         status =3D GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
>
> -       for (model =3D gpu_models; model->name; model++) {
> -               if (model->arch_major =3D=3D arch_major &&
> -                   model->product_major =3D=3D product_major)
> -                       break;
> -       }
> -
>         drm_info(&ptdev->base,
> -                "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> -                model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
> +                "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> +                gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
>                  major, minor, status);
>
>         drm_info(&ptdev->base,
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/pan=
thor/panthor_regs.h
> index 48bbfd40138c..e7a81686afdb 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -19,6 +19,8 @@
>  #define   GPU_VER_MINOR(x)                             (((x) & GENMASK(1=
1, 4)) >> 4)
>  #define   GPU_VER_STATUS(x)                            ((x) & GENMASK(3,=
 0))
>
> +#define GPU_PROD_ID_MAKE(arch_major, prod_major)       (((arch_major) <<=
 24) | (prod_major))
This macro has no hw significance and is only used to decide the model
conveniently.  It should be moved to panthor_hw.c.


>  #define GPU_L2_FEATURES                                        0x4
>  #define  GPU_L2_FEATURES_LINE_SIZE(x)                  (1 << ((x) & GENM=
ASK(7, 0)))
>
> --
> 2.49.0
>
