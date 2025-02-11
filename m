Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F411F9F73
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272579; cv=none; b=fEFGZN7Hy+3D/ZTyDIgeGnmHtvZa/VEaNZhYytjAF4SVjBGGtKjj3cm2gWUXpQdPSFWhLygc+8N4p/7z5ol9kX359G8QzHYjzMQsIe9SKfdgdeXvXIfuQUyMqVcUYJy6fZECeeO2IcxlVUzMKzoc6H1cGRTET6zjg8wxnpjV7Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272579; c=relaxed/simple;
	bh=DxNCc6LhIHFxgx9mBBmND+ZonOy/FONexwys4x2dLX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GtTznFIgt72HrO2+ysvOyhKxRtSAEpNu1TRO7IjopCrmi/O46YbHEhY8izvqqF/UA4hSqk4Lqi20x1Eaxdn9HfoOTcmubxSMYoCX6pyxXZ9++xEbWTID8uT8z91V74aL5AHsNpFpL6iKkM2QJIrlB5ZB5tJxFVH1mDC7IpBzvkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C80F513D5;
	Tue, 11 Feb 2025 03:16:38 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB9143F5A1;
	Tue, 11 Feb 2025 03:16:07 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	willy@infradead.org,
	kirill.shutemov@linux.intel.com
Cc: npache@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	apopple@nvidia.com,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	baohua@kernel.org,
	jack@suse.cz,
	srivatsa@csail.mit.edu,
	haowenchao22@gmail.com,
	hughd@google.com,
	aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com,
	peterx@redhat.com,
	ioworker0@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	jglisse@google.com,
	surenb@google.com,
	vishal.moola@gmail.com,
	zokeefe@google.com,
	zhengqi.arch@bytedance.com,
	jhubbard@nvidia.com,
	21cnbao@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 15/17] khugepaged: Delay cond_resched()
Date: Tue, 11 Feb 2025 16:43:24 +0530
Message-Id: <20250211111326.14295-16-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250211111326.14295-1-dev.jain@arm.com>
References: <20250211111326.14295-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Post scanning VMAs less than PMD-size, cond_resched() may get called at
a frequency of 1 << order worth of pte scan. Earlier, this was at a
PMD-worth scan. Therefore, manually enforce the previous behaviour; not
doing this causes the khugepaged selftest to timeout.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 7c9a758f6817..d2bb008b95e7 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2650,6 +2650,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 	unsigned long orders;
 	int order;
 	bool is_file_vma;
+	int prev_progress = 0;
 
 	VM_BUG_ON(!pages);
 	lockdep_assert_held(&khugepaged_mm_lock);
@@ -2730,7 +2731,10 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 		while (khugepaged_scan.address < hend) {
 			bool mmap_locked = true;
 
-			cond_resched();
+			if (progress - prev_progress >= HPAGE_PMD_NR) {
+				cond_resched();
+				prev_progress = progress;
+			}
 			if (unlikely(hpage_collapse_test_exit_or_disable(mm)))
 				goto breakouterloop;
 
-- 
2.30.2

