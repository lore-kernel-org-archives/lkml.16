Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085051F8BCB
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272569; cv=none; b=PU4MrO+1AZbg8TGRcD5p0ryRU25h4u+KnOMFh0TEDz+d4b4aDiUc3/OF7iJsiqv9oGl6YyB/G9y7PmjD+kMKdGYWOsfxv2xrvtLCeSsmFmbE5tTOtw2yuc99ftQOwIVKCJJ1nfphQhabihX5Cr6MehLym83NynElIsIQXdUxv3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272569; c=relaxed/simple;
	bh=xgo4K45Jo2UB7khUhz9mvLV3I1JSmJcGoo1j8w1znQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F0GXYLiML5D73WHCbrsI3ELiJtxLIVysWY5/z/xq+ijrxiRQrmc+/BPBQA8xh5bPzJ3jD6c//rjhVEtkEyNW/33lh4ynZ+coRva5x/Vy29HkYBTiXotgiYOKl9BAZmqKh+2n6136hPnxinrVFAw6ePC24ZKjXj8YNjKES9PyHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF1AD13D5;
	Tue, 11 Feb 2025 03:16:28 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B34A3F5A1;
	Tue, 11 Feb 2025 03:15:57 -0800 (PST)
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
Subject: [PATCH v2 14/17] khugepaged: Reset scan address to correct alignment
Date: Tue, 11 Feb 2025 16:43:23 +0530
Message-Id: <20250211111326.14295-15-dev.jain@arm.com>
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

There are two situations:
1) After retaking the mmap lock, the next VMA expands downwards.
2) After khugepaged sleeps and starts again, it will pick up the starting address
   from the global struct khugepaged_scan, and hence will pick up the same VMA as
   in the previous cycle.

In both cases, khugepaged_scan.address > hstart. Therefore, explicitly align the
address to the order we are scanning for. Previously this was not a problem since
the alignment was to be always PMD-aligned.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/khugepaged.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index e1c2c5b89f6d..7c9a758f6817 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2722,6 +2722,9 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 		hstart = round_up(vma->vm_start, PAGE_SIZE << order);
 		if (khugepaged_scan.address < hstart)
 			khugepaged_scan.address = hstart;
+		else
+			khugepaged_scan.address = round_down(khugepaged_scan.address, PAGE_SIZE << order);
+
 		VM_BUG_ON(khugepaged_scan.address & ((PAGE_SIZE << order) - 1));
 
 		while (khugepaged_scan.address < hend) {
-- 
2.30.2

