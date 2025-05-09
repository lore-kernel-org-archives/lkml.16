Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17C153BD9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797963; cv=none; b=of91EMUxUFeZDBmPz8X3BuHckPVz6NpdMvPkI6UohcTVRL/TglbBi4wezqVtEyom58Xnwt/XGaLIx3+pXc/jbKO0Nf0EJUUW6fbkWhnP5/J1+QBgrC0gNylgG9n6BYktlwXEr9XnmoShwuJbsbjulA3kDV+ycSSxfAyLvHLNzpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797963; c=relaxed/simple;
	bh=+SAecJshSRPaIcVA50Z2ct3hxvegOjl9jzM4zGt/nm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHMA3WJopSvy9tgJNTBCgKlqvwCIxeLPv7TxcWPlPQezn0QMuCn8nwc9NaxOcHwov5uhasrZSzeGlfcQrQjlBQWu/iFlIzJicbFfnzfrtfjfcfBwjcjS9NFsKwQK0WEM6S+mhelBVhU/dDRp6LewWPoZJuHeaB7YZajoOPea/l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZsepdH1l; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZsepdH1l"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e1eafa891so199045ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746797960; x=1747402760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fxOminYtpWUZQiMgSZHXWpN5MCC4KN4wDDm2MDcmMo=;
        b=ZsepdH1lw0wBjyHOSx274dzRNiFogOj7NxxHd0ef25U1sqyTLf8ekxpudtINOBXihz
         dBg+OgZNb2/CweObE4Xvl0cxFcMiPanuq7SGgSUgpoIF6Eb+owHQdgvGrTVN/6pTcSXE
         NC6Igw0K3vYFAzG36b199BxGNLzntF4gAkb5PX9NRk87u/axbu2gs7nVqmhoKRy4G2j9
         3kcDIEJi+rA5XjRUgJitkxUxs0b3/ANagle9YRV74tlinaLGHBKv62Ys+pjdTIJ30SCT
         hqdpLySXkzmp6RN1UdEY5oyb46ud7yS4JgJj3eg3OTvrRU1fN3UEE5772UHWkCYJ5Pha
         3KUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797960; x=1747402760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fxOminYtpWUZQiMgSZHXWpN5MCC4KN4wDDm2MDcmMo=;
        b=TcFXc800McELZfO1vEQNJBuERQGhp+BGGU2r+5ibb6zPVDrKZOx4rAg/V57aUeJMT/
         45DEP1ypsMzLkkaRJOceHoOZBTwKVzdubRapJn+QWzeVq9rh6VKqPfsKXPjWWVBKFma3
         LouGpJZ2am0FFHGCpZs1VHnWH4F43dl3ioVBrPFFfl3t83Tzs1SiMWJXRWrufTnCjBzh
         xxnLxiWM07v26W+OQxD6zGJGCC17MmgJiyLG6jPQhyoL16DpQxQgmBFlLDFb3pGYCwgo
         3ZXRhsKvyf98D5KEcc4ymhKwdDK0WrxjxuVwFCZPbqdVpE501ZNfEkV3sA0+PYMsumwA
         Cb+w==
X-Forwarded-Encrypted: i=1; AJvYcCVJjj7bDoBBEHZckYH2+77RN0xyJW1F1i6LA2dkbbxknseYSTisRkRH5hrpf2/l1Ztu2b6bzS3Eosta9tU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPomyJQf7raU5pASAZZ8Tyfli901wQNwwpXf7LmXBJECV9Q4pe
	Do7Yhf2aPtij6hMljZ5MUGJYhPyeZ18eBh3e0jKT4quvfwNzbJ1cD06s1i8zkd+VBPG8G80yGp3
	nXyLbiVl39C8yvv4wr/LjqQ1d8TA0OpUSGMFhce9u6CLXiGHp/SjWf1M=
X-Gm-Gg: ASbGncsugJlBb7mR+LJTPZ/9vldytFL3apjrMxYJupi1a7dbKsCzRNrL/AqVbODaYGk
	dPnxqbcrA3O2FZu9qN4aqdkk269ZBGlTH6G2FB7bqmpU6uPozRF7lbbRVFXMvb7ZrhkwnglISDH
	xzfMB9Ed8M1BIaFuGekLEEyOQ=
X-Google-Smtp-Source: AGHT+IEwSfRNnaH95+h5gTCk6s7PbcKJRcNX84WicSnspnOWS7dZFt3dRyIY7kPhGsxUj79tWFtNab4qqD/H8cMPSEI=
X-Received: by 2002:a17:903:2348:b0:223:37ec:63be with SMTP id
 d9443c01a7336-22fc950c1a6mr2674515ad.4.1746797960304; Fri, 09 May 2025
 06:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509115126.63190-1-byungchul@sk.com> <20250509115126.63190-3-byungchul@sk.com>
In-Reply-To: <20250509115126.63190-3-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 May 2025 06:39:07 -0700
X-Gm-Features: ATxdqUF4K-4yNvtDjbyMxyaeg9As7utYfgs1YC3WPlMHOm8ZwsgITBMzbMftwFI
Message-ID: <CAHS8izOVynwxo4ZVG8pxqocThRYYL4EqRHpEtPPFQpLViTUKLA@mail.gmail.com>
Subject: Re: [RFC 02/19] netmem: introduce netmem alloc/put API to wrap page
 alloc/put API
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, ast@kernel.org, daniel@iogearbox.net, 
	davem@davemloft.net, john.fastabend@gmail.com, andrew+netdev@lunn.ch, 
	edumazet@google.com, pabeni@redhat.com, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 4:51=E2=80=AFAM Byungchul Park <byungchul@sk.com> wr=
ote:
>
> To eliminate the use of struct page in page pool, the page pool code
> should use netmem descriptor and API instead.
>
> As part of the work, introduce netmem alloc/put API allowing the code to
> use them rather than struct page things.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  include/net/netmem.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 45c209d6cc689..c87a604e980b9 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -138,6 +138,24 @@ static inline netmem_ref page_to_netmem(struct page =
*page)
>         return (__force netmem_ref)page;
>  }
>
> +static inline netmem_ref alloc_netmems_node(int nid, gfp_t gfp_mask,
> +               unsigned int order)
> +{
> +       return page_to_netmem(alloc_pages_node(nid, gfp_mask, order));
> +}
> +
> +static inline unsigned long alloc_netmems_bulk_node(gfp_t gfp, int nid,
> +               unsigned long nr_netmems, netmem_ref *netmem_array)
> +{
> +       return alloc_pages_bulk_node(gfp, nid, nr_netmems,
> +                       (struct page **)netmem_array);
> +}
> +
> +static inline void put_netmem(netmem_ref netmem)
> +{
> +       put_page(netmem_to_page(netmem));
> +}

We can't really do this. netmem_ref is an abstraction that can be a
struct page or struct net_iov underneath. We can't be sure when
put_netmem is called that it is safe to convert to a page via
netmem_to_page(). This will crash if put_netmem is called on a
netmem_ref that is a net_iov underneath.

Please read the patch series that introduced netmem_ref to familiarize
yourself with the background here:

https://lkml.iu.edu/hypermail/linux/kernel/2401.2/09140.html

--=20
Thanks,
Mina
