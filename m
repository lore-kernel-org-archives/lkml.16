Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE66714830F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685299; cv=none; b=rP2u6C/LjNEp72/NToIDsUp5YSzBN5NbnYiV8Vfc+KsHw5kpxv9ADtomzaCK0B6NhkRSZxuvj78mUfPHA7nAbm54hyoNxn8naCx0lrghdoydYkOTwGW0XDyC1Q65oD3MI2JM9qRRC9zRnmYF8O1DWllH/jM++mCUVVa2YeJoLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685299; c=relaxed/simple;
	bh=fGt3vwXzojBpwJ5OPFRNuUOpmtvk4WgFiUPe9G5ZOto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SPB7qQldRVMjhBZ8B3xiYbi3mdlDZZMJ37TrAyyXopJO9VgQ74qb068Kdsn098cKLmZCaC3EOXkPBS0mxHxoEzKfs028UsozpsqydgneyrxzIgbLhkNx8Z5Qd8kY5hyXxofEL4BvfBBzULXzHXbBgeCDFXRUHzOc3b5KGo5Zzps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Eym07reE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Eym07reE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225df540edcso59350615ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685296; x=1745290096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chHLX5G0loxHSohYhxyRHh7WVRRPsaZ78MDusal3hIs=;
        b=Eym07reEy2An2zdgKEO46ZR05K09ZnxkS0OjAKkBhzf6zxDEKDa9zQtmqAFjSLgn55
         nIGEpTSNqgAdWyL9sPkCE8UqrWMGel5iBICE/Tx2TGA4JN5sX8uXToExhEsKIgdbb8pP
         Je00YfR3G/qUdSJnOAQoVbikc970FT6PENU0p0RtKnrYXrZpOI2IVhUZEcOTZb7K9KPH
         8jF7RhIB+zzWNlpbeXaQgK8+CNCcrGQRYiPUMNO7uIxTr/zmwaJbedKu/kj3d9pqETZj
         JrBfm/U3zLrZdyfectktdZKdZzNGCJ3jN10DY/U922Op7bDL4Q8Vo6mcRg50WydkwiLQ
         fxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685296; x=1745290096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chHLX5G0loxHSohYhxyRHh7WVRRPsaZ78MDusal3hIs=;
        b=DWgLhRwgQwcoodu9H2rJn8+mz6OlT6hFrdAO4qVDU4swOH2w9Fsfz3SK9YoyvgHE4d
         uV76S3zEwEXO4uTliJDYW5kubdiIzi+7XZwyMMpI1zjbGG/MtAQvhqjs6iA+RNwnWwfX
         Vt8XjX6o1XwupnKNfJZRZ3q2PjqTeWlFZEfAUJyrSyzQytxXwsmEA+kSHDrk4QN5RWY0
         GacPQ0djh4z94xAnR2nrpY701VkhSGMSijb40Q+mX1+aNG1VC1y+Af4qtiP5LIpmRw0J
         Nwt755kCawW4xlNXe+0B2r1sqmcSbU479usrwzfcTvQxT0dZ7FFw36fdYgVgBFMofPTG
         kzJw==
X-Gm-Message-State: AOJu0YzgrK0xsG8+pStNLZh1qYoJ3iuZ+iUUwt50c4AyaaIU2XX5xNwq
	WQZQjujLPOdLOhoHe5sK+29R50k9pOWfbrlkqQSizFWcuL9QuC7aK4N+2vLszog=
X-Gm-Gg: ASbGncuqTYhJhZzDC6fJSnIfPZBWBfr8sYpW7MpChWTzufTa7hl4Ix38Pyu3kY7nNlI
	bUKv/Ut70c1+YMdI4EinGnlMfxKaq1k9VQCoSaLW9HHNxYoOZ1yn1NYyoNFndiOLRcH1vEpD2kZ
	SZfw1dQHjjlBzvLtYzFOpX7iBgefZCdQqA+2Oo7x/vWLKNHW09ahnVCAmAqTl10vYnYkElUhsW+
	VRLpA3m3sCcLsaBzKaVX0/oJtF0WO92fsrVcDdu82hAc4ZbilVAnJyd86kSNLg5yUgFZZ75NL00
	0JVR1ufkcQUEp0YWIOy+dmczmKKnzf4p/u+np+5EpVS2CJ8TFS1CygpQGRotuirI7efaCGBo
X-Google-Smtp-Source: AGHT+IHfdYPb0mTyQBEggcIEtJXMdJHS98DVkuG5qNfvvUIjwBW9edwqUb5MNEzj4f0Vk/I+xU8TBA==
X-Received: by 2002:a17:903:3203:b0:215:58be:3349 with SMTP id d9443c01a7336-22c24987312mr27942235ad.14.1744685296075;
        Mon, 14 Apr 2025 19:48:16 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.48.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:48:15 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@fromorbit.com,
	zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH RFC 26/28] mm: memcontrol: introduce memcg_reparent_ops
Date: Tue, 15 Apr 2025 10:45:30 +0800
Message-Id: <20250415024532.26632-27-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250415024532.26632-1-songmuchun@bytedance.com>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the previous patch, we established a method to ensure the safety of the
lruvec lock and the split queue lock during the reparenting of LRU folios.
The process involves the following steps:

    memcg_reparent_objcgs(memcg)
        1) lock
        // lruvec belongs to memcg and lruvec_parent belongs to parent memcg.
        spin_lock(&lruvec->lru_lock);
        spin_lock(&lruvec_parent->lru_lock);

        2) relocate from current memcg to its parent
        // Move all the pages from the lruvec list to the parent lruvec list.

        3) unlock
        spin_unlock(&lruvec_parent->lru_lock);
        spin_unlock(&lruvec->lru_lock);

In addition to the folio lruvec lock, the deferred split queue lock
(specific to THP) also requires a similar approach. Therefore, we abstract
the three essential steps from the memcg_reparent_objcgs() function.

    memcg_reparent_objcgs(memcg)
        1) lock
        memcg_reparent_ops->lock(memcg, parent);

        2) relocate
        memcg_reparent_ops->relocate(memcg, reparent);

        3) unlock
        memcg_reparent_ops->unlock(memcg, reparent);

Currently, two distinct locks (such as the lruvec lock and the deferred
split queue lock) need to utilize this infrastructure. In the subsequent
patch, we will employ these APIs to ensure the safety of these locks
during the reparenting of LRU folios.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/memcontrol.h | 20 ++++++++++++
 mm/memcontrol.c            | 62 ++++++++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 27b23e464229..0e450623f8fa 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -311,6 +311,26 @@ struct mem_cgroup {
 	struct mem_cgroup_per_node *nodeinfo[];
 };
 
+struct memcg_reparent_ops {
+	/*
+	 * Note that interrupt is disabled before calling those callbacks,
+	 * so the interrupt should remain disabled when leaving those callbacks.
+	 */
+	void (*lock)(struct mem_cgroup *src, struct mem_cgroup *dst);
+	void (*relocate)(struct mem_cgroup *src, struct mem_cgroup *dst);
+	void (*unlock)(struct mem_cgroup *src, struct mem_cgroup *dst);
+};
+
+#define DEFINE_MEMCG_REPARENT_OPS(name)					\
+	const struct memcg_reparent_ops memcg_##name##_reparent_ops = {	\
+		.lock		= name##_reparent_lock,			\
+		.relocate	= name##_reparent_relocate,		\
+		.unlock		= name##_reparent_unlock,		\
+	}
+
+#define DECLARE_MEMCG_REPARENT_OPS(name)				\
+	extern const struct memcg_reparent_ops memcg_##name##_reparent_ops
+
 /*
  * size of first charge trial.
  * TODO: maybe necessary to use big numbers in big irons or dynamic based of the
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1f0c6e7b69cc..3fac51179186 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -194,24 +194,60 @@ static struct obj_cgroup *obj_cgroup_alloc(void)
 	return objcg;
 }
 
-static void memcg_reparent_objcgs(struct mem_cgroup *memcg)
+static void objcg_reparent_lock(struct mem_cgroup *src, struct mem_cgroup *dst)
+{
+	spin_lock(&objcg_lock);
+}
+
+static void objcg_reparent_relocate(struct mem_cgroup *src, struct mem_cgroup *dst)
 {
 	struct obj_cgroup *objcg, *iter;
-	struct mem_cgroup *parent = parent_mem_cgroup(memcg);
 
-	objcg = rcu_replace_pointer(memcg->objcg, NULL, true);
+	objcg = rcu_replace_pointer(src->objcg, NULL, true);
+	/* 1) Ready to reparent active objcg. */
+	list_add(&objcg->list, &src->objcg_list);
+	/* 2) Reparent active objcg and already reparented objcgs to dst. */
+	list_for_each_entry(iter, &src->objcg_list, list)
+		WRITE_ONCE(iter->memcg, dst);
+	/* 3) Move already reparented objcgs to the dst's list */
+	list_splice(&src->objcg_list, &dst->objcg_list);
+}
 
-	spin_lock_irq(&objcg_lock);
+static void objcg_reparent_unlock(struct mem_cgroup *src, struct mem_cgroup *dst)
+{
+	spin_unlock(&objcg_lock);
+}
 
-	/* 1) Ready to reparent active objcg. */
-	list_add(&objcg->list, &memcg->objcg_list);
-	/* 2) Reparent active objcg and already reparented objcgs to parent. */
-	list_for_each_entry(iter, &memcg->objcg_list, list)
-		WRITE_ONCE(iter->memcg, parent);
-	/* 3) Move already reparented objcgs to the parent's list */
-	list_splice(&memcg->objcg_list, &parent->objcg_list);
-
-	spin_unlock_irq(&objcg_lock);
+static DEFINE_MEMCG_REPARENT_OPS(objcg);
+
+static const struct memcg_reparent_ops *memcg_reparent_ops[] = {
+	&memcg_objcg_reparent_ops,
+};
+
+#define DEFINE_MEMCG_REPARENT_FUNC(phase)				\
+	static void memcg_reparent_##phase(struct mem_cgroup *src,	\
+					   struct mem_cgroup *dst)	\
+	{								\
+		int i;							\
+									\
+		for (i = 0; i < ARRAY_SIZE(memcg_reparent_ops); i++)	\
+			memcg_reparent_ops[i]->phase(src, dst);		\
+	}
+
+DEFINE_MEMCG_REPARENT_FUNC(lock)
+DEFINE_MEMCG_REPARENT_FUNC(relocate)
+DEFINE_MEMCG_REPARENT_FUNC(unlock)
+
+static void memcg_reparent_objcgs(struct mem_cgroup *src)
+{
+	struct mem_cgroup *dst = parent_mem_cgroup(src);
+	struct obj_cgroup *objcg = rcu_dereference_protected(src->objcg, true);
+
+	local_irq_disable();
+	memcg_reparent_lock(src, dst);
+	memcg_reparent_relocate(src, dst);
+	memcg_reparent_unlock(src, dst);
+	local_irq_enable();
 
 	percpu_ref_kill(&objcg->refcnt);
 }
-- 
2.20.1

