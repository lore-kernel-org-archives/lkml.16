Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C16360
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748282833; cv=none; b=BT5HKj1ZV47O2p+TJI9dZs7LlKxLw1iC+HpnHwHhJEg83hAZwz6ppBqSc0W9hag8ztEjU2WoVpCxUsULP/pLDWc9Dj9TgyVDL/XDkBNhIWcv+MJr9Dxd9WpphqLxYo06IlIF7m2+e4n2c7kn4E4SH4qCZJseibFVdXD7Wl6JMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748282833; c=relaxed/simple;
	bh=z7AxRD1SDSSHntzmYr2WBQCNpDpgqbbwc59gJln690I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYJ+MyFzSvL1xELtpbQyHb/8iLS4zcPibL2qKbgmR8Ne9jX5Xvh47uetyUSx0tkO8GUlt9WrXSHWaKVmcweJ5HkpcS7RmXyexgsfabNcKHx8vzIX7MOmTq3hB/Dv4HVhIEAQZR0O64IBWsq3ycywd/xO5981hgQd8VM/r6N05uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erYiJzFf; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erYiJzFf"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7cadd46ea9aso322708285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748282830; x=1748887630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGlhHkaLlmCOz6H4uOoPZnktDHjjHar4VtVI4OHZ6Ow=;
        b=erYiJzFfWggywC3iaUKVpr0xt6O9MLRKSozylmN1DrRJFStw+o0lJsgiQ6k8eQwxSd
         qICMFwoF2zszMf7Y6FLVrMbMq7w/UVO4sHJOPJn3ogEZxFLwPiMWFQT3gzDjWXIAADpg
         D1MHvImYk/GePNZkQR3af/ch6JrFK+zazKXMTejc3xqHu/GpFV/W/NXa4MsAZnaEZI7o
         FVbDfa/2hFxbDYWWQ9/1YZgi0+aGQJcDOwhIbCI2yfSxVzm0ogmeVCAjl8cEPHcQ2FFv
         Tzfl33YoFKhJkXD8bwpxognWz8cK3axz/FbxqR1RH4WjHIKCMbfcnnx3xJnDqQ3IkJLU
         cv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748282830; x=1748887630;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGlhHkaLlmCOz6H4uOoPZnktDHjjHar4VtVI4OHZ6Ow=;
        b=biHrXA87ZdEA66plbV9dWUI5s3diervu8T7rIJHKu9y3OypJYWxK9NdtjCC669uMd+
         EZJkpeFU+mxMrT0zUrxh+2wGLOm7w01puMf/3pGy3GqDrMmqTYrygyhUekprH8H/KPp3
         f/lWPI5IX5bO/uIKPkgcgKs2HiPb1nXn0qe8ofl2BfFLFdjgxyiw286nF7XljyrrybyU
         StQelKnTwFIqyQ16F84PxY7IkT8xjCSM/haJEUnHNO9/ODoiPpGb80x3ga77ywm5fxax
         dwzDBedYu4lzgfQ0cgUAnpTlZ/FK5tdKTT+3QdGU+IohSHPUr6V5xju7u/VgkMaPSLqs
         HfDA==
X-Forwarded-Encrypted: i=1; AJvYcCUTmXzuvKkBpud/FlP9ROriMtsMJoJXELVHhe06HugUoMq17kDL8z3szUn0jE94ElwaXKjRGjXJocdVeLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdOvOxAsD91av5Ednu1eJA2nW8g+xnAq5zNKA+3iMSEp8dqgyE
	hHhAdQcmnArN4hQ11Bc8bazraPy1QHZGnHHcPXZiQv3Q0gOmNqILgRqtRgyxbuW2zgU=
X-Gm-Gg: ASbGncv7ldsvQZ5hy4rrISM4wLqug78LcdFye4e9iGqToY3li3hiT1dC3ZO896iTvUJ
	sW8D2spL//QUgkJ9k+fpaHym+anHFVmBcArYrx0VYxgaCHuJ0JMR9yx8Ydbd/a063i3xVEBmdKl
	N8gm+kID5pXL5YMZWm6MDFIoltr6LDaBy2OQNXRtapIZHOscq1R8S04LvQCO0aaBkw/JLTrHcMY
	5gqIYQ0tPsvv3XDGiExj58rWuc0ovmahO1FT1p3L3mrX/lYFhqjHURP9ZR7NqAJGI7P6yvWMpg2
	K4+FpiTqMr0HVILnJpYWhJK2UO/cp0fZOaKVPaO0nQrLX6nGhidtCKX1cSofmm2eq+W7czHo
X-Google-Smtp-Source: AGHT+IGw9wmiHNzzQ7rI5YNNhMNsw3L9nwdykV2WWCjhxVWJvwblCp2eZ+9qN0+E+VlRTEsv1iGg9Q==
X-Received: by 2002:a05:620a:1a07:b0:7ca:f3e2:92b0 with SMTP id af79cd13be357-7ceecbbff2dmr1383462685a.3.1748282818592;
        Mon, 26 May 2025 11:06:58 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467f0c43sm1587627385a.54.2025.05.26.11.06.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 11:06:57 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Chengming Zhou <zhouchengming@bytedance.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] mm, list_lru: refactor the locking code
Date: Tue, 27 May 2025 02:06:38 +0800
Message-ID: <20250526180638.14609-1-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Cocci is confused by the try lock then release RCU and return logic
here. So separate the try lock part out into a standalone helper. The
code is easier to follow too.

No feature change, fixes:

cocci warnings: (new ones prefixed by >>)
>> mm/list_lru.c:82:3-9: preceding lock on line 77
>> mm/list_lru.c:82:3-9: preceding lock on line 77
   mm/list_lru.c:82:3-9: preceding lock on line 75
   mm/list_lru.c:82:3-9: preceding lock on line 75

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202505252043.pbT1tBHJ-lkp@intel.com/
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/list_lru.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/mm/list_lru.c b/mm/list_lru.c
index 490473af3122..ec48b5dadf51 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -60,30 +60,34 @@ list_lru_from_memcg_idx(struct list_lru *lru, int nid, int idx)
 	return &lru->node[nid].lru;
 }
 
+static inline bool lock_list_lru(struct list_lru_one *l, bool irq)
+{
+	if (irq)
+		spin_lock_irq(&l->lock);
+	else
+		spin_lock(&l->lock);
+	if (unlikely(READ_ONCE(l->nr_items) == LONG_MIN)) {
+		if (irq)
+			spin_unlock_irq(&l->lock);
+		else
+			spin_unlock(&l->lock);
+		return false;
+	}
+	return true;
+}
+
 static inline struct list_lru_one *
 lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
 		       bool irq, bool skip_empty)
 {
 	struct list_lru_one *l;
-	long nr_items;
 
 	rcu_read_lock();
 again:
 	l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
-	if (likely(l)) {
-		if (irq)
-			spin_lock_irq(&l->lock);
-		else
-			spin_lock(&l->lock);
-		nr_items = READ_ONCE(l->nr_items);
-		if (likely(nr_items != LONG_MIN)) {
-			rcu_read_unlock();
-			return l;
-		}
-		if (irq)
-			spin_unlock_irq(&l->lock);
-		else
-			spin_unlock(&l->lock);
+	if (likely(l) && lock_list_lru(l, irq)) {
+		rcu_read_unlock();
+		return l;
 	}
 	/*
 	 * Caller may simply bail out if raced with reparenting or
-- 
2.49.0

