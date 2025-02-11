Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFB61E4106
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268840; cv=none; b=e5tPryBx33DcOsAb/0bRt4KEqj9wtgk+oz4/uxqpLPXRP903tueK/FQq3AvuLbAxXIEag5qG5NBmHDOoPlf/fQiqXqP/3c8cxTUUWOZK5Ol+66sBXIw52gGQ154NOPbUIur9K+5rrn9haFsNqhmRd/k5hIQ8/9Ctylfx6xzWkmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268840; c=relaxed/simple;
	bh=MwifYhRFjX6dmrk5l//mHMHztSYbGhMPPU2hSFx03ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdBSZ0/eO1ASVXDArSLM5okTWmjMAzq/M1LVhhCT7tr0o0yrF5+FlF5YEbhcl3IZ13X6ZhvfcOodpFFG+NnlNLxvfr6QEf7Bq6JkcxbPQnwbAAjCPk0JybxqZ4wJ5A9XWe5Ft9aD/05jTeeYg9wV2WMX/U4WTcGXS1LtRefIrpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PtF27raa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PtF27raa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739268838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bTn51ccyqcJIHtGLutjpOXSf+X7YNIbdnxCcfHL1d9I=;
	b=PtF27raamm26UkMW//nJJD0xgNS/i1x44wz8CBBxJ5+iKO01MdcCPc+70YyAvG7ynQxyfs
	vucvEyjzDtNAdt3k4Kr5NS2aJ/7mG5NfVjUwJG+AP+Y2QdGMuVLlzmQy6UqvHirXv2rhF9
	qufMa67Ek65NDNYmnyb4PP64NgFl/GY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-318-vzu7K-NGOaO8fBeNHh45wg-1; Tue,
 11 Feb 2025 05:13:54 -0500
X-MC-Unique: vzu7K-NGOaO8fBeNHh45wg-1
X-Mimecast-MFC-AGG-ID: vzu7K-NGOaO8fBeNHh45wg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C5CA1AD2E7B;
	Tue, 11 Feb 2025 10:13:46 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 742511801771;
	Tue, 11 Feb 2025 10:13:43 +0000 (UTC)
Date: Tue, 11 Feb 2025 18:13:39 +0800
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org, will@kernel.org, aneesh.kumar@kernel.org,
	npiggin@gmail.com, peterz@infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mm/mmu_gather: remove unused __tlb_remove_page()
Message-ID: <Z6si0/A/zzEF/bFJ@MiWiFi-R3L-srv>
References: <20250211034348.39531-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211034348.39531-1-bhe@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Nobody is using __tlb_remove_page() now, clean it up.

And also remove the code comment above tlb_remove_page() because
it's not meaningful any more.

Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/asm-generic/tlb.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index e402aef79c93..1fac1985127d 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -489,16 +489,6 @@ static inline void tlb_remove_page_size(struct mmu_gather *tlb,
 		tlb_flush_mmu(tlb);
 }
 
-static __always_inline bool __tlb_remove_page(struct mmu_gather *tlb,
-		struct page *page, bool delay_rmap)
-{
-	return __tlb_remove_page_size(tlb, page, delay_rmap, PAGE_SIZE);
-}
-
-/* tlb_remove_page
- *	Similar to __tlb_remove_page but will call tlb_flush_mmu() itself when
- *	required.
- */
 static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
 {
 	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
-- 
2.41.0

