Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097DE2116E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044896; cv=none; b=MXBWVScNkyBm7znQQgzSE5Fvg6mWt+4PLoG1C0fFCmD1p8w3/5gnqCllP7RqVFUKiu7ZF9qXDwVDwM0pOpF6/PzIwmMKGIcAPnj98Np4QGDJpzpHVlcwR40goGMOYuCaKNKjTzqt45XMQ3+5bXDH3jf5BQQ6KmFqA+aaO39djVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044896; c=relaxed/simple;
	bh=k4BYurKy9HjJ40FkiYbSdn/8RH0vBPZR4CBIuTlxa+8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gGpN/TxePq9nN6oV5WdvrTSq2IEcqQHKD8j37vv9jNv48KAHWX3aFAjOlUumIwx85UMVFvmrCTS5VJFPjcsNYVtXqJVoCrtmEdf2S8g5VlR1GsDNUbrs2Lc1RyfWzNXN/Kld6KjBmdNsNSykas3rdY4bpkqh9wH8AdK5WCNtXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=De8kPg38; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="De8kPg38"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7370e73f690so5570449b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744044894; x=1744649694; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TRYh3FjHNxiGvARm/fP0S56t2RPKrvBUVQVlOvdeY4E=;
        b=De8kPg38VWKpd5jZ5zutKX9aDRDmYH4rz6qfjpcXrdWTXEyiwd4JYTB2A8a45+thKN
         vzZhHICef/9xYZzdTR3cxKu0HV6EVUv0JI5C/LmziBeIGsgVMWa2e02ZLW7dnVq8zWZh
         CfIngqyNl3A2ueXKYN2lKclYP1SkaL22PsJmUXonhSgQ5CijoYakO79odSKQA0VnqjBa
         8fwoYhRCAWYcIQlNx6jCgHM/nDyneFPMRndl4ZgjxdxeX1l0hYt68c7Wv+YK3odcn96y
         pGGbYU8B5zRAD+00KawgHXx2T61CTjgTR7JyWYUhPxR7+OMhJOjYDzaKkV2GC8gy5Ydx
         lgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044894; x=1744649694;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRYh3FjHNxiGvARm/fP0S56t2RPKrvBUVQVlOvdeY4E=;
        b=DRjkS6NkLM/9N8ys7PoB7YUiGKl2Sy0IGYVoEBSxYtAB6AdxiY6/NJJQubw9MpvCH4
         hNIREXmmJ3rA7LqxXfI1zdtpEnoEsr28O89Ypmgwr2oofi06vux7qJpvUgy3KLwxLtSk
         aFR9dK9covUiMeCpdz1xzngCPQek1oA4ML6hpyNwq9IzAu84M4wca+dh18yyJTkYBoXW
         YmFjuP1g7dF0avQ7OHY1C7TRx/px6Aqkkq2ndspXaeRgj7RjJ15w2N06pw/93AtZLsqn
         0Ay41n6CbEC+55iwbYcPXGKfQT88U6CwcVPaBfJ/mL9fnnCE2adGB6T3D5YvxIGe8Vdi
         foIw==
X-Forwarded-Encrypted: i=1; AJvYcCUlyspyxEfPg3EnCdm6oBnUtE2q4a5zD4Ddi7UgjH7lHM114BGEA5IesyRD54W/uZcrvv2eMiKFcQjzY60=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuhk6poJ+CsXa3XRMBxW5s57PowfA7dk3Ir83Yr5i4oEU8TpmD
	9g0z2ERMVsFLa3C3VTwFObDiGgmheATWuAMqSxnhvBaBxwO7uhuaK+H1Xhv0LyKfvovcKA==
X-Google-Smtp-Source: AGHT+IEFxZf59sAxGumU3ly+x8ORDzRN6nAlmqziGiY2+uTgimyQohhxk2gokvD5O/JvjXXGSaNxYudk
X-Received: from pfbhq12.prod.google.com ([2002:a05:6a00:680c:b0:736:ae72:7543])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4653:b0:730:99cb:7c2f
 with SMTP id d2e1a72fcca58-73b6aa3729cmr10639839b3a.6.1744044894191; Mon, 07
 Apr 2025 09:54:54 -0700 (PDT)
Date: Mon,  7 Apr 2025 16:54:35 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407165435.2567898-1-fvdl@google.com>
Subject: [PATCH] mm/cma: report base address of single range correctly
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: gushchin@linux.dev, Frank van der Linden <fvdl@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
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
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/cma.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index b06d5fe73399..46aceeae4c50 100644
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
@@ -724,8 +724,10 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t base,
 	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
 	if (ret)
 		memblock_phys_free(base, size);
-
-	(*res_cma)->nid = nid;
+	else {
+		(*res_cma)->nid = nid;
+		*basep = base;
+	}
 
 	return ret;
 }
-- 
2.49.0.504.g3bcea36a83-goog

