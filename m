Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491913E41A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743268243; cv=none; b=J2uXikDhjx6yj0OPrnv9cz/qUzD/CdICvX9PuTda++M0VV44CPt/Q9JyayeYqk3BGNOslb5zDNfv+UA/DLqo2+XJhYNiqU6oc6dwmckgAtpqSM4xyx6kzdT7hEP4yx3PU+9syb8jAwVjFPi6Q15xVyCjv3Avue415bOBSQN2Jf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743268243; c=relaxed/simple;
	bh=4DMmDPM+mnqlZL773FBuVPksbC1CLTN0NfZNu70KjNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LgszSBBbBN90aUW8JLQtqsdWRspdPIOWnQoi+ZiN4YOpIz4WFPdil46uH6Lq3FTEQZD8HJqobpqEme7tGW00+XP7ly576s7cl9EJm2EWkHq2vsIa6mTSMJhI0ni65GSNSYErwRSWJYRabU67wibpe8J8Shlum/EGFqsP+sXbypY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbtfyOBS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbtfyOBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743268241; x=1774804241;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4DMmDPM+mnqlZL773FBuVPksbC1CLTN0NfZNu70KjNg=;
  b=fbtfyOBS1WeycbWrxIXBbWI2hru4wJPE5HpSsts/dutJl9ib5AbnscDg
   ScKh9qz3b6HtH2CsmeiYpWwZMoGNcYdDf0CgYykNv628NZPYDPXU252m5
   SKUAFykIAgfkbdxki8gsjtFPtCJe8ZYYr7becEZ6Na+uAx9whXLTZkeJe
   0QzhgzeN7ppqQZO6Fgv7gfwEf5WHR+pCu3LaedAdqRql8sGTfZOMWVvde
   0zaZcP04Q0nyOeKjb1y43MspgBQFqId6n6R5dAyrP3NF/opVEwAa5tYR5
   3/Iuwt2+/IWHE7tBVi6pgbxt2i7R5N8crRqxUjLRbFjGIheqcSC+U4/0M
   A==;
X-CSE-ConnectionGUID: nBqMQE7VTAWNSEQfnxUgPg==
X-CSE-MsgGUID: RT/kFh/ZQFy+DDNzqDvz4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44329144"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44329144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 10:10:41 -0700
X-CSE-ConnectionGUID: 2ATFz57SSnWBkJtKWXE6jQ==
X-CSE-MsgGUID: +g+mxmhFQbeO30Wi9C/5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="148891558"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 29 Mar 2025 10:10:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id B7E751AE; Sat, 29 Mar 2025 19:10:36 +0200 (EET)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mel Gorman <mgorman@techsingularity.net>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Rick Edgecombe  <rick.p.edgecombe@intel.com>,
	linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Srikanth Aithal <sraithal@amd.com>
Subject: [PATCH] mm/page_alloc: fix deadlock on cpu_hotplug_lock in __accept_page()
Date: Sat, 29 Mar 2025 19:10:29 +0200
Message-ID: <20250329171030.3942298-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the last page in the zone is accepted, __accept_page() calls
static_branch_dec(). This function takes cpu_hotplug_lock, which can
lead to a deadlock if the allocation occurs during CPU bringup path as
_cpu_up() also takes the lock.

To prevent this deadlock, defer static_branch_dec() to a workqueue.

Call static_branch_dec() only when the workqueue is not yet initialized.
Workqueues are initialized before CPU bring up, so this will not
conflict with the first scenario.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Fixes: 55ad43e8ba0f ("mm: add a helper to accept page")
Reported-by: Srikanth Aithal <sraithal@amd.com>
Tested-by: Srikanth Aithal <sraithal@amd.com>
---
 include/linux/mmzone.h |  3 +++
 mm/internal.h          |  1 +
 mm/mm_init.c           |  1 +
 mm/page_alloc.c        | 28 ++++++++++++++++++++++++++--
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9540b41894da..9027f751b619 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -964,6 +964,9 @@ struct zone {
 #ifdef CONFIG_UNACCEPTED_MEMORY
 	/* Pages to be accepted. All pages on the list are MAX_PAGE_ORDER */
 	struct list_head	unaccepted_pages;
+
+	/* To be called once the last page in the zone is accepted */
+	struct work_struct	unaccepted_cleanup;
 #endif
 
 	/* zone flags, see below */
diff --git a/mm/internal.h b/mm/internal.h
index 109ef30fee11..f2e6d42af6eb 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1516,6 +1516,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 
 #ifdef CONFIG_UNACCEPTED_MEMORY
 void accept_page(struct page *page);
+void unaccepted_cleanup_work(struct work_struct *work);
 #else /* CONFIG_UNACCEPTED_MEMORY */
 static inline void accept_page(struct page *page)
 {
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2630cc30147e..d5a51f65dc4d 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1404,6 +1404,7 @@ static void __meminit zone_init_free_lists(struct zone *zone)
 
 #ifdef CONFIG_UNACCEPTED_MEMORY
 	INIT_LIST_HEAD(&zone->unaccepted_pages);
+	INIT_WORK(&zone->unaccepted_cleanup, unaccepted_cleanup_work);
 #endif
 }
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4fe93029bcb6..e51304d3f126 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6921,6 +6921,11 @@ static DEFINE_STATIC_KEY_FALSE(zones_with_unaccepted_pages);
 
 static bool lazy_accept = true;
 
+void unaccepted_cleanup_work(struct work_struct *work)
+{
+	static_branch_dec(&zones_with_unaccepted_pages);
+}
+
 static int __init accept_memory_parse(char *p)
 {
 	if (!strcmp(p, "lazy")) {
@@ -6959,8 +6964,27 @@ static void __accept_page(struct zone *zone, unsigned long *flags,
 
 	__free_pages_ok(page, MAX_PAGE_ORDER, FPI_TO_TAIL);
 
-	if (last)
-		static_branch_dec(&zones_with_unaccepted_pages);
+	if (last) {
+		/*
+		 * There are two corner cases:
+		 *
+		 * - If allocation occurs during the CPU bring up,
+		 *   static_branch_dec() cannot be used directly as
+		 *   it causes a deadlock on cpu_hotplug_lock.
+		 *
+		 *   Instead, use schedule_work() to prevent deadlock.
+		 *
+		 * - If allocation occurs before workqueues are initialized,
+		 *   static_branch_dec() should be called directly.
+		 *
+		 *   Workqueues are initialized before CPU bring up, so this
+		 *   will not conflict with the first scenario.
+		 */
+		if (system_wq)
+			schedule_work(&zone->unaccepted_cleanup);
+		else
+			unaccepted_cleanup_work(&zone->unaccepted_cleanup);
+	}
 }
 
 void accept_page(struct page *page)
-- 
2.47.2

