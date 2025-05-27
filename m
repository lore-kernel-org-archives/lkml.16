Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8F8156CA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372974; cv=none; b=jNCIU7eH8EZmYaCEB7sTYjGt/US2ej+l+ubxL5U3GqhRI/iwig+TJ0tpGMOb7AgGkyy+PMGXREX/lBUit8Pyj2KWG5GhvUgcVwoslv2H64Y/OlhRYs5xEzpbqpLqq6TiKfxshpr+uZzGQgVqynB54o68eZ3Ju3Iesc52PDBXpdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372974; c=relaxed/simple;
	bh=bSksGcjPCyanouN+hiN825NWqMc+12BD8rmccNPo5pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKDVl3DWESvSJ6bIrmkxrXBJR5HQIyWcjEN9Ray9201Nc4b8oFCNnyJYYb6Es7Qj99/CylQrcE3FHK+qMda1QM11Vxgt9MYHYNAAEHkakxL5jbqfvRqLDOqLDmaPsJvbmrbA68vbA4yC3m9f4WtkV18jF2Vxw6EhWh3+P1nPhio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R4eoq95I; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R4eoq95I"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a361b8a66cso2494098f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748372970; x=1748977770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dOmAfNz0J4VU50Ta61/Y35bE8/jZsy+ud2vyxXldSk=;
        b=R4eoq95I2bzYlXoWs52GfFsYedFfILrmGqDQdeLWXevVxuzlFz54hvr6UCWt/Yd1q8
         VbO0/wuSZrbgCnCBijxP5aIureUoSWiQOJBiivSJQAgT4b7D+MmwQ4mkH4IfEl73Q3YI
         euxtauxyF/mizrQ6G4Nrjf430nT8RYj+F6yLEXzkdFQjjKtnPdaeNaAUdQYs4KPv7icT
         PR0ws9vcFFpqBN758d1sJvmW+4Dq/e1yF8Dw1layoKticxL7ObcAhKaAcErQqXIud3u/
         oKrhepQq4WcUY52z0ncicSiyiFiTJpkL+9lJIwjQJ5HHlCTAMFj11TskmDsnebDGXKZy
         SKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748372970; x=1748977770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dOmAfNz0J4VU50Ta61/Y35bE8/jZsy+ud2vyxXldSk=;
        b=Tvum/hu1t1RQd4RRhTgDdptXPopOKmMTN+bvzmKuDw52BTQjllp3MifEOFmotlhQ0s
         g4tPDiLNmh0rL8c46tQ3GYe+jraHJMkbmjzAgrYLoOQKwmGCXuXAL/gXFS9+vU5W8drY
         6XNQa2jXE0xWNxrHq5S0RrVUt5qvaB+AUAxvzIDMmWer05sZbOrdM6xlh5j8PvzU/pZN
         rIV0YN2iecl8CNA1NopOhVc2zTiEr6VH2EMRTS44EJ55xfQ31cucjAvZp5vpUlVqNI86
         q+TyxcVDqRfORi61yJeU0VP/wM62Z8BLvMMZc+IdIJK5agBjnHkXPcENlTkqtcJR5j+E
         u9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWkHShZz5581WFC2IAEZHc9xrO0IagIdXQi6bohrRZNrGIdVrVhTB6Zt3NzJB6KcP2Uw46MPmZIw3n3Lc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQOyfLYlQYgM1Djbxy9zmQZ4WhBxri9DvrBs5OCl2i9WrfMXb
	7oXb7q6Y7MTrjLfz2tQF8d4MaJWworHRnwsqbdS8+ufAC//NYTsIkx2z9TlWepwEdzAuplKPOa2
	IfBWZcNQzkr9V3J/slrba4WYVugcfmBpLOc2jHWi7
X-Gm-Gg: ASbGncsMLfho68MzySbjMxAG4BeanWKfsvQ0PheY8Q1q2u68JE0fLJdbpyRaOmEr9Ui
	RCK9JIeC3LvQP+yRhPd1JGg8DVhhxBNR5CqKcvyRQd9+XBYB/MEEL4aUGTWerueukkYEfeCtxxF
	ETwre/CT6amREnUQ2zf+FwDC9iFheHCVSxV068sOCgmCVU
X-Google-Smtp-Source: AGHT+IFaMs2J0Pk1Vh+y4AbilLNsGSVdTuJctlJ92Fw4s5ySbn/+eJa4hgbBty34AVrR49z/yzGO7W42muYFkQOanm8=
X-Received: by 2002:a05:6000:248a:b0:3a4:dd16:a26d with SMTP id
 ffacd0b85a97d-3a4dd16a2e9mr7140516f8f.38.1748372970315; Tue, 27 May 2025
 12:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com> <83969228-bc7c-4eda-8531-53681e7f6600@gmail.com>
In-Reply-To: <83969228-bc7c-4eda-8531-53681e7f6600@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 May 2025 21:09:17 +0200
X-Gm-Features: AX0GCFu4z_K9XSP28dr5yPFTOFud6VBojyX9J8peZUSq3NL6IvZmJ85gmHLKcDg
Message-ID: <CAH5fLggNJ+5CxOAg7q2uQovueum2wznqd5kpUPwH_crtjbMU5w@mail.gmail.com>
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 9:03=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Hi Alice,
>
> On 27.05.25 3:53 PM, Alice Ryhl wrote:
> > In C code we use sparse with the __user annotation to detect cases wher=
e
> > a user pointer is mixed up with other things. To replicate that, we
> > introduce a new struct UserPtr that serves the same purpose using the
> > newtype pattern.
> >
> > The UserPtr type is not marked with #[derive(Debug)], which means that
> > it's not possible to print values of this type. This avoids ASLR
> > leakage.
> >
> > The type is added to the prelude as it is a fairly fundamental type
> > similar to c_int. The wrapping_add() method is renamed to
> > wrapping_byte_add() for consistency with the method name found on raw
> > pointers.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > This is based on top of the strncpy_from_user for Rust patch.
> > ---
> > Changes in v2:
> > - Change usize to raw pointer.
> > - Make field private.
> > - Rename wrapping_add to wrapping_byte_add.
> > - Add to prelude.
> > - Rebase on v4 of strncpy_from_user
> > - Link to v1: https://lore.kernel.org/r/20250506-userptr-newtype-v1-1-a=
0f6f8ce9fc5@google.com
> > ---
> >  rust/kernel/prelude.rs           |  2 ++
> >  rust/kernel/uaccess.rs           | 68 ++++++++++++++++++++++++++++++++=
+-------
> >  samples/rust/rust_misc_device.rs |  2 ++
> >  3 files changed, 60 insertions(+), 12 deletions(-)
> >
> > diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> > index baa774a351ceeb995a2a647f78a27b408d9f3834..081af5bc07b0bcefb1da16e=
5a81fc611b3178aea 100644
> > --- a/rust/kernel/prelude.rs
> > +++ b/rust/kernel/prelude.rs
> > @@ -41,3 +41,5 @@
> >  pub use super::init::InPlaceInit;
> >
> >  pub use super::current;
> > +
> > +pub use super::uaccess::UserPtr;
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index e6534b52a1920254d61f8349426d4cdb38286089..02e0561eb1c6f4d813a4ab1=
3a124bfac2d2a5c75 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -14,8 +14,48 @@
> >  };
> >  use core::mem::{size_of, MaybeUninit};
> >
> > -/// The type used for userspace addresses.
> > -pub type UserPtr =3D usize;
> > +/// A pointer into userspace.
> > +///
> > +/// This is the Rust equivalent to C pointers tagged with `__user`.
> > +#[repr(transparent)]
> > +#[derive(Copy, Clone)]
> > +pub struct UserPtr(*mut c_void);
> > +
> > +impl UserPtr {
> > +    /// Create a `UserPtr` from an integer representing the userspace =
address.
> > +    pub fn from_addr(addr: usize) -> Self {
> > +        Self(addr as *mut c_void)
> > +    }
> > +
> > +    /// Create a `UserPtr` from a pointer representing the userspace a=
ddress.
> > +    pub fn from_ptr(addr: *mut c_void) -> Self {
> > +        Self(addr)
> > +    }
> > +
> > +    /// Cast this userspace pointer to a raw const void pointer.
> > +    ///
> > +    /// It is up to the caller to use the returned pointer correctly.
> > +    #[inline]
> > +    pub fn as_const_ptr(self) -> *const c_void {
> > +        self.0
> > +    }
> > +
> > +    /// Cast this userspace pointer to a raw mutable void pointer.
> > +    ///
> > +    /// It is up to the caller to use the returned pointer correctly.
> > +    #[inline]
> > +    pub fn as_mut_ptr(self) -> *mut c_void {
> > +        self.0
> > +    }
> > +
> > +    /// Increment this user pointer by `add` bytes.
> > +    ///
> > +    /// This addition is wrapping, so wrapping around the address spac=
e does not result in a panic
> > +    /// even if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
> > +    pub fn wrapping_byte_add(self, add: usize) -> UserPtr {
> > +        UserPtr(self.0.wrapping_add(add))
>
> Why use `ptr::wrapping_add` instead of `ptr::wrapping_byte_add`?
>
> Should not really matter in this case, because `c_void` is
> `repr(u8)`, but I find it a bit weird to use `wrapping_add` here.
>
> With that fixed:
>
> Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Ah yeah, this should probably just be wrapping_byte_add() too.
Alice
