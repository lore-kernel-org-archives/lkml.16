Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676AF17E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749598271; cv=none; b=ZnMgMqbJDRqGqRa8c3w6EAPgVNJ5YLhbTN3EbEyevK0ivMk9VABgNvEUlOrcQpb/mhFMCGb7KPlQiNWZmRRT5l/NwGDN0YrzBSzID5K+7ooKXsqdbik8OoQNmp+0sjcjRLDBgiMypdXZY+MDRfb4nH0q8F2tJSSQVcalNL41COo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749598271; c=relaxed/simple;
	bh=51jMNg7QCfcy52IVUkJv2nx6KagQi4Qj/41JyPIpXMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QLGX9z/6CBPCGC/YLU0iLI3G88RXKb+1pOkWw9YCwm2TIqVjHSu5LfI1c/HthNNiJwSMkqjeOfj6d58QIzdOyqE5sOmLGJVCjHnBuvaQceRGMTWDwYDv4rqhbxszYf0jmqGnmLoND59mm9r2JlsTCNK1yslAPa4ndA005yCrfw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ZhFGC5ee; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ZhFGC5ee"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742b78afa2eso294b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1749598268; x=1750203068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed3VIEoLVqvPAdYZ4ITLaB5nTf3oTxM0fD61quOvqcY=;
        b=ZhFGC5eedEf1TV4jFEShUjof6faHF+KZzyLQnPJQwzKfYzOlsdzB0duC4TDatmJ6cj
         qm9iEVCZZQOTTjg2CSKWQd41x+4fATY5BmlLOF502sg3gzifSzt3vL5n7wjKINuy0zfz
         RXmC1EPeApCUjK75Y/XXwNFx+Bc3SSS3wgMF9LVy3yJ7B2xAqF+fcVAzwTyr4BlJJG+8
         9wo9xDQeWMns/NybP9mypUkHIrmnYzeGIGLKGlbTKEUUMWf4Fhu7dVkUZVsSZeEpCK3M
         g7vSfVAyF06uel5p32IF54KJsNpm1lDfmj7wtER4Q+215oUVePjk2KZvbuHWzRFdXaYE
         NFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749598268; x=1750203068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ed3VIEoLVqvPAdYZ4ITLaB5nTf3oTxM0fD61quOvqcY=;
        b=h8EYRNHn8HTxSQcCyKsnbubYnCsTUpLScve+VpnPnPKBWp/sB4vxITZgZS9XWS7ZWI
         p7J/2hxY6SjhMyCx9qu89v/uR52RfkLc5W4aPWge7PuQBViAO2thnIZmtYSTkxEHczd8
         l339lbX+K9MibbOk5Ic2wFiHPRfXK6AsfGKqQYpMIskabS8BhO70tOBBKO4bQqAZ+316
         BjucFYobhbGUbzfQ8D+DoZLRpzO3kcigOhTKxYT8fxYEFYg2p6g3wuSCaQBXZZyxVYlq
         R9C9GtHA2tWPx3MNKIe2kJpzXwqwXw148rjHMKps2ORZkVJ+vSI7W0lq9W5e/rK1sawQ
         E+UA==
X-Forwarded-Encrypted: i=1; AJvYcCV/TNsh7FVh/TXMYc1FKkEPxLBC3bKSYuKz9U8LayibEXp36+mYBS12ORzY/92l13DznaYqFse4OvnYU4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVIVessAj1/9KDPTcP77/CJ1h3NrDYM+UD0Pk+kqbrpDk/vqNp
	U0QcXQAbb2nLMV+W5Yq+cYYU6XtsIUHRisIdTw7SIyYCDL0bSXUUdMQXy9wlQRodyAE=
X-Gm-Gg: ASbGncumqmJisOiaz/FOFRQQKxD92iUK4O8Z5T8Z5OWKiJYAczJxlp9RxGkdFXZKQPV
	a3QX2sZdui4EVNyyaxPz9Bzzialkx3h3baL7rsKh7a7tfqG6S5NShcFZAU5gJkKCqwjlfv43EPG
	3XPay7CGh7up+7aZnYtFg/pAGTBmaa/NZDnaKIEJ6kByppXZg2tRZHlUhuGpmG4Eqa+kzVcAgqc
	txAuLxZ3/OcGSR3R8kVZDW5XwZ13L9f3sda74C8zPcYLd7+76hYao5pEzWrqvHO6plE0tkG/zUA
	/38MhlbQ3s2PGsoCcC90IJl1ITAsfobHGE2oKk3fH1kS3uCQbkDtH6S/5doSUJD63Sh1A/IPNui
	3Z1FXMH0hmqP/SZiMGFRAZpc/pac=
X-Google-Smtp-Source: AGHT+IGosvv1m0UVxCB4ULx4erWMiXLgDX/bChkvR85moBts3RV/ENepAGQW6DUsbawi4Y2NH2msIA==
X-Received: by 2002:a05:6a00:6501:b0:742:94fe:c844 with SMTP id d2e1a72fcca58-7486cdf6c90mr442738b3a.4.1749598267443;
        Tue, 10 Jun 2025 16:31:07 -0700 (PDT)
Received: from dev-cachen2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482af38307sm8226286b3a.14.2025.06.10.16.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 16:31:06 -0700 (PDT)
From: Casey Chen <cachen@purestorage.com>
To: akpm@linux-foundation.org,
	surenb@google.com
Cc: kent.overstreet@linux.dev,
	corbet@lwn.net,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	harry.yoo@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	yzhong@purestorage.com,
	Casey Chen <cachen@purestorage.com>
Subject: [PATCH] alloc_tag: add per-NUMA node stats
Date: Tue, 10 Jun 2025 17:30:53 -0600
Message-Id: <20250610233053.973796-1-cachen@purestorage.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for tracking per-NUMA node statistics in /proc/allocinfo.
Previously, each alloc_tag had a single set of counters (bytes and
calls), aggregated across all CPUs. With this change, each CPU can
maintain separate counters for each NUMA node, allowing finer-grained
memory allocation profiling.

This feature is controlled by the new
CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:

* When enabled (=y), the output includes per-node statistics following
  the total bytes/calls:

<size> <calls> <tag info>
...
315456       9858     mm/dmapool.c:338 func:pool_alloc_page
        nid0     94912        2966
        nid1     220544       6892
7680         60       mm/dmapool.c:254 func:dma_pool_create
        nid0     4224         33
        nid1     3456         27

* When disabled (=n), the output remains unchanged:
<size> <calls> <tag info>
...
315456       9858     mm/dmapool.c:338 func:pool_alloc_page
7680         60       mm/dmapool.c:254 func:dma_pool_create

To minimize memory overhead, per-NUMA stats counters are dynamically
allocated using the percpu allocator. PERCPU_DYNAMIC_RESERVE has been
increased to ensure sufficient space for in-kernel alloc_tag counters.

For in-kernel alloc_tag instances, pcpu_alloc_noprof() is used to
allocate counters. These allocations are excluded from the profiling
statistics themselves.

Signed-off-by: Casey Chen <cachen@purestorage.com>
Reviewed-by: Yuanyuan Zhong <yzhong@purestorage.com>
---
 Documentation/mm/allocation-profiling.rst |  3 ++
 include/linux/alloc_tag.h                 | 49 ++++++++++++------
 include/linux/codetag.h                   |  4 ++
 include/linux/percpu.h                    |  2 +-
 lib/Kconfig.debug                         |  7 +++
 lib/alloc_tag.c                           | 61 ++++++++++++++++++++---
 mm/page_alloc.c                           | 35 ++++++-------
 mm/percpu.c                               |  8 ++-
 mm/show_mem.c                             | 27 +++++++---
 mm/slub.c                                 | 11 ++--
 10 files changed, 156 insertions(+), 51 deletions(-)

diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/mm/allocation-profiling.rst
index 316311240e6a..13d1d0cb91bf 100644
--- a/Documentation/mm/allocation-profiling.rst
+++ b/Documentation/mm/allocation-profiling.rst
@@ -17,6 +17,9 @@ kconfig options:
   adds warnings for allocations that weren't accounted because of a
   missing annotation
 
+- CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
+  adds memory allocation profiling stats for each numa node, off by default.
+
 Boot parameter:
   sysctl.vm.mem_profiling={0|1|never}[,compressed]
 
diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index 8f7931eb7d16..04f5beb44ef9 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -15,6 +15,8 @@
 #include <linux/static_key.h>
 #include <linux/irqflags.h>
 
+extern int pcpu_counters_num;
+
 struct alloc_tag_counters {
 	u64 bytes;
 	u64 calls;
@@ -134,16 +136,34 @@ static inline bool mem_alloc_profiling_enabled(void)
 				   &mem_alloc_profiling_key);
 }
 
+static inline struct alloc_tag_counters alloc_tag_read_nid(struct alloc_tag *tag, int nid)
+{
+	struct alloc_tag_counters v = { 0, 0 };
+	struct alloc_tag_counters *counters;
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		counters = per_cpu_ptr(tag->counters, cpu);
+		v.bytes += counters[nid].bytes;
+		v.calls += counters[nid].calls;
+	}
+
+	return v;
+}
+
 static inline struct alloc_tag_counters alloc_tag_read(struct alloc_tag *tag)
 {
 	struct alloc_tag_counters v = { 0, 0 };
-	struct alloc_tag_counters *counter;
+	struct alloc_tag_counters *counters;
 	int cpu;
+	int nid;
 
 	for_each_possible_cpu(cpu) {
-		counter = per_cpu_ptr(tag->counters, cpu);
-		v.bytes += counter->bytes;
-		v.calls += counter->calls;
+		counters = per_cpu_ptr(tag->counters, cpu);
+		for (nid = 0; nid < pcpu_counters_num; nid++) {
+			v.bytes += counters[nid].bytes;
+			v.calls += counters[nid].calls;
+		}
 	}
 
 	return v;
@@ -179,7 +199,7 @@ static inline bool __alloc_tag_ref_set(union codetag_ref *ref, struct alloc_tag
 	return true;
 }
 
-static inline bool alloc_tag_ref_set(union codetag_ref *ref, struct alloc_tag *tag)
+static inline bool alloc_tag_ref_set(union codetag_ref *ref, struct alloc_tag *tag, int nid)
 {
 	if (unlikely(!__alloc_tag_ref_set(ref, tag)))
 		return false;
@@ -190,17 +210,18 @@ static inline bool alloc_tag_ref_set(union codetag_ref *ref, struct alloc_tag *t
 	 * Each new reference for every sub-allocation needs to increment call
 	 * counter because when we free each part the counter will be decremented.
 	 */
-	this_cpu_inc(tag->counters->calls);
+	this_cpu_inc(tag->counters[nid].calls);
 	return true;
 }
 
-static inline void alloc_tag_add(union codetag_ref *ref, struct alloc_tag *tag, size_t bytes)
+static inline void alloc_tag_add(union codetag_ref *ref, struct alloc_tag *tag,
+				 int nid, size_t bytes)
 {
-	if (likely(alloc_tag_ref_set(ref, tag)))
-		this_cpu_add(tag->counters->bytes, bytes);
+	if (likely(alloc_tag_ref_set(ref, tag, nid)))
+		this_cpu_add(tag->counters[nid].bytes, bytes);
 }
 
-static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)
+static inline void alloc_tag_sub(union codetag_ref *ref, int nid, size_t bytes)
 {
 	struct alloc_tag *tag;
 
@@ -215,8 +236,8 @@ static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)
 
 	tag = ct_to_alloc_tag(ref->ct);
 
-	this_cpu_sub(tag->counters->bytes, bytes);
-	this_cpu_dec(tag->counters->calls);
+	this_cpu_sub(tag->counters[nid].bytes, bytes);
+	this_cpu_dec(tag->counters[nid].calls);
 
 	ref->ct = NULL;
 }
@@ -228,8 +249,8 @@ static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)
 #define DEFINE_ALLOC_TAG(_alloc_tag)
 static inline bool mem_alloc_profiling_enabled(void) { return false; }
 static inline void alloc_tag_add(union codetag_ref *ref, struct alloc_tag *tag,
-				 size_t bytes) {}
-static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes) {}
+				 int nid, size_t bytes) {}
+static inline void alloc_tag_sub(union codetag_ref *ref, int nid, size_t bytes) {}
 #define alloc_tag_record(p)	do {} while (0)
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
diff --git a/include/linux/codetag.h b/include/linux/codetag.h
index 5f2b9a1f722c..79d6b96c61f6 100644
--- a/include/linux/codetag.h
+++ b/include/linux/codetag.h
@@ -16,6 +16,10 @@ struct module;
 #define CODETAG_SECTION_START_PREFIX	"__start_"
 #define CODETAG_SECTION_STOP_PREFIX	"__stop_"
 
+enum codetag_flags {
+	CODETAG_PERCPU_ALLOC	= (1 << 0), /* codetag tracking percpu allocation */
+};
+
 /*
  * An instance of this structure is created in a special ELF section at every
  * code location being tagged.  At runtime, the special section is treated as
diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 85bf8dd9f087..d92c27fbcd0d 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -43,7 +43,7 @@
 # define PERCPU_DYNAMIC_SIZE_SHIFT      12
 #endif /* LOCKDEP and PAGE_SIZE > 4KiB */
 #else
-#define PERCPU_DYNAMIC_SIZE_SHIFT      10
+#define PERCPU_DYNAMIC_SIZE_SHIFT      13
 #endif
 
 /*
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 166b9d830a85..ba2d9c7e050b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1037,6 +1037,13 @@ config MEM_ALLOC_PROFILING_DEBUG
 	  Adds warnings with helpful error messages for memory allocation
 	  profiling.
 
+config MEM_ALLOC_PROFILING_PER_NUMA_STATS
+	bool "Memory allocation profiling per-NUMA stats"
+	default n
+	depends on MEM_ALLOC_PROFILING
+	help
+	  Display allocation stats on every NUMA node.
+
 source "lib/Kconfig.kasan"
 source "lib/Kconfig.kfence"
 source "lib/Kconfig.kmsan"
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index d48b80f3f007..b503685dff73 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -42,6 +42,9 @@ struct allocinfo_private {
 	bool print_header;
 };
 
+int pcpu_counters_num;
+static unsigned long pcpu_counters_size;
+
 static void *allocinfo_start(struct seq_file *m, loff_t *pos)
 {
 	struct allocinfo_private *priv;
@@ -88,7 +91,7 @@ static void print_allocinfo_header(struct seq_buf *buf)
 {
 	/* Output format version, so we can change it. */
 	seq_buf_printf(buf, "allocinfo - version: 1.0\n");
-	seq_buf_printf(buf, "#     <size>  <calls> <tag info>\n");
+	seq_buf_printf(buf, "<size> <calls> <tag info>\n");
 }
 
 static void alloc_tag_to_text(struct seq_buf *out, struct codetag *ct)
@@ -97,12 +100,29 @@ static void alloc_tag_to_text(struct seq_buf *out, struct codetag *ct)
 	struct alloc_tag_counters counter = alloc_tag_read(tag);
 	s64 bytes = counter.bytes;
 
-	seq_buf_printf(out, "%12lli %8llu ", bytes, counter.calls);
+	seq_buf_printf(out, "%-12lli %-8llu ", bytes, counter.calls);
 	codetag_to_text(out, ct);
 	seq_buf_putc(out, ' ');
 	seq_buf_putc(out, '\n');
 }
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
+static void alloc_tag_to_text_all_nids(struct seq_buf *out, struct codetag *ct)
+{
+	struct alloc_tag *tag = ct_to_alloc_tag(ct);
+	struct alloc_tag_counters counter;
+	s64 bytes;
+	int nid;
+
+	for (nid = 0; nid < pcpu_counters_num; nid++) {
+		counter = alloc_tag_read_nid(tag, nid);
+		bytes = counter.bytes;
+		seq_buf_printf(out, "        nid%-5u %-12lli %-8llu\n",
+				nid, bytes, counter.calls);
+	}
+}
+#endif
+
 static int allocinfo_show(struct seq_file *m, void *arg)
 {
 	struct allocinfo_private *priv = (struct allocinfo_private *)arg;
@@ -116,6 +136,9 @@ static int allocinfo_show(struct seq_file *m, void *arg)
 		priv->print_header = false;
 	}
 	alloc_tag_to_text(&buf, priv->iter.ct);
+#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
+	alloc_tag_to_text_all_nids(&buf, priv->iter.ct);
+#endif
 	seq_commit(m, seq_buf_used(&buf));
 	return 0;
 }
@@ -184,7 +207,7 @@ void pgalloc_tag_split(struct folio *folio, int old_order, int new_order)
 
 		if (get_page_tag_ref(folio_page(folio, i), &ref, &handle)) {
 			/* Set new reference to point to the original tag */
-			alloc_tag_ref_set(&ref, tag);
+			alloc_tag_ref_set(&ref, tag, folio_nid(folio));
 			update_page_tag_ref(handle, &ref);
 			put_page_tag_ref(handle);
 		}
@@ -247,19 +270,41 @@ static void shutdown_mem_profiling(bool remove_file)
 void __init alloc_tag_sec_init(void)
 {
 	struct alloc_tag *last_codetag;
+	int i;
 
 	if (!mem_profiling_support)
 		return;
 
-	if (!static_key_enabled(&mem_profiling_compressed))
-		return;
-
 	kernel_tags.first_tag = (struct alloc_tag *)kallsyms_lookup_name(
 					SECTION_START(ALLOC_TAG_SECTION_NAME));
 	last_codetag = (struct alloc_tag *)kallsyms_lookup_name(
 					SECTION_STOP(ALLOC_TAG_SECTION_NAME));
 	kernel_tags.count = last_codetag - kernel_tags.first_tag;
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
+	pcpu_counters_num = num_possible_nodes();
+#else
+	pcpu_counters_num = 1;
+#endif
+
+	pcpu_counters_size = pcpu_counters_num * sizeof(struct alloc_tag_counters);
+	for (i = 0; i < kernel_tags.count; i++) {
+		/* Each CPU has one alloc_tag_counters per numa node */
+		kernel_tags.first_tag[i].counters =
+			pcpu_alloc_noprof(pcpu_counters_size,
+					  sizeof(struct alloc_tag_counters),
+					  false, GFP_KERNEL | __GFP_ZERO);
+		if (!kernel_tags.first_tag[i].counters) {
+			while (--i >= 0)
+				free_percpu(kernel_tags.first_tag[i].counters);
+			pr_info("Failed to allocate per-cpu alloc_tag counters\n");
+			return;
+		}
+	}
+
+	if (!static_key_enabled(&mem_profiling_compressed))
+		return;
+
 	/* Check if kernel tags fit into page flags */
 	if (kernel_tags.count > (1UL << NR_UNUSED_PAGEFLAG_BITS)) {
 		shutdown_mem_profiling(false); /* allocinfo file does not exist yet */
@@ -622,7 +667,9 @@ static int load_module(struct module *mod, struct codetag *start, struct codetag
 	stop_tag = ct_to_alloc_tag(stop);
 	for (tag = start_tag; tag < stop_tag; tag++) {
 		WARN_ON(tag->counters);
-		tag->counters = alloc_percpu(struct alloc_tag_counters);
+		tag->counters = __alloc_percpu_gfp(pcpu_counters_size,
+						   sizeof(struct alloc_tag_counters),
+						   GFP_KERNEL | __GFP_ZERO);
 		if (!tag->counters) {
 			while (--tag >= start_tag) {
 				free_percpu(tag->counters);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 90b06f3d004c..8219d8de6f97 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1107,58 +1107,59 @@ void __clear_page_tag_ref(struct page *page)
 /* Should be called only if mem_alloc_profiling_enabled() */
 static noinline
 void __pgalloc_tag_add(struct page *page, struct task_struct *task,
-		       unsigned int nr)
+		       int nid, unsigned int nr)
 {
 	union pgtag_ref_handle handle;
 	union codetag_ref ref;
 
 	if (get_page_tag_ref(page, &ref, &handle)) {
-		alloc_tag_add(&ref, task->alloc_tag, PAGE_SIZE * nr);
+		alloc_tag_add(&ref, task->alloc_tag, nid, PAGE_SIZE * nr);
 		update_page_tag_ref(handle, &ref);
 		put_page_tag_ref(handle);
 	}
 }
 
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
-				   unsigned int nr)
+				   int nid, unsigned int nr)
 {
 	if (mem_alloc_profiling_enabled())
-		__pgalloc_tag_add(page, task, nr);
+		__pgalloc_tag_add(page, task, nid, nr);
 }
 
 /* Should be called only if mem_alloc_profiling_enabled() */
 static noinline
-void __pgalloc_tag_sub(struct page *page, unsigned int nr)
+void __pgalloc_tag_sub(struct page *page, int nid, unsigned int nr)
 {
 	union pgtag_ref_handle handle;
 	union codetag_ref ref;
 
 	if (get_page_tag_ref(page, &ref, &handle)) {
-		alloc_tag_sub(&ref, PAGE_SIZE * nr);
+		alloc_tag_sub(&ref, nid, PAGE_SIZE * nr);
 		update_page_tag_ref(handle, &ref);
 		put_page_tag_ref(handle);
 	}
 }
 
-static inline void pgalloc_tag_sub(struct page *page, unsigned int nr)
+static inline void pgalloc_tag_sub(struct page *page, int nid, unsigned int nr)
 {
 	if (mem_alloc_profiling_enabled())
-		__pgalloc_tag_sub(page, nr);
+		__pgalloc_tag_sub(page, nid, nr);
 }
 
 /* When tag is not NULL, assuming mem_alloc_profiling_enabled */
-static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr)
+static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag,
+					 int nid, unsigned int nr)
 {
 	if (tag)
-		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
+		this_cpu_sub(tag->counters[nid].bytes, PAGE_SIZE * nr);
 }
 
 #else /* CONFIG_MEM_ALLOC_PROFILING */
 
 static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
-				   unsigned int nr) {}
-static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
-static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr) {}
+				   int nid, unsigned int nr) {}
+static inline void pgalloc_tag_sub(struct page *page, int nid, unsigned int nr) {}
+static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, int nid, unsigned int nr) {}
 
 #endif /* CONFIG_MEM_ALLOC_PROFILING */
 
@@ -1197,7 +1198,7 @@ __always_inline bool free_pages_prepare(struct page *page,
 		/* Do not let hwpoison pages hit pcplists/buddy */
 		reset_page_owner(page, order);
 		page_table_check_free(page, order);
-		pgalloc_tag_sub(page, 1 << order);
+		pgalloc_tag_sub(page, page_to_nid(page), 1 << order);
 
 		/*
 		 * The page is isolated and accounted for.
@@ -1251,7 +1252,7 @@ __always_inline bool free_pages_prepare(struct page *page,
 	page->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
 	reset_page_owner(page, order);
 	page_table_check_free(page, order);
-	pgalloc_tag_sub(page, 1 << order);
+	pgalloc_tag_sub(page, page_to_nid(page), 1 << order);
 
 	if (!PageHighMem(page)) {
 		debug_check_no_locks_freed(page_address(page),
@@ -1707,7 +1708,7 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 
 	set_page_owner(page, order, gfp_flags);
 	page_table_check_alloc(page, order);
-	pgalloc_tag_add(page, current, 1 << order);
+	pgalloc_tag_add(page, current, page_to_nid(page), 1 << order);
 }
 
 static void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
@@ -5064,7 +5065,7 @@ static void ___free_pages(struct page *page, unsigned int order,
 	if (put_page_testzero(page))
 		__free_frozen_pages(page, order, fpi_flags);
 	else if (!head) {
-		pgalloc_tag_sub_pages(tag, (1 << order) - 1);
+		pgalloc_tag_sub_pages(tag, page_to_nid(page), (1 << order) - 1);
 		while (order-- > 0)
 			__free_frozen_pages(page + (1 << order), order,
 					    fpi_flags);
diff --git a/mm/percpu.c b/mm/percpu.c
index b35494c8ede2..130450e9718e 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1691,15 +1691,19 @@ static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
 				      size_t size)
 {
 	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts)) {
+		/* For percpu allocation, store all alloc_tag stats on numa node 0 */
 		alloc_tag_add(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag,
-			      current->alloc_tag, size);
+			      current->alloc_tag, 0, size);
+		if (current->alloc_tag)
+			current->alloc_tag->ct.flags |= CODETAG_PERCPU_ALLOC;
 	}
 }
 
 static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
 {
+	/* percpu alloc_tag stats is stored on numa node 0 so subtract from node 0 */
 	if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts))
-		alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag, size);
+		alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].tag, 0, size);
 }
 #else
 static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int off,
diff --git a/mm/show_mem.c b/mm/show_mem.c
index 03e8d968fd1a..b2ff55afb3cc 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2008 Johannes Weiner <hannes@saeurebad.de>
  */
 
+#include <linux/alloc_tag.h>
 #include <linux/blkdev.h>
 #include <linux/cma.h>
 #include <linux/cpuset.h>
@@ -428,6 +429,7 @@ void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
 		nr = alloc_tag_top_users(tags, ARRAY_SIZE(tags), false);
 		if (nr) {
 			pr_notice("Memory allocations:\n");
+			pr_notice("<size> <calls> <tag info>\n");
 			for (i = 0; i < nr; i++) {
 				struct codetag *ct = tags[i].ct;
 				struct alloc_tag *tag = ct_to_alloc_tag(ct);
@@ -435,16 +437,27 @@ void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
 				char bytes[10];
 
 				string_get_size(counter.bytes, 1, STRING_UNITS_2, bytes, sizeof(bytes));
-
 				/* Same as alloc_tag_to_text() but w/o intermediate buffer */
 				if (ct->modname)
-					pr_notice("%12s %8llu %s:%u [%s] func:%s\n",
-						  bytes, counter.calls, ct->filename,
-						  ct->lineno, ct->modname, ct->function);
+					pr_notice("%-12s %-8llu %s:%u [%s] func:%s\n",
+						bytes, counter.calls, ct->filename,
+						ct->lineno, ct->modname, ct->function);
 				else
-					pr_notice("%12s %8llu %s:%u func:%s\n",
-						  bytes, counter.calls, ct->filename,
-						  ct->lineno, ct->function);
+					pr_notice("%-12s %-8llu %s:%u func:%s\n",
+						bytes, counter.calls,
+						ct->filename, ct->lineno, ct->function);
+
+#ifdef CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS
+				int nid;
+
+				for (nid = 0; nid < pcpu_counters_num; nid++) {
+					counter = alloc_tag_read_nid(tag, nid);
+					string_get_size(counter.bytes, 1, STRING_UNITS_2,
+							bytes, sizeof(bytes));
+					pr_notice("        nid%-5u %-12lld %-8lld\n",
+						  nid, counter.bytes, counter.calls);
+				}
+#endif
 			}
 		}
 	}
diff --git a/mm/slub.c b/mm/slub.c
index be8b09e09d30..068b88b85d80 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2104,8 +2104,12 @@ __alloc_tagging_slab_alloc_hook(struct kmem_cache *s, void *object, gfp_t flags)
 	 * If other users appear then mem_alloc_profiling_enabled()
 	 * check should be added before alloc_tag_add().
 	 */
-	if (likely(obj_exts))
-		alloc_tag_add(&obj_exts->ref, current->alloc_tag, s->size);
+	if (likely(obj_exts)) {
+		struct page *page = virt_to_page(object);
+
+		alloc_tag_add(&obj_exts->ref, current->alloc_tag,
+				page_to_nid(page), s->size);
+	}
 }
 
 static inline void
@@ -2133,8 +2137,9 @@ __alloc_tagging_slab_free_hook(struct kmem_cache *s, struct slab *slab, void **p
 
 	for (i = 0; i < objects; i++) {
 		unsigned int off = obj_to_index(s, slab, p[i]);
+		struct page *page = virt_to_page(p[i]);
 
-		alloc_tag_sub(&obj_exts[off].ref, s->size);
+		alloc_tag_sub(&obj_exts[off].ref, page_to_nid(page), s->size);
 	}
 }
 
-- 
2.34.1

