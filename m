Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A264685;
	Tue,  4 Feb 2025 19:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695671; cv=none; b=qn6Tzg5CL6KDO1FEjQ8db4D70hARnXCoRRbvwYAO/Ln9nhnTB/FRAXQRwUQYcx0bUz+73hKFwVytC72eF6HkkxV/+0ywnnctLFuv/mN984yvRoNzoAUIbGrwGIeRztKLZNRZLPZaTBd+fh7BIlrLU4M1RH934pbLE3tt/kANrDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695671; c=relaxed/simple;
	bh=j1HluQu+SfdI+WQgxoy9vEPWh80MpLWIZgMzLSmRvYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbIteNdlmi5Bczr9qOUhCormBHEs8iyfW12yg+gxBdiPOu6Wd8+Teez8f7bPZLKuQmXus2cE3P4Z7RRhs9cX96m+FHKyR1nO/cXk7SBlNXQbW/C0zeoABjNLIAV5rTh7Cuhe2Q/mCQv9HMqViRjPejHThOYQpDGJLML9S6MwYsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=D+MPcFU6; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="D+MPcFU6"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 74ACC4331F;
	Tue,  4 Feb 2025 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738695664;
	bh=j1HluQu+SfdI+WQgxoy9vEPWh80MpLWIZgMzLSmRvYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D+MPcFU6p7Oo9Mj2A5QSdzn1y0txF2ESXFgZr9fCpXslAfcOiJWqRv4V4SEEJVOdp
	 Snd0CK4TdO1U/Hi8JyMT6pzpxto8YIbGDbZAcbXUCbkw9afGkdU45x8wx5vm3iK/yA
	 p2KQISHYMO4KSpY/Vihk5csasR741Txi+1AlcYIEyvZ+qcF7Ka7qgGylGx2ElaliIs
	 jSbP8IGjGuMCH3uzs5PCfmZra3uMXrBCF2QG5JwJ7EWwnajzRnXsNBVSWsK/uKUqMb
	 hYDSZdgqjaSr9ggJhpZqsbcYaE3P7EBg8lJQpClqAGvZTZ7RIC6+16BktEzYyXw6Co
	 otXaMNP5KhvQA==
Message-ID: <7253bfc0-9a49-4d0e-a7de-43069e6b2e5f@asahilina.net>
Date: Wed, 5 Feb 2025 04:01:00 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Jason Gunthorpe <jgg@ziepe.ca>, David Hildenbrand <david@redhat.com>
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
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20250204183933.GJ2296753@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 3:39 AM, Jason Gunthorpe wrote:
> On Tue, Feb 04, 2025 at 11:33:24AM +0100, David Hildenbrand wrote:
>> On 03.02.25 10:58, Simona Vetter wrote:
>>> On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
>>>> This series refactors the existing Page wrapper to support borrowing
>>>> `struct page` objects without ownership on the Rust side, and converting
>>>> page references to/from physical memory addresses.
>>>>
>>>> The series overlaps with the earlier submission in [1] and follows a
>>>> different approach, based on the discussion that happened there.
>>>>
>>>> The primary use case for this is implementing IOMMU-style page table
>>>> management in Rust. This allows drivers for IOMMUs and MMU-containing
>>>> SoC devices to be written in Rust (such as embedded GPUs). The intended
>>>> logic is similar to how ARM SMMU page tables are managed in the
>>>> drivers/iommu tree.
>>>>
>>>> First, introduce a concept of Owned<T> and an Ownable trait. These are
>>>> similar to ARef<T> and AlwaysRefCounted, but are used for types which
>>>> are not ref counted but rather have a single intended owner.
>>>>
>>>> Then, refactor the existing Page support to use the new mechanism. Pages
>>>> returned from the page allocator are not intended to be ref counted by
>>>> consumers (see previous discussion in [1]), so this keeps Rust's view of
>>>> page ownership as a simple "owned or not". Of course, this is still
>>>> composable as Arc<Owned<Page>> if Rust code needs to reference count its
>>>> own Page allocations for whatever reason.
>>>
>>> I think there's a bit a potential mess here because the conversion to
>>> folios isn't far enough yet that we can entirely ignore page refcounts and
>>> just use folio refcounts. But I guess we can deal with that oddity if we
>>> hit it (maybe folio conversion moves fast enough), since this only really
>>> starts to become relevant for hmm/svm gpu stuff.
>>
>> I'll note that in the future only selected things will be folios (e.g.,
>> pagecache, anonymous memory). Everything else will either get a separate
>> memdesc (e.g., ptdesc), or work on bare pages.
>>
>> Likely, when talking about page tables, "ptdesc" might be what you want to
>> allocate here, and not "folios".
> 
> I just posted a series to clean up the iommu code that this is
> cribbing the interface from: add an ioptdesc, remove all the struct
> page from the API and so forth:
> 
> https://lore.kernel.org/all/0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com/
> 
> I strongly suggest that rust not expose these old schemes that will
> need another cleanup like the above. Page tables just need an
> allocator using simple void *, kmalloc is good enough for simple
> cases.
> 
> Drivers should not be exposing or touching struct page just to
> implement a page table.

iommu-pages.h looks like a private API internal to drivers/iommu. Is
there a plan to move that out so it can be used by non-iommu drivers?

If you think I should just use kmalloc, then I guess I could literally
just use KBox<PageTable> where PageTable is just a wrapper around [u64;
PTES_PER_PAGE] with an alignment attribute, or something like that. I
guess then just virt_to_phys() and back for the PTEs? So we still need
to add at least trivial wrappers to export those for Rust drivers to use.

I still need to be able to grab pointers to leaf pages for the crashdump
page table walker code though, and I want to keep the pfn and memory
type checks to make sure it won't crash trying to dereference the page
contents. So we also still need those too.

I'm not entirely sure what a higher-level Rust abstraction for this
looks like at this point, or whether it makes sense at all instead of
just trivially wrapping the C helpers... I don't particularly mind just
writing this part of the driver code "like C" (it's pretty much the
lowest-level bit of code in the driver anyway) but I guess we have to do
some thinking here.

Maybe this is one of those cases where we just do it ad-hoc for now, and
wait until a second driver that needs to implement page tables comes
around and we figure out what can be shared then, and what the API
should look like.

Hmm, starting to think maybe these should literally be impls on the
address types (PhysicalAddr::to_pfn(), PhysicalAddr::to_virt(), etc.).
Though that won't work without newtyping everything, but maybe we should?

~~ Lina

