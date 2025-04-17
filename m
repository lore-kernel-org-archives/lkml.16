Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC21C6B4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921162; cv=none; b=gpBNwBaZQnFR93JXizj1oj3fExgQiv1yAFw03Bmy0Us7Ll2feUP/1WFQDAswtSJX4rE8frawv1+/IWFsOL2I4xdiY23G2T8l3sfO3e5yynnGAul4fz3JEnV8Jsd5xKcCcrYHpR5BTxeX4p+gjmggqjQdBvKjM3fpjkqzYR7q99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921162; c=relaxed/simple;
	bh=uL9FnUafBcSm4Xo8blgLdW7ATAt7SFP6K2MYu6fZWgs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MOY2Xnbphd3eV4xO41HEMSMjoGrwKsaNzYXNmgKmYKTCLJW4Ta8D+qS/iAo4A6GRKNa0GFcrzNDmiEWs8n6ZSSpTXD1EJHNWSFrfzdfx9niQvbKDqklK7HWatvi4yW6X4AVBTnIXQdwx9Lk+ZNpwUs/pTpThQhugibrerIPrmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VaGKF5jR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VaGKF5jR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so1172655a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744921160; x=1745525960; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=szmwZh/snPTv0r4g4X3cMAtrvCVPEjXRIc5jf6i3HMI=;
        b=VaGKF5jRy7ptVR4y9U3kR9F+k17WuInUKR5DsCc1aaD7A7Ftv4/riVeiIPRe86dBBb
         i3zxfJ/YU0uNaWoeMKt8DbptuKKp0Zf13/daoKZVHscvi6UrN6eRNByqJNRbbPhPCmCP
         HiRSh4OIK01zLCy+aS+oUetuvFItnlZm8NgTV+K5r4zSZplI9y8nv7bufMzJBLcfsIMR
         2pgD7+0fr0jZkFQIbya6iPQ8Fqasj0S+BSC2asKETzsh4QdlJ4fAlSEXK9bsTtyuo9b/
         xOSAVzGsfFBMm6//pMAYeUAfIEG4AHpS20NLr9Q69HECB6T+CPUoTHoTJEU2ULRbiYCA
         8/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744921160; x=1745525960;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szmwZh/snPTv0r4g4X3cMAtrvCVPEjXRIc5jf6i3HMI=;
        b=BmW5xiPV8+7co0RQW+4Y1uGtrIClDe2b65HbKM88YceSuRSQ01biq4N5Niw3mvtbXa
         fSGXV1pTGf82HOFHieR5fE5d+VekjXJeMthhG3yevXnmcfwfVwkk4DSweC4PChVnLtOE
         lj8cKqKaKMo7TxutVWV6noCWzYq5f6MGT2Lr22TtsaW6l/wqVqOBFg5F/npFYRqmLXM7
         aeHYM6sXNq6R6rDG4c5i4k4VSGl4LIV2y7zlSQ/tOMUQISgLmvnnDcwv13cMsYlfZGiX
         yxqFGNnU7BujwDOTmgRQGHFjetGmApzo9pgq+JuXuuyx7ENirx8ctMCPXMKeWCvOG2HH
         AB/g==
X-Forwarded-Encrypted: i=1; AJvYcCV7dM10XaIlPB8o4DqcI3WwDSnEtOREvgnOPuCpDwbm3S9lwB6t6lZKt51U28akDM0essBBJ2pdjOy5n0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVr3o9hP4lGarPf7WOCpmo7n+T5dTzoL7VXROJR/M/FOzqF/8
	GMwJIJJrAuZxqWNWoJvev6db6VcAvj5RwVc9uwR4I5N2y6BDimj5IEHAeT/J7GMxmQ4twJfPX2h
	IPBlG1A==
X-Google-Smtp-Source: AGHT+IHqVo64+FhTZ9ieKVGFwpqJFtKlYfDnSlq2xKJP48CFVf++acfJ/rmzTtjop5b8jMgM80+OJ2bsTKlP
X-Received: from pjbsv3.prod.google.com ([2002:a17:90b:5383:b0:308:65f7:9f24])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2809:b0:301:1c29:a1d9
 with SMTP id 98e67ed59e1d1-3087bb66b26mr432491a91.21.1744921160042; Thu, 17
 Apr 2025 13:19:20 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:19:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417201913.2393655-1-jyescas@google.com>
Subject: [PATCH v3] dma-buf: system_heap: Set allocation orders for larger
 page sizes
From: Juan Yescas <jyescas@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Cc: jyescas@google.com, baohua@kernel.org, dmitry.osipenko@collabora.com, 
	jaewon31.kim@samsung.com, surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"

This change sets the allocation orders for the different page sizes
(4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
for large page sizes were calculated incorrectly, this caused system
heap to allocate from 2% to 4% more memory on 16KiB page size kernels.

This change was tested on 4k/16k page size kernels.

Signed-off-by: Juan Yescas <jyescas@google.com>
Acked-by: John Stultz <jstultz@google.com>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
---

Changes in v2:
  - Add John's Acked-by tag.
  - Add TJ's Reviewed-by tag
  - Use dma-buf: system_heap: in the subject since this is specific to the
    system heap, as per TJ.
  - Remove extra space in if statement.

Changes in v3:
  - Remove defines for the orders as per Christian.
  - Update the order array for 64k page sizes as per TJ

 drivers/dma-buf/heaps/system_heap.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..8c10c0f2b473 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -18,6 +18,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/scatterlist.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
@@ -44,14 +45,28 @@ struct dma_heap_attachment {
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
 				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
 				| __GFP_COMP)
-static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 /*
  * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
  * of order 0 pages can significantly improve the performance of many IOMMUs
  * by reducing TLB pressure and time spent updating page tables.
+ *
+ * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
+ * page sizes for ARM devices could be 4K, 16K and 64K.
+ */
+#if (PAGE_SIZE == SZ_64K)
+static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP};
+/* 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE = 1MiB */
+static const unsigned int orders[] = {20 - PAGE_SHIFT, 0};
+#else
+static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
+/*
+ * 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE = 1MiB
+ * 64KiB allocs are calculated with (2 ^ (16 - PAGE_SHIFT)) * PAGE_SIZE = 64KiB
  */
-static const unsigned int orders[] = {8, 4, 0};
+static const unsigned int orders[] = {20 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0};
+#endif
+
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
@@ -318,7 +333,7 @@ static struct page *alloc_largest_available(unsigned long size,
 	int i;
 
 	for (i = 0; i < NUM_ORDERS; i++) {
-		if (size <  (PAGE_SIZE << orders[i]))
+		if (size < (PAGE_SIZE << orders[i]))
 			continue;
 		if (max_order < orders[i])
 			continue;
-- 
2.49.0.805.g082f7c87e0-goog

