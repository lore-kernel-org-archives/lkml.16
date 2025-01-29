Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C111F755D
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190579; cv=none; b=DE5KSJZ76fe18J2PwnaEBuEuCVnSiIyzwziNsAsj38swyei5M96N8kUeD0g+zbulEwzLPGFeTD0lIThvbLiJXsiC2BocWVSynGEd23TPR013bm6oSWMkzMZmpek/dn1RU6FK7gYInkvBYwYwumN2Sxu2cslQA9dSs1CLgDyfZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190579; c=relaxed/simple;
	bh=5XwIis+2tn4egFHSvORYEbOh+UDPN61bwvJm+W0mrv4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sicmWxUno5WDVAojAcA4m2lv62YODH2udOAoyy1Y5nck9j/w/kQL9V4JOFMMhnaeIk+Vtn/m6yo3SXtUIxUjLDZYG/ScyXsDkvFaLsMP98BnhIQrG8+iNnrU4OTUa2rAC/cGCEiVOl3wIgj/mI+qRYQchLOOmUwj08PTEiWzPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r7I06XhE; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r7I06XhE"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so221651a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190577; x=1738795377; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nz/2tKPy0YCm5EodMQQ+b1Mhej+Q9ynW9kEvQcn7esU=;
        b=r7I06XhEvdP+qSdS4ySe64dFsEpHwvt9QxKWF6khB4i19HDHnEJB9vbifYp5u5UoM1
         T+xwE+sAxKgUHGP0/nnRLqXudrkDRL18ycQ/74Gqwo89RI0l39pp/JGVrFHLKGJa5Sza
         wefVn+/2Dh0X7ut1oNSIzbbCsaxGourgTgZhvnFnGBhI2+DbKa10bR8yC3R35c3kkRqO
         3gWslDL7pj9CWsvARrs5YsznraGMto0eEGhHsAZIy8O/8Tr95i9WACvGD/d56rU/KjMM
         sFnXYqoEdb34mEclOHA/gfUaDEtSR8V6q6rScjztIBngB57O+WB8XckoLjVs/KMDV6u4
         At0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190577; x=1738795377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nz/2tKPy0YCm5EodMQQ+b1Mhej+Q9ynW9kEvQcn7esU=;
        b=gD0UlZZ8KyKTWpyME1BFXyznPVu/y2KjSlKJ3E4N4bRZkMM3Rp8kvW2Cb5EB4NRsmv
         msRqARZ8GbCooeaeayDNmyVjQJ37Lc7N1iWLN73Hjkmv0JGT1A2WHuTIrurKmBKZmsrb
         ZvhVhPygqHct5rZ4xTFEud9Q0zq+iyD3R78o3++HvHNrjcfSPll05h5pMtpGSsQGz5m+
         yZEGD2u08IbrnqJY85tsCqO4yOfJrYW3g+HI6whrsDSo43YZAIjPK0OqOIcko9h2JJom
         CoXjn8q4wznV7wTvTs2MZgkE/YiLT3yJVOvhGKTECYu2zv4g4vnUWpDjdk8F0l/HecP5
         aN7g==
X-Forwarded-Encrypted: i=1; AJvYcCU3vL20cQcXeL8x3LGFW9qqKXYFs6AIaUnxRrY+omDMo14Jh8649R/3NIzNOZ5D9fS2lmajQSzf14wx758=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfnn40l/I69rxeB1zA5L6vWm9ayTBQlVSp63q6IDRYX0KKveix
	PCcsrvlDax3oXEfJaX2YXhkPIEvyBV6uhzZhsDL8ktnTuQO4QbCtDvR/FlbndlhOGdGR2A==
X-Google-Smtp-Source: AGHT+IGXUZD7q/hJ2fVVwgnyF88t+mgr40dGpUsg8S5E9Rm1s3dTi62LjPOI+SAicO9GvtyTUPW1WmMG
X-Received: from pfbcw17.prod.google.com ([2002:a05:6a00:4511:b0:725:cd3b:3256])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b8b:b0:72d:35ed:214b
 with SMTP id d2e1a72fcca58-72fd0c8bfb4mr7028832b3a.24.1738190577253; Wed, 29
 Jan 2025 14:42:57 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:55 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-27-fvdl@google.com>
Subject: [PATCH v2 26/28] mm/hugetlb: add hugetlb_cma_only cmdline option
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
index 5af544960052..c227d0b9cf1e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -60,6 +60,7 @@ struct hstate hstates[HUGE_MAX_HSTATE];
 static struct cma *hugetlb_cma[MAX_NUMNODES];
 static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdata;
 #endif
+static bool hugetlb_cma_only;
 static unsigned long hugetlb_cma_size __initdata;
 
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
@@ -1511,6 +1512,9 @@ static struct folio *alloc_gigantic_folio(struct hstate *h, gfp_t gfp_mask,
 	}
 #endif
 	if (!folio) {
+		if (hugetlb_cma_only)
+			return NULL;
+
 		folio = folio_alloc_gigantic(order, gfp_mask, nid, nodemask);
 		if (!folio)
 			return NULL;
@@ -4732,6 +4736,9 @@ static __init void hugetlb_parse_params(void)
 
 		hcp->setup(hcp->val);
 	}
+
+	if (!hugetlb_cma_size)
+		hugetlb_cma_only = false;
 }
 
 /*
@@ -7844,6 +7851,13 @@ static int __init cmdline_parse_hugetlb_cma(char *p)
 
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
2.48.1.262.g85cc9f2d1e-goog

