Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D019DF4A;
	Thu, 24 Apr 2025 22:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745533906; cv=none; b=lUR4006632Q3YkLKaSV5ZDrcCr4T977NQwGbkfYyXL2hBlIuHRtOP+LyObkJXKAEb8G6/NCOqbv1CZqneJpVhXWv74AI4Z0fis/qQ4FWCVKJtMfahK7A6E31LzEoKjzKtqEsqZWCzSNyBIzWJZjxILJ4BNnq7oNW9tWOJC1BuXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745533906; c=relaxed/simple;
	bh=vz7I3k1dS/9gTJPFBic0fusBnO2M7Wlyl8g85NNegmQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGgULKgBgKnke4cnSG2MFk0nJXnTCvsxBjQBpGhlIjNBP45whzd7PTBuwt1zPIuaKioJwHeWfnQB82YOJ5V5ggNgnXXyLfTe9nzyIJXuKpk1oPtG83u8fmROLcDyz9NfnKdko3I7ho5Ah0L2M1owxivgSQJdfC7UGOaou9STlS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU5sQzVO; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU5sQzVO"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c7913bab2cso160740385a.0;
        Thu, 24 Apr 2025 15:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745533903; x=1746138703; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vp5FL0v/lw4FzTdDCyD68s6SH+UuqxIilKABOBCsDx4=;
        b=LU5sQzVOOGIkoWpRZOQn4aCa9HO2G4BanIWtTGWaD6RotO+uehH18Lgfzo+stOBqft
         eXs+4C/cS2tvg5GxsVOnT2SsinqpIc4UAY0ZWvucYK72vx1bdzWuXUvWCZe+Od4jDNWj
         f4kve5qWVv0H5NdOQpVVR4FJLsDzAq7tzFAfEI4mITz91ZmaWCSag1VgHTtmIFfELmD8
         niNQjqOumZSlSopl1xgm5mwOmWkHaOKTCmHcLEK0an/ptzQ5QgsRhFwKOB7aku1k6VXy
         ifxyGa9VSbjd+kmKi6M3sqTIRD1CC9a/gKaf1nNiHmJzRQeS9LAMFgqLRNU5IqYbG4Vq
         BStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745533903; x=1746138703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp5FL0v/lw4FzTdDCyD68s6SH+UuqxIilKABOBCsDx4=;
        b=vjVOh0aF7VF5MLANffPM4p6tft3mM+zkbk44rtO4RkzX0O9ovcUyqfbB7WkBnhSfAd
         71vlDSh2Z4erGT9ug7q0sQmV9s2tXZr+vW2U6+tBoRLLSyAe+V8t7FKfVPUASCxxasu7
         /uJiAQgWbOBYTxWonbpJlKjUvs/xp2a4gQPxLM2JddRkeO/9baIYSdnEXbJn6vjJwOcW
         OpKnbd8Td31Q6goiYWxvKoobVzIlb5Sc32GdPvz98lVZFlLLCjEOE3h3a6wogv4wIH58
         INJKVn+rqeMS2QuT3yl0H4/CKb9tf0LOJrbO9KU3bjLGAMeChl3TS5yPV9JbMLcHTGlp
         czPA==
X-Forwarded-Encrypted: i=1; AJvYcCWXEUkTPruK7Pe96Fmu75ieWpfRmMcp5dHTeJvsCgSqezi9sxMizulxJOfvHgLSUxJvIma5cxGn6lWKIkA=@vger.kernel.org, AJvYcCXgsZzyPDDAMa18tNkhQvRYGMv8TU158fUVysAluwYFhjJm4bq3Itby2uIcJQ+YrXYVGEc6rwyFPz5S6Z5FrUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkf82JKdaP2x9z9SsviKvQlabGNwRmisDxomJli1FrUK8O+mza
	pjXlh7cy38SIVc571nU3LSPNlTjVkLkHVyYk3dOlU11BRku+6vQO
X-Gm-Gg: ASbGnctwSJma4PlpU9IYGR5qZHsu2wxFgDiVyP3ocQ9X55PxMyetZPa9HEvRRBo1obI
	7/VDnxtdR7lAXyzDRdsaO3iOzzieVOOCvgogTNnXbXuTRgken4FtjB9CcdRqVeN54qtwIt+LvpZ
	SUTo3M5U6lckabO0XEuv0z7trWQ7j84WN9cGLgHW/X3dRysQCwegW47sX62vJq8R3+bdFL/hYVJ
	+cF3eo0n0Q+nWU7WG/WNm0hi4xNOp78n9o+zbP+RX0+9/X+e65FMJsH/hcRvVUvDDcOhmoj6n12
	vA7poMTsL9jtIAx6GykB533YT6DK24ZdWMw5Qukjxq3TpNqDdWTgIX0iaOk80i/calDeSznrfYv
	s/GxGVi0GDuJ/03/tPjQ2R1oDqXVDo+TH2RA5pYsIZw==
X-Google-Smtp-Source: AGHT+IG3//N+eXdZkE6hnvtIZDSW8hiLU1TyCjyMBTf4FxFZ8SpRQQBNiTZOPzdGlbf+Q41gj1NHpw==
X-Received: by 2002:a05:620a:410b:b0:7c5:7a1f:4d89 with SMTP id af79cd13be357-7c9607b191fmr48253885a.54.1745533903303;
        Thu, 24 Apr 2025 15:31:43 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e9fbcasm142207485a.99.2025.04.24.15.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:31:42 -0700 (PDT)
Message-ID: <680abbce.050a0220.144721.78ac@mx.google.com>
X-Google-Original-Message-ID: <aAq7zOTuzrS-m_4P@winterfell.>
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 355A41200043;
	Thu, 24 Apr 2025 18:31:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 24 Apr 2025 18:31:42 -0400
X-ME-Sender: <xms:zrsKaEDxOTQc2vWxmGjpzC61_HHEiYkqFj763c55bFrwtPATdzAa7Q>
    <xme:zrsKaGhUYXpQ3tl5_vTtKoQfOLdgRDek0NRKeurUNBoUxd5lsVRlrBZGgSGibLk1c
    2n0XjIhA39sLR6E9Q>
X-ME-Received: <xmr:zrsKaHm4hoT_iI7Y4ab32Zv6OnXQDvSROMN7C3k6Ag826y0l9EN9swQJHC4gfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtieeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zrsKaKytiLn3MXqiMNB-Vj8GZrXoZ1ySj028yjFVStzL1KUGE_jlog>
    <xmx:zrsKaJQ-Dkp1PiPuTzIXjM9yQrInzAI73y56e3-SlEL45ih6ystB9g>
    <xmx:zrsKaFY5oN0CLZ0KfOgpH1uYjfP9_X1Enxjq8OD26G684X-RbH0svA>
    <xmx:zrsKaCQ_oTIN2-0JTDimYYfScZSy49A4ERiPxvFpk53wLsLipWDLHQ>
    <xmx:zrsKaDAHQ-ODNzm1fCQTL-3aPv6nwA814MxxWcl0u5gdMG7HqdsHpTcI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Apr 2025 18:31:41 -0400 (EDT)
Date: Thu, 24 Apr 2025 15:31:40 -0700
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
References: <20250423134344.3888205-2-bqe@google.com>
 <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury>
 <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <680a6b54.d40a0220.27afd9.5e84@mx.google.com>

On Thu, Apr 24, 2025 at 09:48:17AM -0700, Boqun Feng wrote:
> On Thu, Apr 24, 2025 at 06:45:33PM +0200, Burak Emir wrote:
> > On Wed, Apr 23, 2025 at 6:56 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > So? Can you show your numbers?
> > 
> > For now, I only have numbers that may not be very interesting:
> > 
> > - for find_next_bit,  find_next_zero_bit and find_next_zero_bit (sparse):
> >   22 ns/iteration in C, 32 ns/iteration in Rust.
> > 
> > - for sparse find_next_bit (sparse):
> >   60 ns/iteration in C, 70 ns/iteration in Rust.
> > 
> > This is a VM running nested in a VM. More importantly: the C helper
> > method is not inlined.
> > So we are likely measuring the overhead (plus the extra bounds checking).
> > 
> > I would like to get cross-language inlining to work with thinLTO to
> > have a more realistic comparison.
> > However, that is not something that works out of the box.
> > I am looking at Gary Guo's patch for this:
> > https://lore.kernel.org/all/20250319205141.3528424-1-gary@garyguo.net/
> > Currently, I get duplicate symbol errors.
> > 
> 
> You will need to add __rust_helper attribute for the new rust helpers
> introduce in your patches. See Gary's patch #2 for example.
> 

Here you go ;-)

	https://github.com/fbq/linux/tree/rust-inline-bitmap

I rebased on the top of rust-next and applied your patches onto it. The
last one is the necessary bits that enables helper inlining for the new
APIs in your patch. There is also a "TMP" patch in-between, otherwise
INLINE_HELPERS won't work, we need to dig more of it. But anyway, it
works on my machine (TM):

(on x86, in your test function)

000000000028b090 <_RNvNtNtCs3KHxpmQFgFb_6kernel6bitmap5tests40kunit_rust_wrapper_bitmap_set_clear_find>:
  ...
  28b0dd: 48 0f ba 2b 11                btsq    $0x11, (%rbx)

^ this is the "b.set_bit(17);" in bitmap_set_clear_find() test.

Regards,
Boqun
	

> Regards,
> Boqun
> 
> > > Can you print the existing C test output back to back with the new one?
> > > Can you also ask 0-day folks to enable your test in their rust config?
> > 
> > Will look into these. Rong (hi!) is working on LTO for kernel and will
> > know a lot more than me how Rust will fit in eventually.
> > IMHO, making cross-language inlining work out of the box will be a
> > necessary baseline to get Rust performance for hot code.
> > 
> > > > We add a fill_random() method protected by the config in order to
> > > > maintain the abstraction.
> > > >
> > > > Minor fix to the documentation of the corresponding C config
> > > > FIND_BIT_BENCHMARK, it was mentioning the wrong module name.
> > >
> > > Indeed. Can you make it a separate patch, please?
> > 
> > Will do.
