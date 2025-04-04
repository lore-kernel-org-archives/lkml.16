Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D11BD9C6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770979; cv=none; b=NzhiUEhCmknYf1t1WZ6b3j9TZ/N6chyG1+nAvvNhH+r6bHZpeIOUCMtQx7fYChduGB5G5bZ1/dsiZoDLAhIJR4PSft9l7k6b/ubbSbX4rFAcERZFceXQSDF3SLL9CDRSwnjy3OkTLo5vaXNz9Hr6og5vXF2Dj1JsX8LPtSV7e40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770979; c=relaxed/simple;
	bh=TgRzjUD4snS/RkYwUzNJw7fTuAl9/UedineyzC39mho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PqNX1El7pSlz2V4wUi6t6QyIJQinyJfQWAdY5QxnQ9rpREns0iB1BrmabCduKBOjQHzTaF9AP0eNGDGSw3VONCRwvp/hTF0+d4JT3Hy45JpcDLZsp2uvIgsuIsRK5nxbsuLRCKUa1N3CI+dNk4CPSjqyU9uyGm4JTF9iC7Ni2SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PEs9l8xN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PEs9l8xN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743770976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ElXx7zpuGVuLExIEH/CSyLaDSb9egBTulKg0etuqtaU=;
	b=PEs9l8xNb+DB0jhrdWW/16n4oUjDChiHaveYwbC6YU0lKHXs0ZmTlT7SSHkiogV/Lgo+UU
	X6g1fuwf5h8V+oNdMb3ERQk4s2g6p3UtkZ7WH7o2FP77iru5Fnp22Kcbk2c8SMwvEARvHw
	F2SWbIVPJOXlXtUpS+AYf0OIzHbVUZg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-sWlBoRHCM8yBRfsbRXRwsQ-1; Fri, 04 Apr 2025 08:49:35 -0400
X-MC-Unique: sWlBoRHCM8yBRfsbRXRwsQ-1
X-Mimecast-MFC-AGG-ID: sWlBoRHCM8yBRfsbRXRwsQ_1743770974
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so16874285e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770974; x=1744375774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElXx7zpuGVuLExIEH/CSyLaDSb9egBTulKg0etuqtaU=;
        b=QSuA4qctz4vSZH1dUcmz3nVmPpVQUv+2qXj1sHNnF4aZTprYDMCyEMve7LcmCyXcYx
         mWy6Vcztv/zapG0XGGSkcSoW/Cu7sIgxzNz++ymavstqUyqLyWdyBGjJ3P/ZHPHMZKWu
         EqGxrxhm26Ts0i093HUFFtdm6NQ9wUDWtzxqfQ5UzS+L4uSyki362OWImqXdBjMkF61v
         I6c6EuUQEVSZd+8480rkn04PTQ9eUBt3Uhjpti/G/vCHa3tVVAdRubw5Ah7CXfNGsbwK
         gN6OGqZV2gPLkX1AVoXWqwEYHEfneT1P1Ae17vrM4OmRA9azQPned2LdJccjkrOR3neU
         3HwQ==
X-Gm-Message-State: AOJu0YzEHVi4eHI4Jk6ySXVmg+s8KvFledktjUZGkrYZzfCTY9dZ4Trb
	CMK5LG+HIE2z2q+TPVQm7Nhh0sV2S54cS+Ib4Z2J2hzHYQGXan7L+6otqASdRaWP/+t5JC8gTgt
	LcV3NJVGs8FSTa5w2mMLBZt7Jcl3qlgGQ5pGRcbCfzFZPqYnGFrYkMl41qZUkBsTkPbHIFpxzzS
	qD7Rfe1Hm4IGm5gDea907vVPPqsAxcTjd/N2LcHGpvr17z
X-Gm-Gg: ASbGnctbq8IzEMMW/8zfEeN4HWtHj6era4T6ZO8O/i3dZaZG2EoJwXeLNfF+I5QimsF
	2mvJAFi+UzeaUx/ZurKFw59NZSW7ugVqw3FkdGWujgz66umbgxd2WatYy8+58PAD075pCCr53pX
	142Cai4mpXIdmdvP7KmvNzvRb03d/jKtq2Y0hYkedb6jTM3oFVMRPJPiLp1MEVDh+e9uL4/uvIC
	Mhbhtkmc+1EbxErPhzCTUTFqzf0i4GmGbF56PRp+Q6ydOAXegUGkOpisfcqO0EQ9q9g0cO3ljqK
	TVu6aLlF+8+MZCiH3ov442GSxHHXgPZmqAUaBDCRWWcORIB7zPX7wRMjMsf7SRGp61a52TMA/G4
	j
X-Received: by 2002:a5d:64aa:0:b0:391:2e0f:efce with SMTP id ffacd0b85a97d-39cb357afdbmr2965619f8f.1.1743770974038;
        Fri, 04 Apr 2025 05:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxeNigkOC4vFDlRTg479b4ch7LTcpwjsYTaaPSI5BjxB79+5TOYvrjeCOmeWoLaXZpSaxwig==
X-Received: by 2002:a5d:64aa:0:b0:391:2e0f:efce with SMTP id ffacd0b85a97d-39cb357afdbmr2965579f8f.1.1743770973517;
        Fri, 04 Apr 2025 05:49:33 -0700 (PDT)
Received: from localhost (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c3020d62fsm4351146f8f.79.2025.04.04.05.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:49:32 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	David Hildenbrand <david@redhat.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
Date: Fri,  4 Apr 2025 14:49:31 +0200
Message-ID: <20250404124931.2255618-1-david@redhat.com>
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

Fix it by always initializing pfn when track_pfn_copy() returns 0 --
just as we document ("On success, stores the pfn to be passed to
untrack_pfn_copy()"). In addition, to avoid further wrong smatch
warnings, just initialize pfn = 0 in the caller as well.

While at it, clarify the doc of untrack_pfn_copy(), that internal checks
make sure if we actually have to untrack anything.

Fixes: dc84bc2aba85 ("x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
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
 arch/x86/mm/pat/memtype.c | 4 +++-
 include/linux/pgtable.h   | 5 ++++-
 mm/memory.c               | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 72d8cbc611583..9ad3e5b055d8a 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -992,8 +992,10 @@ int track_pfn_copy(struct vm_area_struct *dst_vma,
 	pgprot_t pgprot;
 	int rc;
 
-	if (!(src_vma->vm_flags & VM_PAT))
+	if (!(src_vma->vm_flags & VM_PAT)) {
+		*pfn = 0;
 		return 0;
+	}
 
 	/*
 	 * Duplicate the PAT information for the dst VMA based on the src
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e2b705c149454..9457064292141 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1517,12 +1517,15 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
 static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
 		struct vm_area_struct *src_vma, unsigned long *pfn)
 {
+	*pfn = 0;
 	return 0;
 }
 
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

