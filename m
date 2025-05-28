Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9FDDC3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402507; cv=none; b=rQ+W59j9LOXACe/xXaQQswhDr6uPi5KCXCbCSiNxjfsODGbda8K+fdsUsW4yd8/svcKsm+1iguk8x/eTnsmJx3d4W6ijWm5yA+dkQryg8tJeDTPqxIoFhxGiyDQeXZ9fT9J5oDg/4svCVSMqiewuYLHzYOvkSNpWlUcHF5aJbuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402507; c=relaxed/simple;
	bh=NCjG12I8e9v4tbFYWsDY0jzDx/gYU5XqMSNRRjnDooE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFed4Xhq16NtPzWkDYBAvHzPOA8iEMePyvfVSe8hy2ePKlvxs763KE+V6zLXDe8p0H2GeTQ2tQMQNDHAjJwAXrhKRvsmtyOBl6Oq9gdpMaixEuGqHISEbqRzQyNmD7DvpoWZAQJwdStoNBHtcOjX3ndZ2CUi93tDcdSFgkIVu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0d1Qa5uG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0d1Qa5uG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2348a45fc73so108045ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402506; x=1749007306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhQg5ilX/7ks5QXGrPE6JGn51EXjxRWzA8aArpEVP8o=;
        b=0d1Qa5uGmSoUTHlwR2KqteuJH/C36jiGYEJEqY1hCEEA/pi1+q9moPlQJDbkDMUV3p
         2wYOqbO8duI/ZbnjxIGat5VLNAyXAqGXI3IQaUaWATnbjB5EeUmsumvh0ydB1+7I+3Sv
         n2jc4+kAXWUcg9zjk7CcRd9jziT8cGLvaVX6xaZRVlG593jZVpR98mRorOv3WmdkDeoL
         fzdNsnxly4+wsN9EYrPdEB33lDRTwkiE70n+/3NKdxLG7MoR0Rl1xdZDLJbVoA8uK5rl
         s1m9VJn6zPN/cQk3d8J884MdaBIh2iJGhdKfN0MzK+3k8d0tIFeqr26fdrj2PBtTuhVA
         hp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402506; x=1749007306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhQg5ilX/7ks5QXGrPE6JGn51EXjxRWzA8aArpEVP8o=;
        b=SUMBIVuJ576yBbWPqywlk0KW21Eub7LoWzMYd9hMsd6Par3vfrYUXVf3ib2wPyOJ6H
         5CnTIi8hm+tZ2nSxhTB6rWpwfyuL50XNaJ9FlS4Avj9eSPINskTevwn8GVcVRJZQn/1c
         hVlGIBBCIPyyVSySzTQ6pjFbTWcX+ggNQTYUz9ODwNOfNwRW20OwZ/j3E6Vqiv4LUb1j
         i8r+7OPGuYptEV/aF07xlAUComrZ8XgmwrVETjD5LwOHZrXUp0Z3xo0HyXhILPXxgSwz
         LL0gmKAT4XBHAYp+iYWGbodjFHZIMSTbEcjnCeHJp1svp8lG52/GVvYBA7uHMD/00i6f
         /RWg==
X-Forwarded-Encrypted: i=1; AJvYcCXaaGHgdRxJEIr3d/OEm1qPtuCkEBTEI1IFNxTf7lKxkV/rv9A+mIHfPPLJO3jiUvNw4AcyqB0GhxEm0U0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjidDNOv/3YtEdZeBpqQ8D4e68cDXm/7IJCmFyqRu84iXt9J84
	/14kcTDk6g1L/gyZa3NVfm32WlekUKXOMjT2NFwOmckipMVqwMNkX1vNIB4U4CAFYpZIupPpiJt
	p9mRglez9GEbWQqzOr8CV9zOys3YdCPzvFM4/5xVv
X-Gm-Gg: ASbGncu6CXE5t0SnKaH6aIFnBH0QnjsFPltW4U+RShyR9tTiWWiIKbk9h+hlNcl3Y+8
	NRs1cY2Khf1CYKHS05Fx0DSQOb1QorsZI4wRM++ll/4WO5iBX7hBLGu9VNPra4Ukm9uT6KHvpu0
	wsSYP3OBqm26AQtO/uVxY8cWU21G6Od/JWePajoPnj7gku
X-Google-Smtp-Source: AGHT+IGZGnQ5Nmgjax4hfouh4pp4GgqporWXwvbytliAh+njgVO1gpTaYGIF9zH1gwkhGw9nWKCJTA0EdVPWxStUTNs=
X-Received: by 2002:a17:902:d4c2:b0:234:9f02:e937 with SMTP id
 d9443c01a7336-234cbe4f90fmr1102095ad.25.1748402505375; Tue, 27 May 2025
 20:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528022911.73453-1-byungchul@sk.com> <20250528022911.73453-9-byungchul@sk.com>
In-Reply-To: <20250528022911.73453-9-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 20:21:32 -0700
X-Gm-Features: AX0GCFuYtIrmK-Wu9BHLQmtJy90lb0ReYg5ZuhjcJ5k8V6K_B7GDLKrd1odKdxE
Message-ID: <CAHS8izMmsHa4taaujEbTK5PM+APYsRJzv1LqGESJf2x6BRnxag@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] page_pool: rename __page_pool_release_page_dma()
 to __page_pool_release_netmem_dma()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com, 
	andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 7:29=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> Now that __page_pool_release_page_dma() is for releasing netmem, not
> struct page, rename it to __page_pool_release_netmem_dma() to reflect
> what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  net/core/page_pool.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index fb487013ef00..af889671df23 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -674,8 +674,8 @@ void page_pool_clear_pp_info(netmem_ref netmem)
>         netmem_set_pp(netmem, NULL);
>  }
>
> -static __always_inline void __page_pool_release_page_dma(struct page_poo=
l *pool,
> -                                                        netmem_ref netme=
m)
> +static __always_inline void __page_pool_release_netmem_dma(struct page_p=
ool *pool,
> +                                                          netmem_ref net=
mem)
>  {
>         struct page *old, *page =3D netmem_to_page(netmem);
>         unsigned long id;
> @@ -722,7 +722,7 @@ static void page_pool_return_netmem(struct page_pool =
*pool, netmem_ref netmem)
>         if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_=
ops)
>                 put =3D pool->mp_ops->release_netmem(pool, netmem);
>         else
> -               __page_pool_release_page_dma(pool, netmem);
> +               __page_pool_release_netmem_dma(pool, netmem);
>
>         /* This may be the last page returned, releasing the pool, so
>          * it is not safe to reference pool afterwards.
> @@ -1140,7 +1140,7 @@ static void page_pool_scrub(struct page_pool *pool)
>                 }
>
>                 xa_for_each(&pool->dma_mapped, id, ptr)
> -                       __page_pool_release_page_dma(pool, page_to_netmem=
(ptr));
> +                       __page_pool_release_netmem_dma(pool, page_to_netm=
em((struct page *)ptr));

I think this needs to remain page_to_netmem(). This static cast should
generate a compiler warning since netmem_ref is a __bitwise.

--=20
Thanks,
Mina
