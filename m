Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B702356C8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685309; cv=none; b=nxVHbPUab/0OkR64iNjsPTAcufPiUHbLuM1IJzCBmqISNUlbO1GePEirMFLRa5TkXKgu1h6zB1EwshoFRtdlnrzPD2C9srKM8Zwyr4ErTKET0Mj2pWefciAwCBSarX9x85r5IXxyw0fYWFKCBp1JusgDUqcnzMLi0xRfreeiWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685309; c=relaxed/simple;
	bh=qfxs19SK10slyUO0O8nR8PbPqoZ9Hjoq9tzPkm4Mjx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gm3Y3MzccnrEeZ8q3nJZaY/AVSV8/oZiEvKzsN10c776mkZY9xYtHv7ERT1AShlu5eWSJD2ogQDyJLKUT5pmLUxK4fkLggCLGnnTfoChQLWCnYr8Jic+QKPjEjYbJJN2COJLPrIKHsIwd4ZVEZ8DjEMVae7ref9/3gs3tYHLoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kPovSJD3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kPovSJD3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30820167b47so4172843a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685306; x=1745290106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXOKqlBcK7wmw0vjxin9AD5vy+d1LV8LiFHk+wC2Q/0=;
        b=kPovSJD3T5k4Wp3/2QgSI2nVOJlsPBaE/mXyRp1yP1T6zU6bqQUUZhSFpTkX92hAp8
         NyKFgvPOrkxzi5h02VVY1TgrEU+jwsbJm0BiQGSySJje5M4WwzU1K1u25UeFfTywUP97
         ObhZIdxypCfmdzJrM8KfHu9aXX5KGFjt4qIwEp6W2pX0QTsyCiKNq9vOO6QkMOnJejmO
         w4lConQT8sno2bzPxgMaf0kL70BTNgxcIEnEC8q0/WeP+HYuiI5PJ9INtcTnXu4Dexs3
         wMj8VW4BUoQ0FhMw5HKji0VvypzhV6GrLBFUpo/OdljAHn/BA9L/ZhGX1aA76DUGKcip
         7IkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685306; x=1745290106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXOKqlBcK7wmw0vjxin9AD5vy+d1LV8LiFHk+wC2Q/0=;
        b=emfykj0Hq+g4GPf/W/q2fBlFM2KoHYWimHazVjf7b+OZh+3bwrH8SkQNkzK6E1oyW8
         y5zh/GBNqwz1LxhDKkytnlA6cA4n1gcvjYOp9rGRIWOF5dkzusrRMzxB6Q88duPfxT4U
         CazbLbTZfFvnLpYkrZjroHFv4Lh/DpBObmLXaT4y9P7FvSqby2k3Hj61R7Y9rpuz0cJh
         +7JF21WpM58ugjTyBsCzzcz7kRPieUqdpCia5k+OOVE7wdrJGcJK/tD8gGqUuiqpOa5k
         TF1hcwJJuAUSpHywjP7PKb7YJd5TnU0Azrm+nNPBU9XfiD8evo65By9CnX0xvob8pVoB
         lmvA==
X-Gm-Message-State: AOJu0YzBNGDwiGIlLMIR7bR48LUEDzYAI1rjZ1CJ7ngsdiY+KLwhZKRv
	vJesWTE6lmEw9NzxPgUTJcgM3wXSRlQ2xNBWmpMewuOt/6e67ijdIh02LEOSCb4=
X-Gm-Gg: ASbGnctDA4OHJmWa6WysZYAoHRv7Oj94YRbkXUZWBX05sFOdPj/GkD0uxY+1gMs638D
	xmeDpl9pCggikX/f/CHSNvmyn3Gnx4LfiIr5LPYbViKk0uQ4FTegY37Uodst8s39JEbYlPPh5Zs
	EiLolOCve40SpSo0yKARDN5PTUrvhOMJt0CHntvFVmTmMVaCkFwmgOYoBNc4tq8x/XP7gNLcLgF
	kJu6wHwlw8qrqt1hD+z0uCtLbzj0LDKJ+17t2x2l6d6+HD9/rGvUexJxvD28Skq2HSYfl+dH8y+
	U2v3/mK3r/RYQs7P3TlUI0trU+yvcSpmYu5bSDvpFwGQqZNOt+ALz01cmhva0OWLWkd6uKwd5lS
	iT1rndIs=
X-Google-Smtp-Source: AGHT+IH7xXBf+pSvn3kHgRy6uEQ3xLaVZ8ScWHSC0IXjydDRK6JttBy5tPzuwSPN3xTseySeCrXp4w==
X-Received: by 2002:a17:90b:28d0:b0:2ef:ad48:7175 with SMTP id 98e67ed59e1d1-3084f3d2a3amr2508095a91.15.1744685306495;
        Mon, 14 Apr 2025 19:48:26 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.48.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:48:26 -0700 (PDT)
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
Subject: [PATCH RFC 28/28] mm: lru: add VM_WARN_ON_ONCE_FOLIO to lru maintenance helpers
Date: Tue, 15 Apr 2025 10:45:32 +0800
Message-Id: <20250415024532.26632-29-songmuchun@bytedance.com>
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

We must ensure the folio is deleted from or added to the correct lruvec list.
So, add VM_WARN_ON_ONCE_FOLIO() to catch invalid users. The VM_BUG_ON_PAGE()
in move_pages_to_lru() can be removed as add_page_to_lru_list() will perform
the necessary check.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
---
 include/linux/mm_inline.h | 6 ++++++
 mm/vmscan.c               | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index f9157a0c42a5..f36491c42ace 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -341,6 +341,8 @@ void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
 {
 	enum lru_list lru = folio_lru_list(folio);
 
+	VM_WARN_ON_ONCE_FOLIO(!folio_matches_lruvec(folio, lruvec), folio);
+
 	if (lru_gen_add_folio(lruvec, folio, false))
 		return;
 
@@ -355,6 +357,8 @@ void lruvec_add_folio_tail(struct lruvec *lruvec, struct folio *folio)
 {
 	enum lru_list lru = folio_lru_list(folio);
 
+	VM_WARN_ON_ONCE_FOLIO(!folio_matches_lruvec(folio, lruvec), folio);
+
 	if (lru_gen_add_folio(lruvec, folio, true))
 		return;
 
@@ -369,6 +373,8 @@ void lruvec_del_folio(struct lruvec *lruvec, struct folio *folio)
 {
 	enum lru_list lru = folio_lru_list(folio);
 
+	VM_WARN_ON_ONCE_FOLIO(!folio_matches_lruvec(folio, lruvec), folio);
+
 	if (lru_gen_del_folio(lruvec, folio, false))
 		return;
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index fbba14094c6d..a59268bf4112 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1952,7 +1952,6 @@ static unsigned int move_folios_to_lru(struct list_head *list)
 			continue;
 		}
 
-		VM_BUG_ON_FOLIO(!folio_matches_lruvec(folio, lruvec), folio);
 		lruvec_add_folio(lruvec, folio);
 		nr_pages = folio_nr_pages(folio);
 		nr_moved += nr_pages;
-- 
2.20.1

