Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0F1E5710
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190547; cv=none; b=rByZcdZ06Tse4+0MUv7UrEToZigNu15D0Tog9/VJuFQrXwnr7HRu8AJYRLn2wqVBwjFx1f1MDHRqw5N+MulCh0yt2hKubcBIXHp9w7/pVGtQ4HHUbhspfjEkD76qusIZ/Zsdb+7HlzA9uzA13DBinpWF8NED2MGOcat7/VwvaHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190547; c=relaxed/simple;
	bh=KdcYTCg3QXz7nbo5Ffd3SUvOx6WNAhWFlTqAKJmvDvk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sa8wSAIvFoyQQdG02HW/cNpaAdWpCzAVJp9o70dsszDjE9T10TfWjT7cvU1coAzbTiQxsgwpeBDYNRAuC4bEZBIzIqhCAXDLwLYTMIqUxAX+Af9xMEEzei8XdCVxLcMjCozH4FSwdhM1NSy3YhSPkraLAc12QlcJxrvp0/yN814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S3MB79Ne; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S3MB79Ne"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21638389f63so2196645ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190545; x=1738795345; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pO0e6xegNdeyhYt32o5iXhR2JH8dHRA9GoUIxGwwPLE=;
        b=S3MB79NecKq/icNr8RksZrYZTLdc/pExFSpMaVHsLT7PnuaHmqeXULlWcpUSKFWQZc
         0SFbG9W7D4KQYOtgJubb2Hj2ahrLMn1HRYVDFzJncyMj+xUduH1hfhUTwk/aP/2w94TX
         2llgRA0njdEo1cXUcqY6vYizOEJpVoSxnk3F4ebKq++tXBFDrRKbFQ6fuOxZyaETEwfo
         iycet+Tuk7xz3yuwtB0YLQIoSvmvtKz93I7qU4jbmnLWSGxsOdnHtAJt/COyg3Sn6Lsm
         axl7V0Sw6GJDTY6FYaqPH0kbISd6cF04VviBPbKBx6k33wq4K2GBlUWaB1IujqS9+XN8
         62GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190545; x=1738795345;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pO0e6xegNdeyhYt32o5iXhR2JH8dHRA9GoUIxGwwPLE=;
        b=RW5ueE31xyMST0dX2viK5FChPEFSA68iWThwToeXku2eCRZHCNlGlyGM7feQ8NacaN
         4dTotFebUQgLHshlmPdFOzb9hGkj1iEJvFD1/iSLDuljQeZMCf+5zsNokpFWPAdTMFkx
         60OOiRqT5rt7A2qmoL8gt/30yg6zc+2VLZgOs5iUvrkHpxef/2qKS6JH3wssNVrtcHNt
         dvjIPw7+3aa3wgvs5CYuGgQRcY9W0IB7A1/0g3Oes+2dCnebYDHyGq6XF7Kpzskzur/2
         4rQiDCy+zuAjtWqu/Ege4dFMwbjbv7tJwaMLP2gMZIWS3jnDVW5PACosgR2EFk4ABs/d
         Jvtw==
X-Forwarded-Encrypted: i=1; AJvYcCV24S/h+wSDylhc88XCiBQBi7WRzQGBFWr5Om1BIEX4MmcZOi4uabX/J++fM7WCn0032dIQqmUK0QTTU+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Th2xV6/Amm+xPA9tyS2G0c+CgKar5MnqdDt/rpiT8c8mQW6d
	rW4Ry+EqzMtSzn1IKVY54xtayv25NoI8kVhuJS7t1U3tl6mVgzrAOP3G4ALk8xAoXadG1w==
X-Google-Smtp-Source: AGHT+IFwoboaFCPCNze444ZM4fyXAd+gC8WqzGJgwGWoda0w7P4FTxdLEGdWCLzLUoUhT0C9JBl48K6X
X-Received: from pfwz40.prod.google.com ([2002:a05:6a00:1da8:b0:725:df7a:f4e3])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d99:b0:1e1:b8bf:8e80
 with SMTP id adf61e73a8af0-1ed7a6e16f2mr7506593637.41.1738190544972; Wed, 29
 Jan 2025 14:42:24 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:34 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-6-fvdl@google.com>
Subject: [PATCH v2 05/28] mm/hugetlb: fix round-robin bootmem allocation
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
index bc8af09a3105..18d308d5df6d 100644
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
2.48.1.262.g85cc9f2d1e-goog

