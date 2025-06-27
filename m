Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA38E2BF015
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019032; cv=none; b=HHmoGj1sbEuKkoDBcQvjstCmeI1o0t/GVeyMJinx5wFrVRdwEumVyFpIjJujx8sYkrP/IBzsa+gSFtak8omtyA1dKaGf6LTGeiKGH1z0Oo+fJQJ9AHN3S+gcL72MTzN9vrrQXwDE3+EOrLp21KuH6R0KFmOweJxPfvgS6LK5zpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019032; c=relaxed/simple;
	bh=+x3y1vqW9Z5Car8CAaRNk20tbSowY5YAsoM75/r+qO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3OLXwyZibj+6O9L5P7xUOmFEc866Fj5om6Q0Cs7xlqGKku/p9Sd7QYzcuPvu65fhiymLB8SyqvKGHkL3UjKEraPwCXomD3e7tOdC59YmZ60Q38EfpWt0blp9DBJpp4YVUOJxBaMd/T5gmpVzWSBtp96YvOulIVrjg6dANQPyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bKsSAa+H; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bKsSAa+H"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a52878d37aso249242f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019029; x=1751623829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5atQvWZ5XtF65GtICFYcWzizaeglvYjKjJ357iLMqgU=;
        b=bKsSAa+HtNk1Fy6+0XLGMARaYyOGlRb8lAJbIYRcZyfC1jV5Y5SvH3HjEGOMnkBuW5
         zD5gstFkTWsa42wMr5/m1FsilGDrjLgroyE4N7p18yq+5uYwbiINcQ1gsKWd452NJW58
         R+i8EATQUHIg5ur00+aKLZzWecIWWRQTBoVl3bao0eYWLzb1fZI5ZtRa/OZP7MnpCad9
         MGzT6L8VJLmi+5Iz4d0YhFL2c8/uwOkSCoJBpTyLdSRzWBZMf6xvS0MTrIqFQGtUTQX1
         2tUJhOtAq5fsQQgtpc80waqRoDMsB04DTONVBC4gwa/UNv1Gj355a/Fw/OmJ+dhPrwbj
         VNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019029; x=1751623829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5atQvWZ5XtF65GtICFYcWzizaeglvYjKjJ357iLMqgU=;
        b=fHwtqgRqDtZlM2bGlfDS02PLpcr6WmygVjFn6g35XXdOcoUZ5Hlz+V0ZmykMpHc1TW
         j/3Tj2XAzlbuMihBOELPpJLNCrrtdEle7W3CaXewKisYTPF3gESXV4M3YL8ko2FNzamv
         XNUxvxovw+sb9XWvNb4NKUQT2cZC3MuzCpO0xckIAj+bfMrwhLWwuK2fVpmBudpkjJaw
         anWGDVlC7w/Fnd4cN4OJSXRxAFgPKavGM11XnsUcNAYfW33zWXCwoAPpac2PKD3/aHQu
         KTaFaRvh1mGsMEb2lydrVboGsucjTgPeTBpeA1J6jJ8K9kEZbayv8QQepsVyjL4D4FDv
         6CWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC+N3eVfC9iUjRda0yz5IEypiVmfowFSKwUa+6SuYFsNf6KHtWvsKYeK551bZyHJgmzK2suAP8bBftJRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzou35h05mi5fGq6bVeK02QGQMEY/KjZXsYiq/RHqoy/eywtOKd
	odU8JDI2M9X9x6z510fTWIYpPQ2SbkoipVRHm8iu31ZfjbFv28j203JFRGeY0kdzAr8=
X-Gm-Gg: ASbGncuq+CLGLmenkKN9+lcNSMJIVf9sOBqperK4UAQgVQ50EY4dbvMcH4c2eQAPMdt
	cGSJn/hjQBVv0Ni7VyeIyBKfqrUT/eXRp2O9nKzciDfiwaUyN6FcE3kAqXEcMedB1sffnPx3FFR
	7MErPbEjbDQz9hrTRG7IwwV3FgUOuGMAtw5va/2JVfiCMqrpqhMe30210E0TuZ+XgkKZ9txL4g9
	dnoGbBYJ7UGgLKPzPF74KGg5ETND85r+/tHxVSfyWTbj1Meek+0IxjFaJWOOmXzyxLDpxfe3NLp
	Z3X+WKPTi4kUX5nKJ4gimk4jttMDKbD0dxG8NMX7oDW5F4iTcX25MOgWPhwhTrNcHeQR2mK2RqS
	g2Ox7Vou6qaL9u/AZrxFxi/e4t38SxYOPhUeXtzMgDswvJT/ySnH4gcMdOwMz+j4=
X-Google-Smtp-Source: AGHT+IGZE2klh6TBPD0rO9TA6JzZZw9l9tj4iEA/pqRFAVww2T2OERx45EFu4KjvgIYNex31bGtc7A==
X-Received: by 2002:adf:b612:0:b0:3a4:dc42:a09e with SMTP id ffacd0b85a97d-3a8fe1dee45mr758781f8f.5.1751019029122;
        Fri, 27 Jun 2025 03:10:29 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad20bsm76001965e9.20.2025.06.27.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:28 -0700 (PDT)
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
Subject: [PATCH v2 4/8] docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
Date: Fri, 27 Jun 2025 12:10:11 +0200
Message-ID: <20250627101015.1600042-5-ptesarik@suse.com>
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

Document the dma_pool_zalloc() wrapper.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/mm-api.rst | 2 ++
 include/linux/dmapool.h           | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index af8151db88b28..a61766328ac06 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -97,6 +97,8 @@ DMA pools
 .. kernel-doc:: mm/dmapool.c
    :export:
 
+.. kernel-doc:: include/linux/dmapool.h
+
 More Memory Management Functions
 ================================
 
diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
index 06c4de602b2f3..c0c7717d3ae7b 100644
--- a/include/linux/dmapool.h
+++ b/include/linux/dmapool.h
@@ -60,6 +60,14 @@ static inline struct dma_pool *dma_pool_create(const char *name,
 				    NUMA_NO_NODE);
 }
 
+/**
+ * dma_pool_zalloc - Get a zero-initialized block of DMA coherent memory.
+ * @pool: dma pool that will produce the block
+ * @mem_flags: GFP_* bitmask
+ * @handle: pointer to dma address of block
+ *
+ * Same as @dma_pool_alloc, but the returned memory is zeroed.
+ */
 static inline void *dma_pool_zalloc(struct dma_pool *pool, gfp_t mem_flags,
 				    dma_addr_t *handle)
 {
-- 
2.49.0

