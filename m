Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00DA184E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861064; cv=none; b=kXxsmAxtANBPFPUolta2hgWjI0j+PwXrLAQB/2o1Qv3JtoFjpTMZqOgfI/PQuqB12DFWccKqmd+LrsU9djRkwLxWetjGgo4dIH4scD6FGCZOiGntWtOVC0Ccz4iMot+HDSsCLGzzXIazKwQsTF0q7T1KWm2S7doAFdOzpKrXyds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861064; c=relaxed/simple;
	bh=MSgfJFBTG3yXbaz+XoaHCYPj8mIbv0M5qd6Fw4f1KkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2UTvCOcbdBhvoemutX06oKWi9vV5u86ygCVwf24JKQwcI2/nAGWV/Uy0KApHOblKHY8w5HzVl/7dtMxxuotQ1nx5ts6IBcN4x6Wjph1XBey902e32r7c3aBM6u51tMt2v+2F+FNjd5eIwIzh8PgbSsQHzaCBGgGEqLShoMhltk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLB7lV6q; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLB7lV6q"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so690326a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745861062; x=1746465862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INPGmSyDHw0Hci05cxLMn7U7sEbxuZfILHMHNUoIxUc=;
        b=KLB7lV6qLns40qddw1Nw3o0fcp5h4sOqFZfxsT+MNrFMUU46t6Gy3xbM35zjqCJYs1
         Tn7EAmWPzjie6afaP0Cy7STL+YOoKqSZHte72B6RsYa3/j6UjNmwOKH/1eZNgS+3K6+4
         Lx9DrT0SMtxZ2anDdiH9AeMUhWpEJZJKDb+JoS3SPajN3ReZ4rR78B+JZBn7QH6fliv7
         by/gqt4EZTXOzPEA/s8VRmAqfdXEnGKnRExRjPdopwQDUzyE7ocUgx0jwuB/ex+GxcXw
         kWQwTfeuZIpa+bWVNhcFoD31TJTxf51cGyScXKO0MurT8+xeeC6vxNCPhxVcUgDcukBl
         DqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861062; x=1746465862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INPGmSyDHw0Hci05cxLMn7U7sEbxuZfILHMHNUoIxUc=;
        b=ms1a/tcFm/xV1JD3tKO/Jrq6SfykCG+7nF3jSR40Zyhg/r2gx305Cl0uSFS4gG22Ti
         fAjfdoewQplYgL9ylp3E9dV/79KUktWamRtvbxF5vIIP7zMv9/FWN8IAln97n5PjbPrg
         lMUDQcS69QMeQlODYK98vXbc96AMa32HRa2i0+YaVKl57DDy8iInL/ZpR9nBAYWMQKhI
         RaiKjZU364VKSRt1mb00dkakJFmI059t9FHNwZr5f3+HtaRHvwcun/X8dzl+HzgflZkU
         o4g7zd8Fs4WYwww57gc61pdG+/w6MpYOKX0gtYvb8nUc+3eHJxqYVQPTgvvMJbpjnE4/
         0e7A==
X-Forwarded-Encrypted: i=1; AJvYcCXNtwoMqVLKBw7iLVP6OSF3R7RZ3eZDqW4DgCbjyNxY+if5KnQqIgcOqznyflSUsh3CFZlYGaBZhQ/GyIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPFh4m3Vojn8QLUxbOAw1dh4gwia4lKyKFAozOlPDoyc5EUGs
	3/hZCX9bTc2ngdXg/1HhrVgXtyxOdgLGd63+G9+h+2cLEXaikDswwbI3dTAgm7IwpSRxc48xEjb
	8PkYUdsv/9Im12HhT0VaiO0VcQjh4bQ==
X-Gm-Gg: ASbGncu3Lv0tEgXquIgcgMGye7K1EAImOQrbTTDLfbP43FsUrdC60ORgusUc8kqemna
	9iof91I7UrEbM73ZCGvlr6CpZBwuU+f+JBmcRCCJCNRtUJj+BapU0ZL4NFgbSZ1zoii2TwHrfR+
	S5rws6zhQ3jgtLq8N7pf5Q3Q==
X-Google-Smtp-Source: AGHT+IGI4dG+E4VqxqZ/2zqOevZMvd8JbWfsZtmogHBB/ac3zneJDZPbgHIYYSPv/A0I4M8+YbDyL2bg8RamjxME+vg=
X-Received: by 2002:a17:90b:4d08:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-30a220c9efdmr82082a91.4.1745861061905; Mon, 28 Apr 2025
 10:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427094536.353823-1-prosunofficial@gmail.com>
In-Reply-To: <20250427094536.353823-1-prosunofficial@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Apr 2025 13:24:10 -0400
X-Gm-Features: ATxdqUG902PaZ2_GkfPHyzXrIbWWpjppF29w4YxeLUnuum7hhoMvXjdzHTE-n9Q
Message-ID: <CADnq5_N8_VjK17iWMp2q3p5QHtHM7wH1HmX7qLPoL6e2WS_kRQ@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu: use string choice helpers
To: R Sundar <prosunofficial@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sunil Khatri <sunil.khatri@amd.com>, 
	Tim Huang <Tim.Huang@amd.com>, "Jesse . zhang @ amd . com" <Jesse.zhang@amd.com>, 
	Boyuan Zhang <boyuan.zhang@amd.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
	Peyton Lee <peytolee@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 5:46=E2=80=AFAM R Sundar <prosunofficial@gmail.com>=
 wrote:
>
> Use string choice helpers for better readability.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202503222049.sUXL3q6w-lkp@intel.com/
> Signed-off-by: R Sundar <prosunofficial@gmail.com>
> ---
>
> Reported in linux repository.
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:311:49-70: opportunity for str=
_true_false(vpe -> collaborate_mode)
>
> vim +311 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>
> for linux-next:
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vpe.c
> index 121ee17b522b..442d137e0fed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
> @@ -317,7 +317,7 @@ static int vpe_early_init(struct amdgpu_ip_block *ip_=
block)
>         vpe_set_ring_funcs(adev);
>         vpe_set_regs(vpe);
>
> -       dev_info(adev->dev, "VPE: collaborate mode %s", vpe->collaborate_=
mode ? "true" : "false");
> +       dev_info(adev->dev, "VPE: collaborate mode %s", str_true_false(vp=
e->collaborate_mode));

I'm not opposed to this change if there is a general initiative to
convert everyone over to using this for some useful reason, but I
personally don't think it helps readability at all.  If anything it
makes it worse in my opinion.

Alex

>
>         return 0;
>  }
> --
> 2.34.1
>
