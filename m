Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ADB221F27
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221449; cv=none; b=ITUWOeGKsY/AdXyqWTl8RFOQ0udblCkw9TK+bf4YFl+Mc5oBMcbCil5s214OXvaHWQGiq8x9CDTib1TDCSSlgjYnLT8OvR6gm6cF78yzjOqwgITmVvpJOfZdyI8JGKZ9lqmLqPg+I/HzZZwc49WU0nj2Q93rJ+7LQowhXVmpJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221449; c=relaxed/simple;
	bh=RBuPlFJQCXaOH//7zIjvUQYlISJ+GKa/bcBTM3fzAS0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FZ0N943SfBUh0b9IhB3e6CP9iGRoXvlA2I1yI93PRY07pX2zCEqZp9b6SJZz2D9hTDqCmZ6pCazQA0DZxbeTFrdpSvuvYpopsb2zzRp5Hrnem9msQR+4X5rVKgtSobjnm9PHCl92yJKfnL37K4mn27LLEJSmIvDTxjmaBPE3ti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NlcgFt58; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NlcgFt58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747221446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rtu6wXenoWLkyS7hMHKw/YacghO9Vh2vvDpQZW7iexY=;
	b=NlcgFt58HITRmMsQxZWqDZaAoSP8pSjgPdY34Klx5BPJwsyWNr5PlFMAI50i2bI9BZCg7T
	lxVNLgACZZnbJPHB73grTCFcub7d4GyqbyQWY3TQe/oBbSjFYqjJld3sB1nFGHJMSncQ2G
	bRyMshUJfMnhBU/hEPUEL89nJolofE0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-VQnLTfkbNeyeYn0FGBSCTQ-1; Wed, 14 May 2025 07:17:25 -0400
X-MC-Unique: VQnLTfkbNeyeYn0FGBSCTQ-1
X-Mimecast-MFC-AGG-ID: VQnLTfkbNeyeYn0FGBSCTQ_1747221444
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac6ce5fe9bfso639397066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747221444; x=1747826244;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rtu6wXenoWLkyS7hMHKw/YacghO9Vh2vvDpQZW7iexY=;
        b=XHC/QZGnJsETHl0zZ96ctwgdF38ornxWgGxM9WHJyY93GPr01l0GlbXtueTbSDLPkz
         y81nRPE+XaQ+fXkNssoxwjiWE/ATspe/d8AU0gib4SZI74785YHPyYkX2ZbJfUfCnplF
         8n27sMMdJG+Grf4Hbrm9kcvwrXupKu0NCQwXvH1ba9O/xetuLBTYxaPfpV9Oo/bXOE1o
         f2WHiTGqjrdjj5tm9kXJyo5edY6asfKhbSmjwae3joipJ5b4MpNjVRrUWEwJ2ZnQWJSs
         DHWHIM0AJX3g85oswnmUfzZGOQg5VDJUMR/rn2amVcgzcKAlCsOMUtDHHkMs9j7lJIax
         dTyA==
X-Forwarded-Encrypted: i=1; AJvYcCV1nai8zwYd57b6c+6nxkf/BEt0V9mBnPMzHJlRklneL/nSaQ4z19lhHof17zaOItcrTegsexZqIVYYpEI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzro0G2IPiixtfBWKgCXCSk1sqIStCiMfnOjer7P34Iqa5gdNHY
	UbLqFWmJZFZTzsxzmH/rA1T7BbVmpB5InXg+bPo0qJBof/FQfhG1eHRA/LSP+3xZL3Ajb87KyI3
	PvEYeSLAxjgwXOBKMOp7hjKs7W09GSmfmLQgpyWlQ6J7u4f+ZqJwch1kaKx2c9A==
X-Gm-Gg: ASbGncu8cx0XLdfBS/XZGDAWxETXNHTFpZ21o+RLEdQ/tMqSOKtvWapBlm9xl6hIrXo
	IAB5fdY5fv0cLamuN+a1ATKw4AXul6Jn7cOwVfxGjJJ9oIkoQJP+0Dh+sbBPVrnmX16jI67GXC9
	+yklDVU/t7w3cy+peYIF6vmXhwxCO5me9Pn030D8thDj8uZ2vxboGvNFGmVQcEPb7SN0tesUxI2
	wS4HpsrzjwcAK5l1NEMx1z1AaBdwoSqUF4sejauFV/wh6iz3JJryz5c1YKJd03Z5iJTCnxx46FQ
	UJ4sAKcD
X-Received: by 2002:a17:907:c003:b0:ad2:40e0:3e56 with SMTP id a640c23a62f3a-ad4f74d3f1amr245862266b.57.1747221443648;
        Wed, 14 May 2025 04:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoCS8Bs/IxXF7z3Ch8iAlM1Jx+122ikfD38kD4H0+EEUxHOyys24VpB3hPGN7/3sYd5dZbNA==
X-Received: by 2002:a17:907:c003:b0:ad2:40e0:3e56 with SMTP id a640c23a62f3a-ad4f74d3f1amr245857966b.57.1747221443111;
        Wed, 14 May 2025 04:17:23 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad50451381csm48430366b.138.2025.05.14.04.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:17:22 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 5EA191A734CC; Wed, 14 May 2025 13:17:21 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com,
 kuba@kernel.org, almasrymina@google.com, ilias.apalodimas@linaro.org,
 harry.yoo@oracle.com, hawk@kernel.org, akpm@linux-foundation.org,
 ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net,
 john.fastabend@gmail.com, andrew+netdev@lunn.ch, edumazet@google.com,
 pabeni@redhat.com, vishal.moola@gmail.com
Subject: Re: [RFC 13/19] page_pool: expand scope of is_pp_{netmem,page}() to
 global
In-Reply-To: <20250514030040.GA48035@system.software.com>
References: <20250509115126.63190-1-byungchul@sk.com>
 <20250509115126.63190-14-byungchul@sk.com> <87y0v22dzn.fsf@toke.dk>
 <20250514030040.GA48035@system.software.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 14 May 2025 13:17:21 +0200
Message-ID: <874ixnl9vi.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> On Mon, May 12, 2025 at 02:46:36PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Byungchul Park <byungchul@sk.com> writes:
>>=20
>> > Other than skbuff.c might need to check if a page or netmem is for page
>> > pool, for example, page_alloc.c needs to check the page state, whether
>> > it comes from page pool or not for their own purpose.
>> >
>> > Expand the scope of is_pp_netmem() and introduce is_pp_page() newly, so
>> > that those who want to check the source can achieve the checking witho=
ut
>> > accessing page pool member, page->pp_magic, directly.
>> >
>> > Signed-off-by: Byungchul Park <byungchul@sk.com>
>> > ---
>> >  include/net/page_pool/types.h |  2 ++
>> >  net/core/page_pool.c          | 10 ++++++++++
>> >  net/core/skbuff.c             |  5 -----
>> >  3 files changed, 12 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/include/net/page_pool/types.h b/include/net/page_pool/typ=
es.h
>> > index 36eb57d73abc6..d3e1a52f01e09 100644
>> > --- a/include/net/page_pool/types.h
>> > +++ b/include/net/page_pool/types.h
>> > @@ -299,4 +299,6 @@ static inline bool is_page_pool_compiled_in(void)
>> >  /* Caller must provide appropriate safe context, e.g. NAPI. */
>> >  void page_pool_update_nid(struct page_pool *pool, int new_nid);
>> >=20=20
>> > +bool is_pp_netmem(netmem_ref netmem);
>> > +bool is_pp_page(struct page *page);
>> >  #endif /* _NET_PAGE_POOL_H */
>> > diff --git a/net/core/page_pool.c b/net/core/page_pool.c
>> > index b61c1038f4c68..9c553e5a1b555 100644
>> > --- a/net/core/page_pool.c
>> > +++ b/net/core/page_pool.c
>> > @@ -1225,3 +1225,13 @@ void net_mp_niov_clear_page_pool(struct netmem_=
desc *niov)
>> >=20=20
>> >  	page_pool_clear_pp_info(netmem);
>> >  }
>> > +
>> > +bool is_pp_netmem(netmem_ref netmem)
>> > +{
>> > +	return (netmem_get_pp_magic(netmem) & ~0x3UL) =3D=3D PP_SIGNATURE;
>> > +}
>> > +
>> > +bool is_pp_page(struct page *page)
>> > +{
>> > +	return is_pp_netmem(page_to_netmem(page));
>> > +}
>> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
>> > index 6cbf77bc61fce..11098c204fe3e 100644
>> > --- a/net/core/skbuff.c
>> > +++ b/net/core/skbuff.c
>> > @@ -893,11 +893,6 @@ static void skb_clone_fraglist(struct sk_buff *sk=
b)
>> >  		skb_get(list);
>> >  }
>> >=20=20
>> > -static bool is_pp_netmem(netmem_ref netmem)
>> > -{
>> > -	return (netmem_get_pp_magic(netmem) & ~0x3UL) =3D=3D PP_SIGNATURE;
>> > -}
>> > -
>>=20
>> This has already been moved to mm.h (and the check changed) by commit:
>>=20
>> cd3c93167da0 ("page_pool: Move pp_magic check into helper functions")
>>=20
>> You should definitely rebase this series on top of that (and the
>> subsequent ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap
>> them when destroying the pool")), as these change the semantics of how
>> page_pool interacts with struct page.
>>=20
>> Both of these are in net-next, which Mina already asked you to rebase
>
> Is this net-next you are mentioning?  I will rebase on this if so.
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

Yup :)

-Toke

