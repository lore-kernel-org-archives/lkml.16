Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC75F10E5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102801; cv=none; b=jVoxnCysxp7Q5JQodhpVJ9SaoAPoLLEBTmYVCS17smWGSOgUkdBpgzQ5OEMtxlG30vEaPbIVrS/Mu3FzkhNbgcPRlCc7OzENXXYgoIUV+q1ZHUxKbRn013QlHY4TmL9V0eNt7HiLxfY9stsTVlZD8ziQthNL0XTmjUwlhnAzyKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102801; c=relaxed/simple;
	bh=Ki28MGQMpJR2ZEUS+C1u10ZmJH6ki1TB7uI9o3AZUbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwXvjHIrh3xumH62j3RrUhISw/q/oSTHutENiigoN7dtHfnaxYJmnr3sKV4rWX3VhxNAfipUM1c4rS23RHYv0S2sUAKPsJF+mMrCY+c2KITSOUPftVhKVApQLG04PHvPWM+KDepobjwKNYKYF/tCS4NafZR6p1ZFjW6rCx+BuIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U8q4+MlU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U8q4+MlU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744102795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kzAxoMhwq/N89veZ013n0uVF7FLZ6e8BzRGcpvH3RxE=;
	b=U8q4+MlUthCnLN3Aps5b21fhvDE5WNC5j3tmxL2DvKKsfrdXQTYnniq0NRZjoUvLpzZJsO
	MeL/06sQcoOQgTyiByHw+27N+dsSqKznBjeKqfBmtm/IHzFOpOoyUwZB87YHPaX5DIzGt0
	YSOFk0HzSobdE9voTSxRVPpqok5zIP4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-lD_e3zYgMmSy1kdGyYcjRw-1; Tue, 08 Apr 2025 04:59:54 -0400
X-MC-Unique: lD_e3zYgMmSy1kdGyYcjRw-1
X-Mimecast-MFC-AGG-ID: lD_e3zYgMmSy1kdGyYcjRw_1744102793
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eed325461so14082725e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102793; x=1744707593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzAxoMhwq/N89veZ013n0uVF7FLZ6e8BzRGcpvH3RxE=;
        b=u1MNB2VrJ1qzNkk9nqHduIyfBlIrVmRtP74E0nxx55dzRnWK5ZTazEVzeW/urNyK12
         14QKci3eG8KuXZArDd6Fsnlg0vWs+7V/EH1pU5uG0q+vJrOL0SQTRXUQvN3uZ1u5Cr4N
         iiGuVboFgZ+bD5uty9kGTEkyyd4EPGP5ebZ8NtBBrNVUFzvtY+0jzqHj2d18oq/sNpIc
         SjclIWF60ZJpnXJPK1kmJCIU2kVtwspiBj0Bj5hZQdKQcXW5LTn9vd55UoxdcsSjE0Fv
         lBiQZfozE5thlZtGpBddHtsPrwzz13kQ7G5okKjTEiTGYqZsudLmx+agFLW8+i+lfelA
         X1Hw==
X-Gm-Message-State: AOJu0YwIWBBlTTCMr7F3a0FYGjhNuPjqlLQepDMrdetX+/UVIjfSS1AM
	yQ3mVVf0jUDFkcZSiobIy09tEN8DD42Ay1hwjoFSKaDp7Ggw0vFPhkPiWQqN+G1usPeBh1FkULz
	vf3Tc0RDoFgmvokOaDRR2iJBQ7MfnxEBSwidaeqve/gzMxCaouPErPJtK/Ms/fV8TnCF8WQrWSU
	D0zRWlL50q3e6STHWrt2oSgnxkAbQspxgaJCN/wSiZDTSd
X-Gm-Gg: ASbGncuO1qtHe7IjStyUwocHbDMwsGC5Ffqya3IzRtGwIbM2DhMGyi4rQznGa8cvlng
	hiA/hfcyoKHnLwDIoA14xtXoTOHs96HycGu40Xoqom7QNBQ52OkGqtRxFnvw5ACfP/C2xR1iQrc
	SJiQLZUPsWkE/g6fWaeEcV7sTW3eVE5LLlCJRvRVrViHiFxGKgz3m1YTfIYMPQJT37Z+ttpaeAa
	60YNSyI6aByImRH03DQgZZaiN+/JOg+Xy78TrboIwwYWRkRDFp5CvjEKCJZQJoICA0ejoifFov/
	gtyKcUBQm5Rv9nKvdEGeCvHT2WgevswuveS2NFjX8C3si80qPEy1q+8L7/8dwT5RupDTMxIgYr4
	=
X-Received: by 2002:a05:600c:1e13:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43ecf8e72d6mr154625225e9.18.1744102793281;
        Tue, 08 Apr 2025 01:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjj/RAjewnBNlRpflZh1xeihRfMokyOF5C4YTVYtEpSXXC3z9/o8ynALd8vnC+YZDVLSZdkg==
X-Received: by 2002:a05:600c:1e13:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43ecf8e72d6mr154624875e9.18.1744102792863;
        Tue, 08 Apr 2025 01:59:52 -0700 (PDT)
Received: from localhost (p200300cbc7074f00a44a5ad6765a0635.dip0.t-ipconnect.de. [2003:cb:c707:4f00:a44a:5ad6:765a:635])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec342827fsm156132655e9.6.2025.04.08.01.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:59:52 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	David Hildenbrand <david@redhat.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2] x86/mm/pat: (un)track_pfn_copy() fix + doc improvements
Date: Tue,  8 Apr 2025 10:59:50 +0200
Message-ID: <20250408085950.976103-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We got a late smatch warning and some additional review feedback.

	smatch warnings:
	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.

We actually use the pfn only when it is properly initialized; however,
we may pass an uninitialized value to a function -- although it will not
use it that likely still is UB in C.

So let's just fix it by always initializing pfn in the caller of
track_pfn_copy(), and improving the documentation of track_pfn_copy().

While at it, clarify the doc of untrack_pfn_copy(), that internal checks
make sure if we actually have to untrack anything.

Fixes: dc84bc2aba85 ("x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

v1 -> v2:
* Adjust the doc instead of initializing the pfn whenever returning 0
* Decided to keep Lorenzo's RB :)
* Retested

---
 include/linux/pgtable.h | 9 ++++++---
 mm/memory.c             | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e2b705c149454..b50447ef1c921 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1511,8 +1511,9 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
 
 /*
  * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
- * tables copied during copy_page_range(). On success, stores the pfn to be
- * passed to untrack_pfn_copy().
+ * tables copied during copy_page_range(). Will store the pfn to be
+ * passed to untrack_pfn_copy() only if there is something to be untracked.
+ * Callers should initialize the pfn to 0.
  */
 static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
 		struct vm_area_struct *src_vma, unsigned long *pfn)
@@ -1522,7 +1523,9 @@ static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
 
 /*
  * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
- * copy_page_range(), but after track_pfn_copy() was already called.
+ * copy_page_range(), but after track_pfn_copy() was already called. Can
+ * be called even if track_pfn_copy() did not actually track anything:
+ * handled internally.
  */
 static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
 		unsigned long pfn)
diff --git a/mm/memory.c b/mm/memory.c
index 2d8c265fc7d60..1a35165622e1c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1361,7 +1361,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
 	struct mm_struct *dst_mm = dst_vma->vm_mm;
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	struct mmu_notifier_range range;
-	unsigned long next, pfn;
+	unsigned long next, pfn = 0;
 	bool is_cow;
 	int ret;
 
-- 
2.48.1

