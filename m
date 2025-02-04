Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3051B20C038;
	Tue,  4 Feb 2025 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669825; cv=none; b=aWLOa8kknw++GfnRjLuP6Iukq2uNQWXal8PoMQOCUiR/Yb5yz3JWZw9mdrT3Bq3Z7rr6qCOiwWqtXWGzqKP/S8Ms1Fng16O3RSn2MgrVFNlh4PhnMzpbqblfNhJ6xlB1ZFGFuLWY/NAzsp2WC03IQXXvJuzQqE1mOkzcrmRLRQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669825; c=relaxed/simple;
	bh=mQbQ2uNB03ZheDQ+0nud+bkQdw5vLiAPIUojJBlYWn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4R4S8XbM/YMApHm1HoF1TU6RM/lUOzQ9vHupGP1z5fsjgguZO2imBnkIeB01Q8LOOzU4/66Nj5F381eJ+wH+IVDmNecLMbn80GHFT+1N3r6ilmvWXESvQbkyc71CL+Rf0Kg0rrcusFBv3VGi41WdsNaXtEVkRT9kAxGVSAqEAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=UpP6qAhQ; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="UpP6qAhQ"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 20C0E42E70;
	Tue,  4 Feb 2025 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738669820;
	bh=mQbQ2uNB03ZheDQ+0nud+bkQdw5vLiAPIUojJBlYWn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UpP6qAhQLqeveWyfHJ0rOPqELWItz2HA4hFMYJibz0g/QJhx8wbZOlJ5ihfGclVnP
	 +EeEW5rI/CAzWCxk+GG8Yli/Ut0qfq0yj7BYWw5sciHFyAvpBmPxJPHVUx00fQBu7a
	 z09X+pSv/fR17qJRdhbgzkuX3ZSR9MC8IYnMSIfxtFWHda1olUTMh9b+DXQxmm1IfT
	 PUZd+tWwwhQb/kZs2oDuEv+Mq69+SBQEYBko/kdbRgM+fz3eSHd1dNKs7c/7DDdT/L
	 imx5k3GDl4p1dau1w7pTP6LlJ575tvzZpjngUWvB4c5cIRNzRgcFvEfJ4SsJDYaF0R
	 1+V9lEkAvZKeg==
Message-ID: <8f098064-d2d5-4a02-8306-0a3d31557bab@asahilina.net>
Date: Tue, 4 Feb 2025 20:50:17 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] rust: addr: Add a module to declare core address
 types
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
 <Z6Da4XV5hcTfBiNH@tardis.local>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <Z6Da4XV5hcTfBiNH@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/4/25 12:04 AM, Boqun Feng wrote:
> On Sun, Feb 02, 2025 at 10:05:46PM +0900, Asahi Lina wrote:
>> Encapsulates the core physical/DMA address types, so they can be used by
>> Rust abstractions.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>>  rust/kernel/addr.rs | 15 +++++++++++++++
>>  rust/kernel/lib.rs  |  1 +
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/rust/kernel/addr.rs b/rust/kernel/addr.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..06aff10a0332355597060c5518d7fd6e114cf630
>> --- /dev/null
>> +++ b/rust/kernel/addr.rs
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Kernel core address types.
>> +
>> +use bindings;
>> +use core::ffi;
> 
> I think we should use crate::ffi here. See:
> 
> 	d072acda4862 "rust: use custom FFI integer types"
> 
>> +
>> +/// A physical memory address (which may be wider than the CPU pointer size)
>> +pub type PhysicalAddr = bindings::phys_addr_t;
>> +/// A DMA memory address (which may be narrower than `PhysicalAddr` on some systems)
>> +pub type DmaAddr = bindings::dma_addr_t;
>> +/// A physical resource size, typically the same width as `PhysicalAddr`
>> +pub type ResourceSize = bindings::resource_size_t;
>> +/// A raw page frame number, not to be confused with the C `pfn_t` which also encodes flags.
>> +pub type Pfn = ffi::c_ulong;
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index e1065a7551a39e68d6379031d80d4be336e652a3..eb1a80ba8ff83ab2d1b3b1d11fed4fb704c7a4f5 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -29,6 +29,7 @@
>>  
>>  pub use ffi;
>>  
>> +pub mod addr;
> 
> I want to share my worry on this `pub mod` list in kernel/lib.rs may get
> too long ;-)
> 
> I was about to suggest putting `addr` and `page` into `mm` after Alice's
> patchset merged, however, seems that `mm` mod only cover userspace
> memory management (which is not my impression of what "mm" in kernel
> development), thoughts? Alice, do you think we should extend `mm` mod to
> contain all memory management mods?

I think in kernel-speak "mm" is usually userspace memory management and
kernel page allocation and memory management, but doesn't include device
stuff (I/O ranges, DMA, etc.) or the low-level concepts of memory in an
architecture. The types I declare here are more relevant to device/arch
code, so I don't think they really belong under "mm", it's more general
(mm deals with them and so do other parts of the kernel code).

On the other hand, I think page.rs itself would fit under mm, since it
deals with the kernel mm's idea of pages and their allocation.

> 
> Regards,
> Boqun
> 
>>  pub mod alloc;
>>  #[cfg(CONFIG_BLOCK)]
>>  pub mod block;
>>
>> -- 
>> 2.47.1
>>
> 

~~ Lina

