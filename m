Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4A2777E4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874061; cv=none; b=AyWv5DK3Qlqwf74VSCQaDWKXAzkSP/DvEmAEDp6uTSwohgcbdmRyVIJ/xK0jj1ZMbrhDSccPzMVUDzXdu5S2njpbgjdt0NNcF6FoixKPFUrU5pmLxbaU/wQTNEOJbhO2Met18gg/7bL24WLp69iKyUK0QNDae56w93NDrR3HJG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874061; c=relaxed/simple;
	bh=LsdlC/42pE4V9Y6Nzuv1hDJnzZVdXiyEY91obs/3TbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KoNLHD1cEgRiuBNo1zuuBlRAe6IC2gz4EvQQoIWpEUoylG6BH8e0PLeLi3BbgKcDRtpGWiGPSPDcnaP9CI0BqD6emy/oPXo3TUOjs0HnBjuUK+KwD81eG+awC3gdwNEp24u5W+NrB1eFjiE23vk13bgYKtrPVAOQfBt8biLGBHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZibA7NCC; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZibA7NCC"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso1102415f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751874058; x=1752478858; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJUD6X4GS4YlprJU4Nu4OFQVyc8HR9vGBcNZ8yZyQEE=;
        b=ZibA7NCCEFW4/4IXlVEBS+gzynCtY/TuX3QtWnmY6zPaPfDx76aj+w1gI/eQmGUx3Q
         0VPMorTAiPVTLM2Vy+TsOl66ToeG9nXEhcxwdAgJBHusSBYAGjB2xrYp20jZ8CpC+Eo9
         1dZQmYRcNl/111L8Cz7q9zteeZKhpLe/MNoKaXMIGF7TRAPE25Gl5thEoybqRtaRHoYz
         y8dXZDNA2o+GzxfAEZx8AhpZc2gAKiTmhMwupnRZYV1RAFbj1jcNkvPyArnHzBxT9wtB
         V2YSh7Kw/7f+qiNPWpcDxdwic4pwHWL0hE++TuD3tIDhaH/6sehmOOVqG1Vm0DnQsmSK
         whDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874058; x=1752478858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJUD6X4GS4YlprJU4Nu4OFQVyc8HR9vGBcNZ8yZyQEE=;
        b=Gk6wsPu6kMNiqLzPtHQ9rCCZCpGDkfW8PmH5cY4Yrw8ursQ+dwzd0s2JmV2K4MBNL4
         5HgxcnAf+CnMdiiZtQaCXqlN8GD3lvgJQO3hHMbeaXl0SsEPZ2ZIxj82kB3NZErkQ1Zj
         u0/qRusXY/12MTuRYc7n1JZRs8asg1Xy3o0PKJ3KW6wg1VBh2vJDD7b14INEutIWQv5q
         lWOMJKz9yp2+BVbxBbKF6ONcksKNJgRjEdtuUwr4WYaVFHLZZAfbX8XS8CYRhUK+XQgC
         0Q7jAnRgznkQC+LoFUihg0E4qgFz+vB0Rtwmq8m9+AWL5dFrPmrFvaeGng83hjpwNIEa
         U1xA==
X-Forwarded-Encrypted: i=1; AJvYcCWsYTHgX5yxUVf9Wsk9hB0VWFNVPcHUW8uD5Km8tGHGsyifnUyXOf1DldNcq6CUBEo101wcW/Z6+GrtQKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv4pL6t/UsrswfsADiZKCyvtLLkz9VTzz9YqcfVkPhGstjvm6k
	1l5+hgS0Vfcn6Fw+4S6hitda37iOiohos+CgNma5Etv984wNUDJeFNmYLcrLEEzSDiN/8dUYSNg
	5CKPV0ugdDw2WdRADZg==
X-Google-Smtp-Source: AGHT+IEQf7gF3CDATeAkdxoy1lakbmpl77+ngHJbtFgvj6kukP1PTmvKUpxaBaaF51Ybn0pIXIPzIN7ozusSR84=
X-Received: from wmbej15.prod.google.com ([2002:a05:600c:3e8f:b0:454:abf8:a8aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4a01:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3b49aa8a304mr6237280f8f.53.1751874058223;
 Mon, 07 Jul 2025 00:40:58 -0700 (PDT)
Date: Mon, 7 Jul 2025 07:40:57 +0000
In-Reply-To: <20250704-topics-tyr-platform_iomem-v12-1-1d3d4bd8207d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-1-1d3d4bd8207d@collabora.com>
Message-ID: <aGt6CZAUeuK0XnmP@google.com>
Subject: Re: [PATCH v12 1/3] rust: io: add resource abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Ilpo =?utf-8?B?SsOkcnZpbmVu?=" <ilpo.jarvinen@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Ying Huang <huang.ying.caritas@gmail.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 04, 2025 at 01:25:26PM -0300, Daniel Almeida wrote:
> In preparation for ioremap support, add a Rust abstraction for struct
> resource.
> 
> A future commit will introduce the Rust API to ioremap a resource from a
> platform device. The current abstraction, therefore, adds only the
> minimum API needed to get that done.
> 
> Co-developed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Overall looks reasonable, but some comments below:

>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/io.c               |  36 +++++++
>  rust/kernel/io.rs               |   4 +
>  rust/kernel/io/resource.rs      | 209 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 250 insertions(+)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 7e8f2285064797d5bbac5583990ff823b76c6bdc..5f795e60e889b9fc887013743c81b1cf92a52adb 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -53,6 +53,7 @@
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/fs.h>
> +#include <linux/ioport.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
>  #include <linux/mdio.h>
> diff --git a/rust/helpers/io.c b/rust/helpers/io.c
> index 15ea187c5466256effd07efe6f6995a1dd95a967..404776cf6717c8570c7600a24712ce6e4623d3c6 100644
> --- a/rust/helpers/io.c
> +++ b/rust/helpers/io.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  #include <linux/io.h>
> +#include <linux/ioport.h>
>  
>  void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
>  {
> @@ -99,3 +100,38 @@ void rust_helper_writeq_relaxed(u64 value, void __iomem *addr)
>  	writeq_relaxed(value, addr);
>  }
>  #endif
> +
> +resource_size_t rust_helper_resource_size(struct resource *res)
> +{
> +	return resource_size(res);
> +}
> +
> +struct resource *rust_helper_request_mem_region(resource_size_t start,
> +						resource_size_t n,
> +						const char *name)
> +{
> +	return request_mem_region(start, n, name);
> +}
> +
> +void rust_helper_release_mem_region(resource_size_t start, resource_size_t n)
> +{
> +	release_mem_region(start, n);
> +}
> +
> +struct resource *rust_helper_request_region(resource_size_t start,
> +					    resource_size_t n, const char *name)
> +{
> +	return request_region(start, n, name);
> +}
> +
> +struct resource *rust_helper_request_muxed_region(resource_size_t start,
> +						  resource_size_t n,
> +						  const char *name)
> +{
> +	return request_muxed_region(start, n, name);
> +}
> +
> +void rust_helper_release_region(resource_size_t start, resource_size_t n)
> +{
> +	release_region(start, n);
> +}
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 72d80a6f131e3e826ecd9d2c3bcf54e89aa60cc3..7b70d5b5477e57d6d0f24bcd26bd8b0071721bc0 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,6 +7,10 @@
>  use crate::error::{code::EINVAL, Result};
>  use crate::{bindings, build_assert};
>  
> +pub mod resource;
> +
> +pub use resource::Resource;
> +
>  /// Raw representation of an MMIO region.
>  ///
>  /// By itself, the existence of an instance of this structure does not provide any guarantees that
> diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..a8ad04b1abf8e46928ed98564e64a07180250024
> --- /dev/null
> +++ b/rust/kernel/io/resource.rs
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for [system
> +//! resources](https://docs.kernel.org/core-api/kernel-api.html#resources-management).
> +//!
> +//! C header: [`include/linux/ioport.h`](srctree/include/linux/ioport.h)
> +
> +use core::ops::Deref;
> +use core::ptr::NonNull;
> +
> +use crate::str::CStr;
> +use crate::types::Opaque;
> +
> +/// Resource Size type.
> +///
> +/// This is a type alias to either `u32` or `u64` depending on the config option
> +/// `CONFIG_PHYS_ADDR_T_64BIT`.
> +#[cfg(CONFIG_PHYS_ADDR_T_64BIT)]
> +pub type ResourceSize = u64;
> +
> +/// Resource Size type.
> +///
> +/// This is a type alias to either `u32` or `u64` depending on the config option
> +/// `CONFIG_PHYS_ADDR_T_64BIT`.
> +#[cfg(not(CONFIG_PHYS_ADDR_T_64BIT))]
> +pub type ResourceSize = u32;
> +
> +/// A region allocated from a parent [`Resource`].
> +///
> +/// # Invariants
> +///
> +/// - `self.0` points to a valid `bindings::resource` that was obtained through
> +///   `bindings::__request_region`.
> +pub struct Region(NonNull<bindings::resource>);
> +
> +impl Deref for Region {
> +    type Target = Resource;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Safe as per the invariant of `Region`.
> +        unsafe { Resource::as_ref(self.0.as_ptr()) }
> +    }
> +}
> +
> +impl Drop for Region {
> +    fn drop(&mut self) {
> +        // SAFETY: Safe as per the invariant of `Region`.
> +        let res = unsafe { Resource::as_ref(self.0.as_ptr()) };
> +        let flags = res.flags();
> +
> +        let release_fn = if flags.contains(flags::IORESOURCE_MEM) {
> +            bindings::release_mem_region
> +        } else {
> +            bindings::release_region
> +        };

You can avoid this unsafe via the deref() impl.

let (flags, start, size) = {
    let res = &**self;
    (res.flags(), res.start(), res.size())
};

> +        // SAFETY: Safe as per the invariant of `Region`.
> +        unsafe { release_fn(res.start(), res.size()) };
> +    }
> +}
> +
> +// SAFETY: `Region` only holds a pointer to a C `struct resource`, which is safe to be used from
> +// any thread.
> +unsafe impl Send for Region {}
> +
> +// SAFETY: `Region` only holds a pointer to a C `struct resource`, references to which are
> +// safe to be used from any thread.
> +unsafe impl Sync for Region {}
> +
> +/// A resource abstraction.
> +///
> +/// # Invariants
> +///
> +/// [`Resource`] is a transparent wrapper around a valid `bindings::resource`.
> +#[repr(transparent)]
> +pub struct Resource(Opaque<bindings::resource>);
> +
> +impl Resource {
> +    /// Creates a reference to a [`Resource`] from a valid pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that for the duration of 'a, the pointer will
> +    /// point at a valid `bindings::resource`.
> +    ///
> +    /// The caller must also ensure that the [`Resource`] is only accessed via the
> +    /// returned reference for the duration of 'a.
> +    pub(crate) const unsafe fn as_ref<'a>(ptr: *mut bindings::resource) -> &'a Self {

We usually call this method `from_raw`.

> +        // SAFETY: Self is a transparent wrapper around `Opaque<bindings::resource>`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Requests a resource region.
> +    ///
> +    /// Exclusive access will be given and the region will be marked as busy.
> +    /// Further calls to [`Self::request_region`] will return [`None`] if
> +    /// the region, or a part of it, is already in use.
> +    pub fn request_region(
> +        &self,
> +        start: ResourceSize,
> +        size: ResourceSize,
> +        name: &'static CStr,

Is this name used for a lookup or stored? If just a lookup, then it
doesn't need to be 'static.

> +        flags: Flags,
> +    ) -> Option<Region> {
> +        // SAFETY: Safe as per the invariant of `Resource`.
> +        let region = unsafe {
> +            bindings::__request_region(
> +                self.0.get(),
> +                start,
> +                size,
> +                name.as_char_ptr(),
> +                flags.0 as i32,

I would use `as c_int` here. (Or change the type stored in Flags.)

> +            )
> +        };
> +
> +        Some(Region(NonNull::new(region)?))
> +    }
> +
> +    /// Returns the size of the resource.
> +    pub fn size(&self) -> ResourceSize {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`.
> +        unsafe { bindings::resource_size(inner) }
> +    }
> +
> +    /// Returns the start address of the resource.
> +    pub fn start(&self) -> u64 {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`.
> +        unsafe { *inner }.start

This needs to be

unsafe { (*inner).start }

What you wrote is not equivalent. (*inner) is a place expression, but
when you write `unsafe { <place expr> }` that turns it into a value
expression by reading the value. So this code copies the entire struct
to the stack, and then you read `start` from the copy on the stack.

> +    }
> +
> +    /// Returns the name of the resource.
> +    pub fn name(&self) -> &'static CStr {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { CStr::from_char_ptr((*inner).name) }
> +    }
> +
> +    /// Returns the flags associated with the resource.
> +    pub fn flags(&self) -> Flags {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        let flags = unsafe { *inner }.flags;
> +
> +        Flags(flags)
> +    }
> +}
> +
> +// SAFETY: `Resource` only holds a pointer to a C `struct resource`, which is
> +// safe to be used from any thread.
> +unsafe impl Send for Resource {}
> +
> +// SAFETY: `Resource` only holds a pointer to a C `struct resource`, references
> +// to which are safe to be used from any thread.
> +unsafe impl Sync for Resource {}
> +
> +/// Resource flags as stored in the C `struct resource::flags` field.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +///
> +/// Values can be used from the [`flags`] module.
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct Flags(usize);

Based on usage it looks like the correct type is c_int?

> +impl Flags {
> +    /// Check whether `flags` is contained in `self`.
> +    pub fn contains(self, flags: Flags) -> bool {
> +        (self & flags) == flags
> +    }
> +}
> +
> +impl core::ops::BitOr for Flags {
> +    type Output = Self;
> +    fn bitor(self, rhs: Self) -> Self::Output {
> +        Self(self.0 | rhs.0)
> +    }
> +}
> +
> +impl core::ops::BitAnd for Flags {
> +    type Output = Self;
> +    fn bitand(self, rhs: Self) -> Self::Output {
> +        Self(self.0 & rhs.0)
> +    }
> +}
> +
> +impl core::ops::Not for Flags {
> +    type Output = Self;
> +    fn not(self) -> Self::Output {
> +        Self(!self.0)
> +    }
> +}
> +
> +/// Resource flags as stored in the `struct resource::flags` field.
> +pub mod flags {

You can do:

impl Flags {
    pub const IORESOURCE_IO: Flags = Flags(bindings::IORESOURCE_IO as usize);
}

instead of a module.

> +    use super::Flags;
> +
> +    /// PCI/ISA I/O ports.
> +    pub const IORESOURCE_IO: Flags = Flags(bindings::IORESOURCE_IO as usize);
> +
> +    /// Resource is software muxed.
> +    pub const IORESOURCE_MUXED: Flags = Flags(bindings::IORESOURCE_MUXED as usize);
> +
> +    /// Resource represents a memory region.
> +    pub const IORESOURCE_MEM: Flags = Flags(bindings::IORESOURCE_MEM as usize);
> +
> +    /// Resource represents a memory region that must be ioremaped using `ioremap_np`.
> +    pub const IORESOURCE_MEM_NONPOSTED: Flags = Flags(bindings::IORESOURCE_MEM_NONPOSTED as usize);
> +}
> 
> -- 
> 2.50.0
> 
