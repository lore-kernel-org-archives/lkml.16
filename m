Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8421A437
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685164; cv=none; b=VzkzrX0F+PJcjJ4Sotv4oE0XH17gTGc8iTnR43s5ZNVmGVcXZzSrf29YpwBFYy267i1PmsMhgYm00wxMfZpoXUdcBNpe7/M/niUNOsRdqp0VncwazG0b8qCuyFKyj08gJpAkFo+fI4J3BXGB3076sgEsi8rgMA86kLXKdEmDsR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685164; c=relaxed/simple;
	bh=IbU9S+gNd9H4vOMxRrhOwxpGymSk9IS2B1xUn+hKwUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OdGv7IhrZDxSaicqnkNCSRpqhzOYxCyXo1Uwy7Ja2rp8dV6pOkQGeuP9c7EX3kj5Boeq8k6EhdLCDlksoOI20kYA4mLL48VfPbs7Fy1Ki6UngZRFPmab2Zc1l1tAE+zGbuYB8sCiKqPLnzoSldQRwuu6kqEdAuurgFUWIIrdS3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EyDAunD/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EyDAunD/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fd89d036so60574635ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685161; x=1745289961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8KzBx499Eh3TwCUOfkq+U0TMdvhQzDUhsoXtCDxKvc=;
        b=EyDAunD/dohhiGW9sb9mdr1h04B1Sp+y1TCwYmeUUdwIhuXAth0jBjxwOboAVKWSmj
         fzPSykXT6rnX5VfWfUQHXEBoo2WQfk4j7Mz8bpiKyBA+TFdZp3wSjH1s77KUhqjbZitT
         67eDbekpKJZpqVIOJxETII0a6h6iaDvNyvn8Gntnnd4bEEgpvzYt8dtnXD+5MwZwL2PK
         HteGVj/5I+POEe7TERQMOfBn7OZsTPVQRgPCWd2N7PYiiQMM12h/FsYhobjjLd5HyW/g
         Fm9+Rk/JFZHRjbR4YlC23cfa9TTSRu23K9gP7xl97By8/p7OpJGkmj3sHnNHAKZhbEGz
         v2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685161; x=1745289961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8KzBx499Eh3TwCUOfkq+U0TMdvhQzDUhsoXtCDxKvc=;
        b=qQ3g5LrnX7JkDu2iht6HL/v/bS538PfQ06nb9033UQWtFuL/JJyu1Y7uVaQvTgsc79
         AaGqoowFaDksGeqfpqxq6SeGVIpzcVSJruL8OkWB0J/7PU5ujiiCBfy7whjLzvBXTEb7
         fPoC/DXnHZ7TOlJh9NkS40tz4YswYdy188W0jqRqT2fPBeavIr/j43VXumArFenpuiSa
         2OaLyfYRbFw2ifc3o/nP+Q1srvpw5WBxIb6ft8P79oC9q0ucdvxMgGdbP4C7X3CFdowm
         9BSd/SXGrbQqJSWzcxlWD0lKJLd/q1qtEsWLEySpbXOWcBM85eeYLkqtLYntaxj9T4kc
         7OCA==
X-Gm-Message-State: AOJu0Yz4KuoM6IxWf0M2jK7cClmEaXbWaeI3zAemkA0X9Fg2+VSAYZVJ
	uPfhswBtxP5HyK0QokP2wlkeQvvztBR9bT1mUkPGMzMR58YZ9Z3mKsE2mBGfXoI=
X-Gm-Gg: ASbGncurN9D/4X7AX4B4ZYTtiyujBPRXghKr0mLtrZeHDPGS5hatqFH8RHty9QK1WOZ
	1DL8/k2zeqtclxKGmQdfNbr1wglCaRbtSAApuAVhyuhwQKJf4Hb5tIcbU09jebgK/Xj6rGLi2cV
	Av/6EVFQ0bTcuToCOrQNSdqGMyOJDSyZG9Zr/B2t4fJYu4E9lzz2NLu3JvyHS8PjH9VKFZiUonF
	XmLLHR8rE/UFbIthpumvlXdHTnEp0WFWemclQzUo8rqGj8fyOMRyWPw3kn9yvbjo/9pxS3HGoNx
	RU47D24KXAQ9PjzBKhEAGhxLUv6qdpagZqO/X28zv90N3hzdBw1S5IpSoTL9XDRHQEluXy/m
X-Google-Smtp-Source: AGHT+IGjusvGNjKHuKsmMzFyHvfJ71DX0fIRnpQJPK83MJ7aTNHlxqG7qwINGqRKJ0KYDTG88Uch2Q==
X-Received: by 2002:a17:902:c40b:b0:223:88af:2c30 with SMTP id d9443c01a7336-22bea4b3c03mr161252765ad.16.1744685161415;
        Mon, 14 Apr 2025 19:46:01 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.45.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:00 -0700 (PDT)
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
Subject: [PATCH RFC 01/28] mm: memcontrol: remove dead code of checking parent memory cgroup
Date: Tue, 15 Apr 2025 10:45:05 +0800
Message-Id: <20250415024532.26632-2-songmuchun@bytedance.com>
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

Since the no-hierarchy mode has been deprecated after the commit:

  commit bef8620cd8e0 ("mm: memcg: deprecate the non-hierarchical mode").

As a result, parent_mem_cgroup() will not return NULL except when passing
the root memcg, and the root memcg cannot be offline. Hence, it's safe to
remove the check on the returned value of parent_mem_cgroup(). Remove the
corresponding dead code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
---
 mm/memcontrol.c | 5 -----
 mm/shrinker.c   | 6 +-----
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 421740f1bcdc..61488e45cab2 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -3196,9 +3196,6 @@ static void memcg_offline_kmem(struct mem_cgroup *memcg)
 		return;
 
 	parent = parent_mem_cgroup(memcg);
-	if (!parent)
-		parent = root_mem_cgroup;
-
 	memcg_reparent_list_lrus(memcg, parent);
 
 	/*
@@ -3489,8 +3486,6 @@ struct mem_cgroup *mem_cgroup_id_get_online(struct mem_cgroup *memcg)
 			break;
 		}
 		memcg = parent_mem_cgroup(memcg);
-		if (!memcg)
-			memcg = root_mem_cgroup;
 	}
 	return memcg;
 }
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 4a93fd433689..e8e092a2f7f4 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -286,14 +286,10 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 {
 	int nid, index, offset;
 	long nr;
-	struct mem_cgroup *parent;
+	struct mem_cgroup *parent = parent_mem_cgroup(memcg);
 	struct shrinker_info *child_info, *parent_info;
 	struct shrinker_info_unit *child_unit, *parent_unit;
 
-	parent = parent_mem_cgroup(memcg);
-	if (!parent)
-		parent = root_mem_cgroup;
-
 	/* Prevent from concurrent shrinker_info expand */
 	mutex_lock(&shrinker_mutex);
 	for_each_node(nid) {
-- 
2.20.1

