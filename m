Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB7D1D5CFF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867904; cv=none; b=ZqFCc2aZxyx7gSHcA6iYY2IndxsRU2IFAeIsHt5cjmjrh8RJTVI1D9OxLQ/mhw3q+XC8Oz1N9amf+Xsbeb4dfMHpmKzg4vdDpKeQ9qH/7MlUk52hDuqJzMyrgp1qhAxHwlmhxBgVV6p6WHKKZHKeiWdUkehAqlTxScCPTaTdedE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867904; c=relaxed/simple;
	bh=1ct3sIUPt+ZB93pfiPlURgrSlIRtYGQITJSe17cwDHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MbWz1XYBW17xVSJq9tGunXKmawXgAbzjzzIKptNxFIbaDAmohoCrLWfScTjQ2bf4g7XQLiPn24+WJ6LAZcEBMjUjNloNUEQQddqJ5atSK9hR/rllIaSlh9DK3E0bu/mb8bTb1E9I/+bX7mG6x6TXgxCyJdsJrTkOa35KMEjRJpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J9nZji6r; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J9nZji6r"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21f444af89fso8580555ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867902; x=1739472702; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYCnhKfOpNHoXGLJGoUQUcx2tHg42NkQx3e7q6fph54=;
        b=J9nZji6rtpBxevbaBhFzjM4Ajcl0yPDlU37mCh59fFACCv66KFZQDM1O5mOAub2N44
         b4Zm5ROpivxMD/Vb9qW52vp7+snzHOjxmU2yp7PZ4zL0hsgc49PlPaDG5H/mFg5R2JKt
         SuNnxewqortiKBzqucPTCY5GYTrYCQj9Pl5d/dXG480sHHtmUU8uwYL0HiG9hV8E75ug
         32qynmTy1tW0gPwx8gj09h0AeHLCt9sawNjycrKI4d5IdhbDAmSqrfVwIo+j2nLTDODK
         XHiPyHvcMVhlH+fucbo0MfwIQxvV6lGT+UHb9QaP3l0ghk4S+yXDqoFnvWofaRuH5IC9
         Q2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867902; x=1739472702;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HYCnhKfOpNHoXGLJGoUQUcx2tHg42NkQx3e7q6fph54=;
        b=EvAeJkwczkq21UPsEICimjscj0A4eIxiCFUIaArxK0O8eRzx1MVceQHwaBFBnzw6LY
         EknJ6y5HJVg77qD0BkmB/u4QWhJ2PZHdxE3gIHFF7ZBSfF3X15jeeGZUo3dOd90Ikqkf
         YowmVatZQJbNVVP6dxEcLxvLf9/iA0WMN6t/P4PKlZAMYM37a6c58GT1jmFYiQF2MTd/
         bA7wyOq1dr8uVUYch+DEdrZvhuNvmIvsYY+FbwASLCzN0xK7+cIjvBw8ALeVrBa7phej
         SIDvKXzsVuGE0mlzHa+U4q6WVydaGiGEJRWg7cBwu0Ea/ei9Fq2fo2kgiKNUqb3Mq8XW
         u7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIr6AZGJoRRjg/wGU0f/RzF7Pn3blFHHMXFY5TCBqZmQyPMYEPnCy1V2/mQD/sAkQ/Ob7GtoDqrVZw2D8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh6rAahfX/kgnfTgnKj9WWslpAEYhJdWVtg4lcaXrGrFKeGRbD
	06vq5q1ZccHQJKzhP98tVL+oMJTRzJrQSZyuBUcrl7qL9kl986BFBPcRpwU6D6aNRWJXEw==
X-Google-Smtp-Source: AGHT+IGOwjdyUKmu33OfICAjkR5uTyQ60fkGxL3DuN6UZt1dw+rarr7Qj2spOWMme9SCtmLchvIHmNez
X-Received: from pgbfq6.prod.google.com ([2002:a05:6a02:2986:b0:ad0:f8ff:b90d])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d70a:b0:1e0:dcc5:164d
 with SMTP id adf61e73a8af0-1ee03a21ca9mr898719637.8.1738867902197; Thu, 06
 Feb 2025 10:51:42 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:56 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-17-fvdl@google.com>
Subject: [PATCH v3 16/28] mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Architectures that want pre-HVO of hugetlb vmemmap pages
will need to call hugetlb_bootmem_alloc from an earlier
spot in boot (before sparse_init). To facilitate some
architectures doing this, protect hugetlb_bootmem_alloc
against multiple calls.

Also provide a helper function to check if it's been called,
so that the early HVO code, to be added later, can see if there
is anything to do.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 include/linux/hugetlb.h |  6 ++++++
 mm/hugetlb.c            | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 9cd7c9dacb88..5061279e5f73 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -175,6 +175,7 @@ extern int sysctl_hugetlb_shm_group;
 extern struct list_head huge_boot_pages[MAX_NUMNODES];
 
 void hugetlb_bootmem_alloc(void);
+bool hugetlb_bootmem_allocated(void);
 
 /* arch callbacks */
 
@@ -1256,6 +1257,11 @@ static inline bool hugetlbfs_pagecache_present(
 static inline void hugetlb_bootmem_alloc(void)
 {
 }
+
+static inline bool hugetlb_bootmem_allocated(void)
+{
+	return false;
+}
 #endif	/* CONFIG_HUGETLB_PAGE */
 
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 789341158ef6..3db980db15ec 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4910,16 +4910,28 @@ static int __init default_hugepagesz_setup(char *s)
 }
 hugetlb_early_param("default_hugepagesz", default_hugepagesz_setup);
 
+static bool __hugetlb_bootmem_allocated __initdata;
+
+bool __init hugetlb_bootmem_allocated(void)
+{
+	return __hugetlb_bootmem_allocated;
+}
+
 void __init hugetlb_bootmem_alloc(void)
 {
 	struct hstate *h;
 
+	if (__hugetlb_bootmem_allocated)
+		return;
+
 	hugetlb_parse_params();
 
 	for_each_hstate(h) {
 		if (hstate_is_gigantic(h))
 			hugetlb_hstate_alloc_pages(h);
 	}
+
+	__hugetlb_bootmem_allocated = true;
 }
 
 static unsigned int allowed_mems_nr(struct hstate *h)
-- 
2.48.1.502.g6dc24dfdaf-goog

