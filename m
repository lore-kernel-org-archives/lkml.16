Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD125DD1D;
	Mon, 28 Apr 2025 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861215; cv=none; b=EKLyw3UZHIRqyM6w7OWe4NTu6W1Mvu+30W8PIcLS+czvIvdbqEtd2DB94//cogVE2c1x3VkgBnOiUp0Vc21i/B+XOJWMVnyZORtMcx5wMFFLys5V+iEwNushpaf+5uOm1LKBlRYh+Sz8fAopMcYEA6+GCMZxMbqa94sgal/J6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861215; c=relaxed/simple;
	bh=BAE0xjLoAFsLw6DzMRireTSZNToUHrdgumSFpIR1FzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePyZ9HUKH5zpCfE5iNUrnUF9r3mhVDjgFE+szrARDIKw/Qq2OOtcaXEVl8NNasJ8EyIDzZECCbsAN8SWE+so2C0/vyHCoRjWdZVwYucC/Aa0fXCBodZZ5C3wXxigqzcQduJ2GMPLsHET7ngxlGVzJ3Di50L8MUH0xfOe+nxDpZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5c2Io/X; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5c2Io/X"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30363975406so677979a91.0;
        Mon, 28 Apr 2025 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745861213; x=1746466013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRRpRkZSvOkRGfLbThuRN6s/DKswi9Znb1ZKqEIbpb4=;
        b=k5c2Io/Xvsfc40BnvKoicP0a98scV3YYmQpmgC1sgdN8mTxOQupuX/PhKYuYSEm7D4
         8xWkEwqjBmVZiWi1otgGKAU4DBXaA0mF3zVBQiXo3AMQxLRg5b88MhszmjkYxZUCOvcU
         WnS13vS2Os1huBHoXZJyz+MpJuq24z2MJPALXqqxzm7qpBvFz2XEqfOJV5l93JWim6Dy
         ouP1LQAVm7BjLQzZZoSJvtEBp4uxjlL9vMDKeFEjLCJCAplK1kpiMXtth7nyXkm3CThv
         UVSiWuygjNNtnThay9lkraNBNlNM88xiUVL6a80vGF/c0GVGRfEsmbzkvDDkLb6Vp7ji
         bQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861213; x=1746466013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRRpRkZSvOkRGfLbThuRN6s/DKswi9Znb1ZKqEIbpb4=;
        b=JmqWzMzWn/l0um8ATfeKWuq/8Hf0dSqWrVoF7y4B6PCP8/TfQQ6J6S25FLLxlQ/YQI
         xBxKLic6xE0l11v9Bm1h14Nqqf2byV92Zk/3Ap5EP+wz+5JSSwnIYlpEq6tk1g1Ehz0O
         YMdQ7HRuBrbv7BlkRduEglhY9crJ3+cnHDtALLZDMDnxwVjhN/TKyIZjkV6mhXota3RC
         o2vbP973O/zMfIhq+gcc65bKLlhqhd07OH8M1TUCH8VJmWqob/etItT0BTOW1THXf2Ki
         1awtqScs4kmeRYOYi5J5E3Vjk+9nB8X1EFLZpZbHm9/Xy6ONMoQVq1yJS63spEnyiZof
         4oVg==
X-Forwarded-Encrypted: i=1; AJvYcCWMfVaHMXG26apBJmdK5P5Yyf7QO2/akiR8p1OVpWClgxo9mDLXp3wUnjSc5NYEtHKvgh+DRDTxHQA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9tDC7L/yi01Sa0DKQ6gWXI0IQG6Io8J73X3B2YKLDUtUtZPY1
	myDmBPW7vUYebP03joneZ+Efg83+ocxWvN5PUIfLtKjSd72QQSHMWtO1zAtoVDzaARlXuDbvNzF
	wEyZRtFMPJYnRU1R0OHQmKIOg3cY=
X-Gm-Gg: ASbGncsIEXK3R/sW5aeSLSjcNY1Sq4cZW7B2FGo82vTmifY748u6RwejKWc8nfCc3UK
	Tlimr+igQDh3MlOuW3F/7EJAZCxODbeeqVdf/1M53uifMLe60m/U6Ot76fV4qzKTkhTYb8ZsZhR
	0mqBzSc6/A1+0E2Ppwjj0dFg==
X-Google-Smtp-Source: AGHT+IHqDjJkfJR4DtyStA8z8/DstOOvTIwPHnHU+nlRgn190Mwia3pBgMb6g4BVjMeJDnyZ9gmvCov+/FaAprE4xPk=
X-Received: by 2002:a17:90b:38c9:b0:2ff:4be6:c5bd with SMTP id
 98e67ed59e1d1-309f7ec76f5mr6947847a91.8.1745861212890; Mon, 28 Apr 2025
 10:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427023625.14327-2-bagasdotme@gmail.com>
In-Reply-To: <20250427023625.14327-2-bagasdotme@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Apr 2025 13:26:41 -0400
X-Gm-Features: ATxdqUHOPGCxsMpNTL-FiIUGq0AA51NTliFGGx7x0GccxVRPmLRNZoEaL_D7Qas
Message-ID: <CADnq5_ONJ0wyExs33aSt_jWZQ9RmL2q=nE6OkzN_4HoS3vZ9+w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/userq: fix user_queue parameters list
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux AMDGPU <amd-gfx@lists.freedesktop.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Ramesh Errabolu <Ramesh.Errabolu@amd.com>, 
	Arvind Yadav <Arvind.Yadav@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks.

Alex

On Sat, Apr 26, 2025 at 10:37=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> Sphinx reports htmldocs warning:
>
> Documentation/gpu/amdgpu/module-parameters:7: drivers/gpu/drm/amd/amdgpu/=
amdgpu_drv.c:1119: ERROR: Unexpected indentation. [docutils]
>
> Fix the warning by using reST bullet list syntax for user_queue
> parameter options, separated from preceding paragraph by a blank
> line.
>
> Fixes: fb20954c9717 ("drm/amdgpu/userq: rework driver parameter")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250422202956.176fb590@canb.a=
uug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index b9a1ef343c79cf..ec8057597c5aad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1115,11 +1115,12 @@ module_param_named(rebar, amdgpu_rebar, int, 0444=
);
>
>  /**
>   * DOC: user_queue (int)
> - * Enable user queues on systems that support user queues.
> - * -1 =3D auto (ASIC specific default)
> - *  0 =3D user queues disabled
> - *  1 =3D user queues enabled and kernel queues enabled (if supported)
> - *  2 =3D user queues enabled and kernel queues disabled
> + * Enable user queues on systems that support user queues. Possible valu=
es:
> + *
> + * - -1 =3D auto (ASIC specific default)
> + * -  0 =3D user queues disabled
> + * -  1 =3D user queues enabled and kernel queues enabled (if supported)
> + * -  2 =3D user queues enabled and kernel queues disabled
>   */
>  MODULE_PARM_DESC(user_queue, "Enable user queues (-1 =3D auto (default),=
 0 =3D disable, 1 =3D enable, 2 =3D enable UQs and disable KQs)");
>  module_param_named(user_queue, amdgpu_user_queue, int, 0444);
>
> base-commit: 127e612bf16726620e431b6e0f771424916492be
> --
> An old man doll... just what I always wanted! - Clara
>
