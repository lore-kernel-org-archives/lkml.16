Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5E1DE3BD
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867921; cv=none; b=gaMTqp4WDuU+VginYCbihLb3ZRBJI0A8L5HXhffTWKB7UjALUzGJnr/TAQxZeYvR9w9hlajArItCvJuld6/VjTuJHOkGhkGMJU5h7Z3Y4EWDq4rhSV6IRvAnCp5+theUS0XL08BFqHEfb79sUbRspg/Xhtt7RDykQYcnnRtMhaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867921; c=relaxed/simple;
	bh=cTHHYaOJBnAqdjbNsjGEmmVo11mX4fA0kBs0AHyhlp4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DzFypXkkyWe3buBsf6dttrqJNwPp3CxT4fay+Q7h3lLEyNb2tPTy1ngdubgSIisc41+OhDGQcsq+a6pC9+C1My1kbGVs7maS/Jf5P2S7bx90YZASvpqR0URd4SBcKZ3nZRH/p2coFpWdprmSFCbzrrVoOj5WfCymM/2Ze2rwnVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLPLzzeH; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLPLzzeH"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216750b679eso20321845ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867919; x=1739472719; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HzKNFokGTQRMQwkaxAdlaexKlVOh5cMMgkZKyufFdYg=;
        b=SLPLzzeH9wSC3X4NRaLVK4GTKFCaE8mRKOAVVkCchBHq1K/Rj8dKv7S4fxWh6Pf1uK
         ZUB8RMDTAINb1mo0ihDENr8GAi6iCkXdiMSfcC7wRxtegCB3uEcSALm52XbHt25YS660
         Q78sgAwUu+tbXXvM4CqOElXZdJpFegB2KbjEbPn/aOwvbvUjo/LcAcMq3ZPgZ8hJnlUT
         4rpiJwlAQlAaZZmYvX+7GRL622DShFkr+Hkup4Is3wfj+0pdH6PO6UKAqAjRZxo+DL02
         o4RJQHfOGM4wFdMKCTcvNLc5+XUT9fhJ/eH6A5JkM0HXGC4i+4Hc1ALH2nOJQ1QEHZCx
         oYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867919; x=1739472719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzKNFokGTQRMQwkaxAdlaexKlVOh5cMMgkZKyufFdYg=;
        b=TZ1dfC7j06V+57slpPn30nLBm7rVU0llBlub47pOBQWcOF7Ejzbz456JG4FnjtjlkR
         KJ8/JOcBxTUzc9Pk4gHXdfxSKP6MS4eomg6yiwYy9L6rwqtS8FyyJQebEr+BN2Z70fXU
         CwruEF2/5dMvLgfhgq4dwwDXsFISgXcRRjNelHnIrVPBKJZ9z4vKs54jW3MYcmvzya7c
         30o7aKi+/TVKMA2OotrqsR16YYznGK9aEVD0EUFDPWFkhQMBhhz0jzTc5aL/GQEwAm0k
         e4eakpNrjDRqMwhYqFMQJXiNvQDpWpy2nMikReHHOadrXAIJ2lB5IcaT/oMygerSkWwe
         9Cyg==
X-Forwarded-Encrypted: i=1; AJvYcCUKZFA0SiyY/GjGHbMS9+OTw4XSPIbEiiK+GLeFPKsGwbdJa8bBq0LNNxnN5/ZnC40ULOR+MQv4dChu4EE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3zPqAD6HMyqyVPmOwbFbedIv28hoIksuZkZSYSFSOihHutfF
	zri9vOnAuNdDyHeqKZ14zL6hQnYxbWXGcvkalmmRL9cUFEnC/xxC4lzi/JBtGEoO8/MykQ==
X-Google-Smtp-Source: AGHT+IE7WeCaaWwdtjLGXnFjJ3HV2HveYH8iYSHnW1lYFmfFYzgFw1cgzb7HpN3mgbnk50S1qEYYDK+c
X-Received: from pfblg21.prod.google.com ([2002:a05:6a00:7095:b0:730:46e0:7ad0])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9f8b:b0:1db:c20f:2c4d
 with SMTP id adf61e73a8af0-1ee03a22c01mr874861637.2.1738867918849; Thu, 06
 Feb 2025 10:51:58 -0800 (PST)
Date: Thu,  6 Feb 2025 18:51:06 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-27-fvdl@google.com>
Subject: [PATCH v3 26/28] mm/hugetlb: add hugetlb_cma_only cmdline option
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an option to force hugetlb gigantic pages to be allocated using
CMA only (if hugetlb_cma is enabled). This avoids a fallback to
allocation from the rest of system memory if the CMA allocation
fails. This makes the size of hugetlb_cma a hard upper boundary
for gigantic hugetlb page allocations.

This is useful because, with a large CMA area, the kernel's
unmovable allocations will have less room to work with and it
is undesirable for new hugetlb gigantic page allocations
to be done from that remaining area. It will eat in to the space
available for unmovable allocations, leading to unwanted system
behavior (OOMs because the kernel fails to do unmovable allocations).

So, with this enabled, an administrator can force a hard upper
bound for runtime gigantic page allocations, and have more
predictable system behavior.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 mm/hugetlb.c                                    | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..eb56b251ce10 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1892,6 +1892,13 @@
 			hugepages using the CMA allocator. If enabled, the
 			boot-time allocation of gigantic hugepages is skipped.
 
+	hugetlb_cma_only=
+			[HW,CMA,EARLY] When allocating new HugeTLB pages, only
+			try to allocate from the CMA areas.
+
+			This option does nothing if hugetlb_cma= is not also
+			specified.
+
 	hugetlb_free_vmemmap=
 			[KNL] Requires CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 			enabled.
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 29b3a6e70a53..24a06d6d3617 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -59,6 +59,7 @@ struct hstate hstates[HUGE_MAX_HSTATE];
 static struct cma *hugetlb_cma[MAX_NUMNODES];
 static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
 #endif
+static bool hugetlb_cma_only;
 static unsigned long hugetlb_cma_size __initdata;
 
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
@@ -1510,6 +1511,9 @@ static struct folio *alloc_gigantic_folio(struct hstate *h, gfp_t gfp_mask,
 	}
 #endif
 	if (!folio) {
+		if (hugetlb_cma_only)
+			return NULL;
+
 		folio = folio_alloc_gigantic(order, gfp_mask, nid, nodemask);
 		if (!folio)
 			return NULL;
@@ -4731,6 +4735,9 @@ static __init void hugetlb_parse_params(void)
 
 		hcp->setup(hcp->val);
 	}
+
+	if (!hugetlb_cma_size)
+		hugetlb_cma_only = false;
 }
 
 /*
@@ -7843,6 +7850,13 @@ static int __init cmdline_parse_hugetlb_cma(char *p)
 
 early_param("hugetlb_cma", cmdline_parse_hugetlb_cma);
 
+static int __init cmdline_parse_hugetlb_cma_only(char *p)
+{
+	return kstrtobool(p, &hugetlb_cma_only);
+}
+
+early_param("hugetlb_cma_only", cmdline_parse_hugetlb_cma_only);
+
 void __init hugetlb_cma_reserve(int order)
 {
 	unsigned long size, reserved, per_node;
-- 
2.48.1.502.g6dc24dfdaf-goog

