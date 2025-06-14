Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDDC18A93C;
	Sat, 14 Jun 2025 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749913569; cv=none; b=oppDq6ujkrE+Zo18WK+aZso0cEFaEIYOar6pRWcXMVAGt5WNaFtw2BPjQmmguhqRIQckK7sAeMmI1mcI6CnKzjARvOwoSDD/+xXbaqRJQBw6OOyp69wuOr/64Xo3+4lfkEphUGjc+MJke5bEo5essuqdGNsmyAFNg7UcFOf9IUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749913569; c=relaxed/simple;
	bh=kLr4URjM+w9kqfntGDnq69cJRi+PrBp3OrVYrX0dALI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvhcMyq+p7zVz90jX6SGEWdSnUkdDyyRB3KhVCrlncvKvc5iBmNVolgXz9rAJk5mTFgVir2KbztTY/WM5BI4X/Vif6r8BRCLNZeNVO5z1t8Xpk4lTkTN8+JvMEYPgPioeJTsuOfW5/UUxAxm+meEcRxZEJIN4V4eTQVPwoIdDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dc8/v9E6; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dc8/v9E6"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d0a2220fb0so358274685a.3;
        Sat, 14 Jun 2025 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749913567; x=1750518367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FY883tDeDFK02dYgCTDMfKIzN7sQKu5S2rGlEnjFJKw=;
        b=dc8/v9E614SX7IJIzLiDECq15m+Z006PzmBB2Pp8pGhUG7wYZETmpAodqKTZ6I9xYc
         b2DIF6UG8rdQ4tBhK63zdzwsiMYlywWTLrIleWQz8P09zqWRX4qK4xolYrTf8KCEdw2N
         SCrlNomC52V/SvmLLfQjl+RbAXOtRxG/btgHAA2NyyvLrX2cen7IqlEshCKbZo/d6ijG
         hwG+v8EWd0HkP+QoR2Jp+7c6fUQ/khX29ogmS7AJZHvieVW4ZTtvYTT0xRPH2n3jeeU2
         JPC45y7MyhSPQGdcfgBWQBw+c5WbwY0g+2OTMfqKFNbyE+Nnzn6g+uNALGn20VjQsH+i
         GG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749913567; x=1750518367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FY883tDeDFK02dYgCTDMfKIzN7sQKu5S2rGlEnjFJKw=;
        b=UeVK8tZljgezyJ/7bhfl33ZDCw9CS80j1k81oBEWRNwxeKIwqpk8xsDrNwUZNcD38Y
         1uZ2X9TZnVab3JdFgp5dfy06whsRhnSlxDfRzAIPf3exJW8oQn40i2PYseI/nc8vgz34
         f1v3pebkZs1winhMYt9e1cjZnVM2/QWOQDptJgXSQOM1SYhb5739Fk1WNwgX5qtsc9nL
         VXb2BZyPfSiE1oF7WX2QxZVBUw843WLD/CYeSbSHAavu7Km5y9a3/4HLgQfbBPYEohrg
         gEV55d0SxzeRK9cZz3qJ2qdF/4oFd6L4VehHjalO81A5UpUETOu6BW7dX5KAx6Z5Eloo
         P4fA==
X-Forwarded-Encrypted: i=1; AJvYcCWhDSX6Nwi2GSSf8tDpP1dnIbTDt1OEjqO5Y/Evf1wTEb/AoClB5mxAEzBmWDhtplyl2rxwAnVwaCOfTgpZnJ0=@vger.kernel.org, AJvYcCXYJDTp/LBYSGOthY8iz5MNwR5ZOQGfHe4Jrd8GiOj6jbT88rSvkB+9+HZ2/gYf9EEDlueCp1WwiK5NHTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPg5s0ZmpvrIWDaLjwchd2Fx1ThAmYfyPtPPDIOnNBWDawDfb
	+f1wx569opLvaTygGia4ZwRzs/MtDph1h6igxNW8PIk5XnltzligNMS/
X-Gm-Gg: ASbGncuqK8UT1MJbLIQFqW9i15zZKk5ABFZRcIx/TDeOeJAN0uMeCC2nSihe8f47hpC
	EjsKNeKcF9/ybcGOwptKyhHUOrwYMFhkrtpuPqeRGZY1IDAMmT/tMedhqh3g/dTsMpimVj/ShfP
	NVd0PfVXhp9jglIsCOEbJSNGtZ96KwN7J73kwz7sJICiQOnKOIvEg21278cr7LXZO+CG+vETLwP
	jy7jnerUW4eeVPzAWUMuz2vSXdxm5Dp4QxCZ6GpvON8Pp1NJRIo1qMdPQT0YS/2MXfRm9w4b+rV
	x1awZVhpaSA2mw7NQA+/tkd7bq9oSJwX5gYP1rf00D6Lig7ONAyflQ7UmWXCtD4mXnKYLKUzOE8
	TthDB50gHeTKHt60krq7UlwDTcx2YFltvyfjKkAzDlpfdUMsexK29GX458rhNlrg=
X-Google-Smtp-Source: AGHT+IGiuqNad+dZAeSedV7lIaUIrixthVkVlZrHl2UCXdXlr/q6056d4TdFxr/q7aEkjW4pr0qJdw==
X-Received: by 2002:a05:620a:c41:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3c6c19252mr482964485a.16.1749913566758;
        Sat, 14 Jun 2025 08:06:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dca057sm302648085a.21.2025.06.14.08.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:06:06 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B7E291200069;
	Sat, 14 Jun 2025 11:06:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 14 Jun 2025 11:06:05 -0400
X-ME-Sender: <xms:3Y9NaDP9xMDSrchf4Qamh53qfyZ_lR40sq80YQ1FXWVZBCJz5SM8cw>
    <xme:3Y9NaN-8VfwAn0KaHCZ_TM42uJ3nAKnVal8e_IyAJVmLIto9omNp0ctjRj5QeJMV6
    Y1OniMVIgR2JGzfDg>
X-ME-Received: <xmr:3Y9NaCQdJu_g6EmipeCbnzyuPuRRP8JiFwqmj2c679dTGs40n-53iQEZDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddugecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:3Y9NaHssfGsam_rQ4aFv8r8dF2iSNDBW52LvExioOgygZdYj4LtKOg>
    <xmx:3Y9NaLc2fTvNk4xfgblljzxQf14s9mRo3gMgIPuN67ZapszzwpSAOA>
    <xmx:3Y9NaD1SE3cRBGWX1VVbAZcZfQDHaZc7YaV_qtJtsmD4MWSNJBKNFQ>
    <xmx:3Y9NaH9j9jcZbueb5Uc5JhxSW39onQ2VH166YvbqRJV7sMGByVTXwQ>
    <xmx:3Y9NaO9DERXymnad-X3uZ5x7Ra87ApqSOlS87mjfxZCfvuDjeww6KAGs>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 11:06:05 -0400 (EDT)
Date: Sat, 14 Jun 2025 08:06:04 -0700
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
Message-ID: <aE2P3OBo1Ufjctxy@Mac.home>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>

On Sat, Jun 14, 2025 at 10:38:11PM +0900, Alexandre Courbot wrote:
[...]
> > +macro_rules! impl_genmask_fn {
> > +    (
> > +        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, $genmask_checked:ident, $genmask_unbounded:ident,
> > +        $(#[$genmask_ex:meta])*
> > +    ) => {
> > +        /// Creates a compile-time contiguous bitmask for the given range by
> > +        /// validating the range at runtime.
> > +        ///
> > +        /// Returns [`None`] if the range is invalid, i.e.: if the start is
> > +        /// greater than or equal to the end.
> > +        #[inline]
> > +        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
> > +            if range.start >= range.end || range.end > <$ty>::BITS {
> > +                return None;
> > +            }
> 
> From this check I assumed that you interpret `range` as non-inclusive,
> since `range.end == 32` is valid on u32...
> 
> > +            let high = $checked_bit(range.end)?;
> 
> ... however IIUC `checked_bit` will return `None` here in such a case.
> Should the argument be `range.end - 1`?
> 
> Your examples do seem to interpret the range as inclusive though, so
> probably the check should be `|| range.end >= <$ty>::BITS`. But that
> triggers the question, is it ok to use `Range` that way, when its
> documentation specifically states that it is bounded exclusively above?
> We could use `RangeInclusive` to match the semantics, which would
> require us to write the ranges as `0..=7`. At least it is clear that the
> upper bound is inclusive.
> 
> ... or we make the methods generic against `RangeBounds` and allow both
> `Range` and `RangeInclusive` to be used. But I'm concerned that callers
> might use `0..1` thinking it is inclusive while it is not.
> 

I think generic over `RangeBounds` is a good idea, and we should
.is_emtpy() or .contains() instead of comparison + boolean operation
when possible. Seems we need a function to check whether one range
contains another range, which is not available currently?

I would not be worried about callers treating `0..1` as inclusive: this
is a Rust project anyway, we need to learn the correct semantics of
expressions eventually ;-)

Regards,
Boqun

> Thoughts?
> 
> > +            let low = $checked_bit(range.start)?;
> > +            Some((high | (high - 1)) & !(low - 1))
> > +        }
> > +
> > +        /// Creates a compile-time contiguous bitmask for the given range by
> > +        /// validating the range at runtime.
> > +        ///
> > +        /// Returns `0` if the range is invalid, i.e.: if the start is greater
> > +        /// than or equal to the end.
> > +        #[inline]
> > +        pub fn $genmask_unbounded(range: Range<u32>) -> $ty {
> > +            match $genmask_checked(range) {
> > +                Some(v) => v,
> > +                None => 0,
> > +            }
[...]
