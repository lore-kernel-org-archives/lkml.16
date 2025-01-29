Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63EF1AF0D0
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190550; cv=none; b=rS5nZq1e2JijKuA4t+loHJ9vTnEhJaWVr9DZiyHgCOwn96nQvPole4Q3qc+uwgUKWRywhg8U7n7jgHl8garzS2MqiEjxccJ+GL0BUk6aJ7YkX98IhvpO5HOLjEQadv5mNm2LrWpfEYNP7TXHhTdk5Gn3x5BV0o5DaGQqHPmAu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190550; c=relaxed/simple;
	bh=WiR1eqhOiClwJ0UZlwjHo0TqFZ4FOdPtQ5vRV8aDy9k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mfftfE6PPY78GIkopC6XcKy6KSAjRaUHi4iLi4cey3brXgPedeoQo7dzVhDHeifeR16k0g2N4AJ5TW86XfgnF13W1/O4LNkG4ETzx2yO1wDRXRjzeHoZZ3A09SpPUFMFsO88w2Fii6VUdLNKxY5E1mvHfg7em9I8FuzGyF0Dkkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qv7nCl9+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qv7nCl9+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so229533a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190548; x=1738795348; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwa6fsXZRK5gAo5OnSYVBrwDMxNqaUw9sa9Xi3hrPeg=;
        b=qv7nCl9+Ncg7wMfYc8mDXMTPy8oTJ3Yh1mMVjNK22dCHTBK7N5mrq9nvavJ9IKlnje
         nVP3BmlvtBzDol2SD93j6QQURgsMR4SimcpbRvuB/Gh7iwHKw7JoSIyh6JL3kseKuX4q
         TyKRwvWLXojU5R8kMR9yWoPvx8UykdSyGYRbXX0TFIIdW2PT/nDVgDEKxmVzUnMYDa0Y
         hlKwwUEIHVA2GRJ5jz8VS5n2JfrZj+pf4aTYOIgc1vuv7lZF3fq5FDbS2arwufkSENLT
         I+l3zfvJeL0K4Vcy6cGNpthXpxREjB/hf9smpcY1f/vAlRUdHtthVzDbAZCqcuQa1f7G
         fpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190548; x=1738795348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwa6fsXZRK5gAo5OnSYVBrwDMxNqaUw9sa9Xi3hrPeg=;
        b=wxbTlrfa4qQKNQ9gOzd696IJdP6bTb9FNQ5W5ChmUAzABbkPmmGgS/KnW68iaYYrzm
         46L7dqgF4KWjzPTbwmyb7HGlEGFiTQReNnJ4N8s1E6s/0EH2D9F3md9aSllHYxfg8Ysm
         mUR3Mv7cf+NRFnkmKfVc+JIBy9bng8UGEtQRMunxPfTNHwI8bQ1LjJlXS7bByQtxv24d
         k68YUVPGQyyEd7K5pi2ibvKM1rwMsYYVMXB8n1jjI+Nb0N1vfqe7ueVeddRyQljQn6ny
         GBXjr7+afa+qkXZ7gseoyx9yoqKEjR43cwYtTAzaDUCeRkyrnv1NZBg5M8vxan/OD9N/
         mVjg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ4dmImTfMvZgZt2SvcP1WnktwbFX23P17lktCynyD4HT1k6xlk7Wb409h/dsSnslCRgyL+VTaLK8oxEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWd2JzxO8XfRtsY21OqnvhsHSYXTqfPMc8lWfQ9uRTKjtdVr7b
	tvhw8qqY3bpmR+iyj6lZaSSuhYlRs0/zrNjauASlWnTu2YLtqD8s00UJrAlmYqkOAFLnUw==
X-Google-Smtp-Source: AGHT+IF59vnW7g2LrX0k3OPFChcYieeAbAKwK+MeTYrxX422BkPNegPy+HquNkgn402HeoagQo0/5oe0
X-Received: from pfbcn10.prod.google.com ([2002:a05:6a00:340a:b0:728:e76c:253f])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e88:b0:725:df1a:288
 with SMTP id d2e1a72fcca58-72fd0c74f49mr8427084b3a.24.1738190548297; Wed, 29
 Jan 2025 14:42:28 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:36 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-8-fvdl@google.com>
Subject: [PATCH v2 07/28] mm/hugetlb: use online nodes for bootmem allocation
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
index 196359254cfb..20d54eaf2bad 100644
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
2.48.1.262.g85cc9f2d1e-goog

