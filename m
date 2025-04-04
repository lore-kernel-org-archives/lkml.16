Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A41F3D59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743782513; cv=none; b=V1C0fLojIzBFLiaR+goRkdt80PA+pfQwQlztJRDp8wwqjox94eEWjqdDoce99DIFCzcblqWzTdyoyApwbqGM0Dt44JWMOFnk9LMOpAFVtTYRb9M6uJZKsL2W+kuKTIN7rvaLp3XPDTS2Q0UEFsVJf606Mb45S3ss8HzFd1ss16o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743782513; c=relaxed/simple;
	bh=DAthZNw+5o9GgAEXHRLIN9HoWnIvnt3Jx7BcQo+HyKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bESg3GJmygA2Xc1ThFCtnGWQeYH9cJTmxnvKkaoi2y4n/uBkFCEJvah3O0cbRlqsPpMSs9nx9mnDDEG+r0Q696MCu+uBRuD/6UZEtzzMPDPvMY5M7wdsntB+GYNPUvYKkesZ8hrkCSumV/CxvNfbPCdCNNsj9QpAEBqXTfUs8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rcQ/TZXn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rcQ/TZXn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=zwrAwVynWffEuxKPl0OEyEEBjA9QOQig2FF2bzdhEpA=; b=rcQ/TZXnLakdQxL4crd49SXX3c
	edNsEOVe5KuObd9N9FvHOyENAzG1hCUGVegfPjAUI+DESeHQ2QnvFHahouiLIKJXGm/9RbMSGbECY
	3H7F9hOPYEdMTiEfgcGsbG7aWDxhy3ZY9WqpRK44a5vaJHV37Lx6OginK6lDUrp+urL++BV2mtbH5
	p+ZFyzIAKAcSjEt2BvR0qBo1O4L3+1RqPBeKcN2MGAKLhzlFZ2wIbiVn+ohK9/LZ1v86JEJ+uw17N
	4zNZ8gbxTQmZ4FYx30Cw1FcflV3mnJKiulvzObmjLOk24f6Y0o78MuVRM7S5DrvoDrcue1z65zfMb
	chjOXhaA==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSa-0000000GFHw-3A3Z;
	Fri, 04 Apr 2025 16:01:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jSZ-0000000ERST-48Ac;
	Fri, 04 Apr 2025 16:59:59 +0100
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
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v2 7/7] mm: use for_each_valid_pfn() in memory_hotplug
Date: Fri,  4 Apr 2025 16:59:59 +0100
Message-ID: <20250404155959.3442111-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404155959.3442111-1-dwmw2@infradead.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 mm/memory_hotplug.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 75401866fb76..20c39ae45016 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1756,12 +1756,10 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 {
 	unsigned long pfn;
 
-	for (pfn = start; pfn < end; pfn++) {
+	for_each_valid_pfn (pfn, start, end) {
 		struct page *page;
 		struct folio *folio;
 
-		if (!pfn_valid(pfn))
-			continue;
 		page = pfn_to_page(pfn);
 		if (PageLRU(page))
 			goto found;
@@ -1805,11 +1803,9 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
-	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+	for_each_valid_pfn (pfn, start_pfn, end_pfn) {
 		struct page *page;
 
-		if (!pfn_valid(pfn))
-			continue;
 		page = pfn_to_page(pfn);
 		folio = page_folio(page);
 
-- 
2.49.0

