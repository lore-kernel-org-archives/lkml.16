Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B971DFF8;
	Sat, 14 Jun 2025 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749916602; cv=none; b=dangrdFtc+CKAksl5UYle5uFW663hQ8J3wD2SlOxDqI/zpGq8cOiSarmAKyJVRkjDvJeBM4Nmp8PbuDO9OhXY0iFpEOnAOdrZaL5g7G/ajui9z63LePUrV24IVxWGkg/22kKNz0Qa8nI06yCo252XFE1ma7j9+BBUA0GYkxO5aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749916602; c=relaxed/simple;
	bh=TzSpVX8bE4mo+14TLOGnWe9fzkCiKKzACwnHT0pEVGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWYhagpqCZ2jgyTVAEev7p6Im5+bZ/Q/4pgUt1pcLIuqz50W6W9iB7hBSrg9BGDLVgH0KVs0LkptHHfrxRlNRqeYMv6pEo0WP7cR65xkwIhzB9C4fCDDkzqczedpIAuB4zD5owfoExnACtuBATFGCur/KK1kepOh6WNCKppteqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/SG484Z; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/SG484Z"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso46586761cf.0;
        Sat, 14 Jun 2025 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749916599; x=1750521399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okdqn1xWNQO5CMnf3VD/xfSF8JF4xQkAhTmJhLL+PL8=;
        b=D/SG484Z6+92eYpah4zZ0rmhgBQW6d2QRzx+E4MhgdrWt7Ip3CmjhtfN4Qap0Gz5Zv
         kMTtGYdKri/wCwHZBT8lhUUf0+KfqKL3dbaiS3YgFameVUOIo+Ac1xJJtKP+//vjU/pC
         Um9lqwLSbfeKT0SkuSAEJqDnA9IlMgI35AlUQeHTTUsk2q8CykdO8ZXBzaH5jKXvRG4R
         ZVPjkWeuypwMP2gotG5qpdP02q83GeRMwyqbw9Z+at4kKY5MEdnHpxlVj9hqOdVw+dO5
         /NLROIsthUUyalSkoI74h/6J8zMp2UgWLl5DBr7T60J+nlmpu+1gkf30FBrUEyzWPz3y
         Lp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749916599; x=1750521399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okdqn1xWNQO5CMnf3VD/xfSF8JF4xQkAhTmJhLL+PL8=;
        b=qCLgqrF0Z0V3/LHobz1FnV27qWey5HrDcILGf2CinWUOQ+Y4zPleil1m33p226965x
         HF3EheeDEKiCJfsfmD8tjWAGjiO5tVf0WGBAl5CH0ckhWKjqo6r34Zmmo5XYRUODOgLi
         EiKiHS3ZgRMcNWb96eO/tfdPpN5U+2fvut21tHPOTqjucOwdQ09cfopGwS6gbp5x/ZNZ
         hw8L1cD9GjWitPoEYyLspmxCmV+xFAttb6+Wr4NZeJRt6Kv68QBIBcbCnjyXlD+oMfZ3
         lqfWt1teVPZOf+JMJqe3qm/1Q52tIHXfw7oRUTaLOzahJ3uG2dSRStj3jm2ioRQnqmEe
         97RA==
X-Forwarded-Encrypted: i=1; AJvYcCWxVxC0F+k+C8oHtLk6/nFMSi2nNmE2ui+IBN3WuHod8M4fRlKWFgJY6tn6TxJUzqh6vl0nlBXbg6owNOg=@vger.kernel.org, AJvYcCXcFGRpu8UmND2bSYLNhhq4i1+fDH+ezYwed8vYIWnJfq7f+4S263Tb4cDDBiA+ARPy4WOgEwakc02wvbZamcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTM6Uz9sjI1qv4OZb2S8VSbcHOelS5bSMEImDcl66GQH6ukwSv
	DpBnGn1Zo8gL88nORWLd61U/2KzeAeWxk7wFl/r2WquWd0yqcgw2H0As
X-Gm-Gg: ASbGncvKSt6wHj77GHEYeTAS4csBRedM9TgS1Q9OSs1qDEzF6zACP0Nqfhzc+VJsW+x
	vtWxi2Osgu5j0xWFRbg0xsRbWFO/+ooaZ7B7BHBDSXTdfI1ePXQYVwmxrYEVoAaEnpQ+heQY0Nm
	kMJrZdBgYPGwcnWihMlE4aV5hdCUjkeSG+WdKuNuA4HotAR9nJAUBxpsXvTV7TT/F5SZLpuWJFV
	GW+WMVHmDWFeqL1c522f6zSYi4FJJ1BStjXj7rQF7eXug5ww15O7OkVZvHocc6eAOmB+nPqrWWM
	lRqPQujlUINvQQ00AgPT7zA2Iqg85wXEg3iKdBxIRp/1wF4uDWTs2xqh8N8kkrTYUrawewzI0Hf
	AP2T4yIRfIJSKyKaorhDBtN9c9eEsS3rrs5DaOHeEEPshkK/48qI+
X-Google-Smtp-Source: AGHT+IFUnAcZKgPEJzAxegF0sH3bpSLMbiIf3Nv77CXThO7J/lrQPfpSdU0L7PmBSSZQCe0w9ha2ww==
X-Received: by 2002:ac8:5916:0:b0:4a7:896:743c with SMTP id d75a77b69052e-4a738e733e1mr64868091cf.0.1749916599279;
        Sat, 14 Jun 2025 08:56:39 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dfec10sm306578985a.33.2025.06.14.08.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:56:38 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 57D311200043;
	Sat, 14 Jun 2025 11:56:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 14 Jun 2025 11:56:38 -0400
X-ME-Sender: <xms:tptNaK3VlsADYTlf3Pqa92l6KxY5Tx5jqyPh4zgA2wI4026CBt33iA>
    <xme:tptNaNGEpM3lQLNW1r9Vjwml0JhFO8KzmJ4RJYFG2jTWUHPjsiHU0YYLkHbWeReHx
    c-0krZi9JHf8-M3LQ>
X-ME-Received: <xmr:tptNaC6rbARL4lBCxjQ19KrGAt-OIFjSe32I3GDVEH_41j47yDvfmXDX-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddvhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:tptNaL2iW3vgpsnUU9Qqco2JdHlr7nkG-Vft6_g78n3nn_uu8L_3Xw>
    <xmx:tptNaNHcuQJ5oUI45DyU9BvbN-NaA8FXNwD2eYvTBUUPsfpVP_DCTg>
    <xmx:tptNaE9nGXXCkqkKthmwLSE8OyoXK_YDLSm3_YIo8NToUvgtA2RgUA>
    <xmx:tptNaCmIE-D11H575SpkGtL-rwC8-UafZBlJHs4H1C0A188uIvqSyA>
    <xmx:tptNaFGcIhHCgej6c1pX4XAiaCo7if6OwVMrYQ4bxzOom0Npecte4VLZ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 11:56:37 -0400 (EDT)
Date: Sat, 14 Jun 2025 08:56:36 -0700
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
Message-ID: <aE2btHiDP5LRmBTL@Mac.home>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
 <aE2P3OBo1Ufjctxy@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE2P3OBo1Ufjctxy@Mac.home>

On Sat, Jun 14, 2025 at 08:06:04AM -0700, Boqun Feng wrote:
> On Sat, Jun 14, 2025 at 10:38:11PM +0900, Alexandre Courbot wrote:
> [...]
> > > +macro_rules! impl_genmask_fn {
> > > +    (
> > > +        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, $genmask_checked:ident, $genmask_unbounded:ident,
> > > +        $(#[$genmask_ex:meta])*
> > > +    ) => {
> > > +        /// Creates a compile-time contiguous bitmask for the given range by
> > > +        /// validating the range at runtime.
> > > +        ///
> > > +        /// Returns [`None`] if the range is invalid, i.e.: if the start is
> > > +        /// greater than or equal to the end.
> > > +        #[inline]
> > > +        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
> > > +            if range.start >= range.end || range.end > <$ty>::BITS {
> > > +                return None;
> > > +            }
> > 
> > From this check I assumed that you interpret `range` as non-inclusive,
> > since `range.end == 32` is valid on u32...
> > 
> > > +            let high = $checked_bit(range.end)?;
> > 
> > ... however IIUC `checked_bit` will return `None` here in such a case.
> > Should the argument be `range.end - 1`?
> > 
> > Your examples do seem to interpret the range as inclusive though, so
> > probably the check should be `|| range.end >= <$ty>::BITS`. But that
> > triggers the question, is it ok to use `Range` that way, when its
> > documentation specifically states that it is bounded exclusively above?
> > We could use `RangeInclusive` to match the semantics, which would
> > require us to write the ranges as `0..=7`. At least it is clear that the
> > upper bound is inclusive.
> > 
> > ... or we make the methods generic against `RangeBounds` and allow both
> > `Range` and `RangeInclusive` to be used. But I'm concerned that callers
> > might use `0..1` thinking it is inclusive while it is not.
> > 
> 
> I think generic over `RangeBounds` is a good idea, and we should
> .is_emtpy() or .contains() instead of comparison + boolean operation
> when possible. Seems we need a function to check whether one range

Ah.. from the other email, genmask_checked() needs to be const, then I
think we cannot use RangeBounds here? Because RangeBounds::start() is 
not a const function.

Regards,
Boqun

> contains another range, which is not available currently?
> 
> I would not be worried about callers treating `0..1` as inclusive: this
> is a Rust project anyway, we need to learn the correct semantics of
> expressions eventually ;-)
> 
> Regards,
> Boqun
> 
> > Thoughts?
> > 
> > > +            let low = $checked_bit(range.start)?;
> > > +            Some((high | (high - 1)) & !(low - 1))
> > > +        }
> > > +
> > > +        /// Creates a compile-time contiguous bitmask for the given range by
> > > +        /// validating the range at runtime.
> > > +        ///
> > > +        /// Returns `0` if the range is invalid, i.e.: if the start is greater
> > > +        /// than or equal to the end.
> > > +        #[inline]
> > > +        pub fn $genmask_unbounded(range: Range<u32>) -> $ty {
> > > +            match $genmask_checked(range) {
> > > +                Some(v) => v,
> > > +                None => 0,
> > > +            }
> [...]
