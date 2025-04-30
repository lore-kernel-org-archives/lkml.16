Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6F07DA93;
	Wed, 30 Apr 2025 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022633; cv=none; b=URSA7ND2forC6fK7V4Xmvo7q0/5f/6QV+O2nZE99e81fgV+rCDR62QTM2XsxbsisvcJ+7WqsYRM90dPsxEPI5gR7WXpVtQ1k1zDggNc0PNk7R3pA6a3LSvEUBU0rwmFkEk7vrl5jYQvTs2Qu7PAWMfnlaVDSdxL7eHSr8wXqV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022633; c=relaxed/simple;
	bh=eIw6SH0Y7++EZ68fl2aw6J3KtI5DkruKCG9Ypkwvl2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdTx35Cc5shVBsousaNfI3AiviA5dkkwTfqUWj5tZNP33UWS9CUAG7WKgJqBERdN7Qv8ym8N4FLs5k/bPvj14T7RIXmkKNI3NmLM4w0Pdf61e/f1BnFjYUmrIkxb1Y2NeqnR6AuMP5htTjj+w5Sk5JhIBhgxcG7dveM+JDQHNqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9dgfoHn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9dgfoHn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-308218fed40so677300a91.0;
        Wed, 30 Apr 2025 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746022631; x=1746627431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSlVXVVMvz31qCvWMPBMvG74WqaN+y9IYmd4m+IHQyY=;
        b=T9dgfoHn/sOL5kTGbvSj2YUc8NWomDD+fqWWHqx7zQbKadXHnEPRQXCDtb+OwqjpET
         3BP2mOgpxRkYtAckgYAjT1jiUr5ENOQRKXGZgTomB3SPttOp2ZQoEVoRnPxpCO9M1gYG
         f+NcS2ilT7mEQgNibwljVg/9SF8eJ+O25upuuG46LB3FrPNsAJCX7vvypEBXxiYMLuW3
         17i7MjTxbwvLqQyTQsmS4aJN2vQpYnlPImo6qUYcMaKJ0TpJPY3V8F0qkTvpiDjf4oRs
         S1qZTBvxdkxpjmtYOeJ/uW7NS2vJSGz5d8VlkEHvD/ZmCYtFLmjz7wNOimm10+ejgvyq
         TUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022631; x=1746627431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSlVXVVMvz31qCvWMPBMvG74WqaN+y9IYmd4m+IHQyY=;
        b=RUiDOfFFokf1eFmW14zuRQxfbF5dZln62+NF3vbj/mAz/pvuBtoB++VxA0z0xDBqP+
         nVgpH60A5W9CDjCb0o/qCxT7xKQDwa/0WvXwVQeL9EqBADS7/o9jfqABn/s47AmoGFSx
         0udaiomn5WO03qu7H89+dMC14ebSXcEcjPu+zbOcw7zW65tNSHum//LKl7TaMPuh+s4M
         blaS9+w4lvNoYkHZ1qvBPoLv6j9WHpTcdmePYTMFuOVFSh10qBqXyourRrbSoWrmiZVx
         BTV6+sA408PCYZ35w46+3dXNB0x/eUSaZgqop+6RbWSnjXeZ488+euS4vk78HaI9ojaQ
         QycQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiBlHewxXDj7TpYQMhBlwac8FZVd9LZvlxyGqL5vdkljYeXG2GeKfOV7k1VHz3dtFCg7aURMh9iZp3nZeGcYI=@vger.kernel.org, AJvYcCXzjD5rmO7BZA6pJCbfireYyq57YRpX57BskbCCPbD7W/DPJOMYOlhyyvFXWM5qKCeb9BoMWZtqRoM6qelK@vger.kernel.org
X-Gm-Message-State: AOJu0YzeMDHBqfsmSDbVubKhulzdY14AAqA6FNm9G8hjF/2RHpQE2o04
	snjg3oPRAvfNw8EFw6JdNVGtTv8RVmAetptrKjPSFweRrg5q0wAQbAKPd6DM+UEXS2YdxBi1Stj
	Bh5sR7BQFB4p7dxALKbcTgm4fN7s=
X-Gm-Gg: ASbGncvPqd4r9yYeK/CVV21tmr2O8LeH50reE+0yq7OqBzZSgFAcwChwFzGIeBrq80q
	v+lDruGDod4VZ6sZSDwURt84UX6u9NXtMpZhbjai9GxoLTJfo55P8y4w+AWk6QVpS8TDxco6c59
	TyY7neZYXuGkjDRx4xknqqcWVJK0+CvoMt
X-Google-Smtp-Source: AGHT+IEsfJs4pvbYzJLHEbrtPsBpdHlb9L4LbI8uQIA2ApHhlUqkt00XJv91Tvsb80npmYzja/ty8yI1I+/ccdOAIK0=
X-Received: by 2002:a17:90b:4b8c:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-30a34a77995mr1572249a91.4.1746022630946; Wed, 30 Apr 2025
 07:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBHY1IPONYHyybrf@stanley.mountain>
In-Reply-To: <aBHY1IPONYHyybrf@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 10:16:59 -0400
X-Gm-Features: ATxdqUFaSbipfJtE5jKOtwie3btM5g0OcKmN5NYnJ-guEp-HRyAs3L7vBIggiks
Message-ID: <CADnq5_OTeCQ3v5xQP1KOT=Oa7vRxDpjiNLn69Gg8TZaikNLpaQ@mail.gmail.com>
Subject: Re: [PATCH next] drm/amdgpu/userq: Call unreserve on error in amdgpu_userq_fence_read_wptr()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Arvind Yadav <Arvind.Yadav@amd.com>, 
	Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Wed, Apr 30, 2025 at 4:08=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> This error path should call amdgpu_bo_unreserve() before returning.
>
> Fixes: d8675102ba32 ("drm/amdgpu: add vm root BO lock before accessing th=
e vm")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_userq_fence.c
> index be068e8e37d1..57169a8224be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -373,6 +373,7 @@ static int amdgpu_userq_fence_read_wptr(struct amdgpu=
_usermode_queue *queue,
>
>         mapping =3D amdgpu_vm_bo_lookup_mapping(queue->vm, addr >> PAGE_S=
HIFT);
>         if (!mapping) {
> +               amdgpu_bo_unreserve(queue->vm->root.bo);
>                 DRM_ERROR("Failed to lookup amdgpu_bo_va_mapping\n");
>                 return -EINVAL;
>         }
> --
> 2.47.2
>
