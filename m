Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13D3D3B3;
	Fri, 25 Apr 2025 13:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588741; cv=none; b=PD1VEVBAAppOpFa+zHA6PaSZbqfC2DAr4JdIV2pygl6wbMKb1QYHQ1wsCj90vLijVUSH3fVk0xnYjV2BqAls9A42adEqRGfDffE1AxO/7LapiV2ymx5qCmRlADd1UL/YKVDp0HAyNk7XHWDURNBShGAqBM+AnSzJmfKy6BdXjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588741; c=relaxed/simple;
	bh=Xc9fSgC/x63luwJw9PkD7G8J0O769hdT2MY51GbN7+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHtFlARcQifqqLjZ6ouBQZC+xlWey83y0ckMSil+xi0x8D3JNo2bJUY9UTprSCOjPcrRxcq1Gvrec0VQa09EJzGOyfzt/QDwdyIvd5aG6Hjtl4yMWvcOkDIFSMXZRhIO4useodDATpj8rMIKXdBmbZRCxn78Ylg2cN38WiEctFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkKLkh5D; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkKLkh5D"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so29186816d6.1;
        Fri, 25 Apr 2025 06:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588738; x=1746193538; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l5G44hVuiM6JlHEQ/mK9/lttnkQLILl+1HFvgq32kWg=;
        b=kkKLkh5DZcRX7vT62JSV0LvrQHLHuvmaVWgvrAWFH5DqZbKlx2GYKZriFo3EFo8C/f
         3HFfg9wbp96s3+22kTULbprnlvZdy2FhPXm5V4eJx/J1yHDSMlC+r2Tp+3r1iRWN797o
         URgx5XcXbgxH5NjA0D1ewvFpYaxNdwGmQEneCswxvX0Tn5oC24K+/dNtaZSDISrpF1Lv
         rtQC4nwWGfDIhw+79smszV5mUHa/Uk+V8a88sT04Xy1MN6kYSv3JALZ+zo/GeIgzYhAa
         VXY2qtjKL3Z+MiQRHEE0cxcTPaOy0cpUwh4zFG4yu/iTLqfy7yUd2ljsnUgsqPcUfuFJ
         6UIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588738; x=1746193538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5G44hVuiM6JlHEQ/mK9/lttnkQLILl+1HFvgq32kWg=;
        b=dNpMi26Vj1lpEJlD27l0JVoANXbqrQZ6/0KDPNu2bvgO06nrt0k5VeYfYgUAvjd9m3
         yQrrwDWCB5VTBIKYzon3aqWDVToU3BhYSwZHz9nRmPu0LA2n2afgZCzSs1T3A6G5d8kA
         Jajb/1Pn2JTdQckDVm9fTHGcbnR66FnirshOIlH2+dErCQdDJYJP0T9M/M95ltsXqJiW
         hki0qZ82Mj688R9Ma8dipKjMjtTG1jwD3oHb7YbhcCVyvcd8rhVWZnehbgWErIKqPvOu
         Q1UT+nf82laUrlO+ftLp491LAkRb6xv1QhrzXZDldu/0duLqUa8q9uTXR75o7L4aT+f3
         Ctxw==
X-Forwarded-Encrypted: i=1; AJvYcCUpmJXgSgrQ9ucVXzC32qAfewkxY/FEyUX3u1q0EFUeUDaHPAT3p94xlGd8Kdv3wcLwoMyePgMzd5KLk1I=@vger.kernel.org, AJvYcCWZuctfhFK4U6v2q15ih8N9ydR9GC6Sw9z9qs1JBjoI9EbUTd6vwsm0LZy2Pu5NAGMfpgmwnTg75noiBZGnZlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDdZREUrP4/fP1Dt9a7Lkwsj5tW26tqNku2ZC5utJ+V+9ETjI
	ynMrqtFbEbHbTYesjmuvsyHflvlsPfyQzb9+CJHmDu/9LreKlsQ/
X-Gm-Gg: ASbGncvUbV5E2EjLPwULTjlnz0TexzCr/GGulXVjy1qOX/Bi83NoQHryfbGFxlsu8LF
	uc8IFWQb/FkUOTDd8Ra/Fyj8OOdFweXZOSSrru7qJJQu5oHmFwQr4lMVMrhopvAO4aeJhLmzepU
	1rLHb4nG5J/3b9K6Hxo+0Z3JFBFE+83NYyh6VVjROfoFffKALpWzbaqqmx+5lEAF8qH097yGR/b
	7xC+/rChl4iUHPPSLK006wb3uLv21nm2SNALe0TGf3ennvnphf23sO3z5lKuGFMAD0mfRwe34PB
	4mRkb9vA2L5LTVt+t3zEkTMLuMNExYzSE48mBzPcvgnWX6ucn5Hzlu0qEOr6KIFnQnWl2CcvkUh
	kcyDKqU8zWJI7G+cTP7HVJHBhqYTlZRs=
X-Google-Smtp-Source: AGHT+IHI90SpqY067YOP5MW1hIugdpRbv0RADVHf7V4ZPh9td3Ak7LLNbD1ABY0OqAXwuAk0zltSZg==
X-Received: by 2002:a05:6214:ca2:b0:6f4:c939:a3f5 with SMTP id 6a1803df08f44-6f4cc38cae8mr31950566d6.17.1745588738400;
        Fri, 25 Apr 2025 06:45:38 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c08eeeeesm22201636d6.4.2025.04.25.06.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:45:38 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7F0F91200069;
	Fri, 25 Apr 2025 09:45:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 25 Apr 2025 09:45:37 -0400
X-ME-Sender: <xms:AZILaKltm_ZARbXTkfO0TZCXqFwcWuu6andkQ8h4WJXHDQyV7hkPBg>
    <xme:AZILaB2jdZKaazdBAOhc_4jA6ZyOuKqUppjYWi_I7WcLXRnhVsLgqYwX1muIsf8ju
    uyPUIRjEM7OOp9PEA>
X-ME-Received: <xmr:AZILaIrZvoi65P-KJHQwsxAtokfrO3aZiRLm_8JRs1E9PX01VhZoeaZj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepueduvdfgheekkeeitdetgfffjeduhefh
    gefgfeehheeijeektedtgfekheektddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    dpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthi
    dqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghi
    lhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepsghqvgesghhoohhglhgvrdgtohhmpdhrtghpthht
    ohephihurhihrdhnohhrohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugi
    esrhgrshhmuhhsvhhilhhlvghmohgvshdrughkpdhrtghpthhtohepvhhirhgvshhhrdhk
    uhhmrghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnh
    efpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhho
    shhsihhnsehprhhothhonhdrmhgv
X-ME-Proxy: <xmx:AZILaOkH0CzJuf_pGL6JitIeMHjpihd5uWjg7eaHJh_29YTyMU16Ig>
    <xmx:AZILaI14vpD-v3cloqpD47YaN_RxZg2QKNo5SHH5CvUXZqMr09QeoQ>
    <xmx:AZILaFueSqrvP-iz9o7NsVn0xi3kQRYMZVQewFAliOTMGK9SxJM9VQ>
    <xmx:AZILaEXAjOQEDt68h-tiJuybN4YvPSUzqCfL3zQSRqTuJ3yIGrA7FA>
    <xmx:AZILaD2o-OKk48ZvqTIaxNW11bV1C5G90qJUqiKfm24LmTKKsFVtXJRa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Apr 2025 09:45:35 -0400 (EDT)
Date: Fri, 25 Apr 2025 06:45:35 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rong Xu <xur@google.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
Message-ID: <aAuR_0om4FI5Pb_F@Mac.home>
References: <20250423134344.3888205-2-bqe@google.com>
 <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury>
 <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com>
 <680abbce.050a0220.144721.78ac@mx.google.com>
 <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com>

On Fri, Apr 25, 2025 at 02:20:13PM +0200, Burak Emir wrote:
> On Fri, Apr 25, 2025 at 12:31 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Thu, Apr 24, 2025 at 09:48:17AM -0700, Boqun Feng wrote:
> > > On Thu, Apr 24, 2025 at 06:45:33PM +0200, Burak Emir wrote:
> > > > On Wed, Apr 23, 2025 at 6:56 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > > > So? Can you show your numbers?
> > > >
> > > > For now, I only have numbers that may not be very interesting:
> > > >
> > > > - for find_next_bit,  find_next_zero_bit and find_next_zero_bit (sparse):
> > > >   22 ns/iteration in C, 32 ns/iteration in Rust.
> > > >
> > > > - for sparse find_next_bit (sparse):
> > > >   60 ns/iteration in C, 70 ns/iteration in Rust.
> > > >
> > > > This is a VM running nested in a VM. More importantly: the C helper
> > > > method is not inlined.
> > > > So we are likely measuring the overhead (plus the extra bounds checking).
> > > >
> > > > I would like to get cross-language inlining to work with thinLTO to
> > > > have a more realistic comparison.
> > > > However, that is not something that works out of the box.
> > > > I am looking at Gary Guo's patch for this:
> > > > https://lore.kernel.org/all/20250319205141.3528424-1-gary@garyguo.net/
> > > > Currently, I get duplicate symbol errors.
> > > >
> > >
> > > You will need to add __rust_helper attribute for the new rust helpers
> > > introduce in your patches. See Gary's patch #2 for example.
> > >
> >
> > Here you go ;-)
> >
> >         https://github.com/fbq/linux/tree/rust-inline-bitmap
> >
> > I rebased on the top of rust-next and applied your patches onto it. The
> > last one is the necessary bits that enables helper inlining for the new
> > APIs in your patch. There is also a "TMP" patch in-between, otherwise
> > INLINE_HELPERS won't work, we need to dig more of it. But anyway, it
> > works on my machine (TM):
> >
> > (on x86, in your test function)
> >
> > 000000000028b090 <_RNvNtNtCs3KHxpmQFgFb_6kernel6bitmap5tests40kunit_rust_wrapper_bitmap_set_clear_find>:
> >   ...
> >   28b0dd: 48 0f ba 2b 11                btsq    $0x11, (%rbx)
> >
> > ^ this is the "b.set_bit(17);" in bitmap_set_clear_find() test.
> 
> Thanks Boqun! I had the same state and got things to build now with
> CONFIG_LTO_NONE.
> Your work helped me narrow down the possibilities.
> 

Great! Is performance number any different?

> Gary's helper-inlining patch in combination of CONFIG_CLANG_LTO_THIN
> and CONFIG_FIND_BIT_BENCHMARK_RUST=y gives "duplicate symbol" build
> errors.
> 
> It does not eve matter here - because  _find_next_bit C functions are
> not helpers.
> 

Yes, I noticed that, but in theory we should have the same performance
as C because C also make the call-jump to _find_next_bit() instead of
inlining it.

> For cross-language inlining, we would need to change the build system
> similar to Gary's helper-inlining series, but for *all* object files.
> That is what "-flto" does for clang, and "-Clinker-plugin-lto" would
> do for rustc.
> Instead of the hack of emitting a .bc file, we need all .o files to
> contain LLVM bitcode, regardless of whether they come from clang or
> rustc.
> 

There are cases where we don't want a full LTO, and so having an option
to get rid of unnecessary calls to the helpers instead of a full LTO is
reasonable IMO. But of course, no reason not to make cross-language
inlining work under LTO.

Regards,
Boqun

> Thanks,
> Burak
