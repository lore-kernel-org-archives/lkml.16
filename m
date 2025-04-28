Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70895296169
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745864980; cv=none; b=uhh0/T+k6KBoVUsXmUlAkYJTHB8MKIs+uIitTDfUwhou0XURaLhB3QWbCTIkyvsxHYHw84C7L65+glKUWdhNXfco2gtnV36j71pAUbFK8bdR5nqFKo93+cCqRQ+zrSp9wyUzN9DiySPrEmAQ6tEI2NkfkRVlnNPKravhZGIEr7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745864980; c=relaxed/simple;
	bh=wEhF3fEZfnfX32kR/oOs7t3wI/qZgZyLIu9Xv+BUbyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SnDlbA88ZYuLs3pfjpVnNYDdqw11IvxfAEx3jqbqUlrArWljbKpn44qArdoidwsz0X90FDRCBmzzBpuu9pWSnciV05ejjdnOgrAIo6HzOlaNILXUvmg2hKgMAi2aOERNVtlV8J1qzTp1nRuCohe9u6Lvb0RFXwXhy68I/e9dxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P1kYX6h9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P1kYX6h9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745864977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2DhWHRRaJgbDyFTPn9k0AEwYfzaIuDC1P60JXAppeY4=;
	b=P1kYX6h9sC+xJVmS1aNSYvsoQCpu6GheiewmMlfLsbfvn9zidfHN6cyxQOFF+3xIogBxnz
	xiLIUGL+NIeOnZKPHU+adGOULMTA7evpTs+z7r3Bq+rVw2vtiNqG0+xg2GOAfGHKa61HHH
	YoXhgdF2cJclu+Exys9jdhAKntleq/c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-8vdzHhwAM2CltIM4hYMQ8A-1; Mon,
 28 Apr 2025 14:29:34 -0400
X-MC-Unique: 8vdzHhwAM2CltIM4hYMQ8A-1
X-Mimecast-MFC-AGG-ID: 8vdzHhwAM2CltIM4hYMQ8A_1745864970
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50A521956094;
	Mon, 28 Apr 2025 18:29:29 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.65.12])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DCC0430001AB;
	Mon, 28 Apr 2025 18:29:20 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	david@redhat.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	willy@infradead.org,
	peterx@redhat.com,
	shuah@kernel.org,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	usamaarif642@gmail.com,
	sunnanyong@huawei.com,
	vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com,
	yang@os.amperecomputing.com,
	kirill.shutemov@linux.intel.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	dev.jain@arm.com,
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
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	hannes@cmpxchg.org,
	rientjes@google.com,
	mhocko@suse.com,
	rdunlap@infradead.org
Subject: [PATCH v5 1/4] mm: defer THP insertion to khugepaged
Date: Mon, 28 Apr 2025 12:29:01 -0600
Message-ID: <20250428182904.93989-2-npache@redhat.com>
In-Reply-To: <20250428182904.93989-1-npache@redhat.com>
References: <20250428182904.93989-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

setting /transparent_hugepages/enabled=always allows applications
to benefit from THPs without having to madvise. However, the pf handler
takes very few considerations to decide weather or not to actually use a
THP. This can lead to a lot of wasted memory. khugepaged only operates
on memory that was either allocated with enabled=always or MADV_HUGEPAGE.

Introduce the ability to set enabled=defer, which will prevent THPs from
being allocated by the page fault handler unless madvise is set,
leaving it up to khugepaged to decide which allocations will collapse to a
THP. This should allow applications to benefits from THPs, while curbing
some of the memory waste.

Co-developed-by: Rafael Aquini <raquini@redhat.com>
Signed-off-by: Rafael Aquini <raquini@redhat.com>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 include/linux/huge_mm.h | 15 +++++++++++++--
 mm/huge_memory.c        | 31 +++++++++++++++++++++++++++----
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index e3d15c737008..57e6c962afb1 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -48,6 +48,7 @@ enum transparent_hugepage_flag {
 	TRANSPARENT_HUGEPAGE_UNSUPPORTED,
 	TRANSPARENT_HUGEPAGE_FLAG,
 	TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
+	TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG,
@@ -186,6 +187,7 @@ static inline bool hugepage_global_enabled(void)
 {
 	return transparent_hugepage_flags &
 			((1<<TRANSPARENT_HUGEPAGE_FLAG) |
+			(1<<TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG) |
 			(1<<TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG));
 }
 
@@ -195,6 +197,12 @@ static inline bool hugepage_global_always(void)
 			(1<<TRANSPARENT_HUGEPAGE_FLAG);
 }
 
+static inline bool hugepage_global_defer(void)
+{
+	return transparent_hugepage_flags &
+			(1<<TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG);
+}
+
 static inline int highest_order(unsigned long orders)
 {
 	return fls_long(orders) - 1;
@@ -291,13 +299,16 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
 				       unsigned long tva_flags,
 				       unsigned long orders)
 {
+	if ((tva_flags & TVA_IN_PF) && hugepage_global_defer() &&
+			!(vm_flags & VM_HUGEPAGE))
+		return 0;
+
 	/* Optimization to check if required orders are enabled early. */
 	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
 		unsigned long mask = READ_ONCE(huge_anon_orders_always);
-
 		if (vm_flags & VM_HUGEPAGE)
 			mask |= READ_ONCE(huge_anon_orders_madvise);
-		if (hugepage_global_always() ||
+		if (hugepage_global_always() || hugepage_global_defer() ||
 		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
 			mask |= READ_ONCE(huge_anon_orders_inherit);
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8af5caa0d9bc..17b66adef029 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -297,12 +297,15 @@ static ssize_t enabled_show(struct kobject *kobj,
 	const char *output;
 
 	if (test_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags))
-		output = "[always] madvise never";
+		output = "[always] madvise defer never";
 	else if (test_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
 			  &transparent_hugepage_flags))
-		output = "always [madvise] never";
+		output = "always [madvise] defer never";
+	else if (test_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags))
+		output = "always madvise [defer] never";
 	else
-		output = "always madvise [never]";
+		output = "always madvise defer [never]";
 
 	return sysfs_emit(buf, "%s\n", output);
 }
@@ -315,13 +318,20 @@ static ssize_t enabled_store(struct kobject *kobj,
 
 	if (sysfs_streq(buf, "always")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG, &transparent_hugepage_flags);
 		set_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags);
+	} else if (sysfs_streq(buf, "defer")) {
+		clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags);
+		set_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG, &transparent_hugepage_flags);
 	} else if (sysfs_streq(buf, "madvise")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG, &transparent_hugepage_flags);
 		set_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags);
 	} else if (sysfs_streq(buf, "never")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags);
 		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG, &transparent_hugepage_flags);
 	} else
 		ret = -EINVAL;
 
@@ -954,18 +964,31 @@ static int __init setup_transparent_hugepage(char *str)
 			&transparent_hugepage_flags);
 		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
 			  &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags);
 		ret = 1;
+	} else if (!strcmp(str, "defer")) {
+		clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
+			  &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
+			  &transparent_hugepage_flags);
+		set_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags);
 	} else if (!strcmp(str, "madvise")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
 			  &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags);
 		set_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
-			&transparent_hugepage_flags);
+			  &transparent_hugepage_flags);
 		ret = 1;
 	} else if (!strcmp(str, "never")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
 			  &transparent_hugepage_flags);
 		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
 			  &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags);
 		ret = 1;
 	}
 out:
-- 
2.48.1

