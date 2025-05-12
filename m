Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823DA29374F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053277; cv=none; b=nlKK4ekkhE2jRLs6xSkxz80JYo9dfjuKWO0BKEbTLHzzhCkJT3w3s87FErX1BTrjWz4N1wPLXpYIbscW6YLKBQw8DqCaigCw0+G+dUHYGAme71IxP3LKkClEv9r3R1B1COktgWiWsI5iziokMvNEmncEjfUQh/ar1Slw/onJ/6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053277; c=relaxed/simple;
	bh=HzndHn4T9ZYXppW40wlrwQTTad9pQBIWeyR83towNBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3qNkcJ1tvKzQwTc9Ook/OpSPeBwMta7uQ5rimk/+Lhd1imGW4qmA3CmRPwIVE7e4O6xed00rtTi/T/sIkIbKCXOsn4H9A5ZtUnH7i7Ay9OD3l1C3oXWOictBdrGafLwqycku6NmkZ+DDSLc86Ko9805knehQosQY3r6lMpMlh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XU7KZpEb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XU7KZpEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6nHoWozKkbl8Jpefo8Zb0yf0bGe9671cYhr6GgVPgWI=;
	b=XU7KZpEbfEykLhfQI+z1q21uD/1rqOzJNYfYDhkoDqPV4nghRTGwj2IBfAqLW8qSl2Vf8/
	S152sUP6wIHGw/MBbdEaq+C8siUUZGfwgUG8O2IP1aek4yUDW0L0w3otA841armyU66O1N
	R6n7xGtfbj/8Pn0dNFf4xQDS9/tf/bY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-3or5fRMlOfGBppAAxvc_jA-1; Mon, 12 May 2025 08:34:33 -0400
X-MC-Unique: 3or5fRMlOfGBppAAxvc_jA-1
X-Mimecast-MFC-AGG-ID: 3or5fRMlOfGBppAAxvc_jA_1747053272
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so23224995e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053272; x=1747658072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nHoWozKkbl8Jpefo8Zb0yf0bGe9671cYhr6GgVPgWI=;
        b=wbuaFazm6RxKXaJQcwjlFaSsf34htmhnOWHFpx659QDUnW5TEWYgiY6O5NkVZtPR8q
         GsR97nEPvspPK35eLrQL1PbK0jcJ7wr0Tfyi9XJU0Gh2X0gbKO02Wkt8LpfL0Bf2Uwsu
         gM7KjpMHwCll1EW7qlv99KH7bd1cVpEj8s2KLKJxo4n2F9tSbyGnDzIFT0Yhgiw9HCmh
         ZddcQ7GzV+BRMEPFnj+nWcMWpcJN7imx6Sg8twJwC9SVj/YYpxtO2mLPOMye5F8r4RFd
         EiCFSfMHKGvRQFUDh+rapxLTPi/V/t2jKXwU5WME+yYuFHEOxjfYuUj/scL0Tjetyrdw
         ztHQ==
X-Gm-Message-State: AOJu0YwSUPQeIOoV+RGkJs1ciZpnE6jKXtR5H4+A48Z0hxB9ubbXLywm
	rHJCuw08BLRkzD82URyDEeEfvn3+Xjlxoomd247UoUV4fO88ZNXB2lPxq6x9F9J2qFDWE+P9WUY
	O98S4Vkw3oETrSqCxTj8CA8Wn8y0k5oIAThKKVlZuyOx23ddMLsi7UgVrpWl+4O8AwkMyBxRI+P
	Qq7pJiQL/F3AlretRjs3bK4afgF41VZ1A9LFRTd2fnyo/Y
X-Gm-Gg: ASbGncvNjx6LhqCZDR3Gfs6GwRyuj1iYVMvmIngb5V13qEOfELB4Nov8MM4wj2EyRhD
	lEHYzjW2dQz0DAtgpC2i/M0ejyADfOJr5aCHW3HH+UXteaJDityR4XcIzuK6mnw+yQ1gO81UTfE
	8X19uELj6+jzz02bl8LAM5qi2dzb82FeLhvw8AFobf0iS1ojO6+8b8XgWT2yTU8xk9VPrh3QYCN
	3wakMmJ1RFLCTdayLV+1blrPUU1QTmOyaCcX/BlhlmbTZN5sxQBrA6e59/rZi8tkR+6FUMe9in/
	T5cW8kY+p/HSSrH1gZiJpRINe5V6Z8jAinHJZCaG7w5YqKKLBE7t6gVXtul7dm5vBDeZJa5t
X-Received: by 2002:a05:600c:3490:b0:441:d4e8:76cd with SMTP id 5b1f17b1804b1-442d6ddec00mr105442565e9.29.1747053272142;
        Mon, 12 May 2025 05:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAkmJW1RYt0shbyVSJYG/Cde8Y5kgDkvTgdUylwEM8H1PlNDd2NNsMG+k4pYVsizSZx0oo/Q==
X-Received: by 2002:a05:600c:3490:b0:441:d4e8:76cd with SMTP id 5b1f17b1804b1-442d6ddec00mr105442015e9.29.1747053271651;
        Mon, 12 May 2025 05:34:31 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f331sm168479925e9.13.2025.05.12.05.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:31 -0700 (PDT)
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
Subject: [PATCH v2 02/11] mm: convert track_pfn_insert() to pfnmap_setup_cachemode*()
Date: Mon, 12 May 2025 14:34:15 +0200
Message-ID: <20250512123424.637989-3-david@redhat.com>
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

... by factoring it out from track_pfn_remap() into
pfnmap_setup_cachemode() and provide pfnmap_setup_cachemode_pfn() as
a replacement for track_pfn_insert().

For PMDs/PUDs, we keep checking a single pfn only. Add some documentation,
and also document why it is valid to not check the whole pfn range.

We'll reuse pfnmap_setup_cachemode() from core MM next.

Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 24 ++++++------------
 include/linux/pgtable.h   | 52 +++++++++++++++++++++++++++++++++------
 mm/huge_memory.c          |  5 ++--
 mm/memory.c               |  4 +--
 4 files changed, 57 insertions(+), 28 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index edec5859651d6..fa78facc6f633 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -1031,7 +1031,6 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 		    unsigned long pfn, unsigned long addr, unsigned long size)
 {
 	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
-	enum page_cache_mode pcm;
 
 	/* reserve the whole chunk starting from paddr */
 	if (!vma || (addr == vma->vm_start
@@ -1044,13 +1043,17 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 		return ret;
 	}
 
+	return pfnmap_setup_cachemode(pfn, size, prot);
+}
+
+int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size, pgprot_t *prot)
+{
+	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
+	enum page_cache_mode pcm;
+
 	if (!pat_enabled())
 		return 0;
 
-	/*
-	 * For anything smaller than the vma size we set prot based on the
-	 * lookup.
-	 */
 	pcm = lookup_memtype(paddr);
 
 	/* Check memtype for the remaining pages */
@@ -1065,17 +1068,6 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 	return 0;
 }
 
-void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
-{
-	enum page_cache_mode pcm;
-
-	if (!pat_enabled())
-		return;
-
-	pcm = lookup_memtype(pfn_t_to_phys(pfn));
-	pgprot_set_cachemode(prot, pcm);
-}
-
 /*
  * untrack_pfn is called while unmapping a pfnmap for a region.
  * untrack can be called for a specific region indicated by pfn and size or
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index f1e890b604609..be1745839871c 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1496,13 +1496,10 @@ static inline int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 	return 0;
 }
 
-/*
- * track_pfn_insert is called when a _new_ single pfn is established
- * by vmf_insert_pfn().
- */
-static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
-				    pfn_t pfn)
+static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
+		pgprot_t *prot)
 {
+	return 0;
 }
 
 /*
@@ -1552,8 +1549,32 @@ static inline void untrack_pfn_clear(struct vm_area_struct *vma)
 extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 			   unsigned long pfn, unsigned long addr,
 			   unsigned long size);
-extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
-			     pfn_t pfn);
+
+/**
+ * pfnmap_setup_cachemode - setup the cachemode in the pgprot for a pfn range
+ * @pfn: the start of the pfn range
+ * @size: the size of the pfn range in bytes
+ * @prot: the pgprot to modify
+ *
+ * Lookup the cachemode for the pfn range starting at @pfn with the size
+ * @size and store it in @prot, leaving other data in @prot unchanged.
+ *
+ * This allows for a hardware implementation to have fine-grained control of
+ * memory cache behavior at page level granularity. Without a hardware
+ * implementation, this function does nothing.
+ *
+ * Currently there is only one implementation for this - x86 Page Attribute
+ * Table (PAT). See Documentation/arch/x86/pat.rst for more details.
+ *
+ * This function can fail if the pfn range spans pfns that require differing
+ * cachemodes. If the pfn range was previously verified to have a single
+ * cachemode, it is sufficient to query only a single pfn. The assumption is
+ * that this is the case for drivers using the vmf_insert_pfn*() interface.
+ *
+ * Returns 0 on success and -EINVAL on error.
+ */
+int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
+		pgprot_t *prot);
 extern int track_pfn_copy(struct vm_area_struct *dst_vma,
 		struct vm_area_struct *src_vma, unsigned long *pfn);
 extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
@@ -1563,6 +1584,21 @@ extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
 extern void untrack_pfn_clear(struct vm_area_struct *vma);
 #endif
 
+/**
+ * pfnmap_setup_cachemode_pfn - setup the cachemode in the pgprot for a pfn
+ * @pfn: the pfn
+ * @prot: the pgprot to modify
+ *
+ * Lookup the cachemode for @pfn and store it in @prot, leaving other
+ * data in @prot unchanged.
+ *
+ * See pfnmap_setup_cachemode() for details.
+ */
+static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
+{
+	pfnmap_setup_cachemode(pfn, PAGE_SIZE, prot);
+}
+
 #ifdef CONFIG_MMU
 #ifdef __HAVE_COLOR_ZERO_PAGE
 static inline int is_zero_pfn(unsigned long pfn)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2780a12b25f01..d3e66136e41a3 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1455,7 +1455,8 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 			return VM_FAULT_OOM;
 	}
 
-	track_pfn_insert(vma, &pgprot, pfn);
+	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
+
 	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
 	error = insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write,
 			pgtable);
@@ -1577,7 +1578,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 	if (addr < vma->vm_start || addr >= vma->vm_end)
 		return VM_FAULT_SIGBUS;
 
-	track_pfn_insert(vma, &pgprot, pfn);
+	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
 
 	ptl = pud_lock(vma->vm_mm, vmf->pud);
 	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
diff --git a/mm/memory.c b/mm/memory.c
index 99af83434e7c5..064fc55d8eab9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2564,7 +2564,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 	if (!pfn_modify_allowed(pfn, pgprot))
 		return VM_FAULT_SIGBUS;
 
-	track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
+	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
 	return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
 			false);
@@ -2627,7 +2627,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 	if (addr < vma->vm_start || addr >= vma->vm_end)
 		return VM_FAULT_SIGBUS;
 
-	track_pfn_insert(vma, &pgprot, pfn);
+	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
 
 	if (!pfn_modify_allowed(pfn_t_to_pfn(pfn), pgprot))
 		return VM_FAULT_SIGBUS;
-- 
2.49.0

