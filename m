Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F791D61BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601900; cv=none; b=L7+KF7j9nIKKTopcFgsmnrqRR00br69HLCzM1jmGDbSihDO/K5uDACGHVhy4/FcBnc/Hd3FUy3axc/gNn7LKr8I7gP54i8QZaB2KkKWWIknLSYHQ6wmr3YyeDpuLfLifnWiWQPlXDF1PsxpdjNIkCt2HlhhPDVJpYk5NAT/1omw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601900; c=relaxed/simple;
	bh=yal5n+E6MfJzczAecY/V6J/dQHZV/cy27bFUQs8nwzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+4vavyjNG97BKzFk3asrnCh1VBieGCiwoDqsv8niQQH6BcZmcx5QCLDwzAN+vYMEppF4hTj6BiA4IyMuSuUMs1cHjxTCj1dGOJJ/R6SuU3LmkpYcSxPQRHpiOpoHkfR8+OlVTU/jSN5LBpTE2HN/qGycBnAcSGhr8jVR5UO23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=c5m79T6Z; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="c5m79T6Z"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so5862080b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746601898; x=1747206698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2sXebmCObPffjp+8cHq+ZdvnbCodI4A+STbiNXb5Tw=;
        b=c5m79T6Zz6mhTwMgA0j8kz1syMR2DXi/LxaMcAPbsJ2U+z7b0KxMeP1wSRkE8pJ13n
         wvB+6mm7t5oLgKpOT6UtUazjERrHwEXr7pHwaPMiq/9qEWQOLmWJ7od9H2h7f3u3kjVp
         J6/71E1S/ZLlhblJlGpRbI50UV/up7jU83kSaOXfhgYFVa2wSQXQxMkXX3s/r3cH9sws
         Hv99DvojnFWav3zB3ahclMJJfwv/SPUx/f5HEyu4BPmNQ1KM37Sfoci1UZJHxz/KuoJe
         YdTlFQrh+S4iAhaaVBZEFSo6pkenbIXKkQOhcBLrUdQDq51+w4VkK0RoiNHWKMZwHay+
         HxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601898; x=1747206698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2sXebmCObPffjp+8cHq+ZdvnbCodI4A+STbiNXb5Tw=;
        b=akF80VkatyD/pv7fnoZhZ7x+1DtrQ0zqAts4HixvquWIlIBZSncdGyWFrkN1PhlAnB
         RU7nFAo1PZ2Rea1/SDGm2tvfvNz5NWQOVUvh8VSL+5Rk5jLdviz8UXFUuPgLVqBwoP/J
         sObNi1H4B7+WwXH2YMaYxkouUVqfsWSWag54pBJcIlpRFBrn1JtduUkx/Q8STPJrjeCm
         9hgblbEaJupgM+i2ZNH89/joQxLCgK6rwNxI9Y3zhG5VBZ0Wm5/tW4Ci4b6tvK/RZlOD
         l3JIZY51GYMTtEzPpTqFKH3kE0qBBGbilMusRWguiwOuhA5TQ1iRmEVwc7gcDwEZYH33
         UIag==
X-Forwarded-Encrypted: i=1; AJvYcCU9nftuNJtkMT0X7W1st91zN/Ou+bjBqryquQn1bhnkZNCRWaeiZn+7y1Ka5hWWC551jHu6Y8MnorEitG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAb0W1IwSpM+5Pd2o0rXTALPmSRfcBRFfqWiSzbEk8y/KuCMI
	b43F7uhele2suurTRSZuVxywhNoCo93r4ZTWPscfgoBW2C1DafpGXUz39uNxFF4=
X-Gm-Gg: ASbGncuyveuP1CFe+hXBta36Kvr6R7AMalo1HpDzb9af4DezSyf2WEoqe4D3xcwcoPx
	PAyEh/b3zc880jIAM3hM5SgZvK2Is/cAAgk19KFctPi/+22Kos9OWC+OgapZOyyosWD1onkdU4B
	s2OLMGcqCesQrYWPUy5++c2GPgOZn/LVpcJBCff5eCkeICwpgkc9IGUhuO1bG/7hwFWFjB/9nQb
	8zYildKPEZxwd6OULsgfZ85Z+TiN9WNm75ucUWOWou08eB92zxZ/igMmgP21QVUUWwpb+9LK0hx
	baCXxvnVHH+MS1wXOeka9Q+px4C/HmOrJt3NvSIBdXUNKWsd0womEAS8+iLqkG9FVw==
X-Google-Smtp-Source: AGHT+IExFLJCG57fqwaPZBut003qAu68CPdGTZxKMH6TqQwBSJbCBf5bcIGoqQcNRoXcFwoPKkAKYg==
X-Received: by 2002:a05:6a00:21c5:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-740a0235d74mr1451883b3a.19.1746601897755;
        Wed, 07 May 2025 00:11:37 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405906372fsm10741274b3a.148.2025.05.07.00.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:11:37 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mhocko@suse.com,
	muchun.song@linux.dev,
	yosry.ahmed@linux.dev,
	yuzhao@google.com,
	dan.carpenter@linaro.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH update] mm: add max swappiness arg to lru_gen for anonymous memory only
Date: Wed,  7 May 2025 15:10:57 +0800
Message-Id: <20250507071057.3184240-1-hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <65181f7745d657d664d833c26d8a94cae40538b9.1745225696.git.hezhongkun.hzk@bytedance.com>
References: <65181f7745d657d664d833c26d8a94cae40538b9.1745225696.git.hezhongkun.hzk@bytedance.com>
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

Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
update:
 1) use strcmp instead of strncmp from Dan Carpenter
https://lore.kernel.org/all/aBHYT27M1tRxNLRj@stanley.mountain/
 2) If swappiness is not set, use the default value.

 Documentation/admin-guide/mm/multigen_lru.rst |  5 +++--
 mm/vmscan.c                                   | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

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
index 49eb2a4e490d..31142acdcedc 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5581,24 +5581,35 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
 	while ((cur = strsep(&next, ",;\n"))) {
 		int n;
 		int end;
-		char cmd;
+		char cmd, swap_string[5];
 		unsigned int memcg_id;
 		unsigned int nid;
 		unsigned long seq;
-		unsigned int swappiness = -1;
+		unsigned int swappiness;
 		unsigned long opt = -1;
 
 		cur = skip_spaces(cur);
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
 
+		if (n == 4)
+			swappiness = -1;
+		else if (!strcmp("max", swap_string)) {
+			/* set by userspace for anonymous memory only */
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

