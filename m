Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0DF14D2BB;
	Thu, 24 Apr 2025 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501795; cv=none; b=LXBtii82UQ8ydHsMCOblf2CcBnhuLGLE+7AOYtcjvTEY6gEG8cXQ8PcGOi0GZzt33Rv+DXbNamerlKiVRhVlk2Szy8kTXZqna26HjhVLCWzcTMCaKsmNx9K9fEsxxFs4CUE0ZHN3OX7m57UB/znCbweUyetfAZL4XdfgJ1rcBv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501795; c=relaxed/simple;
	bh=uCeRjKrNszoDsuDluZfk9z97zS3/7HkYO5u/BsabRMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/YudHQnE7VeEuU+rlUuGD0/8qyOS9BzF9OTN7X2s9LstlDgZ/B+uvoZavT7ekuzu0kaqNCiwk92jKmJgw+cLip10QCRDutvPDeuT32Dv+rZ/0GawYtOwIlgDQ3JqALuZF90op2Gc8TNgqoyUMF0i3kD69M0BGg9csOapvpE/Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Le4NUkR+; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Le4NUkR+"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so12301126d6.1;
        Thu, 24 Apr 2025 06:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745501793; x=1746106593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkJxVV06yY27kTZiZeUJeDmjXXy8wFJOvQPrpJ12MGw=;
        b=Le4NUkR+B+hluItuv7lC/EkU3O9mGe78O2zwO9j1NLWaS3PeWwpFnTQydNB1viTUxR
         XbQ4kd3ZL/qd/1JOq7FdIMLFtYR/o/il+kNkMIKNyyh7wHZ8048ngixNmeV6SmCIV3om
         8Et2mYorbB4xzpM5zYtgYFm0VdlYL4XusIoIqW1zvDMXWgRj5cpPWkkj+0gGkdYNwXFn
         bGO4IzB1BxvIUEKPJATI+lXAlnb+iqWQGGAq+uAGww9Uk7bnYvaRoqqc62T7cUjL4Rv8
         NerZXOTZ9V/dsLPxzvueyciKs3IBVDTEZn/Cy8kUP0FHMYhYqyl8Tn27Ebev3V9lDS8Y
         1GEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501793; x=1746106593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkJxVV06yY27kTZiZeUJeDmjXXy8wFJOvQPrpJ12MGw=;
        b=iyB62JMlxvD4N/5dx3foeVQfBAT0swsAStnVnA1M/5jhiRRA49dRmsHjFQcQh+xkZa
         9kSNst/RU5+OVnTN1GVNVS8lZDhAlWS6ih/pATHoSUUU0poil24SJMRbzG8P5nosm0xW
         a46zYQkCLDzyhmE5rrB77v/A1jYwUh0/bT9NF8uXqNA4cGOT2YVkbLFtnlZXoAOcH1TD
         O6xwoPMJtPFQIxJ1jNmi7WWh6zHZjH/aM7QQx4EJy+WTlgfiAmwCH6drt1c9cMiEg10Y
         DxSaUw51n0EpfYpVz0SaeRZ6m27ly8L6RvfKpA3xPALRO6vSzjwEW9gsEiLGX6fBRAzD
         wGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBcFWWNPzi5uJ4pOL7k6+ExWvshVBgtTzNg/0ufJGesW/z75euAouoeO/KTn9M+JbQNCj2rXg4hfMG5bTCmjU=@vger.kernel.org, AJvYcCVTzx6zJfKzm3+DqQo+R/XM1cMh8Qw8p1WNw/OuNDfXbAGRKOuo6pKjHiA21HPN13wZwGciS6V+Eh9JBO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWI7AytzbHwdD7qlfPuvmrKXfhPSwQN6jR2YxoRJOMj46FpCe
	MLqB14PyR5r98NH5nKj4XhknB3U1NgYfrcCM0CmXIw6F1MXPqgpM
X-Gm-Gg: ASbGncuTyaUuM0SEWXaDm+Df6xFnK8M1sb1JF9X8JVPLzD12QGFi15EgP22gvTLor3v
	klgVZ1UzGZnRP3hNfSsIebMTYUEPjyJV5A72E1J3WbVOEbj81SXBmlquQ2qWlNVNL9R9OJXtXs2
	7ASKRXqu7yQ2dWG9pcCONpGGViCnXCaXqsQCk7GTej6ljJWxnAUMBJBhCa/beXwl/5PhvlsUUxb
	luc7N/+TZ+D7DLbcIk521T3/+KXSA8h2UnOh7MaCTgsQBJVbZ5SkJ3o20zUWrpbH6CHvgAbOO73
	/2xZYdw8c/yKYJaThnW/rFEcAz2d2c0TgEpxLMb2Ix4aRaFvGPXmAkSkH0Olb8RhGF4EcqaKgyw
	a5w62fT9goDHCx5OQTgqUv9QvEE279rs=
X-Google-Smtp-Source: AGHT+IFwNJHUJKtKfWWtTrBiCi5HOAvowxBi6jOI6M67oMZKzu3DBZ8RlvpKnfgkdtNWAsp1n8Qh9Q==
X-Received: by 2002:ad4:5b85:0:b0:6e8:f4e2:26e1 with SMTP id 6a1803df08f44-6f4bfc0a1e5mr45384856d6.20.1745501793020;
        Thu, 24 Apr 2025 06:36:33 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0968a44sm9429506d6.60.2025.04.24.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:36:32 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C4D021200069;
	Thu, 24 Apr 2025 09:36:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 24 Apr 2025 09:36:31 -0400
X-ME-Sender: <xms:Xz4KaOdiRETb2q2s3B9d21x-3ncqbWLfCxSM4g4Z0ncC_CvZ8Gt-Dg>
    <xme:Xz4KaIPC40iZbQfD2EnByqZhNMw5CzrbhVt2NDKc6Xy3FkpiHmySNsOjoHwYPc19Q
    XpozzMedEDjoLzETA>
X-ME-Received: <xmr:Xz4KaPjb34tN9p5kdubwQF2VoR5IRj0nP69gnPq8QQP8WNxGnJEP37hH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvg
    drtghomhdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgrrdgtohhmpdhrtghp
    thhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsg
    hjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhn
    ohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorh
    hgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Xz4KaL_kdMuRQa0vH1GyKf-YtXY4a_geOfJ28yv_UjEwNMxj6p01eQ>
    <xmx:Xz4KaKvDoGR4xYwHMhf_YACPNiPCXAPjF9Rf0AiuGJJuP1TYHtBxig>
    <xmx:Xz4KaCGOyXSpOIJ0y_X_FDiWJ4AregjOawnkxyBb1AzlPtuALqeAgg>
    <xmx:Xz4KaJO7jOaYjJGBu_AqElPPQ-dclzrHAPnBvIPbZprquswI6KV-og>
    <xmx:Xz4KaHO8pgh_u4q9IbBSCOIfRmA1p4XoFM3wig1TcNvWvgRE1eE-kyKI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Apr 2025 09:36:31 -0400 (EDT)
Date: Thu, 24 Apr 2025 06:36:30 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
Message-ID: <aAo-XiP-OHA_4itj@Mac.home>
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux>
 <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com>
 <aAfL-e6qA9oBce5t@cassiopeiae>
 <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com>
 <aAiqCXB9sJe_v6Yc@google.com>
 <D9DX39CF2RB7.IM219BZLVMCY@nvidia.com>
 <aAkPXBHNDugnXrhc@Mac.home>
 <aAollRd0-SnirG2a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAollRd0-SnirG2a@google.com>

On Thu, Apr 24, 2025 at 11:50:45AM +0000, Alice Ryhl wrote:
> On Wed, Apr 23, 2025 at 09:03:40AM -0700, Boqun Feng wrote:
> > On Wed, Apr 23, 2025 at 06:40:07PM +0900, Alexandre Courbot wrote:
> > > On Wed Apr 23, 2025 at 5:51 PM JST, Alice Ryhl wrote:
> > > > On Wed, Apr 23, 2025 at 10:02:58AM +0900, Alexandre Courbot wrote:
> > > > The stdlib alloc crate relies on specialization to speed up methods
> > > > related to iterators. We can't use specialization, so losing these
> > > > optimizations is simply a cost of not using the upstream alloc library
> > > > that we have to accept.
> > > 
> > > Yeah I was surprised to see
> > > 
> > >   impl<T, I, A: Allocator> SpecExtend<T, I> for Vec<T, A>
> > >   where
> > >       I: Iterator<Item = T>
> > > 
> > > and
> > > 
> > >   impl<T, I, A: Allocator> SpecExtend<T, I> for Vec<T, A>
> > >   where
> > >       I: TrustedLen<Item = T>
> > > 
> > > in the standard library, which clearly looks like an overlap. Didn't
> > > know it was relying on a non-standard feature.
> > > 
> > > That's going to limit what we can do in the kernel, but nonetheless if
> > > we can support only the cases that can be optimized I think we would
> > > have our bases covered.
> > 
> > I think if it's a critical path and we really need the performance, we
> > can use a non-standard/non-stable feature or get that stabilized.
> 
> We should not expect that we can just stabilize even a minimum form of
> specialization. It's a very non-trivial feature.
> 

Maybe I should have worded differently, the point is we should not limit
ourselves to "a cost of not using the upstream alloc library that we
have to accept", so yeah specialization is a non-trivial feature, but
what we can do is presenting the problem to the Rust community and
seeking for a solution for our problem. Similar to `CoercePointee`,
unsize coerce in general is a feature that is hard to be stabilized, but
for a specific problem that we care, we found a solution.

The Linux kernel needs should be one of the sources that push new
features in Rust language, don't you agree?

Regards,
Boqun

> Alice
