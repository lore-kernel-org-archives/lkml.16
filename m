Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A668510E0
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440467; cv=none; b=CXnMIhGaPBcTsLSNlmqC4SwRpz+bP1y9XE7D4FrJMRPDxH7N0IIFBDfPiXC41T20lu8xQ0nTWJtgdRJr8LkJ0/vuyk5f+U9JRBtw3xOnVnpJorNsmiIPSXVoThjnsoUaA0BsWHL1WdinZFBkMQYT602yoLFI6CRrlvSpeT/GOz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440467; c=relaxed/simple;
	bh=3yPE3c5dUT5+Hn52LTfDQCFtdocCY/Dn7NOkbDjgRbE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lWTqThQrXR9oKtWwoASvQReYhJ7uMVyqKcy2mXNYVA/q7Rv+A4qXoFKMCzAuqHOJ2Sg+bp74fsY7SK1CY+mfYvAsiu33QIDLiBedzAK8EpQbLG+2RqtDYXAgFH408at3XDZJ2E1eJec1HMaOV/BbgRFLi4IRwyvKxl+o9AMyfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qnjUiM2C; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qnjUiM2C"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231dfb7315eso6503535ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747440465; x=1748045265; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fdTg2aIq+yKN3X+ZqL5WTi+FS98hIL9CGjxbsmV+g0Q=;
        b=qnjUiM2CI1rItUJ7I8IAWUJnZ+/6okj34dB/myjnDEATvGCgsJatOMv6icHprqDLCh
         FNEk56At4ZQ8+W2zM02zbxcAHgr9Z5tzFpxISECUUe+QyA/V/Abzm94/pp1IMKYKynFz
         /QHcBQSoJ0ebEhX7mTDkRd2YeaGRZdwAREGZiHxrdVW3R3/mVwUYkEG2ErlOXgVr1OKD
         QoCDWLt32qINZuwx1i0NYVjfZ5QyOXD1yQ46KXDh6/4wHouamDmTdPJEvQaLvQEosYIn
         Xe2vDR/K3foT2xxg4nyHrK1SbAQbnAgg0KQNfQuhrMsiI1sW15cLH/siYMm55mMNQ0c4
         hy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440465; x=1748045265;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdTg2aIq+yKN3X+ZqL5WTi+FS98hIL9CGjxbsmV+g0Q=;
        b=HEgKr+6ZuVelRkbNFRF0PiqHTPEbNjIlbwoA6ykLntsOvxRz+I2bMGTdJOohOvar8f
         bZfBor5LATLKD9TR+kqx9Rt+zwmTfYWFWREn48OqC+svSmV0XFbTZslYqOlIRYFydQH8
         jzIEPNrJprRviTj5nEwS4tLD/qOBynR4YwN6Nk0uZjgpqKCW47XEDL6+Db7KSxMSnW+Y
         GDHTwNQHUX2FLbe6UZAzjn193kY7weD7P/WX+ZIpffWqmzJszjlD/TaD9H4z4mLKGmJQ
         B4rw3Rt2ElCh2prDknPH0Rw7kkOWrihze5lES3PcDSsQfeDYFRbVdDAzt2xbVdQT2CX0
         9Q7w==
X-Forwarded-Encrypted: i=1; AJvYcCVddxovCbzR9Xaxx0aE5c5K2DRAdMxw+jKjb8UQiMNgkA5awZ4sTr/H3f6uQ75jhsX7c0Vcr7HzjlzBZ98=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMs74jjrLzWXPXrbNUTgIKQZyBDLNj8SYJE1KcfbMYtEgflWsp
	WCN+OHQYbszk69+XXZ1uIo8WhiA/EmF/05uhUK5D5CImF1p3LCOYcMAz4jyRcqMImmqo46Fhd2G
	64hRSmg==
X-Google-Smtp-Source: AGHT+IF4OSk8BpiEzrk7dV2VBPTsTg/7CEypyxMwwI1iF2ySUnXZwnrvr4pqvulJrcNA+KCIz4y5EUcqX9c=
X-Received: from ploh6.prod.google.com ([2002:a17:902:f706:b0:22e:3312:15a5])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a68:b0:227:ac2a:1dd6
 with SMTP id d9443c01a7336-231d45273c6mr86050615ad.24.1747440464816; Fri, 16
 May 2025 17:07:44 -0700 (PDT)
Date: Fri, 16 May 2025 17:07:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517000739.5930-1-surenb@google.com>
Subject: [PATCH 1/1] alloc_tag: allocate percpu counters for module tags dynamically
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, 00107082@163.com, dennis@kernel.org, 
	tj@kernel.org, cl@gentwo.org, pasha.tatashin@soleen.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

When a module gets unloaded it checks whether any of its tags are still
in use and if so, we keep the memory containing module's allocation tags
alive until all tags are unused. However percpu counters referenced by
the tags are freed by free_module(). This will lead to UAF if the memory
allocated by a module is accessed after module was unloaded. To fix this
we allocate percpu counters for module allocation tags dynamically and
we keep it alive for tags which are still in use after module unloading.
This also removes the requirement of a larger PERCPU_MODULE_RESERVE when
memory allocation profiling is enabled because percpu memory for counters
does not need to be reserved anymore.

Fixes: 0db6f8d7820a ("alloc_tag: load module tags into separate contiguous memory")
Reported-by: David Wang <00107082@163.com>
Closes: https://lore.kernel.org/all/20250516131246.6244-1-00107082@163.com/
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/alloc_tag.h | 12 ++++++
 include/linux/codetag.h   |  8 ++--
 include/linux/percpu.h    |  4 --
 lib/alloc_tag.c           | 87 +++++++++++++++++++++++++++++++--------
 lib/codetag.c             |  5 ++-
 5 files changed, 88 insertions(+), 28 deletions(-)

diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index a946e0203e6d..8f7931eb7d16 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -104,6 +104,16 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
 
 #else /* ARCH_NEEDS_WEAK_PER_CPU */
 
+#ifdef MODULE
+
+#define DEFINE_ALLOC_TAG(_alloc_tag)						\
+	static struct alloc_tag _alloc_tag __used __aligned(8)			\
+	__section(ALLOC_TAG_SECTION_NAME) = {					\
+		.ct = CODE_TAG_INIT,						\
+		.counters = NULL };
+
+#else  /* MODULE */
+
 #define DEFINE_ALLOC_TAG(_alloc_tag)						\
 	static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cntr);	\
 	static struct alloc_tag _alloc_tag __used __aligned(8)			\
@@ -111,6 +121,8 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
 		.ct = CODE_TAG_INIT,						\
 		.counters = &_alloc_tag_cntr };
 
+#endif /* MODULE */
+
 #endif /* ARCH_NEEDS_WEAK_PER_CPU */
 
 DECLARE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
diff --git a/include/linux/codetag.h b/include/linux/codetag.h
index d14dbd26b370..0ee4c21c6dbc 100644
--- a/include/linux/codetag.h
+++ b/include/linux/codetag.h
@@ -36,10 +36,10 @@ union codetag_ref {
 struct codetag_type_desc {
 	const char *section;
 	size_t tag_size;
-	void (*module_load)(struct codetag_type *cttype,
-			    struct codetag_module *cmod);
-	void (*module_unload)(struct codetag_type *cttype,
-			      struct codetag_module *cmod);
+	void (*module_load)(struct module *mod,
+			    struct codetag *start, struct codetag *end);
+	void (*module_unload)(struct module *mod,
+			      struct codetag *start, struct codetag *end);
 #ifdef CONFIG_MODULES
 	void (*module_replaced)(struct module *mod, struct module *new_mod);
 	bool (*needs_section_mem)(struct module *mod, unsigned long size);
diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 52b5ea663b9f..85bf8dd9f087 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -15,11 +15,7 @@
 
 /* enough to cover all DEFINE_PER_CPUs in modules */
 #ifdef CONFIG_MODULES
-#ifdef CONFIG_MEM_ALLOC_PROFILING
-#define PERCPU_MODULE_RESERVE		(8 << 13)
-#else
 #define PERCPU_MODULE_RESERVE		(8 << 10)
-#endif
 #else
 #define PERCPU_MODULE_RESERVE		0
 #endif
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 25ecc1334b67..c7f602fa7b23 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -350,18 +350,28 @@ static bool needs_section_mem(struct module *mod, unsigned long size)
 	return size >= sizeof(struct alloc_tag);
 }
 
-static struct alloc_tag *find_used_tag(struct alloc_tag *from, struct alloc_tag *to)
+static bool clean_unused_counters(struct alloc_tag *start_tag,
+				  struct alloc_tag *end_tag)
 {
-	while (from <= to) {
+	struct alloc_tag *tag;
+	bool ret = true;
+
+	for (tag = start_tag; tag <= end_tag; tag++) {
 		struct alloc_tag_counters counter;
 
-		counter = alloc_tag_read(from);
-		if (counter.bytes)
-			return from;
-		from++;
+		if (!tag->counters)
+			continue;
+
+		counter = alloc_tag_read(tag);
+		if (!counter.bytes) {
+			free_percpu(tag->counters);
+			tag->counters = NULL;
+		} else {
+			ret = false;
+		}
 	}
 
-	return NULL;
+	return ret;
 }
 
 /* Called with mod_area_mt locked */
@@ -371,12 +381,16 @@ static void clean_unused_module_areas_locked(void)
 	struct module *val;
 
 	mas_for_each(&mas, val, module_tags.size) {
+		struct alloc_tag *start_tag;
+		struct alloc_tag *end_tag;
+
 		if (val != &unloaded_mod)
 			continue;
 
 		/* Release area if all tags are unused */
-		if (!find_used_tag((struct alloc_tag *)(module_tags.start_addr + mas.index),
-				   (struct alloc_tag *)(module_tags.start_addr + mas.last)))
+		start_tag = (struct alloc_tag *)(module_tags.start_addr + mas.index);
+		end_tag = (struct alloc_tag *)(module_tags.start_addr + mas.last);
+		if (clean_unused_counters(start_tag, end_tag))
 			mas_erase(&mas);
 	}
 }
@@ -561,7 +575,8 @@ static void *reserve_module_tags(struct module *mod, unsigned long size,
 static void release_module_tags(struct module *mod, bool used)
 {
 	MA_STATE(mas, &mod_area_mt, module_tags.size, module_tags.size);
-	struct alloc_tag *tag;
+	struct alloc_tag *start_tag;
+	struct alloc_tag *end_tag;
 	struct module *val;
 
 	mas_lock(&mas);
@@ -575,15 +590,22 @@ static void release_module_tags(struct module *mod, bool used)
 	if (!used)
 		goto release_area;
 
-	/* Find out if the area is used */
-	tag = find_used_tag((struct alloc_tag *)(module_tags.start_addr + mas.index),
-			    (struct alloc_tag *)(module_tags.start_addr + mas.last));
-	if (tag) {
-		struct alloc_tag_counters counter = alloc_tag_read(tag);
+	start_tag = (struct alloc_tag *)(module_tags.start_addr + mas.index);
+	end_tag = (struct alloc_tag *)(module_tags.start_addr + mas.last);
+	if (!clean_unused_counters(start_tag, end_tag)) {
+		struct alloc_tag *tag;
+
+		for (tag = start_tag; tag <= end_tag; tag++) {
+			struct alloc_tag_counters counter;
+
+			if (!tag->counters)
+				continue;
 
-		pr_info("%s:%u module %s func:%s has %llu allocated at module unload\n",
-			tag->ct.filename, tag->ct.lineno, tag->ct.modname,
-			tag->ct.function, counter.bytes);
+			counter = alloc_tag_read(tag);
+			pr_info("%s:%u module %s func:%s has %llu allocated at module unload\n",
+				tag->ct.filename, tag->ct.lineno, tag->ct.modname,
+				tag->ct.function, counter.bytes);
+		}
 	} else {
 		used = false;
 	}
@@ -596,6 +618,34 @@ static void release_module_tags(struct module *mod, bool used)
 	mas_unlock(&mas);
 }
 
+static void load_module(struct module *mod, struct codetag *start, struct codetag *stop)
+{
+	/* Allocate module alloc_tag percpu counters */
+	struct alloc_tag *start_tag;
+	struct alloc_tag *stop_tag;
+	struct alloc_tag *tag;
+
+	if (!mod)
+		return;
+
+	start_tag = ct_to_alloc_tag(start);
+	stop_tag = ct_to_alloc_tag(stop);
+	for (tag = start_tag; tag < stop_tag; tag++) {
+		WARN_ON(tag->counters);
+		tag->counters = alloc_percpu(struct alloc_tag_counters);
+		if (!tag->counters) {
+			while (--tag >= start_tag) {
+				free_percpu(tag->counters);
+				tag->counters = NULL;
+			}
+			shutdown_mem_profiling(true);
+			pr_err("Failed to allocate memory for allocation tag percpu counters in the module %s. Memory allocation profiling is disabled!\n",
+			       mod->name);
+			break;
+		}
+	}
+}
+
 static void replace_module(struct module *mod, struct module *new_mod)
 {
 	MA_STATE(mas, &mod_area_mt, 0, module_tags.size);
@@ -757,6 +807,7 @@ static int __init alloc_tag_init(void)
 		.needs_section_mem	= needs_section_mem,
 		.alloc_section_mem	= reserve_module_tags,
 		.free_section_mem	= release_module_tags,
+		.module_load		= load_module,
 		.module_replaced	= replace_module,
 #endif
 	};
diff --git a/lib/codetag.c b/lib/codetag.c
index 42aadd6c1454..de332e98d6f5 100644
--- a/lib/codetag.c
+++ b/lib/codetag.c
@@ -194,7 +194,7 @@ static int codetag_module_init(struct codetag_type *cttype, struct module *mod)
 	if (err >= 0) {
 		cttype->count += range_size(cttype, &range);
 		if (cttype->desc.module_load)
-			cttype->desc.module_load(cttype, cmod);
+			cttype->desc.module_load(mod, range.start, range.stop);
 	}
 	up_write(&cttype->mod_lock);
 
@@ -333,7 +333,8 @@ void codetag_unload_module(struct module *mod)
 		}
 		if (found) {
 			if (cttype->desc.module_unload)
-				cttype->desc.module_unload(cttype, cmod);
+				cttype->desc.module_unload(cmod->mod,
+					cmod->range.start, cmod->range.stop);
 
 			cttype->count -= range_size(cttype, &cmod->range);
 			idr_remove(&cttype->mod_idr, mod_id);

base-commit: 6e68a205c07b3c311f19a4c9c5de95d191d5a459
-- 
2.49.0.1101.gccaa498523-goog

