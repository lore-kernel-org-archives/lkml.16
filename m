Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5899629B8F0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561177; cv=none; b=iaDj8YM1aqfIoNbCUOBaUbQLsNeBPBHev4gIo9l6ZgMdboBP6eHxbeUADLo6cCO9VItx82QD2ivNvF1Yc80Zmyu5RuOHNoDAhC4MYxKDzJE8FAff8+/BsVvC80rAUAUZB/A9XughEAIwoGmnFaLSCMKjnZ2gsjrNqvMeoifaTrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561177; c=relaxed/simple;
	bh=yef15B0sGtKhMMnl4sHNnJ32U5IclmJDl8sy1R7VHnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODu/A3W26xllL9iwRcJd3SdHhGHb5OG4EYDf2GDfuB+2iCzCO8bnlAVeEBhEIDcGB34zL6TR26ICIw7cXPdMSCZHJPBPPW4hPuvZUPcPZwOJe0MJJzZI27+QWWBKIYvNeWkshRJSejqZ34Jk0G8mCFxNEiKAJCVafLxFK/pFXHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=POL3Ugiv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="POL3Ugiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwNvAxSsZLHPNJHICSvYXU8WtA4BAcBKIAsdjIZgB+Y=;
	b=POL3UgivvKi7UjB/AUN+Nm0bctMDGgwioec0eUbs1mhaOWDd09jIBrZJwxCeGjsCskr1nB
	rxcKYUZLRtPUhGnGN7+tz5lsRpNJnibkvlY/RjmXmJpAuVNz3zoIPRPh2g26qRDlGld5C6
	6P0ovVJmbLT3AdGyki17ADmGJO0tsjw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-mG8lWV0tNEe7VBlrhGZe8A-1; Tue, 10 Jun 2025 09:12:53 -0400
X-MC-Unique: mG8lWV0tNEe7VBlrhGZe8A-1
X-Mimecast-MFC-AGG-ID: mG8lWV0tNEe7VBlrhGZe8A_1749561173
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fad34d3cd8so92001576d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561173; x=1750165973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwNvAxSsZLHPNJHICSvYXU8WtA4BAcBKIAsdjIZgB+Y=;
        b=RXmI+vz5sOf0moThaWNjB/7dfNdGNftBKZf41KqrprVS1JrrJUthjSZ4tAQSmOxU8W
         NYgS/VAIT/VqcoDhWf9Tjq67WMJt74p4iz7A63Bdgw5timLC2I+OoQeunLiUFwm1hehf
         q27ytuYqhvQDl8M0c5bfJubTKCadYDJnivdBhtxAB581lVDnz+0kFjB4xeK+MFsd8RZ9
         L7yEjR+r2s+2pHfcNqE3E7BRBSNFze1EpFErfW/HTsOvxs0j/nw7kIN+0ntgsRvlyhQ2
         IF24QQq4+yWzZEvQCslYlJFQG7HTdJlEreS8QIZkiZV0GuDtVYBAPAFjDeFgHGaTwiI3
         nKuA==
X-Forwarded-Encrypted: i=1; AJvYcCWJML4Fb0iGnFWnv72Ntpj2FPAEWM+oRvoA3Ch6HGkTHrWkVUUBMYom3omYLMoumhJQsMhHu0wyV+3S3OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxJnMS0qbJWaqKKdaLccEzfalakOZnkrMYPyfTyRhUiZ7UQh5
	v6PFxIDncvbO1OJquf2C0IhGtJQFked2QApzLXXTFzcR7g9Yo+L4EQjSUcRBkHxw5AjCHB/9X+N
	W53lFlkFRMYGIoYyI+s6bHv/++YCNabBFLlC09En1rKR1dVkTLeTfUjmZeKybaBNfSA==
X-Gm-Gg: ASbGncsqT0sELlWlampBquXR1qgZAaLaiAiRGxsj6FCxSOzxLjIvKjjYuRC3/NHSvk+
	zcIVGE5piaxLazEkQ/TOZMgbc9T0UNlWVBmgTFlJ8iDB+VW7zcnQfYWBHgjHsr3g7S+8cYmJmtO
	FNVdDdG0dUdLw3vdTc21ENWBNPgYUaW+NPyFtnE47BXVg+xSYkqLWddze1jr0nqt2UyYHT7Tgd7
	xfl3kN4BcRdo4iBh3g8nu1Qe1cFn8BHnEFbWBQtw4hxfYHLFFWd+WR1+OETvuKniSFHVG2A020H
	5T/k1vl5blgGgGAmHFRzOdl9mjyWx5NP9v13nS7P582hXAChJa/GJw==
X-Received: by 2002:a05:6214:2501:b0:6f4:c742:7a7b with SMTP id 6a1803df08f44-6fb24cc1827mr35155836d6.43.1749561172559;
        Tue, 10 Jun 2025 06:12:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhwjqEuOk/V8BHIoXELyZMwDXwVFYf4ATZsDCoOS8jLuVTpHJJBi7SBGtQfW7GqBV1/L6ZsQ==
X-Received: by 2002:a05:6214:2501:b0:6f4:c742:7a7b with SMTP id 6a1803df08f44-6fb24cc1827mr35155466d6.43.1749561172028;
        Tue, 10 Jun 2025 06:12:52 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:12:51 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v4 3/3] dma-buf: heaps: Give default CMA heap a fixed name
Date: Tue, 10 Jun 2025 06:12:31 -0700
Message-ID: <20250610131231.1724627-4-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CMA heap's name in devtmpfs can vary depending on how the heap is
defined. Its name defaults to "reserved", but if a CMA area is defined
in the devicetree, the heap takes on the devicetree node's name, such as
"default-pool" or "linux,cma". To simplify naming, unconditionally name
it "default_cma_region", but keep a legacy node in place backed by the
same underlying allocator for backwards compatibility.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst |  7 +++++--
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
 drivers/dma-buf/heaps/cma_heap.c              | 20 ++++++++++++++++++-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 23bd0bd7b0654..1dfe5e7acd5a3 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -21,5 +21,8 @@ following heaps:
    usually created either through the kernel commandline through the
    ``cma`` parameter, a memory region Device-Tree node with the
    ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
-   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
-   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
+   ``default_cma_region``. For backwards compatibility, when the
+   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
+   created following legacy naming conventions; the legacy name might be
+   ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..bb369b38b001a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CMA_LEGACY
+	bool "Legacy DMA-BUF CMA Heap"
+	default y
+	depends on DMABUF_HEAPS_CMA
+	help
+	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
+	  from the CMA area's devicetree node, or "reserved" if the area is not
+	  defined in the devicetree. This uses the same underlying allocator as
+	  CONFIG_DMABUF_HEAPS_CMA.
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index e998d8ccd1dc6..0df0071119754 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -9,6 +9,9 @@
  * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  */
+
+#define pr_fmt(fmt) "cma_heap: " fmt
+
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
@@ -22,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#define DEFAULT_CMA_NAME "default_cma_region"
 
 struct cma_heap {
 	struct dma_heap *heap;
@@ -394,15 +398,29 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
+	const char *legacy_cma_name;
 	int ret;
 
 	if (!default_cma)
 		return 0;
 
-	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
 	if (ret)
 		return ret;
 
+	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY)) {
+		legacy_cma_name = cma_get_name(default_cma);
+		if (!strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
+			pr_warn("legacy name and default name are the same, skipping legacy heap\n");
+			return 0;
+		}
+
+		ret = __add_cma_heap(default_cma, legacy_cma_name);
+		if (ret)
+			pr_warn("failed to add legacy heap: %pe\n",
+				ERR_PTR(ret));
+	}
+
 	return 0;
 }
 module_init(add_default_cma_heap);
-- 
2.49.0

