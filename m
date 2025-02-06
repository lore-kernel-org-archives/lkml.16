Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C61A23B8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867886; cv=none; b=RODjo4wpR+AwhMIt8jUv29h4AYgi4B6uPi8Rjp4HDwpHkNmxXfGBxEAVD0q9Dp+bMHtljY9fuFMfaa8EoBYoEzKOb3G87fUYM5jRddjB3wIc/1ZoeOEZKZioK9GLq2KljlxZwEX5B+m2cpL0VxB+T/9TmFh4jCIS493hVdRD8Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867886; c=relaxed/simple;
	bh=r7rS1CImG83/jbux0jZKZt0J0v0GE0hzBEm0JLU0NvE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M+qoUWRu+QWUbEY+4yXrxDYj5cHW6IHPnFXojHxuDfiN8mWvEzVxjl7ZZQ2Vn1lTS3HiIYrkq+fBjhNlq8bp1DBUgcogyIU8unFaNB5igu8YBXJcWSHF3rBWg3X352+TSGlEcpG9B5OwqmowukxCRtmLFFDgnjOkUmrJr3LcRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=10Wxy5eb; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="10Wxy5eb"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so2425401a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867884; x=1739472684; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hzoPqdOikoObjXWU9SvKmiO4GzZxuupFnL9M3tsuTWc=;
        b=10Wxy5ebIE6wyRLojkRYOFLc2VDiIAiZ61O8BVckY4YiD1SKcf3xHHQGIIkt4NaSiV
         ch8Wv9+YT0aHoWnlid62GY8HkvEjt3zMqhD0gdUN1wpiRkaTgssv1Q8qMiJfnrz0rkn1
         arXgxydpoBXR8q/zYC07oMIi/SqNaYTQhev52F+3CdNWggLqOXUbHFclJGNpJDtnVruo
         0Fnjv0jqi4HLMjbuCqorbuWDOFnq3nKWOKdb09ZSIunYz7Er0oMKQovof+tvmNEXL3wK
         V2/rLbH6JQ5Xifsi0fzxY/R20mYYz517zydxEhNWPhqOh8lURjyNNmBrXoqZe1KqcM0m
         cKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867884; x=1739472684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzoPqdOikoObjXWU9SvKmiO4GzZxuupFnL9M3tsuTWc=;
        b=EiO1oSQdihWBE36QeVx+R8Ahc9kHKqc6kLh7MEzBWx2h2ZA/qZbZz2z95pFIeineTS
         GwpXwI3G8fQLghra0zFsb00LmKsDUeWHE20BNUStIxCGWzco8Yjpf1DoxRWQn4pnxNjn
         wsqBTZ8x9aOVXYJGrJB2nn4tg20/5q1M/CKsgCyJyMhwCK52g1N3MLYdKecoqKovo1tm
         PP1/4JeB6SvyrQ53v8bN256BfHhW4YahrlLVeqrWHTv1pmdawPbmODsniG/s3JLTwyea
         uXhNEcKNvEJsEG8f2Ydrte9kME3IKU9Uc2cSb6nTm3tALwHtcZmourH39sd84F0zu1SV
         2bfw==
X-Forwarded-Encrypted: i=1; AJvYcCVZl+f1GVRQAbSO20DsDEPAEpYgYyT/iJPSqR7oR4HsJv5byITtC6Mzi3JjVfPjqQ/7wg6Ezq5PwayhXQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTCmIhPrSrRnB2LD8X5xKkFWrufWQO9nk0gx+TmfFrTcQEae9P
	aWesAthRyGu8+Gx+4KFL7qKqeypvokXCx40RetN8IFaZaT/UcBFGIg7v+JxGxJO+8uD2zQ==
X-Google-Smtp-Source: AGHT+IEL2yhkPaKLLzs2ZR25Ntw2PD6TefD2snZgeFGU7MfGyptfuCLCB6W/h56WjY/xARRU7WJJptnX
X-Received: from pjbpl9.prod.google.com ([2002:a17:90b:2689:b0:2ea:aa56:49c])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c0e:b0:2f2:ab09:c256
 with SMTP id 98e67ed59e1d1-2fa243ee52dmr179111a91.33.1738867884627; Thu, 06
 Feb 2025 10:51:24 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:45 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-6-fvdl@google.com>
Subject: [PATCH v3 05/28] mm/hugetlb: fix round-robin bootmem allocation
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>, 
	Zhenguo Yao <yaozhenguo1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Commit b5389086ad7b ("hugetlbfs: extend the definition of hugepages parameter to support node allocation")
changed the NUMA_NO_NODE round-robin allocation behavior in case of a
failure to allocate from one NUMA node. The code originally moved on to
the next node to try again, but now it immediately breaks out of the loop.

Restore the original behavior.

Fixes: b5389086ad7b ("hugetlbfs: extend the definition of hugepages parameter to support node allocation")
Cc: Zhenguo Yao <yaozhenguo1@gmail.com>
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 828ae0080ab5..1d8ec21dc2c2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3156,16 +3156,13 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 		m = memblock_alloc_try_nid_raw(
 				huge_page_size(h), huge_page_size(h),
 				0, MEMBLOCK_ALLOC_ACCESSIBLE, node);
-		/*
-		 * Use the beginning of the huge page to store the
-		 * huge_bootmem_page struct (until gather_bootmem
-		 * puts them into the mem_map).
-		 */
-		if (!m)
-			return 0;
-		goto found;
+		if (m)
+			break;
 	}
 
+	if (!m)
+		return 0;
+
 found:
 
 	/*
@@ -3177,7 +3174,14 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 	 */
 	memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
 		huge_page_size(h) - PAGE_SIZE);
-	/* Put them into a private list first because mem_map is not up yet */
+	/*
+	 * Use the beginning of the huge page to store the
+	 * huge_bootmem_page struct (until gather_bootmem
+	 * puts them into the mem_map).
+	 *
+	 * Put them into a private list first because mem_map
+	 * is not up yet.
+	 */
 	INIT_LIST_HEAD(&m->list);
 	list_add(&m->list, &huge_boot_pages[node]);
 	m->hstate = h;
-- 
2.48.1.502.g6dc24dfdaf-goog

