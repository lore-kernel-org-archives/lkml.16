Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F2254AFB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191046; cv=none; b=D8KVhkztmh0tUhQ3g8pCslYd1VqBOoPazrhicfXxexbBYaIrq4I3q6rUzXFcWrPQhP+2fFBMb4orj1KJkgR9z45ak6objf+AE2t38j3qVasWUJKgqyQARWM+qugUwdrQlOtEPG0NzVllzo7dPhMq5hh5UHw5zVhYnnEWAhJ8hjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191046; c=relaxed/simple;
	bh=Z5M0foWNFn5Pxj93pxmwvm4RAl1oCD3uWimtnUIRWa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHAaX3CJZ2UfQ/KUUBSf4Ggrx01qtIGuanR0uTLZuGHCYjCK7lJ9ZoBp76nHtnQnzu/0uowOHgwodLzzhgoifNA6utB4qxmHALitx2GpizkeSDGtaqj2Sc1SQhgBY4DonpL3VTgW9xgCWtE18pFjM6MB0q7a++kWL2y3AHNeF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CfBcORtE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CfBcORtE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EXHTi0wkEODS8HPIZd3aLUlx7XjPC9CvhHuCiNFzwS4=; b=CfBcORtERcHUouS6CToeHdF1/a
	GOA1ObdAVZEzq6oGrTEsDk0LP1OjLdSTCY4vGkxFOiAOaeM6k3quLoTGPRBIMsZPDsiYadP3wFZEF
	gidawGZbWMUQFU3hv+byav1KqRZ7a4gWkE+7V8aBDlEsjwVUj0DT1zRB6BergjwKIgMT6LlGybBD8
	Axnlnkzv1BOsuqJgNwQWcFgsRN1lOW4ZMWvT7CIOhRFHxhLhb0iItHk8ILRmfR4X4+Lysrf5acdVI
	9ys996M9hElPMkczlzvhNQndcZW+1PPciCqwzZ3e70KvHivZ/QHDJc06Nw6pxBe+PlcSHLj60eLSs
	Ah2WYhHw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAq3Q-00000000Tvj-0u6P;
	Fri, 02 May 2025 13:03:48 +0000
Date: Fri, 2 May 2025 14:03:48 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ignacio.MorenoGonzalez@kuka.com
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
Message-ID: <aBTCtOXBhUK_FLU6@casper.infradead.org>
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>

On Fri, May 02, 2025 at 11:31:41AM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> 
> commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
> the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
> CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
> VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
> with MADV_NOHUGEPAGE, an error is always returned.

Isn't that the real problem though?

+++ b/include/linux/huge_mm.h
@@ -596,6 +596,8 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 static inline int hugepage_madvise(struct vm_area_struct *vma,
                                   unsigned long *vm_flags, int advice)
 {
+       if (advice == MADV_NOHUGEPAGE)
+               return 0;
        return -EINVAL;
 }


