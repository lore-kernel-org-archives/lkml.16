Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0D267AEA
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140116; cv=none; b=qdLdMmIbbP91sO3YC9eac68770TkoxanAkdPQRW39NkpMMZJBHoOQeVsOXVWTuF9kl6B3loaH0eq08dVX4X8ycnHOuY+wy2WifssO7iyEeZFpLpUdklxNgWNeC7P5pbi9PeUbm4J3Gx4XwzU7VEu0u95Nxh8Kfh8dy4vtO8MChw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140116; c=relaxed/simple;
	bh=DjkyaabI8S3sYdPbumLk0oLt4xT6sIysI2taOcvcejo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QlZf4JvwaUqoUYjXg4Go1IQugG403UsxBDnYUHEvWwb/MAyeHX8Qd+XLJD2m4dAeUMovtk7b3CSnPvd1yw8L+VmxbNftzc/zIi7E8z5/i+t3gX5fFwaSJqrHUc+8fx4o2OGcqqgvyDykea+bHSTlH6cuWC5C/7gb6YVx7qa5TqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tcKnB/5c; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tcKnB/5c"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22403329f9eso11430915ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140115; x=1746744915; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PU6GtX2pwIoZ+oeXsFDcea4JO+KvjjzbgnTTu1rA7Xs=;
        b=tcKnB/5cvyl/gALTtB57Fde95OTdicgM2mDVYBhsdroFFAxf2eXdYOO4dADugYtIzY
         zk9o6G81a2te3RJZtvR+/RPn0QRTSFU01FwOVCJsHFNk93TAa32WyoV5WEa/krM7eSKQ
         JNfKI53Vk69gUPopdNki8NVCpUQvYfmqdTf5najFzV8LEZ/gURHRjGZdTbpLRosT9NtJ
         O1TtPnsTVXeBob5Nb+6O/bk0btJzz4wtUwrlGfv2eA4SxyTcPbhtuZPo+mM7lDfLvNcB
         gRLSmNg7nXUxTJTMdWJlF8XO1NALD6Dn/Wg6ODLT+oHfTwB8+mfcWHtQFX9bHILRSlzx
         0/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140115; x=1746744915;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PU6GtX2pwIoZ+oeXsFDcea4JO+KvjjzbgnTTu1rA7Xs=;
        b=KjAr4lsex34/Vma10YXG7bt1uBptQGf3UFDeOpT4iRXbxHFJDzYb6rQ/MwkV7nkdy4
         Uk59yxoHcImK7rbIySf0QBriyeV3ncpgi8YGBKveB49U/cuafmLJKcBIsPi8NXaw7JKC
         cE808GsKSIGAERZIEhuRMVULo+oPou5pbJldRxWiSftnn9IhpwO3e3/PykSD5CN/Rql+
         Mc9jnknOfBdvwQHyEdzlZANTaj5O6cuQLd3ZYyx0YMCsPEmWpC1g60PcrXMfvZU92ZzH
         R61ldWzYYPtLVnc4lB8cP0hMb8E1XeWWpJHINw0eW7i6tD1DWGxOWTOEIbPQmH7GZ3jX
         vx2A==
X-Gm-Message-State: AOJu0Yz9MtaMT/N5KqRnOquDFdq1fpWbH1JNtrBggB/ip2FOZMqPLrkB
	zxXzELT0vWX39u5JS0jYZA2c/CZfTi0Jx/AD3FqzA5XXgb4ioFUzUU/6rvPMMP34PxxpCzDZtoD
	umvBuzgStU8blSi8SoDSn9giDYwlXa51bqH/M3ZrLxHYEpu/i0H0gzin8xRSkN2zCkzOSSD/fAJ
	FW5uNA8BP/3lf9Smdd6i1dfb3mgXjZAbg43sF5jI6NdHoQq9gkORun7JUGlKl3XQ==
X-Google-Smtp-Source: AGHT+IFpAiNl+3FkGzd/ZjF3I8ZI1ZYYyAMk4qubhYhnEjGbgwWF72zcJID/AaxklWlETZc79qrz2DC4EU5jSuqH
X-Received: from pjbqc3.prod.google.com ([2002:a17:90b:2883:b0:2fa:1481:81f5])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2450:b0:224:1935:fb7e with SMTP id d9443c01a7336-22e10342da4mr11671725ad.24.1746140114125;
 Thu, 01 May 2025 15:55:14 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:10 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-4-changyuanl@google.com>
Subject: [PATCH v7 03/18] memblock: introduce memmap_init_kho_scratch()
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
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
2.49.0.906.g1f30a19c02-goog

