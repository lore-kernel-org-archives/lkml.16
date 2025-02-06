Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860931EA7D5;
	Thu,  6 Feb 2025 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848528; cv=none; b=pGaQQBcxgCUFMVleVUaFN5Wf5C8hx9KyZvE9/88kCt0cU5DiQzYLnnJPEXikNG0QEFUkMXfb5P8vWaDXQyJ4VmeaXfhwaUN7CHKzKugKbOlxHBoBWSw5NzrZMvucaEYe72dYmWd+Peb+EQ76eYpq0NVer7gDWUvumuavjoG7XZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848528; c=relaxed/simple;
	bh=vZ2oVKwNk81LIKw4K9tDNq2MhirLQhNrcfqw+4p4mWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTPeARFa4YtECgx8gvcOE4IfQwRM/KYPs/5nWMrPV+Q8oCeCoBfJ6GchU+1DtIMmwi4P1IhlaPAErIICd2UMokAYpVkYKME384tWrZISABlPe8MjBzVja1dPClJda3HgfHgt4XQw7K5qcsQ9WqAVYMiFCwQ2m6wlnkPYYJuTCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iP52aTjs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iP52aTjs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFA4C4CEE6;
	Thu,  6 Feb 2025 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848528;
	bh=vZ2oVKwNk81LIKw4K9tDNq2MhirLQhNrcfqw+4p4mWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iP52aTjsSBe2LDTe0pnAzCseffHQfiiXLdkCZ6YMmfdqtWu+xXwHKeXFw5hn0E2tQ
	 3GK9EJlIQnIlmzDV1l5xvcVpE+O9OEg5NhBeupMsH69YOSFfRLWkuti9O2ZZ9XTvEi
	 KELxGS/6NrXc3HXJgWAq3t43QkPSlgM70G8Sm6B9VHfcpUtPqBkJzN9UbM348fuIIl
	 XoZYpln2ARsIgWzPR+jTMVjM0ni8Kkgt1Y5pPt07cmB2c0Jcs8s+AR4y8KZzMHfxO0
	 GVVM5EP/C+/iQXBAp2JMJS8wBwuEveVCeEXRYQxJzEbX7AmM1lgqXq0u3RHW0mm+tG
	 6KRAnJV2bv4fA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v4 04/14] memblock: introduce memmap_init_kho_scratch()
Date: Thu,  6 Feb 2025 15:27:44 +0200
Message-ID: <20250206132754.2596694-5-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

With deferred initialization of struct page it will be necessary to
initialize memory map for KHO scratch regions early.

Add memmap_init_kho_scratch() method that will allow such initialization
in upcoming patches.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memblock.h |  2 ++
 mm/internal.h            |  2 ++
 mm/memblock.c            | 22 ++++++++++++++++++++++
 mm/mm_init.c             | 11 ++++++++---
 4 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 14e4c6b73e2c..20887e199cdb 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -633,9 +633,11 @@ static inline void memtest_report_meminfo(struct seq_file *m) { }
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
index 109ef30fee11..986ad9c2a8b2 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1053,6 +1053,8 @@ DECLARE_STATIC_KEY_TRUE(deferred_pages);
 bool __init deferred_grow_zone(struct zone *zone, unsigned int order);
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
 
+void init_deferred_page(unsigned long pfn, int nid);
+
 enum mminit_level {
 	MMINIT_WARNING,
 	MMINIT_VERIFY,
diff --git a/mm/memblock.c b/mm/memblock.c
index 3d68b1fc2bd2..54bd95745381 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -945,6 +945,28 @@ __init_memblock void memblock_clear_kho_scratch_only(void)
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
index c4b425125bad..04441c258b05 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -705,7 +705,7 @@ defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 	return false;
 }
 
-static void __meminit init_deferred_page(unsigned long pfn, int nid)
+static void __meminit __init_deferred_page(unsigned long pfn, int nid)
 {
 	pg_data_t *pgdat;
 	int zid;
@@ -739,11 +739,16 @@ static inline bool defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
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
@@ -760,7 +765,7 @@ void __meminit reserve_bootmem_region(phys_addr_t start,
 		if (pfn_valid(start_pfn)) {
 			struct page *page = pfn_to_page(start_pfn);
 
-			init_deferred_page(start_pfn, nid);
+			__init_deferred_page(start_pfn, nid);
 
 			/*
 			 * no need for atomic set_bit because the struct
-- 
2.47.2

