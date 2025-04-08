Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD4D227EBD;
	Tue,  8 Apr 2025 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105479; cv=none; b=iGTLeggCl1S8IkxpHwOuTz0liWTN1Y39aHhJb4BwCEnXdKdGxBn6KHYe3hsZYYANl06wMvmlAxLJ32qasBRMnvHABpyef8a3m4yKtFJ3l7JVbYCXid1E62e1MyyDVmofF7qwXpT7ddVEk18H85SHh/NWum7mNHskcitCg0y+fHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105479; c=relaxed/simple;
	bh=qGJrTesZCjcQE7T5S3kt4lybhOjqvF09IifpDAL1cgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgPhlayNHNqb2iQ401bZ9eWOnMJRFci+kmkwMDfeJGdLnAYJTecfJUhyltzEctGcP15ulsut5mpJq0c2O4iWMaWldss66hmLSffoOOfnu4bwZl2MjGBM/j1r4LhFYihRp/m5wCKMYAtR501w5hgWAfuA27fxGocZVOGUiGOLoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pankajraghav.com; spf=none smtp.mailfrom=pankajraghav.com; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pankajraghav.com
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZX1Ps48gkz9tYJ;
	Tue,  8 Apr 2025 11:44:33 +0200 (CEST)
Date: Tue, 8 Apr 2025 11:44:22 +0200
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, willy@infradead.org, 
	linux-mm@kvack.org, Bagas Sanjaya <bagasdotme@gmail.com>, da.gomez@kernel.org, 
	mcgrof@kernel.org, gost.dev@samsung.com, linux-doc@vger.kernel.org, 
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
Message-ID: <spuuu4rg3awuakis2qepqob33nj6ex2w2p7u4jbdv4fhvicnxe@dcec3e3eaz53>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
 <f4924ad4-c70b-4999-b595-01c488607189@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4924ad4-c70b-4999-b595-01c488607189@redhat.com>
X-Rspamd-Queue-Id: 4ZX1Ps48gkz9tYJ

On Fri, Apr 04, 2025 at 09:16:10PM +0200, David Hildenbrand wrote:
> On 04.04.25 16:06, Pankaj Raghav (Samsung) wrote:
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
> 
> BTW, we should go over the whole document and bring it up to date.
> Interestingly, it starts with
> 
> "Performance critical computing applications dealing with large memory
> working sets are already running on top of libhugetlbfs and in turn
> hugetlbfs. Transparent HugePage Support (THP) is an alternative mean of
> using huge pages for the backing of virtual memory with huge pages
> that supports the automatic promotion and demotion of page sizes and
> without the shortcomings of hugetlbfs.
> 
> Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> But in the future it can expand to other filesystems."

As a part of this patch, I do change 2nd paragraph:

-Currently THP only works for anonymous memory mappings and tmpfs/shmem.
-But in the future it can expand to other filesystems.
+Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
+filesystems that support large folios.

Do we need to add more changes to the first paragraph as well?

--
Pankaj
