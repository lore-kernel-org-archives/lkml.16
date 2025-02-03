Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14501FFC67;
	Mon,  3 Feb 2025 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576438; cv=none; b=ExWLuFC+JDnthi9KlZ+d0X3B2c9GZTmunlAuVibskqS+MxOvlpRjCJWjky5B7HG3YcFWhUBme4fKYijgOUT2wx5MR11cwtiCuF0tMuZPfFuIOfjgoXwaVWmOB+EGAvGVVVyzVQ9rbIu1NgH/l/0Vtw4hpcrPreyA7Kts8I0zI3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576438; c=relaxed/simple;
	bh=tesu0A/tv1Xw8FBbgxAAWn5a6B9SHzPZC8XK7xjtnTQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H2e0fOfPhjY268V+OBejfuCyUeaoBzQtb8AQwjZtpbzDylKaOm5wOXCg63SClbnSBb/JgyOOcC3TfxNWDJvRII/vhl/OYiK+idcFGYkYpljPshKcmEyfin6wTYHcu2uohFcVW4lPi/qxlJE/KS2f6aO2U9JGmoXSvnQyhjQMvfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=ZTFtFUx1; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="ZTFtFUx1"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738576432; bh=3H5iq9A3tQ3hrA+8GYMBIQFWr4KutMcbtiEaeICkxs4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZTFtFUx139H7TvSqA0wxnR5/OWqcwS1fhiwWGACck4Y0ARngUwg7UL7wQ0y9nM2xl
	 J3MqKp4Aaof7+tBR19wvBuFZK3BCa4AhliLjjrvVLqSc9EvTNJKOFtASjc8rmICQXI
	 rcyLTrzvVlJx5NDc5g5oqu/oD2PFpKHpN4SR+m4U=
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Jann Horn <jannh@google.com>,  Matthew Wilcox <willy@infradead.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  Danilo Krummrich <dakr@kernel.org>,
  Wedson Almeida Filho <wedsonaf@gmail.com>,  Valentin Obst
 <kernel@valentinobst.de>,  Andrew Morton <akpm@linux-foundation.org>,
  linux-mm@kvack.org,  airlied@redhat.com,  Abdiel Janulgue
 <abdiel.janulgue@gmail.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  asahi@lists.linux.dev
Subject: Re: [PATCH 5/6] rust: page: Add physical address conversion functions
In-Reply-To: <20250202-rust-page-v1-5-e3170d7fe55e@asahilina.net> (Asahi
	Lina's message of "Sun, 02 Feb 2025 22:05:47 +0900")
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
	<20250202-rust-page-v1-5-e3170d7fe55e@asahilina.net>
Date: Mon, 03 Feb 2025 10:53:51 +0100
Message-ID: <87jza74amo.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Asahi Lina <lina@asahilina.net> writes:

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
>  rust/kernel/page.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
>
> diff --git a/rust/helpers/page.c b/rust/helpers/page.c
> index b3f2b8fbf87fc9aa89cb1636736c52be16411301..1c3bd68818d77f7ce7806329b8f040a7d4205bb3 100644
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
>  	kunmap_local(addr);
>  }
> +
> +struct page *rust_helper_phys_to_page(phys_addr_t phys)
> +{
> +	return phys_to_page(phys);
> +}
> +
> +phys_addr_t rust_helper_page_to_phys(struct page *page)
> +{
> +	return page_to_phys(page);
> +}
> +
> +unsigned long rust_helper_phys_to_pfn(phys_addr_t phys)
> +{
> +	return __phys_to_pfn(phys);
> +}
> +
> +struct page *rust_helper_pfn_to_page(unsigned long pfn)
> +{
> +	return pfn_to_page(pfn);
> +}
> +
> +bool rust_helper_pfn_valid(unsigned long pfn)
> +{
> +	return pfn_valid(pfn);
> +}
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index fe5f879f9d1a86083fd55c682fad9d52466f79a2..67cd7006fa63ab5aed4c4de2be639ed8e1fbc2ba 100644
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
>              reader.read_raw(unsafe { core::slice::from_raw_parts_mut(dst.cast(), len) })
>          })
>      }
> +
> +    /// Returns the physical address of this page.
> +    pub fn phys(&self) -> PhysicalAddr {

Rust  uses for similar references `as_*` so `as_phys`, would it make
sense to use the same naming format here?

Thanks,
Fiona

> +        // SAFETY: `page` is valid due to the type invariants on `Page`.
> +        unsafe { bindings::page_to_phys(self.as_ptr()) }
> +    }
> +
> +    /// Converts a Rust-owned Page into its physical address.
> +    ///
> +    /// The caller is responsible for calling [`Page::from_phys()`] to avoid leaking memory.
> +    pub fn into_phys(this: Owned<Self>) -> PhysicalAddr {
> +        ManuallyDrop::new(this).phys()
> +    }
> +
> +    /// Converts a physical address to a Rust-owned Page.
> +    ///
> +    /// # Safety
> +    /// The caller must ensure that the physical address was previously returned by a call to
> +    /// [`Page::into_phys()`], and that the physical address is no longer used after this call,
> +    /// nor is [`Page::from_phys()`] called again on it.
> +    pub unsafe fn from_phys(phys: PhysicalAddr) -> Owned<Self> {
> +        // SAFETY: By the safety requirements, the physical address must be valid and
> +        // have come from `into_phys()`, so phys_to_page() cannot fail and
> +        // must return the original struct page pointer.
> +        unsafe { Owned::from_raw(NonNull::new_unchecked(bindings::phys_to_page(phys)).cast()) }
> +    }
> +
> +    /// Borrows a Page from a physical address, without taking over ownership.
> +    ///
> +    /// If the physical address does not have a `struct page` entry or is not
> +    /// part of a System RAM region, returns None.
> +    ///
> +    /// # Safety
> +    /// The caller must ensure that the physical address, if it is backed by a `struct page`,
> +    /// remains available for the duration of the borrowed lifetime.
> +    pub unsafe fn borrow_phys(phys: &PhysicalAddr) -> Option<&Self> {
> +        // SAFETY: This is always safe, as it is just arithmetic
> +        let pfn = unsafe { bindings::phys_to_pfn(*phys) };
> +        // SAFETY: This function is safe to call with any pfn
> +        if !unsafe { bindings::pfn_valid(pfn) && bindings::page_is_ram(pfn) != 0 } {
> +            None
> +        } else {
> +            // SAFETY: We have just checked that the pfn is valid above, so it must
> +            // have a corresponding struct page. By the safety requirements, we can
> +            // return a borrowed reference to it.
> +            Some(unsafe { &*(bindings::pfn_to_page(pfn) as *mut Self as *const Self) })
> +        }
> +    }
> +
> +    /// Borrows a Page from a physical address, without taking over ownership
> +    /// nor checking for validity.
> +    ///
> +    /// # Safety
> +    /// The caller must ensure that the physical address is backed by a `struct page` and
> +    /// corresponds to System RAM. This is true when the address was returned by
> +    /// [`Page::into_phys()`].
> +    pub unsafe fn borrow_phys_unchecked(phys: &PhysicalAddr) -> &Self {
> +        // SAFETY: This is always safe, as it is just arithmetic
> +        let pfn = unsafe { bindings::phys_to_pfn(*phys) };
> +        // SAFETY: The caller guarantees that the pfn is valid. By the safety
> +        // requirements, we can return a borrowed reference to it.
> +        unsafe { &*(bindings::pfn_to_page(pfn) as *mut Self as *const Self) }
> +    }
>  }
>  
>  // SAFETY: `Owned<Page>` objects returned by Page::alloc_page() follow the requirements of
