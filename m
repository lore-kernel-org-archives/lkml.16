Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4BE1E1DE5;
	Fri,  4 Apr 2025 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743784292; cv=none; b=QxpzxfsSNWgwRAmdW+KCS8KC6SW5XOJAQJOoz5xu25IdLBGLNFZegLNm6FaJrtSDISy+ZjgmOO1P6SOHJNjEuik13yX1DQY2xBVrUFjC/R8vhtMVbHf+fNiPlzSThiVpWX9VTvOcuOXHifknahuJhNRFBHqihHnTYxjfzzs0gX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743784292; c=relaxed/simple;
	bh=KWkDvNu6blQIO6Kz+QbMPY3hHMdMHjuMkFHK0h8ygzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nitBgtPqAfA89EAYiw43CKV3QIVh+VLb+I4eQvR+52JrLH02xnleYcv4CyJkSTy+EHqCYLnWQle3353Uu7VUlQutnPEFFE3oyj6iGfrnoy4KuUrNpXH8NZ7vb/C8dYfPs0wdJIzzo2t9AS+YHVLde4/NteeGR5uVSeOuSNSK2Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=YDseWwgp; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="YDseWwgp"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZTkdB1w5Cz9slr;
	Fri,  4 Apr 2025 18:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1743784286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fjwud8ak6+xfC04y1eWrvVdmASw0v1ZoTEzAJrACWAo=;
	b=YDseWwgp4DPdW+9UfcNzBwdjuUPiX9bS881tFQiODJY1V1Cqp1NwQfkP+TSOkudURmJ/qB
	1wtFGHU8INphOGB+e4bplll0ucaGwH5dAG+FhV2+O9gAxqEGWaGuo+l5l2viNqmDgW/noc
	Z6pNvEsR6P5zuMgBQY9gjRumtzqYxVjA3vA6+ccMQDhM1DfyM3tjwQYgVTFA+Z3I67EPg5
	kY9spDYtP7en+7eXOIPhIs5Dt5b2BwHinClNA1BMyCezvryIDTZLCq4HBEYnxz8GUFieFW
	nrq05PLgW2WrEeni5iHRARJDppH4Nmdf+ZhmPCOsNb1THvDg00LkQY3CjaQ9dg==
Date: Fri, 4 Apr 2025 18:31:16 +0200
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, willy@infradead.org, 
	linux-mm@kvack.org, Bagas Sanjaya <bagasdotme@gmail.com>, 
	David Hildenbrand <david@redhat.com>, da.gomez@kernel.org, gost.dev@samsung.com, 
	linux-doc@vger.kernel.org, Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
Message-ID: <qy52tvn6atrlt5rhgzbtueyqbs56ik3rfg2b7yopynhhoipvtj@qph743k6m7kg>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
 <Z-_7fzU02OU1hVOT@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_7fzU02OU1hVOT@bombadil.infradead.org>

On Fri, Apr 04, 2025 at 08:32:15AM -0700, Luis Chamberlain wrote:
> On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
> > From: Pankaj Raghav <p.raghav@samsung.com>
> > 
> > THP support for non-tmpfs filesystem has been around for some time now.
> > Update the admin guide to reflect it.
> > 
> > While we are at it, move FilePmdMapped to previous paragraph for clarity,
> > and clarify ShmemPmdMapped & ShmemHugePage.
> > 
> > Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > ---
> > 
> > Changes since v2:
> > - Address comment from Bagas Sanjaya
> > - Squash commits and Ack from David
> > 
> >  Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
> >  1 file changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> > index dff8d5985f0f..f8aae64e38d0 100644
> > --- a/Documentation/admin-guide/mm/transhuge.rst
> > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
> >  that supports the automatic promotion and demotion of page sizes and
> >  without the shortcomings of hugetlbfs.
> >  
> > -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> > -But in the future it can expand to other filesystems.
> > +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> > +filesystems that support large folios.
> 
> That seems to allude that THP can be supported on filesystems
> that suppor large folios. I don't think we want to call that THP

But we do allocate a THP in the page cache if we support large folios.

See [1] where THP was supported through page cache. From what I
understand, THP support was added first to the page cache and then large
folios (orders in between) support came later.

For example, you can mount XFS and do a simple dd as follows:

$ dd if=/dev/random of=/mnt/hello bs=1G count=2

And if you monitor `FileHugePages` after dd is done, it would have filled
up if THP is enabled.

> and that can confuse folks. Leaving "currently" also seems to
> indicate that there is more work to be done for THP for filesystems
> but that's not true as well. So how about something like:

There is more work to be done in the filesystems right? Adding large
folio support is the prerequisite here to get the THP support.

> 
> THP only works for anonymous memory mappings, and the tmpfs/shmem is the only
> filesystem to support it. The alternative to THP for other filesystems is to
> support large folios and with it you can end up using huge pages
> opportunistically.
> 
>   Luis

[1] https://lore.kernel.org/linux-mm/20201029193405.29125-1-willy@infradead.org/

--
Pankaj

