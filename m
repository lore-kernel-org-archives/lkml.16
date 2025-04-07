Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB732054EE;
	Mon,  7 Apr 2025 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043496; cv=none; b=qAyvwLSI8G3tRq/KBzbuKPgmcRJKJmLMmoR1d6f7fRt5A/PQW8uH3fVWblVWJeROHL8V855LZtJ7XLst64IcMHuxUEFYO+T6iQFD99wTRQED/yqQu7KwsLtTZOS9Z0j3qRb6agyGKAFTbQHEDHxkg9JLb2FP1oB4iZCiswplDIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043496; c=relaxed/simple;
	bh=RSrEtdAd5F0XISIgryvTa6dXc7w7kiCKmtOkNhqhQY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMpnO9HNfFSqcgWYWnnlk9up2QIlOFzkyeqPAD2FSJ1Ozpf1iI3GFONtKoqrKVg/A9qEzlOOBcF9gRlnmzxqPMSOmUZpFfLm2fqqhbj+w0WWpPrf14gXzFH3hO7uBjJlfyyrrQFyifnZXRLRVQMO3n7y4m9xDoBGWEZujaUnIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emyn0LK2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emyn0LK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF58BC4CEE7;
	Mon,  7 Apr 2025 16:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744043496;
	bh=RSrEtdAd5F0XISIgryvTa6dXc7w7kiCKmtOkNhqhQY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emyn0LK28d026GSydKtLRNImtQcKaVGWuubapwQw0jgJSGeLE5R2eeOSv137XDl3d
	 CRE6SAkRmJJ6fuqdxPGsBEwpoGUyk2nJ+cCMro9SKEIpCuTV22Y4irttl8KmvnpW+t
	 ASgvQIJ+iHZ4T8QGM5ojHf64XQOwrwYleiDfDYDnKOTK9JEGxfONsvownLtzOuo3sQ
	 k6INQAfxDoqrAwvYTjxaakaCIMonB4iKTjRBeZqcF5nBamTvZ9KPNomR7kRXmWvd+P
	 v9dwmHgbbNKIWeWf2WLuU6ZGalf7SJ8/U9NcRa0+LmvbIG5Q8nGeTtztIne8hQDdkW
	 /RgKrAd25BcHg==
Date: Mon, 7 Apr 2025 19:31:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z_P92UCbNCV0TbiA@kernel.org>
References: <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407141626.GB1557073@nvidia.com>

On Mon, Apr 07, 2025 at 11:16:26AM -0300, Jason Gunthorpe wrote:
> On Sun, Apr 06, 2025 at 07:11:14PM +0300, Mike Rapoport wrote:
> > > > > We know what the future use case is for the folio preservation, all
> > > > > the drivers and the iommu are going to rely on this.
> > > > 
> > > > We don't know how much of the preservation will be based on folios.
> > > 
> > > I think almost all of it. Where else does memory come from for drivers?
> > 
> > alloc_pages()? vmalloc()?
> 
> alloc_pages is a 0 order "folio". vmalloc is an array of 0 order
> folios (?)

According to current Matthew's plan [1] vmalloc is misc memory :)
 
> > How about we find some less ambiguous term? Using "folio" for memory
> > returned from kmalloc is really confusing. And even alloc_pages() does not
> > treat all memory it returns as folios.
> > 
> > How about we call them ranges? ;-)
> 
> memdescs if you want to be forward looking. It is not ranges.
>
> The point very much is that they are well defined allocations from the
> buddy allocator that can be freed back to the buddy allocator. We
> provide an API sort of like alloc_pages/folio_alloc to get the pointer
> back out and that is the only way to use it.
> 
> KHO needs to provide a way to give back an allocated struct page/folio
> that can be freed back to the buddy alloactor, of the proper
> order. Whatever you call that function it belongs to KHO as it is
> KHO's primary responsibility to manage the buddy allocator and the
> struct pages.
> 
> Today initializing the folio is the work required to do that.
 
Ok, let's stick with memdesc then. Put aside the name it looks like we do
agree that KHO needs to provide a way to preserve memory allocated from
buddy along with some of the metadata describing that memory, like order
for multi-order allocations.

The issue I see with bitmaps is that there's nothing except the order that
we can save. And if sometime later we'd have to recreate memdesc for that
memory, that would mean allocating a correct data structure, i.e. struct
folio, struct slab, struct vmalloc maybe.

I'm not sure we are going to preserve slabs at least at the foreseeable
future, but vmalloc seems like something that we'd have to address.
  
> > I did and experiment with preserving 8G of memory allocated with randomly
> > chosen order. For each order (0 to 10) I've got roughly 1000 "folios". I
> > measured time kho_mem_deserialize() takes with xarrays + bitmaps vs maple
> > tree based implementation. The maple tree outperformed by factor of 10 and
> > it's serialized data used 6 times less memory.
> 
> That seems like it means most of your memory ended up contiguous and
> the maple tree didn't split nodes to preserve order. :\

I was cheating to some extent but not that much. I preserved order in
kho_mem_info_t and if the folios next to each other were of different
orders they were not merged into a single maple tree node. But in case all
memory is free and not fragmented my understanding is that buddy will
allocate folios of the same order next to each other and so they could be
merged in the maple tree.

> Also the bitmap scanning to optimize the memblock reserve isn't
> implemented for xarray.. I don't think this is representative..

I believe that even with optimization of bitmap scanning maple tree would
perform much better when the memory is not fragmented. And when it is
fragmented both will need to call memblock_reserve() similar number of
times and there won't be real difference. Of course maple tree will consume
much more memory in the worst case.

[1] https://kernelnewbies.org/MatthewWilcox/Memdescs
 
> Jason
> 

-- 
Sincerely yours,
Mike.
