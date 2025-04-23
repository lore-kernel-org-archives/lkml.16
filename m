Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F81A3161
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415514; cv=none; b=ZO60i84aoxkcT9khzc6Bdmuv+sj6cWHrzUYEq4hUUpak/JXNwYUggLxlTNzPgYV9PWRyjyaTXylDJwe4boyy9GvyduU+tipgEKJyNpqfgkyU+m6GlXaAWGRHGL3uPhhtIU9MXl9LJAmhonBDgpvN55zcCIHQF9I9n5Sk+ls75cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415514; c=relaxed/simple;
	bh=UbtwA9lLkcQ7mu+I/4nJ4sjYkyD8wB5Y4jW5OI0T7Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwVi1nHj/t1T5IKUYfCNFHyClQNnUhUufgPfmNt8NCL7eQ2HrV0VSfmjqoprKBmrdPqg+lOF//d93PB8lXtIK9CyN67FXDdrQtiLX+92DUNGX/54N9jItgFgJw6DjLr4KZktb/gApfJbrFjycqC1KUDlLJlxosv5q6qbukwdm34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OtTQ35MY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OtTQ35MY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cHeGB9xL4xI+MiA09JZcxauxbai7M3ZdaQGCwpwKwYc=; b=OtTQ35MYVVFzlBDjRKO32e5b7V
	JKZQap+w4ReSZRYdLvuNEdG20jcGXzJYGgnBZksCtHtYaIHuFZdfJC2LkytvGe0F0Fwvs4jg4VUAp
	sW4yMAGFT2mfP4qgvYXWTJU07yULYEFsLZcNSNRQ4DnLkDsImYTTYNI7BlCNZaT7xnOOwFJ7hTURw
	zd8eul2gdbYaM8IY9b3kNtIBy9DUlx7lBDMtsUWjW8oQUg7kw7br8cxrAcVO+vBqFRVpLieTrFVqk
	Nb74tB4Rciylk8F3fjyktXQmX46ID++vHqpY6w1/bh0yEQHnshvxfwd5p8xdDkK9qOOZNs32RauSB
	/QfRgfzg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aIx-000000097Ji-2GnN;
	Wed, 23 Apr 2025 13:38:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7aIx-00000003JP0-1P6r;
	Wed, 23 Apr 2025 14:38:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in init_unavailable_range()
Date: Wed, 23 Apr 2025 14:33:43 +0100
Message-ID: <20250423133821.789413-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423133821.789413-1-dwmw2@infradead.org>
References: <20250423133821.789413-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Currently, memmap_init initializes pfn_hole with 0 instead of
ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
page from the page at address zero to the first available page, but it
won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
won't pass.

If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
kernel is used as a library and loaded at a very high address), the
pointless iteration for pages below ARCH_PFN_OFFSET will take a very
long time, and the kernel will look stuck at boot time.

Use for_each_valid_pfn() to skip the pointless iterations.

Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Ruihan Li <lrh2000@pku.edu.cn>
---
 mm/mm_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 41884f2155c4..0d1a4546825c 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned long spfn,
 	unsigned long pfn;
 	u64 pgcnt = 0;
 
-	for (pfn = spfn; pfn < epfn; pfn++) {
-		if (!pfn_valid(pageblock_start_pfn(pfn))) {
-			pfn = pageblock_end_pfn(pfn) - 1;
-			continue;
-		}
+	for_each_valid_pfn(pfn, spfn, epfn) {
 		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
 		__SetPageReserved(pfn_to_page(pfn));
 		pgcnt++;
-- 
2.49.0

