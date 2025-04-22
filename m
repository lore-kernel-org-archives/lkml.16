Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF42857D1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333390; cv=none; b=BjLRau2uuwZh9RhQKwNI+jOdGsbhDmiGhjS1DrpJ1k4gk7s/scG6wA/IDXiYwxctbtPVbg+mve+awm1vsyForP3C6J8A2s2/wcee/cSXz8b5XTmghMX5d9wET9saefSRtOE/MC28AY2+5S850LvhmofEYhMmjGASx6XczdtVzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333390; c=relaxed/simple;
	bh=FJUgEG6WDQpKPERbsDn3dIuR5beZg6lAPTaxklsN8F0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzqVLg0ulP63E8v6WCpr1e/nVFNNhN8t+VY0xELQdeDA05ELuHJcy/ohuMfJoGMV4ZEqq3DpPJtKqDlUWZd+wUJMHh2QjiDK8m6Ys5nIjZpoCgvJjVargtBJEMgD9lDtJNQvktYvUDdedXhuIdL6LfY/EZ7gnN4NXyXmGVN/2T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KCpbVnXU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KCpbVnXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745333387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FL1h0upM6Rf3HUd8dipjWCj+SjWMZ+52iTEFTXr+muw=;
	b=KCpbVnXUv7xq/AG9VqQZyjzjBDXgf6rHaUtxaQnRlLo49CAjjDqjR8t8P+8PoNXyWj6dIN
	dKHMdcCZvCxefHpsXsqWkHQft1guXpSCfE1qlX/MqmS3maD4tRPQM9R8CuYOMekH0eme3q
	HU8ao7UAMft/JhZqBwb+Fg7WVsrldSI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-CCn8UumzNFuGvTMinn9OGw-1; Tue, 22 Apr 2025 10:49:45 -0400
X-MC-Unique: CCn8UumzNFuGvTMinn9OGw-1
X-Mimecast-MFC-AGG-ID: CCn8UumzNFuGvTMinn9OGw_1745333384
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912b54611dso2636954f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333384; x=1745938184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FL1h0upM6Rf3HUd8dipjWCj+SjWMZ+52iTEFTXr+muw=;
        b=Tqc64OjI6QCHfk7MJIPpB12hWMWOMu0Jq3SI1Os9crzgRVbM4gq/a/+1MO53HPBa6l
         sz2q2r2b8HUzYSEJOPt500y2AL+Lb2oqEwTY5UtUjG/7vWV72kk3Rtf26RifuvboxoYP
         5+9ZoUt8So8RGliZ+jnuXi8D2yYuhmfrv8k4dRLmk1acO/hMmrAxWLi3VKFDi1gIfX0s
         USaPrQDlV+LR8ML6RdJcIX4hIq5tI9BBVDZeTAgME+J42hbcV6R1NVZZq8KbJ8FTfZuD
         LjkccQuYWLDTUYJREFI/7I3oBqOEM5D5c9g+H8ALLaDuJId56RAVy/YWF7LPpbAo6UXi
         MYsQ==
X-Gm-Message-State: AOJu0YyMOT0t8Clq1YA2kO4/vbi69Fx8zgvSc13Gt5woxUHFwfocVlYl
	YHXuHR6tIQfUv9S8/XbdNP6clf9BFGn1DRovvvi4IPVtiFKNEVbYNKx0CZsuRBNex0ESyHtJitQ
	LAV8TzEjU03nCgLGeNbUNPnnOjP0xGJqy26iXRxq6b7FWFjlZLEpbunzUZjMCT3Ys+mcb+ZhRT8
	hBadpvKr/jwjmM25UwOUWVPN4ycFND6YSaysM0n9EoOAP2
X-Gm-Gg: ASbGnctKKUEGXSgFRrJCqCSMsgkHj11DQSu6RFkt4Mtofbu7rAsudNUHEI//WMV7W32
	Mh40CdBDdXHvtsRwxhQPTyeIFrlQ0W9MshmiQ+Poicc80dQLxQFeRIA7sSALcv1CwilEjcFUQnG
	/JY8d8q+nAx0lrMLYsmGrQ1qBIvbblx7lpe1DqWzYNFFMQpfVmGF1z3tstn5oUgjfJBlRPspZw1
	W+JR+evYfBOOdbaXaNzgbbkWa0XFRbMpkThFjrV/sccD3YFQI9D4BNfn3c2BaSubjsoY35dfDT1
	r5hrChAtCsNiVmyP5FGmluyPgm6dCIlo4uBBnZ6avCs0vmlr+MhW+5bdkPzjdg1DZkXU6Is=
X-Received: by 2002:a05:6000:1888:b0:390:f358:85db with SMTP id ffacd0b85a97d-39efba5edf2mr12256988f8f.30.1745333384391;
        Tue, 22 Apr 2025 07:49:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYU5QEpqjLlj2P54HTbHeGJnwmjYy5OLXepNOJz3GjZvVq3SaKK7+9M8tbDBxZ426uyeOY8w==
X-Received: by 2002:a05:6000:1888:b0:390:f358:85db with SMTP id ffacd0b85a97d-39efba5edf2mr12256950f8f.30.1745333383882;
        Tue, 22 Apr 2025 07:49:43 -0700 (PDT)
Received: from localhost (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5a9e0esm181509965e9.5.2025.04.22.07.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:49:43 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs duplicated for fork()
Date: Tue, 22 Apr 2025 16:49:42 +0200
Message-ID: <20250422144942.2871395-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not intuitive, but vm_area_dup() located in kernel/fork.c is not only
used for duplicating VMAs during fork(), but also for duplicating VMAs
when splitting VMAs or when mremap()'ing them.

VM_PFNMAP mappings can at least get ordinarily mremap()'ed (no change in
size) and apparently also shrunk during mremap(), which implies
duplicating the VMA in __split_vma() first.

In case of ordinary mremap() (no change in size), we first duplicate the
VMA in copy_vma_and_data()->copy_vma() to then call untrack_pfn_clear() on
the old VMA: we effectively move the VM_PAT reservation. So the
untrack_pfn_clear() call on the new VMA duplicating is wrong in that
context.

Splitting of VMAs seems problematic, because we don't duplicate/adjust the
reservation when splitting the VMA. Instead, in memtype_erase() -- called
during zapping/munmap -- we shrink a reservation in case only the end
address matches: Assume we split a VMA into A and B, both would share a
reservation until B is unmapped.

So when unmapping B, the reservation would be updated to cover only A. When
unmapping A, we would properly remove the now-shrunk reservation. That
scenario describes the mremap() shrinking (old_size > new_size), where
we split + unmap B, and the untrack_pfn_clear() on the new VMA when
is wrong.

What if we manage to split a VM_PFNMAP VMA into A and B and unmap A
first? It would be broken because we would never free the reservation.
Likely, there are ways to trigger such a VMA split outside of mremap().

Affecting other VMA duplication was not intended, vm_area_dup() being
used outside of kernel/fork.c was an oversight. So let's fix that for;
how to handle VMA splits better should be investigated separately.

This was found by code inspection only, while staring at yet another
VM_PAT problem.

Fixes: dc84bc2aba85 ("x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

This VM_PAT code really wants me to scream at my computer. So far it didn't
succeed, but I am close. Well, at least now I understand how it interacts
with VMA splitting ...

---
 kernel/fork.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index c4b26cd8998b8..168681fc4b25a 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -498,10 +498,6 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	vma_numab_state_init(new);
 	dup_anon_vma_name(orig, new);
 
-	/* track_pfn_copy() will later take care of copying internal state. */
-	if (unlikely(new->vm_flags & VM_PFNMAP))
-		untrack_pfn_clear(new);
-
 	return new;
 }
 
@@ -672,6 +668,11 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 		tmp = vm_area_dup(mpnt);
 		if (!tmp)
 			goto fail_nomem;
+
+		/* track_pfn_copy() will later take care of copying internal state. */
+		if (unlikely(tmp->vm_flags & VM_PFNMAP))
+			untrack_pfn_clear(tmp);
+
 		retval = vma_dup_policy(mpnt, tmp);
 		if (retval)
 			goto fail_nomem_policy;
-- 
2.49.0

