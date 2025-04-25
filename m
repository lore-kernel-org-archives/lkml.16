Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C1723644D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569058; cv=none; b=Qk4M2TXUsTbhNX/dbdyHNSO/zPdJPjNDC0YJ7x5nNvGfIYLf1ZxbeZ4EkS0ZOvahD+tLFGDRZK0Kreg7bC6TLYCB4OoHlJiXKCt1zsRiQmx6tDx6Cls7BSkg4FrvWdLg6H+g76C/VmU7O3Hvm322a9yj1WOcSlzyJMRxr7OgrsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569058; c=relaxed/simple;
	bh=ZZLgTzRZD4dD78rVmQM4/tSMlNSPKSx1Dt+RBO0GL+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERjpxIpeuhk5Vqd0LF9tD9BGssXey2Qg8riwc2VDdxJ4JI/d50SwOPNMUYKheJaMFzMl8M4ORnqt8v0N1rx6pTz3+BnSqq1fh6px1K6QroVhO28035tdcEVHdHlAJZjDYYJX4QsRGvIyBDrt3np01fDMhr5WJoBhB5y01WuG4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JuC6Etpj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JuC6Etpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745569055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evDGoI+/XQeXjHcfAaTzbc2xRRT2bYWbObPQgXY7yUk=;
	b=JuC6EtpjVkl4HiTSNKIPTowxeMuj+JxNS0QlsjeIwZXSZHkpH1jTsaARRIvP4JwNaXY2zV
	A8ug8kaIFdYBnJeX7Ddqclu313LH0GLI8NfZ255q5AID5+avTgY2QfdudH5CT/sHg/zdY0
	q5Ekka1BbsoVNyZ8g4Fs6ew5mTdbwFU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-Om2ajcB5NgCmGbynz2Bz1Q-1; Fri, 25 Apr 2025 04:17:34 -0400
X-MC-Unique: Om2ajcB5NgCmGbynz2Bz1Q-1
X-Mimecast-MFC-AGG-ID: Om2ajcB5NgCmGbynz2Bz1Q_1745569053
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d08915f61so9969375e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569053; x=1746173853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evDGoI+/XQeXjHcfAaTzbc2xRRT2bYWbObPQgXY7yUk=;
        b=hajIADgdX89//2AfeGGKNGdsFjFcPYXP60Hwq/H289AsKI7reawqJcPsLQm3x4fIyM
         XFpLhFcaEw3m+2d1zgKhoCdKnotTCnzKlypYvTKEIndVE5SPylUztzxR7eCJxdFPqC4p
         FFWe2z6vPRyANtpXctEm1tm3TriCLknm/kmaVRn3ZI3Nv9vGKZPXCK8ojmdfBy4C56MI
         xOScuNm5WDSU81wlLG/tmB8lC0FCdefMOeuV8+vhZw6xUITo2jh0cW+63xBg9v0/EBUi
         /iTmhyaDtr3Zb0d6Tq3FfuQEqDdxSkXVHX5MNajK2z2IJNzCewP7+cLd+T+LjJxmq04T
         qaRg==
X-Gm-Message-State: AOJu0YzwwfryJEbmv/KuAzPrHh6zCzm4g4TY6jSNnf4Gj65L51ya9QWK
	Ncehtif+duKDFyPOWFVFOZnMrwlITytVcTbmZrItOdzbnzOVnyUCBYGcOPapeHnHgwNVycEdYlK
	1tKqKXhnN862fdDcT5KXWS8jG0xAOYDjBUqk7IxyVaZxlrGvZCnyPsvVJU95okcFSOEiNmY6Qhl
	ygVxiIFskTshAG7n8swUxjDkGJT+/Gc+LanhfQCyyOJw==
X-Gm-Gg: ASbGncviSs77V0sKbiD4eEIYFc98ehjqm9fuugztFQJ300BQbp5aj9D6501Qt4CE1p5
	0TuNPVp77YEDoiTpbQ7/1CRr5Q5zjQ2sAneAx2JWOQ6KAXmobhE0oQqYv5sT1Fo3y6qknFAaWea
	PiIK5dJbIv1TbxbGmLt9nw9LNjCqXesOgH1SzzK24EG2t1xUBnPT3NJbbbLNnXV3dfVHXc9jXKq
	eCEA1hLxX3sAUQmjNUbjeL2js7T0E+BXIh9LxT45MoK29+5uhOLChor8h4EcXDkq9JmrpZD8iVE
	ixCMutlwVX9DEQDVgu2WljaSuXQG6cEo7NkpTgAJGzzSBAClAZiQ7N8hPwJpFssmDsHwhew=
X-Received: by 2002:a05:600c:198f:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-440a669ae6dmr9331415e9.25.1745569052758;
        Fri, 25 Apr 2025 01:17:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLU3fxIlqe9QX0QeLDRedHwb9sZfQbAe1nE7pImM0iT/BFkLTcKeXBBqkMmeCWWs62lN1KYQ==
X-Received: by 2002:a05:600c:198f:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-440a669ae6dmr9330695e9.25.1745569051957;
        Fri, 25 Apr 2025 01:17:31 -0700 (PDT)
Received: from localhost (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d29b990sm51033025e9.4.2025.04.25.01.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:17:31 -0700 (PDT)
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
Subject: [PATCH v1 06/11] x86/mm/pat: remove old pfnmap tracking interface
Date: Fri, 25 Apr 2025 10:17:10 +0200
Message-ID: <20250425081715.1341199-7-david@redhat.com>
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

We can now get rid of the old interface along with get_pat_info() and
follow_phys().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 147 --------------------------------------
 include/linux/pgtable.h   |  66 -----------------
 2 files changed, 213 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index c011d8dd8f441..668ebf0065157 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -933,119 +933,6 @@ static void free_pfn_range(u64 paddr, unsigned long size)
 		memtype_free(paddr, paddr + size);
 }
 
-static int follow_phys(struct vm_area_struct *vma, unsigned long *prot,
-		resource_size_t *phys)
-{
-	struct follow_pfnmap_args args = { .vma = vma, .address = vma->vm_start };
-
-	if (follow_pfnmap_start(&args))
-		return -EINVAL;
-
-	/* Never return PFNs of anon folios in COW mappings. */
-	if (!args.special) {
-		follow_pfnmap_end(&args);
-		return -EINVAL;
-	}
-
-	*prot = pgprot_val(args.pgprot);
-	*phys = (resource_size_t)args.pfn << PAGE_SHIFT;
-	follow_pfnmap_end(&args);
-	return 0;
-}
-
-static int get_pat_info(struct vm_area_struct *vma, resource_size_t *paddr,
-		pgprot_t *pgprot)
-{
-	unsigned long prot;
-
-	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_PAT));
-
-	/*
-	 * We need the starting PFN and cachemode used for track_pfn_remap()
-	 * that covered the whole VMA. For most mappings, we can obtain that
-	 * information from the page tables. For COW mappings, we might now
-	 * suddenly have anon folios mapped and follow_phys() will fail.
-	 *
-	 * Fallback to using vma->vm_pgoff, see remap_pfn_range_notrack(), to
-	 * detect the PFN. If we need the cachemode as well, we're out of luck
-	 * for now and have to fail fork().
-	 */
-	if (!follow_phys(vma, &prot, paddr)) {
-		if (pgprot)
-			*pgprot = __pgprot(prot);
-		return 0;
-	}
-	if (is_cow_mapping(vma->vm_flags)) {
-		if (pgprot)
-			return -EINVAL;
-		*paddr = (resource_size_t)vma->vm_pgoff << PAGE_SHIFT;
-		return 0;
-	}
-	WARN_ON_ONCE(1);
-	return -EINVAL;
-}
-
-int track_pfn_copy(struct vm_area_struct *dst_vma,
-		struct vm_area_struct *src_vma, unsigned long *pfn)
-{
-	const unsigned long vma_size = src_vma->vm_end - src_vma->vm_start;
-	resource_size_t paddr;
-	pgprot_t pgprot;
-	int rc;
-
-	if (!(src_vma->vm_flags & VM_PAT))
-		return 0;
-
-	/*
-	 * Duplicate the PAT information for the dst VMA based on the src
-	 * VMA.
-	 */
-	if (get_pat_info(src_vma, &paddr, &pgprot))
-		return -EINVAL;
-	rc = reserve_pfn_range(paddr, vma_size, &pgprot, 1);
-	if (rc)
-		return rc;
-
-	/* Reservation for the destination VMA succeeded. */
-	vm_flags_set(dst_vma, VM_PAT);
-	*pfn = PHYS_PFN(paddr);
-	return 0;
-}
-
-void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
-{
-	untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
-	/*
-	 * Reservation was freed, any copied page tables will get cleaned
-	 * up later, but without getting PAT involved again.
-	 */
-}
-
-/*
- * prot is passed in as a parameter for the new mapping. If the vma has
- * a linear pfn mapping for the entire range, or no vma is provided,
- * reserve the entire pfn + size range with single reserve_pfn_range
- * call.
- */
-int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
-		    unsigned long pfn, unsigned long addr, unsigned long size)
-{
-	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
-
-	/* reserve the whole chunk starting from paddr */
-	if (!vma || (addr == vma->vm_start
-				&& size == (vma->vm_end - vma->vm_start))) {
-		int ret;
-
-		ret = reserve_pfn_range(paddr, size, prot, 0);
-		if (ret == 0 && vma)
-			vm_flags_set(vma, VM_PAT);
-		return ret;
-	}
-
-	return pfnmap_sanitize_pgprot(pfn, size, prot);
-}
-
 int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size, pgprot_t *prot)
 {
 	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
@@ -1082,40 +969,6 @@ void pfnmap_untrack(unsigned long pfn, unsigned long size)
 	free_pfn_range(paddr, size);
 }
 
-/*
- * untrack_pfn is called while unmapping a pfnmap for a region.
- * untrack can be called for a specific region indicated by pfn and size or
- * can be for the entire vma (in which case pfn, size are zero).
- */
-void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
-		 unsigned long size, bool mm_wr_locked)
-{
-	resource_size_t paddr;
-
-	if (vma && !(vma->vm_flags & VM_PAT))
-		return;
-
-	/* free the chunk starting from pfn or the whole chunk */
-	paddr = (resource_size_t)pfn << PAGE_SHIFT;
-	if (!paddr && !size) {
-		if (get_pat_info(vma, &paddr, NULL))
-			return;
-		size = vma->vm_end - vma->vm_start;
-	}
-	free_pfn_range(paddr, size);
-	if (vma) {
-		if (mm_wr_locked)
-			vm_flags_clear(vma, VM_PAT);
-		else
-			__vm_flags_mod(vma, 0, VM_PAT);
-	}
-}
-
-void untrack_pfn_clear(struct vm_area_struct *vma)
-{
-	vm_flags_clear(vma, VM_PAT);
-}
-
 pgprot_t pgprot_writecombine(pgprot_t prot)
 {
 	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WC);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 898a3ab195578..0ffc6b9339182 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1489,17 +1489,6 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
  * vmf_insert_pfn.
  */
 
-/*
- * track_pfn_remap is called when a _new_ pfn mapping is being established
- * by remap_pfn_range() for physical range indicated by pfn and size.
- */
-static inline int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
-				  unsigned long pfn, unsigned long addr,
-				  unsigned long size)
-{
-	return 0;
-}
-
 static inline int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
 		pgprot_t *prot)
 {
@@ -1515,55 +1504,7 @@ static inline int pfnmap_track(unsigned long pfn, unsigned long size,
 static inline void pfnmap_untrack(unsigned long pfn, unsigned long size)
 {
 }
-
-/*
- * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
- * tables copied during copy_page_range(). Will store the pfn to be
- * passed to untrack_pfn_copy() only if there is something to be untracked.
- * Callers should initialize the pfn to 0.
- */
-static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
-		struct vm_area_struct *src_vma, unsigned long *pfn)
-{
-	return 0;
-}
-
-/*
- * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
- * copy_page_range(), but after track_pfn_copy() was already called. Can
- * be called even if track_pfn_copy() did not actually track anything:
- * handled internally.
- */
-static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
-		unsigned long pfn)
-{
-}
-
-/*
- * untrack_pfn is called while unmapping a pfnmap for a region.
- * untrack can be called for a specific region indicated by pfn and size or
- * can be for the entire vma (in which case pfn, size are zero).
- */
-static inline void untrack_pfn(struct vm_area_struct *vma,
-			       unsigned long pfn, unsigned long size,
-			       bool mm_wr_locked)
-{
-}
-
-/*
- * untrack_pfn_clear is called in the following cases on a VM_PFNMAP VMA:
- *
- * 1) During mremap() on the src VMA after the page tables were moved.
- * 2) During fork() on the dst VMA, immediately after duplicating the src VMA.
- */
-static inline void untrack_pfn_clear(struct vm_area_struct *vma)
-{
-}
 #else
-extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
-			   unsigned long pfn, unsigned long addr,
-			   unsigned long size);
-
 /**
  * pfnmap_sanitize_pgprot - sanitize the pgprot for a pfn range
  * @pfn: the start of the pfn range
@@ -1603,13 +1544,6 @@ int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
  * un-doing any reservation.
  */
 void pfnmap_untrack(unsigned long pfn, unsigned long size);
-extern int track_pfn_copy(struct vm_area_struct *dst_vma,
-		struct vm_area_struct *src_vma, unsigned long *pfn);
-extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
-		unsigned long pfn);
-extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
-			unsigned long size, bool mm_wr_locked);
-extern void untrack_pfn_clear(struct vm_area_struct *vma);
 #endif
 
 #ifdef CONFIG_MMU
-- 
2.49.0

