Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C342BEFFF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019030; cv=none; b=tn+wVLkBcDL3VgCa7Mv9CPs48ba4poQLlqBczUYpp64JRftBWbgktf6bs4b3RY2/G83yPTKX7IReEk6+3MQnqpkcUkvxrq0XhRJAUg2g0KbUjR6x0MERF2HMTzSquCSgB377mEAaPzndZ+pZAKAspENf9X9l96ZfMlki+joMb9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019030; c=relaxed/simple;
	bh=VO+P2GSdqpL3yvynRfRhH8v4iWnJAPq8glERuUFSA90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnP5uKcQRlOs1Fw3OJ4lLNM/In2/Z4W4BkaPbJ/wDCQmsR5+p23hiZSKIPm1w6Qt9f5Bnli2d/jYWtRCcgTlOrEeBcR1/gjeteeiKT5RxXuiXydeUPRfXWl/u1dhZLg1tdaTEd3AyPwvqXBjkmpGUpCZG4OWRbDx1WLFxZ2HR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EPOyqSa4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EPOyqSa4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so299793f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019027; x=1751623827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnKlnox89+aqxPWrx0LhOdTGwWWYyCW4d7dddKDwsrg=;
        b=EPOyqSa4sLtNfz6F+fZjtxU7guHSqmnRK9lTe3fPDrBIwVwr5JwapU3SjlSWk+6Q8S
         KMNk79u2AsVOdJ70jQtssaDRgrleLfpFp3SVGDMmnzdXsVivCmD8Lo9gkcXjLKmuN9qM
         Y5MjsFny1VkrzPMOwdUIxKiG8tGbRQ22FPoATxIvmzs+WNjiv5+I8c4p9cj6JOE0MXY/
         1ayrWA5YhZXbuUfqgW2YjZ5PleBeqAuga3eW8JhCG/UpgmdazkxSRACei9rH1bzZwjdW
         WjsKc8zohjvLg+YWh94eWbMbCpiqxsv5q45H4zPFPZXSkbr8KwQEaRTde7RngjhaOO/o
         D3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019027; x=1751623827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnKlnox89+aqxPWrx0LhOdTGwWWYyCW4d7dddKDwsrg=;
        b=pimEUjKnTWWwQn2HXIHNxASFFKdkyk1EIM2PlTEBVENBX3Hg0K59CIDTEFDIhEjbW4
         JuHy6lFDesyW3g7WY7IF8zFrKuE2ZkgqcVRCtIWjibJK2UJADSbc4j3GEaPcUGKqY3M2
         tDAJLxpHsXAYnv0O3SLrcl9ngpULaa3S2X4nbj/+obF5R8fCvEbLcMz1jHdLX81jB26M
         lkkF7LaBd9GTlJdlOZSPtex+S+P1aX5OBGi/nobq97BSOJ611aTZ3exvPmZ3QlmVphl3
         PrdnFR5Zt0vRt9hQ9f/6BV1EdXURjXQUqdQ/UyhLk4obvKfUP+rBHt4X8WrlOYcum/q1
         MwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5WxRyJBZ0VDlRNKrySR6QScdenp6yKMFGLdbrDaQVyRyI2Y4QLYQeVUBs4yEx6s2RWH0o4HHEWcIqTUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGfv4S6dQq1h3orDtsi/Hua2fj//dJcerOviR5y32QPIk3ebV
	GA1MsOwmn19MGTJ9b/cZNOSxNG/FVyRUZfPeBSV7QJAGtH+4NwuWHt/BdwT0KhXQ+og=
X-Gm-Gg: ASbGncvAWl842024kT0JVTdJO1FbQft87D88etiqhxY30peYu8iA6wB8YaXsXLrEsFq
	VjC89dar3I71tN7nhADXWq187qyAdkL/S9xaVfPCWvsBa8rKFT+UgFvnGvZ2zD1qyvHw7g9cX2i
	KPOlBxDeF9ZocpNexaTDka6l6sF9mJQqwreoYblVBsz9O4WHKulCdguqvCgDJNtqNGaXamZ/pRD
	DScvuwslaCw/lQ5gW5Z0VVT7KldIkMHovFIfIJt+1FAnb/UbaJKYgg/LIm2xVaeaNSGvjZAzYXB
	88tsf1YTs9mSpIrrau7hUeimI2yDbujNfj78jY+aqNHLBUqF057XC1pHsZQmG9Rdjk3DPW7i61k
	CJ/Rh6BpOGJWxI4q9NpWBWMfaTlXUYfA88MGTAk1ys4YzUUrcOBnb
X-Google-Smtp-Source: AGHT+IHuMh68Tyv7KxWY4j2dyJ3BwGirI46s8aecbMNC3bBEbknxdDdWsYm9o5PlniB0HBGERk1eWA==
X-Received: by 2002:adf:9ccb:0:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3a8fe79bb3cmr805861f8f.8.1751019026969;
        Fri, 27 Jun 2025 03:10:26 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a3a5599sm46934265e9.13.2025.06.27.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:26 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 3/8] docs: dma-api: remove remnants of PCI DMA API
Date: Fri, 27 Jun 2025 12:10:10 +0200
Message-ID: <20250627101015.1600042-4-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627101015.1600042-1-ptesarik@suse.com>
References: <20250627101015.1600042-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wording sometimes suggests there are multiple functions for an
operation. This was in fact the case before PCI DMA API was removed, but
since there is only one API now, the documentation has become confusing.

To improve readability:

* Remove implicit references to the PCI DMA API (plurals, use of "both",
  etc.)

* Where possible, refer to an actual function rather than a more generic
  description of the operation.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/core-api/dma-api.rst | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index c0a2cc7d0b959..3e89e3b0ecfd2 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -53,10 +53,9 @@ minimum allocation length may be as big as a page, so you should
 consolidate your requests for coherent memory as much as possible.
 The simplest way to do that is to use the dma_pool calls (see below).
 
-The flag parameter (dma_alloc_coherent() only) allows the caller to
-specify the ``GFP_`` flags (see kmalloc()) for the allocation (the
-implementation may choose to ignore flags that affect the location of
-the returned memory, like GFP_DMA).
+The flag parameter allows the caller to specify the ``GFP_`` flags (see
+kmalloc()) for the allocation (the implementation may ignore flags that affect
+the location of the returned memory, like GFP_DMA).
 
 ::
 
@@ -64,13 +63,12 @@ the returned memory, like GFP_DMA).
 	dma_free_coherent(struct device *dev, size_t size, void *cpu_addr,
 			  dma_addr_t dma_handle)
 
-Free a region of coherent memory you previously allocated.  dev,
-size and dma_handle must all be the same as those passed into
-dma_alloc_coherent().  cpu_addr must be the virtual address returned by
-the dma_alloc_coherent().
+Free a previously allocated region of coherent memory.  dev, size and dma_handle
+must all be the same as those passed into dma_alloc_coherent().  cpu_addr must
+be the virtual address returned by dma_alloc_coherent().
 
-Note that unlike their sibling allocation calls, these routines
-may only be called with IRQs enabled.
+Note that unlike the sibling allocation call, this routine may only be called
+with IRQs enabled.
 
 
 Part Ib - Using small DMA-coherent buffers
@@ -246,9 +244,7 @@ Part Id - Streaming DMA mappings
 Maps a piece of processor virtual memory so it can be accessed by the
 device and returns the DMA address of the memory.
 
-The direction for both APIs may be converted freely by casting.
-However the DMA API uses a strongly typed enumerator for its
-direction:
+The DMA API uses a strongly typed enumerator for its direction:
 
 ======================= =============================================
 DMA_NONE		no direction (used for debugging)
@@ -325,8 +321,7 @@ DMA_BIDIRECTIONAL	direction isn't known
 			 enum dma_data_direction direction)
 
 Unmaps the region previously mapped.  All the parameters passed in
-must be identical to those passed in (and returned) by the mapping
-API.
+must be identical to those passed to (and returned by) dma_map_single().
 
 ::
 
-- 
2.49.0

