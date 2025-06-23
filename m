Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B1B4A2D;
	Mon, 23 Jun 2025 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698678; cv=none; b=RKXB1+TvB6QcnWe+QlcSWlR7CSHJpNlTOPwitVQ7rHyNA7/dx4ljaT71xkqKqSJWtIQwy697+RRgey3GLKt0AboUkUfhCpvAxFbMUIhnYpcXrZQdZs7hQZW6ppSc2BIl8Ru0mNSjjiwoBN136In0Epj1azSHaVyqheaOLmxhswc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698678; c=relaxed/simple;
	bh=cvbQWHe6A7sEweHLhhymq/nWw/NsmUARNPNdAg3ypCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5wi6NVxhHBh46L1ntRhpmeD1+FHRDapZPkWsktwiSYtlX4v3CKZRzcSZjS2M0ZL4nAyT7+u7Tzo+o3eOKMzjgA1EVbXuH+VTAAv/iexqcuCmh1UAnRQIW5sOFhxY/AMgTXwefiBc51rKHceYoZoujKCc2ujulRqBTWLG0ufxZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxtR1m+c; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxtR1m+c"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a43972dcd7so55378771cf.3;
        Mon, 23 Jun 2025 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750698675; x=1751303475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjiN2duDIoatADckXDg71LfnYdFHxDnQWcx0OYPZFTs=;
        b=FxtR1m+cHnAMk+QiOLoHRhJEHuIaC/oeyyCZEx/WebdvXh6xaBa96pOYvcJ53bld4s
         qB8ot2DB2IyZfYKZ1qFSOplp9iM6nC186oTLhmjOePPYIFF9Vri3hBMrRkyfwo9oDbzE
         yavMv25A7GtUQqWVVAWZ5g5nfWfqnyN65sv7FCnuqlTMwn9K0B19Oa7TGbGwvg/VcrzT
         L6jqpsb6NTZMwrl+DzPtgdoNjrwzogtKcKoOx5mQw3+B1c+rLQ+RbSHOXa98wCUaW8IJ
         GrvXXaamgszlzF11gcFadl2eZsacRLSjxLKUF0IjiFXgAsxeG4WokTKFbQvl69jdvl1e
         KwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698675; x=1751303475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjiN2duDIoatADckXDg71LfnYdFHxDnQWcx0OYPZFTs=;
        b=vh+fZxUwPaOeB8sK+seVAym+lDiqRQ9Ir4oY7lXhUbcZORda02630uaha0TrcDAQzK
         TQOISYoHkXJmqNNjmP2FueCcX8uZF/BoaCtlERcqOaeE5t8CEIfyMiZpyluzhLdXEA6Q
         LKLPYvOLmuaWCYami+hgYSsuXpqBQVgmujW39LX0l2tyO9mSBD/DR+udnSEuMiQexerj
         6rJICByx9kPB+NivrCNDbViGBzfSP10S9a7wakx4pHFO/8DEpkddx5fUohd6cbpVFFSi
         VG3YcbOJIKbkP7IEG6eAHOVUTJPWZNVGcd7+Jrx8rWQ8a9FaiV7psbK6ci24IGbFoLxF
         KyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4sFdqNBW/ycxD3wCA3qWe3Nlww9D6L6/hbNYlvTMVjIx+RVzuK/o9pNsoZM/OWG4XAeiFVi4ggBH1vYs=@vger.kernel.org, AJvYcCXGBIL6eY80WDa0edmA6uYvGsV/J7BNTC5jOf6QIqTUOANis2IGMwNh/38W2PsDhM3MJjhzvSFudgx1KoAwuEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr66cnBog9JP1pHfhdXZ+4jMQuDEwG0mixhj6m6CAR+/WMv6Df
	ltePbLGU/0ouZCDFAMBAKqb0hJKYp/ZWyUnGtsXvVhYPUMqU3xiTgupS
X-Gm-Gg: ASbGncvZxUD9WWrnkiITVCiJfx6LM3EgtSiHSvUnG1oABffLTBAVMCg3XsM2N2v8RVO
	ngOS/PqUvavxzTf/oZwUmjJcPDPrhJxo58+V7Q3NlcBCJJfqPLFamZ5qz/G7RFGl6Y9UpLaZXZ2
	Yo1OQlMkZWClHPcOBeWu8J+UPh2E6bvRiraQw6wPPI5+K/Zk6GQXV6hVv1nxSjm+sNYeGKejBqn
	N9h1ZJA+kPn9R91GzlW3Y3H+HziZiCIxj9eqqkT6uaC3fqIwLYRtMAR4qecRBiyJepQJwTYJpfD
	lRAD/m9JDwjgapWSaHBRRGzUTs+1vZ4iNt/rg4APTqZVDxydiZ0GLi8GAbmVVtCr2pTtejsvpxn
	LNx6e3kKzHfgihQzPzl+MOltLA6u/LSqqxb4onunySLxDvTKymWcq
X-Google-Smtp-Source: AGHT+IF58ry0uAJhfksmJjPTy1j/2Vf/3WRbEa7P02vjo4MlhXaKwJYDBJeuv+kZYxPXTxkw/qD76g==
X-Received: by 2002:a05:622a:400d:b0:4a5:aa42:49f3 with SMTP id d75a77b69052e-4a77a1c9d57mr264210731cf.20.1750698675299;
        Mon, 23 Jun 2025 10:11:15 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e79f0dsm40380181cf.61.2025.06.23.10.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:11:14 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1A7F2120006A;
	Mon, 23 Jun 2025 13:11:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 23 Jun 2025 13:11:14 -0400
X-ME-Sender: <xms:sYpZaF2am0H8M9JhfLMA36ZLn_RyRM-OEviVN7CtPEzRX8S62gylqg>
    <xme:sYpZaMFjovciA7_an6AZCk8YJZk8_OglSiaFk4gb7wFk9XYjMilQshpe8fkj98Yw0
    fiRIor0dzbtaV9aPQ>
X-ME-Received: <xmr:sYpZaF43EKFZMJVoKUVHlCInLB1C0dhg15DE9PUZF8QpS1ebtYTQ0q2ZQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifohhrkhesoh
    hnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugi
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlse
    hgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:sopZaC1zMfm1SuNsNSQ18amI0vXKCmGyVaGLPLOr6ZgLffljzjIXpA>
    <xmx:sopZaIE8SPfQ9fA-ND901zBbEx2YXlbLDuWZolLLiAIwiqc0cwpnfw>
    <xmx:sopZaD9F8FUxbrrz0UH1wIMJEIHKt4aLNy3VKeZLa3KvY_GQkuQXsQ>
    <xmx:sopZaFmnNWC8touEIPVFFboI6xhkDlckHF4Q7I7Nclat3lJGCx4GGg>
    <xmx:sopZaMED76cxqgp1cqMCijH7GFVbmWKEnc1_JGZDLDziiIx2OR_QlmT8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 13:11:13 -0400 (EDT)
Date: Mon, 23 Jun 2025 10:11:12 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
	will@kernel.org, longman@redhat.com, felipe_life@live.com,
	daniel@sedlak.dev, bjorn3_gh@protonmail.com, simona@ffwll.ch,
	airlied@gmail.com, dri-devel@lists.freedesktop.org,
	lyude@redhat.com
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <aFmKsE_nJkaVMv0T@tardis.local>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org>
 <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org>
 <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>

On Mon, Jun 23, 2025 at 05:14:37PM +0200, Benno Lossin wrote:
> On Mon Jun 23, 2025 at 4:47 PM CEST, Boqun Feng wrote:
> > On Mon, Jun 23, 2025 at 03:44:58PM +0200, Benno Lossin wrote:
> >> I didn't have a concrete API in mind, but after having read the
> >> abstractions more, would this make sense?
> >> 
> >>     let ctx: &WwAcquireCtx = ...;
> >>     let m1: &WwMutex<T> = ...;
> >>     let m2: &WwMutex<Foo> = ...;
> >> 
> >>     let (t, foo, foo2) = ctx
> >>         .begin()
> >>         .lock(m1)
> >>         .lock(m2)
> >>         .lock_with(|(t, foo)| &*foo.other)
> >>         .finish();
> >> 
> >
> > Cute!
> >
> > However, each `.lock()` will need to be polymorphic over a tuple of
> > locks that are already held, right? Otherwise I don't see how
> > `.lock_with()` knows it's already held two locks. That sounds like a
> > challenge for implementation.
> 
> I think it's doable if we have 
> 
>     impl WwActiveCtx {

I think you mean *WwAcquireCtx*

>         fn begin(&self) -> WwActiveCtx<'_, ()>;
>     }
> 
>     struct WwActiveCtx<'a, Locks> {
>         locks: Locks,

This probably need to to be Result<Locks>, because we may detect
-DEADLOCK in the middle.

    let (a, c, d) = ctx.begin()
        .lock(a)
        .lock(b) // <- `b` may be locked by someone else. So we should
                 // drop `a` and switch `locks` to an `Err(_)`.
        .lock(c) // <- this should be a no-op if `locks` is an `Err(_)`.
        .finish();

>         _ctx: PhantomData<&'a WwAcquireCtx>,

We can still take a reference to WwAcquireCtx here I think.

>     }
> 
>     impl<'a, Locks> WwActiveCtx<'a, Locks>
>     where
>         Locks: Tuple
>     {
>         fn lock<'b, T>(
>             self,
>             lock: &'b WwMutex<T>,
>         ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
> 
>         fn lock_with<'b, T>(
>             self,
>             get_lock: impl FnOnce(&Locks) -> &'b WwMutex<T>,
>         ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
>         // I'm not 100% sure that the lifetimes will work out...

I think we can make the following work?

    impl<'a, Locks> WwActiveCtx<'a, Locks>
    where
        Locks: Tuple
    {
        fn lock_with<T>(
	    self,
	    get_lock: impl FnOnce(&Locks) -> &WmMutex<T>,
	) -> WwActiveCtx<'a, Locks::Append<WmMutexGuard<'a, T>>
    }

because with a `WwActiveCtx<'a, Locks>`, we can get a `&'a Locks`, which
will give us a `&'a WmMutex<T>`, and should be able to give us a
`WmMutexGuard<'a, T>`.

> 
>         fn finish(self) -> Locks;
>     }
> 
>     trait Tuple {
>         type Append<T>;
> 
>         fn append<T>(self, value: T) -> Self::Append<T>;
>     }
> 

`Tuple` is good enough for its own, if you could remember, we have some
ideas about using things like this to consolidate multiple `RcuOld` so
that we can do one `synchronize_rcu()` for `RcuOld`s.

>     impl Tuple for () {
>         type Append<T> = (T,);
> 
>         fn append<T>(self, value: T) -> Self::Append<T> {
>             (value,)
>         }
>     }
>     
>     impl<T1> Tuple for (T1,) {
>         type Append<T> = (T1, T);
> 
>         fn append<T>(self, value: T) -> Self::Append<T> {
>             (self.0, value,)
>         }
>     }
> 
>     impl<T1, T2> Tuple for (T1, T2) {
>         type Append<T> = (T1, T2, T);
> 
>         fn append<T>(self, value: T) -> Self::Append<T> {
>             (self.0, self.1, value,)
>         }
>     }
> 
>     /* these can easily be generated by a macro */
> 
> > We also need to take into consideration that the user want to drop any
> > lock in the sequence? E.g. the user acquires a, b and c, and then drop
> > b, and then acquires d. Which I think is possible for ww_mutex.
> 
> Hmm what about adding this to the above idea?:
> 
>     impl<'a, Locks> WwActiveCtx<'a, Locks>
>     where
>         Locks: Tuple
>     {
>         fn custom<L2>(self, action: impl FnOnce(Locks) -> L2) -> WwActiveCtx<'a, L2>;
>     }
> 
> Then you can do:
> 
>     let (a, c, d) = ctx.begin()
>         .lock(a)
>         .lock(b)
>         .lock(c)
>         .custom(|(a, _, c)| (a, c))
>         .lock(d)
>         .finish();
> 

Seems reasonable. But we still need to present this to the end user to
see how much they like it. For ww_mutex I think the major user is DRM,
so add them into Cc list.

Regards,
Boqun

> >>     let _: &mut T = t;
> >>     let _: &mut Foo = foo;
> >>     let _: &mut Foo = foo2;
> 
> Ah these will actually be `WwMutexGuard<'_, ...>`, but that should be
> expected.
> 
> ---
> Cheers,
> Benno
