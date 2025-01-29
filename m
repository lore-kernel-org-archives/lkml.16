Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB451EF0A1
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190564; cv=none; b=RuNhXVbrWVF6yqOziLTcNeT7mSnfdJVBRzM5rlw9Kjam9JnEaWXGKPj3wWdsFbkqFwhCbJWmCpe/TCN1d5Mq8+vyd4CBShMTXbJoZJXfnXaCRwvJADRkBj/V6S54Eu5xj9fT2X0mWCZ/aaOqhDsNNlBKBIhkZXMmNZPwmaF5SiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190564; c=relaxed/simple;
	bh=eHCG7WY67UGKYrY44Wy7HHVBJHdyer2l/4x7EPtb/Sc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qai+a989OmV4uz4VSCj2OtE/Fxqcl9ywZSFLUdAcWbhDCj04H4ZX8FZ0MAYyPygz4AU1wBr2h9KdHfJ7t1ioWGZ5+So9sz1YHC0Zd4q9B/UhS0NQyQ784JB9oT7GbZIfP3u+y3l38zTZ0GmMSg0xUyczd6VcliczNV4Z+aq/5Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=usReCv4Q; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="usReCv4Q"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so218745a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190562; x=1738795362; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CyhHbVHq5bo9c6pVj60jCqfagJdD0XsxqtGn3cmahY=;
        b=usReCv4Q3jIUBX7wsnCiROnSOR29dJ6XOFH7wLoXQMh1Wy7qmcl1+qROYfrcIK535c
         FOt+EElpX6N/vjMG5xGvrBqV4qy85XabgzhFzIBTBNAm8DF8duML9yMe4+tkZz3bgscH
         6ySMn5acPCELQWQwD56EsFTXDkQxerBvbLPZ80lMuWmmev5r+jbfwJ/pY2I4a6+vgjXj
         b5skCTvk9WZ443nPha/Zg1s6kjqEEtabRubffEy+a4kRWV56D/RkYMVnFjugrrdDQ2F5
         UzIX6AWHy1duw9vuJcqP3vR5OQ/QCYMB6QMSN5ZP+N51h9oqk80XOfPgacJ1EPsoQqeC
         qwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190562; x=1738795362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CyhHbVHq5bo9c6pVj60jCqfagJdD0XsxqtGn3cmahY=;
        b=pIezIQxaNSpJrlnXCds7lzRjrE3c1XavROBJUxeuCbB7J0t37PAHu3L+dUEpPa5/oT
         fUSDNBeMMqgXQgnEB2aVzldGw4VqpL4yEe2AcyzVpqdlmp6K50ItrL7hfuY32RueDZQL
         ZFsXHBiOlKcnG/9aOFyfTfNh5waz0ce14v8wF4isU9t8DL53APCNVuUOqdmJuDjUk4Uw
         5F3I5oF+Nitnf3XTj9sIPyV3ptK9uEZx4J1IJ8CoaAQ4NwBJH0FuN0WTSAd+yMufqPMZ
         b+KyFo+VcCuwhVtn0spYcgaUXFOhp8CGXYqEEStSuFYFnGw0B85VsfEggMIb5AR5N2ZJ
         OHDw==
X-Forwarded-Encrypted: i=1; AJvYcCU71TUBrc8jhW48OlxJGl2R/2HxQUQXRt3/EYobORv0pk/EYujbo85acKmFu0Z4N2aIr13PD8QbkDyi0XE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxyy979mSVMykHBkf0o+fOPmqrzAd0PcBktazwd/UhJ/nSi8Or
	3mLoX6N4b7932AUVKrl//Gu9xAtiJN9BLvgiqIPMT5QgSl963xGISqcqA9tGWhPN+ELgLg==
X-Google-Smtp-Source: AGHT+IE89jnX+A7X0+O3NBJ62H6UTgZMQLLOdEOYxcL1kGIfjMQLQgaW2k8akmMH2SlD3zsDkP21quJB
X-Received: from pjbpa2.prod.google.com ([2002:a17:90b:2642:b0:2f4:3ea1:9033])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8c:b0:2ee:94d1:7a89
 with SMTP id 98e67ed59e1d1-2f83ab8c371mr6910663a91.1.1738190562213; Wed, 29
 Jan 2025 14:42:42 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:45 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-17-fvdl@google.com>
Subject: [PATCH v2 16/28] mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc
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
index a0a87d1a8569..0a27659d9290 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4911,16 +4911,28 @@ static int __init default_hugepagesz_setup(char *s)
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
2.48.1.262.g85cc9f2d1e-goog

