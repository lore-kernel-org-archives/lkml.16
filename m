Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15C22CBE6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182422; cv=none; b=TPGBOD7zPg2C58fnXCHGkfleSnqlGMq6i4wbk5K3edDGoAS+nd7UEGE1nqVau9Jc+2DeAjTzbqdYxMAMuC5krGLk9gHfJIocQv/E3N8MLACEZO3rBS94TpHXGvvw5UZt/6H2/CqL4lV3S3iSi04y2kBnS+2khKUM2vmmVLrvYs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182422; c=relaxed/simple;
	bh=o0oQ8mZEvcUWUHkzpwNeZxo8/gDgobO52WaprMFBHMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sec6mT64Drf5Qpz0RF5TNEpFuQ0vibtxJfkHJfLDTyY+J0LA2YhA7ohP6l7X+cM1VzcG/2ZJk8spH6EjmUos46MOyHZ5AyFms89j5lT1TaW9JXhLpE/ag6j89iCwZ3DOxt7BhPu5sq4+AWxjGNw8RePqd4DXGYoj2M17LqxgGoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dJD3cWLW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dJD3cWLW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5662231b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744182420; x=1744787220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujmYaz1xhzgQruKX3gsS9ChwvjKO75yxs6+zEFvJeXQ=;
        b=dJD3cWLW3En9nqd2BMNIK/lz2moiQ1sVVFlC416i0FqS/j6dVBU2J10BhbmkXnQ7zQ
         55cNcqRW4Jyfu6hOSVnYbALHkGAtoA1oIPPlbzSCGLwpxMPGgdmUaOm5SkjlBmgloqCF
         RgDL1kRg2SosUnV2OpG4uWYSN/cGw8fiJMulKlK7wv1LeVXBDd5rKSB8YbA0xHabSJwE
         ToRWiy6CElz8fgoDcGVtjVtFiajISml5MtFZ9zuqI2t0ojYmqmvSJPPs1jLQko/UFsGS
         Phxkei3FXiUtWS1wSsdEK4Z8i+4HuDKYLBhzR4XB4EYpC1CoNfFqySR2kiv4jiNgKZUC
         zqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182420; x=1744787220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujmYaz1xhzgQruKX3gsS9ChwvjKO75yxs6+zEFvJeXQ=;
        b=kadR+rIp1aJVvZX2GVO8+chcg6easDnEZM5jaXDZGY7o/XlsoPkaItCGsG45maQcxH
         4xeSQZNfhKH309OHlrJ9Cw6OigSLm71p/Lb/5k3zEp8QpIeDd+AD+P2iL5u6TYNf+wU0
         ybZOKxCiYMNNHXx7aC2hLoUelVWOxNKKZOFAQSDlJrYZ9NFPOMaEmPh5G0xe1yq5jqoA
         iA786N27BVs0R/R8vr0do+qsyGj5EQsEv2GegN1gw4U+q2nmz+12w/qYMrdISHcbF8iY
         zXm0Ar+pr++BL7KImQO81nWu56BZk4aPaoDVPcT8WP6R09QkAsIZPZOfto+QsnfRmrmK
         bviw==
X-Forwarded-Encrypted: i=1; AJvYcCX5PBTa8QdE/2CAWItVz06H8tpw0SH/47LqulPv8gQ5cw5UonJ7O6v1FU3y7svGFFSxhM020h7+U0H9A4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YytbZso1EZtIP3CA81znuLIjM37kAu0Ic2kFf9Vj+M5UWpn46UY
	gNAkqcMgyN3QYwoRRZsrQ44e47Lu3kAnigt98xR+sUfEMgUKQtrx8/GFjmSvFYU=
X-Gm-Gg: ASbGncuFx5kHGPmm0dCzJTYgOSMgzJtvyyHP5qfQwuK5bo3ndY6Wms7ZoAzTWym/brN
	R43O6pHgTeZuhSziS9f4T/k6HRKBGJOJeiEZjRaAg6feSjQ5kH8q2sQZp1CsugebQmGh/xsmoyG
	SnIEi25UMRENVyZdvudSsX2wxRTSEjPNdozU9aOFLBvCt7ehub8NI68WKX8k8fp4Ad51Q3/gp26
	FV/Cqnw9kuGYAYO1F9U4hzoDyiMUfDuCkgCP4kNN1ndJPaJFkkfwh0GVQspI8P1j6e3LNZgWiuE
	RTi/Dj/4isdgJ2sqgqUqMjpWe8N0m+s2loxG7WJs+smL2CHH5ToBvjYJSDtrRkRAmw==
X-Google-Smtp-Source: AGHT+IF7GDjhZRQpVU8yYUwePq+oEDguHY3UMiaiTFMPBsZnqmwOAVKFg5rczv+LKfHVkKSU2/h6og==
X-Received: by 2002:a05:6a21:9106:b0:1f5:7366:2a01 with SMTP id adf61e73a8af0-201592fdfe1mr2896234637.37.1744182419773;
        Wed, 09 Apr 2025 00:06:59 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d44800sm565754b3a.37.2025.04.09.00.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:06:59 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@suse.com,
	yosry.ahmed@linux.dev,
	muchun.song@linux.dev,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH V3 1/3] mm: add swappiness=max arg to memory.reclaim for only anon reclaim
Date: Wed,  9 Apr 2025 15:06:18 +0800
Message-Id: <720e8e2c5b84efed5cf9980567794e7c799d179a.1744169302.git.hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With this patch 'commit <68cd9050d871> ("mm: add swappiness= arg to
memory.reclaim")', we can submit an additional swappiness=<val> argument
to memory.reclaim. It is very useful because we can dynamically adjust
the reclamation ratio based on the anonymous folios and file folios of
each cgroup. For example,when swappiness is set to 0, we only reclaim
from file folios.

However,we have also encountered a new issue: when swappiness is set to
the MAX_SWAPPINESS, it may still only reclaim file folios.

So, we hope to add a new arg 'swappiness=max' in memory.reclaim where
proactive memory reclaim only reclaims from anonymous folios when
swappiness is set to max. The swappiness semantics from a user
perspective remain unchanged.

For example, something like this:

echo "2M swappiness=max" > /sys/fs/cgroup/memory.reclaim

will perform reclaim on the rootcg with a swappiness setting of 'max' (a
new mode) regardless of the file folios. Users have a more comprehensive
view of the application's memory distribution because there are many
metrics available. For example, if we find that a certain cgroup has a
large number of inactive anon folios, we can reclaim only those and skip
file folios, because with the zram/zswap, the IO tradeoff that
cache_trim_mode or other file first logic is making doesn't hold -
file refaults will cause IO, whereas anon decompression will not.

With this patch, the swappiness argument of memory.reclaim has a new
mode 'max', means reclaiming just from anonymous folios both in traditional
LRU and MGLRU.

Here is the previous discussion:
https://lore.kernel.org/all/20250314033350.1156370-1-hezhongkun.hzk@bytedance.com/
https://lore.kernel.org/all/20250312094337.2296278-1-hezhongkun.hzk@bytedance.com/
https://lore.kernel.org/all/20250318135330.3358345-1-hezhongkun.hzk@bytedance.com/

Suggested-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 3 +++
 include/linux/swap.h                    | 4 ++++
 mm/memcontrol.c                         | 5 +++++
 mm/vmscan.c                             | 7 +++++++
 4 files changed, 19 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 1a16ce68a4d7..472c01e0eb2c 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1348,6 +1348,9 @@ The following nested keys are defined.
 	same semantics as vm.swappiness applied to memcg reclaim with
 	all the existing limitations and potential future extensions.
 
+	The valid range for swappiness is [0-200, max], setting
+	swappiness=max exclusively reclaims anonymous memory.
+
   memory.peak
 	A read-write single value file which exists on non-root cgroups.
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index db46b25a65ae..f57c7e0012ba 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -414,6 +414,10 @@ extern unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 #define MEMCG_RECLAIM_PROACTIVE (1 << 2)
 #define MIN_SWAPPINESS 0
 #define MAX_SWAPPINESS 200
+
+/* Just recliam from anon folios in proactive memory reclaim */
+#define SWAPPINESS_ANON_ONLY (MAX_SWAPPINESS + 1)
+
 extern unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
 						  unsigned long nr_pages,
 						  gfp_t gfp_mask,
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 421740f1bcdc..b0b3411dc0df 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -4396,11 +4396,13 @@ static ssize_t memory_oom_group_write(struct kernfs_open_file *of,
 
 enum {
 	MEMORY_RECLAIM_SWAPPINESS = 0,
+	MEMORY_RECLAIM_SWAPPINESS_MAX,
 	MEMORY_RECLAIM_NULL,
 };
 
 static const match_table_t tokens = {
 	{ MEMORY_RECLAIM_SWAPPINESS, "swappiness=%d"},
+	{ MEMORY_RECLAIM_SWAPPINESS_MAX, "swappiness=max"},
 	{ MEMORY_RECLAIM_NULL, NULL },
 };
 
@@ -4434,6 +4436,9 @@ static ssize_t memory_reclaim(struct kernfs_open_file *of, char *buf,
 			if (swappiness < MIN_SWAPPINESS || swappiness > MAX_SWAPPINESS)
 				return -EINVAL;
 			break;
+		case MEMORY_RECLAIM_SWAPPINESS_MAX:
+			swappiness = SWAPPINESS_ANON_ONLY;
+			break;
 		default:
 			return -EINVAL;
 		}
diff --git a/mm/vmscan.c b/mm/vmscan.c
index b620d74b0f66..c99a6a48d0bc 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2503,6 +2503,13 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
 		goto out;
 	}
 
+	/* Proactive reclaim initiated by userspace for anonymous memory only */
+	if (swappiness == SWAPPINESS_ANON_ONLY) {
+		WARN_ON_ONCE(!sc->proactive);
+		scan_balance = SCAN_ANON;
+		goto out;
+	}
+
 	/*
 	 * Do not apply any pressure balancing cleverness when the
 	 * system is close to OOM, scan both anon and file equally
-- 
2.39.5

