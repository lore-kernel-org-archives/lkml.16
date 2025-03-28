Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83569157A6B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743126502; cv=none; b=TOlQaqawFVD/tLunQMVNxOaR0mLQFYOjhz4WRwBoO+59dBZCcvrClyEKBn9Ag7uLz78Dugiyr+D1eCzPh0RU89QoJosFc1moz5XvZU5Ekx2bnn7HLXfFCr9HXeF2CCWiTDtdycbX8Xlp5aWRWJ8j5XFU7j2kl7KZ8zAgzEpvBKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743126502; c=relaxed/simple;
	bh=JvhrXLzFWIbOGxywBw8cJikMfFdPvmQEg8m3fL7QYGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kDvU6mDQBSINddglNy1e3W98x5PG8agH3RJIHY7KgcWz6vdKjn2xvLBfdOUXws2Jl9yCKI5YhNIexat8zZUKW1mo6owJW5PAw9NVEFG291hz49qbEdyxoiTF+WV7ES3Y3L47Md2SgsEiDRS2xDVK9OKycNWlVu7dcyY8W0mIHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iQGMvmOq; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iQGMvmOq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743126498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QRFdqYEjJ09RxrhZfnxAliEIiR99BsC/945vMiY5ryE=;
	b=iQGMvmOq+HL+CTIiFOBAl09E3NqiCY8538HJ6ss2M5fjDGlrIEmNhNngrUKceqooz+f8my
	TZkTALs7M3JkBP5kgMmIsfvlf808HBSHD32iQuoIVNbelG4KKghfzj+AoIeb1gKKnnyt1a
	wLEFjQEJ5xi1gtL5oYuj2BBa1wO9pyc=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Markus.Elfring@web.de,
	Ye Liu <liuye@kylinos.cn>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: [PATCH v4] mm/page_alloc: Consolidate unlikely handling in page_expected_state
Date: Fri, 28 Mar 2025 09:47:57 +0800
Message-Id: <20250328014757.1212737-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Consolidate the handling of unlikely conditions in the 
page_expected_state() function to reduce code duplication and improve 
readability.

Move the logic for handling __PG_HWPOISON flags from the 
check_new_page_bad() function to the page_expected_state() function, 
and remove check_new_page_bad().

Call bad_page() directly from the check_new_page() function if the page has
unexpected flags.

Simplify the code by reducing the number of functions and centralizing the
handling of unlikely conditions.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

---
V4: Use "imperative mood" to modify the commit and append parentheses 
to all function names.
V3: Delete 'This patch'.
V2: return true instead of false in the PageHWPoison branch.
---
 mm/page_alloc.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2842da893eea..e8b95c6a96c2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -903,6 +903,12 @@ static inline bool page_expected_state(struct page *page,
 			(page->flags & check_flags)))
 		return false;
 
+	if (unlikely(PageHWPoison(page))) {
+		/* Don't complain about hwpoisoned pages */
+		if (PageBuddy(page))
+			__ClearPageBuddy(page);
+	}
+
 	return true;
 }
 
@@ -1586,29 +1592,15 @@ static __always_inline void page_del_and_expand(struct zone *zone,
 	account_freepages(zone, -nr_pages, migratetype);
 }
 
-static void check_new_page_bad(struct page *page)
-{
-	if (unlikely(PageHWPoison(page))) {
-		/* Don't complain about hwpoisoned pages */
-		if (PageBuddy(page))
-			__ClearPageBuddy(page);
-		return;
-	}
-
-	bad_page(page,
-		 page_bad_reason(page, PAGE_FLAGS_CHECK_AT_PREP));
-}
-
 /*
  * This page is about to be returned from the page allocator
  */
 static bool check_new_page(struct page *page)
 {
-	if (likely(page_expected_state(page,
-				PAGE_FLAGS_CHECK_AT_PREP|__PG_HWPOISON)))
+	if (likely(page_expected_state(page, PAGE_FLAGS_CHECK_AT_PREP)))
 		return false;
 
-	check_new_page_bad(page);
+	bad_page(page, page_bad_reason(page, PAGE_FLAGS_CHECK_AT_PREP));
 	return true;
 }
 
-- 
2.25.1

