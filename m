Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A041519BE
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245758; cv=none; b=nXMsRM5eL/6p+RZuE/PC6uOGHDJejIgZnCfoaGiknHm5gcDV8G+EwTLqd/Izjo6CYzY5WeUtRi9Ln/mMpO+YYWUwfvQXTaaSNmB0kJprY3hHsEz6kffa44HnUUHUkJOg8BbSUrA7HxrzXDmwT56NzbDJFl0we28L+vt8U+4dEiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245758; c=relaxed/simple;
	bh=ZUyEnpcGq2cJjl2hT1NidI9TY4wYHvgF2eK5+ZJbX9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAii76OiHWxcBaNdGbtqJzc4Zq24aO8AFdw6i5Sj82KAvjFIib8pYEIbs90PHnqH+xBvQTpYZx9b1J9fRu+WnBYhYVNCTzQT9nSc2v5P8FHN3nGv4rTn6tVF8qZiW3fH9aW85ENr6J7GrKKB5JciexRYErR5vUDz/F9SueZR/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YhjZSfYp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YhjZSfYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739245753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fc6Lup8PyQQxDZ8TsMYZrD/hozXEfxTI7AerH3va8cE=;
	b=YhjZSfYpnxqR0eBQJdImBvzyHL7wUgVZE7TrDD2bz3aXutPzWF/OshS8FqdizaU9b/s6zW
	mS2wXVbLlBsHrJLGjXKfzXP4VJHwUbjS/zoXv77GABg0r2GFMUpU5iu2vyhe8UURQggjWx
	R2ExiAFpTsQpFozH4AswE3RbMaOnDps=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-vsfOlkt8MSuU_8T59fYdLA-1; Mon,
 10 Feb 2025 22:49:11 -0500
X-MC-Unique: vsfOlkt8MSuU_8T59fYdLA-1
X-Mimecast-MFC-AGG-ID: vsfOlkt8MSuU_8T59fYdLA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 805C11956088;
	Tue, 11 Feb 2025 03:49:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.89.14])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2AC99195608D;
	Tue, 11 Feb 2025 03:49:08 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: linux-kernel@vger.kernel.org,
	yaozhenguo1@gmail.com,
	muchun.song@linux.dev
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	rppt@kernel.org,
	luizcap@redhat.com
Subject: [PATCH] mm: hugetlb: avoid fallback for specific node allocation of 1G pages
Date: Mon, 10 Feb 2025 22:48:56 -0500
Message-ID: <20250211034856.629371-1-luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

When using the HugeTLB kernel command-line to allocate 1G pages from
a specific node, such as:

   default_hugepagesz=1G hugepages=1:1

If node 1 happens to not have enough memory for the requested number of
1G pages, the allocation falls back to other nodes. A quick way to
reproduce this is by creating a KVM guest with a memory-less node and
trying to allocate 1 1G page from it. Instead of failing, the allocation
will fallback to other nodes.

This defeats the purpose of node specific allocation. Also, specific
node allocation for 2M pages don't have this behavior: the allocation
will just fail for the pages it can't satisfy.

This issue happens because HugeTLB calls memblock_alloc_try_nid_raw()
for 1G boot-time allocation as this function falls back to other nodes
if the allocation can't be satisfied. Use memblock_alloc_exact_nid_raw()
instead, which ensures that the allocation will only be satisfied from
the specified node.

Fixes: b5389086ad7b ("hugetlbfs: extend the definition of hugepages parameter to support node allocation")

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 65068671e460..163190e89ea1 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3145,7 +3145,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 
 	/* do node specific alloc */
 	if (nid != NUMA_NO_NODE) {
-		m = memblock_alloc_try_nid_raw(huge_page_size(h), huge_page_size(h),
+		m = memblock_alloc_exact_nid_raw(huge_page_size(h), huge_page_size(h),
 				0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
 		if (!m)
 			return 0;
-- 
2.48.1

