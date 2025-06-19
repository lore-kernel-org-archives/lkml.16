Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0ED17D2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357972; cv=none; b=r+ij/hmx1hgsjEMQbCXEjXKKKBGkegBG+LsJUTADk6Pe8i4cL45XHlsKqWGPntLWo6+U0GumF7vngowLrCUG9vzFhg9ay6N7p1LSKiIzKhoKln/owi6HjE9HkeEyCpePyV420ymAB59vBGpTVstc1eavXcogiCkHqT9rUd4rDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357972; c=relaxed/simple;
	bh=JAN25KtDxJlwmBMR+j4CNmzas4Hz2+5Cd5SBNPVTBGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gxfVWy3AoTThwDwOkeRzR8dy5DiOgHrW3pg+I0/r0O17hSFxFM/O9V4dHhvvUky6Kdn4U9big3DD/br4t+k1vLv2y95PiP8xvcioB2ajvVJ5dHdE48nAEBKz1+0JNWRyHn6VWfEsJX+T1yc9Y5ZtEpGX7iYiCBauUXYg/srCZkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=avh9Op8b; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="avh9Op8b"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750357967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rk1XrNVw6kdosuxgoceVk/dfJwPjANKclVJ6ABpWvlQ=;
	b=avh9Op8bICMJcNtHFIZwcOnF785QKsjRPMk8Q+1lsy5MlLYulrMbQbpJKjzG7/9DtEmSpT
	D6XgLm54Q8rwZLmNbWxPXJpctlEDsSvaxLZ8HgrUcm6a2lzkUPu4QD1yhnCLAFAnNCtfWq
	Vkak6YJWUiCZ/bUkZLg/4Hihog9VLw8=
From: Hao Ge <hao.ge@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>,
	Hao Ge <gehao@kylinos.cn>
Subject: [PATCH] mm/alloc_tag: Fix the kmemleak false positive issue in the allocation of the percpu variable tag->counters
Date: Fri, 20 Jun 2025 02:31:54 +0800
Message-Id: <20250619183154.2122608-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hao Ge <gehao@kylinos.cn>

When loading a module, as long as the module has memory
allocation operations, kmemleak produces a false positive
report that resembles the following:

unreferenced object (percpu) 0x7dfd232a1650 (size 16):
  comm "modprobe", pid 1301, jiffies 4294940249
  hex dump (first 16 bytes on cpu 2):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_alloc_percpu+0xb4/0xd0
    pcpu_alloc_noprof+0x700/0x1098
    load_module+0xd4/0x348
    codetag_module_init+0x20c/0x450
    codetag_load_module+0x70/0xb8
    load_module+0xef8/0x1608
    init_module_from_file+0xec/0x158
    idempotent_init_module+0x354/0x608
    __arm64_sys_finit_module+0xbc/0x150
    invoke_syscall+0xd4/0x258
    el0_svc_common.constprop.0+0xb4/0x240
    do_el0_svc+0x48/0x68
    el0_svc+0x40/0xf8
    el0t_64_sync_handler+0x10c/0x138
    el0t_64_sync+0x1ac/0x1b0

This is because the module can only indirectly reference alloc_tag_counters
through the alloc_tag section, which misleads kmemleak.

However, we don't have a kmemleak ignore interface for percpu
allocations yet. So let's create one and invoke it for tag->counters.

Fixes: 12ca42c23775 ("alloc_tag: allocate percpu counters for module tags dynamically")
Signed-off-by: Hao Ge <gehao@kylinos.cn>
---
 include/linux/kmemleak.h |  1 +
 lib/alloc_tag.c          |  8 +++++++-
 mm/kmemleak.c            | 14 ++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/kmemleak.h b/include/linux/kmemleak.h
index 93a73c076d16..2ea8e66bf689 100644
--- a/include/linux/kmemleak.h
+++ b/include/linux/kmemleak.h
@@ -28,6 +28,7 @@ extern void kmemleak_update_trace(const void *ptr) __ref;
 extern void kmemleak_not_leak(const void *ptr) __ref;
 extern void kmemleak_transient_leak(const void *ptr) __ref;
 extern void kmemleak_ignore(const void *ptr) __ref;
+extern void kmemleak_igonore_percpu(const void __percpu *ptr) __ref;
 extern void kmemleak_scan_area(const void *ptr, size_t size, gfp_t gfp) __ref;
 extern void kmemleak_no_scan(const void *ptr) __ref;
 extern void kmemleak_alloc_phys(phys_addr_t phys, size_t size,
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index d48b80f3f007..de6dcf4ea0f5 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -10,6 +10,7 @@
 #include <linux/seq_buf.h>
 #include <linux/seq_file.h>
 #include <linux/vmalloc.h>
+#include <linux/kmemleak.h>
 
 #define ALLOCINFO_FILE_NAME		"allocinfo"
 #define MODULE_ALLOC_TAG_VMAP_SIZE	(100000UL * sizeof(struct alloc_tag))
@@ -632,8 +633,13 @@ static int load_module(struct module *mod, struct codetag *start, struct codetag
 			       mod->name);
 			return -ENOMEM;
 		}
-	}
 
+		/*
+		 * Avoid a kmemleak false positive. The pointer to the counters is stored
+		 * in the alloc_tag section of the module and cannot be directly accessed.
+		 */
+		kmemleak_igonore_percpu(tag->counters);
+	}
 	return 0;
 }
 
diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index da9cee34ee1b..8797fe88861e 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1246,6 +1246,20 @@ void __ref kmemleak_transient_leak(const void *ptr)
 }
 EXPORT_SYMBOL(kmemleak_transient_leak);
 
+/**
+ * kmemleak_ignore_phys - similar to kmemleak_ignore but taking a percpu
+ *			  address argument
+ * @ptr:	percpu address of the object
+ */
+void __ref kmemleak_igonore_percpu(const void __percpu *ptr)
+{
+	pr_debug("%s(0x%px)\n", __func__, ptr);
+
+	if (kmemleak_enabled && ptr && !IS_ERR_PCPU(ptr))
+		make_black_object((unsigned long)ptr, OBJECT_PERCPU);
+}
+EXPORT_SYMBOL_GPL(kmemleak_igonore_percpu);
+
 /**
  * kmemleak_ignore - ignore an allocated object
  * @ptr:	pointer to beginning of the object
-- 
2.25.1

