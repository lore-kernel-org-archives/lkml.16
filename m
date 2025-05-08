Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C8EEAA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709937; cv=none; b=WT4va3ad2LXQidId9FK01GkcGjY9kVtpPGQpnYvTTFZSHmeZsfX5m3EpBiCFvK+gV7Tf3UPMYfCn4PwPTlqtvcbnywSZDRHc67sBQCCrPNrpgIikqVj2J6w17DWo4CkZSgT6UzzSWpOBqSfGDIT2I2eVLYaPUb7+QgU3Ycd6wWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709937; c=relaxed/simple;
	bh=zKu/wk/UL+zPGGVmR3pC6Wob7lQ2T4U3VbXoDxoz2Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdyT2Feo9D+59hUq4Kl9CPaQToPLuVleymWtMbDYrgYOBY1xhGE7Lay0B5CDcHN7aAmIPIr4VjA1cJeTZ7Z3Dgk2+jXT3R6MV//HpgDXItPQSUvrYoC2WoEcmekV75IZQ1tjj5/BQNmnCBbm9/5z2bBhwwomUwWFT4JCCaToa0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=f8/Vipcb; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f8/Vipcb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZXNsBRZPu/xThTTrtIQSnufM6LFKDcO3TPDgoFJD0O8=; b=f8/VipcbnCd6DUJ7G2u+1+evQ6
	tQAEs2eTQnY+3RjRue9M+asIHx2EvX5Iq20eVyg3pGQfZn4er1oXTzQ7opuF22aqViLxFE3ox/Dlx
	gb5TTGccy0XYs3eVl089/nnLcs0M/vV6jcELp8913KkdWhIkc06w00LEvOdH5oKD8fqJ//1697R6i
	NZdHAGSixjRc+ANNU9U/mSmVIPVuPeV+aZJPMtq6MIF3ecTK6POw4wdYxN+CAiPZ3IeK8O6F1tuI3
	FQFd+02oeFdfZjBgAClIW8VJ29oBTn8G/gQWHNndJAYqZlmrCJh/dxxrpxCNKcpICuCOwhzTc0AEO
	8YYAHr/w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD12i-00000000Xj7-12ac;
	Thu, 08 May 2025 13:12:04 +0000
Date: Thu, 8 May 2025 14:12:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	akpm@linux-foundation.org, hannes@cmpxchg.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
Message-ID: <aBytpMWqzfjgIy4U@casper.infradead.org>
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtNrQNlL7hjLrTZ@casper.infradead.org>
 <d2348cc3-c9c6-4df0-82b6-1105edd44a75@redhat.com>
 <A243EBEA-22E7-4F57-9293-177500463B38@nvidia.com>
 <a5056791-0a3e-40f6-bb83-7f39ef76b346@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5056791-0a3e-40f6-bb83-7f39ef76b346@redhat.com>

On Thu, May 08, 2025 at 09:36:02AM +0200, David Hildenbrand wrote:
> > > Which raises an interesting question: I assume in the future, when we have a 4 MiB folio on x86-64 that is *misaligned* in VA space regarding PMDs (e.g., aligned to 1 MiB but not 2 MiB), we could still allow to use a PMD for the middle part.
> > 
> > It might not be possible if the folio comes from buddy allocator due to how
> > buddy allocator merges a PFN with its buddy (see __find_buddy_pfn() in mm/internal.h).
> > A 4MB folio will always be two 2MB-aligned parts. In addition, VA and PA need
> > to have the same lower 9+12 bits for a PMD mapping. So PMD mappings for
> > a 4MB folio would always be two PMDs. Let me know if I miss anything.
> 
> PA is clear. But is mis-alignment in VA space impossible on all
> architectures? I certainly remember it being impossible on x86-64 and s390x
> (remaining PMD entry bits used for something else).

Yeah, that's not possible; the PMD is always PMD-aligned.
