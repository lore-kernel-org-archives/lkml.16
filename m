Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF515575D
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 23:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738451890; cv=none; b=qG6XdaRp8GmEmMemgUYcVNxie3HQIDKIAlOs+cnOZXz0uEzVyrdCb45KqHjvqzZyM9tLuIUDJbK5jsUqlL9cTTKo02zyzozH03y4s7pFtxfKpiOkkQFdhqueDCJaCQvsuSZtJ8kP04i2QegjI5kA2Rwy0BJjNDgZsjyup0SHrOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738451890; c=relaxed/simple;
	bh=hGjb67w6hk2DHf/cntrqfX0GF0LgBsYxd2W4mA4Cl3I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WAk3NTxnVNvAQ5kG/yxC76qWMXLzetqpoFOG/HC4FGVjBWVv4zUB29iGBfADVGFJo8W5KvG3NhGzz1BNxgYZ5p0+dC8kQpa1QcNIHgGcNn1Z+zBNnHPu9uXTEUmhAzYDFBzv0id2bOcdBtCBezOnXPkdt7NmbcFPCva6r4muWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qwwvv/mg; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qwwvv/mg"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21648ddd461so64047945ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738451888; x=1739056688; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LHGz0Xil5zeJ4evV+ex8j8EcdekSjxZZZh0JGQMV40=;
        b=qwwvv/mgjzi2m+24gIUwIErkozDkcUHbm26T1CHKDsTX+IWe6GtIYIwxeU43tkiMJF
         wcNrOf4aPQFK6Hy7Uz2jFbigswFGnKIERoTLXGPdk1424ieck6LuFBMppcP831/Ewsq2
         JrIDujC2534lSEIGJSjUaKBqCivWJfWVymnI+u6WDh42HBrqZL+bhbunKStSsRxaFGXl
         VApJGqtJA+z3Le0268S97ttk6aK+097d6kFQgEKLpLJpS9tC/b9HvSFxmX8LMzqmrvEe
         BBFBMLepQLr/XfxS6JPIuRs3ugvlf4z1Jiw0Je7p9+nHshQjAJSObzVEB9fmU22ippXC
         3jDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738451888; x=1739056688;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LHGz0Xil5zeJ4evV+ex8j8EcdekSjxZZZh0JGQMV40=;
        b=bsN1ctqDpUt1nqz76VJ+4u3f+TpWmcFjscTPdPs5KEPu5pGp4owFxnP/+pXXnkgtS6
         zHtABG4PaXMCMnqJkkNqOwQBPl/G/cFr/OxFVgfnTDbocOcKByJfwEMwG9vy6viTqhI8
         XiVgWfnPEhQV9198w6hw1k2u/a0Tm1GDbO8u32alUhhXYVu9EIFR2vRxs5R34B0YGNtW
         ZtpNMRUJwI1PFsE6af1Lq6pC2IDFd5DoLLZb22WEhv7mgCjOPmwMY/r4EHuws+MmSlKQ
         z5DLtwxgsAZCr7TEPQ83vVFjj0WnvTx2eA/bBq1gilSt4uDyV5nYIBvc2UTNXwHF+ocy
         ODBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlM/QWCMVfKTl/V9V8G8Us6aj6sP/v4STF/HP3Ufb5hLE218OqHLVEc6gIx7SjBN6jiN0Y4/4gAHi1CaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+FayUs0xaM4OhkfmDF1fIg14djA0NlWCTKdDW3a5YCFILCq2U
	EgZuHj9Rl0ql0bMEFAT0zqkaJ8Wim/wkDngIXSLvex2b/ugtgoszHAb4knh0V1G+6X5U0aKuTu4
	DaA==
X-Google-Smtp-Source: AGHT+IE2vxYeAR9419oUgZ2ihycmI1jsvSuPTWn2lYlIeN6Pbw/ZzCEAbsoRXT2NV98TB1fIQxgW3UhypMQ=
X-Received: from pjbpa13.prod.google.com ([2002:a17:90b:264d:b0:2ef:8055:93d9])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c941:b0:215:5ea2:654b
 with SMTP id d9443c01a7336-21dd7c49718mr257314855ad.1.1738451888074; Sat, 01
 Feb 2025 15:18:08 -0800 (PST)
Date: Sat,  1 Feb 2025 15:18:01 -0800
In-Reply-To: <20250201231803.2661189-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201231803.2661189-1-surenb@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201231803.2661189-2-surenb@google.com>
Subject: [PATCH v2 2/3] alloc_tag: uninline code gated by mem_alloc_profiling_key
 in slab allocator
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, vbabka@suse.cz, rostedt@goodmis.org, 
	peterz@infradead.org, yuzhao@google.com, minchan@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	00107082@163.com, quic_zhenhuah@quicinc.com, surenb@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a sizable code section is protected by a disabled static key, that
code gets into the instruction cache even though it's not executed and
consumes the cache, increasing cache misses. This can be remedied by
moving such code into a separate uninlined function.
On a Pixel6 phone, slab allocation profiling overhead measured with
CONFIG_MEM_ALLOC_PROFILING=y and profiling disabled is:

             baseline             modified
Big core     3.31%                0.17%
Medium core  3.79%                0.57%
Little core  6.68%                1.28%

This improvement comes at the expense of the configuration when profiling
gets enabled, since there is now an additional function call. The overhead
from this additional call on Pixel6 is:

Big core     0.66%
Middle core  1.23%
Little core  2.42%

However this is negligible when compared with the overall overhead of the
memory allocation profiling when it is enabled.
On x86 this patch does not make noticeable difference because the overhead
with mem_alloc_profiling_key disabled is much lower (under 1%) to start
with, so any improvement is less visible and hard to distinguish from the
noise. The overhead from additional call when profiling is enabled is also
within noise levels.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Changes since v1 [1]:
- Removed inline_if_mem_alloc_prof and uninlined the gated code
unconditionally, per Steven Rostedt and Vlastimil Babka
- Updated changelog to include overhead when profiling is enabled

[1] https://lore.kernel.org/all/20250126070206.381302-2-surenb@google.com/

 mm/slub.c | 51 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 1f50129dcfb3..184fd2b14758 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2000,7 +2000,8 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
 	return 0;
 }
 
-static inline void free_slab_obj_exts(struct slab *slab)
+/* Should be called only if mem_alloc_profiling_enabled() */
+static noinline void free_slab_obj_exts(struct slab *slab)
 {
 	struct slabobj_ext *obj_exts;
 
@@ -2077,33 +2078,37 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
 	return slab_obj_exts(slab) + obj_to_index(s, slab, p);
 }
 
-static inline void
-alloc_tagging_slab_alloc_hook(struct kmem_cache *s, void *object, gfp_t flags)
+/* Should be called only if mem_alloc_profiling_enabled() */
+static noinline void
+__alloc_tagging_slab_alloc_hook(struct kmem_cache *s, void *object, gfp_t flags)
 {
-	if (need_slab_obj_ext()) {
-		struct slabobj_ext *obj_exts;
+	struct slabobj_ext *obj_exts;
 
-		obj_exts = prepare_slab_obj_exts_hook(s, flags, object);
-		/*
-		 * Currently obj_exts is used only for allocation profiling.
-		 * If other users appear then mem_alloc_profiling_enabled()
-		 * check should be added before alloc_tag_add().
-		 */
-		if (likely(obj_exts))
-			alloc_tag_add(&obj_exts->ref, current->alloc_tag, s->size);
-	}
+	obj_exts = prepare_slab_obj_exts_hook(s, flags, object);
+	/*
+	 * Currently obj_exts is used only for allocation profiling.
+	 * If other users appear then mem_alloc_profiling_enabled()
+	 * check should be added before alloc_tag_add().
+	 */
+	if (likely(obj_exts))
+		alloc_tag_add(&obj_exts->ref, current->alloc_tag, s->size);
 }
 
 static inline void
-alloc_tagging_slab_free_hook(struct kmem_cache *s, struct slab *slab, void **p,
-			     int objects)
+alloc_tagging_slab_alloc_hook(struct kmem_cache *s, void *object, gfp_t flags)
+{
+	if (need_slab_obj_ext())
+		__alloc_tagging_slab_alloc_hook(s, object, flags);
+}
+
+/* Should be called only if mem_alloc_profiling_enabled() */
+static noinline void
+__alloc_tagging_slab_free_hook(struct kmem_cache *s, struct slab *slab, void **p,
+			       int objects)
 {
 	struct slabobj_ext *obj_exts;
 	int i;
 
-	if (!mem_alloc_profiling_enabled())
-		return;
-
 	/* slab->obj_exts might not be NULL if it was created for MEMCG accounting. */
 	if (s->flags & (SLAB_NO_OBJ_EXT | SLAB_NOLEAKTRACE))
 		return;
@@ -2119,6 +2124,14 @@ alloc_tagging_slab_free_hook(struct kmem_cache *s, struct slab *slab, void **p,
 	}
 }
 
+static inline void
+alloc_tagging_slab_free_hook(struct kmem_cache *s, struct slab *slab, void **p,
+			     int objects)
+{
+	if (mem_alloc_profiling_enabled())
+		__alloc_tagging_slab_free_hook(s, slab, p, objects);
+}
+
 #else /* CONFIG_MEM_ALLOC_PROFILING */
 
 static inline void
-- 
2.48.1.362.g079036d154-goog

