Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E87119F42D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152410; cv=none; b=Esl1Bs9d/2QkyWmSkswrHK4oW09Jxk/Vs5qgnpSTbtompv3eezFnQgI82zQoEc9499wuOV51BdjKu/ddYvg66Mrl5NFpOdoCwR/xyKn5wAHmvR9LgNX129qRJZTnUFuuSxUqqjM9DbQA7AsE8eTRS6I4WocRKx/+P4YBnqEeXX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152410; c=relaxed/simple;
	bh=0z6CW5q8CQV/wMH7D+qnHlnbKdM+YxP0rsRBNbXmvIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw8+XC+4yF75X3fAXYz6nmLqYzu4rssG5J6dcbiwWcafsojTjxcbf7ahZfuqpOsHH2SnFmad3dWDlJiUIgS046ej5KQ/6h22+4t8uZd2aPo+cyRXaNR3LGQ/N87XBmazVXo2vkXqbbVr8r00yjGGXhx89bvBPx2DHWwvauQiU2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iqG5kmtf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iqG5kmtf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2348ac8e0b4so4795ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749152409; x=1749757209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gbRXiixoAXfGdGLxJ2oFtFITg4n/f+sldemH0In+WE=;
        b=iqG5kmtfmYpoPJgTLi1pTx/Ysb5WDDVMNa2hNMcxB2upkSS8J2hKGdaBFpHR9P3mDB
         ehLf/QRUGJFSQfjfcwsddwfZ6+evAzGiwYC34maAHJMwl/idMCREX+xf3QGaXOt5953H
         pL3jGDG2KQPJAyCxUg+xh2eCL0D4f7404ci7ECmbm0s8+vYhHKXlpmX1gHIvb/H9tnmE
         xF6FaEOmwAik2CxKaiK3jGCC0U9hUauU0GKUNrf5URyDS6rYCAclVQIxNd8L2ozg5hkK
         yfX5HAT4LEPHrTnGsDv4eZ6tbSA2boaa3QBS0KVtpG9EPaQNeLV3pATMwDrnoF7xpItv
         mHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749152409; x=1749757209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gbRXiixoAXfGdGLxJ2oFtFITg4n/f+sldemH0In+WE=;
        b=oKC2UOkETiuSw2f3CiQMt529UB+mPw6m4QZQFUSn1+vlxXNyTJX3WheQJvcg7pCfZN
         HiorvFBLL6NFvCJU5noe0vnZ/A6FJpl0sIuZYrapliu8xr5/FYyYYh/W7hhyGJlacXXa
         xaPB4szJSNVhPLuELMvAij5XZiyd+YeLWUipa5EF3dBZUlOY4OnDp4FpcKMqAma6mlud
         Z+RhNBSoIRAurP2zDJZm/I7LHymkMoFJGeYvppITFCIZ4FYreL5xmyfTUjcdp9ZRNXMt
         mFd4Z5yJxyY/+XpM4cf2EUdV3ZmonVgZVhdYhRBHnrEkyurAMLm964bbLYE2KuSq7IVQ
         abaw==
X-Forwarded-Encrypted: i=1; AJvYcCVtNKH7SGK+1D7fC8zbYAtPJY3bTAkg+00V+GOyY4RG5pugVz5IP9W/hnNi+EFybucL2iWks/kGzjT6SK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4TMvqje51D/YDGkF0vzM91tGfRXlV/2E0ePDej46AXpPFq3b
	rfc1R4xOo4lO9g4ABa3ldq0WcXC4lPfnhWe0jD+TBk0VSe7qgfodWPu8N+Nf1egEDKtu8prKioW
	6xtSiqTZm55aQfyhk6eAWZS/og7CV82M0Z4wywKI5
X-Gm-Gg: ASbGncumYdWMuJ65IKrHrTJYbzrH3x4UhER6KVcQR7nxqwJsS9Bjb9zpkU9MOJ01nlb
	vlNLRA97GasQwuy+CwkWmX4VGR5Pjvq53TFDC/Sw6Z0xNG+d8tsV2J8gLrEEArT+xqqHm2WGjiL
	QRRon/2+VCrGWada3E2xSuIV4PQhvMmxTfsY8oPi39ANa1JQNKTUsolCY=
X-Google-Smtp-Source: AGHT+IHcTT2o1MKZq8UOcR4hL4bLiIFrmHftqSOGm8UgMZTc0+7X62O4TzoVnuFdqoRLnvK6zwsJrTF6DgwOQtF9S6k=
X-Received: by 2002:a17:902:bd01:b0:235:e1d6:5343 with SMTP id
 d9443c01a7336-23602368069mr378735ad.20.1749152408349; Thu, 05 Jun 2025
 12:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604025246.61616-1-byungchul@sk.com> <20250604025246.61616-4-byungchul@sk.com>
 <29f2c375-65e3-4d22-8274-552653222f8d@gmail.com>
In-Reply-To: <29f2c375-65e3-4d22-8274-552653222f8d@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 5 Jun 2025 12:39:55 -0700
X-Gm-Features: AX0GCFtD68ApdCzrpjOMryrJ8sFch7OmJFbZRp-t7ALE-eD446rw2nCSo1WQWYU
Message-ID: <CAHS8izMb23eaav-Fz50sefuS8BhF7as7=BX+Sv1wj01+0n6tMg@mail.gmail.com>
Subject: Re: [RFC v4 03/18] page_pool: use netmem alloc/put APIs in __page_pool_alloc_page_order()
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Byungchul Park <byungchul@sk.com>, willy@infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com, 
	kuba@kernel.org, ilias.apalodimas@linaro.org, harry.yoo@oracle.com, 
	hawk@kernel.org, akpm@linux-foundation.org, davem@davemloft.net, 
	john.fastabend@gmail.com, andrew+netdev@lunn.ch, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:25=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
>
> On 6/4/25 03:52, Byungchul Park wrote:
> > Use netmem alloc/put APIs instead of page alloc/put APIs and make it
> > return netmem_ref instead of struct page * in
> > __page_pool_alloc_page_order().
> >
> > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > Reviewed-by: Mina Almasry <almasrymina@google.com>
> > ---
> >   net/core/page_pool.c | 26 +++++++++++++-------------
> >   1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> > index 4011eb305cee..523354f2db1c 100644
> > --- a/net/core/page_pool.c
> > +++ b/net/core/page_pool.c
> > @@ -518,29 +518,29 @@ static bool page_pool_dma_map(struct page_pool *p=
ool, netmem_ref netmem, gfp_t g
> >       return false;
> >   }
> >
> > -static struct page *__page_pool_alloc_page_order(struct page_pool *poo=
l,
> > -                                              gfp_t gfp)
> > +static netmem_ref __page_pool_alloc_page_order(struct page_pool *pool,
> > +                                            gfp_t gfp)
> >   {
> > -     struct page *page;
> > +     netmem_ref netmem;
> >
> >       gfp |=3D __GFP_COMP;
> > -     page =3D alloc_pages_node(pool->p.nid, gfp, pool->p.order);
> > -     if (unlikely(!page))
> > -             return NULL;
> > +     netmem =3D alloc_netmems_node(pool->p.nid, gfp, pool->p.order);
> > +     if (unlikely(!netmem))
> > +             return 0;
> >
> > -     if (pool->dma_map && unlikely(!page_pool_dma_map(pool, page_to_ne=
tmem(page), gfp))) {
> > -             put_page(page);
> > -             return NULL;
> > +     if (pool->dma_map && unlikely(!page_pool_dma_map(pool, netmem, gf=
p))) {
> > +             put_netmem(netmem);
>
> It's a bad idea to have {put,get}_netmem in page pool's code, it has a
> different semantics from what page pool expects for net_iov. I.e.
> instead of releasing the netmem and allowing it to be reallocated by
> page pool, put_netmem(niov) will drop a memory provider reference and
> leak the net_iov. Depending on implementation it might even underflow
> mp refs if a net_iov is ever passed here.
>

Hmm, put_netmem (I hope) is designed and implemented to do the right
thing no matter what netmem you pass it (and it needs to, because we
can't predict what netmem will be passed to it):

- For non-pp pages, it drops a page ref.
- For pp pages, it drops a pp ref.
- For non-pp net_iovs (devmem TX), it drops a net_iov ref (which for
devmem net_iovs is a binding ref)
- For pp net_iovs, it drops a niov->pp ref (the same for both iouring
and devmem).

In my estimation using it should be safe to use put_netmem here, but
I'm not opposed to reverting to put_page here, since we're sure it's a
page in this call path anyway.

--=20
Thanks,
Mina
