Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949141A5B94
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867890; cv=none; b=MmrrQntHxpacXVDdY8sQU9HAC1duRczgJCbuarWAHZoVL8ORJB0UaiZvllDb7R+BOOVXQic05+sdb12Fo+RhmJDPaPlekOscnRIoxKmTgBzrro8wEvjs8GmkrKUvPbKukmweJFO9esh2Wfee78h+hEF0Og4bOqogLZ7RKR9NOMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867890; c=relaxed/simple;
	bh=cfOUOmXD1/WjBlCaesJi7AOw5xOycmilUh7uKfCe/wY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HJWccXoULU479Jb7OuozZ3n5bVoYV2eCvF74RlM9TT/suiU5WlFuHgnHJH6wBQHHELC/SNI2XUFdSXQ23xLYIMvSJknrSqaD9pCPKNuEOaOHVjisLTbZA3RjgGBnR24vXJ1r6mSCmNITfQcnEBX9+ZanjROWoz7W4iWB9A5l3zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Tf/eIGU; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Tf/eIGU"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa0204ad21so2418143a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867888; x=1739472688; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6PxACdTioptMBNslx7g+3VfoPnhQJsGOs8ZAh4yAkb8=;
        b=0Tf/eIGU+SYMgEAnNewFayOMwTOImjc7ETHzO5fSMppNnarJkj8Q8J43oaB+DBRjVr
         O0B7mAamEy2LTD3pjpgVhQsZgQvyoHhzod1gxEqQiEi02m7XlmnnkWL50vC5lma5Xt5q
         qM1fHz/gd1+YFp3y/8O1ONPgWuwFZx3kMkgS7vqV3c0XmsCmY7LUr8oxEBL8eq13RokC
         yBEFdUsaF0tiP7+G+snLhBCi9fCvSdiRru0N4SnnNj5bi01XysgWSqRYbfbwlvjHFNnW
         qTgnJ8HgrwG2Q9UvGfGA+VEtdTAhwOBbLbT57xA7Zm0OtVZztFEXeuhNncl8qkYCD+oI
         yzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867888; x=1739472688;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PxACdTioptMBNslx7g+3VfoPnhQJsGOs8ZAh4yAkb8=;
        b=UobzghYiuHxcAMfv79aav2vfDLuKBBepd+K9rYoWNzV0EOhkFaxASiVeDpYq9lGdKv
         uR57ImGxGXgOM4TNpIl0QAdcRdyKgJ4urPdrxBvs1QLoU+JWxWCfcDywssSO6EeW78TU
         9LDg7VfLB7F6oLACYxsppN5O7yFKaLVImAXU2XHdQVbsvjTkWlIeqDqgaMEzMB4UkCok
         /ox/OB67GlQNw+y6t7nrN0NdbjQ5mAXoCarwbJq560isS5Vqym3XQJ2qa5L55qLKaEa/
         ar6ogHwdTyJzx72pxB0nsEDcPCSLAtm4gP18wPIwFl9yWXoQhxaQr+d3zXXHtAMuI5xh
         6Kzw==
X-Forwarded-Encrypted: i=1; AJvYcCUXe2nZx9e8OLD3duFmkmkx12cSLuGWv4zVBkXE4CggXUhWjP1hni6DZNrUqkOdg6CKmQ19AS6kmb3YFTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXWIyxpTANNXWUFSIp7epCtxLFnmsLXF0nNyTr5qMYIbCbV93m
	VlX9nQuXOSfYn+7HxC15fnkISz/Ss8Rx/8hyB2N466sfmPZrQAccHQQvDG5TWwNQ5XU0vA==
X-Google-Smtp-Source: AGHT+IHyKxzmRP4eOhwx4mD9ZcZrcL1FTQwwbx+QtNyhga2EwWZzDYY9rIMSfx1FziNod6CZsidSIYk3
X-Received: from pjbpq3.prod.google.com ([2002:a17:90b:3d83:b0:2ef:701e:21c1])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a86:b0:2f9:c144:9d13
 with SMTP id 98e67ed59e1d1-2fa242e5dc0mr174642a91.24.1738867887870; Thu, 06
 Feb 2025 10:51:27 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:47 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-8-fvdl@google.com>
Subject: [PATCH v3 07/28] mm/hugetlb: use online nodes for bootmem allocation
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Later commits will move hugetlb bootmem allocation to earlier
in init, when N_MEMORY has not yet been set on nodes. Use
online nodes instead. At most, this wastes just a few cycles
once during boot (and most likely none).

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0836e3231774..b4de3bbd010d 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3152,7 +3152,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 		goto found;
 	}
 	/* allocate from next node when distributing huge pages */
-	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node, &node_states[N_MEMORY]) {
+	for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node, &node_states[N_ONLINE]) {
 		m = memblock_alloc_try_nid_raw(
 				huge_page_size(h), huge_page_size(h),
 				0, MEMBLOCK_ALLOC_ACCESSIBLE, node);
@@ -4550,8 +4550,8 @@ void __init hugetlb_add_hstate(unsigned int order)
 	for (i = 0; i < MAX_NUMNODES; ++i)
 		INIT_LIST_HEAD(&h->hugepage_freelists[i]);
 	INIT_LIST_HEAD(&h->hugepage_activelist);
-	h->next_nid_to_alloc = first_memory_node;
-	h->next_nid_to_free = first_memory_node;
+	h->next_nid_to_alloc = first_online_node;
+	h->next_nid_to_free = first_online_node;
 	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
 					huge_page_size(h)/SZ_1K);
 
-- 
2.48.1.502.g6dc24dfdaf-goog

