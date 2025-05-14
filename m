Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2C420C038
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261599; cv=none; b=JLBmyxQqq0QhO2KHcmOkLSh7H7BJ3Zi5W9DDhL++ID1sZilYkDR6HhvQLsrolpwhPZ99Ds9VLVJUbYkdtAJM4hMURZVUKujVA4dtqM9AA8ZTm3Meovx1wElEfBDkvH6AaHhBNCAxM9dpnfRQIu+yJTWZrSgEfK86c1bOzuYrw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261599; c=relaxed/simple;
	bh=FtQTm3oxNvJ/l1FwcAmyvIh6lN4Fw3Y5j1lS0sixKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJkysMoqLm85he/rxJbPgmO+Ie0515wKOgsiCnAbqVhpz4aV+cJyWgdKcjqesIVl/1SprmIkYuNUrOrCwxYFpz0Of01sSGrhuDQ4FPSbYJ5MxFFnL25fvuK7xaxVr4m3Vj+puNeMV78SdLeR7qDP5GXci6PhmLiDjuMoz4VpJ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KMj6SQoh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KMj6SQoh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso4068a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747261596; x=1747866396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajK788JZDGFUfelYOxj8uXfAGypj9boxd8OPVuuZGk4=;
        b=KMj6SQohGOxtor+gneddbjVEaM6opt+/eJNYIM2DAorurGugmB6scQsN2/UgrrFc1n
         5l34ubRpqa1o3A0Gw2JOTMmqeJcPaBkIC9X0gkdBHiPDPxV0tXCJkGXLqLErlDpWtamT
         tbTzfelTV0fGPeMfyIg/315Ozv42esIIpkaS39SCTLXgOK98I1rPyoWNtwrZRNKlLL/z
         2iGNd8h5Dpw4qqEqszBot98rxZXAshMVKL0YHcSGVdUcNgz5WK1Nta0B2YxubxLTuduF
         Si5+fyCtO5pVbstRNxM9FzbJ0uJWpJqbWPjtfPO1+2vFEmOf+Y9UuUhHXzz6ObLZyRl7
         OMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261596; x=1747866396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajK788JZDGFUfelYOxj8uXfAGypj9boxd8OPVuuZGk4=;
        b=dxFdA8lnMQeWI19XEe0eoptZhm6RTdKf5jvg5WGPg8vCyx1eVVVGr3XLUAnpHBj7RL
         b117gAfw8huFOo8qfsd/ulQHUMSomxoGMZNi8iLVBU/Nt8OuiFGqlnqYrHssUn9jFn9C
         U9RMnTkhPUK8mbnvmErj5MIejCAJ8gyioN981+P1BRZlHN3dq1xIlSqZdS6gns7PGlPy
         qwHBlE3KLaFHaMG2JOqCmlFVNaEysnlwBIkkXimNhspBCQvA6gtXnS6c+W0zqvcx165K
         9IHg4XAAY0PNxAgIfTRGKYT5p3EUZx62Li8CCdPVAtxEbQ8c+IBtfrwSeX6lZfcBDIsy
         +ghA==
X-Forwarded-Encrypted: i=1; AJvYcCWj1+HMM53eCuaAYnIL4t68G/CXZBvSu07MQPFhmBqnkLe/Z61hmRLweNSLo6+6+dX49BXNBoA0G59C9fM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+mxEn+Sr/IOSaYZzPCMbySROnjloZq5tKLZdCwt7mRRNlinjq
	fgbpbc5m1a6mk/sqorMuShIx8zAilmgeR9J5TnpXtrrxqtuywcQ960Obt0VAJ7bwvPVHw3tN7jY
	lNcXhrgMsuC77UnGxctCyA2fRBATGptwncVG603c+
X-Gm-Gg: ASbGnctUDre/dlWk28uc1GyV8Tydls/GVM29GD32205a2ISw4y5PYj56D17Rk0gvpu/
	mVz5VD6/BsqP5SNt2TLjsq8FQDPu14oGCJ9B27R4GIulo57uAwvvDTqNuAERCZ78yLlJpmcBIdk
	juQgaYKGtxx09r85sBetfULB/19hiN6li5BaeoZKReLwP86zzE/QVJ4UW/27xsLqw=
X-Google-Smtp-Source: AGHT+IGfecSoyspK8L8+g9hqxfDItdcBIBiuhjZMOg8osC4F1/5QLuRdI0pTHJslDrRqhO1yPhpfEUEj1++mmGVrHUA=
X-Received: by 2002:a50:9f44:0:b0:5fc:e6a6:6a34 with SMTP id
 4fb4d7f45d1cf-5ffc9db067cmr33617a12.6.1747261596038; Wed, 14 May 2025
 15:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-1-3e93ce7bb76e@google.com> <57ddf59f8f2ca740b11650360ea7d5356dad7112.camel@nvidia.com>
In-Reply-To: <57ddf59f8f2ca740b11650360ea7d5356dad7112.camel@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 14 May 2025 15:26:24 -0700
X-Gm-Features: AX0GCFua-U5cokvwHDg0ArWsLq4jP7K06ErwyHL95H35likqkuCfUzV0DvJvDfQ
Message-ID: <CAGSQo03rWM8DABQWGfiHwQVbUGC5rXTVvKx5AZhCer58g2A-iA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] rust: debugfs: Bind DebugFS directory creation
To: Timur Tabi <ttabi@nvidia.com>
Cc: "tmgross@umich.edu" <tmgross@umich.edu>, "benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "gary@garyguo.net" <gary@garyguo.net>, 
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"dakr@kernel.org" <dakr@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rafael@kernel.org" <rafael@kernel.org>, "samitolvanen@google.com" <samitolvanen@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 11:46=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> On Mon, 2025-05-05 at 23:51 +0000, Matthew Maurer wrote:
> >
> > +impl<'a> Entry<'a> {
> > +    /// Constructs a new DebugFS [`Entry`] from the underlying pointer=
.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The pointer must either be an error code, `NULL`, or represent=
 a transfer of ownership of
> > a
> > +    /// live DebugFS directory. If this is a child directory or file, =
`'a` must be less than the
> > +    /// lifetime of the parent directory.
> > +    #[cfg(CONFIG_DEBUG_FS)]
> > +    unsafe fn from_ptr(entry: *mut bindings::dentry) -> Self {
> > +        Self {
> > +            entry,
> > +            _phantom: PhantomData,
> > +        }
> > +    }
> > +
> > +    #[cfg(not(CONFIG_DEBUG_FS))]
> > +    fn new() -> Self {
> > +        Self {
> > +            _phantom: PhantomData,
> > +        }
> > +    }
>
> I am new to Rust, so forgive me if this is a dumb question, but it looks =
to me that if
> CONFIG_DEBUG_FS is defined, then you need to call from_ptr() to create a =
new Entry, but if
> CONFIG_DEBUG_FS is not defined, then you need to call new() instead.  Is =
that right?  If so, is that
> really idiomatic?

I could make `from_ptr` take an arbitrary pointer and discard it as
well, but the callsite for `from_ptr` involves calling into the C
bindings to get a pointer back. I can do one of the following:
1. Create a stub function for the CONFIG_DEBUG_FS=3Dn variant of those
functions (since those are in header files, so they need a special
helper) which gets compiled in, and just returns ERR_PTR(ENODEV), call
that, and pass it back in. (This leads to code bloat, though not
much.)
2. Manually call `ptr::dangling()` and pass it to the alt `from_ptr`
that ignores its argument
3. Create and call `::new`.

If I had more call-sites where I had a pointer-like object to put in
there, I'd use a `from_ptr` that discards. I used `::new` just because
it was easier.

>
> In the Dir implementation below, you are careful to call from_ptr() only =
from the CONFIG_DEBUG_FS
> version of create(), and you call new() only from the !CONFIG_DEBUG_FS ve=
rsion of create().  So your
> bases are covered as long as no driver tries to create an Entry from scra=
tch.
>
> But I guess that can't happen because Entry is not public, right?

Correct, `Entry` is a private type.

>
> > +    /// Create a DebugFS subdirectory.
> > +    ///
> > +    /// Subdirectory handles cannot outlive the directory handle they =
were created from.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// let parent =3D Dir::new(c_str!("parent"));
> > +    /// let child =3D parent.subdir(c_str!("child"));
> > +    /// ```
> > +    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b> {
> > +        Dir::create(name, Some(self))
> > +    }
> > +
> > +    /// Create a new directory in DebugFS at the root.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// let debugfs =3D Dir::new(c_str!("parent"));
> > +    /// ```
> > +    pub fn new(name: &CStr) -> Self {
> > +        Dir::create(name, None)
> > +    }
>
> Is there any real value to having two constructors, just to avoid passing=
 None for the one time that
> a root directory will be created?  The C code has no problem passing NULL=
.

Past revisions (and some of Danilo's suggestions on this revision)
required the ability to return different types when a directory was
not a subdir. In earlier versions, because subdirectories were not
automatically cleaned on drop unless opted in, where the root
directory was. In future versions, he would like me to use this to
suppress `Dir::keep` from being callable on root directories.

>
>
