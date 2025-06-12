Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCC41AB6F1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718200; cv=none; b=ZWBwAyDhDEmGvLtuW6rn1oxjWI7rKcsqYBYnxO+Zkwh30oltcJUUk0rgU3p6wewcaghLJ7QBLNrWBH6O4737gPuZ59Jm3XR6MrL6yDhBb9Qg1d+3Rgqym8apQ4yFEFekPHxyw/3GDMtJLvss3S45inli9Kp+gFJWnFcEI5UlHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718200; c=relaxed/simple;
	bh=Tz31FWc8ZSU6ldYx49dpHsfPC5cmR3+X/nnw+nZkGvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1d41/ZH0mHCEGjNsqHZl4zU+OvgwRSVLNKo3YevbTyLGcscYvj7gpW0AlD3o2r7+4Xpi+v2cOgpPCslnjdY0y4RkpNZjS5iDKBzfRj9mzxTVJbFRlk5OLim4TYuq5drn5WjXtlygAhkYXH43H0Fz1fOA4X4OrVL2XWmy1Cc/lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JGDmFSSC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JGDmFSSC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so3308405e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749718197; x=1750322997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuVAAh36fkRqoU5+WrRN9V7KcWrda8Rt/Pe6BIRVzcs=;
        b=JGDmFSSCSzqgimlwTAhwIlay4LeQ/ypez+MZ8tzllXwICqZT8KKb5jfVv0XwI5K+t5
         POFQ24In6PA05H0BCeMTUAtwZP7d/kzTI+5SC5vwFFUyRC+M4chQ92hIOUb/M8H0qFwR
         dUT2a8vo2Z5fQ0LjlKyfMOIndQbhxXHC3ZC7Z5ljBzgWaDCVYN2l2LYYgHyvdSmNsoEO
         kq2nLjhVD4LmgwRxGqa363MQOoE/8gp5wDcn01TijMxKJ5b9PNyCUuUrYp1D4V5pOYI+
         Mg/7Fx7kQZm+fHL6ZN6fKS5BcoKV7xTbjsgwOnrCcmhWt0jsTYjw+Nty66grcZxuMRBw
         n8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749718197; x=1750322997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuVAAh36fkRqoU5+WrRN9V7KcWrda8Rt/Pe6BIRVzcs=;
        b=b6PKsgO3bigyJFVdXrIw2nnr3cTMMH/bUsuQxhglCCq+saK2gQJTIqR/HzWBXAKyZ+
         VPcewxI8NnP9qAqXRxPgI1BokUOBXLfqB/K48cLxPytxNaBzAxWC0bhE3sGpAmwTZrpa
         Wv2otiP4fZTmA5rYd2smON9k/XZDXKau09TVqBu50uvrU7jiYr8yrO5cd71CziXqSx0O
         I24qTsVwChxY/qFxTAmGSPVYVxhU8Ot2yjl7YaNbtzfnT83Uh9H32Jt+FsrWSufGx9lI
         PCn7a0BkLWHvfm7PvKC1NBRRULm0qAMvtPqyMkhe/hxJH/+afYgOdNVsG7iKwpS5Szsf
         gV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdBuKUACsWp6RAwV5EAwJxbUlyVgaYBT/skB/+aZ4wqfgvlWsmXbLFI+bcjnFQ+bRzPA67052AitrGjbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6SO3o3L9JBt4F6bPhM2dkfHioJMEkcVNH9QCHMHQv61ZPlybT
	kxrLYOkYBWQvQ15SpZmX5woVo5BSvhmBK626o+WxhCU/Q025JcwbRDZsDVs8+JaVY+Sx6u91Z+w
	Tv+MMsUzO9zAtbofWsJ9e28fbOHqfmsSnFdmP6jEc
X-Gm-Gg: ASbGnctQoqBBXFoUfv/tE8dwT7WAZXxcEY4/23zmGZuNXdMCkdtT2hviF9hxLKdMo0O
	IChEUwQyw5iCZthG7tt27TxnjR8xiOZ5ivNdHUyI8IG2ij9Ywg+RP54Soz5YOXPW4eyjgnspAIH
	oMtfvrcHuXR4+AUyZxKsRaEGiXEnmOzEKjT2idbYXLyozaHQSYjeFOrdrTbf9TRUp/JD3Hd4w4i
	stTd9k4bAQ/
X-Google-Smtp-Source: AGHT+IHm7NginZE5oMnjujYEo6jg+R4PPqVdxx630Yf+odjyFRxGpbvJieAtccV/DmBp6q1if19zXlSexyIS2kSKvgI=
X-Received: by 2002:a5d:64c9:0:b0:3a3:652d:1638 with SMTP id
 ffacd0b85a97d-3a5586e9619mr5350282f8f.48.1749718197373; Thu, 12 Jun 2025
 01:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com> <20250611194840.877308-4-bqe@google.com>
 <CAH5fLgi1GBqDHvMh30fbxVUjnTETLXthpK6eGLJA0Vh_TZRnsQ@mail.gmail.com> <CACQBu=W4PziG3Fsnzqu_wu-vgBThktD7FcEJ-vOhOMhNDz8h3g@mail.gmail.com>
In-Reply-To: <CACQBu=W4PziG3Fsnzqu_wu-vgBThktD7FcEJ-vOhOMhNDz8h3g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Jun 2025 10:49:45 +0200
X-Gm-Features: AX0GCFvPCLH4mUb2i-_l7Sq7OF8j6-HxDtqlJsvNUK2C-bZxtlXbyZ5Jsfy0DRU
Message-ID: <CAH5fLghV4gYWMyscY2y+TwwqMW_497Sg0sj_HuzNH4nB_5u6Bg@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: add bitmap API.
To: Burak Emir <bqe@google.com>
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

On Thu, Jun 12, 2025 at 10:47=E2=80=AFAM Burak Emir <bqe@google.com> wrote:
>
> On Wed, Jun 11, 2025 at 11:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > On Wed, Jun 11, 2025 at 9:48=E2=80=AFPM Burak Emir <bqe@google.com> wro=
te:
> [...]
> > > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > > new file mode 100644
> > > index 000000000000..1fe72ca980ac
> > > --- /dev/null
> > > +++ b/rust/kernel/bitmap.rs
> > > @@ -0,0 +1,582 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +// Copyright (C) 2025 Google LLC.
> > > +
> > > +//! Rust API for bitmap.
> > > +//!
> > > +//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bitm=
ap.h).
> > > +
> > > +use crate::alloc::{AllocError, Flags};
> > > +use crate::bindings;
> > > +#[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
> > > +use crate::pr_err;
> > > +use core::ptr::NonNull;
> > > +
> > > +/// Represents a C bitmap. Wraps underlying C bitmap API.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// Must reference a `[c_ulong]` long enough to fit `data.len()` bit=
s.
> > > +#[cfg_attr(CONFIG_64BIT, repr(align(8)))]
> > > +#[cfg_attr(not(CONFIG_64BIT), repr(align(4)))]
> > > +pub struct CBitmap {
> > > +    data: [()],
> > > +}
> >
> > I wonder if we should just call this type Bitmap?
> >
>
> OK. I am renaming the other type to OwnedBitmap then.

Just thinking a bit more about naming ... how about calling it
BitmapVec? Rust generally uses the terminology "Vec" to refer to
arrays whose size is not known at compile-time, and "Array" when the
size is known. Then, if we eventually add another type for declaring
fixed-size bitmaps in Rust, that type can be BitmapArray (that's the
type you'll want in a global).

Alice
