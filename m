Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473803594B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576881; cv=none; b=bAbGlFQYj45ZM3xje2lhY0V2Dt2/1eXOWDNWTYv2kdQo4BEro3Fk3Z2w+TW/o+kDjhqafT0thSnAliMjPvIr+vHQZrE7jnu/zOzD+eUQgYYEafwjsw3elyWwcyF7e+0Zi4D3q7olZo8jw9axyNGUEeGVeGk4sXQys/zs9rIZ60Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576881; c=relaxed/simple;
	bh=kdua4+YQ85GykUIHsDe45i3nydQ0QIA06M4GK2rq+eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrY5+rSR2EYdu23hJzKHUIeOHJmsaeJUrw0Rgo3jJJxty716zHyLTzBJnbZoI8EZ96hmavJ0XNximzZuHRHzBnYFOAgQWpZtxsAAAyjZxg8MDGDTeDoeqH5m4Q8jwx8sfqvbd0rgy2KPSpRuVIgJMg8cD4keGidt1Tbv+mtXh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h+6FB+zg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h+6FB+zg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2353708f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 02:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738576877; x=1739181677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEGNgfB2S/8AjXy/uNgsGPvZS31C4zTjkg+WKJogdi8=;
        b=h+6FB+zgWxmAYXsiRN2XcG8PlGdjL29+43/yB8qNsalDSe3hSvUX4YEtssYMNj8pNn
         ZjyPGe5wU6OgM8+mwSSfUG6KsLEe7RmFs/NJTx5DWMbCE7y1TOGPidLElbkcI2sXJS+S
         BvSVNTWJDNPgPwZOjX3CjOLPdaCYuzTTDzWM/tYigHzqZd6Hq1djfAYlCG4FIEv369Ip
         DXURg13Qo9UJ97E/UcAjnJofHjLtgAH3DkCmD7bChN9rI6sv2QV9efoyBOTkKufW0oM1
         yEpWMnePiqnZlCGd8ac8UBwh8LexhQRygImI5xiJ6EJ1qy7e3hrrVqzgG+gfA+0aVBMA
         25Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738576877; x=1739181677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEGNgfB2S/8AjXy/uNgsGPvZS31C4zTjkg+WKJogdi8=;
        b=hcUzgPUKtGylG9W7M8yKZxgwULibYLxdwEIan0jIrGt1L5mLHDf8sSmbrPkjHCLY0m
         /thAQZUVoflAODFyldzcvoHhkx3c2yel9YwBtL7TFtrO40duxOqEbNDeLRMIw485rt1t
         qPIQ7chhe+TFa5iHmxwclwSAc5NzZW4OGupl5fnumTJGWm+GViWVuKOOMfyuPkyxL98w
         TrifKsuvdhBzhOO063sLwVLvd21/LYSY9HOB36izsItgOvgqu/oWXhFrSvim1pnX2KRL
         H0iaIdK8vYe6I7/zv2vtqjJCihOwa+aPDRlxo/7w7wXtttJsueojj5bwgcdHbr9OKsSr
         v3oA==
X-Forwarded-Encrypted: i=1; AJvYcCVNEU6KFy231mVw6vaZDtQkbHSpjdeII9oXNdUTzlPuDDtVrqNDcJb+GS/1R6F3I6SDFgrb4DI/zFQZNEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZyn1n7SPopkON1T7UgYDDVodXzS9lzcxsQiaKIbvsxxm2OPei
	Z8ViXUYJWRYQ7Y4pRc5FEsZyLBeiaweTUKy5DMKpIGX8XZt5vZLflNoHXsmxZbwLOTrS1wcxeS6
	ruOlhGLygkEb5+OMBNEfiPD564c8tQxjnz3Ta
X-Gm-Gg: ASbGncvN+koW3wqQU39GPLg09Y/9pxhVYs5LPBQjUuWQQoAjWKXY/szKSIbgQcbv6QQ
	0W+gvGyRPTqwgPaVhSKnMVgmgj0VMwqB6vQACmCWyPQOQ9AT42Wf+btotyVW77Qd/8J1eFHclfD
	jjyzaxEc6X9FQdhZ9tiixJYXib
X-Google-Smtp-Source: AGHT+IH3g2mPZEl5GlZ3WLWpDP89LKo0b2KChSH5cl3Q6a9dl/Hpn/AlGzitcM3Z4OiZyJKWLS+CB0K0XadAjdKQxbo=
X-Received: by 2002:a5d:6d02:0:b0:385:f092:e1a with SMTP id
 ffacd0b85a97d-38c5194c3b6mr16768265f8f.11.1738576877295; Mon, 03 Feb 2025
 02:01:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-5-e3170d7fe55e@asahilina.net> <87jza74amo.fsf@kloenk.dev>
In-Reply-To: <87jza74amo.fsf@kloenk.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 11:01:05 +0100
X-Gm-Features: AWEUYZndXPsUdFaaW3upqQnP0AEq9KZD2d2molkEULuOFcYuzceGr2VHgZKEEdM
Message-ID: <CAH5fLgh7gKRpT7wXzkqTwi0rwg+QyzAbqYzt12=85LqduC-oiA@mail.gmail.com>
Subject: Re: [PATCH 5/6] rust: page: Add physical address conversion functions
To: Fiona Behrens <me@kloenk.dev>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 10:54=E2=80=AFAM Fiona Behrens <me@kloenk.dev> wrote=
:
>
> Asahi Lina <lina@asahilina.net> writes:
>
> > Add methods to allow code using the Page type to obtain the physical
> > address of a page, convert to and from an (owned) physical address, and
> > borrow a Page from a physical address. Most of these operations are, as
> > you might expect, unsafe.
> >
> > These primitives are useful to implement page table structures in Rust,
> > and to implement arbitrary physical memory access (as needed to walk
> > arbitrary page tables and dereference through them). These mechanisms
> > are, of course, fraught with danger, and are only expected to be used
> > for core memory management code (in e.g. drivers with their own device
> > page table implementations) and for debug features such as crash dumps
> > of device memory.
> >
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > ---
> >  rust/helpers/page.c | 26 +++++++++++++++++++++
> >  rust/kernel/page.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 91 insertions(+)
> >
> > diff --git a/rust/helpers/page.c b/rust/helpers/page.c
> > index b3f2b8fbf87fc9aa89cb1636736c52be16411301..1c3bd68818d77f7ce780632=
9b8f040a7d4205bb3 100644
> > --- a/rust/helpers/page.c
> > +++ b/rust/helpers/page.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> > +#include <linux/io.h>
> >  #include <linux/gfp.h>
> >  #include <linux/highmem.h>
> >
> > @@ -17,3 +18,28 @@ void rust_helper_kunmap_local(const void *addr)
> >  {
> >       kunmap_local(addr);
> >  }
> > +
> > +struct page *rust_helper_phys_to_page(phys_addr_t phys)
> > +{
> > +     return phys_to_page(phys);
> > +}
> > +
> > +phys_addr_t rust_helper_page_to_phys(struct page *page)
> > +{
> > +     return page_to_phys(page);
> > +}
> > +
> > +unsigned long rust_helper_phys_to_pfn(phys_addr_t phys)
> > +{
> > +     return __phys_to_pfn(phys);
> > +}
> > +
> > +struct page *rust_helper_pfn_to_page(unsigned long pfn)
> > +{
> > +     return pfn_to_page(pfn);
> > +}
> > +
> > +bool rust_helper_pfn_valid(unsigned long pfn)
> > +{
> > +     return pfn_valid(pfn);
> > +}
> > diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> > index fe5f879f9d1a86083fd55c682fad9d52466f79a2..67cd7006fa63ab5aed4c4de=
2be639ed8e1fbc2ba 100644
> > --- a/rust/kernel/page.rs
> > +++ b/rust/kernel/page.rs
> > @@ -3,6 +3,7 @@
> >  //! Kernel page allocation and management.
> >
> >  use crate::{
> > +    addr::*,
> >      alloc::{AllocError, Flags},
> >      bindings,
> >      error::code::*,
> > @@ -10,6 +11,7 @@
> >      types::{Opaque, Ownable, Owned},
> >      uaccess::UserSliceReader,
> >  };
> > +use core::mem::ManuallyDrop;
> >  use core::ptr::{self, NonNull};
> >
> >  /// A bitwise shift for the page size.
> > @@ -249,6 +251,69 @@ pub unsafe fn copy_from_user_slice_raw(
> >              reader.read_raw(unsafe { core::slice::from_raw_parts_mut(d=
st.cast(), len) })
> >          })
> >      }
> > +
> > +    /// Returns the physical address of this page.
> > +    pub fn phys(&self) -> PhysicalAddr {
>
> Rust  uses for similar references `as_*` so `as_phys`, would it make
> sense to use the same naming format here?

The as_ prefix is only used when returning a borrow, which is not the
case here. I think not having a prefix is correct in this case.

https://rust-lang.github.io/api-guidelines/naming.html#ad-hoc-conversions-f=
ollow-as_-to_-into_-conventions-c-conv

Alice
