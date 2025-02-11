Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC626BD96
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245444; cv=none; b=OC+Sdy0cnDsMaL9ZlvDobEawcq1nWuH9lgAhCGmBGuG7Ctyfi1tPizV8zaH7A72SMkBER0hFU9h04bDFrE54GpOLPqurkiULes3wqPn8oF5Lv4OnYyQFnU69/j9QRYmTEM6M6WOKNUGOVGd8X8ExZ0ngqBOFlbk/LY52I9mSgYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245444; c=relaxed/simple;
	bh=CA+MnVmLKOrIDrfPUQnE738SsovChTUPP02hZK+XVac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=e2vmkb9RTafPa7yb3wEvxxlqUpB2HVZszr3uYOMvJGRlAooEko8q6tHEuI1PhFsaRa2Po0Z/jvBUZ8T5LUyLh0mvA7+Rg2vql4uY9R//R2kL8gt6WfX2g7bS153JaXTWwEv3MVdwR6gU4c/bqDp435Wy998QLIscGFV/9Ei4q4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KwmNcs2W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KwmNcs2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739245441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7JNAr76j5oLqWNY70OtkymHMDejckVUiY1yR0byy3Ew=;
	b=KwmNcs2WGrMqh42/0+USB5vqWfEHJjve2h1T0SyTQlr49A68KXiq5M51xfV4sY2cxUV/YU
	97WzNkwRhKT+bPFVIG3OVfLT/VyA3K5elou0Vng2JYIqbrZbGmafs/13L7jeji1E/4wSJt
	msXDuLkdywiUMxYU5kAcyPS7HnchZnc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-465-bqau5SIvNhu0LLv9Y9QOZQ-1; Mon,
 10 Feb 2025 22:43:59 -0500
X-MC-Unique: bqau5SIvNhu0LLv9Y9QOZQ-1
X-Mimecast-MFC-AGG-ID: bqau5SIvNhu0LLv9Y9QOZQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 580EE1800877;
	Tue, 11 Feb 2025 03:43:58 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.8])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A9442195608D;
	Tue, 11 Feb 2025 03:43:52 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 1/2] mm/mmu_gather: remove unused __tlb_remove_page()
Date: Tue, 11 Feb 2025 11:43:47 +0800
Message-ID: <20250211034348.39531-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Nobody is using __tlb_remove_page() now, clean it up.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/asm-generic/tlb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index e402aef79c93..9ae4ca02f29f 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -489,12 +489,6 @@ static inline void tlb_remove_page_size(struct mmu_gather *tlb,
 		tlb_flush_mmu(tlb);
 }
 
-static __always_inline bool __tlb_remove_page(struct mmu_gather *tlb,
-		struct page *page, bool delay_rmap)
-{
-	return __tlb_remove_page_size(tlb, page, delay_rmap, PAGE_SIZE);
-}
-
 /* tlb_remove_page
  *	Similar to __tlb_remove_page but will call tlb_flush_mmu() itself when
  *	required.
-- 
2.41.0

