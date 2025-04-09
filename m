Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69166EEB3;
	Wed,  9 Apr 2025 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189603; cv=none; b=AK6UQnjaEijDn7dfaXXuKi3+tVSPc3wXMO+AIBZY9nhH3qkkeAvE1YZvSUdYsMyYokhf4J2C39HYpCc1RnbUy8vCi+53ENBu+klfR6vXnoWO/VJBrhBe8Cl9SfhdLBWNIGxe6VWT18i1lIq0qsW20Nh5LM5uTncgACudN4lRunU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189603; c=relaxed/simple;
	bh=/s+U51p2rme6ttKunG01nE4+T3pq5eYIYautG/ah3Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJew9nGtLEauv02E4+7E4tuAqjcTJuTJH9uMhVXqe8yaTGTy0uO88VOBLgwP102lfDH0McjiK+KcQ42r6K7fbxg/c9ckjdm/F6550gcE/V5CK6jSXVPSaKuCDc7jIIs7HPf3dGkO63z3bUrQkBs/VvNmDAy3NlCgTRNCvU5ri2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eerjUQlv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eerjUQlv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20181C4CEE3;
	Wed,  9 Apr 2025 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744189602;
	bh=/s+U51p2rme6ttKunG01nE4+T3pq5eYIYautG/ah3Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eerjUQlvNJF+OcsvIsqmEbAp/QAZ/fvQAZPtZABd4PBsB7L/b4Q5V00nkAKW7iTGB
	 fOWeKV/HJ/ib1NS32lxrfK674W4vSwxOS/yrVTY0c7xJyhbfGDcT9JWQU5S0ZYKolL
	 bIKUumb/XfD+cSCkjS6jADB/RYMB7aQ2g7eLdflW7X+exTmDyUGTqcW+pVSPt4uoGZ
	 oTqY7MD0cLXyIw8SnWTcPccndUqN9w/kWekQURRgNXJsL+uDtiwyA58zBUMHEEnuxs
	 chk5n2/7cxnMmUCrsFmejaBdPXgvCnJLEGYHXd5nkJcUyqeHVzitwPYKYPg2Ps+4hN
	 M2oTs57z8vEAg==
Date: Wed, 9 Apr 2025 12:06:27 +0300
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
Message-ID: <Z_Y4k4rDO-BbMjqs@kernel.org>
References: <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
 <Z_P92UCbNCV0TbiA@kernel.org>
 <20250407170305.GI1557073@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407170305.GI1557073@nvidia.com>

On Mon, Apr 07, 2025 at 02:03:05PM -0300, Jason Gunthorpe wrote:
> On Mon, Apr 07, 2025 at 07:31:21PM +0300, Mike Rapoport wrote:
> >
> > Ok, let's stick with memdesc then. Put aside the name it looks like we do
> > agree that KHO needs to provide a way to preserve memory allocated from
> > buddy along with some of the metadata describing that memory, like order
> > for multi-order allocations.
> 
> +1
> 
> > The issue I see with bitmaps is that there's nothing except the order that
> > we can save. And if sometime later we'd have to recreate memdesc for that
> > memory, that would mean allocating a correct data structure, i.e. struct
> > folio, struct slab, struct vmalloc maybe.
> 
> Yes. The caller would have to take care of this using a caller
> specific serialization of any memdesc data. Like slab would have to
> presumably record the object size and the object allocation bitmap.
> 
> > I'm not sure we are going to preserve slabs at least at the foreseeable
> > future, but vmalloc seems like something that we'd have to address.
> 
> And I suspect vmalloc doesn't need to preserve any memdesc information?
> It can all be recreated

vmalloc does not have anything in memdesc now, just plain order-0 pages
from alloc_pages variants.

Now we've settled with terminology, and given that currently memdesc ==
struct page, I think we need kho_preserve_folio(struct *folio) for actual
struct folios and, apparently other high order allocations, and
kho_preserve_pages(struct page *, int nr) for memblock, vmalloc and
alloc_pages_exact.

On the restore path kho_restore_folio() will recreate multi-order thingy by
doing parts of what prep_new_page() does. And kho_restore_pages() will
recreate order-0 pages as if they were allocated from buddy.

If the caller needs more in its memdesc, it is responsible to fill in the
missing bits.
 
> > > Also the bitmap scanning to optimize the memblock reserve isn't
> > > implemented for xarray.. I don't think this is representative..
> > 
> > I believe that even with optimization of bitmap scanning maple tree would
> > perform much better when the memory is not fragmented. 
> 
> Hard to guess, bitmap scanning is not free, especially if there are
> lots of zeros, but memory allocating maple tree nodes and locking them
> is not free either so who knows where things cross over..
> 
> > And when it is fragmented both will need to call memblock_reserve()
> > similar number of times and there won't be real difference. Of
> > course maple tree will consume much more memory in the worst case.
> 
> Yes.
> 
> bitmaps are bounded like the comment says, 512K for 16G of memory with
> arbitary order 0 fragmentation.
> 
> Assuming absolute worst case fragmentation maple tree (@24 bytes per
> range, alternating allocated/freed pattern) would require around
> 50M. Then almost doubled since we have the maple tree and then the
> serialized copy.
> 
> 100Mb vs 512k - I will pick the 512K :)

Nah, memory is cheap nowadays :)

Ok, let's start with bitmaps and then see what are the actual bottlenecks
we have to optimize.
 
> Jason

-- 
Sincerely yours,
Mike.
