Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA6274FEB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696871; cv=none; b=Kz0ZzGL6x9JRD8dxWBeZR5odLi7mQ03TpE8lw5CvA9PUGO9Rg9/8eoSOW+ryzJN0UKO/MjhmeK7edBWIg1q6N38YBP3Nyvn+BwQPM3P+7Bf++yDUWXAtiUcLYBPYxkBozo8b49aVFPJi7pCHpSltF8RBX/UcIEKpbQ2BGV/YBgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696871; c=relaxed/simple;
	bh=cykvFx/xC2kpSzHqvr0f2oMiL42N47IdnmcTJIwr6Wk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZOGasI9/F8PnNfahIXhcO9g1ZrTsThgtU+SIW/K8urz01dureWP0lFI/Fzh2vpZq81lqVLg7W6REbzsM+URYpY6/+a0ct6WIyGzcQJycqxBwOlMLx9EiqaG+Pbh//Y84+OEiblMaZsBaTQqxbg5b4aruqqJXYQh2dIJk6H4ipk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=BDUQnEXy; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="BDUQnEXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1744696865; x=1744956065;
	bh=rB8xDnp69TZWlNpoP1ytFmrKVrG4ZdU0O7ge3EeWJ+E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BDUQnEXy5Z5yGNZQWDFPWOqeVbe/b69KK+BjNDsTTnGN/did2vlN9wFMid3yAgzH0
	 HcFowrPa/jCHEnfaREiYoz96yZ9xzQpAagxR+6Ob143mjTuyiS6bS0e4DvVl8spyr+
	 hoPPjEkJ4dmLag5osT+vnysKi7CVOfem/ypVwzsJJKIcxTPS2PfjOExBA4XxMF6Ixk
	 BY9t3aQm1N1ixePrTrzRjpzWumtWhs6pudrzSEAHIa6+0A8+oqAcT0far3rHzmdFHJ
	 aEGysbJ6TDhyrMyVUs6OqUVVB5cMtPagtlM5uvENjhcSdNHaNJ0FEC0jOgojSAaQ0T
	 vEgbXdRp26LEw==
Date: Tue, 15 Apr 2025 06:01:02 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/5] rust: types: Add Ownable/Owned types
Message-ID: <Z_32G0RzXviz_fya@mango>
In-Reply-To: <87o6x5d97m.fsf@kernel.org>
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me> <Ml2H7_ySOyeMcC8pbvvmed1q5GE60kAML1QCXOUWvV_N8f1870LAb1iomjNlfpilMILe6GynzZvKM9cf8SIfZg==@protonmail.internalid> <20250325-unique-ref-v9-1-e91618c1de26@pm.me> <87o6x5d97m.fsf@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: a0c63a9ef1b1faf8c484cedeee18243a606dd78c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250409 1034, Andreas Hindborg wrote:
> Hi Oliver,
>=20

Hi Andreas,

> "Oliver Mangold" <oliver.mangold@pm.me> writes:
>=20
> > From: Asahi Lina <lina@asahilina.net>
> >
> > By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typicall=
y
> > C FFI) type that *may* be owned by Rust, but need not be. Unlike
> > AlwaysRefCounted, this mechanism expects the reference to be unique
> > within Rust, and does not allow cloning.
> >
> > Conceptually, this is similar to a KBox<T>, except that it delegates
> > resource management to the T instead of using a generic allocator.
> >
> > Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@=
asahilina.net/
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > [ om:
> >   - split code into separate file and `pub use` it from types.rs
> >   - make from_raw() and into_raw() public
> >   - fixes to documentation
> > ]
> > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  rust/kernel/lib.rs     |   1 +
> >  rust/kernel/ownable.rs | 117 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  rust/kernel/types.rs   |   2 +
> >  3 files changed, 120 insertions(+)
>=20
> I would suggest moving ownable.rs to rust/kernel/types/ownable.rs and
> then moving `pub mod ownable` to types.rs.

Yes, that makes more sense.

> I am not sure we need the non-null invariant here, since it is an
> invariant of `NonNull`. The rest is fine.

> I would drop 'pointer' in 'a unique `&mut T` ~pointer~' here. '`&mut T`'
> is sufficient alone.

> Like here, I think this is correct (without the pointer wording).

> This part "the underlying object is acquired" is unclear to me. How about=
:
>=20
>   Callers must ensure that *ownership of* the underlying object is acquir=
ed.

Agree. I will fix these.

Best,

Oliver

