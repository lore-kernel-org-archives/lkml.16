Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE8270ED0
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776820; cv=none; b=fbIxPMHXj1daBPODF8pmcA0Q2j/Yhw8OyO82gKdrujiOHzGk89sLHtxAIyheM3fTCCoDa1tblfOdA+VG+iRc6wUBpEKDGA0X24ogxs3IFOx7GxsRHvE/dU3s+WuVXglz3VgtoajwDNUnaVWEIgZCGHFAE+RLGT7YAkg7RLYVaDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776820; c=relaxed/simple;
	bh=dMDfulpkBuscszqTIMzyk2Rxr2j8nTLTxNTwuOB/CwQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g4J27aVK2+bO58bU1eIRB2GSiLrBMMR6JMDzmUxbWcjpp9LWRNPNOdeaRiZk8oZpfxmV50kEFh4g6xLQ7NivCHH8eR21J+AH5klX63Xa/bszKAciSz0j6XBdak1LQIenbbF7u/01JrbFGiptuPL4vutNoYtyx/fhX+YukQHUook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxIqI1wJ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxIqI1wJ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso1092244a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776818; x=1747381618; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JV2egkEexGC2KVdW3wwgddRMOlB2ZWufNhl8IHgg18=;
        b=fxIqI1wJEzRhekFvWjSjnQ5TIqym9/WFlSxgjuvjlKxGPSnum7XzGD+dvZU2lgvUy7
         o2o/VUAE6WRIZxFMP2H+Ui4xd/O4umGVeMqGj0C/HKs6hNjeFD+Ki0o+Tc/40+0xKjNM
         MG6mHa+HXvLQkDB5hBe17Rs2YYLWS0pUPpTDuRsJDc7ehqwHQL1UfrB7t1epFZK3lVG3
         yhJoIB02ctE3wtjtGIb0U5XTyOEOWALbiaemVgJpe6GWrik64rwX8FWLWqfIOOwCtctF
         IsrPhUTwol+c2nBfRbd6UZnvNiNiC8/7UbPSIroq2h+RXo/iq8chPZAvvzK2csWmzqqZ
         gAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776818; x=1747381618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JV2egkEexGC2KVdW3wwgddRMOlB2ZWufNhl8IHgg18=;
        b=BuMXhV56U22GGbmI5oTcghUXbtAmJaNb1mPXY4cr9FSflJVzB9vOBmJpv77dI5BUSr
         4ROqnhBMDxGRUTrq0AHZ1dJMeG6N6xv9Q36U68andZ1Sc6jpsJJUAHcjyiImn28z0hDf
         roHtVMod7CRgAKn0Hdtis1m+S5GgsfvgZA5rjqLjTxJL5mVoY0fG7jmvNfcj/XCykRVl
         a+PFkCf04FzjDuVkyJXTQnVka5lhiXBFf001ET7hIbnjsH7H8842z60VnnbEem9RZhS+
         vWfEo7mCekYeQJU5xIFgnjvsPM+UsvEepEk845spA6hUWq3WAJeuoB/A5FjHubSaOiKf
         c9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCkAgqLD/wS6L8cm9ciXxFcSyb2faBJZZx4zEnRzNnS1cCZnvI+WLHBqZnFAHBBOkhiwGfybfH5ITQz2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXJwhiUiOThVOiRp6wr5o2eT7JtZZ2dk6JAXYjlnfLMLVjfMT
	PRWaN4kY+XqsDiLIOBc6xnTVtW/H/5XmLBSx8YMWIpIQg9N7Y07qe64HT0/MU+X97goKMDr/NIF
	7vL/TUNwZHJYXR+54CQ==
X-Google-Smtp-Source: AGHT+IE8BHG0gIhtKMP95nkOnFyM8l48yB2kt14KYWpJX66kgx1Q1oJi29flkDnsQNF/jOCJx+09Qacohn+DYiah
X-Received: from pge26.prod.google.com ([2002:a05:6a02:2d1a:b0:b1b:caa8:2ec9])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:158d:b0:1f5:64a4:aeac with SMTP id adf61e73a8af0-215abd23d71mr3064222637.33.1746776818314;
 Fri, 09 May 2025 00:46:58 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:21 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-4-changyuanl@google.com>
Subject: [PATCH v8 03/17] memblock: introduce memmap_init_kho_scratch()
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
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
index e9695baa59226..acfcefcbb6c03 100644
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
index 6eba0dfe87155..b9148822db7aa 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -946,6 +946,28 @@ __init void memblock_clear_kho_scratch_only(void)
 {
 	kho_scratch_only = false;
 }
+
+__init void memmap_init_kho_scratch_pages(void)
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
index 9659689b8ace0..128c100fdb977 100644
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
2.49.0.1015.ga840276032-goog

