Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6F29C32C;
	Wed, 25 Jun 2025 15:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867195; cv=none; b=UoTXf3/5mKODf0VdKEKSPiA2UNFN28KTZjmFbuZigylimlKZWodSG2wnFz8YoADur7lnie9EqK5Ws5JNZrRZto/xg8NfMZxPV+6Mz94jXv/7mz5a8f+N1wAkyXlX7m/i3H4KtmFo4zElIJlLo+uREyzj+hLRi6LQysf4yuQYFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867195; c=relaxed/simple;
	bh=Ph0MeFJ2SG94/VHLocJYdGNnfaMXzvuA/05zOXAqNd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmDgDWO9s+uCIfevCNc4FNkOGOP2T0+EIvFsbo62KQCekfpJWOpeY7ml0VSopSlOZ/1Hhda+tDD+G2qu85IFaIBfz4BE18/hq34OgjgcmRG50t6YKhqfuC/Yl3G6JkWLAOIqJmvW57L8rYwcMC9h0HJqFptX7dplWPcJTZ42e/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1MTLO7M; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1MTLO7M"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2700de85d0so1159576a12.2;
        Wed, 25 Jun 2025 08:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750867193; x=1751471993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+v2S/Kr4IAe9nDhUjRoLqot9qoZr4r/hGrWQ5tIcEsU=;
        b=M1MTLO7MbxVdSVpFjNpWI4BLpryWFII76xkbgFr2CntZiy9zNxJkpwHvW5WufBjkfa
         p2JLKDv9PU3ixa/xtU68fB6lDcQuwnLTHiBQjRRjkRBgRYX4WvzDTM26FQP0h+21Cqje
         mlldlyEtBI9jMP++CbMfczrI5lSnzb5TxS7gfUKiTMMOW2DiNEgn6KDsFQBR8o9Vx0Vp
         7E3B8sl99diBzMnfxBf990yunESSHl2jDjzDqGVdyaUWcVk6m2nYMqRbQCKQWo+zYzZW
         1XELBv5MmW2gIMNNM1+6N3FWzoMSqt+ZKcqqQ04lMmNULWlmllDG3SgdL1se96JdRjay
         cubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867193; x=1751471993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+v2S/Kr4IAe9nDhUjRoLqot9qoZr4r/hGrWQ5tIcEsU=;
        b=SgOcUE13vVB7samsKG9SXVq8uvrv5L5ccqtCiCz0jPgsYcRSfSyVMwipwCnxrwRcdx
         ix/sKmBfkuP+cV1f8V2s2+lv2XMWs54DGFHghyd727Ef4bOCEhsahpU17rrT8FoiTegX
         +tDhRx2F+reOwqS/OJZSeP7vXg8nKHez7JHX76I3YD5UVLJbqSeu/RgRsYfNkmUrHufO
         iXK0UfUAYOmaUFiq+xWnH5BE5+Xb/0uRY62uAhlFg2C2eXe4qkA+cXLryWsGoLEJVSit
         Lo8WfQVrVX3xtor3cXRp26uV/8gF3zqPfCt48ryVodr1n15RrhRHKn/d2dZwb88fHG3B
         tQeA==
X-Forwarded-Encrypted: i=1; AJvYcCULLfe11+HN1UqGlid/u2/CO97UPhwDHka8eMS2P3gpM/LO1oSM+z7k6Na4CAaCXn4GnONbxHdMU6MFyQW/g6c=@vger.kernel.org, AJvYcCXAnKkfe6bQCrckFKTKbtR8LarWqc5WszNdyhhvLkjASxE9lYmLRGutd06GNdQOgwj2IvYE7y1wQJ/TYgH/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz082RzMXm0BH+a60nFCLYqLkKo6tqBIb9IRmE2Sk45d/4I1AE/
	mNia1i15Nuze88FX646lHP9ZZ3DoNQKcJ4Q9ZrsQ+lyx8/ZcsnqQyjy1M1eat+G09y7w9j3Epnc
	w10CHz8v3uOyv8VFf1vtKPllDX4raShg=
X-Gm-Gg: ASbGncu5YswHcWTWVin+s3jE4BoTX1z2pq/K1wq8pNWvKVbTgMORLOiayzRrAFxGn0N
	VFJ8NBbUFpFGbxY+BnFyMOjJtWpJaV6aUyu1abxd32huDxEnFYSPHr+5EyfVGeyOQ/sRCaHHyOo
	6cLBPYg7fFnrwCs3f3ZFCkMWd7yYgCrj+lk9qom0fKzxwv
X-Google-Smtp-Source: AGHT+IFuT6Y2MPqukrRAc3faj2hOL8dGkyYsm1wkR1IX3QKkXPPSkzl7kk1IEFDhWlgxsK9U2auW/7vp0nqRH71ZfPU=
X-Received: by 2002:a17:90b:5484:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-315f2614bedmr1762758a91.1.1750867193468; Wed, 25 Jun 2025
 08:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5827884c-f269-4e38-8202-2a3fce280ae3@sabinyo.mountain>
In-Reply-To: <5827884c-f269-4e38-8202-2a3fce280ae3@sabinyo.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jun 2025 11:59:42 -0400
X-Gm-Features: AX0GCFsNtKODTPbjTsMx_0S5wUfauBMFZ6j-k85_DmOyWLCatMSUe3VcamgaBGk
Message-ID: <CADnq5_P1i=GXfmbK4n44UWCLvoyQiwW4UPJFz+Mx4BHqmUbzrg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: indent an if statement
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Frank Min <Frank.Min@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mario Limonciello <mario.limonciello@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
	Hawking Zhang <Hawking.Zhang@amd.com>, Samuel Zhang <guoqing.zhang@amd.com>, 
	Asad Kamal <asad.kamal@amd.com>, Ying Li <yingli12@amd.com>, Prike Liang <Prike.Liang@amd.com>, 
	Pratap Nirujogi <pratap.nirujogi@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Wed, Jun 25, 2025 at 11:38=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> The "return true;" line wasn't indented.  Also checkpatch likes when
> we align the && conditions.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ucode.c
> index d777c049747e..a0b50a8ac9c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -1400,8 +1400,8 @@ bool amdgpu_is_kicker_fw(struct amdgpu_device *adev=
)
>
>         for (i =3D 0; i < ARRAY_SIZE(kicker_device_list); i++) {
>                 if (adev->pdev->device =3D=3D kicker_device_list[i].devic=
e &&
> -                       adev->pdev->revision =3D=3D kicker_device_list[i]=
.revision)
> -               return true;
> +                   adev->pdev->revision =3D=3D kicker_device_list[i].rev=
ision)
> +                       return true;
>         }
>
>         return false;
> --
> 2.47.2
>
