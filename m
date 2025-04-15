Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB57B233716
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685277; cv=none; b=EcEAawRJ0irPKt+AxVpyM+zyzs7Q41XAHClyj52Igeq3EohKWYLmFQdl5kD8Tv4VgiYva+qbfvSf0Df3Zb5wZkcHcMeNUkobBvoafRwDBjIA+0rnmV7Yy7DbWW1QwwADfGyvlEnqRHnCB6ZXXisidc23EXCJcShTLejtuXJguR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685277; c=relaxed/simple;
	bh=gqcWvL8puEcB8VURLE0CUOfUeKpOQO4iYFAmWiCBYCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dH1QhJgt052e1ykeJKn/Z02IbHPh2l0kjhWrtGPuHDFQ5TpAJy1gAQEdC78as3jG5BCF2nYzSsAW1OwmSV6b7aklgQ8d0Acn8Qrg6PaEkDKSCwx+xWORzuTnbZfxbeqIx7Oua4VRR+9KQoEhYBy9HSFny0+/t5mHWobj1NvwGG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fpcKFjh9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fpcKFjh9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2264aefc45dso74533615ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685275; x=1745290075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBa3KcBA5wxUNKsQ+K1hpla3o8QIUcc8xJR0inNtMu0=;
        b=fpcKFjh9ienup1D85vtSvbp1TeT+MWhoUrsOsNiiTa/M9+staSsJXBEj/iebO1CNsZ
         4+tY6T/BYJ+Z9EzqNB5EoZvdUU5YZB/PnmFSsk8hfZZY4XCDvUF1CjiuNMZ6clk7HrmD
         q7inDR24jRI5JmJKK76Q5sGJgfUrKE8PJBjIYdPOFKKtixrvZvejpjTC5lmujZ1JPH/F
         72kGqWXE6HbyLtz6aNcpBfv4+0r6N0EoANMeJDU4RtTt2mmMrCfxOrT7ndmtJFDhXILX
         i+g47tpkmbCzZxuXKaFVTk8/EeFRbAkAj90+gz0MAUmqVwBvj04LNNDbGLT7QqiOy5Az
         22Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685275; x=1745290075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBa3KcBA5wxUNKsQ+K1hpla3o8QIUcc8xJR0inNtMu0=;
        b=t7fzE0+w8FFdjTMmGQtF1XsEPzFqVA/6qjaXwMgblQmEaN6aUscfK6JDQUJeEB2WO/
         sKr1bV+MXCI251CQrIat/NqI5OWTkNKrgLMaefaDXhKonol0WEYMheZsTt41hQ17N120
         Bj5X38+/Wtew6Zj5oRInP/uO+tjsAFtRI71HiysFzBtF68J19XhABUm9uXvLLf/mVc4n
         QijyhuUzyvqRXNHgFL/UBLuiu686Tlzpzb5PHValJ03swY4QpRY3wg18fQ5VvrCTkR0Y
         rcCDl4ZtIMBt+UCuUbAOaUCBe57fLLzxzfMEZr2fKKr33otAgL5Sx6sTrb6IefTx3Xfi
         fAEQ==
X-Gm-Message-State: AOJu0YxEC8tqgX26tC+4PGlS3YC0B77OU2p/w25z5YTqrLQ/NZkQTbOk
	yfGgGsU8zUfjYp9TDG2U7z6VbqLZZ2SojRMXsSdPfkTNrSHMHy9w7rZ5fFP2BKM=
X-Gm-Gg: ASbGncsA7t5rVUIzgcw1Nij1fZ68DiwcqNwWHVQI/S0K5JflYtCG1lFIFSgAaoxfhJF
	9e+Mx2dRUDZfrVsu3X8bkojQi3q0F6bnDQJeO+9/pPp3Q4OLx+q4ErJMnpTbSyApkYUMykE9jB5
	HYwAqZUiYwCfuv2O+kMrFH6z4ekftm6xfM+xyFEQDUQzZpBEZYw2ud3UD6nSHEs7xzFz3HaSOKU
	aVLJY0GLG03UVGfenOZzSXSWMqFm+0qnh/U6oq8vS0YZogQcm86jb0GXW8+LL32+4ppFDokD8Si
	3uCv7mpUsbVRC2w78YFfBlUxg6CmMbHPbS+2/CkI3pEd++KDhfiTKpqj0gIhxWpQtAkv6zFW
X-Google-Smtp-Source: AGHT+IHI4hqLb4XlutpOFIzQEdrRaemLqaUdJqfYPhQI+o4uvusfdbjBRgP5q4orxhE3PLyGhMO1fw==
X-Received: by 2002:a17:903:3202:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22bea4ab6c4mr253471365ad.12.1744685275144;
        Mon, 14 Apr 2025 19:47:55 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.47.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:47:54 -0700 (PDT)
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
Subject: [PATCH RFC 22/28] mm: swap: prevent lruvec release in swap module
Date: Tue, 15 Apr 2025 10:45:26 +0800
Message-Id: <20250415024532.26632-23-songmuchun@bytedance.com>
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

In the near future, a folio will no longer pin its corresponding
memory cgroup. So an lruvec returned by folio_lruvec() could be
released without the rcu read lock or a reference to its memory
cgroup.

In the current patch, the rcu read lock is employed to safeguard
against the release of the lruvec in lru_note_cost_refault() and
lru_activate().

This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/swap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/swap.c b/mm/swap.c
index ee19e171857d..fbf887578dbe 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -291,8 +291,10 @@ void lru_note_cost(struct lruvec *lruvec, bool file,
 
 void lru_note_cost_refault(struct folio *folio)
 {
+	rcu_read_lock();
 	lru_note_cost(folio_lruvec(folio), folio_is_file_lru(folio),
 		      folio_nr_pages(folio), 0);
+	rcu_read_unlock();
 }
 
 static void lru_activate(struct lruvec *lruvec, struct folio *folio)
@@ -406,18 +408,20 @@ static void lru_gen_inc_refs(struct folio *folio)
 
 static bool lru_gen_clear_refs(struct folio *folio)
 {
-	struct lru_gen_folio *lrugen;
 	int gen = folio_lru_gen(folio);
 	int type = folio_is_file_lru(folio);
+	unsigned long seq;
 
 	if (gen < 0)
 		return true;
 
 	set_mask_bits(&folio->flags, LRU_REFS_FLAGS | BIT(PG_workingset), 0);
 
-	lrugen = &folio_lruvec(folio)->lrugen;
+	rcu_read_lock();
+	seq = READ_ONCE(folio_lruvec(folio)->lrugen.min_seq[type]);
+	rcu_read_unlock();
 	/* whether can do without shuffling under the LRU lock */
-	return gen == lru_gen_from_seq(READ_ONCE(lrugen->min_seq[type]));
+	return gen == lru_gen_from_seq(seq);
 }
 
 #else /* !CONFIG_LRU_GEN */
-- 
2.20.1

