Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD3E3BBC9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226845; cv=none; b=ftMs3kuemnoEDVjFyGcchrhS/BP7UFRckVJ2iQsmxSoBpCNPFp4d/3Opoxxw9WYQpAQ/U04mk8p4AudhlKfLOifIeL718b9on7zhFHLog/d0JsqkvmmXdXdZerBG63/bnEdb56vw5MvNr0nI2tbVjzj5h2Oj19vqmdZQlL/drhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226845; c=relaxed/simple;
	bh=na0tf5sit+luKBwCF5RgPCxKQY5xZnDJHAwP9xyIyPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ngp4B0iUUzNC3fW5lJeQr2IOAfcfO+9jylG3E2hHNyHPS3ze4DNKRqtuMY5xiaP9bLTJ2m5ZwUb61nb4gGPNJLYIUdwpJ2FWLJlSxnlPh6IdKRz3GJBSTod0TTE6CPil/ItDGsBxQd1vWrvOoj6+310kuuMcRIRfSkPNbvZ5XAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=h8VOJQwl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="h8VOJQwl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227d6b530d8so37681195ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745226842; x=1745831642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwNGrkHqtII9hHebmCv8hT2EO8L3wdoKwS9DkX4S/JM=;
        b=h8VOJQwlJMaPZBetuBvji2CkvLUdWLtquzf9Kh0bZnPtYpgVC/0a25CLH7dVTnDx1m
         tMV2JUtR4oO8dwFdd3XSh9VMhhm8+rLFcrgZCxhz2KdjRCkO3QPgct86hepWa343fMaS
         3U8VGNPMSoQM2+vVPoZZHfVaQL2U9MM87+dAYrj8s0fbNcigex234EEh9ut+/AIM+gy1
         3d176Rxf+oIR1Ou6rfbZX7PuA3zHQxSyJ7qWXVtxzb/nwLcPxiviDusMbuk+tyeZ8QAa
         ASfD3VVfYpsSn5i7ryWa1ZwdbZMxzMIHGRkE82MEgu0IdzcoKOimzA51CUxpA2HhohDZ
         WqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226842; x=1745831642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwNGrkHqtII9hHebmCv8hT2EO8L3wdoKwS9DkX4S/JM=;
        b=jypyNS/GqgwXwkU5MJ1Z+qnIxlkos8PIZnMKeGGU4vMwXtZZjrWTxXTD5MU7Z8n8Ao
         RVJCRkvEkd1C2Z0HJZtWtaIEXL0ZRYFiS379Od3hjyJA3+6F5c5+hssbHG7pJO/liQMe
         Z3cKNn+4nbFHG21IOv4WLFRkSZ+yopfQv+i28p8aTzM7zd/EzVTLzzqvIByifznjYyLo
         IvPyOcekJ7pgeF20Kk/k35g89bksJ/m0FCi7iUrQLH3UhS6EecWjopQzA9wqGgJw1n4w
         Aqy4+Bfn/pk54nkEPxC/RrDvGUxZNGK3bTSu079C/EIQo3kbLyh5ug19eJMKvm4tTfq8
         eFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa2aCcgVQPxM90vEKyKB+71qJwOTNfSzFwqipxtBA+YBfc8SvCf9MZ62XyqlQMJNSAIST6jBHxqUARJR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9u+KJG4HuIm3tuqwukWPSeWgc93p5ZzDxAlxKK8tNBAw7oJn
	4u8McdFdyzveubRku7/HzpHqi5SYoSZktEZsjDB6DV9JrsIRm+3eqhf0MP1a5HI=
X-Gm-Gg: ASbGncsXkkjQJIeP558jZvZOPCQWuN50RCHFDZ6MZ+6eELQcEWoJCSrboOwHJbtx5RK
	Znc4En2XUFR6KMC82/4ZsojwFWBOYRuFbXX3OuDcMFW3ZIOENyv3Q2g+LUZeurQrsYDnUbLsMSN
	Bz3sNOca3VayQ4nsUhyuvQL3KusDQLKO5SJc4PreQaqB8cQVrhU5dkvaZZRYuq+4c7evCUe6I3V
	8J7/urPgfcJuBJSffv2dsrPr8RppuTbFP7MUKh+ox6htuTejvfUhrRBELb9LlxVGuFbQz2MLJO/
	VpsEclF4EW+ueNOsqA6+/sMSFKeqo3Cfy2K3bjV5LJIivGR6DZMkZxyO4G0DJR1HdQ==
X-Google-Smtp-Source: AGHT+IG8Xt4Ez8eHR0AdyQar+DTN2NHlhc9GFJ7M3y+sg+/0Ss8t7pUCmNYFFQfl4rEm0AP3+cR/yw==
X-Received: by 2002:a17:902:e54e:b0:22c:35c5:e30d with SMTP id d9443c01a7336-22c53583e3dmr138421385ad.13.1745226842358;
        Mon, 21 Apr 2025 02:14:02 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db157be12sm5246285a12.64.2025.04.21.02.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:14:01 -0700 (PDT)
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
Subject: [PATCH V4 1/4] mm: add swappiness=max arg to memory.reclaim for only anon reclaim
Date: Mon, 21 Apr 2025 17:13:28 +0800
Message-Id: <519e12b9b1f8c31a01e228c8b4b91a2419684f77.1745225696.git.hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
References: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
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
index c96c1f2b9cf5..796c78b26e43 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -4395,11 +4395,13 @@ static ssize_t memory_oom_group_write(struct kernfs_open_file *of,
 
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
 
@@ -4433,6 +4435,9 @@ static ssize_t memory_reclaim(struct kernfs_open_file *of, char *buf,
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
index 3783e45bfc92..ebe1407f6741 100644
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

