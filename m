Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8105921770A;
	Tue,  4 Feb 2025 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738703924; cv=none; b=UO56IiaAXlBFncp0gc8zcOeTdJRcmEERQ3L+mzdesJGW8tJ2S3mZuz7fmOJfDHvQ1arX4zaULjViqWFZzWI0FIdqUeDhBCvW6cUWSlHT2dHqQjFIh+VBdQCxnvwQc8/essQs9DMAqBoSELlZCa+zUVPO5F3i8OBAx2jeYWCeoM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738703924; c=relaxed/simple;
	bh=VfsLJGZBTaWPp/7dFr8cYv5uWLkZRbn9Nqa4s7PZ7Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u19Q+JsbnGan42u+2l+Man1qvQTjSkz8JwOBFkeja1K8RLlIGkAa3PKH0OBJbZkghX5W0onvoAJIdB79/KI3iEEJ89LYybm5RfalxVgeN0BsQAK90HJkiwboJkOiGB0VYWy5fWPJB4iQ92RSWTdbnmLbUGjgApfY0OxRawScRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=VShY9U8B; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="VShY9U8B"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 157A243321;
	Tue,  4 Feb 2025 21:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738703920;
	bh=VfsLJGZBTaWPp/7dFr8cYv5uWLkZRbn9Nqa4s7PZ7Kg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VShY9U8BYjAWJERpxnFG57enS9OV5Ua6HOQJ5bWQyzJU7y1o5BeNhoLQOjt4T6F31
	 ySpglPhH0pMM5TF3j+sbo1H8CS9rRDUu/mv1wrZ65uhVbsY7fodlNTohTVj+0xDHF+
	 GAAVq6q3RsTXn2Dgat1jrcQQJgllQEECzKcLAAiAItqgjpktGk6g9ap9R77JE2w0pc
	 UDBTFE0O16E822vzc/vsO5AIhLvP52CuMShTOIJtVKK0O7uFPLNLDBPJG0bvhOEctB
	 QDQOr34u0/12knjU93FSdp9aB3W47Pi2zeQWphvsFtNlZ1Qx7W3GcAaHWO2E//Q8mu
	 FIrc0Ay7kO7sA==
Message-ID: <f8d06a49-4154-42d2-99c9-f8d59d39ab9f@asahilina.net>
Date: Wed, 5 Feb 2025 06:18:37 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
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
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
 <20250204183933.GJ2296753@ziepe.ca>
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
 <20250204202656.GL2296753@ziepe.ca>
 <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>
 <c4c39ea5-3602-4b92-9ffd-af33e122538d@redhat.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <c4c39ea5-3602-4b92-9ffd-af33e122538d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/5/25 5:47 AM, David Hildenbrand wrote:
> On 04.02.25 21:41, David Hildenbrand wrote:
>> On 04.02.25 21:26, Jason Gunthorpe wrote:
>>> On Tue, Feb 04, 2025 at 09:05:47PM +0100, David Hildenbrand wrote:
>>>> Fully agreed, this is going into the right direction. Dumping what's
>>>> mapped
>>>> is a different story. Maybe that dumping logic could simply be
>>>> written in C
>>>> for the time being?
>>>
>>> ?
>>>
>>> Isn't dumping just a
>>>     decode pte -> phys_to_virt() -> for_each_u64(virt) -> printk?
>>>
>>
>> IIUC, the problematic bit is that you might not have a directmap such
>> that phys_to_virt() would tell you the whole story.
> 
> ... but it's late and I am confused. For dumping the *page table* that
> would not be required, only when dumping mapped page content (and at
> this point I am not sure if that is a requirement).
> 
> So hopefully Asahi Lina can clarify what the issue was (if there is
> any :) ).

Yes, the crash dumper has to dump the mapped page content. In fact, I
don't care about the page tables themselves other than PTE permission
bits, and the page tables alone are not useful for debugging firmware
crashes (and aren't even included in the dump verbatim, at least not the
kernel-allocated ones). The goal of the crash dumper is to take a
complete dump of firmware virtual memory address space (which includes
the kinds of memory I mentioned in [1]). The output is an ELF format
core dump with all memory that the GPU firmware can access, that the
kernel was able to successfully dump (which should be everything except
for MMIO if the bootloader/DT have the right reserved-memory setup).

I *think* phys_to_virt should work just fine for *this* specific use
case on this platform, but I'm not entirely sure. I still want to use
the various pfn check functions before doing that, to exclude ranges
that would definitely not work.

I don't really want to write any part of the driver in C, but whatever
logic is required, I don't think there should be a good reason for that.
We can export the C functions required to Rust code in some form, we
just need to decide what form that should be. Worst case, Rust drivers
can directly access C functions via the `bindings` crate, though that's
something I want to avoid (even if there's only a very thin or trivial
Rust abstraction layer, there should be *something* so at least we get
Rust docs and the ability to make subtle improvements to the
interface/types/etc).

[1]
https://lore.kernel.org/rust-for-linux/1e9ae833-4293-4e48-83b2-c0af36cb3fdc@asahilina.net/

~~ Lina

