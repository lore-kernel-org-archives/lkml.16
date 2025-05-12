Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2E4293B6D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053279; cv=none; b=GguUVY+4E7KuRTwdfS3z6TnW4bQZZmkU7pvE4FQZ3n1WLms+DfZ2ESBim1qkz7BPWfNgjIc8jrnrMfL9QOkAJR7Y/nJxLjIeZ0ZaXsT5IzxOw1XSvFsnYXGufaZoZa345Mq3EVdkO7oBYoQdemO59ZLn6BBBqfa808WdHrew89A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053279; c=relaxed/simple;
	bh=7m+BzEd74yqLbmLjeWAIwrgcejBZOMr6mqnEZdo2IKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCLuZ+QhZ7vwDCDtxXsXXeimhuOsN/fMdcfsHPuww54fiZOOzu15v5dvh1cyOr+ydDneW8wPaq7P70vKSC82InkbB4iEKVa0GchEAWQGhdV0OPY4MPW6qXFux5VMkHE7Ktho7cUArKCm+iBAmTd9aekauV1W69cdMDF+CHW7sZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iBE1IYoo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iBE1IYoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjnnC5BACKQYADpf3O8+rlLTsN5UNkR42iRu+4jj/5k=;
	b=iBE1IYoonLkZatsAJEUgQRlze52E0N8N/CyPJCVtwoF1Q7IVbJ9E0fN0ObtHpJiWQ2RllF
	0x40Qb2l/6Fx6AjcnnzypQ17FmDX9eRhZvFGkNVDYobOD3xZTsAWBqae59H6nv9qyFD04E
	fNFQJO8PiOl+XkwRk7SHTek5I/BG5ts=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-FZNXt8_4PgCUjKIlbrqBJA-1; Mon, 12 May 2025 08:34:35 -0400
X-MC-Unique: FZNXt8_4PgCUjKIlbrqBJA-1
X-Mimecast-MFC-AGG-ID: FZNXt8_4PgCUjKIlbrqBJA_1747053274
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442dc6f0138so9403475e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053274; x=1747658074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjnnC5BACKQYADpf3O8+rlLTsN5UNkR42iRu+4jj/5k=;
        b=AcLc06UGLNSpY4LhFyo9eb7Qql2shwUkJnafPSDZi5W1kHUOoLNa2DR7fRW6fsrAOV
         gJSHjrbaXk1eV9hSOgqc03Fs1RwmFbW/FKOGS+kFIDDIA3b3+4F+ze4wh3yUi09MFFoP
         rWAGFPwO9G8AmSbZLds1bB34hnu0TvmF/3jSCH6ln8XlT5G/y5WUhQQSX2MU5yNzlO/N
         +3Mcr+IG8SRPU88lJLGuOSyJzBbP2mlfqjbOCQISv4hUieJqdMPjYPGe0ZXwF2bTS2HR
         Q+YghRiDdOT+NJUA1GrTt/Qcb/b8HkIYnj6VHXXSE5a1UjHNNdpUr93HHRn2/PJdflAG
         q7Cw==
X-Gm-Message-State: AOJu0Yyzhy1SpH3bGa9P0HZchL5Xn6mbu7JltVGRSerm7CMpbMYPQFks
	iofjOFVMeMm9W1O4HnD+dvtF/AbNjTGW/o5XqUGyx+kAbBgZO/EQP+6+kZol43wESaJ3W4Udh/4
	tqmMAIyY18rFGoLV/GEqlARNAu1rXFf0a26UFdNhZBazIJgccDOGGWrYSbqSEELntBV+GWmFADX
	60CG9hMFlHe13WzRjcdx2Fx7SJ56BH3O1CeNR66VP+kycA
X-Gm-Gg: ASbGncvsoMebfwGDMA4A3G74fujH/Mza5dAdwAQy0n64cVTQFS4eC35wdY8eDN5b+QS
	FpSaju02bRf0TyJaKg/cT8qYDiim3+R0XcXZ6kuztzyUmtDOX7fApC1kzS4xk+FLCUJd5PgfBhF
	N468NzoHeXOqoqlEx1rvD8MU02KR+i+wlHTtzN4TLQWsZfdsRzRNEFOcCrsxpKp5jr3kQBiJ3MA
	yVrT0ARIgMuUxxQoROYYABNkhpsRSgsW/odIsEJaZyoWVA6OUJFJc0mwSQ/nupOfQQ4bEx4wc90
	9lDPXD/B7BoZ0MKgHv6mnGS/ujLRjQqT/nRPxk0Zqqhj1pjBYsKkvdPrvHKpO4Ac31bljim7
X-Received: by 2002:a05:600c:5118:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-442d6dc539cmr82258675e9.20.1747053274417;
        Mon, 12 May 2025 05:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLHMAxfNnCQj32PB2xBlHRpvgTd61IhRYv44GdPG9fUkbIQCt1pbTkP7UkTO09z7pcUrC5ng==
X-Received: by 2002:a05:600c:5118:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-442d6dc539cmr82258205e9.20.1747053273921;
        Mon, 12 May 2025 05:34:33 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d67df5ecsm123693385e9.9.2025.05.12.05.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:33 -0700 (PDT)
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
	Peter Xu <peterx@redhat.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 03/11] mm: introduce pfnmap_track() and pfnmap_untrack() and use them for memremap
Date: Mon, 12 May 2025 14:34:16 +0200
Message-ID: <20250512123424.637989-4-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's provide variants of track_pfn_remap() and untrack_pfn() that won't
mess with VMAs, and replace the usage in mm/memremap.c.

Add some documentation.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 14 ++++++++++++++
 include/linux/pgtable.h   | 39 +++++++++++++++++++++++++++++++++++++++
 mm/memremap.c             |  8 ++++----
 3 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index fa78facc6f633..1ec8af6cad6bf 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -1068,6 +1068,20 @@ int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size, pgprot_t *prot
 	return 0;
 }
 
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
+{
+	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
+
+	return reserve_pfn_range(paddr, size, prot, 0);
+}
+
+void pfnmap_untrack(unsigned long pfn, unsigned long size)
+{
+	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
+
+	free_pfn_range(paddr, size);
+}
+
 /*
  * untrack_pfn is called while unmapping a pfnmap for a region.
  * untrack can be called for a specific region indicated by pfn and size or
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index be1745839871c..90f72cd358390 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1502,6 +1502,16 @@ static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
 	return 0;
 }
 
+static inline int pfnmap_track(unsigned long pfn, unsigned long size,
+		pgprot_t *prot)
+{
+	return 0;
+}
+
+static inline void pfnmap_untrack(unsigned long pfn, unsigned long size)
+{
+}
+
 /*
  * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
  * tables copied during copy_page_range(). Will store the pfn to be
@@ -1575,6 +1585,35 @@ extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
  */
 int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
 		pgprot_t *prot);
+
+/**
+ * pfnmap_track - track a pfn range
+ * @pfn: the start of the pfn range
+ * @size: the size of the pfn range in bytes
+ * @prot: the pgprot to track
+ *
+ * Requested the pfn range to be 'tracked' by a hardware implementation and
+ * setup the cachemode in @prot similar to pfnmap_setup_cachemode().
+ *
+ * This allows for fine-grained control of memory cache behaviour at page
+ * level granularity. Tracking memory this way is persisted across VMA splits
+ * (VMA merging does not apply for VM_PFNMAP).
+ *
+ * Currently, there is only one implementation for this - x86 Page Attribute
+ * Table (PAT). See Documentation/arch/x86/pat.rst for more details.
+ *
+ * Returns 0 on success and -EINVAL on error.
+ */
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
+
+/**
+ * pfnmap_untrack - untrack a pfn range
+ * @pfn: the start of the pfn range
+ * @size: the size of the pfn range in bytes
+ *
+ * Untrack a pfn range previously tracked through pfnmap_track().
+ */
+void pfnmap_untrack(unsigned long pfn, unsigned long size);
 extern int track_pfn_copy(struct vm_area_struct *dst_vma,
 		struct vm_area_struct *src_vma, unsigned long *pfn);
 extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
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

