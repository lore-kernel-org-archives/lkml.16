Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95505235340
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685293; cv=none; b=SGf112IKbbRG6vc16B7pcHj+KwJslOpqT0IwHDLMlovCPUonmd8ni0NWuyQ0Ehf1xC5UP8LM/FUOeFvTfntXHQ/98qYgezF7iRQho1UFLJ643Uh13cAevQN8/v0JO9XlMUT+ihE44kBsLt9hajf+N6XXLJzjlo0MWR2eDlZ54YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685293; c=relaxed/simple;
	bh=b6WgT5AaIyycVV1DlaIxlbeB9KrtvSXL+2l330r8XW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aqz6HPyZ+0K0G1TsLi+SXMktWCOKAqUdJU6ob6c6Mv5FSQi0PZlT6MJF3BS4mB/cLzcQFSsxYRImFU9uuvdR0K9qsrCORBJe4GdhIixiWZp3At2W4xnNvGhK2xCN4S8HMa3S/pqyq6QRapq+V/Ukn5wWsowR27KylYtvX8UwgDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iPMPiQYU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iPMPiQYU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b09c090c97eso838938a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685291; x=1745290091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzey8goXEog+ZffEsOrcu6z/kqiEK8l86D0gwmtPc7Q=;
        b=iPMPiQYUKy0rh8fGJ73HTK8N8RjpFAX/nGm9ovu690ajo+aQyVkKd39wsEVWKum1Fe
         lc4kjWq2aN7cDDV9FEbs0AT2/dkgz09I/9nOhSdObb5OxYfHRGUsj7TC1L6FLTtSEUJ9
         FO03ofZIgWYDHSs9vdOmk6GZccUo7v/p8jRcyfuuOvvty9LgHMGi7XUxy+ZZ2SZziYqj
         jxyIQFrvlRtT7MlgTZbpIE49zGmEdx2WBpMo/JbeOr2M7xPdEoW3ECPLdPL5+aToRfYn
         SiUBlV4B9bfo4imXtCJ1dicbs17gh0tQ4a0y1qZUGj80D6aB6XOAeMAA317LXGZ9Biwg
         AyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685291; x=1745290091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzey8goXEog+ZffEsOrcu6z/kqiEK8l86D0gwmtPc7Q=;
        b=L+Wtmj9CDuV+DxjfxqeOGnBKmPL++punUREfcG4SbNbtD8zrXcB+XJZ/cX7wMKu0qc
         PmbpNjC4wiW3j93yICBMsbYShj+/6lbsdzsfMBHzx86dfKxbf0/UqnF23obZ1i/LvK1R
         5SYYo+KVjmMiLWdrlsqACkHlg2glvj4phVXoBjbZp9g8vuj/660ACexEt8Tr0tyQW/xa
         xaj/RiyI2OZA1W6dNwYZvubpeVc6QbiecZ1v0DcvbjAkFzq2s58pFuWnF08qrhgVFWlx
         5s+OZcJbwh7kCcshwu48MWakLI41oLK133inppeuCmpgu1n26Gs6d/mZzmacKd8NbYeJ
         Vd1Q==
X-Gm-Message-State: AOJu0YzUfL2IJOfddlnx6i2Cmb50EGa3b+RBug3d4To1UVHwnzF26Fy2
	RdhuL4IthSxPSw2/WWIqz7AdZdVAg3YvChmurlipjf7UyE0uMkfR7p/LY/uWBj0=
X-Gm-Gg: ASbGncvBGlNJneLa9rW2fwQERNPl74JTdmC9lp6dPHDS1p39p57JZESiyZsWEMLzxcW
	4E3FDURIfOCRdS3Bh7mAsqymDdsGHNJQPvM4LAm1/wNRq2d79jRhvA36VIzwOJIzf8MClbrJaop
	kEYuoSXUu8ApveZsGsaN9dAIH0ieQNCmsPl7kN3Ym2R/nXn1INUtRVRlUJWfFev5CbDCSTj2QRq
	2VZVvWq8MyIkJnzqh08XlkuXBvfiWZc+wjrH2A2+3XBdDRoaw2dLCbCK3hza1pnS0HwgArhKssr
	Tz55iEEcGT1zrNHZM26atoPAdJrmhAAaHvDpSVxkkB7NehIF6czwEhL7xk2WF6nTqQANZvmFQtl
	3kTWHe30=
X-Google-Smtp-Source: AGHT+IGKYbRxT9nU7SMJ0Zxzh0coEyzVb1MW3k+CSg2YANyZzMz0FPRUg+d3lPphVCyM8bkhwJIXdw==
X-Received: by 2002:a17:902:eb8a:b0:220:c813:dfce with SMTP id d9443c01a7336-22bea4f273amr208688465ad.39.1744685290927;
        Mon, 14 Apr 2025 19:48:10 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.48.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:48:10 -0700 (PDT)
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
Subject: [PATCH RFC 25/28] mm: thp: prepare for reparenting LRU pages for split queue lock
Date: Tue, 15 Apr 2025 10:45:29 +0800
Message-Id: <20250415024532.26632-26-songmuchun@bytedance.com>
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

Analogous to the mechanism employed for the lruvec lock, we adopt
an identical strategy to ensure the safety of the split queue lock
during the reparenting process of LRU folios.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/huge_memory.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d2bc943a40e8..813334994f84 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1100,8 +1100,14 @@ static struct deferred_split *folio_split_queue_lock(struct folio *folio)
 {
 	struct deferred_split *queue;
 
+	rcu_read_lock();
+retry:
 	queue = folio_split_queue(folio);
 	spin_lock(&queue->split_queue_lock);
+	if (unlikely(folio_split_queue_memcg(folio, queue) != folio_memcg(folio))) {
+		spin_unlock(&queue->split_queue_lock);
+		goto retry;
+	}
 
 	return queue;
 }
@@ -1111,8 +1117,14 @@ folio_split_queue_lock_irqsave(struct folio *folio, unsigned long *flags)
 {
 	struct deferred_split *queue;
 
+	rcu_read_lock();
+retry:
 	queue = folio_split_queue(folio);
 	spin_lock_irqsave(&queue->split_queue_lock, *flags);
+	if (unlikely(folio_split_queue_memcg(folio, queue) != folio_memcg(folio))) {
+		spin_unlock_irqrestore(&queue->split_queue_lock, *flags);
+		goto retry;
+	}
 
 	return queue;
 }
@@ -1120,12 +1132,14 @@ folio_split_queue_lock_irqsave(struct folio *folio, unsigned long *flags)
 static inline void split_queue_unlock(struct deferred_split *queue)
 {
 	spin_unlock(&queue->split_queue_lock);
+	rcu_read_unlock();
 }
 
 static inline void split_queue_unlock_irqrestore(struct deferred_split *queue,
 						 unsigned long flags)
 {
 	spin_unlock_irqrestore(&queue->split_queue_lock, flags);
+	rcu_read_unlock();
 }
 
 static inline bool is_transparent_hugepage(const struct folio *folio)
-- 
2.20.1

