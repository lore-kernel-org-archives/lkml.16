Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73C1FBEB2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575340; cv=none; b=kuCOyof6vpG81vHMB6uwjKz7QcEcARbQCjIJIu9SKgqRvqLq5j2pc5LolEMpX8eSIe0pO7hvgFrfktcg2CRL1tEyKw9Am5IpavJl17Z9uR7soKLQQmxPaTXrrqorlgEvyDdKlUAFdFv+QMWk1/HiF/rFwXjeDiifFr+F5MvO6A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575340; c=relaxed/simple;
	bh=n05dHGdQdFDQsNVn0UeK/+mBDnbgqot6XprHDEMOiNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAGlpBxE1whNdNR8ZojeJ7q4jO6uNftn7YU1FIhSUk6NzxrvJPWRZpgUe+uAZRKvVIRRQhn68fNoAOfZdhYNZ/LIQXjl8bmAdJqk4PyuwgiffNalI7gq1Hbj4XjKPLHLHOgQmruIpU/Avm0DUQ44v/bndJ/AHPqurXJhpSNBg3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0FltVlIP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0FltVlIP"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38be3bfb045so3428624f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738575336; x=1739180136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAGCUE13i820gweBIRdTlY3cwxZN3YMksoO7IfRjEXA=;
        b=0FltVlIPzReC1ya1GbpTG5JROF3ImIopIlO/AKIRB1snodFe0JUpjx3Bgs3XUU7Srh
         Qq19kD6haswMV5lZBtHAtKEj6ihxwbGbeMjjBR5o21a+stXlC+OCPdQWdJVrJxpwSFuY
         JXMaVbVTq3HSgtHqmO4p/qP8XThSs1SorZMFt3vYN8gZheLM+Gyn495CUx/6lvC/cgQE
         1BZbi2/NJb4OChhIw1Lei9dzRGOh22VquSUn/K9PmjgRhyU4jFweKTJXWuhR+zzGwC0P
         gftnPh0F29B2ch/AnNtltq0RWqLt/EAun/935hlj4j7dlOrUHWYukngi6Bhn15FdYPGr
         T2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575336; x=1739180136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAGCUE13i820gweBIRdTlY3cwxZN3YMksoO7IfRjEXA=;
        b=dbLRz7KjzZC60r68GIxSA1osX3zyQtnYasdiuiF30SXjoGin1Atxd7yajyPZhUrn4u
         SnEbVzYNB7tj27yAWeJ+aFAVdXjoUEn75JCYxm1fljXn4RNEVuBzRuXYz5CDLDJ7leIt
         n7iMnmm6PoDVS20HO72jJXMhrtj+3Nq8yIZncZI4yCu2NKIz0l7LuOqHe53nJLic0e0F
         98kpRRDXjew8s5nw0AMx8j1acVCDrCFLQZWIQxcpKy1SUGyHb67kvXAimiJsQsCE62K5
         4ziTLCOFUUm9Rrq9qSvdC9R60lMuVXnpPTn5ye7tA89C80vTJ7ipxJN4mnOblnam0H+1
         EYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwREUMmPanUrovjotmtg1WbeNnfuXDvIgiRv2TTNyN3WLMFCI59ADaE2VB/zPXOQcIi39ModblrLX4FfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9TYnKAh7IuyhoJ4Op/kPslcsZvrfnJM3kMmouSVbP5tXgrkQw
	pWk8eXGiIhafvA+6M/Ly3IZxOVuI+u70thiNyyNqaM9vJrhC3aAa5Fz3QrGiaIpWZiyjEkoWY7W
	m6DJIpQhky6AeFSrxuXZ/STkJLHdXNY7ac9YT
X-Gm-Gg: ASbGncsB8y/iR5D7of3qAezH5z1j2BIady+SeJ1O4trtugecC5wN1AWEay5St9+9D/X
	oF0/GiK+PW8bFQiLOPJEHv4HoKjlRGkZJ8JeXJIvO6dqwQpBfbZxgW/qd5jmYnCzS9nfT7rATfY
	aJ6RQyrAUbQNVX1EvWW+3xGfjm
X-Google-Smtp-Source: AGHT+IFV2ERUah2TD2/kP6wJT9HY9fEdAeATVJ+Xaft/21AS/YnAutg4iqnUPMYwT7txa0oOOasZngp82NrdVa86DOs=
X-Received: by 2002:a5d:6d82:0:b0:38b:dc3d:e4bc with SMTP id
 ffacd0b85a97d-38c5a9a3fa2mr13681749f8f.19.1738575335683; Mon, 03 Feb 2025
 01:35:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-5-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-5-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:35:23 +0100
X-Gm-Features: AWEUYZlQZ7OHmwC09KmBnatETxY8tKhdEgNvEV1CTacQkRBgKwreOugRVwipZos
Message-ID: <CAH5fLgiRC3RHfF+2xH+7Ek+FkXDDDpZopqo-Q20VhkWhTk16Wg@mail.gmail.com>
Subject: Re: [PATCH 5/6] rust: page: Add physical address conversion functions
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> Add methods to allow code using the Page type to obtain the physical
> address of a page, convert to and from an (owned) physical address, and
> borrow a Page from a physical address. Most of these operations are, as
> you might expect, unsafe.
>
> These primitives are useful to implement page table structures in Rust,
> and to implement arbitrary physical memory access (as needed to walk
> arbitrary page tables and dereference through them). These mechanisms
> are, of course, fraught with danger, and are only expected to be used
> for core memory management code (in e.g. drivers with their own device
> page table implementations) and for debug features such as crash dumps
> of device memory.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/helpers/page.c | 26 +++++++++++++++++++++
>  rust/kernel/page.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 91 insertions(+)
>
> diff --git a/rust/helpers/page.c b/rust/helpers/page.c
> index b3f2b8fbf87fc9aa89cb1636736c52be16411301..1c3bd68818d77f7ce7806329b=
8f040a7d4205bb3 100644
> --- a/rust/helpers/page.c
> +++ b/rust/helpers/page.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> +#include <linux/io.h>
>  #include <linux/gfp.h>
>  #include <linux/highmem.h>
>
> @@ -17,3 +18,28 @@ void rust_helper_kunmap_local(const void *addr)
>  {
>         kunmap_local(addr);
>  }
> +
> +struct page *rust_helper_phys_to_page(phys_addr_t phys)
> +{
> +       return phys_to_page(phys);
> +}
> +
> +phys_addr_t rust_helper_page_to_phys(struct page *page)
> +{
> +       return page_to_phys(page);
> +}
> +
> +unsigned long rust_helper_phys_to_pfn(phys_addr_t phys)
> +{
> +       return __phys_to_pfn(phys);
> +}
> +
> +struct page *rust_helper_pfn_to_page(unsigned long pfn)
> +{
> +       return pfn_to_page(pfn);
> +}
> +
> +bool rust_helper_pfn_valid(unsigned long pfn)
> +{
> +       return pfn_valid(pfn);
> +}
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index fe5f879f9d1a86083fd55c682fad9d52466f79a2..67cd7006fa63ab5aed4c4de2b=
e639ed8e1fbc2ba 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -3,6 +3,7 @@
>  //! Kernel page allocation and management.
>
>  use crate::{
> +    addr::*,
>      alloc::{AllocError, Flags},
>      bindings,
>      error::code::*,
> @@ -10,6 +11,7 @@
>      types::{Opaque, Ownable, Owned},
>      uaccess::UserSliceReader,
>  };
> +use core::mem::ManuallyDrop;
>  use core::ptr::{self, NonNull};
>
>  /// A bitwise shift for the page size.
> @@ -249,6 +251,69 @@ pub unsafe fn copy_from_user_slice_raw(
>              reader.read_raw(unsafe { core::slice::from_raw_parts_mut(dst=
.cast(), len) })
>          })
>      }
> +
> +    /// Returns the physical address of this page.
> +    pub fn phys(&self) -> PhysicalAddr {
> +        // SAFETY: `page` is valid due to the type invariants on `Page`.
> +        unsafe { bindings::page_to_phys(self.as_ptr()) }
> +    }
> +
> +    /// Converts a Rust-owned Page into its physical address.
> +    ///
> +    /// The caller is responsible for calling [`Page::from_phys()`] to a=
void leaking memory.
> +    pub fn into_phys(this: Owned<Self>) -> PhysicalAddr {
> +        ManuallyDrop::new(this).phys()
> +    }
> +
> +    /// Converts a physical address to a Rust-owned Page.
> +    ///
> +    /// # Safety
> +    /// The caller must ensure that the physical address was previously =
returned by a call to
> +    /// [`Page::into_phys()`], and that the physical address is no longe=
r used after this call,
> +    /// nor is [`Page::from_phys()`] called again on it.
> +    pub unsafe fn from_phys(phys: PhysicalAddr) -> Owned<Self> {
> +        // SAFETY: By the safety requirements, the physical address must=
 be valid and
> +        // have come from `into_phys()`, so phys_to_page() cannot fail a=
nd
> +        // must return the original struct page pointer.
> +        unsafe { Owned::from_raw(NonNull::new_unchecked(bindings::phys_t=
o_page(phys)).cast()) }
> +    }
> +
> +    /// Borrows a Page from a physical address, without taking over owne=
rship.
> +    ///
> +    /// If the physical address does not have a `struct page` entry or i=
s not
> +    /// part of a System RAM region, returns None.
> +    ///
> +    /// # Safety
> +    /// The caller must ensure that the physical address, if it is backe=
d by a `struct page`,
> +    /// remains available for the duration of the borrowed lifetime.
> +    pub unsafe fn borrow_phys(phys: &PhysicalAddr) -> Option<&Self> {
> +        // SAFETY: This is always safe, as it is just arithmetic
> +        let pfn =3D unsafe { bindings::phys_to_pfn(*phys) };
> +        // SAFETY: This function is safe to call with any pfn
> +        if !unsafe { bindings::pfn_valid(pfn) && bindings::page_is_ram(p=
fn) !=3D 0 } {
> +            None
> +        } else {
> +            // SAFETY: We have just checked that the pfn is valid above,=
 so it must
> +            // have a corresponding struct page. By the safety requireme=
nts, we can
> +            // return a borrowed reference to it.
> +            Some(unsafe { &*(bindings::pfn_to_page(pfn) as *mut Self as =
*const Self) })
> +        }
> +    }
> +
> +    /// Borrows a Page from a physical address, without taking over owne=
rship
> +    /// nor checking for validity.
> +    ///
> +    /// # Safety
> +    /// The caller must ensure that the physical address is backed by a =
`struct page` and
> +    /// corresponds to System RAM. This is true when the address was ret=
urned by
> +    /// [`Page::into_phys()`].
> +    pub unsafe fn borrow_phys_unchecked(phys: &PhysicalAddr) -> &Self {

Should this be

pub unsafe fn borrow_phys_unchecked<'a>(phys: PhysicalAddr) -> &'a Self

? That's how the signature of these raw methods usually goes, and then
your safety requirements say that the requirements must hold for the
duration of 'a.

> +        // SAFETY: This is always safe, as it is just arithmetic
> +        let pfn =3D unsafe { bindings::phys_to_pfn(*phys) };
> +        // SAFETY: The caller guarantees that the pfn is valid. By the s=
afety
> +        // requirements, we can return a borrowed reference to it.
> +        unsafe { &*(bindings::pfn_to_page(pfn) as *mut Self as *const Se=
lf) }

Can this just be

&*bindings::pfn_to_page(pfn).cast()

?

Alice

> +    }
>  }
>
>  // SAFETY: `Owned<Page>` objects returned by Page::alloc_page() follow t=
he requirements of
>
> --
> 2.47.1
>
