Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD272A93D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743124856; cv=none; b=lKuwITbhyW839y2i7gDaWGDnbXpgj6x5UCTSInwlJb4G7WvXIdAmrGEu9LQEUAZZKB9j996ltsBucNs1W5zdLPeIQrvm0HPGZbtxfdYOjXhOC2PWuwZv4/LOt0Ifna5xWZis0tMTW1ifYMsIUqEdSdi5wG7jgEjDZK7WszOEFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743124856; c=relaxed/simple;
	bh=VhTDs/jMaM0FoR1ld8c7PLMCWZ6BNE6rUNxbDmjVZlc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q9q/YfacaIaCk3Q9mJyvXqImFwI/AHrQIEZLH0A/sCx2+VwVIAwmE35fPjLlk3OGT8Ju7bIIMzdV93V4DiQ14ipciAWSK8QcgIHhH+Y359lfkElOzSLy2VhFQqA1BtjXmsbtUYtG+5vSlfZOjRhxdZdys3aUOgb8rn4v7FiNMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VYi14ezY; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VYi14ezY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743124850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ST7Zz7wKtV5N6+j7N6XxfcEuTgJnBuYUlRquTGdqjb0=;
	b=VYi14ezYdTog1/Ijv+H6W4/z68D2gFTHElWi2LvCcyNjbRk6hD2kRGZx+bQcYLlOMs9uXp
	mv7jkdhIV0+aHlAQ1P1UVXP318IlIJf5v4zuECWJf0Je1lQDck+rx/Kg1E39A/4uKT0Ccv
	W1iAYedZB0o2oVNtHjfoqYkF/gjlm5U=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4] mm/page_alloc: Simplify free_page_is_bad by removing free_page_is_bad_report
Date: Fri, 28 Mar 2025 09:20:31 +0800
Message-Id: <20250328012031.1204993-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Refactor free_page_is_bad() to call bad_page() directly, removing the 
intermediate free_page_is_bad_report(). This reduces unnecessary 
indirection, improving code clarity and maintainability without changing 
functionality.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>

---
V4: Simplify commit information.
V3: Delete 'This patch'.
V2: Simplify the code by removing unnecessary line breaks.
---
 mm/page_alloc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 61d6a3b1b286..60c54ba78a11 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -933,19 +933,13 @@ static const char *page_bad_reason(struct page *page, unsigned long flags)
 	return bad_reason;
 }
 
-static void free_page_is_bad_report(struct page *page)
-{
-	bad_page(page,
-		 page_bad_reason(page, PAGE_FLAGS_CHECK_AT_FREE));
-}
-
 static inline bool free_page_is_bad(struct page *page)
 {
 	if (likely(page_expected_state(page, PAGE_FLAGS_CHECK_AT_FREE)))
 		return false;
 
 	/* Something has gone sideways, find it */
-	free_page_is_bad_report(page);
+	bad_page(page, page_bad_reason(page, PAGE_FLAGS_CHECK_AT_FREE));
 	return true;
 }
 
-- 
2.25.1

