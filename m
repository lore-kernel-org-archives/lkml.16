Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FD278175
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527063; cv=none; b=YZcd33VWbrguv8118PRyLd4QB9M+1Q9LjOsC4eLeqM/EhG8EtKOULz77OrXMZLa5yJr0KtGX6+AUjhF3/3lC2YN/YMwWhluSy0G+OYaa5oTcuTt2c8ZcZnvkO+3BttSpJU1IbioznX1GetAsSTy9Cl5TBJgnr6kNgCgWUX1sH8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527063; c=relaxed/simple;
	bh=TFkr8ZernbCRga2u5+4e+d6LUgnGAlMEQkmjKCHUFNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDzb/4PbvlyUNkHRloeahKWkwRpEtT2hHbqjQEcrfG2m/ImoxT63MTVakzvvq2AG80AAOyEx6hz+TMHJsW6G1ClmgzstGwistWXWAirkzV9lvTr69lpQD9cLejdtmIa8HQrLeoWhu3m5m6EW291XLnrTdKZXexN6ycoUGPh1y8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXfsb0bA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXfsb0bA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso5750556b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527061; x=1747131861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5OOecS8teiPhRlJLpXUsRlmizQbllXdt4yll7Iq6sT4=;
        b=OXfsb0bACDq0VLBwOVbY74eegnmg9i8I+piRtTFkV8UoWnRCV3ari4AgsQBJsoof92
         lAFQHygAtqdS6pyF0mtWfogD4SJDRGVXujUtFYeBSPGKYfPiGvBvi7WN9u+tbH4xqGuo
         Gq7lrjnCwsDCWimzZP60QiOp+7YX9sO4bWEc2V7Kt4jNHhT6o16OWjwtEqzWlts57hZB
         SNfqCiid+bIjHH9HJ85qcJw0YuIxuC7HZMiegTIesvjZuKoXL64ZLL3RNxlb/jShXj4j
         NyuZB3YaUhlQlsjysE7JjcdQ9vFwIatUJREMlc2P6HtHvh4NgI4wj78+MWaWCDSPTJJv
         bvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527061; x=1747131861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OOecS8teiPhRlJLpXUsRlmizQbllXdt4yll7Iq6sT4=;
        b=wO2tHY0w4L4X9VjP+BRhkZXGvcrLYt3OsuKzrL51+583e9QVuesGBznAFYVYm8L4my
         8SfVyp3Gn0KVdFuPD93NCcMtrN+UvRvQ84TK/TDAIdqn6HENpHR8oGU863FNXYTJrHzT
         CcISzYQEgH7ftwl8lSOUGtm26/eB9zImVsegL7/J4GsSXYJV/TkIJODHtdXeBIkevR8f
         bSxkvOfA0TnRabt96M1Jj/hKWFM3jIjwXt72nqx1znnQP/GXWMP6LzCjmKz9PsWSlTeY
         NxqQe0u1UTcSL2tSk3QcOuCge/caHBjxPXExUBEt/GTFmCM0wtQYTVr/pElZZP2C3sDI
         hUJg==
X-Forwarded-Encrypted: i=1; AJvYcCUcxsIMh0ZVms74AVB6zzzkRQiXThoHFrkpImdJRwXreSKYER2UtR4s8IooFOfoD9lG7SHH3lZtF2cDOb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFEc63GcvrgbINK9yxQM+d02d10jmKFITq4aUKFQdOILincapW
	rt+fA3XyxWs2y9S2OPrhJNUA7OIlHNeA8KbXV4y6MaOvBt7kg7I0
X-Gm-Gg: ASbGncu8lc1VhA3jjUaBR5iyxNJPzuC9J0FIylorKFbMyTZ7xNiM1/0LjnkwPXNQsSW
	QDqm//WqsIAHrgw4SKBhX6pRBBQjjOyDFX44XYnbPw6PKBGV12dkDYsEEP2xbNs8neaBcgBQStd
	6gaddrTDiWzeyYNposkw2k4ASMzbzETB1RKEPxFL9ke8+wtmYLRXICQAM4drYpijZI1qYY4H5tF
	6OLa7rarq38H1pDu8D2cKU2wcBCX5fuUrwVi9Qt+FCNP05jzQ9LtVUCaPij8JI0IKYjwyJRQnAk
	I9oIzH20sZZ0geUOPxN0y6XFbjiT3X+XyEaDozTqEYF3YvWsaMevGfnIFBBKoH36QdPGkQ==
X-Google-Smtp-Source: AGHT+IHDlz/QY612dZgx+2M3TO/osh8oqkZrBLmtzexErVIpEEkK7Hjl4gPDHOWO1x61ejU+rtbYjQ==
X-Received: by 2002:a05:6a21:398a:b0:1f5:a3e8:64dd with SMTP id adf61e73a8af0-2117dcfed41mr4638467637.0.1746527060692;
        Tue, 06 May 2025 03:24:20 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c442b7sm7112621a12.54.2025.05.06.03.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:24:20 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: dennis@kernel.org,
	tj@kernel.org,
	cl@linux.com,
	akpm@linux-foundation.org
Cc: jack@suse.cz,
	hughd@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] lib/percpu_counter: fix data race in __percpu_counter_limited_add()
Date: Tue,  6 May 2025 19:24:02 +0900
Message-ID: <20250506102402.88141-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following data-race was found in __percpu_counter_limited_add():

==================================================================
BUG: KCSAN: data-race in __percpu_counter_limited_add / __percpu_counter_limited_add

write to 0xffff88801f417e50 of 8 bytes by task 6663 on cpu 0:
 __percpu_counter_limited_add+0x388/0x4a0 lib/percpu_counter.c:386
 percpu_counter_limited_add include/linux/percpu_counter.h:77 [inline]
 shmem_inode_acct_blocks+0x10e/0x230 mm/shmem.c:233
 shmem_alloc_and_add_folio mm/shmem.c:1923 [inline]
 shmem_get_folio_gfp.constprop.0+0x87f/0xc90 mm/shmem.c:2533
 shmem_get_folio mm/shmem.c:2639 [inline]
 ....

read to 0xffff88801f417e50 of 8 bytes by task 6659 on cpu 1:
 __percpu_counter_limited_add+0xc8/0x4a0 lib/percpu_counter.c:344
 percpu_counter_limited_add include/linux/percpu_counter.h:77 [inline]
 shmem_inode_acct_blocks+0x10e/0x230 mm/shmem.c:233
 shmem_alloc_and_add_folio mm/shmem.c:1923 [inline]
 shmem_get_folio_gfp.constprop.0+0x87f/0xc90 mm/shmem.c:2533
 shmem_get_folio mm/shmem.c:2639 [inline]
 ....

value changed: 0x000000000000396d -> 0x000000000000398e
==================================================================

__percpu_counter_limited_add() should protect fbc via raw_spin_lock(),
but it calls spinlock in the wrong place. This causes a data-race,
so we need to fix it to call raw_spin_lock() a bit earlier.

Fixes: beb986862844 ("shmem,percpu_counter: add _limited_add(fbc, limit, amount)")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 lib/percpu_counter.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/percpu_counter.c b/lib/percpu_counter.c
index 2891f94a11c6..17f9fc12b409 100644
--- a/lib/percpu_counter.c
+++ b/lib/percpu_counter.c
@@ -336,6 +336,7 @@ bool __percpu_counter_limited_add(struct percpu_counter *fbc,
 		return true;
 
 	local_irq_save(flags);
+	raw_spin_lock(&fbc->lock);
 	unknown = batch * num_online_cpus();
 	count = __this_cpu_read(*fbc->counters);
 
@@ -344,11 +345,10 @@ bool __percpu_counter_limited_add(struct percpu_counter *fbc,
 	    ((amount > 0 && fbc->count + unknown <= limit) ||
 	     (amount < 0 && fbc->count - unknown >= limit))) {
 		this_cpu_add(*fbc->counters, amount);
-		local_irq_restore(flags);
-		return true;
+		good = true;
+		goto out;
 	}
 
-	raw_spin_lock(&fbc->lock);
 	count = fbc->count + amount;
 
 	/* Skip percpu_counter_sum() when safe */
--
