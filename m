Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B82170A2B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195439; cv=none; b=HuTlOmaqceCVxNAhyN/8BSpMwvFg4vGE04oXq07Y6pc4e7dqNuhcNjYS3nBSp+4oI9/Eea1B2KG2awqL82VuLouQu6IpYGWSKiVHEhaoigZXsYIYSdp3MMqVP6nopOhoRQ3jk7hxO/soc3eVDf7CfrHFNHSM6J4o9zuLIR+p0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195439; c=relaxed/simple;
	bh=wje2Jf63+Uw4AwE+ReIeDCfh5HZVcSQgF5n/p19Y15E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBJLzfCrRh+JTmkewQKr6GSTtgXwFW6mYw/9TEoh2PKWbaRwAiblkSMCc+wM5p9BUN8fO9G6qT+JUue8Du939+U/FLwdn34TXhqnI1YNnORWz3HLFZxbFtNnQWtXjwjCvXtXY5KOWXobbBXuttECc4d0IguAkXzEb268i1zbXfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E2slgWfg; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E2slgWfg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N5BPCNx3medevuKtUngZzdL1QbG81GRvijuRIVoCR7I=; b=E2slgWfgbsgEWQHiSDoJfni2bH
	ueiu+xiNPJbtwoOTBQ2ubHM8si35L7WKSzhU5x8zic6QFy/usvtvvMtrd8Ucn7SRXUhExim+SPFjm
	baF1P4swjeSKb1NqBpNR1+Lt72QDIkllz+BtT1OQe1xTuM0qAxttnTuwmWzZgmZGBrdRXFTOIQmdH
	c6jpaYWy8DTsrO7nknzU9AA5pQhwWqTQSLgm9dc+rFnmI/Y/rsxy8l8CYc7HQ7RwAhWjFLdq8onzV
	u/nM8rQC1z874fOCcZrhbZyqvAWtTbZMj9m4u8FUnRPIfktz+tCNTG0VG/TSZa98tyKx64eTorSht
	Fehjlivw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArC8-00000002UIK-3S4j;
	Fri, 02 May 2025 14:16:52 +0000
Date: Fri, 2 May 2025 15:16:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ignacio.MorenoGonzalez@kuka.com, Liam.Howlett@oracle.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
Message-ID: <aBTT1JIz17g_2pM7@casper.infradead.org>
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
 <aBTCtOXBhUK_FLU6@casper.infradead.org>
 <3de8814b-9964-489c-8d13-feb319623b82@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3de8814b-9964-489c-8d13-feb319623b82@lucifer.local>

On Fri, May 02, 2025 at 02:12:16PM +0100, Lorenzo Stoakes wrote:
> On Fri, May 02, 2025 at 02:03:48PM +0100, Matthew Wilcox wrote:
> > On Fri, May 02, 2025 at 11:31:41AM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
> > > From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> > >
> > > commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
> > > the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
> > > CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
> > > VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
> > > with MADV_NOHUGEPAGE, an error is always returned.
> >
> > Isn't that the real problem though?
> 
> Hmm, but wouldn't we want users who are trying to set MADV_[NO]HUGEPAGE to
> be made aware that it isn't going to do anything?

... I thought the patch was clear.  Only setting NOHUGEPAGE becomes a
no-op.  Setting HUGEPAGE remains EINVAL.

> And wouldn't changing this be a possibly 'breaking userspace' thing if
> somebody somewhere relies on this?

I don't see what userspace could rely on it returning EINVAL, since it
won't on a kernel which has THP enabled.

> Also this will make this inconsistent with e.g. MADV_COLLAPSE also?

Not sure how ...

