Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E431E51EB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719092; cv=none; b=uA8ddL8dn3YgIrEJMEFSfeRghRlGOMx5YHaNqMzsGFvU3oiJNSj1lYs9WuV444B1HpKVLZOdQzJIfrmxwSDDAw55z40HoLS5gUMfmkm/e/yxpTTqi2+qF0kuHR67+1V0SKup3DsHOItwNF09CLCKmAMqk0r/LUS5NWdB7m/i8/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719092; c=relaxed/simple;
	bh=E/G+Ma5c3HEoZ6V6jEkOVbUqt0oOEDS4ehHgrAzVM4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVD2Ej1VLb9um0iHdBYp5x4wyUIfLF2W21j29uZ5OFE6OroscaMBakfTICfgbvxk9aseN77S6ytDO2dXB6jR3648C8fky9zu7m/i+tbJY3B4aqapmMVvKsy2dF43mWs4sjJ9U7iVU9vymuKLOWe9WZ+fBB2WHCi/FC9ZcxF7gsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=30tJN71C; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="30tJN71C"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2d4f8c42f49so995326fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749719090; x=1750323890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCmVasf54FJSfgyjNqYu9/T4YHBXvjWI8frtIJ+EEeM=;
        b=30tJN71C9p+g0MmsnoiTxeDK7NllOpRAGkPne1WX4Ey6yQas7lq4bc+Im9t2e0Tt0c
         Z01Gq8pGveiCu55/gpF2A952pQBvToJz7Z1gMjxhQr19hEliProtHg0DErndQhSUn4Zi
         /ctq2QEn+HQ/e/8bgD13zK6KdvFU+mdWG2B/M+SYh9GaxseftEQfXpV6bws9orzF6tBV
         2SHQIRXdi42akOt/S8VI6kQhE7sbNvYH5AfN6Dl0HalY6ezo3FHT3Eu5GZl2H73RTwdO
         oh5WRzJvRMj15PBPnYtS6fsgEXYPNiHi+8IzOyWvW5rGPAxNVGrJ+e98Je7rMPtj4a4R
         d/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719090; x=1750323890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCmVasf54FJSfgyjNqYu9/T4YHBXvjWI8frtIJ+EEeM=;
        b=IHiKBsAmYtLv+j7TKB8pAZQdxh9hR8/7aU7tHUxG4F2txgm4de/EWelfbEY5VtyMyt
         V+8jzd/s1T4K1VbEiUgQcTD4k+nLpvZqSMP8dcNslBU4Y+BlVwYplkyHzsenbTtjVCPA
         3BtkHpBmfkloUOG/oYoA/bVSXJeBHbYqW9rUJ/xhWDbbEdslHOayApWXFJV5YAWzxrsb
         PlB0L5E9yJLbWjrB5X+x59nbgv4u22mq1pXHZPNgfz9+iOVukENqRmY+KZW4vg+9JpCU
         i2lttnjOp094U0Uwsm0oEQhZfhIptTUtFvecUWhYLHtzX1FFZFEPzIPiEEt7gE3UtSzw
         Q1kw==
X-Forwarded-Encrypted: i=1; AJvYcCWolzROWtsgRilVB1LrNtwZ9WKNbLRx8Mf8x6qA/CWnVFodIJfos6QyNTXTHHTOI3+xKvkJOnFtn30s3S8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRlrgPpozxWQmSArvb6eOqJdCLxSrj6HxrSXuUdRsZVXGtxlrM
	fvlGQX59wmuHjTHsn1qn6/mGqdYsLfN15lzJos6HOSlPcuoQC84Tvdx056Ixn+OUvujY9w8UiMT
	MEqRMNog6NpEMUuu1ploENT/8dJKvKV53aPN7tLFz
X-Gm-Gg: ASbGnct93+A91KsvZQYkPmghOCXf4fG3h3BS2BYXUn3I2fZCsRYhQGlRxekDUD5Npfa
	RInKGefsJ36cvAieNdCmGwa3XnGr869tCWD6KlpNmxOfN5smUjbsqz+AcRaVxdfTKNLoEECSFd+
	sqLiyqCnZX65GJFN30XF54RSzxF8uhTsCOUkRrxanBAJnb8MwFZ+bZCiIX67k1jLaNENIcW7cY1
	A==
X-Google-Smtp-Source: AGHT+IGsCe0eHuSCDp/ZATxEgcLgpmzOAzhfbi7k6bUdPkZ8Iaa0NcKwebiu9Q1dLW5iD7RCwdbjitcdPo1Ghda45so=
X-Received: by 2002:a05:6871:4f17:b0:2e4:9c8e:f59c with SMTP id
 586e51a60fabf-2eab440444fmr1039305fac.19.1749719088810; Thu, 12 Jun 2025
 02:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com> <20250611194840.877308-4-bqe@google.com>
 <CAH5fLgi1GBqDHvMh30fbxVUjnTETLXthpK6eGLJA0Vh_TZRnsQ@mail.gmail.com>
 <CACQBu=W4PziG3Fsnzqu_wu-vgBThktD7FcEJ-vOhOMhNDz8h3g@mail.gmail.com> <CAH5fLghV4gYWMyscY2y+TwwqMW_497Sg0sj_HuzNH4nB_5u6Bg@mail.gmail.com>
In-Reply-To: <CAH5fLghV4gYWMyscY2y+TwwqMW_497Sg0sj_HuzNH4nB_5u6Bg@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Thu, 12 Jun 2025 11:04:36 +0200
X-Gm-Features: AX0GCFvLFjwTkqL9rBhxwG-_dzXGQXfs8fCOFdjNJbl3SinDaFDMM4vufd5kjD0
Message-ID: <CACQBu=WiFs=6K78EuTOhe6HR39uXr8ZEKCz=MVNwKoxOV+F+iQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: add bitmap API.
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 10:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Thu, Jun 12, 2025 at 10:47=E2=80=AFAM Burak Emir <bqe@google.com> wrot=
e:
> >
> > On Wed, Jun 11, 2025 at 11:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > >
> > > On Wed, Jun 11, 2025 at 9:48=E2=80=AFPM Burak Emir <bqe@google.com> w=
rote:
> > [...]
> > > > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > > > new file mode 100644
> > > > index 000000000000..1fe72ca980ac
> > > > --- /dev/null
> > > > +++ b/rust/kernel/bitmap.rs
> > > > @@ -0,0 +1,582 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +// Copyright (C) 2025 Google LLC.
> > > > +
> > > > +//! Rust API for bitmap.
> > > > +//!
> > > > +//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bi=
tmap.h).
> > > > +
> > > > +use crate::alloc::{AllocError, Flags};
> > > > +use crate::bindings;
> > > > +#[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
> > > > +use crate::pr_err;
> > > > +use core::ptr::NonNull;
> > > > +
> > > > +/// Represents a C bitmap. Wraps underlying C bitmap API.
> > > > +///
> > > > +/// # Invariants
> > > > +///
> > > > +/// Must reference a `[c_ulong]` long enough to fit `data.len()` b=
its.
> > > > +#[cfg_attr(CONFIG_64BIT, repr(align(8)))]
> > > > +#[cfg_attr(not(CONFIG_64BIT), repr(align(4)))]
> > > > +pub struct CBitmap {
> > > > +    data: [()],
> > > > +}
> > >
> > > I wonder if we should just call this type Bitmap?
> > >
> >
> > OK. I am renaming the other type to OwnedBitmap then.
>
> Just thinking a bit more about naming ... how about calling it
> BitmapVec? Rust generally uses the terminology "Vec" to refer to
> arrays whose size is not known at compile-time, and "Array" when the
> size is known. Then, if we eventually add another type for declaring
> fixed-size bitmaps in Rust, that type can be BitmapArray (that's the
> type you'll want in a global).

It sounds good, better than OwnedBitmap.

My only hesitation is that BitmapVec does not support growing (or realloc).
On the other hand, we could support that in the future so it still makes se=
nse.

cheers,
Burak
