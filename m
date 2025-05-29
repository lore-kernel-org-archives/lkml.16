Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF508214A94
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536316; cv=none; b=mMHB6od6q9Rqr+8Agt0hGcBrGzUJC4vP0PzLppkjCmTgEMUkymkLdnd8iVHo4otBua2PV5GoZvkxwaJpRBIofQwc52t00iEHjbZ06Q72Kf750QjekGsF2bXyj0cCwxAu4HeRQDoRdY/PpWX6nsirrg4Ao9wvT6hp98O8ayxr25g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536316; c=relaxed/simple;
	bh=/+TwF0iOIuPtIovdSt9p9rMp+9YvNKofhvs3AW+jgXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tgl/gokAsIeBDb1y3Z9srrEUg9Y3/NOF2PJt2LhqA4+EFzVpcIpluhgBklfwT3WOubMExdlVARFOB0RPCGvvwfwpeLl164sk4Ong+DIhkV46CXRbf6oKJWf+bdbloPQIgPOgjghHzSxLAMiHY7QoVQW+9mYdNPkzPDfMWUgpTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AA6EPPVR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AA6EPPVR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231ba6da557so210335ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748536314; x=1749141114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVDGu5ERwU5ZgtkOKGr5oJl2eiCK7dgYvbFJ0GbeMic=;
        b=AA6EPPVR/7EN1NgGGrAVLSLaBfnfOglxHvQMGa23fktB0WgyiPUghvhiK9kbGyCI/v
         HF2Amie0hi2qgMys+abRTkYC3OJxt6WUJhzqItuRGdp67A0FEghmHO1J4kqhj7xvrP6C
         Dj7XEgVfuHL4GYoRJWxGmzbhs1M9HlQE8ME3dVLKTo7hdWe5dcM2A4lht5AJC9CFoUbl
         6bw/8HeOeN551g3VivOtRkjeyQVmSWWwDAn0zPWVuh2W6eBRryJaur46Hg4/EfMECKxQ
         pgCTUOkCH3l6fxPlKs2ekHGCYd1PceZRTW6frw6QIbT8Jg+0wy8f+3WULdq6MZ/T1vMc
         RoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748536314; x=1749141114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVDGu5ERwU5ZgtkOKGr5oJl2eiCK7dgYvbFJ0GbeMic=;
        b=nFS3bf7RseKoS5VnJTkqU5JFnWGPC07UXiSaXeu/IOPP4kKIy88taqsUnO/VjLa9v9
         aaovSw50Xm2of0XGDroY+NK1QndNX8w0NcDfrTykryZc5YAw6Z2g87UpoRZbeQvKuirT
         ZKLVg8CDPwKZQlfjIk6svE44Ow2bot7vAlfr96uvy0rEN9gaz94v6As4SNyFZCoHr+ud
         Jzwvgt/tMfNOdjB3lPf+tkEm7tzVZTC/xxoQLK/WsJxDwP9Yu45DvYf7nfuYabL/R2wk
         TYWudzaKHfNpSutaShGwUt9FXy1f8sXag/Va5vZ42ijMsb7z4Fj/itGjqa1mFk6XQ2en
         SRVA==
X-Forwarded-Encrypted: i=1; AJvYcCWeU2BKOXqeMXiANYtMwEnoL6vCocP88OBhusf5tPmy11YjtCrjXCJXKg5CR/we/j73c2P6R0mqrW9Z83Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2n8XS6iO50a7/zjGwoc+qQT2aRYqtS54rXER2BDzK3WuoZNCT
	L3+2Nl6YtDjoMRdHjuTQjl7mAerrieGjeBh/uril/DzSQQt1JN8IpQAvrnf2sDopIHSph+Svo5p
	s6KEIp0bIIf5yoffU8lZlE+6wh7G6tD8c3Hi4PDAe
X-Gm-Gg: ASbGnctvxNrfTwKoRZeg7/GJcUc1M8Wbl8UgIjUis4X+645e6rpsdBofXngzvnuYN5q
	bKGBZa29RK2mfEPZR3MRL9Q0IC/NVdOYk1/MOv1CfHalaC435VXq7A3CmRs+WUlSvvcABwvD0xf
	KQYeJIpB4wrYmBZ4b5wMzPkwvBUzaGx7aqzdzP4BDi0gfX
X-Google-Smtp-Source: AGHT+IFb5ehY2LBDui4OEWlKyCcK0nJ/FtdW4knYpW4p37PTcpUggU1f3J8Fa109z1I2zx4rCQYS2wIX4+Tp0LJygZ8=
X-Received: by 2002:a17:902:e84e:b0:234:7653:aff4 with SMTP id
 d9443c01a7336-23506a95855mr3173125ad.23.1748536313565; Thu, 29 May 2025
 09:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529031047.7587-1-byungchul@sk.com> <20250529031047.7587-2-byungchul@sk.com>
In-Reply-To: <20250529031047.7587-2-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 May 2025 09:31:40 -0700
X-Gm-Features: AX0GCFu6I95UuYW0dpMwLmIgYy9IdXbwL1i3YzcJ0K7HMx8drU0_s9IWKIaa7gM
Message-ID: <CAHS8izNBjkMLbQsP++0r+fbkW2q7gGOdrbmE7gH-=jQUMCgJ1g@mail.gmail.com>
Subject: Re: [RFC v3 01/18] netmem: introduce struct netmem_desc mirroring
 struct page
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

On Wed, May 28, 2025 at 8:11=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> To simplify struct page, the page pool members of struct page should be
> moved to other, allowing these members to be removed from struct page.
>
> Introduce a network memory descriptor to store the members, struct
> netmem_desc and make it union'ed with the existing fields in struct
> net_iov, allowing to organize the fields of struct net_iov.  The final
> look of struct net_iov should be like:
>
>         struct net_iov {
>                 struct netmem_desc;
>                 net_field1; /* e.g. struct net_iov_area *owner; */
>                 net_field2;
>                 ...
>         };
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

This version looks much better from networking POV, and I think with
small adjustments we can make it work I think. I'll leave Matthew to
confirm if it's aligned with the memdesc plans.

> ---
>  include/net/netmem.h | 101 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 79 insertions(+), 22 deletions(-)
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 386164fb9c18..d52f86082271 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -12,6 +12,47 @@
>  #include <linux/mm.h>
>  #include <net/net_debug.h>
>
> +/* These fields in struct page are used by the page_pool and net stack:
> + *
> + *        struct {
> + *                unsigned long pp_magic;
> + *                struct page_pool *pp;
> + *                unsigned long _pp_mapping_pad;
> + *                unsigned long dma_addr;
> + *                atomic_long_t pp_ref_count;
> + *        };
> + *
> + * We mirror the page_pool fields here so the page_pool can access these
> + * fields without worrying whether the underlying fields belong to a
> + * page or netmem_desc.
> + */
> +struct netmem_desc {
> +       unsigned long _flags;
> +       unsigned long pp_magic;
> +       struct page_pool *pp;
> +       unsigned long _pp_mapping_pad;
> +       unsigned long dma_addr;
> +       atomic_long_t pp_ref_count;
> +};
> +
> +#define NETMEM_DESC_ASSERT_OFFSET(pg, desc)        \
> +       static_assert(offsetof(struct page, pg) =3D=3D \
> +                     offsetof(struct netmem_desc, desc))
> +NETMEM_DESC_ASSERT_OFFSET(flags, _flags);
> +NETMEM_DESC_ASSERT_OFFSET(pp_magic, pp_magic);
> +NETMEM_DESC_ASSERT_OFFSET(pp, pp);
> +NETMEM_DESC_ASSERT_OFFSET(_pp_mapping_pad, _pp_mapping_pad);
> +NETMEM_DESC_ASSERT_OFFSET(dma_addr, dma_addr);
> +NETMEM_DESC_ASSERT_OFFSET(pp_ref_count, pp_ref_count);
> +#undef NETMEM_DESC_ASSERT_OFFSET
> +
> +/*
> + * Since struct netmem_desc uses the space in struct page, the size
> + * should be checked, until struct netmem_desc has its own instance from
> + * slab, to avoid conflicting with other members within struct page.
> + */
> +static_assert(sizeof(struct netmem_desc) <=3D offsetof(struct page, _ref=
count));
> +
>  /* net_iov */
>
>  DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
> @@ -31,12 +72,33 @@ enum net_iov_type {
>  };
>
>  struct net_iov {
> -       enum net_iov_type type;
> -       unsigned long pp_magic;
> -       struct page_pool *pp;
> -       struct net_iov_area *owner;
> -       unsigned long dma_addr;
> -       atomic_long_t pp_ref_count;
> +       union {
> +               struct netmem_desc desc;
> +
> +               /* XXX: The following part should be removed once all
> +                * the references to them are converted so as to be
> +                * accessed via netmem_desc e.g. niov->desc.pp instead
> +                * of niov->pp.
> +                *
> +                * Plus, once struct netmem_desc has it own instance
> +                * from slab, network's fields of the following can be
> +                * moved out of struct netmem_desc like:
> +                *
> +                *    struct net_iov {
> +                *       struct netmem_desc desc;
> +                *       struct net_iov_area *owner;
> +                *       ...
> +                *    };
> +                */

We do not need to wait until netmem_desc has its own instance from
slab to move the net_iov-specific fields out of netmem_desc. We can do
that now, because there are no size restrictions on net_iov.

So, I recommend change this to:

struct net_iov {
  /* Union for anonymous aliasing: */
  union {
    struct netmem_desc desc;
    struct {
       unsigned long _flags;
       unsigned long pp_magic;
       struct page_pool *pp;
       unsigned long _pp_mapping_pad;
       unsigned long dma_addr;
       atomic_long_t pp_ref_count;
    };
    struct net_iov_area *owner;
    enum net_iov_type type;
};

>
>  struct net_iov_area {
> @@ -48,27 +110,22 @@ struct net_iov_area {
>         unsigned long base_virtual;
>  };
>
> -/* These fields in struct page are used by the page_pool and net stack:
> +/* net_iov is union'ed with struct netmem_desc mirroring struct page, so
> + * the page_pool can access these fields without worrying whether the
> + * underlying fields are accessed via netmem_desc or directly via
> + * net_iov, until all the references to them are converted so as to be
> + * accessed via netmem_desc e.g. niov->desc.pp instead of niov->pp.
>   *
> - *        struct {
> - *                unsigned long pp_magic;
> - *                struct page_pool *pp;
> - *                unsigned long _pp_mapping_pad;
> - *                unsigned long dma_addr;
> - *                atomic_long_t pp_ref_count;
> - *        };
> - *
> - * We mirror the page_pool fields here so the page_pool can access these=
 fields
> - * without worrying whether the underlying fields belong to a page or ne=
t_iov.
> - *
> - * The non-net stack fields of struct page are private to the mm stack a=
nd must
> - * never be mirrored to net_iov.
> + * The non-net stack fields of struct page are private to the mm stack
> + * and must never be mirrored to net_iov.
>   */
> -#define NET_IOV_ASSERT_OFFSET(pg, iov)             \
> -       static_assert(offsetof(struct page, pg) =3D=3D \
> +#define NET_IOV_ASSERT_OFFSET(desc, iov)                    \
> +       static_assert(offsetof(struct netmem_desc, desc) =3D=3D \
>                       offsetof(struct net_iov, iov))
> +NET_IOV_ASSERT_OFFSET(_flags, type);

Remove this assertion.

>  NET_IOV_ASSERT_OFFSET(pp_magic, pp_magic);
>  NET_IOV_ASSERT_OFFSET(pp, pp);
> +NET_IOV_ASSERT_OFFSET(_pp_mapping_pad, owner);

And this one.

(_flags, type) and (_pp_mapping_pad, owner) have very different
semantics and usage, we should not assert they are not the same
offset. However (pp, pp) and (pp_magic,pp_magic) have the same
semantics and usage, so we do assert they are at the same offset.

Code is allowed to access __netmem_clear_lsb(netmem)->pp or
__netmem_clear_lsb(netmem)->pp_magic without caring what's the
underlying memory type because both fields have the same semantics and
usage.

Code should *not* assume it can access
__netmem_clear_lsb(netmem)->owner or __netmem_clear_lsb(netmem)->type
without doing a check whether the underlying memory is
page/netmem_desc or net_iov. These fields are only usable for net_iov,
so let's explicitly move them to a different place.

--=20
Thanks,
Mina
