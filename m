Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057472B9A9;
	Wed, 30 Apr 2025 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023998; cv=none; b=jnvt87qJme7ZDkKtMCoInRRB3/d099xh+EVxQbLSoj6LHxakMSXNH03v4XYyMfxAH1oyGwKbZseawJQ40urBrR4A5I6X2H+UxnaSMF0/c3KWLVTPz156xcAzylR4A3xIIvk9O2pbdcKm4F5030XO3EJgompXMiLbWB5r9eUhAcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023998; c=relaxed/simple;
	bh=odob20u9gDP5puX+nz314ZVRMvgs918mZ3ed9/j6RPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn+BCMIDOoCZSmCWz97nEuFCsUBko/Z4TBBtspBuSK7znle1z4l3ETjWLPTFrN8IV4zkAyUKxJ/emQuf0DXGXnPcnuws84auLIEYMxVB2iv1Mp1uZ1YZDSe4PgB7Ez1THx1rzkqMixegm99Zb5lv9dF+SO+zwWIW1+X8SGmfGE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK+M498k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK+M498k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F64C4CEE7;
	Wed, 30 Apr 2025 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746023997;
	bh=odob20u9gDP5puX+nz314ZVRMvgs918mZ3ed9/j6RPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lK+M498ksZ2dH6z0RhfSK8AzeE6JHg+SLeElHqJs2cVSeVMVtNHn+iPNmtuz5PA1j
	 cFYGv39PHZNBY91GsDy2+JqSA4RAJ9cqDDFnazFk3IEtQ+0NnQ6V1lmgQduMGjwoNi
	 xF9SVDavuUdgvlGjAP71OAsY0vXQLnUY/iFkKiwRfca/uSdt14aj5g08iHOjs1yMM3
	 NQN7oZV0+egF5S6HmwuJuDK4YBR73T06k16wi2LIFxlmELvcZIwGvaXaN8diqRqvWR
	 vwsCz/NCURJySTZ6JF4sTWKtqIF0bkn0iOeu7TfDBQ09NBCvivE6Sf6VBDKYh+07M0
	 jGuswI+IzbVbw==
Date: Wed, 30 Apr 2025 17:39:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mel Gorman <mgorman@techsingularity.net>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Roth <michael.roth@amd.com>
Subject: Re: SNP guest crash in memblock with unaccepted memory
Message-ID: <aBI2N-aUSXgLOgF0@kernel.org>
References: <f12f5bd0-135b-91fd-9703-7df98500f9c5@amd.com>
 <b037ffeb-bfeb-41a6-b200-d8c57076370f@redhat.com>
 <43o2gni2stscuwjfr2cyawn4ikcfhsroact6t7civ3ud3e6sgi@jizmzw7lpzvt>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43o2gni2stscuwjfr2cyawn4ikcfhsroact6t7civ3ud3e6sgi@jizmzw7lpzvt>

On Wed, Apr 30, 2025 at 12:14:08PM +0300, Kirill A. Shutemov wrote:
> On Mon, Apr 28, 2025 at 04:04:50PM +0200, David Hildenbrand wrote:
> > On 27.04.25 17:01, Tom Lendacky wrote:
> > > Hi Kirill,
> > > 
> > > Every now and then I experience an SNP guest boot failure for accessing
> > > memory that hasn't been accepted. I managed to get a back trace:
> > > 
> > >    RIP: 0010:memcpy_orig+0x68/0x130
> > >    Code: ...
> > >    RSP: 0000:ffffffff9cc03ce8 EFLAGS: 00010006
> > >    RAX: ff11001ff83e5000 RBX: 0000000000000000 RCX: fffffffffffff000
> > >    RDX: 0000000000000bc0 RSI: ffffffff9dba8860 RDI: ff11001ff83e5c00
> > >    RBP: 0000000000002000 R08: 0000000000000000 R09: 0000000000002000
> > >    R10: 000000207fffe000 R11: 0000040000000000 R12: ffffffff9d06ef78
> > >    R13: ff11001ff83e5000 R14: ffffffff9dba7c60 R15: 0000000000000c00
> > >    memblock_double_array+0xff/0x310
> > >    memblock_add_range+0x1fb/0x2f0
> > >    memblock_reserve+0x4f/0xa0
> > >    memblock_alloc_range_nid+0xac/0x130
> > >    memblock_alloc_internal+0x53/0xc0
> > >    memblock_alloc_try_nid+0x3d/0xa0
> > >    swiotlb_init_remap+0x149/0x2f0
> > >    mem_init+0xb/0xb0
> > >    mm_core_init+0x8f/0x350
> > >    start_kernel+0x17e/0x5d0
> > >    x86_64_start_reservations+0x14/0x30
> > >    x86_64_start_kernel+0x92/0xa0
> > >    secondary_startup_64_no_verify+0x194/0x19b
> > > 
> > > I don't know a lot about memblock, but it appears that it needs to
> > > allocate more memory for it's regions array and returns a range of memory
> > > that hasn't been accepted. When the memcpy() runs, the SNP guest gets a
> > > #VC 0x404 because of this.
> > > 
> > > Do you think it is as simple as calling accept_memory() on the memory
> > > range returned from memblock_find_in_range() in memblock_double_array()?
> > 
> > (not Kirill, but replying :) )
> > 
> > Yeah, we seem to be effectively allocating memory from memblock ("from
> > ourselves") without considering that memory must be accepted first.
> > 
> > accept_memory() on the new memory (in case of !slab) should be the right
> > thing to do.
> 
> Right, it should do the trick.
> 
> BTW, Mike, is there any other codepath where memblock allocates memory for
> itself? We need to cover them too.

memblock_double_arrayi() is the only place where memblock allocates memory
for itself.
 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov

-- 
Sincerely yours,
Mike.
