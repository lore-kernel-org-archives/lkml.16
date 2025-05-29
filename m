Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348A1C84A5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748549722; cv=none; b=K/XSMO9t74vygweLIbDz7vqHZ8uLVggOtzgbnL7sekLA8OUi5Pt0eJ1oiX28e9FbpzLudfMPSxmk2mYmMSndaRkmfy8JIkMTbOo0KwqELoEywsA/bwFkdSnpkbA6E63mRm3Z3bmpgha5T8lBhxYsnSSgdeW4+aGpr8DQGOVFyg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748549722; c=relaxed/simple;
	bh=7dVbYRCGTXnMV+eXkUt2NetZ9pJcRiCIpyDOU5v+4Uc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bogaXIZ+3R5qrWo4hi5q7xdYfXWeT+qYgSwoGq5f9N11e2CE8VXYFZ0Hnldn13DpnUb7w1qUxcxfeabfdyAbZUvupOAq7zQgpuYyFdYR3WHKW6GqRAwfumsPwaNPOpmS44qhJ8kz3j41F3e01bDSP+0DBEL5kE2uM1cM5WtbQB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=VxlJCV26; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VxlJCV26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1748549711; x=1748808911;
	bh=7dVbYRCGTXnMV+eXkUt2NetZ9pJcRiCIpyDOU5v+4Uc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VxlJCV26E8rWKbDtF7Q8vb4AcNHyrGqWfcGyR2MR/+aK6yJmc4FIvJz2Y9qrL4Sp2
	 kU77onaGcn0sgE8v0bc5lTB7V8SFHumO1BTKh3XtIDtMTQh/wJoLT1cUq5yEeYcu9B
	 pyJ305dumVFvec13nr0VrZw0YaDsHboRladPKLctC1DPMn05kjvcdvr0Uaxbn18SYp
	 pfq6lggx4o4Rt5gmt3Db+Dz9mPlyGthtsHXFRtynhRF7db9kh+tW9ZfKfEyZgCshnE
	 JrD1uiPS+pwlixPfnSNqq/iFZxhlj07mqoeWDJr5DjEPIWKW6eqYoE8jNHGP2iFnj/
	 399ylVKy/4O2Q==
Date: Thu, 29 May 2025 20:15:05 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Pekka Ristola <pekkarr@protonmail.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v9 3/5] rust: add bitmap API.
Message-ID: <5dNbxz3h9v8q8Bt9mp5T8cWrypATF6eDqo7rp4wSQ0l0BqsPb6nvV7XLdfxC3Ex0wb9KyuTkSDXH27jaxwUaQUeHCKcZ8ImWvIpSKzRkQ9Q=@protonmail.com>
In-Reply-To: <aDi-edjArUXl7Mq6@Mac.home>
References: <20250529193850.22210-1-pekkarr@protonmail.com> <aDi-edjArUXl7Mq6@Mac.home>
Feedback-ID: 29854222:user:proton
X-Pm-Message-ID: 5b40222e6092a3af1d26afac6d660b9994841de7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, May 29th, 2025 at 23.07, Boqun Feng <boqun.feng@gmail.com> wro=
te:

> On Thu, May 29, 2025 at 07:42:09PM +0000, Pekka Ristola wrote:
> [...]
>=20
> > > + }
> > > +
> > > + /// Copy `src` into this [`Bitmap`] and set any remaining bits to z=
ero.
> > > + ///
> > > + /// # Examples
> > > + ///
> > > + /// `+ /// use kernel::alloc::{AllocError, flags::GFP_KERNEL}; + //=
/ use kernel::bitmap::Bitmap; + /// + /// let mut long_bitmap =3D Bitmap::n=
ew(256, GFP_KERNEL)?; + // + /// assert_eq!(None, long_bitmap.last_bit()); =
+ // + /// let mut short_bitmap =3D Bitmap::new(16, GFP_KERNEL)?; + // + //=
/ short_bitmap.set_bit(7); + /// long_bitmap.copy_and_extend(&short_bitmap)=
; + /// assert_eq!(Some(7), long_bitmap.last_bit()); + /// + /// # Ok::<(),=
 AllocError>(()) + ///`
> > > + #[inline]
> > > + pub fn copy_and_extend(&mut self, src: &Bitmap) {
> > > + let len =3D core::cmp::min(src.nbits, self.len());
> > > + // SAFETY: access to `self` and `src` is within bounds.
> > > + unsafe {
> > > + bindings::bitmap_copy_and_extend(
> > > + self.as_mut_ptr(),
> > > + src.as_ptr(),
> > > + len as u32,
> > > + self.len() as u32,
> > > + )
> >=20
> > Would this cause a data race if `src` is concurrently (atomically)
> > modified? The C function seems to use a plain `memcpy` which is not ato=
mic.
>=20
>=20
> We need some better documentation on the effect of kernel C's
> `memcpy()`-like functions regarding data races, but in general a kernel
> C's `memcpy` can be treated as a volatile one (or per-byte atomic), so
> it won't cause data race.

Ah, thanks for the clarification.

Pekka
