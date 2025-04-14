Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C3D27B517
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744647861; cv=none; b=Xg19zhX45/ZTpyCDiUmfJI4eHoIO3HSnWoGHVa1F4Zq/BRuecmxPBRrMZzv83XgylkOX/icLqdwY83hvCklEcZ8s/chVh9519bI6+UW5HfCAlmZ3a3tMhM9be2vfVGfxeK+J7BPFxu+O5gvbLEZQub7wYz24tLlEhF63LrYnTXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744647861; c=relaxed/simple;
	bh=UmdW1St39aq050VNiM74EH5czD6jWQHbVk2lTum0ecA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgYeK6ARDMpcO+2TKJyxUuvxJsUMbToTx3JO3JwuXNwGPp1/CGg5XdMqX+27RbubR9E6fN/8gdG3MEPbrdLYgKhbsBKdOeoeC9n0XyD/FyXiWcAGCDHxO9mUrBJIvAjvQoA1fFAc64Vc2GK7DV3HaCxLfQqZk2p9J8BZ57kHA58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGyLzDbV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGyLzDbV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301317939a0so835604a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744647859; x=1745252659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZud10eViPHjvJZrQ1WbVgYCANxeLpCUxFVXE3wcfRY=;
        b=CGyLzDbVoWanhJMYeHnp4ls6lPXJ8++D5l/x11XHeqzD+K0CE/rSDxEl0jX1iKRmMk
         LnPfAHgovYAUOsZYxSJGce6CvIzLmvG0I8npKpta8TO1//U8N+b/v9MW+ue5ocjZs23w
         zflNiLaoiLPXQLrQLMh/BX80YT/l1IyRBXk/M3M9nhxRIAZGQe2mHIsON/ZF+5pZV8FW
         bn6uxSEWx2Boh6cFAIL8FU4ZHw1yJnnml/oE3EKOIH85AuSWiLHYN53Ueh4rXMrA8wci
         mfyJtAqN/hX0sKuuheS/LUtJ6oqqFJdKiXd/asnd7ocJksfKryySbcSBtEUZvs2nALX9
         cGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744647859; x=1745252659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZud10eViPHjvJZrQ1WbVgYCANxeLpCUxFVXE3wcfRY=;
        b=N148RxfgcBN3GtLo5BarqQnqTB31/Bvoo+5/JpHi3Mgrh3RUBUqwtNd1M4i9GPjSIG
         LozE2/sMrP/QC0bMU/O0Ok8Zi7EOE+87Jevp0m4nuUwKgl/1PNUvHiTdOREXMDmES8j9
         HEBsCTLOnsxBGF5ib9D3XoEXKqhx5CUhQ1pofs/Z0qVZt80KdrT5lg56YU5P+aWMXdWD
         mD10fGgU0Gig8RRmoG751TWnRxPT71yJePBnmh2YKE1CtnL0gqD2a7qnQnCbTfCsygYm
         LbzQNXjcIMtQwn0IoVHGfcCA9WMIBrRQfqyaVrNyZFcKzlKRrvo8INyYrnZ1kaOhu4j9
         EnwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOgFGPujAMYIsT/d2i3eLLSs77RtSjMoV1VVmCg4psFYKpsnPPaVsYj9zxFYSYRrupGx+blwzr/o1eKxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg8yZQFKbKQUmCojeM7LoCY+UWjCDGHr1NNSAwmfkB/JIWiX6H
	erB0GxMJZc+wIQREA0ZCeuOlPwCbFKsbMQImsrtGZdFR5yKtBtxzCRtVsT+5u/7UNKHTDRZuP5L
	TCoMIob3zGqfEnadkZXBbZPR6rMM=
X-Gm-Gg: ASbGncs/8WB9WfaepclIaAdU6PTto6tFYw8xkyFva/vLIbCkTzyXveQP90R7IYetCYl
	HlrqsjBDOwhtAe8Xgas+FxCsz9xKpxYGo3ENzdXIr4cxW0a8ymXk6AmW6aGMEXkcGrUhOQs+EWk
	UYVTyCFi4jdYn8rRazFf/etg==
X-Google-Smtp-Source: AGHT+IHIsZgwmUE371RVExdjfe3uDKkVX+OFob1yNsscZOphYZFPIzOV7hJu8uNOR/J8RHrfXHyWpwMz99OlQxJV/9Y=
X-Received: by 2002:a17:90b:3905:b0:2ff:7b15:8138 with SMTP id
 98e67ed59e1d1-308237e2734mr7400483a91.7.1744647858847; Mon, 14 Apr 2025
 09:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744468610.git.dan.carpenter@linaro.org>
 <b9adf038b3ccf058c49e7e74e1998bc2216e0678.1744468610.git.dan.carpenter@linaro.org>
 <3d8df435-a248-4f38-7a2a-b0f2ec908ae0@amd.com>
In-Reply-To: <3d8df435-a248-4f38-7a2a-b0f2ec908ae0@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 12:24:07 -0400
X-Gm-Features: ATxdqUF3GQVImlGRef4uHJ3JWI5t9seFoFszL8FAVduTHerGcRdz3Qd2V-m_S-0
Message-ID: <CADnq5_N+qd3k6gPrZwXD7suU-6diXWAr1N4st113RzCLJqg_Fg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Clean up error handling in amdgpu_userq_fence_driver_alloc()
To: "Yadav, Arvind" <arvyadav@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>, 
	Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied the series.  Thanks!

On Mon, Apr 14, 2025 at 12:48=E2=80=AFAM Yadav, Arvind <arvyadav@amd.com> w=
rote:
>
> Reviewed-by:Arvind Yadav <arvind.yadav@amd.com>
>
> On 4/12/2025 8:09 PM, Dan Carpenter wrote:
> > 1) Checkpatch complains if we print an error message for kzalloc()
> >     failure.  The kzalloc() failure already has it's own error messages
> >     built in.  Also this allocation is small enough that it is guarante=
ed
> >     to succeed.
> > 2) Return directly instead of doing a goto free_fence_drv.  The
> >     "fence_drv" is already NULL so no cleanup is necessary.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: New patch
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
> >   1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> > index b012fece91e8..86eab5461162 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> > @@ -75,11 +75,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_de=
vice *adev,
> >       int r;
> >
> >       fence_drv =3D kzalloc(sizeof(*fence_drv), GFP_KERNEL);
> > -     if (!fence_drv) {
> > -             DRM_ERROR("Failed to allocate memory for fence driver\n")=
;
> > -             r =3D -ENOMEM;
> > -             goto free_fence_drv;
> > -     }
> > +     if (!fence_drv)
> > +             return -ENOMEM;
> >
> >       /* Acquire seq64 memory */
> >       r =3D amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_ad=
dr,
