Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932081E98E8
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190552; cv=none; b=kYY+F8eIe+XKXS1sS/OuTklzLeJ/giQP36ivNoDNpuyKXDb8h2xUt3YdQP5Q57y8xKBbLjBviFBHbDUOjeIPhcC6lIqW1ec09fCVPgvK/Ti/jPVuzUufwsNIrV8efdZPD5JwASedUaS5XPKLVyo9NoscRWP96c+ohWC/vt5tnsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190552; c=relaxed/simple;
	bh=IHhNerkpqWadEx3X6ldRgt0DsSW4NT3Yfiftd6xvrZ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KdMjIMU/n9r86jM61L0qk8W1Ks4nxxKIVbvv1kkwzh8EJtoXgLTCTtNEOzFvcpwxSB7ii5ZCGZwc1KoXzYR8JSOB8sLqe/+BUal7L4Iuw0Ur6x28GFkt5Y+KG9LqBh8v1Yu0s8VDqdJk/C+dcJHa56TIFVOtcHUHY680MT1odp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aPiiCI5O; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aPiiCI5O"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2167141e00eso3106835ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190550; x=1738795350; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pAg9E+yVjs4X3E0Z5lKinfq3rHknPoyNwrdyz8zbKYE=;
        b=aPiiCI5O4iMsbarFpJtH0ysowq6z0YyKLE5/wOfC8BTVcf/viXebyDSogXNeBnRqjg
         FiFtwQFlrLVCtcDpN2DepbW69Cyt8sKXxWeUvfSklftVgLUBV5PUWD+VDxGt62ngcWks
         f+Vv5bqReYeC2KgVeAa7+4Bv9Jzw/A/QBRgNNJ7Iw1Tl7hWyFy4AKERTgq83WRAkWJLI
         1zTa3KMSnSlTL5qUoozYgSlS5CNabVmaND2fBqDX04Zee1On+U6BUL3zNaD8FyK490l/
         TkdeGRN4qClDZpY/s4WD8annPG1bsjllmtjvP5vH0CdphxHZriJmfxSYlaZIcmcyct86
         eb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190550; x=1738795350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAg9E+yVjs4X3E0Z5lKinfq3rHknPoyNwrdyz8zbKYE=;
        b=tuOaFJ7SslPVI9gkQSc17dl0yVch3v2IuNRJ8AzpLGtn7veK+M/4/WjaoIjBuCfTd5
         di0+Ps63hIf0o7khSdr7a57lZMISzCXK4Ef/ygM5I//cHSrXbsqQFN89l8IViosYH1vG
         uQzWKnUgpv9czUQFfrl/tDl7nrMXhLZiWk9yyxMLjqQnRvM2eg3kFxKdBooEprrMnxb/
         Ufv4H00B3J/h6CWy1pWLU3ndb7i89CUakEBbTCIA2YlqdatmaIlIUkqoe+66HtMRLrfV
         SopV1iQzEQyFxijSXeXiyxwNBTHl/9mOs1aDeq1TFpsdUBIfTJo1YlVTyp1z0gM2DKBD
         ubRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1j8MCeWMbBV/RkNvpMtCgqNteizmRhKSYBNsp7l6ElWJ3S2YgTFgve6qnQItxA3AAfQDGr6/hYxXS+TA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0BA6jjPIU+89pTHUbPRE/eY/FkznB1LQ10uTdDXH1VCkcPMy
	vsqO3O6aEdYsE6gdGg5JsLk4K3HJfn3UaraUiATTbjg7d4iw5MrwreqivN/jgBw6xImu2w==
X-Google-Smtp-Source: AGHT+IEltS0buyyeuzvXAhB1x/AMS4GCVgwLNavg/F7vz30dsXHueQ5FkQjVnKOZ3LafqctlXAj1MQpa
X-Received: from pfbbw12.prod.google.com ([2002:a05:6a00:408c:b0:72d:7bb4:ffc])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e15:b0:728:e40d:c5fc
 with SMTP id d2e1a72fcca58-72fd0c7c61fmr7331538b3a.22.1738190549941; Wed, 29
 Jan 2025 14:42:29 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:37 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-9-fvdl@google.com>
Subject: [PATCH v2 08/28] mm/hugetlb: convert cmdline parameters from setup to early
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Convert the cmdline parameters (hugepagesz, hugepages,
default_hugepagesz and hugetlb_free_vmemmap) to early
parameters.

Since parse_early_param might run before MMU setups
on some platforms (powerpc), validation of huge page
sizes as specified in command line parameters would
fail. So instead, for the hstate-related values,
just record the them and parse them on demand, from
hugetlb_bootmem_alloc.

The allocation of hugetlb bootmem pages is now done in
hugetlb_bootmem_alloc, which is called explicitly at the
start of mm_core_init().  core_initcall would be too late,
as that happens with memblock already torn down.

This change will allow earlier allocation and initialization
of bootmem hugetlb pages later on.

No functional change intended.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 include/linux/hugetlb.h |   6 ++
 mm/hugetlb.c            | 133 +++++++++++++++++++++++++++++++---------
 mm/hugetlb_vmemmap.c    |   6 +-
 mm/mm_init.c            |   3 +
 4 files changed, 119 insertions(+), 29 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index ec8c0ccc8f95..9cd7c9dacb88 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -174,6 +174,8 @@ struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio);
 extern int sysctl_hugetlb_shm_group;
 extern struct list_head huge_boot_pages[MAX_NUMNODES];
 
+void hugetlb_bootmem_alloc(void);
+
 /* arch callbacks */
 
 #ifndef CONFIG_HIGHPTE
@@ -1250,6 +1252,10 @@ static inline bool hugetlbfs_pagecache_present(
 {
 	return false;
 }
+
+static inline void hugetlb_bootmem_alloc(void)
+{
+}
 #endif	/* CONFIG_HUGETLB_PAGE */
 
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 20d54eaf2bad..c16ed9790022 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -40,6 +40,7 @@
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
+#include <asm/setup.h>
 
 #include <linux/io.h>
 #include <linux/hugetlb.h>
@@ -62,6 +63,24 @@ static unsigned long hugetlb_cma_size __initdata;
 
 __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
 
+/*
+ * Due to ordering constraints across the init code for various
+ * architectures, hugetlb hstate cmdline parameters can't simply
+ * be early_param. early_param might call the setup function
+ * before valid hugetlb page sizes are determined, leading to
+ * incorrect rejection of valid hugepagesz= options.
+ *
+ * So, record the parameters early and consume them whenever the
+ * init code is ready for them, by calling hugetlb_parse_params().
+ */
+
+/* one (hugepagesz=,hugepages=) pair per hstate, one default_hugepagesz */
+#define HUGE_MAX_CMDLINE_ARGS	(2 * HUGE_MAX_HSTATE + 1)
+struct hugetlb_cmdline {
+	char *val;
+	int (*setup)(char *val);
+};
+
 /* for command line parsing */
 static struct hstate * __initdata parsed_hstate;
 static unsigned long __initdata default_hstate_max_huge_pages;
@@ -69,6 +88,20 @@ static bool __initdata parsed_valid_hugepagesz = true;
 static bool __initdata parsed_default_hugepagesz;
 static unsigned int default_hugepages_in_node[MAX_NUMNODES] __initdata;
 
+static char hstate_cmdline_buf[COMMAND_LINE_SIZE] __initdata;
+static int hstate_cmdline_index __initdata;
+static struct hugetlb_cmdline hugetlb_params[HUGE_MAX_CMDLINE_ARGS] __initdata;
+static int hugetlb_param_index __initdata;
+static __init int hugetlb_add_param(char *s, int (*setup)(char *val));
+static __init void hugetlb_parse_params(void);
+
+#define hugetlb_early_param(str, func) \
+static __init int func##args(char *s) \
+{ \
+	return hugetlb_add_param(s, func); \
+} \
+early_param(str, func##args)
+
 /*
  * Protects updates to hugepage_freelists, hugepage_activelist, nr_huge_pages,
  * free_huge_pages, and surplus_huge_pages.
@@ -3488,6 +3521,8 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
 
 		for (i = 0; i < MAX_NUMNODES; i++)
 			INIT_LIST_HEAD(&huge_boot_pages[i]);
+		h->next_nid_to_alloc = first_online_node;
+		h->next_nid_to_free = first_online_node;
 		initialized = true;
 	}
 
@@ -4550,8 +4585,6 @@ void __init hugetlb_add_hstate(unsigned int order)
 	for (i = 0; i < MAX_NUMNODES; ++i)
 		INIT_LIST_HEAD(&h->hugepage_freelists[i]);
 	INIT_LIST_HEAD(&h->hugepage_activelist);
-	h->next_nid_to_alloc = first_online_node;
-	h->next_nid_to_free = first_online_node;
 	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
 					huge_page_size(h)/SZ_1K);
 
@@ -4576,6 +4609,42 @@ static void __init hugepages_clear_pages_in_node(void)
 	}
 }
 
+static __init int hugetlb_add_param(char *s, int (*setup)(char *))
+{
+	size_t len;
+	char *p;
+
+	if (hugetlb_param_index >= HUGE_MAX_CMDLINE_ARGS)
+		return -EINVAL;
+
+	len = strlen(s) + 1;
+	if (len + hstate_cmdline_index > sizeof(hstate_cmdline_buf))
+		return -EINVAL;
+
+	p = &hstate_cmdline_buf[hstate_cmdline_index];
+	memcpy(p, s, len);
+	hstate_cmdline_index += len;
+
+	hugetlb_params[hugetlb_param_index].val = p;
+	hugetlb_params[hugetlb_param_index].setup = setup;
+
+	hugetlb_param_index++;
+
+	return 0;
+}
+
+static __init void hugetlb_parse_params(void)
+{
+	int i;
+	struct hugetlb_cmdline *hcp;
+
+	for (i = 0; i < hugetlb_param_index; i++) {
+		hcp = &hugetlb_params[i];
+
+		hcp->setup(hcp->val);
+	}
+}
+
 /*
  * hugepages command line processing
  * hugepages normally follows a valid hugepagsz or default_hugepagsz
@@ -4595,7 +4664,7 @@ static int __init hugepages_setup(char *s)
 	if (!parsed_valid_hugepagesz) {
 		pr_warn("HugeTLB: hugepages=%s does not follow a valid hugepagesz, ignoring\n", s);
 		parsed_valid_hugepagesz = true;
-		return 1;
+		return -EINVAL;
 	}
 
 	/*
@@ -4649,24 +4718,16 @@ static int __init hugepages_setup(char *s)
 		}
 	}
 
-	/*
-	 * Global state is always initialized later in hugetlb_init.
-	 * But we need to allocate gigantic hstates here early to still
-	 * use the bootmem allocator.
-	 */
-	if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate))
-		hugetlb_hstate_alloc_pages(parsed_hstate);
-
 	last_mhp = mhp;
 
-	return 1;
+	return 0;
 
 invalid:
 	pr_warn("HugeTLB: Invalid hugepages parameter %s\n", p);
 	hugepages_clear_pages_in_node();
-	return 1;
+	return -EINVAL;
 }
-__setup("hugepages=", hugepages_setup);
+hugetlb_early_param("hugepages", hugepages_setup);
 
 /*
  * hugepagesz command line processing
@@ -4685,7 +4746,7 @@ static int __init hugepagesz_setup(char *s)
 
 	if (!arch_hugetlb_valid_size(size)) {
 		pr_err("HugeTLB: unsupported hugepagesz=%s\n", s);
-		return 1;
+		return -EINVAL;
 	}
 
 	h = size_to_hstate(size);
@@ -4700,7 +4761,7 @@ static int __init hugepagesz_setup(char *s)
 		if (!parsed_default_hugepagesz ||  h != &default_hstate ||
 		    default_hstate.max_huge_pages) {
 			pr_warn("HugeTLB: hugepagesz=%s specified twice, ignoring\n", s);
-			return 1;
+			return -EINVAL;
 		}
 
 		/*
@@ -4710,14 +4771,14 @@ static int __init hugepagesz_setup(char *s)
 		 */
 		parsed_hstate = h;
 		parsed_valid_hugepagesz = true;
-		return 1;
+		return 0;
 	}
 
 	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
 	parsed_valid_hugepagesz = true;
-	return 1;
+	return 0;
 }
-__setup("hugepagesz=", hugepagesz_setup);
+hugetlb_early_param("hugepagesz", hugepagesz_setup);
 
 /*
  * default_hugepagesz command line input
@@ -4731,14 +4792,14 @@ static int __init default_hugepagesz_setup(char *s)
 	parsed_valid_hugepagesz = false;
 	if (parsed_default_hugepagesz) {
 		pr_err("HugeTLB: default_hugepagesz previously specified, ignoring %s\n", s);
-		return 1;
+		return -EINVAL;
 	}
 
 	size = (unsigned long)memparse(s, NULL);
 
 	if (!arch_hugetlb_valid_size(size)) {
 		pr_err("HugeTLB: unsupported default_hugepagesz=%s\n", s);
-		return 1;
+		return -EINVAL;
 	}
 
 	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
@@ -4755,17 +4816,33 @@ static int __init default_hugepagesz_setup(char *s)
 	 */
 	if (default_hstate_max_huge_pages) {
 		default_hstate.max_huge_pages = default_hstate_max_huge_pages;
-		for_each_online_node(i)
-			default_hstate.max_huge_pages_node[i] =
-				default_hugepages_in_node[i];
-		if (hstate_is_gigantic(&default_hstate))
-			hugetlb_hstate_alloc_pages(&default_hstate);
+		/*
+		 * Since this is an early parameter, we can't check
+		 * NUMA node state yet, so loop through MAX_NUMNODES.
+		 */
+		for (i = 0; i < MAX_NUMNODES; i++) {
+			if (default_hugepages_in_node[i] != 0)
+				default_hstate.max_huge_pages_node[i] =
+					default_hugepages_in_node[i];
+		}
 		default_hstate_max_huge_pages = 0;
 	}
 
-	return 1;
+	return 0;
+}
+hugetlb_early_param("default_hugepagesz", default_hugepagesz_setup);
+
+void __init hugetlb_bootmem_alloc(void)
+{
+	struct hstate *h;
+
+	hugetlb_parse_params();
+
+	for_each_hstate(h) {
+		if (hstate_is_gigantic(h))
+			hugetlb_hstate_alloc_pages(h);
+	}
 }
-__setup("default_hugepagesz=", default_hugepagesz_setup);
 
 static unsigned int allowed_mems_nr(struct hstate *h)
 {
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 7735972add01..5b484758f813 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -444,7 +444,11 @@ DEFINE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
 EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
 
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
-core_param(hugetlb_free_vmemmap, vmemmap_optimize_enabled, bool, 0);
+static int __init hugetlb_vmemmap_optimize_param(char *buf)
+{
+	return kstrtobool(buf, &vmemmap_optimize_enabled);
+}
+early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
 
 static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2630cc30147e..d2dee53e95dd 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -30,6 +30,7 @@
 #include <linux/crash_dump.h>
 #include <linux/execmem.h>
 #include <linux/vmstat.h>
+#include <linux/hugetlb.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -2641,6 +2642,8 @@ static void __init mem_init_print_info(void)
  */
 void __init mm_core_init(void)
 {
+	hugetlb_bootmem_alloc();
+
 	/* Initializations relying on SMP setup */
 	BUILD_BUG_ON(MAX_ZONELISTS > 2);
 	build_all_zonelists(NULL);
-- 
2.48.1.262.g85cc9f2d1e-goog

