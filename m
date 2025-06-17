Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2D333993
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124276; cv=none; b=O2xw2JU6/vw8K+R6JO+l+/8jWGD/7Ui/Zm7657+qiRAuyOc+KvDHXG8o+duEQFQZQUO7RVrB3cyjf229csAew8BxROgyz9oSUMynGxPuSztZYUZ8bP0QF1XF3e4RA0Ru8QXlNHENLdPCgoYZ/4uICllHXjAqLKU5E3j3d4Ymirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124276; c=relaxed/simple;
	bh=HzHh17AhtI00MRQ0FRmfvj3yZsKOrK/43wpwNt/3t24=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PUbWS3W1ckYPToTKCasYkv17jGu0wb1ENx8Krn9aaWBlovcyXMhlx7uqrAr5VQWWUOVMkZuQo9uzjGdq4/63lOn4N9ToaXwIlc+leKyhFG6mQSAPg+HGzMJ4PtS/T3j4rSyTOnY+ruMbK7hcvG4TTCco23dy0F3XlJgdG1bTfXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NXOhlO6Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NXOhlO6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93D2C4CEEA;
	Tue, 17 Jun 2025 01:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750124276;
	bh=HzHh17AhtI00MRQ0FRmfvj3yZsKOrK/43wpwNt/3t24=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NXOhlO6Z8cAxxcUHr6pxmWeVcJTdZNwzpsOYoXcGAyRedqqndUEVgw1Vnz8Y+neXR
	 ypgtGg+Vx7GyMcb3Tp1r6YHZaXiFmBPl8x7q1fL0eizRAQguv8IPii8/RFLj/B73Wq
	 YiZdjarNSpkKfhsYxeE/+aEnQ4sFcM7dJaV4wlV4=
Date: Mon, 16 Jun 2025 18:37:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, David Hildenbrand <david@redhat.com>, Johannes
 Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>, Oscar
 Salvador <osalvador@suse.de>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman
 <mgorman@techsingularity.net>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>,
 Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/6] Make MIGRATE_ISOLATE a standalone bit
Message-Id: <20250616183755.16fbdd5e867752db14e321cc@linux-foundation.org>
In-Reply-To: <20250616121019.1925851-1-ziy@nvidia.com>
References: <20250616121019.1925851-1-ziy@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Jun 2025 08:10:13 -0400 Zi Yan <ziy@nvidia.com> wrote:

> Hi all,
> 
> This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
> being overwritten during pageblock isolation process. Currently,
> MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
> thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
> migratetype. This causes pageblock migratetype loss during
> alloc_contig_range() and memory offline, especially when the process
> fails due to a failed pageblock isolation and the code tries to undo the
> finished pageblock isolations.
> 
> It is on top of mm-everything-2025-06-15-23-48.

mm-new would be a better target.  mm-new is not (yet) included in
linux-next, hence it is not in mm-everything.

I hit a few issues (x86_64 allmodconfig):

In file included from ./include/linux/slab.h:16,
                 from ./include/linux/irq.h:21,
                 from ./include/linux/of_irq.h:7,
                 from drivers/gpu/drm/msm/hdmi/hdmi.c:9:
./include/linux/gfp.h:428:25: error: expected identifier before '(' token
  428 | #define ACR_NONE        ((__force acr_flags_t)0)        // ordinary allocation request
      |                         ^
drivers/gpu/drm/msm/generated/hdmi.xml.h:71:9: note: in expansion of macro 'ACR_NONE'
   71 |         ACR_NONE = 0,
      |         ^~~~~~~~



And this was needed:

kernel/kexec_handover.c uses set_pageblock_migratetype()

--- a/include/linux/page-isolation.h~mm-page_isolation-remove-migratetype-from-move_freepages_block_isolate-fix
+++ a/include/linux/page-isolation.h
@@ -45,6 +45,8 @@ void __meminit init_pageblock_migratetyp
 					  enum migratetype migratetype,
 					  bool isolate);
 
+void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
+
 bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
 bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
--- a/mm/page_alloc.c~mm-page_isolation-remove-migratetype-from-move_freepages_block_isolate-fix
+++ a/mm/page_alloc.c
@@ -525,8 +525,7 @@ void clear_pfnblock_bit(const struct pag
  * @page: The page within the block of interest
  * @migratetype: migratetype to set
  */
-static void set_pageblock_migratetype(struct page *page,
-				      enum migratetype migratetype)
+void set_pageblock_migratetype(struct page *page, enum migratetype migratetype)
 {
 	if (unlikely(page_group_by_mobility_disabled &&
 		     migratetype < MIGRATE_PCPTYPES))
_

