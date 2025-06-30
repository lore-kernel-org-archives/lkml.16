Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799D921B191
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270777; cv=none; b=U4/EvyhJSIM1t+7RxSjGctukQnotN2Ov+HiT3MrwA94puhMAKDq65oigdwTRccb0VtGeTmBeYMUlo5ln+7mG8AeUcn/OY3bd9XS3l5YurFOMvP1YCXqczimFkS+09B/0SXrdr8XRELFYikObLHQAz9jIvgLPO8K3kzTVp96JKSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270777; c=relaxed/simple;
	bh=S/EpnBGQ23gp4JiHzy5oq+JGfLpcnQ3MnqsaAokNUT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sq/TNjDB279NYCiloa90veNxfWlP7tuPMWYrCwuS0N4CrhFE58efwnydzMqGXFpke61wsevl9CbXUhDhaDEdDtaNEwebgYnBMFiO1ZR7aSwkFBI/qk+me6xnZZ/pi0ESj8yXApKd/Rdg2hMD9wfkstBJLXLHYWPG2uqvX0SRneo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YC7wlbx7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YC7wlbx7"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234f17910d8so37214195ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751270776; x=1751875576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhC93MdNH/UajdLJw5ecd5t+o/SSFcevhmB+meDS1bE=;
        b=YC7wlbx7XUv+DiIxniIDBKdkqtupAVDMcJsfJ1q2Kpz92yb3+xstgPqGkH+WQHgGl2
         U9oCrCTtbCkiazyd1jT7Jqg2A7EgnvSsz+twH5JRxBbT5/fPOX46xgIffBFHQ3MzXiL6
         OZJqsEghe+eGl6XrNT3nPbnZJ3ssCzno56zLRZceiOQi2B7GnYkrIZ2qWVtjWteqaFxV
         KznAA5MuqoFX6zrJeMhlsJ8YlRVz47YWYkvX7OOi5KxAvWopINghMT1Rnggu0QuUvQ2D
         4XWryJSbFQE3XwEZ6Vse7GKUk+p+jm5MFRkgpcQoaR7jYP5XsWYS9hl4dxQukk9F+Ffa
         HthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270776; x=1751875576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhC93MdNH/UajdLJw5ecd5t+o/SSFcevhmB+meDS1bE=;
        b=Bc5u6ic9NcqXaf584WEzQ2e17xax3WqTjJIbNQVyxQYytbq4eWirl0B7nFhU6Q9OsR
         ZfQ5x7U35nXlRr4A55tt8CdYu5YhMjADi+S/JmELpZm5I9HMn2zg10qLoZifXMFnrCrq
         a+hk5B60wzwn8AJKDwoiQyJmw41/vGpt/kS74Zs+xDuAnzUe27LMK649CiqN4hDR+iZ7
         lxzGNib5zI4p4BQMq7kv9qZpQCpPogIoMmy4RlGEDCRf9GKYk4Z/k/2eOZVfaJfkRPA1
         qlVwCOCm16ypehOdMlWHPKyA5JYYvZQcTmoowsWE5+mFo4VJlontd+VxT1yJ0HWP6/J2
         H1CA==
X-Forwarded-Encrypted: i=1; AJvYcCWxPzCkrVLSIg74kb13vAXJZbXKL+1HrLB19YNFJr8AtSv4pRlasB42xJdWkAuWSf79LoD27NUUFmW8GHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9gyh+MiwEUteljWFNOPOBA1rhM0seiCDDdHlHL4R2zDyp5JT
	kVBAZGvSi2cbX6P17mofY6jyDCUJKtAY8wSpPmcT8cJLC37qZCw3e2iU
X-Gm-Gg: ASbGnctTeNdWf5wcDJ9AGkY0OcA2kaj7nal5pRM8xRzAAtt5nWZyNVPGjPKM+bhuURj
	MeJR8yCGeQFlD6ha4DyYvpb7cMe0S6DaZv7e1g2bZv+as1VcjGJ7JsFrMXgG9fq+HBZMf4fK9+W
	YRNRsEO5dAESUlpd1Vujsohs1px69baoXUSvgK4Cjjs1ruErWniBuuUI7Azoy3dvBM8FauKq0ta
	JKd0x63z+4xTaeZgVvP+cAr8O6qnnGRMwZ9KWjG2UVTNNTJHrd8JwPl37OUcvdU5RYNjAkqyRz8
	X2NkPRf1MJ3yX5uxZN4JbavYfMDiIcbbBDDTq1qEYOKTMZoVsd94b7P8XtRBGCVfXnnj826WAxa
	gq9GDIZk8LBcCulbAChPUA224PQ==
X-Google-Smtp-Source: AGHT+IFYFmTkEVvMadrUbJdKv+7Ssnr4mG3NMLJzWM81hFR4r3jACsts3LwVX1i57j4OWVs3w3Hgsw==
X-Received: by 2002:a17:902:ec89:b0:234:8a4a:adad with SMTP id d9443c01a7336-23ac46824a1mr205108515ad.26.1751270775574;
        Mon, 30 Jun 2025 01:06:15 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3023a11sm6525673a12.25.2025.06.30.01.06.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 01:06:15 -0700 (PDT)
From: Hao Jia <jiahao.kernel@gmail.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	yuzhao@google.com,
	kinseyho@google.com,
	david@redhat.com,
	mhocko@kernel.org,
	zhengqi.arch@bytedance.com,
	shakeel.butt@linux.dev,
	lorenzo.stoakes@oracle.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH] mm/mglru: Stop try_to_inc_min_seq() if the oldest generation LRU lists are not empty
Date: Mon, 30 Jun 2025 16:06:03 +0800
Message-Id: <20250630080603.36171-1-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

In try_to_inc_min_seq(), if the oldest generation of LRU lists
(anonymous and file) are not empty. Then we should return directly
to avoid unnecessary subsequent overhead.

Corollary: If the lrugen->folios[gen][type][zone] lists of both
anonymous and file are not empty, try_to_inc_min_seq() will fail.

Proof: Taking LRU_GEN_ANON as an example, consider the following two cases:

Case 1: min_seq[LRU_GEN_ANON] <= seq (seq is lrugen->max_seq - MIN_NR_GENS)

Since min_seq[LRU_GEN_ANON] has not increased,
so min_seq[LRU_GEN_ANON] is still equal to lrugen->min_seq[LRU_GEN_ANON].
Therefore, in the following judgment:
min_seq[LRU_GEN_ANON] <= lrugen->min_seq[LRU_GEN_ANON] is always true.
So, we will not increase the seq of the oldest generation of anonymous,
and try_to_inc_min_seq() will return false.

case 2: min_seq[LRU_GEN_ANON] > seq (seq is lrugen->max_seq - MIN_NR_GENS)

If min_seq[LRU_GEN_ANON] > seq, that is, lrugen->min_seq[LRU_GEN_ANON] > seq
Then min_seq[LRU_GEN_ANON] is assigned seq.
Therefore, in the following judgment:
min_seq[LRU_GEN_ANON] (seq) <= lrugen->min_seq[LRU_GEN_ANON] is always true.
So, we will not update the oldest generation seq of anonymous,
and try_to_inc_min_seq() will return false.

It is similar for LRU_GEN_FILE. Therefore, in try_to_inc_min_seq(),
if the oldest generation LRU lists (anonymous and file) are not empty,
in other words, min_seq[type] has not increased.
we can directly return false to avoid unnecessary checking overhead later.

Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
 mm/vmscan.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f8dfd2864bbf..3ba63d87563f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3928,6 +3928,7 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
 	int gen, type, zone;
 	bool success = false;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	int seq_inc_flags[ANON_AND_FILE] = {0};
 	DEFINE_MIN_SEQ(lruvec);
 
 	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
@@ -3943,11 +3944,20 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
 			}
 
 			min_seq[type]++;
+			seq_inc_flags[type] = 1;
 		}
 next:
 		;
 	}
 
+	/*
+	 * If the oldest generation of LRU lists (anonymous and file)
+	 * are not empty, we can directly return false to avoid unnecessary
+	 * checking overhead later.
+	 */
+	if (!seq_inc_flags[LRU_GEN_ANON] && !seq_inc_flags[LRU_GEN_FILE])
+		return success;
+
 	/* see the comment on lru_gen_folio */
 	if (swappiness && swappiness <= MAX_SWAPPINESS) {
 		unsigned long seq = lrugen->max_seq - MIN_NR_GENS;
-- 
2.34.1

