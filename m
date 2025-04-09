Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C2C22FF4C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182427; cv=none; b=FMFIzScg2ZAHi3859d82QX4hvxkFkx6BNSaph4BRKkZYkZK44NWVIJfFYI0BNOHCOIudR9OPb2SguEr6oRM3FAGLl7NQ63vM3ehxux46R+AYt7KIH6JAvjqpOChM32VEq/jcMZRw0u+MYDFzm+rzg7siwXCspjpZuIt1FP63K+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182427; c=relaxed/simple;
	bh=fNUgRKUy6JECxkAoBBqkiCGPS0fEFwo2xN9QfDY1CYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mg9rCoB3zcwDa8CvaBE5wkrd3KpEgOL40kHXpwupbKW1jVoF0qFjogDHBimcKoSs+m2d7zhraY66UxRueOISXITdA3lOVu6PEWl8WQQFZfTi1tu/Klmyt/B1xMlJInZ7sks4kzJF4/jGrn+In2J+4RoqZyBXbiqZizCn9ZyuWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Oc9lYRjv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Oc9lYRjv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225477548e1so61029265ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744182425; x=1744787225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2hnt1J4L3olEEgVeJYpHiMUYT2gnH0FfIQaw5NdEjY=;
        b=Oc9lYRjvDzqOsri2a0g8zj70nPK7BU1zH5hmJfSno3MQOYVHzfSO/f40cPLph9sBdG
         hVVPIXbsXDpFr6pPZh8NjrKV30jCSEUCAU2nfbPKloEn4vhPFEhaZzG0Lzy1vEpFr9eR
         VHAKQYmflGw6bdWr2SX6B8gG9KuFLJAxVn8SFR5GDpi7uvmBy5DXA1jipjA5qypLqFWT
         qMC0MAFTpFqjSu+Wc9CzbN0sN1E8XHeq8oexoJ932WVr7ktEkSEqLp3COZbPA57oN75P
         WPeaZ3SkTfW340xCCdExLtsaFvBaETZ/3y7THi97mW5BorZDHSS/PC3yAlcAbWV1BeSw
         svNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182425; x=1744787225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2hnt1J4L3olEEgVeJYpHiMUYT2gnH0FfIQaw5NdEjY=;
        b=AAWctt2Fe+voR8f9wj/SMDlTYEF2oT0cyZ/ImTd2EdOOgLBgCHKnOfL6CQJKjXqx2Y
         GttO+uA9hhYvji968g8Pqd8b8kTg6mN9p6z0XFddFAZiqHmg5sB9Z8NbujF7YMapMWST
         HYPAkWJMC7QsbZ0IAwC+3k1cXr9wOA8j46Rju8IqdgbPBnMP6YeXJXw11IQAO0YjnsSY
         J8mDP44Aogc8q3ONC2BZAbkwu9x2G7yigYOY37Jw5Nxds406P9T4HU7YXugeVfoJbCVG
         R91ifgH5YupbEPGX6ydKNda2Na07Qd2tlzPVUG8TXrA4ax6tW6JLnmsdm8jqWgwo+WPn
         CGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZfxCeB6fagCH3PgVIqA4biQ0igQbmk1axAGLsbG4P+hP9dAC3HzQxY4Y2REyOB1uJg7PtZ86thElrpTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+iFlHV0My/VZoHjAb6gWo7KVHhttD9kG6Baga32KMpiQUima3
	HmRLG5iH74wC4zqSSHrh0m2fP4pPus5QOP/ZRtjyf4GhRtq58uKZ2Xs+2XTA22w=
X-Gm-Gg: ASbGncvU6Z3kgdgCYspmUw2pMhRktOO00KtzcrHwIeNn+fbI3aQ+epQxxzA98qgLzEW
	O1qLtgOYjLDfWq2UQ7cZGFxOtozSbphw8awzKI+7PvN6Ouu0F2ItcK0q2qB3qA7U8zGV3//VKpQ
	OnckVAntbDXuLnasywb3POFUWA8TMvuU2GChQUG0+M9felmXLdzaesa50wgEQOSYna2Lst3dkh8
	+4L+sDDGxMSK9vpXrxFH9Cfu52CqEsiMG02aLu9dRx+JomNT8pYl0MWeUP1kwmq/4VKMrxiAHBB
	OeQGkMyRCs625s3roNpzKeJhDzFydPVRwDyxx1s+RTWhhOg19NOYwkuwgSToS9YEdQ==
X-Google-Smtp-Source: AGHT+IEqzbVgFBQGm2kJbpgwtHwR6FDnzEvHZ2VCmuE1rmHyw8CkVPDDJbNjbPVqYOiqi6Mf2+tk+g==
X-Received: by 2002:a17:903:22c6:b0:225:b718:4dff with SMTP id d9443c01a7336-22ac2c36a0amr33086715ad.53.1744182425144;
        Wed, 09 Apr 2025 00:07:05 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d44800sm565754b3a.37.2025.04.09.00.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:07:04 -0700 (PDT)
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
Subject: [PATCH V3 2/3] mm: add max swappiness arg to lru_gen for anonymous memory only
Date: Wed,  9 Apr 2025 15:06:19 +0800
Message-Id: <b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>
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

The MGLRU already supports reclaiming only from anonymous memory
via the /sys/kernel/debug/lru_gen interface. Now, memory.reclaim
also supports the swappiness=max parameter to enable reclaiming
solely from anonymous memory. To unify the semantics of proactive
reclaiming from anonymous folios, the max parameter is introduced.

Additionally, the use of SWAPPINESS_ANON_ONLY in place of
'MAX_SWAPPINESS + 1' improves code clarity and makes the intention
more explicit.

Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 Documentation/admin-guide/mm/multigen_lru.rst |  5 ++--
 mm/vmscan.c                                   | 26 ++++++++++++++-----
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/mm/multigen_lru.rst b/Documentation/admin-guide/mm/multigen_lru.rst
index 33e068830497..9cb54b4ff5d9 100644
--- a/Documentation/admin-guide/mm/multigen_lru.rst
+++ b/Documentation/admin-guide/mm/multigen_lru.rst
@@ -151,8 +151,9 @@ generations less than or equal to ``min_gen_nr``.
 ``min_gen_nr`` should be less than ``max_gen_nr-1``, since
 ``max_gen_nr`` and ``max_gen_nr-1`` are not fully aged (equivalent to
 the active list) and therefore cannot be evicted. ``swappiness``
-overrides the default value in ``/proc/sys/vm/swappiness``.
-``nr_to_reclaim`` limits the number of pages to evict.
+overrides the default value in ``/proc/sys/vm/swappiness`` and the valid
+range is [0-200, max], with max being exclusively used for the reclamation
+of anonymous memory. ``nr_to_reclaim`` limits the number of pages to evict.
 
 A typical use case is that a job scheduler runs this command before it
 tries to land a new job on a server. If it fails to materialize enough
diff --git a/mm/vmscan.c b/mm/vmscan.c
index c99a6a48d0bc..18a175752b57 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2697,8 +2697,11 @@ static bool should_clear_pmd_young(void)
 		READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_FILE]),	\
 	}
 
+#define max_evictable_type(swappiness)						\
+	((swappiness) != SWAPPINESS_ANON_ONLY)
+
 #define evictable_min_seq(min_seq, swappiness)				\
-	min((min_seq)[!(swappiness)], (min_seq)[(swappiness) <= MAX_SWAPPINESS])
+	min((min_seq)[!(swappiness)], (min_seq)[max_evictable_type(swappiness)])
 
 #define for_each_gen_type_zone(gen, type, zone)				\
 	for ((gen) = 0; (gen) < MAX_NR_GENS; (gen)++)			\
@@ -2706,7 +2709,7 @@ static bool should_clear_pmd_young(void)
 			for ((zone) = 0; (zone) < MAX_NR_ZONES; (zone)++)
 
 #define for_each_evictable_type(type, swappiness)			\
-	for ((type) = !(swappiness); (type) <= ((swappiness) <= MAX_SWAPPINESS); (type)++)
+	for ((type) = !(swappiness); (type) <= max_evictable_type(swappiness); (type)++)
 
 #define get_memcg_gen(seq)	((seq) % MEMCG_NR_GENS)
 #define get_memcg_bin(bin)	((bin) % MEMCG_NR_BINS)
@@ -3857,7 +3860,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
 	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
 
-	if (type ? swappiness > MAX_SWAPPINESS : !swappiness)
+	if (type ? (swappiness == SWAPPINESS_ANON_ONLY) : !swappiness)
 		goto done;
 
 	/* prevent cold/hot inversion if the type is evictable */
@@ -5523,7 +5526,7 @@ static int run_cmd(char cmd, int memcg_id, int nid, unsigned long seq,
 
 	if (swappiness < MIN_SWAPPINESS)
 		swappiness = get_swappiness(lruvec, sc);
-	else if (swappiness > MAX_SWAPPINESS + 1)
+	else if (swappiness > SWAPPINESS_ANON_ONLY)
 		goto done;
 
 	switch (cmd) {
@@ -5580,7 +5583,7 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
 	while ((cur = strsep(&next, ",;\n"))) {
 		int n;
 		int end;
-		char cmd;
+		char cmd, swap_string[5];
 		unsigned int memcg_id;
 		unsigned int nid;
 		unsigned long seq;
@@ -5591,13 +5594,22 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
 		if (!*cur)
 			continue;
 
-		n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
-			   &seq, &end, &swappiness, &end, &opt, &end);
+		n = sscanf(cur, "%c %u %u %lu %n %4s %n %lu %n", &cmd, &memcg_id, &nid,
+			   &seq, &end, swap_string, &end, &opt, &end);
 		if (n < 4 || cur[end]) {
 			err = -EINVAL;
 			break;
 		}
 
+		/* set by userspace for anonymous memory only */
+		if (!strncmp("max", swap_string, sizeof("max"))) {
+			swappiness = SWAPPINESS_ANON_ONLY;
+		} else {
+			err = kstrtouint(swap_string, 0, &swappiness);
+			if (err)
+				break;
+		}
+
 		err = run_cmd(cmd, memcg_id, nid, seq, &sc, swappiness, opt);
 		if (err)
 			break;
-- 
2.39.5

