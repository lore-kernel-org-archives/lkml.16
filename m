Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1BA219A95
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685234; cv=none; b=oYB5MbQWhjU6/bSRX8bdVPqsk+r/bzAf0POk5PYdp+si4WC+V0bbjfs7rEek+78EnzoUhv/1H1x3iZmN7WWQVi4GdOfw45Rpdv75zmKRYuxfayEeBvF7TV8tzjr5cF7WVjbDa07Glt876wVZI5FH3SaTjvSgflN/4MZIKwAKrcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685234; c=relaxed/simple;
	bh=HuKS97oFEuuG+wDz4Y7AeIlRQjvWQlQVDlFIdpSjOu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B5unS+G/dwTWrO3BE6G25OX1IGu5t//qqJreP/cqsXaLEIuUDin6Nug8hPG7KpdvvFQTW5/zMOTbbF/vwugCURu9Y0Ri5JVLde6Zu7r6wf9DRgyU9ndoDRtjf1vN+jomKNBll4Z6cKJM3zMED1JsFztIairRn+HjUnQCe1yWoAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JZHSpRdH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JZHSpRdH"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2279915e06eso53263835ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685232; x=1745290032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg/Q9PeJ3a0fPq4jQ400Y/OgBu3oFR0wAT2gCDp4D5Q=;
        b=JZHSpRdHY8uZnr7Uac6F8fijK+voc0kTBhBrjdqHflYMBvGApQUQUWAD2KfKT7C/f9
         wldL4VW9zYPnaOLjIO/Gm1H8DKySvpx2sYl/6PT6GgBmFXBFLmpG10R/TKWcKJj/IpW/
         ZKcJdnfeevCyReCdlKNKb76+XoEpdkO+XqZCDKukOPbpadaD8TbjByKMk/a25Kn7Nb6J
         ENePShNAPX2HcnstFCNwSete79gBxnKjQxWGIWcEbdQyt5nkueyce7Nw65z/pWcNH8Wp
         YgievKHSiTlOco3M/QbvMaMQjFX0ArQLzZdNt1oNWVcKpEk0ZcMhmlfobNv6japNXc0g
         Jt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685232; x=1745290032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xg/Q9PeJ3a0fPq4jQ400Y/OgBu3oFR0wAT2gCDp4D5Q=;
        b=YyjvlU2srvMOLHUyRAAK4kbXCE7jWfX1ybhm2CsOs+Fb88H0og1pdtCDq/UQZjDnud
         mVDYXTibxuN/LrQ3VFwANrlFYS/Vq8zmimLKhVVEOZ1WlqJ7iPzqHYVG0s0CHtSoVDKS
         XcqmWZvKy52DOr7HFe5CPTIN2Q+xvxSBo1NM5dcEq8ia36qSKEFYBtRexOVnwTKLDrGv
         1FDs1tcxncni58nmeX/eHCLYWhO7awla6TN7xyg5rXKHA+gB7Ov6GtRjQBKI44HgAgmZ
         MRfM+PXdR7bkNBc3ZqFwgWSRD5zDA7obKRFYCIapXRacX3w2QdYKuG0ePRGcicwetDuP
         JDag==
X-Gm-Message-State: AOJu0Yz3NDMoaw1S3Jx0O397SO++WaC1TOy0E0MKzHl3Bs+7DwH8WVJn
	iA9JhDBwiEGvISP4+Xw/994oomV+TnlnHUTpbrAF+lcw5NKnbAdlQwGec85vCyM=
X-Gm-Gg: ASbGnct/7dGwHE09tfqtzQ40fFCqfkV0d6z4WmEGngzktUuNtCRrUMIpyXALPh4ORd6
	9x+oh5RoNKNtdviNoXkZ+e1Wck1daUtaQpqAZbcLyLY/84Hfr3IojwRUgg6ZXwdA/nFiBgIgp6C
	npTPAbtrsUwUuHyTd9bbUBxCBhkqoDFD+WKXg6G+6HCm29lVucceTrj2sM2RErXastF0h5AjAyI
	e5T/fEooSF8KTj/esJSsaiK0cQK2ryOqqFMMh+XPglVYxTL1EIpOQUbMYkCCh4OVc/N2m1YiAAF
	5cdcumfRzJ+vbnPsMecN9l+NJrJrUWHGOXDBI/2FVRJ1ypPVbXwBzAM56TCek0zWCuE62v4JOK7
	+gno9YyE=
X-Google-Smtp-Source: AGHT+IEzkWcKa2ct6W+m99WRXOgiOEymvJ30CBNBOfWjsGr2/iLsdVh+Li4JvemGEyYH2iRVm2MWrA==
X-Received: by 2002:a17:902:d485:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-22bea4bf561mr197033565ad.27.1744685231866;
        Mon, 14 Apr 2025 19:47:11 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.47.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:47:11 -0700 (PDT)
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
Subject: [PATCH RFC 14/28] mm: memcontrol: prevent memory cgroup release in count_memcg_folio_events()
Date: Tue, 15 Apr 2025 10:45:18 +0800
Message-Id: <20250415024532.26632-15-songmuchun@bytedance.com>
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
memory cgroup. To ensure safety, it will only be appropriate to
hold the rcu read lock or acquire a reference to the memory cgroup
returned by folio_memcg(), thereby preventing it from being released.

In the current patch, the rcu read lock is employed to safeguard
against the release of the memory cgroup in count_memcg_folio_events().

This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/memcontrol.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index a9ef2087c735..01239147eb11 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -978,10 +978,15 @@ static inline void count_memcg_events(struct mem_cgroup *memcg,
 static inline void count_memcg_folio_events(struct folio *folio,
 		enum vm_event_item idx, unsigned long nr)
 {
-	struct mem_cgroup *memcg = folio_memcg(folio);
+	struct mem_cgroup *memcg;
 
-	if (memcg)
-		count_memcg_events(memcg, idx, nr);
+	if (!folio_memcg_charged(folio))
+		return;
+
+	rcu_read_lock();
+	memcg = folio_memcg(folio);
+	count_memcg_events(memcg, idx, nr);
+	rcu_read_unlock();
 }
 
 static inline void count_memcg_events_mm(struct mm_struct *mm,
-- 
2.20.1

