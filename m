Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489513AF2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746482613; cv=none; b=LAyCZ+00mbkOaN338u0wX3lrme/Lqbb3aLp5m6q5+353Ee9+J23CfVchkBC2o7xOPOXJDCzjDIhUwXB8v0LkjNFIG5mThzGzRYVV9FYi2dGUq6oz6S09uViA4QsApwKf7mjOcBWHFhVXdKFaDKe9363/EnqWh5R/dHMNmdSziPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746482613; c=relaxed/simple;
	bh=LiuxTPu0KyN+dFzDqmlY6HziRv4Sm5L8NJ0NSvp2MBA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=G78qZDIllxc0NBOhbBUQ53P+jhqOX2R1yp+lDOUdZklSuVj1b06IR2EoPNvESunqN5r8xj6f1cWsanhHRC8Et6uVS3LB62mtNBg65c18LqLnd+kCuMaHGPN0cAy9O3TDPKhcC2lAzl493Pa16YxRrUKyBqfF2Sk7rvcegPHvt4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CQgZ1G9Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CQgZ1G9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C81C4CEED;
	Mon,  5 May 2025 22:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746482611;
	bh=LiuxTPu0KyN+dFzDqmlY6HziRv4Sm5L8NJ0NSvp2MBA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CQgZ1G9Y/fWXG0L/lcYaZvELd9ZMFv5hwC7/WgtE3cXGh7BZQTyq9+WGO0RZqbOWZ
	 cJhTbqbbGAMEytO1JLDrKBUm8XpHqEPerJ2L2OzZB2PclyojsfNjzxTixwdVsGe0tU
	 W01GH3041jjPS9NnQca+eklydUZ5MwPj8irE2TLY=
Date: Mon, 5 May 2025 15:03:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, willy@infradead.org, osalvador@suse.de,
 mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Fan Ni
 <fan.ni@samsung.com>
Subject: Re: [PATCH v4 4/4] mm/hugetlb: Convert use of struct page to folio
 in __unmap_hugepage_range()
Message-Id: <20250505150330.58874d0435095421a30e8c30@linux-foundation.org>
In-Reply-To: <20250505182345.506888-6-nifan.cxl@gmail.com>
References: <20250505182345.506888-2-nifan.cxl@gmail.com>
	<20250505182345.506888-6-nifan.cxl@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  5 May 2025 11:22:44 -0700 nifan.cxl@gmail.com wrote:

> From: Fan Ni <fan.ni@samsung.com>
> 
> In __unmap_hugepage_range(), the "page" pointer always points to the
> first page of a huge page, which guarantees there is a folio associating
> with it.  Convert the "page" pointer to use folio.
> 
> ...
>
>  		 * Restore the reservation for anonymous page, otherwise the
> @@ -5950,8 +5951,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		 * reservation bit.
>  		 */
>  		if (!h->surplus_huge_pages && __vma_private_lock(vma) &&
> -		    folio_test_anon(page_folio(page))) {
> -			folio_set_hugetlb_restore_reserve(page_folio(page));
> +		    folio_test_anon(folio)) {
> +			folio_set_hugetlb_restore_reserve(folio);
>  			/* Reservation to be adjusted after the spin lock */
>  			adjust_reservation = true;
>  		}
> @@ -5975,16 +5976,17 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  				 * count will not be incremented by free_huge_folio.
>  				 * Act as if we consumed the reservation.
>  				 */

I did not enjoy reading the above comment, so I did this to it.

The comment would be better if it described why we "Act as if we
consumed the reservation.".  "why, not what".


From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm/hugetlb.c: __unmap_hugepage_range(): comment cleanup
Date: Mon May  5 02:54:25 PM PDT 2025

Wrap to 80 cols, fix a typo, use regular layout, parenthesize function
identifiers, fix grammar and add braces.

Cc: David Hildenbrand <david@redhat.com>
Cc: Fan Ni <fan.ni@samsung.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/hugetlb.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

--- a/mm/hugetlb.c~mm-hugetlbc-__unmap_hugepage_range-comment-cleanup
+++ a/mm/hugetlb.c
@@ -5969,16 +5969,19 @@ void __unmap_hugepage_range(struct mmu_g
 		if (adjust_reservation) {
 			int rc = vma_needs_reservation(h, vma, address);
 
-			if (rc < 0)
-				/* Pressumably allocate_file_region_entries failed
-				 * to allocate a file_region struct. Clear
-				 * hugetlb_restore_reserve so that global reserve
-				 * count will not be incremented by free_huge_folio.
-				 * Act as if we consumed the reservation.
+			if (rc < 0) {
+				/*
+				 * Presumably allocate_file_region_entries()
+				 * failed to allocate a file_region struct.
+				 * Clear hugetlb_restore_reserve so that the
+				 * global reserve count will not be incremented
+				 * by free_huge_folio().  Act as if we consumed
+				 * the reservation.
 				 */
 				folio_clear_hugetlb_restore_reserve(folio);
-			else if (rc)
+			} else if (rc) {
 				vma_add_reservation(h, vma, address);
+			}
 		}
 
 		tlb_remove_page_size(tlb, folio_page(folio, 0),
_

