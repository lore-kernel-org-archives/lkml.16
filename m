Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6D2E8E1D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750446236; cv=none; b=qHCG8/VNtf0Js2mLFLIENLU2al3zAbsMRgeYjRayWea7a5/xmgFrwLMQeQY78vSexixq8ln8nVcvhfYzVBIksiJ8y286u7BSkA0qO2EKeXvHIDtCvGFNZ1YprUbJdIL4RsY7Bmyvb0qiLtvKNdIV8oaLnutbQ78KijlX9dyWjRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750446236; c=relaxed/simple;
	bh=kckZUmeRwbXeBBm5rBOa1jsS0DEHUnC6XuHkwJPsrIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZ1hG4rGzJWWhzsdVaen8K2Fb1y+Tdo1Psmq6W040oUQ23iBJC3qfJlyQrm7jX1fohTnL5LZjxMam3A5DlkicMyOb69zoX+N3uJrqHHicCi1cPPtfoLcxVpHbOS+pUBfPIek+P1uUdaNTtzIpwnKfZQpIGxNRRPc1y38EF8Fkis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BkoojT98; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BkoojT98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750446233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/uUmIIKaxQEfWKnIn4c6AHy8NnxzF1D+uAlq9OPV6E=;
	b=BkoojT98qpugEYo6k0Q4zMCCSgZT4GeXKI+e2F/9LyRGjfM2CBjAh6tsvtR92XZHag1/9h
	QsroZruvje8YziIx6DNAE/9Agtnq0ETBUVE4NPBzMtlhm1+r1qsLD1UT7d7LM1joMKbbbP
	Z3HT2Fa0R1rdive0RpGaXkk0qiLo/2s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-wdWUYb3AMOCGE1xjeV40lQ-1; Fri, 20 Jun 2025 15:03:52 -0400
X-MC-Unique: wdWUYb3AMOCGE1xjeV40lQ-1
X-Mimecast-MFC-AGG-ID: wdWUYb3AMOCGE1xjeV40lQ_1750446231
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-236725af87fso25732975ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446231; x=1751051031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/uUmIIKaxQEfWKnIn4c6AHy8NnxzF1D+uAlq9OPV6E=;
        b=TNkEje0FJy6fO6T/9NvyajGZsQ0PrRVtbzMUBlPj21Bi3mwgRoorJZt5g7b79neZlz
         CHc77L8zZeB/3jeN4eshy68FjmdPWPS6uKXEkruiTKkcCulZbTB9OiYtOSn9/SALzuNj
         yIEqCX0mUn1DsENogmhLqtQ/m3cF9pp45U24ZsGCMu4A6/oC/P/ONchnNnUSwX3WKsJf
         rdyuTiy+DOLHgySajntoT4jf9JumNWv149XmIrOX1zRbLbkiPHsGtIq+kF+InVbXfuWN
         6PH+GiS/6QsinqL1ap6gDUrgK3C8l5XYpv57yed94cHm55aR1kpWHAFV3OT8/CvAZ09s
         UXzw==
X-Forwarded-Encrypted: i=1; AJvYcCWAfBJ+U8rKAq0mtoi30HeR0lwkjLO1nqzg8SVwmfpvCxICEwWn5jYe3NEzau9FwtPADf/tooEpj7ur1sU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy22aoLeIXMmVdGLCfUlG5IPYZJYAIUUxDj8FfROqyAxus/r5CW
	cL+Y1fN9o6dp8iy6i/1tvASsWdRFvTxO745PkK1kRWrvpSoG5X8eeD4fYj8jauwS/Q9NuwWwE9a
	dNbk6AE56asRHAKPjtbMcehHPJrpwOZ75q/9e6P2k+K7Zt1Eiwk7G+RHlw/6G8A+YFg==
X-Gm-Gg: ASbGnctb2+c+55MqALdkOfTSxjh8lOGKYjykuKsFS7BzdNx+Bf3LmLQuLjr9QLAxtma
	Ypiwo9PjmYclZ+QLHj4diHYqqRYhqq7SO1J24zE2oUatibbV0NMd6EdNS/AwjMGPvl0ykzlUBFx
	XvXWTr2esT/f8MkDSX3QSFnpFyRzvQx1UhZW+OsA8SnhvRJJ3HErntCfd3NLw3iyHlGr9FOk8OB
	AYbFrpFs5sMZe+bdDGnrbXMd1sDKseWYn5ogZN+MifykVxIGJYENeYYl/2q+RfHGaatbegI76XW
	Yiy/BxosPtI=
X-Received: by 2002:a17:902:ce03:b0:234:a139:1208 with SMTP id d9443c01a7336-237d972e274mr70968745ad.16.1750446231089;
        Fri, 20 Jun 2025 12:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu8J6Sq7bshzIqQ3TEXmd3Fhe1gqUM/uJN6VB90LrZm8iK8bS2G/SbAjodZmsNkHbCelLp/g==
X-Received: by 2002:a17:902:ce03:b0:234:a139:1208 with SMTP id d9443c01a7336-237d972e274mr70968235ad.16.1750446230682;
        Fri, 20 Jun 2025 12:03:50 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8609968sm24235535ad.136.2025.06.20.12.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:03:50 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
	peterx@redhat.com,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH 1/4] mm: Introduce vm_uffd_ops API
Date: Fri, 20 Jun 2025 15:03:39 -0400
Message-ID: <20250620190342.1780170-2-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620190342.1780170-1-peterx@redhat.com>
References: <20250620190342.1780170-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a generic userfaultfd API for vm_operations_struct, so that one
vma, especially when as a module, can support userfaults without modifying
the core files.  More importantly, when the module can be compiled out of
the kernel.

So, instead of having core mm referencing modules that may not ever exist,
we need to have modules opt-in on core mm hooks instead.

After this API applied, if a module wants to support userfaultfd, the
module should only need to touch its own file and properly define
vm_uffd_ops, instead of changing anything in core mm.

Note that such API will not work for anonymous. Core mm will process
anonymous memory separately for userfault operations like before.

This patch only introduces the API alone so that we can start to move
existing users over but without breaking them.

Currently the uffd_copy() API is almost designed to be the simplistic with
minimum mm changes to move over to the API.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/mm.h            | 71 +++++++++++++++++++++++++++++++++++
 include/linux/userfaultfd_k.h | 12 ------
 2 files changed, 71 insertions(+), 12 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 98a606908307..8dfd83f01d3d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -576,6 +576,70 @@ struct vm_fault {
 					 */
 };
 
+#ifdef CONFIG_USERFAULTFD
+/* A combined operation mode + behavior flags. */
+typedef unsigned int __bitwise uffd_flags_t;
+
+enum mfill_atomic_mode {
+	MFILL_ATOMIC_COPY,
+	MFILL_ATOMIC_ZEROPAGE,
+	MFILL_ATOMIC_CONTINUE,
+	MFILL_ATOMIC_POISON,
+	NR_MFILL_ATOMIC_MODES,
+};
+
+/* VMA userfaultfd operations */
+typedef struct {
+	/**
+	 * @uffd_features: features supported in bitmask.
+	 *
+	 * When the ops is defined, the driver must set non-zero features
+	 * to be a subset (or all) of: VM_UFFD_MISSING|WP|MINOR.
+	 */
+	unsigned long uffd_features;
+	/**
+	 * @uffd_ioctls: ioctls supported in bitmask.
+	 *
+	 * Userfaultfd ioctls supported by the module.  Below will always
+	 * be supported by default whenever a module provides vm_uffd_ops:
+	 *
+	 *   _UFFDIO_API, _UFFDIO_REGISTER, _UFFDIO_UNREGISTER, _UFFDIO_WAKE
+	 *
+	 * The module needs to provide all the rest optionally supported
+	 * ioctls.  For example, when VM_UFFD_MISSING was supported,
+	 * _UFFDIO_COPY must be supported as ioctl, while _UFFDIO_ZEROPAGE
+	 * is optional.
+	 */
+	unsigned long uffd_ioctls;
+	/**
+	 * uffd_get_folio: Handler to resolve UFFDIO_CONTINUE request.
+	 *
+	 * @inode: the inode for folio lookup
+	 * @pgoff: the pgoff of the folio
+	 * @folio: returned folio pointer
+	 *
+	 * Return: zero if succeeded, negative for errors.
+	 */
+	int (*uffd_get_folio)(struct inode *inode, pgoff_t pgoff,
+			      struct folio **folio);
+	/**
+	 * uffd_copy: Handler to resolve UFFDIO_COPY|ZEROPAGE request.
+	 *
+	 * @dst_pmd: target pmd to resolve page fault
+	 * @dst_vma: target vma
+	 * @dst_addr: target virtual address
+	 * @src_addr: source address to copy from
+	 * @flags: userfaultfd request flags
+	 * @foliop: previously allocated folio
+	 *
+	 * Return: zero if succeeded, negative for errors.
+	 */
+	int (*uffd_copy)(pmd_t *dst_pmd, struct vm_area_struct *dst_vma,
+			 unsigned long dst_addr, unsigned long src_addr,
+			 uffd_flags_t flags, struct folio **foliop);
+} vm_uffd_ops;
+#endif
+
 /*
  * These are the virtual MM functions - opening of an area, closing and
  * unmapping it (needed to keep files on disk up-to-date etc), pointer
@@ -653,6 +717,13 @@ struct vm_operations_struct {
 	 */
 	struct page *(*find_special_page)(struct vm_area_struct *vma,
 					  unsigned long addr);
+#ifdef CONFIG_USERFAULTFD
+	/*
+	 * Userfaultfd related ops.  Modules need to define this to support
+	 * userfaultfd.
+	 */
+	const vm_uffd_ops *userfaultfd_ops;
+#endif
 };
 
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index ccad58602846..e79c724b3b95 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -80,18 +80,6 @@ struct userfaultfd_ctx {
 
 extern vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason);
 
-/* A combined operation mode + behavior flags. */
-typedef unsigned int __bitwise uffd_flags_t;
-
-/* Mutually exclusive modes of operation. */
-enum mfill_atomic_mode {
-	MFILL_ATOMIC_COPY,
-	MFILL_ATOMIC_ZEROPAGE,
-	MFILL_ATOMIC_CONTINUE,
-	MFILL_ATOMIC_POISON,
-	NR_MFILL_ATOMIC_MODES,
-};
-
 #define MFILL_ATOMIC_MODE_BITS (const_ilog2(NR_MFILL_ATOMIC_MODES - 1) + 1)
 #define MFILL_ATOMIC_BIT(nr) BIT(MFILL_ATOMIC_MODE_BITS + (nr))
 #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(nr))
-- 
2.49.0

