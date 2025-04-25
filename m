Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9018027;
	Fri, 25 Apr 2025 13:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588371; cv=none; b=NAZQsaO9Wn9wA78PjzQfXgu2crh3ZchluVmHkkAzXIZxo+pB8YGXkxJwY//+9D3iH7esEk8TEI5A8OQtNciDgPjAL+9Z2wbieqdaX54pTrQuL+IGTiNF8HQRXZr+LLxHGgW+zL4cOxzJ99Y4CIsDpc3tf9zmBqzzUxY9d25pLx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588371; c=relaxed/simple;
	bh=HaSmAciiEXr4q8Tae8RyQBqhmMqC0WzjT7rk49DR9C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVUFh3VBlvZcEXYG8Bc93cnwE1kT6SIcVDheUoHP0j+7sqWrM0V3NJDxdlFpaKnJ1YzzBbncEznwNp1MuRH/nzWenI05R9DmdnDW9Gu9eXWJdpxgxtMppHfQ1qix1BzLuN8Gwz+F5wYZGzNbJcomTUR2t7RmO9iY5q1iQyh6FSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMKFi9NT; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMKFi9NT"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso40390036d6.0;
        Fri, 25 Apr 2025 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588368; x=1746193168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pddyjvz3pULDfi3ouvZGplvqQJKnM1YeL95IMp9tld8=;
        b=QMKFi9NT63f4gik9FALKUkRhaAHR8FkuWI+iGB4rdxhbEAzsw02hLzQ/RWuBM1o0p+
         gYkW12t7tgJ96kRwcVlySla3wE+o1tn1erRSiDsCi0ENV5/Od9v2TQmiPRg1IS3qpf5f
         p7c9PdpHC/pnDD4N1WELyQoqTRAs/Eo+LwXmmE0HENK2LoZKqauuq8RLB8tQqhRAAiIN
         wMUjcsNt38XTp6l40mRtYoPIv7mOXb7XhRqzMSS2U69QTuMvJrquHWwnJigjRdAjT+/+
         iCLxOvPL/3l9eqL8zd5qQdunkv6Wd5oe3QjNjYc68DEXtKS0bzOp5PzGkKaD5i6ZZ6wF
         VyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588368; x=1746193168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pddyjvz3pULDfi3ouvZGplvqQJKnM1YeL95IMp9tld8=;
        b=NIrFu1IsI2R56RJ73E2krnRxPSajJLR6cLQfzxaxQluz/MpoC+diLDGDECW7Edv5EA
         ITFp0EMTs6gleOvr04U+dDrAEmWqgcY93hapOv2ttWsFSO7jkIUSmRa+hmQ/nn7EVN0H
         /oarO0bZD5RrijPr1JsqF6/P8oI/NjMNmzt8zzcsvvGtU75Z9jOt+dzEkTCG8q+m75OK
         moi0Iy6XDAjGR7/UiSvkLjF7hizTYmMYS1Uh47cwdkXQMF10f/FfjEUD9xpcLfVmfu1Z
         cZUO/fbUpQ2+x0+cgz/rYa9W7qa0vPL8mOZ+jK+qvv/xohNnqY3yDMTNNmhdHW5DGZbD
         gVhg==
X-Forwarded-Encrypted: i=1; AJvYcCU48KTQKCAO6t7/Slxq0uq86TVx7picmexdTCEFNyGXioHBySujw2TBVIH0yj8o0ewmr8N4xPJ89iQbV+HgplI=@vger.kernel.org, AJvYcCXO85A0zF5XodxJlF1jm7SwkzVQbEwW2n+iD0yUFohWQz6muDuWw162mefOmd3E6j+TKtJue0TGpeOeJX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMu800wPn+rnt6R1QrdLP8IBVeQttkM3KTbG9k7BOCVgVRHYo
	fWzsg1i7VWvIAOdIAW3BmxdGNVeumRy74yTQMAri1Cv1LK9beivV
X-Gm-Gg: ASbGnctokv4JDTvmyTTga6yfGZqM7OuEbxDjc16GaRuNwoQw8M5C1j6vtGOLXIEPl3/
	6piPR7ODUyBx8ochmX2sv4k7MAysrH2U/adAqb+obz7MimA9RbUf+8CzCNhr3UTYue+HMkGjGuE
	nlzg9M83EtXKISkWBujeJlQnk/Tp/M/zeIH+biCutIheYKt8QSD3yEGEcpoLgm6NUrcFEHECwN3
	kzqd1RnYZTGW/8Kf94fu4Pe0WIbU1oLIpDSal9tGMabSkoGXb1EK2wbind1AjYuHySc7HtJdxQU
	FPCsRaFqxY5RV5n3Gm/LyagGwTsFum2OtO+aqU/hLOIalemn1MMemSrZq1t5fXecULA2vQrySTL
	9JEBh63Kw1c9L6cjKa9PcN75B86aWMyM=
X-Google-Smtp-Source: AGHT+IEAcAGlywoD4vbgKap1QNe8i8NdSfCJBi9ag6ml/TytN1c3P5xRu3f1gBOvvpbAjlXm5fbBRQ==
X-Received: by 2002:ad4:5c6e:0:b0:6e8:f99c:7939 with SMTP id 6a1803df08f44-6f4cba62902mr39770506d6.44.1745588368146;
        Fri, 25 Apr 2025 06:39:28 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c08ef2fdsm22269916d6.17.2025.04.25.06.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:39:27 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5509B1200068;
	Fri, 25 Apr 2025 09:39:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 25 Apr 2025 09:39:27 -0400
X-ME-Sender: <xms:j5ALaMjNTLrReuyDYkUNpKQaCjsVuMzryt5VWXIccoZKJvw7hFeVfA>
    <xme:j5ALaFBq679trNCasoXqXOJ6rgu_BGFMZ20Te5XG2sP7SN8KxUqoDTlEyLBbc-80K
    0yBIfOeM6HcFclRNQ>
X-ME-Received: <xmr:j5ALaEF84JFtyGXk8tH8VWF-BIyNYGK9Dr3bhBstAwxdeabVgMAtXOiN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtrodttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeeitdefvefhteeklefgtefhgeelkeefffel
    vdevhfehueektdevhfettddvteevvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvg
    drtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepvh
    hirhhoseiivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehgrhgvghhk
    hheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrd
    hmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:j5ALaNS5BvsyDE2sDyizCLRVMxCFBn50Vwzt27M6V40-L_lBC9jfCA>
    <xmx:j5ALaJxbhVB-PGT8ppFGyyDiALRGPcUwqfYdOjyxNMSnkOIi3dMgVQ>
    <xmx:j5ALaL7FzFUB34FmsFaIsSI30lJVbaQIu5dQKGYjV1uQOqPTbhzd0g>
    <xmx:j5ALaGx3ngNlVAnU7Su3Ow7f_x6ZWW2YA6U0zpO142t-oo6VBlIdlQ>
    <xmx:j5ALaNitBLIednKn25waJn12qH4SaDbno3w7VcRKrIWcS2pS9GuAFtf9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Apr 2025 09:39:26 -0400 (EDT)
Date: Fri, 25 Apr 2025 06:39:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
Message-ID: <aAuQjSzatuNoDDXL@Mac.home>
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
 <680a5f5d.050a0220.2035d2.545b@mx.google.com>
 <aAtZQkre4KRU2kr1@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAtZQkre4KRU2kr1@google.com>

On Fri, Apr 25, 2025 at 09:43:30AM +0000, Alice Ryhl wrote:
> On Thu, Apr 24, 2025 at 08:57:13AM -0700, Boqun Feng wrote:
> > On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> > > This is needed for ioctls that operate on a user-provided string.
> > > 
> > > It is somewhat unfortunate that strncpy_from_user does not nul-terminate
> > > the string when the end of `buf` is reached. This implies that we can't
> > > return a &CStr from the function, since the buffer may not always be
> > > nul-terminated.
> > > 
> > > That said, we could add more convenient helpers on top that add a NUL
> > > byte in that case.
> > > 
> > > This method isn't defined on UserSliceReader because it complicates the
> > > semantics. The UserSliceReader type also has its own maximum length, so
> > > we would have to limit the read by that length too.
> > > 
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/uaccess.rs | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..1bd82045e81ea887008e30241bd6de27f096b639 100644
> > > --- a/rust/kernel/uaccess.rs
> > > +++ b/rust/kernel/uaccess.rs
> > > @@ -369,3 +369,30 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> > >          Ok(())
> > >      }
> > >  }
> > > +
> > > +/// Reads a nul-terminated string into `buf` and returns the length.
> > > +///
> > > +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> > > +/// then the buffer will not be nul-terminated.
> > > +#[inline]
> > > +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {
> > 
> > Sorry maybe there is an email I'm missing, but could you provide more
> > context of the usage?
> > 
> > First the function name is a bit weird, because the 'n' in "strncpy"
> > means the parameters should have an 'n' (i.e. length) in it, but there
> > is none in the Rust version.
> 
> There is a length! It's the length of `buf`. It's pretty normal that C
> methods with a pointer and length become a Rust method with a slice.
> 

That's exactly the point, no need to reuse a name from C if we have
something better.

> The distinction between strcpy and strncpy in my eyes is that strcpy
> reads until you find a NUL byte, whereas strncpy reads until you find a
> NUL byte *or* you read a user-specified number of bytes. This method is
> in the latter category.
> 

Then copy_from_user_until_nul()? Or cstrcpy_from_user()? We should have
a bit consistent naming on Rust side regardless how C names things IMO.

Regards,
Boqun

> > Also, we don't need to replicate the
> > semantics of C here, we could just do a strncpy_from_user(..., ..., len
> > - 1), where `len` is the len of the `buf`, and then we would always have
> > a nul-terminated string. But maybe I'm missing something from the usage
> > side, so this is not doable?
> 
> Well, I guess that probably does make sense. I'll update this to always
> add a nul-terminator.
> 
> Alice
