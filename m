Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2578021B8E7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749490761; cv=none; b=fjoeikzX8tEjTthmC3Q8SwQZmPNqXyoDneupSmDiBHYgBizGd0dKRG4NmHhzee8IOdVW6cUhVLBHKCPEEHYTPlLkyukpm2PZjdxUvMHo4M2bSysbVEIU1Bj+UJ0IMZqyNGKAwU7c3HAP4S70NZn1RcoDovRguXv4QUlQMKRtdnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749490761; c=relaxed/simple;
	bh=vDEZLmFiWUgAEhhMnpPxC2x5ptegpxqcBtIXF4EgUvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTt2fEwU9ZtuxdgJnCZAnA83f9BZuE6SBYXJUCwdtGEwtdtFsYAuW6HyIRwcS+dk9U4C8QUcy9aKuvzXfYDCj/prWg4NwC04EhUP4Qn9Gxrsai+/yzZjIi214lkojGtRlGSJ9yfex1nDx1fzx1hPqExZRfYV3R+Sz31bDpVH3o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UxFchhEB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UxFchhEB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2357c61cda7so13225ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749490759; x=1750095559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RRpRkvuNJy3cXkOhH8biChoDOFuxh8lZ/u2fpQqLzg=;
        b=UxFchhEB/EOTc0w70KhZaY15W09uYu6jXZOdr2ase+hIfTCPnYc/ZCm8tpKuJPWiOY
         xZJfxn+61Ida+6G3EvB/BAOPBOyt9hI4GgbeyzuBG9TCxdpv0yWiNx+10mK38OG8e0YT
         njTgmMc4zguYLqaxNenGblIq6z0Z8wqh9hm59Kfbjy+dkQUMe6KED7usY9RvlBxgF+3i
         pCE1id1SQeHxgEQygp3chDNtfyiTg+MIK2RFk9nxvVh6TbdJiCQv8iz16M15ZPipF32q
         Gs6Q9ysEJjPpaVmI39FOiyCGGRz2hKEMgb7wWg+9x67ahJ6X0DcMqFebPc/FxvZhcJM1
         zfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490759; x=1750095559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RRpRkvuNJy3cXkOhH8biChoDOFuxh8lZ/u2fpQqLzg=;
        b=b3fKU55QXDBySJFLos30gLXPHTD4DAhx2le+Ey166KeqyJonWUwDt03FmTIl8t2P/h
         CUlsHaibYJfWjexuPQKzJytxymLxo6TzCCpSJWuLdv1BULHco8NsTjXNeyN6rYVluUl4
         3pvVEr8n3G6mjCRH8wYcyE/n7TSWeLPHvAlnFcc4YEv1CTz6LXQOz/1eCBz2swgA5zwg
         XQ4oB6cJyWhIj/4A0T3k9zzCsd3qjjDwZ4DNcWWQKH3pP0mT7NER3meY0/PhHinLTLD0
         mt3pjqbqsFCqmBKF6iL5FUacz/CZuxbA0hxnycFxkcv3P+uSeeOq/lfwj7NgO3lv+c7J
         rkuA==
X-Forwarded-Encrypted: i=1; AJvYcCWF+F7T5nFdjFI5dbuNfiJSn61o6L9ai8QMidymw0V2SRtR+J2mf5b6T8rw0KGjesgffm8tLVv7VNdWZaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIEIzKsrImM8RJCFjgQskt8kYpi+xXDcUXZmj61SvUGSCI+qgA
	AAfGy4DSQ28GGZF1vdsdwTA5aOneuQOd5wwX5D+FuWRK6WyiRNwEc2NnQzMtknwj6ngek0Yz7aP
	JxbmlHWUwQtVI7Re8WzFhteKgtW5dG1KCUPXwD5ejgyQlBdrjj/Q9SCbM
X-Gm-Gg: ASbGncsacfkj53t8QrBpaUPiQI0wsfeuO6r3zRke6f0S0bnClYxv+OvnL5QQf461t+Q
	44h/b9tVeN0EnHa8zl5McCAI8x3D1Rol/OgPBwhswYhV3qs87s+L5RTw3/GZtCXKs/KcP8j6/w8
	PWEdMUHPte/endgoFMasB6Dz547o6xxVbVjfcMyiXjGjrIyK7zuNe0qpt5yppT6tJmdkQHCTK8u
	Q==
X-Google-Smtp-Source: AGHT+IEvrq24XpltBFWvdSIlKpCIc8JCZdMNJ6F/M800m9IOuRhKavTYagOECC3DsNK5G3lKUSM8nYe/B6o3T3jdn9Q=
X-Received: by 2002:a17:902:e745:b0:231:ed22:e230 with SMTP id
 d9443c01a7336-23613de3742mr5147245ad.15.1749490759104; Mon, 09 Jun 2025
 10:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609043225.77229-1-byungchul@sk.com> <20250609043225.77229-10-byungchul@sk.com>
In-Reply-To: <20250609043225.77229-10-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 9 Jun 2025 10:39:06 -0700
X-Gm-Features: AX0GCFuAdxMyfuOpDJOl1NBEK5X2zXvXF5ManUgjd3SO6IAFQ752DFSmiJ8__HE
Message-ID: <CAHS8izMLnyJNnK-K-kR1cSt0LOaZ5iGSYsM2R=QhTQDSjCm8pg@mail.gmail.com>
Subject: Re: [PATCH net-next 9/9] page_pool: access ->pp_magic through struct
 netmem_desc in page_pool_page_is_pp()
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

On Sun, Jun 8, 2025 at 9:32=E2=80=AFPM Byungchul Park <byungchul@sk.com> wr=
ote:
>
> To simplify struct page, the effort to separate its own descriptor from
> struct page is required and the work for page pool is on going.
>
> To achieve that, all the code should avoid directly accessing page pool
> members of struct page.
>
> Access ->pp_magic through struct netmem_desc instead of directly
> accessing it through struct page in page_pool_page_is_pp().  Plus, move
> page_pool_page_is_pp() from mm.h to netmem.h to use struct netmem_desc
> without header dependency issue.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> ---
>  include/linux/mm.h   | 12 ------------
>  include/net/netmem.h | 14 ++++++++++++++
>  mm/page_alloc.c      |  1 +
>  3 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e51dba8398f7..f23560853447 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4311,16 +4311,4 @@ int arch_lock_shadow_stack_status(struct task_stru=
ct *t, unsigned long status);
>   */
>  #define PP_MAGIC_MASK ~(PP_DMA_INDEX_MASK | 0x3UL)
>
> -#ifdef CONFIG_PAGE_POOL
> -static inline bool page_pool_page_is_pp(struct page *page)
> -{
> -       return (page->pp_magic & PP_MAGIC_MASK) =3D=3D PP_SIGNATURE;
> -}
> -#else
> -static inline bool page_pool_page_is_pp(struct page *page)
> -{
> -       return false;
> -}
> -#endif
> -
>  #endif /* _LINUX_MM_H */
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index d84ab624b489..8f354ae7d5c3 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -56,6 +56,20 @@ NETMEM_DESC_ASSERT_OFFSET(pp_ref_count, pp_ref_count);
>   */
>  static_assert(sizeof(struct netmem_desc) <=3D offsetof(struct page, _ref=
count));
>
> +#ifdef CONFIG_PAGE_POOL
> +static inline bool page_pool_page_is_pp(struct page *page)
> +{
> +       struct netmem_desc *desc =3D (struct netmem_desc *)page;
> +
> +       return (desc->pp_magic & PP_MAGIC_MASK) =3D=3D PP_SIGNATURE;
> +}
> +#else
> +static inline bool page_pool_page_is_pp(struct page *page)
> +{
> +       return false;
> +}
> +#endif
> +
>  /* net_iov */
>
>  DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 4f29e393f6af..be0752c0ac92 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -55,6 +55,7 @@
>  #include <linux/delayacct.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/pgalloc_tag.h>
> +#include <net/netmem.h>

mm files starting to include netmem.h is a bit interesting. I did not
expect/want dependencies outside of net. If anything the netmem stuff
include linux/mm.h

But I don't have a butter suggestion here and I don't see any huge
problems with this off the top of my head, so

Reviewed-by: Mina Almasry <almasrymina@google.com>

Lets see if Jakub objects though. To be fair, we did put the netmem
private stuff in net/core/netmem_priv.h, so technically
include/net/netmem.h should be exportable indeed.

--=20
Thanks,
Mina
