Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324927F019
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074225; cv=none; b=Z9IxuT80JenaUFP8t5h5FNiuW08+jrjo/Af1EXvqryweKbPXT7UvkyI2VrjbCPZsGDc++am17FQ1ARMDaDWB1eHlL+2eXl7sWiWinNqvODoKu1BVYTBhnuaUbaj53gqKTvOnZdb8besZqEurafcaHBxtc1yp3qiFqu+CZ6zm7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074225; c=relaxed/simple;
	bh=w+aGyaHQbUooXMEC4LmcTYpand8db+ES07IoksrJl70=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHsHE5VAOJiZleYhbO+fnoM8C2TLmu874DwZ1A1Ndy4X8YwKgXPvdCHAjIfn66xPu16g/lNAdV/uR52roj2qQLqd7gEhQlVLS09gppSLEOoK6wQM81lwAPhH+bokRdYzkgr6cJvy2C3okDVdZMqL/Tb4818SGP/d62ciQ9GvoZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=q7AvfoGN; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="q7AvfoGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750074220; x=1750333420;
	bh=jrgVndXu5XzRaBU2/sAHMIDj16KJ7vE+lXdcz2gWtsY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=q7AvfoGNY9B1sFvnRaWSugsK9UCD1scmwdYUz7kzQZ84PprVOPIQazGHH95e95LFd
	 uy3BikelYfK3oO1LkG8ipRU4EHF8MeYX3Eu2zK2nwOvOE74nKopXG9x8Knqnepz9op
	 lkpoQZkIYU5DSSO9iKH0+b/lWXG/Pk+6F9FngZ3hg8Be2quFFmYXhP+kU+NiRluoyR
	 8ct1b/hB4rQvGmwVYZV3MCZp6SXvYGEXYDx6rMl7g5qgUTqU//zDSKxtKdQmZ9HBsw
	 Sxhb6gi0b9TgsIDvR1RSBdi8dPnthIl9ML16VO7suvZ0NwuhiWv5VF7uXh7/KJ0H8w
	 e3o1TEaM7TkiA==
Date: Mon, 16 Jun 2025 11:43:34 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
Message-ID: <aFADYBIYqQjMx118@mango>
In-Reply-To: <87zffvz65x.fsf@kernel.org>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <d6hUddIgwZqRCgQQQV7L2VG4idnic0hOdWqt67Itt_xixs1RI25dMrPZRMyoIe2W_FS4eL6X66J_iclD2aUA0Q==@protonmail.internalid> <20250502-unique-ref-v10-1-25de64c0307f@pm.me> <87zffvz65x.fsf@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 9f7f1b56034ded4ee6841ab627ffb89fe8ac5524
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250502 1157, Andreas Hindborg wrote:
> > +
> > +impl<T: Ownable> Owned<T> {
> > +    /// Creates a new instance of [`Owned`].
> > +    ///
> > +    /// It takes over ownership of the underlying object.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that the underlying object is acquired and=
 can be considered owned by
> > +    /// Rust.
>=20
>=20
> This part "the underlying object is acquired" is unclear to me. How about=
:
>=20
>   Callers must ensure that *ownership of* the underlying object has been
>   acquired. That is, the object can be considered owned by the caller.
>=20
>=20

Yes, made me think about the phrasing, too. But the main point is, that the
object must be considered to be owned by the `Owned<T>` after the function
call, no?

So maybe:

   Callers must ensure that ownership of the underlying object can be
   transfered to the `Owned<T>` and must consider it to be transfered
   after the function call. This usually implies that the object
   most not be accessed through `ptr` anymore.

