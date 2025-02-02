Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A61D5143;
	Sun,  2 Feb 2025 22:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536361; cv=none; b=T9VIA9sor/knXYpVI+4nDwFwGAtC5Ye0h38h8p7vkwaZX4hrmtOIVrT/K699l0AGyg0fMQKLPA7EtObdlyzi5NjgQi5iiZNOuQW8Zn3Zme54o14Ei8n9jrTga5TSTJAmqZdXvqq2jwRdncuiiYaT1YeIXfDGZYtdN2Xn3JgdKUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536361; c=relaxed/simple;
	bh=PzayQFwcozc8L/udxMBMWG37Zz+x0bU+o+OQIRR522U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZk5AH+u1k0MVgvLunAudge3TyqPMRrlVJH0qLRrpkcvTjMXedXHUAH6U0WVJVYImmH8Xw3cUqHPaCbecbFaF0u74E8CqktLfOplmNbZdKwXhcKLBjt5mqjl31+TEyRGqGDjlQku5b57zYdFim4qGeqBtRGDRsQCw8NT1Q58f3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=Oyn7XYae; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="Oyn7XYae"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4D93B42657;
	Sun,  2 Feb 2025 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738536357;
	bh=PzayQFwcozc8L/udxMBMWG37Zz+x0bU+o+OQIRR522U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Oyn7XYaemt2uzCQjvTr0yB4GPeXfjozPfleI/c63uxvgpR3cASzUcQTbnliS38bn4
	 2eKN7k35+DFp4+Mc7m4Uwnd7rdfoPp/wTx3zxeJGN7Eth8EWE1qm4vRktYhsNTpmEk
	 KR8vZ+FUno8PAr9EkCt6V2bDdVtEFyB6sDDdAyGiWdSozk6iRxpEsiI3nzXgmzTqP1
	 Q770eDl2IF/EK42Ndfv0Gx4I7koXYuTKjvOPinkEXOu7WqKguewXIXHdZPhgbthTgx
	 aoX9Ef84FGPbgo0SCqtdUPmPRCpFrbpLYh3h1XRGmUeXDwmlsH5eVatGOlFeR0rCbO
	 wCPpajRav75PA==
Message-ID: <b5538fda-1926-4280-8e46-e0ff299a4f72@asahilina.net>
Date: Mon, 3 Feb 2025 07:45:54 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.mco, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com,
 robh@kernel.org
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130220529.665896-1-daniel.almeida@collabora.com>
 <20250130220529.665896-3-daniel.almeida@collabora.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20250130220529.665896-3-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/31/25 7:05 AM, Daniel Almeida wrote:
> Add a generic iomem abstraction to safely read and write ioremapped
> regions.
> 
> The reads and writes are done through IoRaw, and are thus checked either
> at compile-time, if the size of the region is known at that point, or at
> runtime otherwise.
> 
> Non-exclusive access to the underlying memory region is made possible to
> cater to cases where overlapped regions are unavoidable.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/io.rs     |   1 +
>  rust/kernel/io/mem.rs | 125 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 rust/kernel/io/mem.rs
> 
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 566d8b177e01..9ce3482b5ecd 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,6 +7,7 @@
>  use crate::error::{code::EINVAL, Result};
>  use crate::{bindings, build_assert};
>  
> +pub mod mem;
>  pub mod resource;
>  
>  /// Raw representation of an MMIO region.
> diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
> new file mode 100644
> index 000000000000..f87433ed858e
> --- /dev/null
> +++ b/rust/kernel/io/mem.rs
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic memory-mapped IO.
> +
> +use core::ops::Deref;
> +
> +use crate::device::Device;
> +use crate::devres::Devres;
> +use crate::io::resource::Region;
> +use crate::io::resource::Resource;
> +use crate::io::Io;
> +use crate::io::IoRaw;
> +use crate::prelude::*;
> +
> +/// An exclusive memory-mapped IO region.
> +///
> +/// # Invariants
> +///
> +/// - ExclusiveIoMem has exclusive access to the underlying `iomem`.
> +pub struct ExclusiveIoMem<const SIZE: usize> {
> +    /// The region abstraction. This represents exclusive access to the
> +    /// range represented by the underlying `iomem`.
> +    ///
> +    /// It's placed first to ensure that the region is released before it is
> +    /// unmapped as a result of the drop order.
> +    #[allow(dead_code)]
> +    region: Region,
> +    /// The underlying `IoMem` instance.
> +    iomem: IoMem<SIZE>,
> +}
> +
> +impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
> +    /// Creates a new `ExclusiveIoMem` instance.
> +    pub(crate) fn ioremap(resource: &Resource) -> Result<Self> {
> +        let iomem = IoMem::ioremap(resource)?;
> +
> +        let start = resource.start();
> +        let size = resource.size();
> +        let name = resource.name();
> +
> +        let region = resource
> +            .request_mem_region(start, size, name)
> +            .ok_or(EBUSY)?;
> +
> +        let iomem = ExclusiveIoMem { iomem, region };
> +
> +        Ok(iomem)
> +    }
> +
> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
> +        let iomem = Self::ioremap(resource)?;
> +        let devres = Devres::new(device, iomem, GFP_KERNEL)?;
> +
> +        Ok(devres)
> +    }
> +}
> +
> +impl<const SIZE: usize> Deref for ExclusiveIoMem<SIZE> {
> +    type Target = Io<SIZE>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &*self.iomem
> +    }
> +}
> +
> +/// A generic memory-mapped IO region.
> +///
> +/// Accesses to the underlying region is checked either at compile time, if the
> +/// region's size is known at that point, or at runtime otherwise.
> +///
> +/// # Invariants
> +///
> +/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointer to the
> +/// start of the I/O memory mapped region.
> +pub struct IoMem<const SIZE: usize = 0> {
> +    io: IoRaw<SIZE>,
> +}
> +
> +impl<const SIZE: usize> IoMem<SIZE> {
> +    fn ioremap(resource: &Resource) -> Result<Self> {
> +        let size = resource.size();
> +        if size == 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let res_start = resource.start();
> +
> +        // SAFETY:
> +        // - `res_start` and `size` are read from a presumably valid `struct resource`.
> +        // - `size` is known not to be zero at this point.
> +        let addr = unsafe { bindings::ioremap(res_start, size as kernel::ffi::c_ulong) };

This does not work for all platforms. Some, like Apple platforms,
require ioremap_np(). You should check for the
`IORESOURCE_MEM_NONPOSTED` resource flag and use the appropriate
function, like this (from an older spin of this code):

https://github.com/AsahiLinux/linux/blob/fce34c83f1dca5b10cc2c866fd8832a362de7974/rust/kernel/io_mem.rs#L166C36-L166C70

> +        if addr.is_null() {
> +            return Err(ENOMEM);
> +        }
> +
> +        let io = IoRaw::new(addr as usize, size as usize)?;
> +        let io = IoMem { io };
> +
> +        Ok(io)
> +    }
> +
> +    /// Creates a new `IoMem` instance.
> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
> +        let io = Self::ioremap(resource)?;
> +        let devres = Devres::new(device, io, GFP_KERNEL)?;
> +
> +        Ok(devres)
> +    }
> +}
> +
> +impl<const SIZE: usize> Drop for IoMem<SIZE> {
> +    fn drop(&mut self) {
> +        // SAFETY: Safe as by the invariant of `Io`.
> +        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_void) }
> +    }
> +}
> +
> +impl<const SIZE: usize> Deref for IoMem<SIZE> {
> +    type Target = Io<SIZE>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Safe as by the invariant of `IoMem`.
> +        unsafe { Io::from_raw(&self.io) }
> +    }
> +}

~~ Lina

