Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7431F4621
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436094; cv=none; b=XWxdm6IOUFgsjb8uvl8XFM7KFTYcjFKVGRW0o/P9UeGiTkTGmZoRRqvKHTD2OqzZGFU9Lm5uvJnDpt2ZgzRXoWdREMsGZQCAK3sccUxaXX1ySb/aTS1rj7GLi/F525l+gwqYwXHXNTnJkdAOrGdoruGuNr6egWDjQNveZSusLaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436094; c=relaxed/simple;
	bh=g4V9DvZy86AmYxsZbjXmyqrMPPS/X9r+lilkJ6a6Wac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJ5/eLPIIXGtWgfr5nUl+hPVj+Qr5Hs5Mvu7q4XnlOou8P6FCqtgk00HQV0c8qLr03PS29z9eInjbjcr4iMdqm97cagS47plzbs+PDND07Eys4ECj7SCm0NAFnyojQCcBhMmiVq+1mKmWhDOHDp4nkZ3OMVVChpbhJfThO8fwnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5fbS9dO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5fbS9dO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751436091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pClnkwE28GE4qFvtDIHtCpJBujOjEEnlN0VFfKLLmHs=;
	b=H5fbS9dOLvqP006C12msiqd3sYf9wu0Es+JWprBdy0oTbCjkDuhfzyYN6bS2ru4lH/n6+i
	nWIlPvmLxeSl3HYGhTGI0SF5TQRbxg7vXvYGE674J6z8R0FPTW78hopHpnt1bqcupGLeu8
	Rhudzx2G0iw9bnz8R5pj8iThWMAOPXc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-511-vEXaRJnlMOeMD53K8UT_uA-1; Wed,
 02 Jul 2025 02:01:28 -0400
X-MC-Unique: vEXaRJnlMOeMD53K8UT_uA-1
X-Mimecast-MFC-AGG-ID: vEXaRJnlMOeMD53K8UT_uA_1751436081
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39E1C180120D;
	Wed,  2 Jul 2025 06:01:19 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.112])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5241B18003FC;
	Wed,  2 Jul 2025 06:01:04 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	corbet@lwn.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	willy@infradead.org,
	peterx@redhat.com,
	wangkefeng.wang@huawei.com,
	usamaarif642@gmail.com,
	sunnanyong@huawei.com,
	vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com,
	yang@os.amperecomputing.com,
	kirill.shutemov@linux.intel.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	tiwai@suse.de,
	will@kernel.org,
	dave.hansen@linux.intel.com,
	jack@suse.cz,
	cl@gentwo.org,
	jglisse@google.com,
	surenb@google.com,
	zokeefe@google.com,
	hannes@cmpxchg.org,
	rientjes@google.com,
	mhocko@suse.com,
	rdunlap@infradead.org
Subject: [PATCH v8 11/15] khugepaged: allow madvise_collapse to check all anonymous mTHP orders
Date: Tue,  1 Jul 2025 23:57:38 -0600
Message-ID: <20250702055742.102808-12-npache@redhat.com>
In-Reply-To: <20250702055742.102808-1-npache@redhat.com>
References: <20250702055742.102808-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Allow madvise_collapse to scan/collapse all mTHP orders without the
strict requirement of needing the PMD-order enabled.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b96a7327b9c0..6ea681b81647 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2930,11 +2930,13 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	unsigned long hstart, hend, addr;
 	int thps = 0, last_fail = SCAN_FAIL;
 	bool mmap_locked = true;
+	unsigned long orders = vma_is_anonymous(vma) ?
+					THP_ORDERS_ALL_ANON : BIT(PMD_ORDER);
 
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
+	if (!thp_vma_allowable_orders(vma, vma->vm_flags, 0, orders))
 		return -EINVAL;
 
 	cc = kmalloc(sizeof(*cc), GFP_KERNEL);
@@ -2956,7 +2958,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 			mmap_read_lock(mm);
 			mmap_locked = true;
 			result = hugepage_vma_revalidate(mm, addr, false, &vma,
-							 cc, BIT(HPAGE_PMD_ORDER));
+							 cc, orders);
 			if (result  != SCAN_SUCCEED) {
 				last_fail = result;
 				goto out_nolock;
-- 
2.49.0

