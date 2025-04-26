Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1641C36
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662311; cv=none; b=NG7zHkCi46x9f3EjRJpzfRR0p7aQ6+1Pr+UapcsSBWaVdJWn9G4UfLxtdViJTzQhruS6imRFZAKNqX/qShfYxUA5tLM+DhgSFvY0v1YUSTS/C5jVXSw+sQyAnksZkIwn9iy3LS6GiS7DiWBUq71ZSkJExRRW2cmy1zxGRmAYrEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662311; c=relaxed/simple;
	bh=R/z+cT1aLxJvVZUTaDnZ/yW/7pzsBc856twY10Tzvbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NH9B57ZXIZfSqetlSjiXWqSHTo4rTxo2s3CI9laeh5vyGsNcC5oSUNX6PxL3vdCVhauZuynaZ/fgDHkfmerQU9NUcBhcPdAutmUbNvk1r/Eb0cXtjDN7f4KDh10PRVi+zOaE+VlhvQdQVI1Ds8OV8jpgwgh3O7PGZNsz5NCxJI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3ZjoVtG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3ZjoVtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84769C4CEE2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745662311;
	bh=R/z+cT1aLxJvVZUTaDnZ/yW/7pzsBc856twY10Tzvbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p3ZjoVtGv6t/AbJne0Fz1a21IxRud/np3jG9jUoGTYeAUgYXcWlfBOp5kJLhWM2km
	 dFapUI0CCdp0txBnyvVALDyXNgmqWhSpgwiLuBrjdw9Rlvo377BstaAiGazCQozte9
	 42WjAC++9T1dAIHUKiMxjDlgXn6sluF+QnKhUWVxCfLr1LN6H/3xsthaBgNQqAVraj
	 qVxjYr/t+GADtbmR3mNPyWffkdCoUw3uP2bob0tO4RHSYzAxIRz4Y6Dg9NRCrQzSCs
	 gl9LfhFQeATQ5q2YhRb9pnhSq6tewLMj6NOqMwy6xFspeoafrWRKCA3jUTTpFo7qmR
	 UCOswBlk+fkPA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so5631657a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZqrbbzbNYGnJ8RH5xozSxGf7D/I6/1nxi3UcuAdmi7o4oWQQPwlKQfYmJlv+sq0auPphpiLXui2YUW70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0Sneh9IgMQTbwaONlFlNyvk5j+YJk4+t1t0kTshmS2qSk8D9
	p9XcvYVxY219IWy/ap1CVGK0DUoR+/IVanapjeEXTwCNSHqWMdcltuYoEaynwKYE0Y9P1fO0IOA
	wecz1HjnhYdFuzvMx23vKM5Haa2Q=
X-Google-Smtp-Source: AGHT+IFnDEj0swtiLrH81M0hKi0swEOGyiTwK87JYI2K1I634GI/T8PYJBtEwdDvVZR1dU8//WYu3DUc1hnm0LfrL5M=
X-Received: by 2002:a17:907:97ce:b0:ace:3732:8a86 with SMTP id
 a640c23a62f3a-ace7136ce85mr509180566b.41.1745662310207; Sat, 26 Apr 2025
 03:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403141125.271047-1-ptesarik@suse.com>
In-Reply-To: <20250403141125.271047-1-ptesarik@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Apr 2025 18:11:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5gkv1aVJRBE5b06ne0biKEZxASr2_h6HVCypfNpaBxrA@mail.gmail.com>
X-Gm-Features: ATxdqUGHeRtcP3yyuXP3Cx3XAHMr-BIFRwCDcLk4Nb8rvTyawtZ9fVzZuvdOXTY
Message-ID: <CAAhV-H5gkv1aVJRBE5b06ne0biKEZxASr2_h6HVCypfNpaBxrA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Remove a bogus reference to ZONE_DMA
To: Petr Tesarik <ptesarik@suse.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Guo Weikang <guoweikang.kernel@gmail.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Apr 3, 2025 at 10:11=E2=80=AFPM Petr Tesarik <ptesarik@suse.com> wr=
ote:
>
> Remove dead code. LoongArch does not have a DMA memory zone. The
> architecture does not even define MAX_DMA_PFN.
>
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  arch/loongarch/mm/init.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index ca5aa5f46a9f..7fab370efa74 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -65,9 +65,6 @@ void __init paging_init(void)
>  {
>         unsigned long max_zone_pfns[MAX_NR_ZONES];
>
> -#ifdef CONFIG_ZONE_DMA
> -       max_zone_pfns[ZONE_DMA] =3D MAX_DMA_PFN;
> -#endif
>  #ifdef CONFIG_ZONE_DMA32
>         max_zone_pfns[ZONE_DMA32] =3D MAX_DMA32_PFN;
>  #endif
> --
> 2.48.1
>
