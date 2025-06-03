Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30474288C18
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974878; cv=none; b=I3jt9ZKVFIX6eS2eI2du1wPzJ6lkXMGgQdynwqCexOR3XPJeJQocnGmbxf9mJlGX9H7QMGL+vNJpeAgqi5bk124z47TtAKpZpyPNW6eTADL3xcwxire1xLdX0TKNZTt/XlOmrfR1Sb9HptLVueNLmJfnMn7KgI0IW75VFqb0Fjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974878; c=relaxed/simple;
	bh=OGF9m/jNWboG8Z+nO8GMpoB9VT0bZx04UFOjYYe+6k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfh9Bw3MUcieT/HmxoxCcpSiv6VNhu4Y/QIkAkH5HpxMpxho1I3wNHezwx2xM48/bm9MsVxa45U5odEmvEjMg68OBv0eEwDFMZcLWLbuH0nw1WnbLZW5nJwhNtG+WwdkMEQ1ILrsaQuizFONgkCMjLuY9Y0ZPEvVSnRUfrr1mYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kuXt9HrH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kuXt9HrH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-443d4bff5dfso8335e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748974875; x=1749579675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJxZWd2oON32+C/P/o+oaXjFrBdmaU/Nx+hYiqQI4Yo=;
        b=kuXt9HrHIgkS4DpXDeFzUcM3vevteTHuM/0XJOZtlCzNWLtibCF6CcHMdQdW+fTgWP
         j5oJiSf0rgsOfqquTFYEKa2RPqexbPVmd67nxz6T735OEcqKL474Ee3F0r4u9vHx/uCl
         s7ttfRgvQXVOXZucEa7aQ8la0S5WLPTg9ienTVI6jJCRVpqqV9pfvaJkTQfrHhsuYoU1
         LL/suSAwxQGvuuQdKDpUulekXcMmQ1o6h/822j82b+pxqLYpVdx8zGN4gH7+L2sCh8su
         v9qEDVWWLBbcfxHsmxXLbQYlp7j2MyZ0E2TaPrVRzhwtky20a/HMbzxUeJYD9gYJJQCZ
         4g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748974875; x=1749579675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJxZWd2oON32+C/P/o+oaXjFrBdmaU/Nx+hYiqQI4Yo=;
        b=JS6kRoiGZius/ql0MwCmT5jH9vHzAUmIIAfxUTBo7bgiiF9HlJcIIdnCEjcTr0CRCf
         L2QnEC6BaedWeY6XfjPBZHAB1UE4jn00IDexZ/sDnIOwAKPp6cjOccLS7wHYF4ReP3be
         7mo2UttbZK9eIQMF/j6Ipz2qaGF2xwr00Df9GKDIL+puwK7STV6utv9tsW+m0OIfJzrw
         bYv+XHwqKknakvUuCx7QcIDFXtgZYcJcZbupBxWrmghE6uetZGuUjGT/5xMXQRMl6YBi
         I3NraFmOIrP96zFbJgZtndJsh/p7deJLVj/GCKVFB4vd+li8eQ52PSrYOk2c9hkIg0VD
         iU2w==
X-Forwarded-Encrypted: i=1; AJvYcCUE6FgK5K7wSqsFs88b3Ea7A1P3s5O7Tr1mjY5yzU8c0rZNbFBOX/TDjHPEFnOPeEO6rDp/w5kLXksRSOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy22o34Yl3MbO/rQfizhKrJAc45pNq0GDTr/GYUwJzxgyII0Ksb
	N6zaqyyGCbsFRmPiS7vO5mDyePXOHW23/bnf6u+uw/dinnDJuGdwGtAyh3C7Iwl+eQ==
X-Gm-Gg: ASbGncvJRhCtFB/XT1uMGF06dQ0sig7+U5eLno7NU4rgATzeXYKjCbFX31Mg4yO1c16
	qCQYSACa3O1Ah+JhpbojzvZyXXgB4+ucSuu6Lud4ytEosVyx1YXkaMkd5LZjp3fOGp6BbvgdG5X
	e/R4ex238CFx8XKmyr0AhEkduP0Ug3A02j+UNexaN25hQhqmOdASiIXH2jLhbNU7LIa+hQYQRvL
	x03ki0xsRsFvTGdMY3ZC7oPA+A3p6CPvanatwSgPw7eo1hucAn+CtKbx0i9Mi4p6PVvMr0zqo6x
	3AvARlGh9opTxcDyvw5PPa1IfqBcSDr4L9e694MMlFBzYYUN
X-Google-Smtp-Source: AGHT+IE1TGvwXvSf9mIQx7ZxRpLVIxCJeIzDou/MXYqzEUxiQk3yVBHKzt5B8Btl5hNaLFX04/nmOw==
X-Received: by 2002:a05:600c:a49:b0:43d:409c:6142 with SMTP id 5b1f17b1804b1-451ef81dd27mr74125e9.0.1748974875095;
        Tue, 03 Jun 2025 11:21:15 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:796:935b:268f:1be4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe6c79dsm18650595f8f.25.2025.06.03.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:21:14 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 03 Jun 2025 20:21:03 +0200
Subject: [PATCH 2/2] mm/memory: Document how we make a coherent memory
 snapshot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-fork-tearing-v1-2-a7f64b7cfc96@google.com>
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
In-Reply-To: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 linux-mm@kvack.org
Cc: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748974869; l=2753;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=OGF9m/jNWboG8Z+nO8GMpoB9VT0bZx04UFOjYYe+6k4=;
 b=2MuDrm48JsFni0apxBFkaKLPnRUrZmcHQjpwBWkSbQbDPc2LVAXCkVf9RBfBPkm4SkMTD2VNE
 u9bUkTThkaHAtVzyvP83uLkgL8+MojazrYEAiEbtYi0/IQZKIWmcP9w
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

It is not currently documented that the child of fork() should receive a
coherent snapshot of the parent's memory, or how we get such a snapshot.
Add a comment block to explain this.

Signed-off-by: Jann Horn <jannh@google.com>
---
 kernel/fork.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 85afccfdf3b1..f78f5df596a9 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -604,6 +604,40 @@ static void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm)
 }
 
 #ifdef CONFIG_MMU
+/*
+ * Anonymous memory inherited by the child MM must, on success, contain a
+ * coherent snapshot of corresponding anonymous memory in the parent MM.
+ * (An exception are anonymous memory regions which are concurrently written
+ * by kernel code or hardware devices through page references obtained via GUP.)
+ * We effectively snapshot the parent's memory just before
+ * mmap_write_unlock(oldmm); any writes after that point are invisible to the
+ * child, while attempted writes before that point are either visible to the
+ * child or delayed until after mmap_write_unlock(oldmm).
+ *
+ * To make that work while only needing a single pass through the parent's VMA
+ * tree and page tables, we follow these rules:
+ *
+ *  - Before mmap_write_unlock(), a TLB flush ensures that parent threads can't
+ *    write to copy-on-write pages anymore.
+ *  - Before dup_mmap() copies page contents (which happens rarely), the
+ *    parent's PTE for the page is made read-only and a TLB flush is issued, so
+ *    subsequent writes are delayed until mmap_write_unlock().
+ *  - Before dup_mmap() starts walking the page tables of a VMA in the parent,
+ *    the VMA is write-locked to ensure that the parent can't perform writes
+ *    that won't be visible in the child before mmap_write_unlock():
+ *      a) through concurrent copy-on-write handling
+ *      b) by upgrading read-only PTEs to writable
+ *
+ * Not following these rules, and giving the child a torn copy of the parent's
+ * memory contents where different segments come from different points in time,
+ * would likely _mostly_ work:
+ * Any memory to which a concurrent parent thread could be writing under a lock
+ * can't be accessed from the child without risking deadlocks (since the child
+ * might inherit the lock in a locked state, in which case the lock will stay
+ * locked forever in the child).
+ * But if userspace is using trylock or lock-free algorithms, providing a torn
+ * view of memory could break the child.
+ */
 static __latent_entropy int dup_mmap(struct mm_struct *mm,
 					struct mm_struct *oldmm)
 {

-- 
2.49.0.1204.g71687c7c1d-goog

