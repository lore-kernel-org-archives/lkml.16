Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD351B0F23
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744740067; cv=none; b=iRa7OIIEDz6AfaqOvQFTndc4EY5V8RIK7jENqfxYAL3Z8VtsMtUqxXKoUeTwbLUysjiPkclrN86Xm9nNrWEPgFjBNSf7GcinYUqE5xAjn19dJcbBXBUzv/W1+wBbb+YDs3moE56sXD1Rq6rubMjpk+qadSbRVvZpeU1jnCwFRRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744740067; c=relaxed/simple;
	bh=Nyzb63+6ECw80+pUwzVBdX+d5cp/0OnVvi2FidZOps4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL2WsOxVm9fWU1yJE2g2xH3bOW9qO3+uqMVqmWCfI9LPFeiK27kTOlh80RJCXk5IF8SMnpMufCy9qvroLQpK+vrAgJbEQHW+XZ3aCPEI4A8NikHTN4KrZP81uvabGZYGj4bgeLyQ/68Yf232g7Dbwb1BwaCdV+nhmlhjXeM88kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ax5/05cm; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ax5/05cm"
Date: Tue, 15 Apr 2025 11:00:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744740059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Mo25pBuBWiN307HIbqRzDBZRU7fU/K2LqdF6ML5T2o=;
	b=ax5/05cmrpg2/AeaSBKsb2/ealQFqKIK4UHWFFhwkppTdUcbnPQIiCF1SQn3VD+10qsAyU
	IBm0Wto5C8Z7bRZgIFvzEd+gYNyPqV1FbBnsE3lZS4cSui65FvUtTf6hzWc0Dnd9WVJJ4r
	WwPyk3jbp1rgUBWSdpPfAIs7Ty3kvOw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
Message-ID: <g6u6f5euahanr5tmhjakxude6eswz6vl245sdzmhsjwv34pz7h@cleoudcjnwfr>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
 <bxgksbw7qplw3pp7gpve2ir63oyds7mxsnvprz45fj6oadotm5@syvchqjd2n6z>
 <0e796032-4f6d-4b7c-9ce6-6519f8f245af@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e796032-4f6d-4b7c-9ce6-6519f8f245af@lucifer.local>
X-Migadu-Flow: FLOW_OUT

On Tue, Apr 15, 2025 at 04:43:41PM +0100, Lorenzo Stoakes wrote:
> On Tue, Apr 15, 2025 at 11:37:04AM -0400, Liam R. Howlett wrote:
> > * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250415 09:11]:
> > > We place this under memory mapping as related to memory mapping
> > > abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
> > > separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
> > > files, so this should encapsulate the majority of the mm locking logic in
> > > the kernel.
> > >
> > > Suren is best placed to maintain this logic as the core architect of VMA
> > > locking as a whole.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > ---
> > >  MAINTAINERS | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8d834514a047..ce55676a16a4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15595,6 +15595,21 @@ F:	mm/vma_internal.h
> > >  F:	tools/testing/selftests/mm/merge.c
> > >  F:	tools/testing/vma/
> > >
> > > +MEMORY MAPPING - LOCKING
> > > +M:	Andrew Morton <akpm@linux-foundation.org>
> > > +M:	Suren Baghdasaryan <surenb@google.com>
> > > +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > > +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > +R:	Vlastimil Babka <vbabka@suse.cz>
> > > +L:	linux-mm@kvack.org
> > > +S:	Maintained
> > > +W:	http://www.linux-mm.org
> > > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > +F:	Documentation/mm/process_addrs.rst
> > > +F:	include/linux/mmap_lock.h
> > > +F:	include/trace/events/mmap_lock.h
> > > +F:	mm/mmap_lock.c
> >
> > It would be good to have more M's here in the case Suren is away or
> > whatever.
> >
> > I have worked on the mmap locking due to the maple tree addition, and I
> > have helped with vma locking in some areas.
> >
> > Lorenzo wrote the locking document, which Suren pointed out last mmap
> > lock meeting and does make locking changes.
> >
> > Are there others that could be M here?
> 
> I mean I'm fine to take an M here, based on having done _some_ work in this
> area and being involved in the meetings and documenting, though I'd largely
> defer to Suren who was the true expertise, and I also feel Liam has better
> knowledge than I do.
> 
> So I suggest probably, unless there are other viable and active takers, we
> should M myself and you Liam?
> 
> >
> > Shakeel and/or Jann might be good additions to this list somewhere
> > (looking at the edits to the file).
> 
> Don't mind R in these cases if Shakeel or Jann want of course :),

Thanks Liam. I don't mind an R here if you decide to send a new version.

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>

