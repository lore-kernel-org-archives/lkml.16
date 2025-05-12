Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C990482F2
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054004; cv=none; b=gRvA7pOMHW/RLoc037smW7f/yj6JnonszPahc80g37ZcGRWz6Tz/uzsopwF+WKsdEO/hi9u/A9c4yfEVOKwESzuzku1oUCRih+a0hvm2AYzb3Pf1j2EmPFDfmUaOZuG1s4ROmeQwuaCFbwFbt0eCrzBALlYROuruZNyiSuzdGfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054004; c=relaxed/simple;
	bh=SFrQ96SWjOHxF+NK26v1Qk+ijp7hkNrxd9MMXtK3qCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ciRdXLlBstxjuo23QGt0pqu+7Lo3lBp7BePJj/O0ophk8Rn7J+M5tbIbgBJbUM20JQe/5SnmOQELiA1+1t+ZemxQ2FyFgDcKHdXy06bXo4CvwJl6ffvMeMs2IwwLWcM2tllCjABYI6uzDbTbsoBbmwcEtcaG1PAj/Ied4hF74IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K7rdnfII; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K7rdnfII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747054000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0NkzqQd6U+yQ9nxd2lN/wdHj8OOAvjcAGxVttB90OmY=;
	b=K7rdnfIIl7GAgamCUxdqpXjgx0PcFEsl0yPbQ65dbCVoNLmuc8Yw7oJSYCv/WlsAX7GH3W
	t8TctIwNpCvDPa0bSzpHVQDOBgHr83X5WaV1G/P6jmAYusH3gDp5m3AUVyUAFCpiZDJFj+
	rBvRK0KqtJIc3FqI1QxrHy7RbVTlrnk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-M5vtbK7-MxqyUAC_eDNlPA-1; Mon, 12 May 2025 08:46:39 -0400
X-MC-Unique: M5vtbK7-MxqyUAC_eDNlPA-1
X-Mimecast-MFC-AGG-ID: M5vtbK7-MxqyUAC_eDNlPA_1747053998
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac6ce5fe9bfso417795066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053998; x=1747658798;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0NkzqQd6U+yQ9nxd2lN/wdHj8OOAvjcAGxVttB90OmY=;
        b=eySnbaNgOTIov72NhRnQ3g7aJApbZuZUwhxF2xmQblj1GM9Bte/ZWu5LCR8HvBe2gI
         qxGwDZaB6GndhY1nj4oAnSyDwexfGr7YWrt1ZrbroczCJAwTDhZkPlmZLiBJMWb1rHAx
         tOBIZBbsKLicLBPPlm6qcjppPjia5A6IjqLE7eSZFIZ+8SKv88PhR51R+v1pOB9I0Efo
         CK+nZPDVUVABr2ddRA+wQhnIOHVBfLFxDQvYtmkwXXlq2QxwPjU3oUNR+im5Q4/IAR1a
         /8gESkqAq8woS3NUU8FfjRrbTJh7XoWurZlTYbvzAVzHn3CWEXygdXFL+0xdDlVopGE9
         NDNQ==
X-Gm-Message-State: AOJu0YwekLNCnmt768iMIahJ3rzQ6Xpi54lIkcGpwmmPNXpvDGXUa8SO
	ZN+0QgpGB+2Rbs/uJ4dnZWcw2Ur3pc5k3u96XXj8c57s/4fPUztf+Z4u9FCe/+1RY0IDsI0aogG
	sjGD4UEjVKRAQyPwzO2nZBlZDaKyA0mr23J+jbGKBKRovMAyovJSLqDOiPnGSkA==
X-Gm-Gg: ASbGnctC3w+KLzqVJUtK5Ca1Av0XMAmH0aVPR+EXwQFr26LqhgUIx2rXpSeyYlUWGYl
	T6yVKLsdWhx7El1KpwiBzowUAJZCBOxpBmdGR1Ys5MvrjnB8PPNEXFxNvg1BIEcmEV6LC0AbSBR
	VGdKwJBhR2rnDORHnsrFS6A26zcoCjJkcD46az627Q/9YxBDM6L4yytdGjYSk4qqqm/STBXtaM4
	i4MC+Gp27mTSXQqcYcC0CtFhA99FhmrTCF9I92rCiUmPlijzGJJXOZ0QzOoziUOG57azav6AeTR
	nKnGfm0ZX2Ihjq1z/KFSzrdMpTJVgnKik7Dv
X-Received: by 2002:a17:907:60ca:b0:ad2:47e7:3f40 with SMTP id a640c23a62f3a-ad247e741d8mr610956466b.51.1747053998233;
        Mon, 12 May 2025 05:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv5Yseqz71/930sKihuYXBmsPyQO4+2Jp0cb013Gtt770NhHe4Wblb+klxHw4Q72ax0dlTvw==
X-Received: by 2002:a17:907:60ca:b0:ad2:47e7:3f40 with SMTP id a640c23a62f3a-ad247e741d8mr610953566b.51.1747053997827;
        Mon, 12 May 2025 05:46:37 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2521cc56bsm193357966b.109.2025.05.12.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:46:37 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 3A9011A0C828; Mon, 12 May 2025 14:46:36 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Byungchul Park <byungchul@sk.com>, willy@infradead.org,
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kernel_team@skhynix.com, kuba@kernel.org, almasrymina@google.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org,
 akpm@linux-foundation.org, ast@kernel.org, daniel@iogearbox.net,
 davem@davemloft.net, john.fastabend@gmail.com, andrew+netdev@lunn.ch,
 edumazet@google.com, pabeni@redhat.com, vishal.moola@gmail.com
Subject: Re: [RFC 13/19] page_pool: expand scope of is_pp_{netmem,page}() to
 global
In-Reply-To: <20250509115126.63190-14-byungchul@sk.com>
References: <20250509115126.63190-1-byungchul@sk.com>
 <20250509115126.63190-14-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 12 May 2025 14:46:36 +0200
Message-ID: <87y0v22dzn.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Byungchul Park <byungchul@sk.com> writes:

> Other than skbuff.c might need to check if a page or netmem is for page
> pool, for example, page_alloc.c needs to check the page state, whether
> it comes from page pool or not for their own purpose.
>
> Expand the scope of is_pp_netmem() and introduce is_pp_page() newly, so
> that those who want to check the source can achieve the checking without
> accessing page pool member, page->pp_magic, directly.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  include/net/page_pool/types.h |  2 ++
>  net/core/page_pool.c          | 10 ++++++++++
>  net/core/skbuff.c             |  5 -----
>  3 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
> index 36eb57d73abc6..d3e1a52f01e09 100644
> --- a/include/net/page_pool/types.h
> +++ b/include/net/page_pool/types.h
> @@ -299,4 +299,6 @@ static inline bool is_page_pool_compiled_in(void)
>  /* Caller must provide appropriate safe context, e.g. NAPI. */
>  void page_pool_update_nid(struct page_pool *pool, int new_nid);
>  
> +bool is_pp_netmem(netmem_ref netmem);
> +bool is_pp_page(struct page *page);
>  #endif /* _NET_PAGE_POOL_H */
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index b61c1038f4c68..9c553e5a1b555 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -1225,3 +1225,13 @@ void net_mp_niov_clear_page_pool(struct netmem_desc *niov)
>  
>  	page_pool_clear_pp_info(netmem);
>  }
> +
> +bool is_pp_netmem(netmem_ref netmem)
> +{
> +	return (netmem_get_pp_magic(netmem) & ~0x3UL) == PP_SIGNATURE;
> +}
> +
> +bool is_pp_page(struct page *page)
> +{
> +	return is_pp_netmem(page_to_netmem(page));
> +}
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 6cbf77bc61fce..11098c204fe3e 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -893,11 +893,6 @@ static void skb_clone_fraglist(struct sk_buff *skb)
>  		skb_get(list);
>  }
>  
> -static bool is_pp_netmem(netmem_ref netmem)
> -{
> -	return (netmem_get_pp_magic(netmem) & ~0x3UL) == PP_SIGNATURE;
> -}
> -

This has already been moved to mm.h (and the check changed) by commit:

cd3c93167da0 ("page_pool: Move pp_magic check into helper functions")

You should definitely rebase this series on top of that (and the
subsequent ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap
them when destroying the pool")), as these change the semantics of how
page_pool interacts with struct page.

Both of these are in net-next, which Mina already asked you to rebase
on, so I guess you'll pick it up there, put flagging it here just for
completeness :)

-Toke

