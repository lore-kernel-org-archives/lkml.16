Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB03D26ACD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744239697; cv=none; b=X7Ey7Gbu0m1ZQRRRaPQfnTkyfpGoyGHCPKRddM0BG4Im33Hj2x0F8VEs7pO2Ox+P1lww434PMyiRzt1P7LrM6vZo9zjMzR3dgu4KznpXW647gg8601HnNbHIrcMBDIG2JOdf/89lYMeYY0UMmBnaRoae38m8/Fc0342zY02HOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744239697; c=relaxed/simple;
	bh=v81+8plPVTjKx5V9Ug7IsA2Cb0cejEvOk+mV36fGfWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4kiPrSLsC2ylUPHm/BblDbHbr40W3WKWIILks9QK9xlewtYZa/aEsqYeHT6CmdJQlaZjKXefZgKKiY/peG2k8Qpiwu91wuyxV9fUA3FozDC3qqsC1XzrbV09Ts0SmmorQxEC0RbUhv2hH4PjpafhEL5Avq7h1w68ziI2OMLYxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0EjrXCZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0EjrXCZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso1684a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 16:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744239694; x=1744844494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+n/DcrmRkQH4CJPswRtpQnfI+hbqMmOJl5kLBL3r+g=;
        b=T0EjrXCZqAC70DJumZzQuwNefnW8kp5+NcXTFtpQgEEEZpfDJZlxPLI7nINn/BIHY1
         D4Tihrx/CdXG+zdA1xzm6IoTGp1gab9cchda3Bh0pnNgXtpgeR3dBu/UE3w3Lunp45BO
         0iRWduDURZAfMWR6p8zXwwBFyImU229o51tJLaHbcnizVg4BO+ZIdnFtMjZD2Y8hR9Kr
         uB9T61Or4FDf9EeNC/eKGTbGKsg5/nuFmpvuUpvG95XPKEk7nKHtr2hlH5VeKhu9zP7m
         Qt/G9j78cG1OnRNGi1JBbe/IYfBBs+1lCdj7Cv99gicnwHLDrMvzyCh/igL8XDmlFwHy
         DV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744239694; x=1744844494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+n/DcrmRkQH4CJPswRtpQnfI+hbqMmOJl5kLBL3r+g=;
        b=DYMmA+H/StBk4rPt2sYGzthLjSy6/4Ct6DB5ntn2INBVfzSyPAsKrw9jnsxxplzyPI
         hK2lhksBRJMZTWk6lx8CLgucefjwBTwkW7tK3lkxLrKao6HkQxcdzkQ5e3ctkvP2nn1s
         vI9yJhbijLXVZwkn1h3KVsregpu8jTtutzMz7gBt3xjz0RZLxvWcnPROT3Dz5tVYYEpp
         mTM3gYkc2vGd6kPeM/yTtbyMA4xxiXLxWXPqoGqzuKlWxzSdPoLqwOGVuP6bns8oGRoB
         tAizD+m0A3Mmpv9MuU9k/ekhfYBAAN8+x/WdcHo6ETqVgA9yv+GPbi+KVwCv+3sv64dV
         EQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJPwMxf9wR//1wxGr9EKYttn+Q6HBAb6fg940r2OqMjBQKlfMmKO6nXxPBMCQzrWDIMLkZT297knH3wus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7jdt5eBiIkC0pzBMPIa95W03eTw20xEfGD+0NVieh8VabJS/u
	PDEhhwKbdaoH585LhgOwAmVY8YlfXky8HmRoym/Am4Lg9keWynctsgDh4NR8TLrHh6XpLlZgBGO
	r7LNB6lesS8K3+s0Mebg0BTD1X1bScOFXJP8r
X-Gm-Gg: ASbGncv/CT/N3+tQ4BWj7APOY99Ec6UKKDuPd2HeZxxO+hKrnSZNTfyC06rW9/3mFsn
	TvkUImNUroOAhbtV576CITOrCPpPRkhBWfwPB9kiEJJArS87tuhXOu9p6N+We8erF5sdgpxfO80
	Gnd2zC9AUJxndzVnZsdDgz4Sx3ACfR3c97lIK2AS2TJxRXJdRsG5O1
X-Google-Smtp-Source: AGHT+IHfsSjOVfqr810c4rTQSgLQSe24kipruDeYeNVLVqP34rXLnlaZt+6yBROx7ek6sX1EzP3g2J5yWn18aGaFPQM=
X-Received: by 2002:aa7:d8c3:0:b0:5e5:7c1:43bd with SMTP id
 4fb4d7f45d1cf-5f32be85fd1mr3290a12.1.1744239693561; Wed, 09 Apr 2025 16:01:33
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330234039.29814-1-christiansantoslima21@gmail.com> <CAGSQo00LhscUpQCpL9UwkzK5c1rD1QxutZTOenuZP1d-B==KBQ@mail.gmail.com>
In-Reply-To: <CAGSQo00LhscUpQCpL9UwkzK5c1rD1QxutZTOenuZP1d-B==KBQ@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 9 Apr 2025 16:01:21 -0700
X-Gm-Features: ATxdqUH9mG7uIn7HyOxluCgFnMYNCJktKh93c93-W2QUid8n-5Xp8ksDiugQ0TE
Message-ID: <CAGSQo03teSsTa84Mx=4SFRAfa2=irBwgXXoh5eB_Q0RoixrF6Q@mail.gmail.com>
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

On Wed, Apr 9, 2025 at 3:32=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> On Sun, Mar 30, 2025 at 4:40=E2=80=AFPM Christian S. Lima
> <christiansantoslima21@gmail.com> wrote:
> >
> > Methods receive a slice and perform size check to add a valid way to ma=
ke
> > conversion safe. An Option is used, in error case just return `None`.
> >
> > The conversion between slices `[T]` is separated from others, because I
> > couldn't implement it in the same way as the other conversions.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1119
> > Signed-off-by: Christian S. Lima <christiansantoslima21@gmail.com>
> > ---
> > Changes in v2:
> > - Rollback the implementation for the macro in the repository and imple=
ment
> >   methods in trait
> > - Link to v2: https://lore.kernel.org/rust-for-linux/20241012193657.290=
cc79c@eugeo/T/#t
> >
> > Changes in v3:
> > - Fix grammar errors
> > - Remove repeated tests
> > - Fix alignment errors
> > - Fix tests not building
> > - Link to v3: https://lore.kernel.org/rust-for-linux/20241109055442.851=
90-1-christiansantoslima21@gmail.com/
> >
> > Changes in v4:
> > - Removed core::simd::ToBytes
> > - Changed trait and methods to safe Add
> > - Result<&Self, Error> in order to make safe methods
> > - Link to v4: https://lore.kernel.org/rust-for-linux/20250314034910.134=
463-1-christiansantoslima21@gmail.com/
> >
> > Changes in v5:
> > - Changed from Result to Option
> > - Removed commentaries
> > - Returned trait impl to unsafe
> > - Link to v5: https://lore.kernel.org/rust-for-linux/20250320014041.101=
470-1-christiansantoslima21@gmail.com/
> >
> > Changes in v6:
> > - Add endianess check to doc test and use match to check
> > success case
> > - Reformulated safety comments
> > ---
> >  rust/kernel/transmute.rs | 89 +++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 83 insertions(+), 6 deletions(-)
> >
> > diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> > index 1c7d43771a37..16dfa5c7d467 100644
> > --- a/rust/kernel/transmute.rs
> > +++ b/rust/kernel/transmute.rs
> > @@ -9,29 +9,106 @@
> >  ///
> >  /// It's okay for the type to have padding, as initializing those byte=
s has no effect.
> >  ///
> > +/// # Example
> > +/// ```
> > +/// let foo =3D &[1, 2, 3, 4];
> > +///
> > +/// let result =3D u32::from_bytes(foo);
> > +///
> > +/// #[cfg(target_endian =3D "little")]
> > +/// match result {
> > +///     Some(x) =3D> assert_eq!(*x, 0x4030201),
> > +///     None =3D> unreachable!()
> > +/// }
> > +///
> > +/// #[cfg(target_endian =3D "big")]
> > +/// match result {
> > +///     Some(x) =3D> assert_eq!(*x, 0x1020304),
> > +///     None =3D> unreachable!()
> > +/// }
> > +/// ```
> > +///
> >  /// # Safety
> >  ///
> >  /// All bit-patterns must be valid for this type. This type must not h=
ave interior mutability.
> > -pub unsafe trait FromBytes {}
> > +pub unsafe trait FromBytes {
> > +    /// Converts a slice of bytes to a reference to `Self` when possib=
le.
> > +    fn from_bytes(bytes: &[u8]) -> Option<&Self>;
> > +
> > +    /// Converts a mutable slice of bytes to a reference to `Self` whe=
n possible.
> > +    fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
> > +    where
> > +        Self: AsBytes;
> > +}
> >
> >  macro_rules! impl_frombytes {
> >      ($($({$($generics:tt)*})? $t:ty, )*) =3D> {
> >          // SAFETY: Safety comments written in the macro invocation.
> > -        $(unsafe impl$($($generics)*)? FromBytes for $t {})*
> > +        $(unsafe impl$($($generics)*)? FromBytes for $t {
> > +            fn from_bytes(bytes: &[u8]) -> Option<&$t> {
>
> Consider factoring this out into a helper function, e.g.
> ```
> fn from_bytes_sized<T: FromBytes + Sized>(bytes: &[u8]) -> Option<&T> {
> ```
> which you can then call in here. If you were not trying to handle
> `?Sized`, we could even put it in the trait default implementation.
>
> > +                if bytes.len() =3D=3D core::mem::size_of::<$t>() {
> > +                    let slice_ptr =3D bytes.as_ptr().cast::<$t>();
>
> There's no alignment check, and so the resulting constructed reference
> may be misaligned, which is UB. Same below.
>
> > +                    unsafe { Some(&*slice_ptr) }
> > +                } else {
> > +                    None
> > +                }
> > +            }
> > +
> > +            fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut $t>

Sorry, one last thing - could we consider `from_mut_bytes` instead of
`from_bytes_mut` to match the current API of `zerocopy`?

> > +            where
> > +            Self: AsBytes,
> > +            {
> > +                if bytes.len() =3D=3D core::mem::size_of::<$t>() {
> > +                    let slice_ptr =3D bytes.as_mut_ptr().cast::<$t>();
> > +                    unsafe { Some(&mut *slice_ptr) }
> > +                } else {
> > +                    None
> > +                }
> > +            }
> > +        })*
> >      };
> >  }
> >
> >  impl_frombytes! {
> >      // SAFETY: All bit patterns are acceptable values of the types bel=
ow.
> > +    // Checking the pointer size makes this operation safe and it's ne=
cessary
> > +    // to dereference to get the value and return it as a reference to=
 `Self`.
> >      u8, u16, u32, u64, usize,
> >      i8, i16, i32, i64, isize,
> > -
> > -    // SAFETY: If all bit patterns are acceptable for individual value=
s in an array, then all bit
> > -    // patterns are also acceptable for arrays of that type.
> > -    {<T: FromBytes>} [T],
> >      {<T: FromBytes, const N: usize>} [T; N],
> >  }
> >
> > +// SAFETY: If all bit patterns are acceptable for individual values in=
 an array, then all bit
> > +// patterns are also acceptable for arrays of that type.
> > +unsafe impl<T: FromBytes> FromBytes for [T] {
> > +    fn from_bytes(bytes: &[u8]) -> Option<&Self> {
> > +        let slice_ptr =3D bytes.as_ptr().cast::<T>();
> > +        if bytes.len() % core::mem::size_of::<T>() =3D=3D 0 {
> > +            let slice_len =3D bytes.len() / core::mem::size_of::<T>();
> > +            // SAFETY: Since the code checks the size and can be divid=
ed into blocks of size T
> > +            // the slice is valid because the size is multiple of T.
> > +            unsafe { Some(core::slice::from_raw_parts(slice_ptr, slice=
_len)) }
> > +        } else {
> > +            None
> > +        }
> > +    }
> > +
> > +    fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
> > +    where
> > +        Self: AsBytes,
> > +    {
> > +        let slice_ptr =3D bytes.as_mut_ptr().cast::<T>();
> > +        if bytes.len() % core::mem::size_of::<T>() =3D=3D 0 {
> > +            let slice_len =3D bytes.len() / core::mem::size_of::<T>();
> > +            // SAFETY: Since the code checks the size and can be divid=
ed into blocks of size T
> > +            // the slice is valid because the size is multiple of T.
> > +            unsafe { Some(core::slice::from_raw_parts_mut(slice_ptr, s=
lice_len)) }
> > +        } else {
> > +            None
> > +        }
> > +    }
> > +}
> > +
> >  /// Types that can be viewed as an immutable slice of initialized byte=
s.
> >  ///
> >  /// If a struct implements this trait, then it is okay to copy it byte=
-for-byte to userspace. This
> > --
> > 2.49.0
> >
> >
