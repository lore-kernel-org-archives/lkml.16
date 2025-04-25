Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8DD2356BF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569054; cv=none; b=uu6bn4LnZuv2mn07TeRS/Ue3EhHDoiseLXLUzjRb1qGb+5Y+RoaZKY32/L5rRAC44fOfzQBL0ujT4tZ+D4/Xz7gurL9q10Bj9N6+RPENOD1FdR+SwCzzlawXDyJQRsOq+lJToGqILsssY1/PMjJ9D6yX6z2nB+wAhOY0Y7SxCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569054; c=relaxed/simple;
	bh=aaP6QqhYpZD4s+rCaOs9ONDddbsXPil+JXi88ox7lvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osV4WP0kcWU0oYcAcxLziuQNqco6FibvG9YhJlVJut48/PDXzrV60a9c/KLXd+WkJSP6j/9WNn737IaK+jIeJKJutT27eX1yk+I9OuK0zrQMWfGqubmeUC90GGD89Cl66oq4xPQ0/pRstpoLefDbJwLhLIOdSZQSCcRmKLrCq9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7/VI8/2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7/VI8/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745569051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uu4FlIS5Nl76bZjUZyw21YomTVSJoQk7KVvTvA60Mww=;
	b=f7/VI8/2VtCIb2jiXRmDsB5JpjZdsyghWnZ/otq3wphy3/uBjXFNo+Ox1ysbSmv4iXGY3H
	VpDUB6w7eWwRIrh36MAdblqJqOAi/LszDdMO0zy+OKCJukcTof8Qk54K+sSedP6HbqPZsm
	GZJxMRZGD+Memq2hrOXoeKqIPo/Qx2I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-ZA2Y499DM0Kvl7U1NK2D2A-1; Fri, 25 Apr 2025 04:17:29 -0400
X-MC-Unique: ZA2Y499DM0Kvl7U1NK2D2A-1
X-Mimecast-MFC-AGG-ID: ZA2Y499DM0Kvl7U1NK2D2A_1745569048
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43f405810b4so9965815e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569048; x=1746173848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uu4FlIS5Nl76bZjUZyw21YomTVSJoQk7KVvTvA60Mww=;
        b=dVj2WlXJB3wOqXranjUODJSjXHUFUiD1/deZPTtcJCFF8ncn4mevuVU2v5S11/epSU
         weiQXNhgN46fLk9mgI7xzhy1G87xb3h+A2uVNIL4e8/jJoYMlT3xQLoTQZf0R6D51N6s
         +ua/YlpX10cJjXjgaoEk/qDBCGVXxXiF7DPdBWJF5JreAfvHzAn06GCaOnr5QaqksH8r
         AK50SCpVauldP3MEbJoMLgfGwFdldUQsTKqgoE6NnqubFv2254igHwykSLrVNHX39SSu
         zy9RgCo5UBceZVKSqkvv12TauHk3KjQOPVkz7ucmsTTMRuigL0eLifnnbZTq84mron0S
         e8ww==
X-Gm-Message-State: AOJu0Yzv1JgwudAw3grl2lmOW3gZwTlU02sAMUNSfOsVdGl7PXv4Ii9c
	/pBB5qtwNgydts3xPY+MpdE1ooIroGdVSm/9EPxdT6nP7eQ5H6BQi+tva+JcAb5xtlzIAPXFQy9
	D7+DwY3Rm8qnBfq+/lmVRV1JmVoX/7Ry7asUgkssQEyV631iQOWO6KdZEp6FFAjZmcml3iMRcAd
	T+8o++a7aBceNx2FwOKBwYOc+X6iiapfBY8a+IAnyGgw==
X-Gm-Gg: ASbGncsorYPE5nLvUuS6lhdZrqoliCzpHbCtn3Cf+YvwjlNLmMjgOF9Fndrmrnh6P8L
	/zoZc944cZv06+5yBuXOtOCz9b0MacO/cWpxLU5LhMEUBQVNF5ok6m/uUfsHBwdXDZ09igo/t4o
	EUgJQm9tMaF4vxNlZNjm8HfGYW4Da/l9Ctp1FGeAjVWZGlipOdSzOVdBJKHrLDhb4fx+/4kIm6x
	uNtCfai5Ei2euKsvRySY65BO8eTGwxCjuB5jPDvwqVCq2F2eEhMUMcXTJohPPQCQot51kzp2YDw
	c+5cp1G2Yo8t1Qc5vIhfdEy54mWr4GVEGV05pFp8jQS9LzmEJCPiWb4ym7Ome+pIT0I4ujQ=
X-Received: by 2002:a05:600c:1387:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-440a65d8120mr8181575e9.11.1745569048319;
        Fri, 25 Apr 2025 01:17:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv6bx4rw9BX60sw1RHVhWJrGaS8iH8UMCeEA8nv3vLsrOwHOvFftOe6l4h5umdYWufDrsURA==
X-Received: by 2002:a05:600c:1387:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-440a65d8120mr8181055e9.11.1745569047938;
        Fri, 25 Apr 2025 01:17:27 -0700 (PDT)
Received: from localhost (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d2a1dc3sm47748735e9.13.2025.04.25.01.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:17:27 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 04/11] mm/memremap: convert to pfnmap_track() + pfnmap_untrack()
Date: Fri, 25 Apr 2025 10:17:08 +0200
Message-ID: <20250425081715.1341199-5-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's use the new, cleaner interface.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memremap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 2aebc1b192da9..c417c843e9b1f 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 	}
 	mem_hotplug_done();
 
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
+	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 	pgmap_array_delete(range);
 }
 
@@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (nid < 0)
 		nid = numa_mem_id();
 
-	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
-			range_len(range));
+	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),
+			     &params->pgprot);
 	if (error)
 		goto err_pfn_remap;
 
@@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (!is_private)
 		kasan_remove_zero_shadow(__va(range->start), range_len(range));
 err_kasan:
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
+	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 err_pfn_remap:
 	pgmap_array_delete(range);
 	return error;
-- 
2.49.0

