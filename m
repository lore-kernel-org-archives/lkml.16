Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B6327B4F1
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359354; cv=none; b=nMPa/qFpvaIAjGvUXkgfSQwQOj0DjPzWkwH05NxHqjMmM/FxcaSRSHmXoQC6QjMKa4tI8Iuy+qyOWTsH1YxyWLDYV1aJp2iTMR7/4PkbVFYKbzgkwn5iViWm1kzpeyqF19DiMbNGdl7p4FfBwtjBPJDzWRT4BX8p8YATyms5OdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359354; c=relaxed/simple;
	bh=hDMrSVIbC4dtjPtVjly7eI79j1pmfpFxQUQZdS8UXoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNbchGVZzcjiE0lC2+FR861V8WqKNHcApgqdS5h9/9Vu1x6aJFiTqfSLYwDCGp0T6FwdcA1hd9TQwbL1Cp36gqRHNtFQuele4s7EAT7tJjA7auXRGyZEP003A7JS0CfqYgLYk2UVrBsm2bIFeUKPWm88H19TD/oDUOy9GHZ+WSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNHaTlEy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNHaTlEy"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a367ec7840so2579941f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748359350; x=1748964150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOkhiPj0Vap+xpfcOCKw5UumtTpYvoVRGFU8ty7tDEU=;
        b=SNHaTlEyasIxuKcgUUmfJlvGcQYTBOkVAzkN0tM5U1RVylH+H3Bg7CNcnqIHWmVh6Q
         D+WSoM6eK3GUOj5m7f32v4G4bEwWPC0l8KiJL1U7Q4PI9OXP0ekal9qPGFhWds7Pphgq
         sVFuSRpc2k2iaplBLZNumI/3tuNNOwPAkSr/oklb1oIvsvr7++fbSb2rmDTicryjvQlD
         b++0hj3H37LIeUMI75WgjxVo05HIh/BwbZACXb0jrbwp8UVEFxCkG//VAReqmtgFEAHv
         usE1jyT12tbE7s52ZdpFXlgi8zAetdjkGKHFQ48S0EtObvP3AemCul5eFpG83omLbyRs
         /YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359350; x=1748964150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOkhiPj0Vap+xpfcOCKw5UumtTpYvoVRGFU8ty7tDEU=;
        b=bRlor+aRgq0E0jWn6oc1aM+RpuRdQAWpTZLV8pzZAxsclBLkBcNUdCNZ+RWDtoK4CJ
         OX+3WyGTjHl/eGLHdZ/9lVEwcg8utjaF6RpM/Kzt/af3yYuZjQ4HwOS8GQ7vWlpnl7On
         GapQqXegBlzeo9vSNd/vzVJWa6CY6Y8DK2hWDbxihYljxVZbCoOz1He6Ez0nht/0DNwb
         Mra7qXhZB6oOU7yBswl40kJ5yLXtqo2xN1XE1WvYf0OdZ5/iNoEkRO/AfV99JtBIDbaz
         l1AJgK4hKfmhOrPeByBXopv2XEBh65MWw+I9ci4mkxDMZuSe9vAKVVXPNsE0jralAriW
         FGwA==
X-Forwarded-Encrypted: i=1; AJvYcCXL8a22IsL1rqUciOUFESKKBKdPA5fCesmxvevH/uJ4i8LNeepRT4HlqWywQlC5Xs9WnYsQZQ5UOZxP2Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxrD+N6ZLZI3dMqHWVH6B4PDNZn8SVd5ywN/fRpDTJCn8zJeN7
	OESt9b/SzQhHNF9qUURSdEzJVXH57T+vNuYJEu58Ph4hnpFNFFlu7tHKwiNH0/4ePgBEn4MkqfP
	5odqb5EqrNoNioqC+cywQ5sXlsV+CAT5sA5kaHqUO
X-Gm-Gg: ASbGnctBkZsM9K3r7keRxjXdpTOhLAufNFVm7RXje69fdqEfhsMIwUkz1yro7sCxGIS
	+CNnwbHAgKBJ4l27xkJ6zqZKR0FLCm97dv8HLMHn2KEiCaHxHMSQ2Nui7CNk4fwR1dPy9Con0tN
	+L1Ky7Sf0bOdfBhZe1JaWK4Q+Cv3AqB3bGCiAOPhp5xcEtU1t4WC2WiAiYz7lu8mKqoZfRAVfJA
	w==
X-Google-Smtp-Source: AGHT+IF2QRgdA1KUJy3arKBaTHAzpkdYnmjcqDIKvkrd4i1tev/OpxTGmJvRf4BU/Eh+VJvTT7e3c3LJB1BsmTeRPtc=
X-Received: by 2002:a05:6000:2411:b0:3a3:67bb:8f46 with SMTP id
 ffacd0b85a97d-3a4cb4c6bd0mr9479677f8f.57.1748359350141; Tue, 27 May 2025
 08:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com> <6835d823.050a0220.93bd2.dbfe@mx.google.com>
In-Reply-To: <6835d823.050a0220.93bd2.dbfe@mx.google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 May 2025 17:22:18 +0200
X-Gm-Features: AX0GCFu7DcBZpojvk4MZQswg8autVII1WSAEmrN3aIauqYTPDDXT0ruaH_xNQ_U
Message-ID: <CAH5fLggWi2yTx2EBVcC_SZ1HBTeu_SJ15NZFa57xws8Z5uEXYw@mail.gmail.com>
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 5:20=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
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
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>
> A question below:
>
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
>
> why are these two inline but the rest not?

Oh, I just forgot to add it.

Alice
