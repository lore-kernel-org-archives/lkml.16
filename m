Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29627D76B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349905; cv=none; b=nqws5HPDOshrk/UTwJtU8s5Ti/3pnufaTKXBw5dfDrqSzRY0UGwY+EDNMhcZ1Gz6taTEuyBfRLioMRz2Nw4kqaaBsoKKvRhJt8Tc6kyNQe0GOeGh5ek6MvhKEsT7jDxOJ35kCkcduU+o//61xmR5oGp3pXgByoHVWECw2gC7ITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349905; c=relaxed/simple;
	bh=TF+XebwJvvdeT9IG4RgGrQ9qVJIp8O5Lolk9ooYlRp0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XgZqtUfGNIYiFhcoOO4oKa5SGlXA2ft/WDeebFNJTnXJwiL4/NtlWnEagRWurjoFFyNmsrh3ZWoq9oW/d9USeL8JGmzEgSAbZmxqChqDpzJ3cXlX6ZOtewNbo9BDMwom1OtRfZlCVucRipHgdcDKCDJtxMUeQtmXYkD6NrC4yD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p6MiAcK6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p6MiAcK6"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff6943febeso1318216a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349903; x=1744954703; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ8M8ey1Gl2HMhesfO/gX2yR3JwZ2sRCN/VQXFdpiJQ=;
        b=p6MiAcK6h86OfdgsID+ujjpbcS/LPSrq0dTNccUl4U1dXhjaBg5ThqATAxQlFgCayu
         WpWCu+/ZxWZQx/BD9maM4QEOyq6flhWpczUKsqcRI3JoEBbEr/+skViYgPh0rswkvsG3
         mvYtQEI3mVp+gdpc/5igi5FqO9wP92PRhAgopDuaMKM50Cq0dq4gHtXxFRLFxA6VyxhO
         5Y4FRbJz36FXXt/b6LE6dQiIfOfcKsFHkuASxEaU5UV61d/7w3J2CKBucD+rMs2rskm3
         ONA9zAWrx2Kx82M9zyaVud7RwshvLaGREHw5Ckl6pNReX7io68R5KxLkFag2VOzxxXUJ
         /1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349903; x=1744954703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ8M8ey1Gl2HMhesfO/gX2yR3JwZ2sRCN/VQXFdpiJQ=;
        b=hh5gVbsJn+l8ZV4MZz/z9mra3LDL7bG0GHVtCPFjg99+YK2WtpH+oPV9vnB1SolZSM
         o/Akc2pdgK50baFr5ShJjGSNdoFUmSZwm2Cgln30QeuwAPJRejTVg+Z/89ADh4Ibt33N
         7/BRewPsC3aprF1JRkVO9h09HOJKMojZhl7EpACdHjJNoTClM49C1nK3s2JjIVOcPiOK
         hYQrbLJdptDpg8P+mXU4195GpDcnIv9bLQXQpiUD7bxSZJT3d+mzp2fF51F7ogqpoF6R
         wmIpuvKCXEfxz10Q5/oUl1BRJaCLzdZqxSyzYp2TjIwl2nbWV2CsGAtz1lOq428M6GV2
         +0tw==
X-Gm-Message-State: AOJu0YyNxDHeZbp7h0P0mLPYaViiKg9Cjuz9E9RXZMfsQhlmjFergdFa
	FIUO5oIiy3vfuGAvsT1jiboK3lfzYsHqi5Vz6T1fsU/i1zIFFfl/q9cOya5/LibQFYasxHiW78V
	ytxVHrgczji/29JiU9RNOFgqSuuwRav67FIHBpZB7+09v7kHa91YuzDPxYpgBPOFQkg9qTac8Xk
	6IQftmGoKLEFtN4IrDF/G8h4Y/C8G69oI1KlMaJY598NGv/YM2VXohpqr7McoqOQ==
X-Google-Smtp-Source: AGHT+IEQLxxV+9EOL9iBdjttC+lt0gaa754ZypvrGgSETMYeFa4LebcqyNIPVN8012BWASehCUTqTktaMea5N6/C
X-Received: from pjbsg2.prod.google.com ([2002:a17:90b:5202:b0:2ee:3128:390f])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:58cf:b0:2fc:aaf:74d3 with SMTP id 98e67ed59e1d1-307730fecb0mr7763347a91.4.1744349903054;
 Thu, 10 Apr 2025 22:38:23 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:34 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-4-changyuanl@google.com>
Subject: [PATCH v6 03/14] memblock: introduce memmap_init_kho_scratch()
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

With deferred initialization of struct page it will be necessary to
initialize memory map for KHO scratch regions early.

Add memmap_init_kho_scratch() method that will allow such initialization
in upcoming patches.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/memblock.h |  2 ++
 mm/internal.h            |  2 ++
 mm/memblock.c            | 22 ++++++++++++++++++++++
 mm/mm_init.c             | 11 ++++++++---
 4 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 993937a6b9620..bb19a25342246 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -635,9 +635,11 @@ static inline void memtest_report_meminfo(struct seq_file *m) { }
 #ifdef CONFIG_MEMBLOCK_KHO_SCRATCH
 void memblock_set_kho_scratch_only(void);
 void memblock_clear_kho_scratch_only(void);
+void memmap_init_kho_scratch_pages(void);
 #else
 static inline void memblock_set_kho_scratch_only(void) { }
 static inline void memblock_clear_kho_scratch_only(void) { }
+static inline void memmap_init_kho_scratch_pages(void) {}
 #endif
 
 #endif /* _LINUX_MEMBLOCK_H */
diff --git a/mm/internal.h b/mm/internal.h
index 50c2f590b2d04..a47e5539321b4 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1121,6 +1121,8 @@ DECLARE_STATIC_KEY_TRUE(deferred_pages);
 bool __init deferred_grow_zone(struct zone *zone, unsigned int order);
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
 
+void init_deferred_page(unsigned long pfn, int nid);
+
 enum mminit_level {
 	MMINIT_WARNING,
 	MMINIT_VERIFY,
diff --git a/mm/memblock.c b/mm/memblock.c
index 3a213e2a485bc..c2633003ed8ea 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -946,6 +946,28 @@ __init_memblock void memblock_clear_kho_scratch_only(void)
 {
 	kho_scratch_only = false;
 }
+
+void __init_memblock memmap_init_kho_scratch_pages(void)
+{
+	phys_addr_t start, end;
+	unsigned long pfn;
+	int nid;
+	u64 i;
+
+	if (!IS_ENABLED(CONFIG_DEFERRED_STRUCT_PAGE_INIT))
+		return;
+
+	/*
+	 * Initialize struct pages for free scratch memory.
+	 * The struct pages for reserved scratch memory will be set up in
+	 * reserve_bootmem_region()
+	 */
+	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,
+			     MEMBLOCK_KHO_SCRATCH, &start, &end, &nid) {
+		for (pfn = PFN_UP(start); pfn < PFN_DOWN(end); pfn++)
+			init_deferred_page(pfn, nid);
+	}
+}
 #endif
 
 /**
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 84f14fa12d0dd..1451cb250fd3f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -743,7 +743,7 @@ defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 	return false;
 }
 
-static void __meminit init_deferred_page(unsigned long pfn, int nid)
+static void __meminit __init_deferred_page(unsigned long pfn, int nid)
 {
 	if (early_page_initialised(pfn, nid))
 		return;
@@ -763,11 +763,16 @@ static inline bool defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 	return false;
 }
 
-static inline void init_deferred_page(unsigned long pfn, int nid)
+static inline void __init_deferred_page(unsigned long pfn, int nid)
 {
 }
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
 
+void __meminit init_deferred_page(unsigned long pfn, int nid)
+{
+	__init_deferred_page(pfn, nid);
+}
+
 /*
  * Initialised pages do not have PageReserved set. This function is
  * called for each range allocated by the bootmem allocator and
@@ -784,7 +789,7 @@ void __meminit reserve_bootmem_region(phys_addr_t start,
 		if (pfn_valid(start_pfn)) {
 			struct page *page = pfn_to_page(start_pfn);
 
-			init_deferred_page(start_pfn, nid);
+			__init_deferred_page(start_pfn, nid);
 
 			/*
 			 * no need for atomic set_bit because the struct
-- 
2.49.0.604.gff1f9ca942-goog

