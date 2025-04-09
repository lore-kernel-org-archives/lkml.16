Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BBB21A451
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744237955; cv=none; b=cyCD+UDOjBuomkDT1nDtVnSIPxH37yLbpo0DH4D8NmpVaq3eTcLpv3DyCj57sMjwakyTdafnvf9HW5eu871vQL7rzL7enkDXqnAlqKV0Jq16pNQAmS4061z1niT8ykbNQp2bZs029IJpbvBGlNAW+D2Lxwigfs+Od5/6/9oEXXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744237955; c=relaxed/simple;
	bh=By8viJdoAUoJoi7XSd3M03yuIGRREsQtuwL88PTCdwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGs4a/X+YOol8mdjVrxXGehFa8KbxGozsUSOgasu6orPZ2c0LdETrFx5YgquR9uAU+8OrIyzB/RlTpLM8QBaPn/nnqOyLFWIntxbysSz4bF9teo0wYnUzMehw9RUtmByxMm9umD84cl5BgHFf/+nm11Lk4XEVGM7othRNVOlYHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tc1qAQXY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tc1qAQXY"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso1512a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744237952; x=1744842752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMu1FH4a99+6xCgJv+Tb84Trq4JVQxXXa7kqUK3IbB0=;
        b=tc1qAQXYDH9dtG0Lq3PAf39LIbi8AL15JVsy1Bfqfc1gOnT4OUu/DhTH2xSoadfJ2m
         nWBc+vRBq9HqRfy26lVsQ6id6qgyQM2JWlQnzCc2wCEr+DRP7NbYh/Eqenh6Py+TCpkr
         3uiInRAoESBmm/oAWDtkaYyG4uzzUgCD36bN4XnMcmYiWIq/gdjkeCvT68WEDaXs7Yvj
         sVAilBhl50zNYc/CLEF67pN3Qp6XPPiInlYMVKDvO8Bt6t4Yfyo7ZkU0mKkUVZQtad7w
         j5YCIer26BBK0mk770akmFQ5GqJt/q5swr/RNx5uT9Lz+XBUnjVtDmkm8FJrAgVAlE7b
         /Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744237952; x=1744842752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMu1FH4a99+6xCgJv+Tb84Trq4JVQxXXa7kqUK3IbB0=;
        b=ZGDBGjnOB7AN+ol0eurKelELjUxqxTk7J2N0+TmsWb5MBF87ULHWhS5X/uHp6gfKoc
         Z1iQPy+PUDNF8HMlTbRkB87vXdKNk51MembaReOK6srauNHin9Eb1whnQSs0ZJk29jYT
         80op058XF49gQgwWoeqjXyCV848UasxVhS0W5f251tIRibVaG+wedaOX0faHz6rJOg9m
         L9xFJMADnPH0q8OGyMmpK4Wez5GKECKt1moBJ3Ed90/uB23G2wxK6d7rYjt12KvBR0HY
         2zr8xu58F1z3XTMDGPX692UH3wiFZno1mnTaTiV14yAbVnEzszmYgk66xjmLbWt62bF3
         fLaw==
X-Forwarded-Encrypted: i=1; AJvYcCWTidt/WNqBkOQFxkl0xzOEL5qxdYTOmx0XWrb7eoNs95cxDQAFn8R9rZjIqwEyBF9oXev7r05FpZEzZ+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlC0HKdFk47nJDQ7AS4RVK5sHaRlbK66uz4LJB2zkZqwy8blCw
	Ksf0qd01XDdmUyRVKkREKddllWkAhkBFNCRhnH6/bxosibsmC0PHq6bFxad1KlUh8JIO6VI4LQ0
	lFOYWGj6mcrYoCYAxHDkkKUdhLj4VTZm0TPj4
X-Gm-Gg: ASbGncuVEIFR3kUpKhbUMrUn7stmh8fbW0TFbjJNeXXkRq9JBk58XV1E4SgEGatgNma
	eOydHVpkBUMrqEjsTYPj5YDPx0hn9VrR9nde8UBkLcD10tJsm4AJhSAvC3ZwNjAex9WbSd8W79O
	EKlOiCYFxD8Tpsrthjp6i6cxDGOGqcyvTqC15d9Xl6KLU/R4jwVPuZ
X-Google-Smtp-Source: AGHT+IENolhEXzO3rinX4oLrIHh82oHYmfpNxwGNuU8PEr5id+7uNdCOqNh7a5iRadgkh5271oXOm5pqZaF50y0gefE=
X-Received: by 2002:aa7:dac6:0:b0:5e5:c024:ec29 with SMTP id
 4fb4d7f45d1cf-5f328d6ccdbmr28589a12.0.1744237951690; Wed, 09 Apr 2025
 15:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330234039.29814-1-christiansantoslima21@gmail.com>
In-Reply-To: <20250330234039.29814-1-christiansantoslima21@gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 9 Apr 2025 15:32:19 -0700
X-Gm-Features: ATxdqUHRf-B9-YGZ1PElPo9dmH5T3f12ShZBn14fNGAx_Ks12v9UsYMLEah-Kjo
Message-ID: <CAGSQo00LhscUpQCpL9UwkzK5c1rD1QxutZTOenuZP1d-B==KBQ@mail.gmail.com>
Subject: Re: [PATCH v6] rust: transmute: Add methods for FromBytes trait
To: "Christian S. Lima" <christiansantoslima21@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, ~lkcamp/patches@lists.sr.ht, richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 4:40=E2=80=AFPM Christian S. Lima
<christiansantoslima21@gmail.com> wrote:
>
> Methods receive a slice and perform size check to add a valid way to make
> conversion safe. An Option is used, in error case just return `None`.
>
> The conversion between slices `[T]` is separated from others, because I
> couldn't implement it in the same way as the other conversions.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1119
> Signed-off-by: Christian S. Lima <christiansantoslima21@gmail.com>
> ---
> Changes in v2:
> - Rollback the implementation for the macro in the repository and impleme=
nt
>   methods in trait
> - Link to v2: https://lore.kernel.org/rust-for-linux/20241012193657.290cc=
79c@eugeo/T/#t
>
> Changes in v3:
> - Fix grammar errors
> - Remove repeated tests
> - Fix alignment errors
> - Fix tests not building
> - Link to v3: https://lore.kernel.org/rust-for-linux/20241109055442.85190=
-1-christiansantoslima21@gmail.com/
>
> Changes in v4:
> - Removed core::simd::ToBytes
> - Changed trait and methods to safe Add
> - Result<&Self, Error> in order to make safe methods
> - Link to v4: https://lore.kernel.org/rust-for-linux/20250314034910.13446=
3-1-christiansantoslima21@gmail.com/
>
> Changes in v5:
> - Changed from Result to Option
> - Removed commentaries
> - Returned trait impl to unsafe
> - Link to v5: https://lore.kernel.org/rust-for-linux/20250320014041.10147=
0-1-christiansantoslima21@gmail.com/
>
> Changes in v6:
> - Add endianess check to doc test and use match to check
> success case
> - Reformulated safety comments
> ---
>  rust/kernel/transmute.rs | 89 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 83 insertions(+), 6 deletions(-)
>
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index 1c7d43771a37..16dfa5c7d467 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -9,29 +9,106 @@
>  ///
>  /// It's okay for the type to have padding, as initializing those bytes =
has no effect.
>  ///
> +/// # Example
> +/// ```
> +/// let foo =3D &[1, 2, 3, 4];
> +///
> +/// let result =3D u32::from_bytes(foo);
> +///
> +/// #[cfg(target_endian =3D "little")]
> +/// match result {
> +///     Some(x) =3D> assert_eq!(*x, 0x4030201),
> +///     None =3D> unreachable!()
> +/// }
> +///
> +/// #[cfg(target_endian =3D "big")]
> +/// match result {
> +///     Some(x) =3D> assert_eq!(*x, 0x1020304),
> +///     None =3D> unreachable!()
> +/// }
> +/// ```
> +///
>  /// # Safety
>  ///
>  /// All bit-patterns must be valid for this type. This type must not hav=
e interior mutability.
> -pub unsafe trait FromBytes {}
> +pub unsafe trait FromBytes {
> +    /// Converts a slice of bytes to a reference to `Self` when possible=
.
> +    fn from_bytes(bytes: &[u8]) -> Option<&Self>;
> +
> +    /// Converts a mutable slice of bytes to a reference to `Self` when =
possible.
> +    fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
> +    where
> +        Self: AsBytes;
> +}
>
>  macro_rules! impl_frombytes {
>      ($($({$($generics:tt)*})? $t:ty, )*) =3D> {
>          // SAFETY: Safety comments written in the macro invocation.
> -        $(unsafe impl$($($generics)*)? FromBytes for $t {})*
> +        $(unsafe impl$($($generics)*)? FromBytes for $t {
> +            fn from_bytes(bytes: &[u8]) -> Option<&$t> {

Consider factoring this out into a helper function, e.g.
```
fn from_bytes_sized<T: FromBytes + Sized>(bytes: &[u8]) -> Option<&T> {
```
which you can then call in here. If you were not trying to handle
`?Sized`, we could even put it in the trait default implementation.

> +                if bytes.len() =3D=3D core::mem::size_of::<$t>() {
> +                    let slice_ptr =3D bytes.as_ptr().cast::<$t>();

There's no alignment check, and so the resulting constructed reference
may be misaligned, which is UB. Same below.

> +                    unsafe { Some(&*slice_ptr) }
> +                } else {
> +                    None
> +                }
> +            }
> +
> +            fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut $t>
> +            where
> +            Self: AsBytes,
> +            {
> +                if bytes.len() =3D=3D core::mem::size_of::<$t>() {
> +                    let slice_ptr =3D bytes.as_mut_ptr().cast::<$t>();
> +                    unsafe { Some(&mut *slice_ptr) }
> +                } else {
> +                    None
> +                }
> +            }
> +        })*
>      };
>  }
>
>  impl_frombytes! {
>      // SAFETY: All bit patterns are acceptable values of the types below=
.
> +    // Checking the pointer size makes this operation safe and it's nece=
ssary
> +    // to dereference to get the value and return it as a reference to `=
Self`.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
> -
> -    // SAFETY: If all bit patterns are acceptable for individual values =
in an array, then all bit
> -    // patterns are also acceptable for arrays of that type.
> -    {<T: FromBytes>} [T],
>      {<T: FromBytes, const N: usize>} [T; N],
>  }
>
> +// SAFETY: If all bit patterns are acceptable for individual values in a=
n array, then all bit
> +// patterns are also acceptable for arrays of that type.
> +unsafe impl<T: FromBytes> FromBytes for [T] {
> +    fn from_bytes(bytes: &[u8]) -> Option<&Self> {
> +        let slice_ptr =3D bytes.as_ptr().cast::<T>();
> +        if bytes.len() % core::mem::size_of::<T>() =3D=3D 0 {
> +            let slice_len =3D bytes.len() / core::mem::size_of::<T>();
> +            // SAFETY: Since the code checks the size and can be divided=
 into blocks of size T
> +            // the slice is valid because the size is multiple of T.
> +            unsafe { Some(core::slice::from_raw_parts(slice_ptr, slice_l=
en)) }
> +        } else {
> +            None
> +        }
> +    }
> +
> +    fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
> +    where
> +        Self: AsBytes,
> +    {
> +        let slice_ptr =3D bytes.as_mut_ptr().cast::<T>();
> +        if bytes.len() % core::mem::size_of::<T>() =3D=3D 0 {
> +            let slice_len =3D bytes.len() / core::mem::size_of::<T>();
> +            // SAFETY: Since the code checks the size and can be divided=
 into blocks of size T
> +            // the slice is valid because the size is multiple of T.
> +            unsafe { Some(core::slice::from_raw_parts_mut(slice_ptr, sli=
ce_len)) }
> +        } else {
> +            None
> +        }
> +    }
> +}
> +
>  /// Types that can be viewed as an immutable slice of initialized bytes.
>  ///
>  /// If a struct implements this trait, then it is okay to copy it byte-f=
or-byte to userspace. This
> --
> 2.49.0
>
>
