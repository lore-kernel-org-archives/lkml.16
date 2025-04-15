Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721A4232792
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685266; cv=none; b=HzF3zZphIjKhs41HPUIKH2nF2PjxkvPMOCq7HXNVwfk7QlUbK9pwWVcJ06oYfWuD5K9aN863Tzw3qB/BVdw5jXdIa3FwHP7A340j/VCNTKFInuVWMzOzXoQtvf/7Rqi9XAzz472dDZrxDqhnbHv29N9XxmHaT/N1iIHVjDREenc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685266; c=relaxed/simple;
	bh=MrXrXjTBYXLdLREsfYrjSTNotRmujCm0BhazHpTsW2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mg1agWYhSkChplVTweX34dtjsy4ZKLig7CNJGBw9CRGg7prNtZGPpKg/oH6R/XN8LpbAApjq3tKELjZOfkBYlx04yhro1SQlxHXL80F9Z1TUnvsMAsKAVE2Sx0j7kdIvc6WYhRjCQXUdC7s8a44eKB7PhgqbpBlogRTZW3lxFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RpS6rVR3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RpS6rVR3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22423adf751so45813865ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685265; x=1745290065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63b5+F5fFo9uNyjbfST0FZ55aigVErZF90xX0QFU4a4=;
        b=RpS6rVR3Kav0RuLYj5Hi8WHnWyG74tKTln+QeVE4hgeO1oZvihhy6UQC3eUTGfhfin
         7Go+fHxQOr+rTpcdDZrwkUzdfDmIfPz0dfeMPEcdaw0EHodfp1VID0DEmlJBJY5DNc8F
         zYz2P+Cea1TCqDwziLNcV3S/eNfuaGBbSxXvoumaIrX+LxyelIUk26/qNyhnkxKwXXLS
         TGTX79vnfEbKKOz+0OL0mZ3VlMqTAbs9crJszuvY3NYuthu8ru3s886AdlCJrIWmVEXg
         WMkJ18nFMSOSQGZX8vHANNX7mCtiHJyddQDQ5cpr77sOBjIWNAJxRTVcgrhnuAQU+H86
         PDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685265; x=1745290065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63b5+F5fFo9uNyjbfST0FZ55aigVErZF90xX0QFU4a4=;
        b=CLGRq/hIrEg/eyVNQArIm6aY24unmp91BIktBADqV9/wpna3y6v94/AvPwRE1QychP
         oBPlFGnCr3N+eTZd6L+noOnYkPgn2j51/0SfZJRfPsNdW7cW2yjJxfVIpbRkMFiNdh/y
         xK3nminsl7zu2BeDS6FdjoqVHVgVBQ5xpq5+5PC9BqExSo+Tj3ZGpqy4cJZwOEFYCY+j
         iwMkGzsdamh2yiuPRW2sqxY2f+b5wMWc8GLgpGgUXbVtGYzhFH3HSkdgzJ+LceJ+6rsR
         tiTZ1+AfFFlCczku29qzAyqREVBo9yLqBuzKspq2ppFFD35LzNjIoqCnQyMS8LQBaCDR
         hp+A==
X-Gm-Message-State: AOJu0YzW2gy+JhB4cOfbvfJpi1+/HvkySTkFOfmxYSaHnbiG7HgLuaAu
	14uBB6yEVs4SwO0qpn13JUC/crZP6bLRdFoRlICHHUK3FCxSSAzS5OnQKedcX60=
X-Gm-Gg: ASbGncuD5tWhJqYvTWUxqfk+nYo/YVf1ItC08WvRvQn+xsFBM3J3yuY4sfGEkF3DRG+
	FRGHK+3hPWQhd0jjNsWgoxiQAp1EpCydg8yNdQHABFiH22wMYqvoHLe5x9bcbwDk1ajP5ZZ86Dt
	lwXF0frba61sTRJ3G/zTeu8Ag6EZeAQT0lxyPOKNGnTxh13B51jQ4S/5ZHpAyH9sKSSY2RgqxsT
	7DqjlmnUHLLRa76sWi5SXnezyCGLoI3K2elmPMsEJdob+EOPXhHBOrpRNbc7OA/Am8vgfZBhRmO
	u84pcGJ0QuM8UpWQj+i9P+muC9ikBZ2ThqBRbT6XJH05ceYspQla71kdBtN9TPw/Q8wVdSUR
X-Google-Smtp-Source: AGHT+IFmIkyy7FOoYDJmjbvJNymfdfM84C+MAEagetSFHxG3fte/Kh1b2EKbddjsXQhUKdg0bAYVCg==
X-Received: by 2002:a17:902:da91:b0:220:f7bb:842 with SMTP id d9443c01a7336-22bea4efafamr182908255ad.42.1744685264764;
        Mon, 14 Apr 2025 19:47:44 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.47.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:47:44 -0700 (PDT)
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
Subject: [PATCH RFC 20/28] mm: workingset: prevent lruvec release in workingset_refault()
Date: Tue, 15 Apr 2025 10:45:24 +0800
Message-Id: <20250415024532.26632-21-songmuchun@bytedance.com>
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
against the release of the lruvec in workingset_refault().

This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/workingset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/workingset.c b/mm/workingset.c
index e14b9e33f161..ef89d18cb8cf 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -560,11 +560,12 @@ void workingset_refault(struct folio *folio, void *shadow)
 	 * locked to guarantee folio_memcg() stability throughout.
 	 */
 	nr = folio_nr_pages(folio);
+	rcu_read_lock();
 	lruvec = folio_lruvec(folio);
 	mod_lruvec_state(lruvec, WORKINGSET_REFAULT_BASE + file, nr);
 
 	if (!workingset_test_recent(shadow, file, &workingset, true))
-		return;
+		goto out;
 
 	folio_set_active(folio);
 	workingset_age_nonresident(lruvec, nr);
@@ -580,6 +581,8 @@ void workingset_refault(struct folio *folio, void *shadow)
 		lru_note_cost_refault(folio);
 		mod_lruvec_state(lruvec, WORKINGSET_RESTORE_BASE + file, nr);
 	}
+out:
+	rcu_read_unlock();
 }
 
 /**
-- 
2.20.1

