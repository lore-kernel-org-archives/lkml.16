Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7232BF003;
	Mon, 16 Jun 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084147; cv=none; b=YljKy6A0ogc6IncVAQpQ2xOUGDSgF8rZJxMYrxvZbL4OkXnBsNKEqeuJx4jwgFz2n/Kzaha8M6zwxm0z2TPzMbqO7V83LCGO3vHpPIjvZN3QhfWYE2QG3DJ/YKdG/1cM0OUwP7F62iejh1wGMRog0wKzCBVtcCGnTyQ5YDfZLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084147; c=relaxed/simple;
	bh=4P26GOQA8MQN5s/zE9CQooJ124LCrLhGQy9yaCpz2xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hctdIGgcOuB++qpkxjpWnfreviFuL+NomPmf3i8Ipt3VGacaAvKeVX380ao9aTj7IhH8fqF9C5r/GCUC9POvjUee4Lv0ocznOKMzcI3jYUOVwOw0Ma3mXY5YV0aYfSzXUeaRlCZG4DT2AzypduWnvtWoORVzvoq4Stc1o5XuEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FE9hraOY; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FE9hraOY"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d0a47f6692so512014485a.1;
        Mon, 16 Jun 2025 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750084144; x=1750688944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXs83xwhiYrmq+eKnpfAiFlKZMz75qErwtfGw3cAu+E=;
        b=FE9hraOYSZxdjLB5IZ7YZKWUtWRVSJwxhUPsAH0p27E9Zz/ukA8J/9EPf/StcyC34a
         TVnT1FPBrPNjivQwHhSBYistkNJV2A/EoTOxGiXTKWssEWeh4kTsrJCHyv05byd0QKJ1
         YZ9ZAuaFFTOZdVDkbdxb2f/YAwo05IVQgSkGxy2EuyhTjyBZi3Yw5PRs+v5hk5JXmGct
         ndamW659Z+kXLnyYnv8iYjXyc7XhJaWuiCqq7PvYene0Buhr/pBi+ZC9Ri5w64mGvb6y
         SKQHO/9PLG8JNlniBHjkCtex2Y7Dtb0NYBK0M4Q6N0wy5Vq+AncR5r7lk8o4n4VmMTWu
         YwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084144; x=1750688944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXs83xwhiYrmq+eKnpfAiFlKZMz75qErwtfGw3cAu+E=;
        b=rCPjUNmSTMUVjqEYmqo5ZzelpTE2UkwJMFZBV6/HXWyexjbFLQDI0MyYCTwU6FVTH0
         4Fgw7pP+upvFJ4xkFdCl2HhWoH76Jrh3LLkVnEtVJ56iK8pty/atoc8Hq/4COlryTRRj
         fswUlLNhlb3HOltrKjFFXehaU7XbMrpIdijVcQvBruDZV1qsDm2jXfC0Ecbe+MOa2iLK
         O3jukTjtXgqhj2pPwH5d96Hzz0urO9U3luE77OIvpQZoevA8QUXioyTIqHOqwNi/59ZT
         37CU/lv/qMuoGgwARW7cGOIC+rHWYqD1Xvmm1GNhnXpDANhnHDfFmIj0rlEzyHwk6fH2
         3eew==
X-Forwarded-Encrypted: i=1; AJvYcCW5s5Zq1+HB7KCIlGp0Tw7qX3dm5qXg/iFZSoBVPTFSN7xlQ7RkTCmO5rnt76jsEzi+zhkZ2a7edaXdKLjpIjw=@vger.kernel.org, AJvYcCWjNG3lpvGAKKTU/AYCaZDpBpoYgNQY4Ls4rP7yQDXywfPYbMHAjtlHJpR5koR3Xab1JYGyVk19yPwJo6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcYSlR/qVNS3/jpEvaLbRsEq8Q8CXE9knF08bzpUYcFH8pebqs
	VtI8+dikhyEKOuFk8I0FI6eJ5/qNXND4I+7kQfG3MR4CV47XioiUaznTd3Xw+w==
X-Gm-Gg: ASbGnctcv7PIldaHaZuJRmiCSxenuIc00q+InFFs5kCeZThM+A8KvNTEcm8nR5WIzMQ
	CZ1a5SBdXAwEzdD0VryILCd+LA5hv3QkUXjmTD55ynWusp9gfojr7xV7JgeSY9IW0Ln/hG208/s
	S+8edqWN4hmz2YWewFRqraoRnsMKkHWFEBWdpO6GT8DZoOCxpK8FhK4TNGTbJiexOtpQi+i4ExQ
	CzT3IxKx8HztHGJOszV2a6PoXsTfjRyX9F38GJOPrgMxjFnmvMWu5URoO97F0v40bH0pgudUZ7Z
	LXV9hLXVzAURxr2XTJQyjEiVfZJJW/rMrbkDRGeDiipRR2T2G2EljfhSmg7uG4Wl9dpBczsT793
	roeKyW9JnV9DGQYR5BYdzmjB5em+dAZWumhJZwWyjsvOpQtGLr/BY
X-Google-Smtp-Source: AGHT+IE0y8nlE8gjg2CjUhKeJMAMKvy8aVt0/Q5/nXAp9UnDGnLtaJKoQnNbLh7zC+B/7p71Htp5sQ==
X-Received: by 2002:a05:620a:4690:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d3c6ced959mr1360298385a.39.1750084144342;
        Mon, 16 Jun 2025 07:29:04 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ee3f72sm532144785a.94.2025.06.16.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:29:03 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4FAF71200068;
	Mon, 16 Jun 2025 10:29:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 16 Jun 2025 10:29:03 -0400
X-ME-Sender: <xms:LypQaMyQuRlEjsQgCy090fy20s59ftwM7NwnmDgxb10BSAjsBGpRiQ>
    <xme:LypQaAQLIFicsdxfkUmQfN_g-GyI6IZt-cnhE7ctsV7hTYuMJUA1i0oWP1CAJE5oV
    ZBOk_YtKjCOlaPEUw>
X-ME-Received: <xmr:LypQaOWgmuaz8TijMwjZhlYyxBvsetCY-cPWYDsvwIwm-8trl3vS4qvMTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedugedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtoh
    hllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdr
    tghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehg
    rghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmh
    grihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdr
    mhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:LypQaKirY0qkZeh1I0qzCqGCfCBC29E_1j2oig6gUFLwdLD9DHqZrg>
    <xmx:LypQaODKzGOdnzCKdFpgRJtQU6X5UH108iUw4j9mHyHTenaMBscNpw>
    <xmx:LypQaLI93kOxkI48BatObmEY0omkIVJ_a6Ds0VJLaljzKgH7OWoAZw>
    <xmx:LypQaFDCwz-L3SWFItJojZQlqSTzAu8ULybzQoixDiAJC3PHSp6Pcw>
    <xmx:LypQaOxoXpG42crWP_r_S6NQ0uj3mPLJMSLgfVpdP4RJU2qOPveVCPgz>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 10:29:02 -0400 (EDT)
Date: Mon, 16 Jun 2025 07:29:01 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
Message-ID: <aFAqLYBMHkC_X-dr@Mac.home>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
 <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>

On Mon, Jun 16, 2025 at 11:14:58AM -0300, Daniel Almeida wrote:
> Hi,
> 
[...]
> >> +        }
> >> +
> >> +        /// Computes `1 << n` by performing a compile-time assertion that `n` is
> >> +        /// in bounds.
> >> +        ///
> >> +        /// This version is the default and should be used if `n` is known at
> >> +        /// compile time.
> >> +        #[inline]
> >> +        pub const fn $const_name(n: u32) -> $ty {
> >> +            build_assert!(n < <$ty>::BITS);
> >> +            1 as $ty << n
> >> +        }
> >> +    };
> >> +}
> >> +
> >> +impl_bit_fn!(checked_bit_u64, unbounded_bit_u64, bit_u64, u64);
> >> +impl_bit_fn!(checked_bit_u32, unbounded_bit_u32, bit_u32, u32);
> >> +impl_bit_fn!(checked_bit_u16, unbounded_bit_u16, bit_u16, u16);
> >> +impl_bit_fn!(checked_bit_u8, unbounded_bit_u8, bit_u8, u8);
> >> +
> >> +macro_rules! impl_genmask_fn {
> >> +    (
> >> +        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, $genmask_checked:ident, $genmask_unbounded:ident,
> >> +        $(#[$genmask_ex:meta])*
> >> +    ) => {
> >> +        /// Creates a compile-time contiguous bitmask for the given range by
> >> +        /// validating the range at runtime.
> >> +        ///
> >> +        /// Returns [`None`] if the range is invalid, i.e.: if the start is
> >> +        /// greater than or equal to the end.
> >> +        #[inline]
> >> +        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
> >> +            if range.start >= range.end || range.end > <$ty>::BITS {
> >> +                return None;
> >> +            }
> > 
> > From this check I assumed that you interpret `range` as non-inclusive,
> > since `range.end == 32` is valid on u32...
> > 
> >> +            let high = $checked_bit(range.end)?;
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
> 
> Sorry, the idea was to indeed interpret a..b as inclusive. I specifically

Please don't do this.

> thought we'd suprise a lot of people if we deviated from the way genmask works
> in C. In other words, I assumed a lot of people would write a..b, when what
> they meant is a..=b.
> 

We should tell/educate people to do the right thing, if a..b is not
inclusive in Rust, then we should treat them as non-inclusive in Rust
kernel code. Otherwise you create confusion for no reason. My assumption
is that most people will ask "what's the right way to do this" first
instead of replicating the old way.

Regards,
Boqun

> > 
[...]
