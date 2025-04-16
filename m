Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B92DF59
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744778112; cv=none; b=PRD3As+juCNp7okBlQ9W3KNo0xpFZbVNnPaHbNTjVgPd4mqTagmmU4AS9+f6gRZvfcUI0V2Zi8Fgb160cdqlXFPd5xWn2rCmnD2taRG20TwtFXjMeliRyFVFytMGSnO1Rmok/+MeMAXWm/N6rKUQi8330xEleaH7jGsXvY8jP5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744778112; c=relaxed/simple;
	bh=8CsF+IkoXaFNBlPgPOug1CHa+VnlOdgwWlLXBEhp+Vg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=b4wbuEI5sfuDbWogyAIE9xCrRZsB5YrTUzdnTY6NwjcPvW1YCAi4lgQDWNjS6GmFtdUnVkieNX4QHMKs0rhe1qDGxcdALX0an3SbgbR7780UnAvDg3kYCZ4ZrRZPjUoe+fqhagAp4AVlBoS7doWdpiKn8B4FcQftAJmCeFpegKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D2XVE3e7; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D2XVE3e7"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30828f9af10so9759732a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744778110; x=1745382910; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NoVEwqwHV5q1ddAJeoGC7UZs2nQ52KxL1yB5sSPTYVI=;
        b=D2XVE3e7NUp8dsHRMe5qCh57zLXHwq4Cygaws06C9dD2MZhCh+WlFj0LSAPq6ONBDC
         qAkTvSmUzK0K8wa3CU3FDE0Vu0CyE1UnNPNL6G0jnfBmZxoPNQDbvbOo208Pt1XQu/Xv
         tdaPq/KjkXhl5PcbjtsbE2QT5M2CB5oB5iFnKITjiNKoCZjC9A4HpX7eFISNj0+hHSjU
         ohWKpebZslofHrRU9+Azoeeqfy/uZ3OfVtdSNguT4/F3wevxyx4zA2hfs/gXOtyTXxva
         DSuiaYqNZ3Xi1PKVJrChdVry+32jOQZNnW9Cxt/X/KIZS4tXLjn5Hxfyv21ncUEN0qRx
         lJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744778110; x=1745382910;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoVEwqwHV5q1ddAJeoGC7UZs2nQ52KxL1yB5sSPTYVI=;
        b=UBo5xVq8T+S1KSLJOr+xOv5VEonlWAO171yt7SXNZ2M/RpoeKG+iPsQjOfCCBzpNwS
         lgRA+UQ89E/AKQsjiOSGKEoIt1Nx9mJ8aqgnjj6tizVVKPYfIm/kxFehpB6gjBK71Cnv
         zTWwfLKc7H9cz6s450N4qexLFb68/tKbY8HXTn0RiJmoFwnQlwVEY8vofZo9Bi9fl6b/
         KTIH5/zxC+D177xuuPtDDzWo1hdBUQN6aLHPdXrAABLo016cUok7boitFz2E1T4rdqby
         zxgdw8XUz3+lzkrrEZ9B4Wqr8LyCQ0VdME2L/QoKXiEoJ10v0QWTd7lHfaU1TWnpqT6s
         XkhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkWA2lUM9EYViiEgFnCMu4dZnUYvO/BKQpTjVMNMeHng7tE8PM6rKYHiiI8ohRIW1tnM+C7l/ioNp4WTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBB4/ZYphYqsyLqKR01U2AxO9IfBDxvw66//rfe2P7hcCt8qcz
	RT+aRduDB79Ysg8zReVRWckiLpvWezl1Of1TbYfttIHVVLd1+qv1a+RVNEXFvF/hhDsEOA8O7K+
	vlk4ADQ==
X-Google-Smtp-Source: AGHT+IG2G4ywQjj332C/QbLj2/w1uiBgiH97/ajraV5DPfnUNzqGgNveWJxxAqmA9rtK2oDi4bz8OSxgEbBN
X-Received: from pjci2.prod.google.com ([2002:a17:90a:3d82:b0:308:64af:7bb9])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c2:b0:2ff:6af3:b5fa
 with SMTP id 98e67ed59e1d1-3086415dde8mr408227a91.22.1744778110480; Tue, 15
 Apr 2025 21:35:10 -0700 (PDT)
Date: Tue, 15 Apr 2025 21:34:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416043412.956-1-jyescas@google.com>
Subject: [PATCH v2] dma-buf: system_heap: Set allocation orders for larger
 page sizes
From: Juan Yescas <jyescas@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Cc: jyescas@google.com, baohua@kernel.org, dmitry.osipenko@collabora.com, 
	jaewon31.kim@samsung.com, Guangming.Cao@mediatek.com, surenb@google.com, 
	kaleshsingh@google.com
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


 drivers/dma-buf/heaps/system_heap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..ffc8f488eca6 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -50,8 +50,15 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
  * of order 0 pages can significantly improve the performance of many IOMMUs
  * by reducing TLB pressure and time spent updating page tables.
+ *
+ * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
+ * page sizes for ARM devices could be 4K, 16K and 64K.
  */
-static const unsigned int orders[] = {8, 4, 0};
+#define ORDER_1M (20 - PAGE_SHIFT)
+#define ORDER_64K (16 - PAGE_SHIFT)
+#define ORDER_FOR_PAGE_SIZE (0)
+static const unsigned int orders[] = {ORDER_1M, ORDER_64K, ORDER_FOR_PAGE_SIZE};
+
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
 static struct sg_table *dup_sg_table(struct sg_table *table)
@@ -318,7 +325,7 @@ static struct page *alloc_largest_available(unsigned long size,
 	int i;
 
 	for (i = 0; i < NUM_ORDERS; i++) {
-		if (size <  (PAGE_SIZE << orders[i]))
+		if (size < (PAGE_SIZE << orders[i]))
 			continue;
 		if (max_order < orders[i])
 			continue;
-- 
2.49.0.604.gff1f9ca942-goog

