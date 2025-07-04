Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B733DF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751599188; cv=none; b=CVMwk5pUu+G7K8BvIG93VXIybIY/7KPXYzymmJMl0fjEOrfL+6T6NY1LdvcZNOsyQI3wH0Z/bZTTdd9nCHOczGM62jVemtMuFV/Nivq+SR76C1dbPiHTekpQ8D3NVUYcO2WUkXNj4NuyS7zet98VMa0yfljOJJ6fqiOlz3S1lvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751599188; c=relaxed/simple;
	bh=6e4VTmTJdsws+QP6XDBXrh/C79q76yq34yJ5EKMLvqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRVEW8J4/9Ie/xlNAnXzR6F/iCYRB+iy8yK55XQacuDlHmG2HGxlCcMfPrxCcso9kxM/N8rzW8KydKw0dwVgCrHFyq23oJ41gJ4dGHwS2q36Ar0zFakcJU5AfEyAmg2MWOERk8HbpcsjiLNZd5u1G4LchtRr570Ga/MthbLH1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sd4K9uOT; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sd4K9uOT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751599178; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=kNobNAICq8OI6ZolSBIkSCMUrxwEO4uU25FQrzVKD+g=;
	b=sd4K9uOTOkcrycI8kvfBmdUZOzBiWU5fJDdBLD0nwvsnrjNvkAwYiUzWO4AXRzCe7BpMmrDg91WZDTtuZ4tfmYzpyQkUum7BitWxJiF+gpd6wdw5tH1Wphh+h8lV4bIBisVVQe6GzKukLhlbqyNJgPwyplGHRwUEQrfcHxUzKRo=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wh93g4-_1751599175 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Jul 2025 11:19:36 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@redhat.com
Cc: ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm: fault in complete folios instead of individual pages for tmpfs
Date: Fri,  4 Jul 2025 11:19:26 +0800
Message-ID: <440940e78aeb7430c5cc8b6d2088ae98265b9809.1751599072.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
tmpfs can also support large folio allocation (not just PMD-sized large
folios).

However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
we still establish mappings at the base page granularity, which is unreasonable.

We can map multiple consecutive pages of a tmpfs folios at once according to
the size of the large folio. On one hand, this can reduce the overhead of page
faults; on the other hand, it can leverage hardware architecture optimizations
to reduce TLB misses, such as contiguous PTEs on the ARM architecture.

Moreover, tmpfs mount will use the 'huge=' option to control large folio
allocation explicitly. So it can be understood that the process's RSS statistics
might increase, and I think this will not cause any obvious effects for users.

Performance test:
I created a 1G tmpfs file, populated with 64K large folios, and write-accessed it
sequentially via mmap(). I observed a significant performance improvement:

Before the patch:
real	0m0.158s
user	0m0.008s
sys	0m0.150s

After the patch:
real	0m0.021s
user	0m0.004s
sys	0m0.017s

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Changes from v1:
 - Drop the unnecessary IS_ALIGNED() check, per David.
 - Update the commit message, per David.
---
 mm/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0f9b32a20e5b..9944380e947d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 
 	/*
 	 * Using per-page fault to maintain the uffd semantics, and same
-	 * approach also applies to non-anonymous-shmem faults to avoid
+	 * approach also applies to non shmem/tmpfs faults to avoid
 	 * inflating the RSS of the process.
 	 */
-	if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
+	if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
 	    unlikely(needs_fallback)) {
 		nr_pages = 1;
 	} else if (nr_pages > 1) {
-- 
2.43.5

