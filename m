Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9571F37A1;
	Mon, 16 Jun 2025 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083348; cv=pass; b=q3Wxci7RzE/N2kL5HujIXLW4TOcPe7glmkSEYl/DSTzol+87bgUmxmLxN8YskpJ2pnjZQr4zLj2kdOJTaO1BpwBrycoEgfJmcNgV3jfAcnnpue6ErGWtC4RAEmdnnFVKMsXhoAtKd7wFdeYbCtcAeyNb3WHEwxS1tGgozFLwz9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083348; c=relaxed/simple;
	bh=ABPZUeBgb7gYr2fe3auOdhMs+JGavtczNnMWfjbtJWI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WNz1cjqFW+QRI2PdUMClSMwFzURznNrJZcDE83/rXy8xJ/AV9wkEdVg/tik5HYIPMMw1t8QvwNozHWpGjzxNyaHnB2JeT7PX2F6QaDluRG3W0dKnq4swCdarxoYATae43/Mi7nN9yox5XtLvYqoe7tGN2IMnKzP7PYCh9b02ycI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=J9cFAg6D; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="J9cFAg6D"
ARC-Seal: i=1; a=rsa-sha256; t=1750083316; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fPee8SXSjKA1LNjljho5r/p0YNMkj3/TDh23r1j28i9mR4NlnEmq7NqV2Ym51j1yJ1bwGE+gp+aLv5FQkDoEP7MwLDEHretVUP/8s7xU/Lhwz6X0MrYwIKuloxygjUAmF5sFxs7JDKKsCU1z+OKF0gy6CRVw1pTewVGkl7jkdVg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750083316; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LYr79EjyQeYZ1aetrepeTKqMV+Zqb7Wk4jbRJSW83SM=; 
	b=PKJyG0PUda2uhFMaej5wEuG4rWmug/XZ8gtgGsnRxx2m8LbBrFbFmV5JIxJAORdRQwlkjqlE6MgvkRZOZB146yGnX+loiftGLCNJqAPtk3CmqFNAUzSow5f3IkiQeAQWcRE3HEMlcH+9W5jV5sH43Z8WaEQOQ6XT3UwSKezk/2s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750083316;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=LYr79EjyQeYZ1aetrepeTKqMV+Zqb7Wk4jbRJSW83SM=;
	b=J9cFAg6DNc1ah6V5QP2qOVVGiQHZEF/uLrm5r1wUNadtzRkB73uMQ8wcvqAPUs/u
	koNeMIexagsfTZLMlQyZX/mVI/yug0zbBjLW6EfepeaOZaYviKtlwB+5Xc2yC7BuZ1a
	ef07spcD8wqjhrvzFjlgnLwM1FXat8FCopACmcFo=
Received: by mx.zohomail.com with SMTPS id 1750083313701245.23015770749498;
	Mon, 16 Jun 2025 07:15:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
Date: Mon, 16 Jun 2025 11:14:58 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi,

> On 14 Jun 2025, at 10:38, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Hi Daniel,
>=20
> On Tue Jun 10, 2025 at 11:14 PM JST, Daniel Almeida wrote:
>> In light of bindgen being unable to generate bindings for macros, and
>> owing to the widespread use of these macros in drivers, manually =
define
>> the bit and genmask C macros in Rust.
>>=20
>> The *_checked version of the functions provide runtime checking while
>> the const version performs compile-time assertions on the arguments =
via
>> the build_assert!() macro.
>=20
> I think this is the right approach, I wish we could make the functions
> generic but that doesn't appear to be currently possible (and it
> wouldn't make their invocation shorter anyway).
>=20
> I agree with Miguel's suggestion to use paste to shorten the macro
> syntax, it would make it much easier to understand them (and most of =
the
> naming could be harmonized in the macro itself instead of relying on =
the
> invocations to use the same names).
>=20

OK.

[=E2=80=A6]

>>=20
>> diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
>> new file mode 100644
>> index =
0000000000000000000000000000000000000000..98065c8f7c94cfc3b076e041de190e94=
2e1b4a9f
>> --- /dev/null
>> +++ b/rust/kernel/bits.rs
>> @@ -0,0 +1,168 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Bit manipulation macros.
>> +//!
>> +//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
>> +
>> +use crate::build_assert;
>> +use core::ops::Range;
>> +
>> +macro_rules! impl_bit_fn {
>> +    (
>> +        $checked_name:ident, $unbounded_name:ident, =
$const_name:ident, $ty:ty
>> +    ) =3D> {
>> +        /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is =
smaller than
>> +        /// the maximum number of bits supported by the type.
>> +        ///
>> +        /// Returns [`None`] otherwise.
>> +        #[inline]
>> +        pub fn $checked_name(n: u32) -> Option<$ty> {
>> +            (1 as $ty) .checked_shl(n)
>> +        }
>> +
>> +        /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is =
smaller than
>> +        /// the maximum number of bits supported by the type.
>> +        ///
>> +        /// Returns `0` otherwise.
>> +        ///
>> +        /// This is a convenience, as [`Option::unwrap_or`] cannot =
be used in
>> +        /// const-context.
>> +        #[inline]
>> +        pub fn $unbounded_name(n: u32) -> $ty {
>> +            match $checked_name(n) {
>> +                Some(v) =3D> v,
>> +                None =3D> 0,
>> +            }
>=20
> This could more succintly be `$checked_name(n).unwrap_or(0)` (same
> remark for `$genmask_unbounded` below).
>=20

Wait, I just realized that $unbounded_name is not =E2=80=98const fn=E2=80=99=
, so we don=E2=80=99t need this function at all?

Users can simply do `unwrap_or` on their own.

>> +        }
>> +
>> +        /// Computes `1 << n` by performing a compile-time assertion =
that `n` is
>> +        /// in bounds.
>> +        ///
>> +        /// This version is the default and should be used if `n` is =
known at
>> +        /// compile time.
>> +        #[inline]
>> +        pub const fn $const_name(n: u32) -> $ty {
>> +            build_assert!(n < <$ty>::BITS);
>> +            1 as $ty << n
>> +        }
>> +    };
>> +}
>> +
>> +impl_bit_fn!(checked_bit_u64, unbounded_bit_u64, bit_u64, u64);
>> +impl_bit_fn!(checked_bit_u32, unbounded_bit_u32, bit_u32, u32);
>> +impl_bit_fn!(checked_bit_u16, unbounded_bit_u16, bit_u16, u16);
>> +impl_bit_fn!(checked_bit_u8, unbounded_bit_u8, bit_u8, u8);
>> +
>> +macro_rules! impl_genmask_fn {
>> +    (
>> +        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, =
$genmask_checked:ident, $genmask_unbounded:ident,
>> +        $(#[$genmask_ex:meta])*
>> +    ) =3D> {
>> +        /// Creates a compile-time contiguous bitmask for the given =
range by
>> +        /// validating the range at runtime.
>> +        ///
>> +        /// Returns [`None`] if the range is invalid, i.e.: if the =
start is
>> +        /// greater than or equal to the end.
>> +        #[inline]
>> +        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
>> +            if range.start >=3D range.end || range.end > <$ty>::BITS =
{
>> +                return None;
>> +            }
>=20
> =46rom this check I assumed that you interpret `range` as =
non-inclusive,
> since `range.end =3D=3D 32` is valid on u32...
>=20
>> +            let high =3D $checked_bit(range.end)?;
>=20
> ... however IIUC `checked_bit` will return `None` here in such a case.
> Should the argument be `range.end - 1`?
>=20
> Your examples do seem to interpret the range as inclusive though, so
> probably the check should be `|| range.end >=3D <$ty>::BITS`. But that
> triggers the question, is it ok to use `Range` that way, when its
> documentation specifically states that it is bounded exclusively =
above?
> We could use `RangeInclusive` to match the semantics, which would
> require us to write the ranges as `0..=3D7`. At least it is clear that =
the
> upper bound is inclusive.

Sorry, the idea was to indeed interpret a..b as inclusive. I =
specifically
thought we'd suprise a lot of people if we deviated from the way genmask =
works
in C. In other words, I assumed a lot of people would write a..b, when =
what
they meant is a..=3Db.

>=20
> ... or we make the methods generic against `RangeBounds` and allow =
both
> `Range` and `RangeInclusive` to be used. But I'm concerned that =
callers
> might use `0..1` thinking it is inclusive while it is not.
>=20
> Thoughts?

I don't think we can do what you suggested here. I assume that we'd have =
to
rely on [0] and friends, and these are not const fn, so they can=E2=80=99t=
 be used in
the const version of genmask.

>=20
>> +            let low =3D $checked_bit(range.start)?;
>> +            Some((high | (high - 1)) & !(low - 1))
>> +        }
>> +
>> +        /// Creates a compile-time contiguous bitmask for the given =
range by
>> +        /// validating the range at runtime.
>> +        ///
>> +        /// Returns `0` if the range is invalid, i.e.: if the start =
is greater
>> +        /// than or equal to the end.
>> +        #[inline]
>> +        pub fn $genmask_unbounded(range: Range<u32>) -> $ty {
>> +            match $genmask_checked(range) {
>> +                Some(v) =3D> v,
>> +                None =3D> 0,
>> +            }
>=20
> This could more succintly be `$genmask_checked(range).unwrap_or(0)`.

See my comment above. Maybe this function is not needed at all?

>=20
>> +        }
>> +
>> +        /// Creates a compile-time contiguous bitmask for the given =
range by
>> +        /// performing a compile-time assertion that the range is =
valid.
>> +        ///
>> +        /// This version is the default and should be used if the =
range is known
>> +        /// at compile time.
>> +        $(#[$genmask_ex])*
>> +        #[inline]
>> +        pub const fn $genmask(range: Range<u32>) -> $ty {
>> +            build_assert!(range.start < range.end);
>> +            build_assert!(range.end <=3D <$ty>::BITS);
>=20
> I guess this check also needs to be fixed.

Ok.

=E2=80=94 Daniel

[0]: https://doc.rust-lang.org/src/core/ops/range.rs.html#781


