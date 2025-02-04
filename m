Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70C20C03F;
	Tue,  4 Feb 2025 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669444; cv=none; b=LcBA3FIXkQEGLvSNvkebF1cW5guwdOTLEaXmegHL0GjZvmIQlVyn1UWO6yrm4ZB1xqzQMf+puyOJmKMOzINYnG+V/3Qd34UBd16sXV5zu94D6DqEGbkO2f7wv+s6uvxQmDoaS8ahBnpxmKDbV2odfrN9bx7aiv73ZOhenku4chY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669444; c=relaxed/simple;
	bh=/F/9xibC0lRtfjQqqtMiCSlXX6j4n6Vdw/S7nmMVlaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTaTW5lefJjcshjPyBEJslkpZnQBc4dX+8/KkuzYbHRWXSK4GAkdpRVMuCe7MVZvqadK/VUu2oLLzp6q0OQ8/gjW08qVutAa3WnIrkhwnygtLmkl3DKRw/CkjlnirPU8lK3DDsAz7kKjLgKFDjdCqBJIyatKICqkxX+dzRjCFf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=XxCoVoGC; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="XxCoVoGC"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 274C8431CA;
	Tue,  4 Feb 2025 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738669440;
	bh=/F/9xibC0lRtfjQqqtMiCSlXX6j4n6Vdw/S7nmMVlaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XxCoVoGC8Rb0Dpe/lvOUlgAlE4LvivGAMAazZeHLZWkg5irGrpVKJ/sKTJmIXpkiM
	 ARYrTMYtea0lOb/VLDkjfjN82tR9TZhZrZBPSVaNlzEKleIPCkyj7nXCHCr7xxT7hx
	 y0+lFcg4xVfcwmMDOzC8QBXwy3DYL/gvKiUBzF8TZOqXGlKYMtze1H4lPFSrUd6kJG
	 SqR3tR/9Q5l4K0TGHbWey0KJes5tTrxMbE4UVSqmtpXE572tqSBTuoWT5e6JlUv41r
	 f2BCi8QC/FvaIY4v2ooZDiMcjMV06UGLRazRVhFMC1u/8jiogEsc4Fx8p2/mUVfnXh
	 fzSUoXdHyhajQ==
Message-ID: <c30d12dd-4489-4f6a-b40f-4afa9e0c807f@asahilina.net>
Date: Tue, 4 Feb 2025 20:43:57 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] rust: page: Add physical address conversion functions
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-5-e3170d7fe55e@asahilina.net>
 <CAH5fLgiRC3RHfF+2xH+7Ek+FkXDDDpZopqo-Q20VhkWhTk16Wg@mail.gmail.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <CAH5fLgiRC3RHfF+2xH+7Ek+FkXDDDpZopqo-Q20VhkWhTk16Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/3/25 6:35 PM, Alice Ryhl wrote:
> On Sun, Feb 2, 2025 at 2:06 PM Asahi Lina <lina@asahilina.net> wrote:
>>
>> Add methods to allow code using the Page type to obtain the physical
>> address of a page, convert to and from an (owned) physical address, and
>> borrow a Page from a physical address. Most of these operations are, as
>> you might expect, unsafe.
>>
>> These primitives are useful to implement page table structures in Rust,
>> and to implement arbitrary physical memory access (as needed to walk
>> arbitrary page tables and dereference through them). These mechanisms
>> are, of course, fraught with danger, and are only expected to be used
>> for core memory management code (in e.g. drivers with their own device
>> page table implementations) and for debug features such as crash dumps
>> of device memory.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>>  rust/helpers/page.c | 26 +++++++++++++++++++++
>>  rust/kernel/page.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 91 insertions(+)
>>
>> diff --git a/rust/helpers/page.c b/rust/helpers/page.c
>> index b3f2b8fbf87fc9aa89cb1636736c52be16411301..1c3bd68818d77f7ce7806329b8f040a7d4205bb3 100644
>> --- a/rust/helpers/page.c
>> +++ b/rust/helpers/page.c
>> @@ -1,5 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>
>> +#include <linux/io.h>
>>  #include <linux/gfp.h>
>>  #include <linux/highmem.h>
>>
>> @@ -17,3 +18,28 @@ void rust_helper_kunmap_local(const void *addr)
>>  {
>>         kunmap_local(addr);
>>  }
>> +
>> +struct page *rust_helper_phys_to_page(phys_addr_t phys)
>> +{
>> +       return phys_to_page(phys);
>> +}
>> +
>> +phys_addr_t rust_helper_page_to_phys(struct page *page)
>> +{
>> +       return page_to_phys(page);
>> +}
>> +
>> +unsigned long rust_helper_phys_to_pfn(phys_addr_t phys)
>> +{
>> +       return __phys_to_pfn(phys);
>> +}
>> +
>> +struct page *rust_helper_pfn_to_page(unsigned long pfn)
>> +{
>> +       return pfn_to_page(pfn);
>> +}
>> +
>> +bool rust_helper_pfn_valid(unsigned long pfn)
>> +{
>> +       return pfn_valid(pfn);
>> +}
>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>> index fe5f879f9d1a86083fd55c682fad9d52466f79a2..67cd7006fa63ab5aed4c4de2be639ed8e1fbc2ba 100644
>> --- a/rust/kernel/page.rs
>> +++ b/rust/kernel/page.rs
>> @@ -3,6 +3,7 @@
>>  //! Kernel page allocation and management.
>>
>>  use crate::{
>> +    addr::*,
>>      alloc::{AllocError, Flags},
>>      bindings,
>>      error::code::*,
>> @@ -10,6 +11,7 @@
>>      types::{Opaque, Ownable, Owned},
>>      uaccess::UserSliceReader,
>>  };
>> +use core::mem::ManuallyDrop;
>>  use core::ptr::{self, NonNull};
>>
>>  /// A bitwise shift for the page size.
>> @@ -249,6 +251,69 @@ pub unsafe fn copy_from_user_slice_raw(
>>              reader.read_raw(unsafe { core::slice::from_raw_parts_mut(dst.cast(), len) })
>>          })
>>      }
>> +
>> +    /// Returns the physical address of this page.
>> +    pub fn phys(&self) -> PhysicalAddr {
>> +        // SAFETY: `page` is valid due to the type invariants on `Page`.
>> +        unsafe { bindings::page_to_phys(self.as_ptr()) }
>> +    }
>> +
>> +    /// Converts a Rust-owned Page into its physical address.
>> +    ///
>> +    /// The caller is responsible for calling [`Page::from_phys()`] to avoid leaking memory.
>> +    pub fn into_phys(this: Owned<Self>) -> PhysicalAddr {
>> +        ManuallyDrop::new(this).phys()
>> +    }
>> +
>> +    /// Converts a physical address to a Rust-owned Page.
>> +    ///
>> +    /// # Safety
>> +    /// The caller must ensure that the physical address was previously returned by a call to
>> +    /// [`Page::into_phys()`], and that the physical address is no longer used after this call,
>> +    /// nor is [`Page::from_phys()`] called again on it.
>> +    pub unsafe fn from_phys(phys: PhysicalAddr) -> Owned<Self> {
>> +        // SAFETY: By the safety requirements, the physical address must be valid and
>> +        // have come from `into_phys()`, so phys_to_page() cannot fail and
>> +        // must return the original struct page pointer.
>> +        unsafe { Owned::from_raw(NonNull::new_unchecked(bindings::phys_to_page(phys)).cast()) }
>> +    }
>> +
>> +    /// Borrows a Page from a physical address, without taking over ownership.
>> +    ///
>> +    /// If the physical address does not have a `struct page` entry or is not
>> +    /// part of a System RAM region, returns None.
>> +    ///
>> +    /// # Safety
>> +    /// The caller must ensure that the physical address, if it is backed by a `struct page`,
>> +    /// remains available for the duration of the borrowed lifetime.
>> +    pub unsafe fn borrow_phys(phys: &PhysicalAddr) -> Option<&Self> {
>> +        // SAFETY: This is always safe, as it is just arithmetic
>> +        let pfn = unsafe { bindings::phys_to_pfn(*phys) };
>> +        // SAFETY: This function is safe to call with any pfn
>> +        if !unsafe { bindings::pfn_valid(pfn) && bindings::page_is_ram(pfn) != 0 } {
>> +            None
>> +        } else {
>> +            // SAFETY: We have just checked that the pfn is valid above, so it must
>> +            // have a corresponding struct page. By the safety requirements, we can
>> +            // return a borrowed reference to it.
>> +            Some(unsafe { &*(bindings::pfn_to_page(pfn) as *mut Self as *const Self) })
>> +        }
>> +    }
>> +
>> +    /// Borrows a Page from a physical address, without taking over ownership
>> +    /// nor checking for validity.
>> +    ///
>> +    /// # Safety
>> +    /// The caller must ensure that the physical address is backed by a `struct page` and
>> +    /// corresponds to System RAM. This is true when the address was returned by
>> +    /// [`Page::into_phys()`].
>> +    pub unsafe fn borrow_phys_unchecked(phys: &PhysicalAddr) -> &Self {
> 
> Should this be
> 
> pub unsafe fn borrow_phys_unchecked<'a>(phys: PhysicalAddr) -> &'a Self
> 
> ? That's how the signature of these raw methods usually goes, and then
> your safety requirements say that the requirements must hold for the
> duration of 'a.

The idea was to have *some* lifetime bound on an incoming variable
instead of just being able to return any arbitrary lifetime, but I don't
know if that's something worth doing / idiomatic in any way. Obviously
we can't stop a caller from doing something wrong if they really want to.

> 
>> +        // SAFETY: This is always safe, as it is just arithmetic
>> +        let pfn = unsafe { bindings::phys_to_pfn(*phys) };
>> +        // SAFETY: The caller guarantees that the pfn is valid. By the safety
>> +        // requirements, we can return a borrowed reference to it.
>> +        unsafe { &*(bindings::pfn_to_page(pfn) as *mut Self as *const Self) }
> 
> Can this just be
> 
> &*bindings::pfn_to_page(pfn).cast()

Yeah, I'll fix it for v2!

> 
> ?
> 
> Alice
> 
>> +    }
>>  }
>>
>>  // SAFETY: `Owned<Page>` objects returned by Page::alloc_page() follow the requirements of
>>
>> --
>> 2.47.1
>>
> 

~~ Lina

