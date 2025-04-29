Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C57221576;
	Tue, 29 Apr 2025 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912785; cv=none; b=svXKulUEYwRzTbrIrv+Tc+hPva+BAvVcKX3viPkwtOcnle1/5Uqbw+ibMlUMXe5Tq8q9ySsgcFQUE8qB1IzXD9COeVa6NFr2wR98EzG7dQfw7eQt/gpGeI1HpIqd7h3BiTOVHdia8tlhKtmPmGesGWvoAgQIBaBZuk4iA4ehcCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912785; c=relaxed/simple;
	bh=B1Tjq/VEc9BEwLRkXSe5xppoiP7KBXAstgtmIpFfjzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7pbJbzv6XZCz+AYw20MMKIPX/NrDfbfCs2McA2Nir/Jk8c8bXHJGW7FPtBA9bXiCkUQUUYMsPTuOIqjRUnEnqjnm5rMFqJjj0JImskrPft7bl+rQUH8/fpPbuaXL1ZD0Mu+1Unm+F5HLdRxgZrqdS4Q7aBhqpH35W36Cb5MFaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAKxT/Zb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAKxT/Zb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E38C4CEE3;
	Tue, 29 Apr 2025 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745912784;
	bh=B1Tjq/VEc9BEwLRkXSe5xppoiP7KBXAstgtmIpFfjzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAKxT/ZbCsUrHTc0TFhc2F6M8M7au2948y4Fk7tEIqMVtVYYPiP0rMB/9Hl7ejftf
	 oPTkZgOvWs7LnFwvmmi/b+JOXLVlZ32qbT5UJuyBbFS4Ff/tOCzLkY6oHiNaF5YfbT
	 V5W7PcNvqFH1ZOQXMgEo8xlOmOilULNGgiI5UdPcUpNxDY4STfSTn2qcCvJmRCTdEH
	 oDaszDKucZmHM+pP6xl4+kkqQ3mXjlFshDGy3nvaicj5P7vGMJfiJ9rl9No9tZvMgr
	 uUf60fSs3EGuW18sh6pUHFDGD6mXfdYiLLZpqDt2n3TNog7qmtBSDUvstQYXcFCtPM
	 8Q4diqUGdRqQw==
Date: Tue, 29 Apr 2025 10:46:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mel Gorman <mgorman@techsingularity.net>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Roth <michael.roth@amd.com>
Subject: Re: SNP guest crash in memblock with unaccepted memory
Message-ID: <aBCDyDy7O2_GHTb0@kernel.org>
References: <f12f5bd0-135b-91fd-9703-7df98500f9c5@amd.com>
 <b037ffeb-bfeb-41a6-b200-d8c57076370f@redhat.com>
 <64c04e6c-43b1-996b-f83d-5fb1751debaa@amd.com>
 <6fb7b4b6-3b2c-4f7c-9c84-a72cdac6f854@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fb7b4b6-3b2c-4f7c-9c84-a72cdac6f854@redhat.com>

On Mon, Apr 28, 2025 at 11:00:36PM +0200, David Hildenbrand wrote:
> On 28.04.25 20:10, Tom Lendacky wrote:
> > On 4/28/25 09:04, David Hildenbrand wrote:
> > > On 27.04.25 17:01, Tom Lendacky wrote:
> > > > Hi Kirill,
> > > > 
> > > > Every now and then I experience an SNP guest boot failure for accessing
> > > > memory that hasn't been accepted. I managed to get a back trace:
> > > > 
> > > >     RIP: 0010:memcpy_orig+0x68/0x130
> > > >     Code: ...
> > > >     RSP: 0000:ffffffff9cc03ce8 EFLAGS: 00010006
> > > >     RAX: ff11001ff83e5000 RBX: 0000000000000000 RCX: fffffffffffff000
> > > >     RDX: 0000000000000bc0 RSI: ffffffff9dba8860 RDI: ff11001ff83e5c00
> > > >     RBP: 0000000000002000 R08: 0000000000000000 R09: 0000000000002000
> > > >     R10: 000000207fffe000 R11: 0000040000000000 R12: ffffffff9d06ef78
> > > >     R13: ff11001ff83e5000 R14: ffffffff9dba7c60 R15: 0000000000000c00
> > > >     memblock_double_array+0xff/0x310
> > > >     memblock_add_range+0x1fb/0x2f0
> > > >     memblock_reserve+0x4f/0xa0
> > > >     memblock_alloc_range_nid+0xac/0x130
> > > >     memblock_alloc_internal+0x53/0xc0
> > > >     memblock_alloc_try_nid+0x3d/0xa0
> > > >     swiotlb_init_remap+0x149/0x2f0
> > > >     mem_init+0xb/0xb0
> > > >     mm_core_init+0x8f/0x350
> > > >     start_kernel+0x17e/0x5d0
> > > >     x86_64_start_reservations+0x14/0x30
> > > >     x86_64_start_kernel+0x92/0xa0
> > > >     secondary_startup_64_no_verify+0x194/0x19b
> > > > 
> > > > I don't know a lot about memblock, but it appears that it needs to
> > > > allocate more memory for it's regions array and returns a range of memory
> > > > that hasn't been accepted. When the memcpy() runs, the SNP guest gets a
> > > > #VC 0x404 because of this.
> > > > 
> > > > Do you think it is as simple as calling accept_memory() on the memory
> > > > range returned from memblock_find_in_range() in memblock_double_array()?
> > > 
> > > (not Kirill, but replying :) )
> > > 
> > > Yeah, we seem to be effectively allocating memory from memblock ("from
> > > ourselves") without considering that memory must be accepted first.
> > > 
> > > accept_memory() on the new memory (in case of !slab) should be the right
> > > thing to do.
> > 
> > Thanks, David. Let me add a call in for accept_memory in the !slab case
> > and see if that resolves it. May take a bit to repro, but should find
> > out eventually.
> > 
> > I'll submit a patch once I verify.
> 
> BTW, I was wondering if we could use memblock_alloc_range_nid() in
> memblock_double_array(); maybe not that easy, just a thought.

Not easy at all for memblock.reserved, memblock_double_array() makes sure
to avoid memory that's being reserved in this call chain:

memblock_alloc_range_nid()
	memblock_reserve()
		memblock_add_range()
			memblock_double_array()

 
> -- 
> Cheers,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.
