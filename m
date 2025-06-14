Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3213C3D994;
	Sat, 14 Jun 2025 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749917147; cv=none; b=dTpMehziVvH8/dETgf3Q+JCVS6jbeE65tdeiOSXo1QBXhtL42nE47Jt6ZxJQf7pHYzMQ1Y9kTxz67nZ4AbpabZmmC9gCbiN5KLqfK7+rNb9Nho/mlzIq94Wg+StB2MvqP5H+y/ZIn62m2ZvDyfeUkAPuwzYtZo1k7gf0WO5+YVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749917147; c=relaxed/simple;
	bh=rds8Ah52oKlZxgSRArZYUZpy6dGDO5CX7k5R7Gk73uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDY81h7vHmnLqBxcWX6ySUqXyhGzi3VKZnTRzF0HpLM0zvgg0Sb6T5A/5JGPDukJgcyVzjHBuzMHlY/CderY5ziG3ISyXrVA+JF7547f8h7VfR6lVBvjd7uSNTH+bXFIZj0ehq9Iho5x/9ZswQUEU7BYwv61K0rICWWwW0dm+RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHvjsgBs; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHvjsgBs"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fac7147cb8so58016346d6.1;
        Sat, 14 Jun 2025 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749917144; x=1750521944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OB24Gzezt3YDBtxc1bzhMWcym7LcfIMaXl/S7siA4Z0=;
        b=nHvjsgBsOr0mWjmyqF8MuKIKdyB7Co9grtLZiZyJsz9CSmCucYM+c++whRWiAKfzwk
         p+FZXriDe2jWvOmxAaK2bd5xqjDq6QN2djaN3+BrDMbdiaV+Clyq4Cpc1db2/IGNcwlD
         jFKwRG70XnoulwGalD9fjiq76pGhhqM21o6orHQorRDuzvUPsmEV0J1iibyOi/0KpTwT
         LN4fjSMCVxT8oZNNbCbFxiJD1LMa+/qIdvON+/5C1+9E4eR7kjUgITMfA4RfqojgU/2A
         uN0qBFJijSOuwfC7dqHtyO5te3geVXY9GYcX08OQ36tItRU78Ro2K0iTh9rKC/tE0X71
         wrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749917144; x=1750521944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OB24Gzezt3YDBtxc1bzhMWcym7LcfIMaXl/S7siA4Z0=;
        b=cfQxug3oRp2zGgCLQEpKOq7RBewu4i3R7V/mi7ajaJ5WsPhT5L13hklZW4EW06p09+
         aWuG+2qHl6h4CizPk9LBI4YnuF36VyXNUtapaL7RPaqZ63CpjD11Lu7942LAjFXoQcWu
         kRIwaSup7It4ioB2lSA/mOX8q0urqnfpOvzHbrktX2Nrx1vGzclQTulDXdFChxjJMWgp
         VdWpnhce4Jaa1IH83HK0Hpe+46JARabbL62Vt43iMgHjQNMrvxVBcy24+zm+9kHa9oZa
         HbTs9Rw1QymQQdJUxdNKFgTAIO9ZzmU8gBO95V5ThvM6EYnZW+UoIeKEFBShn3PVojD+
         8vKw==
X-Forwarded-Encrypted: i=1; AJvYcCUPMPDC6lWX4rNLi6VxIMEyFjAc4UdJ8EvdXv49X8yJKMuJv1wGhUgI8qkvK3ax1LaxL5trpP6n6su41kOg190=@vger.kernel.org, AJvYcCW+W3P/qKaSqq0uEn96M8vSAHDezEafZr4g6V99esJhhswm5rMG4b2GDQ3Updf/4bPatriDX7oHYcc+Y6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Hy7E5PRZjkKlBnhSF1yXG97XuVwSaXx7n0EQ01GQXEUM34fW
	pXI4lD9tfazNMNChBV2RMDe19keq5LwyVt39vfSdCLmCBaPtVd2Q/TXrf0EVEQ==
X-Gm-Gg: ASbGncsv1F6AcKeEtPEwsJee/M0wTaQq3xMglgxkqAveqNIdpzmTvkps/kyQDBhe/oK
	/eKF3YMml52hd5Zg6gv1uqMpB9M9e/nGau2blK7v0QbLKbtSTO3BO+1/CeEnMk/QmkjGAaK+JhP
	RIly1sMQ4qTKDvS7HukA6Gj4yvpuPzGFV5gi6un0HugO/9I6dsKiAizfizTDPcWBOluZzlB8DzG
	qhSgeOF1PYCH33YnwMTToS00Pf4xnmtsNR8n60M4C8p+3NTeUmB+5vAe/EP/T8TL3PRXiBz31r6
	0aNHVpbkS3if+yIdMhkSRsNShrcYDhvCNckFYs4ID8o1sVkLvKadwUGN5MqVWe4+LUhnYOb/acS
	IxBfiaxc58a5o+H+N0xv361atRUu/zwj4+rj2uHgKcIW2tfc4bQUa
X-Google-Smtp-Source: AGHT+IHa0MlRIbdZIrikccaRgIp9is3bQg+74W5PNiOf40cMuYxXE73w/33x9KkQWepp3ySn4NFm/A==
X-Received: by 2002:a05:6214:c45:b0:6fa:c44f:2ae6 with SMTP id 6a1803df08f44-6fb47801898mr52550676d6.38.1749917143981;
        Sat, 14 Jun 2025 09:05:43 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b303fesm32766986d6.39.2025.06.14.09.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 09:05:43 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2C1921200043;
	Sat, 14 Jun 2025 12:05:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sat, 14 Jun 2025 12:05:43 -0400
X-ME-Sender: <xms:151NaFqgzot7rWrMP3bnqrbwbCF6DU9ppuJKqPfEctkyOKWKjWn5IA>
    <xme:151NaHo--VE4WXhZWJGiw6rO_0YOlVNa9WFRfjI44QcZ4iX_1QvtQJjjr9xjBw5RF
    Ewvy4ozRcfaMjd39w>
X-ME-Received: <xmr:151NaCOOGTFEb7e-Fs29JhNubqVX5LQ6_mLh70O_bSM9CvJfBOVysH2g0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedugedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtg
    homhdprhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehg
    rghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmh
    grihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdr
    mhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:151NaA5jvIRvLTsX5ZAwlFZQxqN0MozB-MRv5ZJeVbnm7Bb5dBsAMQ>
    <xmx:151NaE6FYHZGbPwAMLDNU8zK0HfeP1tbs89JS9poU3WoG68czYUdbg>
    <xmx:151NaIhyqyfKHoGp-kqljLlmKnXAWLg1UNp5Fnn3vf_PmWYYJwSfdQ>
    <xmx:151NaG6F4-RplXKIW8wgfl2dEDi1r5aotQPDzce22tTI4yY4eI0H7Q>
    <xmx:151NaLJw2UxTDRVOw1eY0vxsoPR1962DeDre7QWhR8gS7eAOV1j9sTQE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 12:05:42 -0400 (EDT)
Date: Sat, 14 Jun 2025 09:05:41 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
Message-ID: <aE2d1RdR1-pxurzj@Mac.home>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
 <aE2P3OBo1Ufjctxy@Mac.home>
 <aE2btHiDP5LRmBTL@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE2btHiDP5LRmBTL@Mac.home>

On Sat, Jun 14, 2025 at 08:56:36AM -0700, Boqun Feng wrote:
> On Sat, Jun 14, 2025 at 08:06:04AM -0700, Boqun Feng wrote:
> > On Sat, Jun 14, 2025 at 10:38:11PM +0900, Alexandre Courbot wrote:
> > [...]
> > > > +macro_rules! impl_genmask_fn {
> > > > +    (
> > > > +        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, $genmask_checked:ident, $genmask_unbounded:ident,
> > > > +        $(#[$genmask_ex:meta])*
> > > > +    ) => {
> > > > +        /// Creates a compile-time contiguous bitmask for the given range by
> > > > +        /// validating the range at runtime.
> > > > +        ///
> > > > +        /// Returns [`None`] if the range is invalid, i.e.: if the start is
> > > > +        /// greater than or equal to the end.
> > > > +        #[inline]
> > > > +        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
> > > > +            if range.start >= range.end || range.end > <$ty>::BITS {
> > > > +                return None;
> > > > +            }
> > > 
> > > From this check I assumed that you interpret `range` as non-inclusive,
> > > since `range.end == 32` is valid on u32...
> > > 
> > > > +            let high = $checked_bit(range.end)?;
> > > 
> > > ... however IIUC `checked_bit` will return `None` here in such a case.
> > > Should the argument be `range.end - 1`?
> > > 
> > > Your examples do seem to interpret the range as inclusive though, so
> > > probably the check should be `|| range.end >= <$ty>::BITS`. But that
> > > triggers the question, is it ok to use `Range` that way, when its
> > > documentation specifically states that it is bounded exclusively above?
> > > We could use `RangeInclusive` to match the semantics, which would
> > > require us to write the ranges as `0..=7`. At least it is clear that the
> > > upper bound is inclusive.
> > > 
> > > ... or we make the methods generic against `RangeBounds` and allow both
> > > `Range` and `RangeInclusive` to be used. But I'm concerned that callers
> > > might use `0..1` thinking it is inclusive while it is not.
> > > 
> > 
> > I think generic over `RangeBounds` is a good idea, and we should
> > .is_emtpy() or .contains() instead of comparison + boolean operation
> > when possible. Seems we need a function to check whether one range
> 
> Ah.. from the other email, genmask_checked() needs to be const, then I
> think we cannot use RangeBounds here? Because RangeBounds::start() is 
> not a const function.
> 

Ignore this, seems these functions meant to be not const, just the
document is wrong.

Regards,
Boqun

> Regards,
> Boqun
> 
> > contains another range, which is not available currently?
> > 
> > I would not be worried about callers treating `0..1` as inclusive: this
> > is a Rust project anyway, we need to learn the correct semantics of
> > expressions eventually ;-)
> > 
> > Regards,
> > Boqun
> > 
> > > Thoughts?
> > > 
> > > > +            let low = $checked_bit(range.start)?;
> > > > +            Some((high | (high - 1)) & !(low - 1))
> > > > +        }
> > > > +
> > > > +        /// Creates a compile-time contiguous bitmask for the given range by
> > > > +        /// validating the range at runtime.
> > > > +        ///
> > > > +        /// Returns `0` if the range is invalid, i.e.: if the start is greater
> > > > +        /// than or equal to the end.
> > > > +        #[inline]
> > > > +        pub fn $genmask_unbounded(range: Range<u32>) -> $ty {
> > > > +            match $genmask_checked(range) {
> > > > +                Some(v) => v,
> > > > +                None => 0,
> > > > +            }
> > [...]
