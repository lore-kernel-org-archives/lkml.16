Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34171FC0F9;
	Mon,  3 Feb 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592059; cv=none; b=C/QGSyDjZ+z8PIVtMInKL322aqRSSAreo/ginjobkcgaKDW/UG2fx4lfBmfeBN3Q4iPvEVA39U7sgUSbBUhK3EXFEaR0L0/41YXzEua+yFP5KXjDvEs2nhEYIvN0B1mwpY6ghZcOlfuwaEoMzowQ48wrQNBEGpuTZAclLZxeD3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592059; c=relaxed/simple;
	bh=60PMMt2ExM2Ko6ripWDDCg+Nj5o/tLdlrm2phlbWfM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Trxg9GnhwX+yTk2lS60PeG/lf0xuCMeC+aCb+IRAWTrF21rMU5AITbo8BTM0BnK9qBro3Lfhq1ps+9Qf3DM/70tqERjqtmvIkcFYottI0hyo2G5Px+5RjToGO1rXwPqaqrYVpV9M6WZEh8h458LXVI/76wzruRbQBeNlZxAjWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=xHSaImGT; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="xHSaImGT"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 39E9743472;
	Mon,  3 Feb 2025 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738592054;
	bh=60PMMt2ExM2Ko6ripWDDCg+Nj5o/tLdlrm2phlbWfM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=xHSaImGTYTcNonN6pj2/sTcYh2NeEPD9BbFFmu9rqiSIAolqlsGXWqnZhc3an3vNY
	 y1dF92upsKAQAFz1afjPHoHyNJ7RjAuw/LGQSolrIpWRtNx7ZCiMq7ldMvRjx1GZpd
	 jV2+pk/aMnio/xvJ21+n1jkcXAMSRen8AiPbBg6H2m/x1ioZYOHDLTBW2BTvX5B7HW
	 JhEPJBEJ/OYq8kO5huxBx9Kjiy+VqMF0chaVjoqhXC3DmbJ8blpqbhO5yQiLGqz8U2
	 lK5XCgQxFBERo5lcdI6lrLu73r/A5QwODhZ1pnRHM2lA1PenmWzaRa8YB+Qsdv7Ka+
	 bi0fcMfRApL4w==
Message-ID: <697188e5-0718-433e-943e-14ccb9bb59f4@asahilina.net>
Date: Mon, 3 Feb 2025 23:14:12 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.mco, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 dakr@kernel.org, boris.brezillon@collabora.com, robh@kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130220529.665896-1-daniel.almeida@collabora.com>
 <20250130220529.665896-3-daniel.almeida@collabora.com>
 <b5538fda-1926-4280-8e46-e0ff299a4f72@asahilina.net>
 <CAH5fLgjf4VArJ21DaAY9SP+AF4k+706naR+UfcVFx3S9aJfmJQ@mail.gmail.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <CAH5fLgjf4VArJ21DaAY9SP+AF4k+706naR+UfcVFx3S9aJfmJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/3/25 6:26 PM, Alice Ryhl wrote:
> On Sun, Feb 2, 2025 at 11:45 PM Asahi Lina <lina@asahilina.net> wrote:
>>
>>
>>
>> On 1/31/25 7:05 AM, Daniel Almeida wrote:
>>> Add a generic iomem abstraction to safely read and write ioremapped
>>> regions.
>>>
>>> The reads and writes are done through IoRaw, and are thus checked either
>>> at compile-time, if the size of the region is known at that point, or at
>>> runtime otherwise.
>>>
>>> Non-exclusive access to the underlying memory region is made possible to
>>> cater to cases where overlapped regions are unavoidable.
>>>
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> ---
>>>  rust/kernel/io.rs     |   1 +
>>>  rust/kernel/io/mem.rs | 125 ++++++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 126 insertions(+)
>>>  create mode 100644 rust/kernel/io/mem.rs
>>>
>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>> index 566d8b177e01..9ce3482b5ecd 100644
>>> --- a/rust/kernel/io.rs
>>> +++ b/rust/kernel/io.rs
>>> @@ -7,6 +7,7 @@
>>>  use crate::error::{code::EINVAL, Result};
>>>  use crate::{bindings, build_assert};
>>>
>>> +pub mod mem;
>>>  pub mod resource;
>>>
>>>  /// Raw representation of an MMIO region.
>>> diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
>>> new file mode 100644
>>> index 000000000000..f87433ed858e
>>> --- /dev/null
>>> +++ b/rust/kernel/io/mem.rs
>>> @@ -0,0 +1,125 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Generic memory-mapped IO.
>>> +
>>> +use core::ops::Deref;
>>> +
>>> +use crate::device::Device;
>>> +use crate::devres::Devres;
>>> +use crate::io::resource::Region;
>>> +use crate::io::resource::Resource;
>>> +use crate::io::Io;
>>> +use crate::io::IoRaw;
>>> +use crate::prelude::*;
>>> +
>>> +/// An exclusive memory-mapped IO region.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// - ExclusiveIoMem has exclusive access to the underlying `iomem`.
>>> +pub struct ExclusiveIoMem<const SIZE: usize> {
>>> +    /// The region abstraction. This represents exclusive access to the
>>> +    /// range represented by the underlying `iomem`.
>>> +    ///
>>> +    /// It's placed first to ensure that the region is released before it is
>>> +    /// unmapped as a result of the drop order.
>>> +    #[allow(dead_code)]
>>> +    region: Region,
>>> +    /// The underlying `IoMem` instance.
>>> +    iomem: IoMem<SIZE>,
>>> +}
>>> +
>>> +impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
>>> +    /// Creates a new `ExclusiveIoMem` instance.
>>> +    pub(crate) fn ioremap(resource: &Resource) -> Result<Self> {
>>> +        let iomem = IoMem::ioremap(resource)?;
>>> +
>>> +        let start = resource.start();
>>> +        let size = resource.size();
>>> +        let name = resource.name();
>>> +
>>> +        let region = resource
>>> +            .request_mem_region(start, size, name)
>>> +            .ok_or(EBUSY)?;
>>> +
>>> +        let iomem = ExclusiveIoMem { iomem, region };
>>> +
>>> +        Ok(iomem)
>>> +    }
>>> +
>>> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
>>> +        let iomem = Self::ioremap(resource)?;
>>> +        let devres = Devres::new(device, iomem, GFP_KERNEL)?;
>>> +
>>> +        Ok(devres)
>>> +    }
>>> +}
>>> +
>>> +impl<const SIZE: usize> Deref for ExclusiveIoMem<SIZE> {
>>> +    type Target = Io<SIZE>;
>>> +
>>> +    fn deref(&self) -> &Self::Target {
>>> +        &*self.iomem
>>> +    }
>>> +}
>>> +
>>> +/// A generic memory-mapped IO region.
>>> +///
>>> +/// Accesses to the underlying region is checked either at compile time, if the
>>> +/// region's size is known at that point, or at runtime otherwise.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointer to the
>>> +/// start of the I/O memory mapped region.
>>> +pub struct IoMem<const SIZE: usize = 0> {
>>> +    io: IoRaw<SIZE>,
>>> +}
>>> +
>>> +impl<const SIZE: usize> IoMem<SIZE> {
>>> +    fn ioremap(resource: &Resource) -> Result<Self> {
>>> +        let size = resource.size();
>>> +        if size == 0 {
>>> +            return Err(EINVAL);
>>> +        }
>>> +
>>> +        let res_start = resource.start();
>>> +
>>> +        // SAFETY:
>>> +        // - `res_start` and `size` are read from a presumably valid `struct resource`.
>>> +        // - `size` is known not to be zero at this point.
>>> +        let addr = unsafe { bindings::ioremap(res_start, size as kernel::ffi::c_ulong) };
>>
>> This does not work for all platforms. Some, like Apple platforms,
>> require ioremap_np(). You should check for the
>> `IORESOURCE_MEM_NONPOSTED` resource flag and use the appropriate
>> function, like this (from an older spin of this code):
>>
>> https://github.com/AsahiLinux/linux/blob/fce34c83f1dca5b10cc2c866fd8832a362de7974/rust/kernel/io_mem.rs#L166C36-L166C70
> 
> Hmm. Is detecting this based on the flag the right approach? On the C
> side, they use different methods and I wonder if we should do the
> same?

ioremap() vs. ioremap_np() exist because the second one was added for
Apple platforms, and we need both because ioremap() is required for
external PCI devices and ioremap_np() for internal SoC devices, but no
driver calls ioremap_np() directly. If you look at drivers/of/address.c
and lib/devres.c, you'll see they do the same thing to decide which one
to call. The code in drivers/base/platform.c hooks up the platform
methods together with devres, and the code in drivers/of/platform.c sets
up OF devices as platform devices with the OF resource code, which sets
the flag as needed.

Therefore, that any driver that uses any of the high-level ioremap
wrappers that go through `struct resource` automatically gets the
ioremap()/ioremap_np() handling (platform drivers get ioremap_np() on
Apple platforms, everything else including PCI drivers get ioremap()).
The Rust side should do the same thing.

~~ Lina

