Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600F28A1CA;
	Thu, 24 Apr 2025 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513303; cv=none; b=MtAJw5QTjw86tcg9RM+XUcgEjmSyKelF7wePmUJJgLyhDmOVvPBhJ4pG6CKSCTnwXfo/dvk383AWEJVkyP7TZWMADk8g7OQfpyzlVxVDkQ8QlX3PPcsLeMgqKM2TMWW8hFFg+gtHNqc0Nhk5OEBgHCpzoTNb1R87iNgj85vcCuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513303; c=relaxed/simple;
	bh=NB5NSM9m1LT+0/+yrV7r7AsJ+lP9WOo0Hf7PlGmaw/I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xtm5Y49zhBNJtyCXCckUoMa24brk2zkDTbajYHk+6uMGL+nBi0lUeYTrl9XHQ2blEAe3GS/U30zQlMG9iGlreBozuldgN9UkrVa+s4CPpq3gzAo3C5/LBw0Cas8kxzsVx+TnHTc+IfL8Jk1H241gisKbAlwcEFSRzc3qporAX2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSiKt0fj; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSiKt0fj"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfc7fb2aaso12364116d6.0;
        Thu, 24 Apr 2025 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745513300; x=1746118100; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi7pElsf78yNio7Jc28GvBvcVTzeJUAQuQ9na1Vlvhs=;
        b=WSiKt0fjWEmwhzm1AOR7bUCvHyJy7QUOO8rxj8opkvqaUeRNdUvzjLj8lhR9sBzISg
         zd+t9tQ65NendfLS0vQh8yLofNEJa2JHaLfj0GyBRqi2ntnnP/5ps68zUGHcGvenIfV7
         gDfaKkUpoCZZ8mg401ob4mzWRpBri0MG88/n79wFJ+SHuPc29TCfhCSRih6wfaCIiOau
         qdsAZLDiqWeTZByUIEfYpkkHTVPlNkkTQ9yVqb+vAHswFAzLLgk2PE6TUQFvjT7kjZKh
         JJaXbNqPe14fDi7HMs3CGGlrn+mh1K+5b1S4pqnSg1u/q98cwGdkcvmhwaR9TSuLxhxH
         2pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513300; x=1746118100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:feedback-id
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi7pElsf78yNio7Jc28GvBvcVTzeJUAQuQ9na1Vlvhs=;
        b=f7MGNqvlCTatKmCyFd5Fn3vcrA/X6adn4UhzFdC0Evy+WvyfciAT8sCgazwei9R+hb
         6tpLimCCN6Awor679c2yYff5/XR1rvIEDB5CypJAMu3di4HBO6nwvc7Cw6eiaE0ikzkT
         nFYI8nfr/I224lDpr6d8j/eCm6gCVh3jTbFyP8wl7WOCGUE/qbpvObMCMfGqmQriljOw
         ej+t+LXIKwbXgpxCwQZpQttDU3/EEUXNBBk7GuXRYmHCjjdi1tlaU3AyR4bID4PkwuVp
         dTL7Y87WVlKlBi4rnF+riWEflAy3LqBkMD6Y9k4BnXYSv0hYWlyN5GPcP4j9vSENv6ko
         IuuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOR/xbFOzi8JlthPqyFP5JR4xvBoTJheNUlackDC3To6HqI9y4EgCtWcMK0E7DVhZSr86LaRgF98l6nuc=@vger.kernel.org, AJvYcCXx4FKb1wThXL1j/klrB8f9wvfa92Ug/iJk5IzVBYIj+F6R13JnUTxtOTFJFqU+aVuQ3GlMqLegNwVVSleUhEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+kQ+u2MvJZIYFA5xNvjfMHd/Nf0umll5c4b/wad5GHW6xdg/Z
	vV8E8o2Rx0AlB7JVW0O9GKE+3mqS/BXJD0m2BWrrQrhP2+IZDobP
X-Gm-Gg: ASbGncv7sSTT7KZCw3Du+lIOrq4NRkO8atp+U9WkLq6yDr4vlJKNDBwUBbf45HnvwW/
	nwZUQCLZFp23F4ezvWEl2wRyAb+05+qInOCRSXo/SVPOtZlpbUVeqC8t0nQDTCbX7d4nCuD0NCM
	qAmjiT2BZW7C/1Zgst4Tbbbi3md+73QxIQxMaGAhO4PqkPlrfHQBfBhtemasNHhSpLZqYEHqAtn
	isjqbbcZnp61+Iluar101aI1osubX2j1/fUPiHMd1s/jBjJS06RyKwOfrCYhAD99HlqQy7BujCu
	Qb6O4g3qLMfNaICINBuISjEGN0nxgpa1NZfv8hcgthJFVrfkZN1Jeh5wT3GqTMrvOrxGLMP2/Bs
	hRd2AamWaokLRhg3MYclDf8iaLrpngdc=
X-Google-Smtp-Source: AGHT+IEn49uDZPyUcI6qQ9fBqjUXpeQtBK2JgtAmCrd1sYsqwmc4+SWqpaLr2uX9zLtElmGTROEp4g==
X-Received: by 2002:a05:6214:d6f:b0:6e8:9a55:8259 with SMTP id 6a1803df08f44-6f4c94a8ceemr5059326d6.9.1745513300597;
        Thu, 24 Apr 2025 09:48:20 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c08ef2fdsm11313846d6.17.2025.04.24.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:48:20 -0700 (PDT)
Message-ID: <680a6b54.d40a0220.27afd9.5e84@mx.google.com>
X-Google-Original-Message-ID: <aAprUUGDbHAoeMTN@winterfell.>
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 966E31200043;
	Thu, 24 Apr 2025 12:48:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 24 Apr 2025 12:48:19 -0400
X-ME-Sender: <xms:U2sKaLtAWCZwUT2JRSqChOFJ1gkjd2CQgXcChETJ22HTwD_Ux5i_hA>
    <xme:U2sKaMetFbwcJ-IIkrS8DimBgkBwN_AGS6IGVYzPfYqS1ysJJZ8jE3JYP-b6mCmBN
    nQdPc9DA_GP6oSt-A>
X-ME-Received: <xmr:U2sKaOwfMEw5Z-Ckb6vMIzpViTbuz69sFUKPB26V49wKHOGX4TD7lOUCWeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeortddt
    tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhepudffkeelgffgvdfggfdvteffjeeftdef
    tdehfeegteevudefuedvkefgveffieefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhq
    uhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqud
    ejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgv
    rdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegsqhgvsehgohhoghhlvgdrtghomhdprhgtphhtthhopeihuhhrhidrnhhorhho
    vhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigsehrrghsmhhushhvihhllh
    gvmhhovghsrdgukhdprhgtphhtthhopehvihhrvghshhdrkhhumhgrrheslhhinhgrrhho
    rdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhn
    rdhmvg
X-ME-Proxy: <xmx:U2sKaKMLnwck7WHao4MIV92ye7VzHZg8JFIoXFHSpwxOybeCNt-xxA>
    <xmx:U2sKaL8qtHMp-7mcQGpFQ5D4BHwAiZ6aPUzo3zHKmI-fgfHe6rgIaw>
    <xmx:U2sKaKVpGK27o_z6tw_fvSrMP-ZhahNBnLbQK8UQXBmIvuUFHQW7Nw>
    <xmx:U2sKaMfKCI-9G0ucKy0CZvOK2Ib1mGvOy-GJW2vCzITz7wPFSZqKWA>
    <xmx:U2sKaJftEVcBkKi_mJqgd835ksar6tCZqfPwgwywH-MblJh310dxqdF->
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Apr 2025 12:48:19 -0400 (EDT)
Date: Thu, 24 Apr 2025 09:48:17 -0700
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>

On Thu, Apr 24, 2025 at 06:45:33PM +0200, Burak Emir wrote:
> On Wed, Apr 23, 2025 at 6:56 PM Yury Norov <yury.norov@gmail.com> wrote:
> > So? Can you show your numbers?
> 
> For now, I only have numbers that may not be very interesting:
> 
> - for find_next_bit,  find_next_zero_bit and find_next_zero_bit (sparse):
>   22 ns/iteration in C, 32 ns/iteration in Rust.
> 
> - for sparse find_next_bit (sparse):
>   60 ns/iteration in C, 70 ns/iteration in Rust.
> 
> This is a VM running nested in a VM. More importantly: the C helper
> method is not inlined.
> So we are likely measuring the overhead (plus the extra bounds checking).
> 
> I would like to get cross-language inlining to work with thinLTO to
> have a more realistic comparison.
> However, that is not something that works out of the box.
> I am looking at Gary Guo's patch for this:
> https://lore.kernel.org/all/20250319205141.3528424-1-gary@garyguo.net/
> Currently, I get duplicate symbol errors.
> 

You will need to add __rust_helper attribute for the new rust helpers
introduce in your patches. See Gary's patch #2 for example.

Regards,
Boqun

> > Can you print the existing C test output back to back with the new one?
> > Can you also ask 0-day folks to enable your test in their rust config?
> 
> Will look into these. Rong (hi!) is working on LTO for kernel and will
> know a lot more than me how Rust will fit in eventually.
> IMHO, making cross-language inlining work out of the box will be a
> necessary baseline to get Rust performance for hot code.
> 
> > > We add a fill_random() method protected by the config in order to
> > > maintain the abstraction.
> > >
> > > Minor fix to the documentation of the corresponding C config
> > > FIND_BIT_BENCHMARK, it was mentioning the wrong module name.
> >
> > Indeed. Can you make it a separate patch, please?
> 
> Will do.
