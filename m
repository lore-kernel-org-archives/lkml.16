Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE241DE3BE;
	Wed, 30 Apr 2025 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022863; cv=none; b=WVeq/506iO1B5ct2cU+lae7WvT+g8K1jd3iqVec3OKEeo8eRIeDNFRle6EytMICfmn2BgpwfYQaiPkcM5oxiWY94uer+urc0JbZqoMuqR168anD2eksa2atcKz7YnclvJD30jjcXPlxhW3MfP4SkX4eHrcAQ1HbRdugMQ03sXMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022863; c=relaxed/simple;
	bh=UXWimaLZ5rlbWA3qCs+ThqOdPLSxTpPVlEAtkEpyYYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vo5dIdKQFCYHU3ZBCSvM2Hm8qFnrLgyPfCRCRg03a1/9OPBgdvdW+J6XPSFdJ9pHXeuQf7+VrGzaYwjeEBM4xDPU8hiNZcvNRRrWOptzYNKoppj9kHxYnAivnyPbyewPpUxuVAbZLfs66igadDnBLFFuIN7LOQV6iPpmEwmZs8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvUccf+L; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvUccf+L"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301a6347494so835611a91.3;
        Wed, 30 Apr 2025 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746022861; x=1746627661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZmQwZmxB+/0iwMhAswU29lyI7OcK6uMy67401DmTrQ=;
        b=jvUccf+LE946I63TYEsW5uoSBp3K3/M0GMYI/d13sh2N9sFrDQAyFMdxQlaPqfoM18
         nF+9fjbidVY1Mjsp0sP+48vGkTeIa7MepMJM/N5erFMeaf0FRG+cPqvwZAY9LDK1L5T8
         3JjPZYZrrBU/R/Wzs0jpYZEMsSlwHLH0p5Y2kkTZf2tJQiUMULvu6+AvFtmAjjVyfkpO
         2pvbMSNIGfrfaR7EqS/DTLRYuRSn5AwjEXhJRMnAhmRi3RWy0sLiyR5+PqHpyz/HfrSe
         Psl56ULyYqyAz2mVe30s32oDhwJgha8gfnYIjMqBfy1eATxW49Jzko/hqX4unvvIUlBe
         c1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022861; x=1746627661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZmQwZmxB+/0iwMhAswU29lyI7OcK6uMy67401DmTrQ=;
        b=V9qTS6Rl8RCFmwCRZZbX0P1hoelTsSW5hhMBmM62psfU/NvDLZgB7tcoL7xquhV+ea
         a7JK8seC7U9rW0t4HyhrkVX/dMFTgV90PAnCYAuZphVGWkXEhTierbFPxosVDTVirRRJ
         zr9PjRxDyrE4u6XshfTcGdVnO7s3EL/WZJyYlHrCNiKHrpk/4vstj1gBSNaJtXyq0Rkv
         GgOJ3xbY/xq57qq2yhKMBErocCsQBJmXue6Qieis1UMy8lJCG2Q46uWeULmhjJZI1C07
         HRy6uYWixDRpxy5A8HckucuuOAzUIdwC/QqFT6hyVfBnzdHQ7FQ9BvhpmLn3f25NIYbz
         psGw==
X-Forwarded-Encrypted: i=1; AJvYcCU9jnoR01WVhTp5GL8VKfD1UWqMZO/XJqVVl5PcrruEry7pY7c/ZxZxXHeqj1s2PfcJRZjI8uS+6hv/JvkbWD4=@vger.kernel.org, AJvYcCViGy0XYH7POkSD3Gn+qYncqE3m598VnbzKQ53G9DN0d+JDuK30G+20eDGDF1enfVUeNQKDkT7CDL0Eusiy@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHi5j5j5Z9UjsgqA00dd7KSXC5vuNE5MYgx60cVHfSo+rqLoO
	3YTlZtoB1R7yB499Ynv2C0EnTWu2OtbS9nxK2TLlLHCWu+NgZLpbermgPszBULezPfIqbDdRCdi
	BBhUDGhGOFobHh7JC+1buSpT18mg=
X-Gm-Gg: ASbGncsmHHTFQR5O6gj0CcJ4Ji64U6d+hPdljskb8eb4M51pCe72ytnED6js36JBJNA
	yzKUdR8WCtKNz2Nt9WcN+fThDUesdHU3aVK0KVyZ2CVmpp3110VQmuiPHiv9Z2y2nWDfPwKeoJr
	WNjR0CJTY4EosttIfblen4DOKw3GxZ13lh
X-Google-Smtp-Source: AGHT+IHrRGSCtx7yYWpJEIC2bzjI16vhGr+WvXakgytHAWV7umJvxRTzyd+RXip4iCHcc3z9o9KqkLvAU+fqkw7MRxw=
X-Received: by 2002:a17:90b:1b52:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-30a34a7903fmr1258142a91.3.1746022860936; Wed, 30 Apr 2025
 07:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aBHZuejTTKkdnGaZ@stanley.mountain>
In-Reply-To: <aBHZuejTTKkdnGaZ@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 10:20:49 -0400
X-Gm-Features: ATxdqUEB0H-Jbi4I5kCfhljTEmMnfaxoRCMWULH3c0gZNlkLYq2fJo8Njqfwsus
Message-ID: <CADnq5_O0CmTSScncQ5kV=BciZdEZ+D_THNEis+Lfy1ENPJ-+pQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shashank Sharma <shashank.sharma@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, 
	Arvind Yadav <Arvind.Yadav@amd.com>, 
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 4:13=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The "ticket" pointer points to in the middle of the &exec struct so it
> can't be NULL.  Remove the check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied.  Thanks!

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index b0e8098a3988..7505d920fb3d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq=
_mgr)
>                         clear =3D false;
>                         unlock =3D true;
>                 /* The caller is already holding the reservation lock */
> -               } else if (ticket && dma_resv_locking_ctx(resv) =3D=3D ti=
cket) {
> +               } else if (dma_resv_locking_ctx(resv) =3D=3D ticket) {
>                         clear =3D false;
>                         unlock =3D false;
>                 /* Somebody else is using the BO right now */
> --
> 2.47.2
>
