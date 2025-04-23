Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF8C25C83E;
	Wed, 23 Apr 2025 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425856; cv=none; b=YQwbneDXGCF9nkIUsN8qwlF5KwlswUH2ASD3vVM85dk3VKGtv/E8gSL+bBL6ES304HfrJJAjMva2xFjWq7NhSf+iDOszsmHDUhQieeA3BgUm+JKRSjk8AZHz4cpiKedxkYbZXMRCredpoG2/RCznpiZ1vFSQIEiUXsS9fDe4F1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425856; c=relaxed/simple;
	bh=TzQ8JG/DmUe/HytIY1nxh1YonhKpMLa3Oy/x8srilWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXIomhb6lTmhcphH3qkUOlBV5vRMz5wrHMghlOpUPJ02c8EPMh2JP9WxyMazrysbJV1pwjllqipT6enJprIpn+Se4xUokAd40noM0AfFrShLQB/lTq52sXFE0Ql9ycYFnuIm2A/FS+At9MlX9Jzm8JJtG00uU5tCpPo+OJElsTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx1b0uSv; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx1b0uSv"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5e2fe5f17so562385a.3;
        Wed, 23 Apr 2025 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745425854; x=1746030654; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hzw80qjHqcOJs50tI4Q2NeBjE3TLETGM4pfUfdiVjls=;
        b=Lx1b0uSvlBuGsSYGLL8lF6DaaB3YsdmnA1pxONIo8BjZ9ewDrgeSzx2ZRH0xX35lAz
         xLWMVlr4XdnWBNxTSpSNFuIBvxoBQJgxPHF2PdYip+9B4cvvGBvy4Kx2LjqsUBXjXoWJ
         SrVHIijPs0AkWCDCH3+CwV5cKnQygvg4W3NnSZyTC9RDArnOf36zzifyFZPvQtnCXE5Y
         +ehHBNuZ8TCiC2bYKIq4LFDkvrOZ2KJDJbEoeiANItxV6rGXsbJwz17Ag2b9onzkdoUW
         P8myWZj8MCTwpdhMOFsZabFkH0KLqrPQYx/w2akwYk7Pkqarja7eJox2hW1sudtJkljn
         jpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425854; x=1746030654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzw80qjHqcOJs50tI4Q2NeBjE3TLETGM4pfUfdiVjls=;
        b=DtoxzLJ3fgWsUkj5p8vQbwdvtbFFh5FMA1018ENH0kWXUyuzYYffrNq6CoGSKIgQ5D
         jzXPsdmILUNVrn53hd34+tgwJ8RgMlooLp0sLZ1uWt986ZwIxusXpJMGAf3r0JeG9ADd
         a6idbw17SfhovsCKGyA8nqTzlu+QeTHEt6e5NUWHRgZcbdFQ9y9qjNVfV+100622VuvP
         7NPJd9MelWB9Z9Wfbp/6pRpziDNIXAJWlds8j0kJe1/dqnnI/DYKWsCZlVuezkOyk7MZ
         7FJSmDz1rZKtj597dnStUU3Neo1xm34rNy9KaZue+VNOCzIOyp0TW4ld8ICC5VvD6lNx
         9p0w==
X-Forwarded-Encrypted: i=1; AJvYcCXpapysqt1rWsuXU2Oww9eqZKdDKgThhAox9izAa3UgtlCTebplTLJXuAzK/Wdh1NZSJL7zf0ToUOEhU0aRIS4=@vger.kernel.org, AJvYcCXqRGP7mMCBkmwYz2REnFBdbXU5elYGmCqQc6TMvgnSl0ayTh0sSNDdwYJfzWLCs/GdauRk+LI2/tS/usU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM33tVVv7gBZMKrglivdp2j6434PHwpUB0o+znyHUTcItEd9rg
	c0RqpWrym8hJi8Q6zsyVCvFFEMJqfzWGFsQ/ucYJPYFJNed7yDTTGXaUjQ==
X-Gm-Gg: ASbGnct9bRkIK8I3YgZesPFxMcJeNF1hgxn4/MJzGO+l6w3dZWkpXWohe4xLYr1ifti
	Cen0bmEly9zsxkQp10PZaE0IrTkGUmfg4VKr42HJ0t5DKOQOCw1Bic2Kojrm2++q+aNMF65vIF6
	g2ZOSI0/R/TLEQWcbEc299CNakE0iGvseo5xYhKXghHPqR/H8FHWib4f3VcRFuFT06eQ55LcE0k
	hp+zftJMHc66K7hcuH4BcA0jzboTn3D+9wi4FNLK8i1R3Yh34Ra4JP9JFrkaU1cHQduJ0q/nijL
	kLwwFcibFuqDCuBffVgSctrqkL5wAYmTB23pVunwXa+YqFrycTlk/p9kezSrISCmkXGpTaRvrlS
	ZfsYWSFcWfkBkw5CyO+/ZLJZXyarBLew=
X-Google-Smtp-Source: AGHT+IH0ShLCGkZx7m5FUlmb3ciQKJMkTrikHGyGC22zsof3og3yxTSqnVv/2KKbWhtrzw4vtJj1QQ==
X-Received: by 2002:ac8:5806:0:b0:476:77a5:3104 with SMTP id d75a77b69052e-47aec35b7d8mr402351231cf.11.1745425854023;
        Wed, 23 Apr 2025 09:30:54 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c179f1sm70186581cf.16.2025.04.23.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:30:53 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2CC99120006C;
	Wed, 23 Apr 2025 12:30:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 23 Apr 2025 12:30:53 -0400
X-ME-Sender: <xms:vRUJaBeSNFQiGSH42oUK0NhaW15rgf3jur4QEISM1_fP8B4aHCwUfw>
    <xme:vRUJaPP5zPxcLrQPfLVC8I6DqEVA38EcBfHrgNAMABEiVZ8JMssBNu37YOBoyGQgy
    8YYk5fpSmu0XIi_4Q>
X-ME-Received: <xmr:vRUJaKgWO-ml12I2s1OL5yzosW3GXa_Dofwr6_uZNDmjAfILtAiZkV1_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeel
    tdfhgfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohephihurhihrdhnohhrohhvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepsghqvgesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugiesrh
    grshhmuhhsvhhilhhlvghmohgvshdrughkpdhrtghpthhtohepvhhirhgvshhhrdhkuhhm
    rghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:vRUJaK8BRzyjZ5o_SxOKCz66kroHYbgnUiiYd5ulp-oz2biLibXu2A>
    <xmx:vRUJaNu1VgE9W2W0uuQTYyP4Rc30N13c-dXJCi0V33LCrhI24ZAI9g>
    <xmx:vRUJaJHMGIp3hCub6ExcX50Buf46O4d0SIZZLGeA5_lEdZ7GK_6gqQ>
    <xmx:vRUJaEPxotrUtcwpOsxDz36V-gpuCZvYhHGgI_GefYyO9ORi85kmOQ>
    <xmx:vRUJaGO4lwg1IuETmJgdfUvg1sP8k1Fk6MrjPyr1sfG5TkOASbF-XgOC>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:30:52 -0400 (EDT)
Date: Wed, 23 Apr 2025 09:30:51 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] rust: adds Bitmap API, ID pool and bindings
Message-ID: <aAkVu8Uf3J8F25fY@Mac.home>
References: <20250423134344.3888205-2-bqe@google.com>
 <aAkKoQQH0t9KtIxD@yury>
 <CAH5fLggFUM=eJR2u06QsLMxXP+cJwm881ip+rze_sM=tXpA9og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggFUM=eJR2u06QsLMxXP+cJwm881ip+rze_sM=tXpA9og@mail.gmail.com>

On Wed, Apr 23, 2025 at 06:19:18PM +0200, Alice Ryhl wrote:
> On Wed, Apr 23, 2025 at 5:43 PM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > I received it twice - with timestamps 1:36 and 1:43. Assuming they are
> > identical, and ignoring the former.
> >
> > On Wed, Apr 23, 2025 at 01:43:32PM +0000, Burak Emir wrote:
> > > This series adds a Rust bitmap API for porting the approach from
> > > commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> > > to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> > >
> > > The Rust bitmap API provides a safe abstraction to underlying bitmap
> > > and bitops operations. For now, only includes method necessary for
> > > dbitmap.h, more can be added later. We perform bounds checks for
> > > hardening, violations are programmer errors that result in panics.
> > >
> > > We include set_bit_atomic and clear_bit_atomic operations. One has
> > > to avoid races with non-atomic operations, which is ensure by the
> > > Rust type system: either callers have shared references &bitmap in
> > > which case the mutations are atomic operations. Or there is a
> > > exclusive reference &mut bitmap, in which case there is no concurrent
> > > access.
> >
> > It's not about shared references only. One can take a mutable
> > reference, and still may have a race:
> >
> > CPU1                            CPU2
> >
> > take mut ref
> > bitmap.set() // non-atomic
> > put mut ref
> >                                 take mut ref
> >                                 bitmap.test() // read as 0
> > data propagated to memory
> >                                 bitmap.test() // read as 1
> >
> > To make this scenario impossible, either put or take mut ref
> > should imply global cache flush, because bitmap array is not
> > an internal data for the Bitmap class (only the pointer is).
> >
> > I already asked you to point me to the specification that states that
> > taking mutable reference implies flushing all the caches to the point
> > of coherency, but you didn't share it. And I doubt that compiler does
> > it, for the performance considerations.
> 
> The flushing of caches and so on *is* implied. It doesn't happen every
> time you take a mutable reference, but for you to be able to take a
> mut ref on CPU2 after releasing it on CPU1, there must be a flush
> somewhere in between.
> 

Yeah, and it's not just "flushing of caches", it's making CPU1's memory
operations on the object pointed by "mut ref" observable to CPU2. If
CPU1 and CPU2 sync with the a lock, then lock guarantees that, and if
CPU1 and CPU2 sync with a store-release+load-acquire, the
RELEASE-ACQUIRE ordering guarantees that as well.

Regards,
Boqun

> I can try to find docs for it ...
> 
> Alice
