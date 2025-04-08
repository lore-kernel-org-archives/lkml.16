Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D63188CDB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130409; cv=none; b=D6HRPuw+ONhQdVKN3Kh1ZANLMr9JQma+xhRpfhNaBJy0zIYm8QFevQQNpV34x/SjWtxfiN1lZOe+QTjBzTfWrEuj4HLjqqTu4azREAblm7TDQO1aGdxXNKguoyQqggnMFwc6TqSudUcg4X+VbaYPJMRzwNC2WDdpH9zghriYgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130409; c=relaxed/simple;
	bh=vJraGZAUkC5Ri6nsMBNEEyxQwHjHXg4jLVpBhPsSR4I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GzRpJxF62w3r6jKqaY7EWxcu9I2ni5dn4CszVSZm3ajlWIOg0oBT6VE5wh9fz01sdXeSJFyYMeBbyj/PhvGYGLKbZ56nYpMRjtLF17OKtQ/okFzdXTip1Wu6JeHM1Sr4vlz6qxvXcqZe8F+D+YYCWI9CSymybdjMBnzmO6R0vLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BIiSKV5m; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BIiSKV5m"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736c7df9b6cso7516456b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744130407; x=1744735207; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gBC1sLJQZwJnKDlXbyYuAnn0xSTsMYHN3avTvc3kulQ=;
        b=BIiSKV5mq5TwlAE6bclqmv0XIR9Bw+SpgpY4ZNxbx5+dkhQI8CChHBjRy0hSrm/O7k
         UvH1JFyHkEqj4yta/RPeC3h+BVCd6dRtzKK2hRnLm5r5dvZE+DCSCVP/dS33NuNhXKpK
         Ni9Q03JUImV7narwYpDCvY1ttjwE5cOYUCAE/AW3deE7H4mnZoQz3KC4S60IogJt+D0Z
         bLCn7YlfPr03AQi7llASipdhZ3lKDWCnTwEcHkuYfe5NK6c+Xn6sBltb7TLWht2ztGFU
         h31WLQMWtcIqKeuaXA10Cn+YiY4RdJPQovkeL4PIzzS2zaXhbWFNcnpV229V+E6fncJD
         08ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744130407; x=1744735207;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBC1sLJQZwJnKDlXbyYuAnn0xSTsMYHN3avTvc3kulQ=;
        b=f/kQI33UF2PaXYJCU4WJRnmLEhmtifaFzPrrzFFCZsbOdAiJr2oNwHZBE++070xgDL
         rNW3pvB9zdmEAENHrXbK8gYEAUBb18hOfcsk3bOwBNh+8ZcP7nZWY3wZPF8BU7CG+bFJ
         MCw1oG2Z382MRduphg91wAmBNtPzk5ZL1YZZlU0Tv1rzCDmm/PI12hKUPwFM+Kai8hyu
         HWoFHwZXCQ/94RnnCiLt26wP71LnYUtfQz7rCA9zMYVwlMyFgfJPHAenAILUcpBLagLa
         Od9DEYhwRyZLdbaforJ+qzPO8sPEz6hhwacs2zNxTw7xzkGFYWjZm9HUBJmf9RScdHjF
         k/lA==
X-Forwarded-Encrypted: i=1; AJvYcCXFn9lt6ZQVDCWZjIcFsO+zUf9S9owTuyZ3ZCP/d5zbKhmTdpyfy6aIF6ASeSKe3i3/AnarhcR/0vHknW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcKZ4anPhl7dXwIUDDQBPQqvmZT5wYlC6162smH4tpYIzEFAI3
	XLi/LCkW/iPW7RWuxUZHaJt+4QUHBgy7pB1v9al0OqOR207ay+Y4Hwp9bRZP4j19rCYjIw==
X-Google-Smtp-Source: AGHT+IExffKl5VV/YVWLgCHPNE/zWYqSSOjhsEEwE9JsaKtkrh21oqkcO58rcvsZIGPYCkdwm1CNFn6s
X-Received: from pfgs23.prod.google.com ([2002:a05:6a00:1797:b0:732:6425:de9a])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:398f:b0:730:9752:d02a
 with SMTP id d2e1a72fcca58-739e48cefc2mr25043956b3a.4.1744130407061; Tue, 08
 Apr 2025 09:40:07 -0700 (PDT)
Date: Tue,  8 Apr 2025 16:40:00 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408164000.3215690-1-fvdl@google.com>
Subject: [PATCH v2] mm/cma: report base address of single range correctly
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: Frank van der Linden <fvdl@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

The cma_declare_contiguous_nid code was refactored by
commit c009da4258f9 ("mm, cma: support multiple contiguous
ranges, if requested"), so that it could use an internal
function to attempt a single range area first, and then
try a multi-range one.

However, that meant that the actual base address used for
the !fixed case (base == 0) wasn't available one level up
to be printed in the informational message, and it would
always end up printing a base address of 0 in the boot
message.

Make the internal function take a phys_addr_t pointer to
the base address, so that the value is available to the
caller.

Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/linux-mm/CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com/
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/cma.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index b06d5fe73399..15632939f20a 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -35,7 +35,7 @@
 struct cma cma_areas[MAX_CMA_AREAS];
 unsigned int cma_area_count;
 
-static int __init __cma_declare_contiguous_nid(phys_addr_t base,
+static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 			phys_addr_t size, phys_addr_t limit,
 			phys_addr_t alignment, unsigned int order_per_bit,
 			bool fixed, const char *name, struct cma **res_cma,
@@ -370,7 +370,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 			phys_addr_t align, unsigned int order_per_bit,
 			const char *name, struct cma **res_cma, int nid)
 {
-	phys_addr_t start, end;
+	phys_addr_t start = 0, end;
 	phys_addr_t size, sizesum, sizeleft;
 	struct cma_init_memrange *mrp, *mlp, *failed;
 	struct cma_memrange *cmrp;
@@ -384,7 +384,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 	/*
 	 * First, try it the normal way, producing just one range.
 	 */
-	ret = __cma_declare_contiguous_nid(0, total_size, 0, align,
+	ret = __cma_declare_contiguous_nid(&start, total_size, 0, align,
 			order_per_bit, false, name, res_cma, nid);
 	if (ret != -ENOMEM)
 		goto out;
@@ -580,7 +580,7 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
 {
 	int ret;
 
-	ret = __cma_declare_contiguous_nid(base, size, limit, alignment,
+	ret = __cma_declare_contiguous_nid(&base, size, limit, alignment,
 			order_per_bit, fixed, name, res_cma, nid);
 	if (ret != 0)
 		pr_err("Failed to reserve %ld MiB\n",
@@ -592,14 +592,14 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
 	return ret;
 }
 
-static int __init __cma_declare_contiguous_nid(phys_addr_t base,
+static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 			phys_addr_t size, phys_addr_t limit,
 			phys_addr_t alignment, unsigned int order_per_bit,
 			bool fixed, const char *name, struct cma **res_cma,
 			int nid)
 {
 	phys_addr_t memblock_end = memblock_end_of_DRAM();
-	phys_addr_t highmem_start;
+	phys_addr_t highmem_start, base = *basep;
 	int ret;
 
 	/*
@@ -722,12 +722,15 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t base,
 	}
 
 	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
-	if (ret)
+	if (ret) {
 		memblock_phys_free(base, size);
+		return ret;
+	}
 
 	(*res_cma)->nid = nid;
+	*basep = base;
 
-	return ret;
+	return 0;
 }
 
 static void cma_debug_show_areas(struct cma *cma)
-- 
2.49.0.504.g3bcea36a83-goog

