Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5F1EBA05
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190555; cv=none; b=n3th0R1gNwVydJrE1q0II51gA2UMwEHXvk/o1VgJ0JBZuzx0QN77IIm4fvvQKxb7kxZi3dSb72YXsxM3h6KOBrdpzfi8NyVapeFpn+7na78Cv/u+Xb7b6/ub8g6kmIgqPGiELqa+fiZrlIbyO09TcujDizOjjbHCsLsIbdz7ODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190555; c=relaxed/simple;
	bh=uw8dUV+Eq/IhNk6YZYVld+WFWUUDZ8dQNMpz0cLYdOo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AGV1+L/mg2+rQBJuVSAMekzHE6qVTb0JwpbwkDfOTsz7N5w/uFoKWPsZ3F4jLqzRGEWNLdSKzjMHpPPQzhxBnDkGpyCOmXObgR7BEojz9L7j+RVIKuaTguXNNu/tCN22mwxX2IoJ2DuKMQ3yH3datCqGQsFzYwlpMMcm8PiXSRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c73eDBnu; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c73eDBnu"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so220888a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190553; x=1738795353; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GH4/nN/ipl8VhnVSg142rgT3YjHhqiHRlTH7bGddYdM=;
        b=c73eDBnuLcjbB6IT/ATi39rM4YDboYgNEBTQLhxLZvT8zyoqe8kgZx9Cfx8gW7bXFd
         UL+LBcPbFDWaZqkshKUVLa9cZ3GV6aHj8idNtuuoMtWmuVstlc0IfJF8vKffpJRiwmnb
         0brwguhwVGV3F8AVO+SRsub54gOjERI8DPKeTJmk27D9HjUhfmsUNIYGMZ8Ok29GvWxL
         FLTkCOm+Tzc0EmpdiU4/edPjkgF8cehmZLPLVX9b+4vpEwKBW62PbRIVPUH3QF/698jc
         DXlgtPuPEv3VyNRZGZ9GQZxKXzxBgX6ovIH8PVzVvA0XrS0M1COiw6vdNCe9ipVvMHZr
         eIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190553; x=1738795353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH4/nN/ipl8VhnVSg142rgT3YjHhqiHRlTH7bGddYdM=;
        b=BqO9eyFEkWHshWndDj5TOxxOUQTfZ/CPhKFo1nmwWLoVdtzLBJ7Vu9pDtANtEI3fMO
         iO2h4FvtV0KQQVH9RdVX3y8iUNFH8toOtB3/I2xSAhSjsy6X5r0GCSDHZG9QFopp+ZhY
         bEZ2BY9ZvIC0Jq3T5ouD2kfIaPFmw9OtCwuATUXAefChIIPiKA58xHTNnG0bNkS5nrcK
         OP/cJ4dTQ6r0gqg2S/CLBV/GWm2r/SxNVHDMM5b02lKjffBpOT/su1y36oG2rbEZYRL6
         DMB80eEBaElqDsjFkJwarqBgN3WI97f+Z8f+w3JDIHQ784j5vWGYI64BClmcBqlo8wau
         0qNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR3yH/tc7KyQ3CaKrwF28EIm1y7kMGLRabFhCaCNQWtgHOE/BBQY1VurD5K9st4nVUwmXI/pftcE/NZUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6pxtvltl1DanBKHZt7magew6Z9509fBKZx4XnNoNkNifj3Xkx
	P/EGcoeCtc0MFccrvIqEba8zUZQpthy34lXmJcW48NFLYAvtbAjq/8UjX7rArkyaKltagg==
X-Google-Smtp-Source: AGHT+IG5Mrax3LyQOG1HOui64BSR1jWBAiLbkCcjUDrw6952WvIrjLf65/po8XH13fz8CLKODbLidR2X
X-Received: from pfbds9.prod.google.com ([2002:a05:6a00:4ac9:b0:728:2357:646a])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c09:b0:72f:c510:dcb5
 with SMTP id d2e1a72fcca58-72fd0c6227dmr7072755b3a.17.1738190553153; Wed, 29
 Jan 2025 14:42:33 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:39 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-11-fvdl@google.com>
Subject: [PATCH v2 10/28] mm/bootmem_info: export register_page_bootmem_memmap
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

If other mm code wants to use this function for early
memmap inialization (on the platforms that have it),
it should be made available properly, not just
unconditionally in mm.h

Make this function available for such cases.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/powerpc/mm/init_64.c    | 1 +
 include/linux/bootmem_info.h | 7 +++++++
 include/linux/mm.h           | 3 ---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index d96bbc001e73..c2d99d68d40e 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -41,6 +41,7 @@
 #include <linux/libfdt.h>
 #include <linux/memremap.h>
 #include <linux/memory.h>
+#include <linux/bootmem_info.h>
 
 #include <asm/pgalloc.h>
 #include <asm/page.h>
diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
index d8a8d245824a..4c506e76a808 100644
--- a/include/linux/bootmem_info.h
+++ b/include/linux/bootmem_info.h
@@ -18,6 +18,8 @@ enum bootmem_type {
 
 #ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
 void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
+void register_page_bootmem_memmap(unsigned long section_nr, struct page *map,
+				  unsigned long nr_pages);
 
 void get_page_bootmem(unsigned long info, struct page *page,
 		enum bootmem_type type);
@@ -58,6 +60,11 @@ static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
 {
 }
 
+static inline void register_page_bootmem_memmap(unsigned long section_nr,
+		struct page *map, unsigned long nr_pages)
+{
+}
+
 static inline void put_page_bootmem(struct page *page)
 {
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..6dfc41b461af 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3918,9 +3918,6 @@ static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
 }
 #endif
 
-void register_page_bootmem_memmap(unsigned long section_nr, struct page *map,
-				  unsigned long nr_pages);
-
 enum mf_flags {
 	MF_COUNT_INCREASED = 1 << 0,
 	MF_ACTION_REQUIRED = 1 << 1,
-- 
2.48.1.262.g85cc9f2d1e-goog

