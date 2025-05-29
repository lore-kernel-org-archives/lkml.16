Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79423507A
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748548487; cv=none; b=SzpgQpzIGxn/vZIohNXxFc8KKe1MoCUnvXdjNMyGX99nDsx8hxCk+CtrOFPse4o5ZyZ8eE32o/tQLVYe0epjdagRbUdOxUZCjXnui+sxi7bf2H6fEd3fkyRRsQh9XdwSbXAvukIHvior3PYbsrMOga7kX7JiIMbJzn+poah/KIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748548487; c=relaxed/simple;
	bh=KDAyZCxfpcHV0to5/wSFImIdoFPpjfeLeo2xpeGVPeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZPgoh02SWwTLh1RhZoA4XbVS44YVSUisVG0pcRTppT+5zq3TEeoksDwu0estsdnE+WpIzLWiOcFrYrL33pmLjYmk5ko7Wj6AlVWYpqzYmI3y8ViTQBS4T2UlCu7ucEOu6kkjJIGXJ0iQNWAoqByN1GxUeR2CfN5znDgFGnxCFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSUxL6Eh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSUxL6Eh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2348a45fc73so47475ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748548484; x=1749153284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S4lB4Gv2jYjRHEOEuJ0wV1gBVt5Pet87rhCpqcSobY=;
        b=MSUxL6EhFcxZAX2nnGpVvd6okohJVgLifzOSpskOkM1C/UVhFz2FyRM6BndNBkInq4
         XRCLCcKD003T1nXhD9/IxCeLSEh0K3JwlgDsUQJ3pchbE0TlozSoDSqP8R/R+o1TBdJB
         oAwaE/C2rHV/IqbTHYaUo8eGIOdSw1PM03dTq6LTBYqRXxx9u4HeKVozrA5eS8t1SxDr
         XorECmCtUU8RMdyTIdE6fZCmaSmy8gflI6M+w3JQSWFa7mrjEntSPHU0sd3CmUGDCs3p
         vfnKNmXYrzudRI236aTDhSqhBpYvxIIVVVHtZzM1DbY5Hrblf+VzcvFgxia7VPLa9QZ9
         U0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748548484; x=1749153284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+S4lB4Gv2jYjRHEOEuJ0wV1gBVt5Pet87rhCpqcSobY=;
        b=SZANnYFv6soBeHEalBYq88Bx2dlqjavHxjBc/dkN31WISMqkDdziH0QUXrT9c5gjta
         PlTHsqTg56HJKi6u7D61NK5agPtikWsrFItqznzDO281XVcl0rUkzhvDWSvx/ijkFFMR
         OGAueQt/PNLtlANHneAQ/iNHH9X+IC6uCgn+ppF31ODcvsenSZLYulFR9V5Nr4y3pJam
         n8BOeeljCfgb2kHfP83dR8RzlkPa52q0L7Zp+F4LFe/u2e56bCkJTvBIDGLZQdoOba4T
         jyM9IyCqE34WtdTuLdiq+QM3lp9J1KsWCEQ3ckJT7Cs+m5ih2PN0MjZxkLNX1m8D6p2s
         tZew==
X-Forwarded-Encrypted: i=1; AJvYcCVHCqjewjTzzHM99ANWI1r4MpQ0Pk2tf15J3GVox6a1MMvV3Y4gAc2vR1bgKynnNxglaDH+txu6sFwQj54=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIGh+f2p6wuQZlPk+GKRkupTG4QIXtrWcb5sbdWEpC7hI77nvR
	sCDZpBTU2WhIezwMZnMjRt6eoUK/vNlcH5BOM/cKG9wXLo6kBlndkzjlx9ksDOYRMy4PIB7+Xho
	ANUYRKlQOcfreLdTWyMU1YNm9AAmzx2D7Mp3DNgIY
X-Gm-Gg: ASbGncvsJnRsjS9gQa2uFKi4252toiZUTw4QQWh118TkE00pXmnqTkHwJKPBi41SR+N
	+KUEpdiXTS5En3PHRS+6rOh9zwV1wsCMr6Ry+D1oTIm6DQafIkoQLobm1wc3uxK9ZecbVPmyU4p
	Xs/ieuhP8CuH6r7SG2F/75belCSv/TjUZxc8IBSGgQ6Em9MWgUSx655YpUDCbFsv+tAiipEHvJo
	Q==
X-Google-Smtp-Source: AGHT+IGmg+nEhmGzdkLEDm9ONY2hZUhV/0fEvZFKjJYpf64+Bw18ZGKp0XAOrshELwrE2o9kRY3dj61qUB92cOKcTUI=
X-Received: by 2002:a17:902:ea0b:b0:234:c37:85a with SMTP id
 d9443c01a7336-2352e05b0edmr555885ad.24.1748548484265; Thu, 29 May 2025
 12:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529031047.7587-1-byungchul@sk.com> <20250529031047.7587-19-byungchul@sk.com>
In-Reply-To: <20250529031047.7587-19-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 May 2025 12:54:31 -0700
X-Gm-Features: AX0GCFt2p_r4U8_gCj8tNExwCZt7Mt1YqF_zxcfMdfPoeOcDtEP_NDyoXRdx3FE
Message-ID: <CAHS8izNyXM_KQiySAw4hZQ+FU8yxAZmcqvjsO7P3pM0HNy0STA@mail.gmail.com>
Subject: Re: [RFC v3 18/18] page_pool: access ->pp_magic through struct
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

On Wed, May 28, 2025 at 8:11=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
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
> ---
>  include/linux/mm.h   | 12 ------------
>  include/net/netmem.h | 14 ++++++++++++++
>  mm/page_alloc.c      |  1 +
>  3 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 8dc012e84033..de10ad386592 100644
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
> index f05a8b008d00..9e4ed3530788 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -53,6 +53,20 @@ NETMEM_DESC_ASSERT_OFFSET(pp_ref_count, pp_ref_count);
>   */
>  static_assert(sizeof(struct netmem_desc) <=3D offsetof(struct page, _ref=
count));
>
> +#ifdef CONFIG_PAGE_POOL
> +static inline bool page_pool_page_is_pp(struct page *page)
> +{
> +       struct netmem_desc *desc =3D (__force struct netmem_desc *)page;
> +

Is it expected that page can be cast to netmem_desc freely? I know it
works now since netmem_desc and page have the same layout, but how is
it going to continue to work when page is shrunk and no longer has
'pp_magic' inside of it? Is that series going to fixup all the places
where casts are done?

Is it also allowed that we can static cast netmem_desc to page?

Consider creating netmem_desc_page helper like ptdesc_page.

I'm not sure the __force is needed too.

--=20
Thanks,
Mina
