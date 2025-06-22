Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB32513B58B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750630854; cv=none; b=b64Di+bXFAviaX6dAfTKDBiuFbNb0ZLsBYaC4ZTFuhBD5SEW1CTlQRKt924tZTsQzzp5ah32wk4yrcLDu+V4DnNxgyLDcZaGBPKN0Eyc6yjansYx2NzWZjH2s1Eb07uvy4+/5LjlzFG3kuDrwIlccD5B3jLs69ozlrYK11rAyOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750630854; c=relaxed/simple;
	bh=8JSWOuPp4RuighhEQQ5Du79ImNxOBkHNxQNl5DwJpc8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKCLLW1P/RicQdTrO0/sklgx0UxhCaz06EycwuGejjdDjf3M3XCNGwfssfgERXEN6Sy00HOl767NBwgVz+0bb70UM/CCd9vyZbvBP2iokUqokLeAPksHgxe1MOlj5fZ2nBcQaJEOxDzbMiZ3tWUahNkOl0JEhqU4BgFgxBL9k1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Sun, 22 Jun 2025 22:20:30 +0000
To: tamird@gmail.com
From: Antonio Hickey <contact@antoniohickey.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, contact@antoniohickey.com, dakr@kernel.org, danielstonecote@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3 1/2] rust: kernel: create `overflow_assert!` macro
Message-ID: <20250622222023.29071-1-contact@antoniohickey.com>
In-Reply-To: <CAJ-ks9n1SqM_1xAstHQpp8Z7-2JSTkp9zUn8kwZA7OAAqWxQ6Q@mail.gmail.com>
References: <20250621230231.100181-1-contact@antoniohickey.com> <20250621230231.100181-2-contact@antoniohickey.com> <CAJ-ks9n1SqM_1xAstHQpp8Z7-2JSTkp9zUn8kwZA7OAAqWxQ6Q@mail.gmail.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: c64cd4cacca331b94f78d7d2dee124279bb9238b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 22 Jun 13:48, Tamir Duberstein wrote:
> On Sat, Jun 21, 2025 at 7:06=E2=80=AFPM Antonio Hickey
> <contact@antoniohickey.com> wrote:
> > +//! Overflow assert.
>=20
> s/assert/assertion/
>=20
> AFAIK the standard library always uses assertion where a noun is
> needed, and assert where a verb is needed.
>=20

Reasonable, I'll fix this verbage in my next version.

> > +/// Verifies at runtime that an expression is within an expected bound=
.
> > +///
> > +/// This macro is only active when `CONFIG_RUST_OVERFLOW_CHECKS` is en=
abled.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// overflow_assert!(3 <=3D 10);
> > +/// overflow_assert!(5 <=3D 5);
> > +///
> > +/// const X: u8 =3D 5;
> > +/// overflow_assert!(X + 3 < 10);
> > +///
> > +/// const fn f(x: i32) -> i32 {
> > +///     x + 1
> > +/// }
> > +/// overflow_assert!(f(40) < 42);
> > +/// ```
> > +#[macro_export]
> > +macro_rules! overflow_assert {
> > +    ($cond:expr) =3D> {
> > +        if cfg!(CONFIG_RUST_OVERFLOW_CHECKS) {
> > +            ::core::assert!(
> > +                $cond,
> > +                concat!("overflow assertion failed: ", stringify!($con=
d))
>=20
> Can we still allow the caller to pass additional arguments to the
> macro, so that the overflowing value can be emitted? Alternatively if
> the expectation is that this macro is always used with a comparison
> operator perhaps we could have `overflow_assert_lt` and
> `overflow_assert_le` which provide panic messages containing the
> operand values?
>=20

Me and Miguel discussed the `overflow_assert_le` and other variants in=20
my previous v2 patch set[1]. We decided it would be best to just start=20
with a more flexable general expression based variant of the macro for=20
now, and consider other variants later.=20

I agree we should expand this into more specific variants, so it would
document the intent of the assertions even more clearly.

[1] Link to Miguel's comment on a `overflow_assert_le` variant:
https://lore.kernel.org/all/CANiq72mvu54B=3DU+YCUmbFctj_wXgF5zjeE-BB-vHVnAP=
+3mPcQ@mail.gmail.com/

Thanks

