Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152242A82
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745464796; cv=none; b=Z+aGV3nj52HvdRvDOiGZa9VxHVLK8RvZ/sEnVrsv0d3IbpaHsjJ2CHXETtM+I1PgdzdKvufnfUuaoeANkvo9qtgTdIZ0HFcIPbErPed1+ojWUVAMV37PYSgH4mZaYOxcirpzyXsmAE3lvZFP0g6pD8F3R4yDniiuRblx8xyIoyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745464796; c=relaxed/simple;
	bh=p/JHZN5AEdHCeGt0IoxDMqzVTfr9TPtbMaHKRsG7adU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKHc9SqC3txKuCldf/UQsqQAIDsuF5uKrbc8Ky20mr+wg7JlYXHxTPgdo3xyUmItCIlhS9VhpnSycOByGimxdAq4TXBqInXX5Gpp0AUd6XAsXye/Rfa6UR+4OtpTeOAgh/qaJEThCyQ8mo6OoKiQKgsVRHETK71ena/hzZ/Vg+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jJpTxu8/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jJpTxu8/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u690wCMwhfUO4csc3E0cwZEDChOGhKpWac0W2zW2q+c=; b=jJpTxu8/MrrakHRU+9VIbxsRg2
	8z/BSiRxH0TeO9l5Woe+kfKWjPs7Cs+LARNdx/i9Fpu/ue21iKHbdRFV6Cu/oIeMwkkNHY6BOXRZS
	VUhZx+pLs4S6SZ+iqH8XXE/S7AKi5ITNUckiz+xtx7fJnnK+/x8NCxb0GP4dgWQvdJCOJB3SoQBBE
	drXXwsyqTjbs+dXGewgHt5enxhqIRvI5LCVRXfJRRLlGA9fMU55qcTiuZdxaEKKaub/XibRiUj2yB
	plCLdkIyKckDyMrObj3yfK4Wp+6x2CoL1kKUiPxMFqQAbTzKmyY3OfgkV5RCyxaKUUMCbqbOj77kQ
	YoFTYWPQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7n7k-0000000ApCi-1vFI;
	Thu, 24 Apr 2025 03:19:40 +0000
Date: Thu, 24 Apr 2025 04:19:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shivank Garg <shivankg@amd.com>, shaggy@kernel.org,
	wangkefeng.wang@huawei.com, jane.chu@oracle.com, ziy@nvidia.com,
	donettom@linux.ibm.com, apopple@nvidia.com,
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Subject: Re: [PATCH V4 1/2] mm: add folio_migration_expected_refs() as inline
 function
Message-ID: <aAmtzAv6ZbbRpKHM@casper.infradead.org>
References: <20250422114000.15003-1-shivankg@amd.com>
 <20250422114000.15003-2-shivankg@amd.com>
 <20250422164111.f5d3f0756ad94d012180ece5@linux-foundation.org>
 <aAg1-hZ0a-44WW6b@casper.infradead.org>
 <b84b6c31-578f-4abe-9b06-6e7cf4882eb3@redhat.com>
 <8f24de4d-5088-498a-968d-9e8bb85201ac@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f24de4d-5088-498a-968d-9e8bb85201ac@redhat.com>

On Wed, Apr 23, 2025 at 09:25:05AM +0200, David Hildenbrand wrote:
> On 23.04.25 09:22, David Hildenbrand wrote:
> > On 23.04.25 02:36, Matthew Wilcox wrote:
> > > On Tue, Apr 22, 2025 at 04:41:11PM -0700, Andrew Morton wrote:
> > > > > +/**
> > > > > + * folio_migrate_expected_refs - Count expected references for an unmapped folio.
> > > > 
> > > > "folio_migration_expected_refs"
> > > 
> > > What I do wonder is whether we want to have such a specialised
> > > function existing.  We have can_split_folio() in huge_memory.c
> > > which is somewhat more comprehensive and doesn't require the folio to be
> > > unmapped first.
> > 
> > I was debating with myself whether we should do the usual "refs from
> > ->private, refs from page table mappings" .. dance, and look up the
> > mapping from the folio instead of passing it in.
> > 
> > I concluded that for this (migration) purpose the function is good
> > enough as it is: if abused in wrong context (e.g., still ->private,
> > still page table mappings), it would not fake that there are no
> > unexpected references.
> 
> Sorry, I forgot that we still care about the reference from ->private here.
> We expect the folio to be unmapped.

Right, so just adding in folio_mapcount() will be a no-op for migration,
but enable its reuse by can_split_folio().  Maybe.  Anyway, the way I
explain page refocunts to people (and I need to put this in a document
somewhere):

There are three types of contribution to the refcount:

 - Expected.  These are deducible from the folio itself, and they're all
   findable.  You need to figure out what the expected number of
   references are to a folio if you're going to try to freeze it.
   These can be references from the mapcount, the page cache, the swap
   cache, the private data, your call chain.
 - Temporary.  Someone else has found the folio somehow; perhaps through
   the page cache, or by calling GUP or something.  They mean you can't
   freeze the folio because you don't know who has the reference or how
   long they might hold it for.
 - Spurious.  This is like a temporary reference, but worse because if
   you read the code, there should be no way for there to be any temporary
   references to the folio.  Someone's found a stale pointer to this
   folio and has bumped the reference count while they check that the
   folio they have is the one they expected to find.  They're going
   to find out that the pointer they followed is stale and put their
   refcount soon, but in the meantime you still can't freeze the folio.

So I don't love the idea of having a function with the word "expected"
in the name that returns a value which doesn't take into account all
the potential contributors to the expected value.  And sure we can keep
adding qualifiers to the function name to indicate how it is to be used,
but at some point I think we should say "It's OK for this to be a little
less efficient so we can understand what it means".
