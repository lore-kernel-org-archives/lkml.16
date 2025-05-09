Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F381E32D3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746817492; cv=none; b=VSHbEdHB4kxcEePHZ+pyTO+xhetsC6wk5zJ9Q9mg5GCn45vTea50fPBV1gSf9bSM3rMZQghmbaHqJjV0kVkXLf8zKYeceLX5UKsOUiwGkP/ikZQ4/lowryAePuDAUb0K6j91+R1CeVJg0LXxnzDyeMfT2yMamJYxT+/6ddrX+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746817492; c=relaxed/simple;
	bh=nWgYlaUAh79Sqc6Qw9DptNYavPJ+5lJWisuL5f5mFiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYAVrtVuRTII9C/THslvQDV4QCsB4dKULiVPE/aozwYzHh60n8b3SzYl2Vz2SUHu2KcHBDom9Bk45KPje9E8e+Z7n+3GVEb8FlzMSEeAw+NxpKj0gVJGtNatbGnxAFFRbq+FSgZwdKLavILcRW+ORUn41h+USPP0p9JIjDilJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CW85VbNG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CW85VbNG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e39fbad5fso26815ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746817490; x=1747422290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMyvT74zAz1sECoPmlo7iJrwBqFtzYeDIpnJbJ7I24Q=;
        b=CW85VbNGGfVP7NVg5GJEbl5AgydcRQEc4efXG/4YV2I8nwHfitSLTtvM77cpe/ElHJ
         /laxugkQybVhGUpfBLnYP+KGPf+YIuhUo+gH/5DyQ9XsTeA+4yNTPjKQxMYcHdSAxEGZ
         Isz2myLkSejbwCZ9NRwsYwN3qiuH/8v2conX6YP5hypVqpQwGx0sMIw5UmnZrfH2aZBJ
         E6ZJLuQsnpaKigTB8gk6rQOLgLevl6wEB0G38eZb9qTuP+rapcs3H5yB1y/WFRCeJABC
         E225UE1sMmz0wJ8C/r2mIujvd35inPHGjsX8UEQt3AziYul7nvJWa5Oh1iETnmHc+2RJ
         J5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746817490; x=1747422290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMyvT74zAz1sECoPmlo7iJrwBqFtzYeDIpnJbJ7I24Q=;
        b=szvLLfc/JtwgMTiOHBUws1D8EMRmZcIlbcs5/gQTwCBIig+IYYo2FyYkTikNCy12b0
         8AW55+19FYnTBn+924+/UgTN54AtKEYr8/8bqD0gWOJOrjBfiV2nIeG6JDAuPv41gZna
         RllU87RvZDGrIUhsqElIGoBvuxsDE9h4nVbj49mAPSTXXm9DhAajLCBko5l5SiUtQyPJ
         SCIE+btORdqtnDbMVB5hU2T7pj5w9zsa5O8ACSel9CF6kzSkg0UwZuYDOdMtH5K20LRc
         olTqUkIny/eSo/fzUXKq9SQJouticgT6TatIL4StimiEruNVa+Sm0vny54my00ACH9Uo
         VIyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGwQQVNmJi6LBLUJzDLhBjV+OfpkaV/8P7xbTKIlugGm7LJTlKw8E1j+xJMTYqjbeY82zgO7HkzvQGeTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1UOHjy/3IUDh57lHk+rAQ2IAJ2+0dF2Grp+Dy5wUCJ18Mh8I
	Fi8W4eL2NKrKt6yNKi6NtLxU5Z6U90m3DCUNxShNIIs8cCfJZRHCy29wxq15JF6TLqDwOkRRFZw
	COvbEeRKM6YmLwcTZet7FdfZWG6xBFH91F/Uj
X-Gm-Gg: ASbGncuz0KicQ1n6Xqu41NhLyOrIo1nlz8PGs3c4ZVpRbE7QR2Bf3G7kH5youioOLzJ
	GNnCJvV/UVmnpUkx2hDsB2hAWyElLSSruWW0th5UHuFXZPEgH7U/m4NoDh1lNNuv43TinLdSoNO
	4eAh6wuqSITo09OVrQh5es88qNwJiHBFcMZN1Q/SXZ0NLHIjLH2CP9xFNoxq2zoOc=
X-Google-Smtp-Source: AGHT+IFAWCrGKlTZz5hXgnqwxzKdNkmnoQMfkFpLk5GzxbOjWpW1DkenulWfbIO+bZgus1bgyylec4pcOX5PaD76Uys=
X-Received: by 2002:a17:902:ccc5:b0:22e:570f:e25 with SMTP id
 d9443c01a7336-22ff0b0c3bcmr301505ad.13.1746817489453; Fri, 09 May 2025
 12:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509115126.63190-1-byungchul@sk.com> <20250509115126.63190-20-byungchul@sk.com>
 <CAHS8izMoS4wwmc363TFJU_XCtOX9vOv5ZQwD_k2oHx40D8hAPA@mail.gmail.com> <aB5FUKRV86Tg92b6@casper.infradead.org>
In-Reply-To: <aB5FUKRV86Tg92b6@casper.infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 May 2025 12:04:37 -0700
X-Gm-Features: ATxdqUE-1vmZbrvJsQJ5y4vi7u2ndkuLS99kLDwhEEwxYMSvqJXXgCyAw9BFg-s
Message-ID: <CAHS8izMJx=+229iLt7GphUwioeAK5=CL0Fxi7TVywS2D+c-PKw@mail.gmail.com>
Subject: Re: [RFC 19/19] mm, netmem: remove the page pool members in struct page
To: Matthew Wilcox <willy@infradead.org>
Cc: Byungchul Park <byungchul@sk.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, ast@kernel.org, daniel@iogearbox.net, 
	davem@davemloft.net, john.fastabend@gmail.com, andrew+netdev@lunn.ch, 
	edumazet@google.com, pabeni@redhat.com, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:11=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, May 09, 2025 at 10:32:08AM -0700, Mina Almasry wrote:
> > Currently the only restriction on net_iov is that some of its fields
> > need to be cache aligned with some of the fields of struct page, but
>
> Cache aligned?  Do you mean alias (ie be at the same offset)?
>
> > What I would suggest here is, roughly:
> >
> > 1. Add a new struct:
> >
> >                struct netmem_desc {
> >                        unsigned long pp_magic;
> >                        struct page_pool *pp;
> >                        unsigned long _pp_mapping_pad;
> >                        unsigned long dma_addr;
> >                        atomic_long_t pp_ref_count;
> >                };
> >
> > 2. Then update struct page to include this entry instead of the definit=
ions:
> >
> > struct page {
> > ...
> >                struct netmem_desc place_holder_1; /* for page pool */
> > ...
> > }
>
> No, the point is to move these fields out of struct page entirely.
>
> At some point (probably this year), we'll actually kmalloc the netmem_des=
c
> (and shrink struct page), but for now, it'll overlap the other fields
> in struct page.
>

Right, all I'm saying is that if it's at all possible to keep net_iov
something that can be extended with fields unrelated to struct page,
lets do that. net_iov already has fields that should not belong in
struct page like net_iov_owner and I think more will be added.

I'm thinking netmem_desc can be the fields that are shared between
struct net_iov and struct page (but both can have more specific to the
different memory types). As you say, for now netmem_desc can currently
overlap fields in struct page and struct net_iov, and a follow up
change can replace it with something that gets kmalloced and (I
guess?) there is a pointer in struct page or struct net_iov that
refers to the netmem_desc that contains the shared fields.


--=20
Thanks,
Mina
