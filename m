Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD79D20ADE9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685174; cv=none; b=iWF0KtDRF1Ag72ezFsqLoi8I+qnUFLHqTIMFs6/qktWmRHdW9rrGKrOVCBsJB4WQM3pDISFRy5Jk7Tl14/J/dGomd1cQb9jRFD4cBQH2iNlabYSriEOQHhRKpW8JQcbLe/xhVGNNwEdR0ADietNM0xWECgw9Cz3BYgb+j4lRO7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685174; c=relaxed/simple;
	bh=coPa0VZ+lz8ATwbtZkKdsUxWQhC+KKG60nOSR2hGqUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uQfYYDUj3r4uroeOEJhphuKoJhWkrKROltRy5O1UpSzIVYrK9DoXP6y5nUGrNv/i/MJWNL9EEsekPwDfgUZt0mpSmaXvy1enk4R+TAbyNxPboNrG7rBG9pEmx1/QXMcLh54H93iAHxm4QRSPKLBv9FVLMI3wYyeSHph5LLemQA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=g7TnzUTo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="g7TnzUTo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224100e9a5cso56026985ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685172; x=1745289972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxEqDGFZMUmXVsS40Ac89DQGDSUswXt+C8ij+v7lQJA=;
        b=g7TnzUTo27NnuNpVdGbuY2kPLu+ed9HtSEaBn+VMpJZksRwEKRafjaQzmAkmtk4z8v
         flY8QSCqyV35m9dLFRN55bfxL0rw2k5or062olD03Hn1BvEVmPEkvbUq0ZFDbdJz5RIb
         pbBmUFeyLOqEdqdt9/2+VSItJdczW4ESgtNKUxk+KziSBkcx/XWWaxQVJ+kKtIUwGVdY
         TvjA4nNb9d+/iqyChMhFoAflXuJIaYbfsaiKY/RgWC1NETIn90lEzQesRzX8JBLyYXk3
         OFc4eT+FBOYjSUPkLIjMOHLFlcnyMkQIN+edV5CrspNcQARFFZutJPiPKJ1Skd6+iIRz
         j9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685172; x=1745289972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxEqDGFZMUmXVsS40Ac89DQGDSUswXt+C8ij+v7lQJA=;
        b=xIdvrY3F054/U+LtKUSm//M86S+L/mLz1A4hoWdshTqPRfG9ancpy/ZeBigqUJV4NR
         B5VA4XbXZv6oEEvZZ0jU1WaPNUcE7j7OjsJwvY7KzztSWtcK75injQehUXp7bH0YZ+EM
         KRuDrltKi4JyspeJPlm19heVdFaq+BiebGIyLfkfvpfGvDzaBdz6/GaqdbjE/I2UV56N
         Yrqi5ezMistB3G+8pQ29nCSyrCM9VKytIYjkFAxoqvkDOF1D/RMsF4uwals3DxdNJOXk
         3A/mju441bY0R884treZ76zmGuXueFzEyLNaW5en0txrc0NhZ9kMAes0pNWs31Pa17O0
         7eZA==
X-Gm-Message-State: AOJu0YwgmhFQbkrjImxNgEnOnnQjoe7eHS/LlpjtlfIoMP9apjYrFarm
	J7U4BQMwFTasH8Y274LxKc6wYBkrC50XKoOSe2P3BFpa53DzQdCkLAGBFXR+0iA=
X-Gm-Gg: ASbGncu/1jNu7SlVYxQe9QFeTSO6Uh89kqQf6tyj6AKeDllSar0h0FlyrS/1hHgAQax
	FAoQLDLL4mjNuJ1f6Uu7oC3SXvonKmUHtqYfe57csnVG8NfSSMrwyEZNoOn2wB5SOsG/zqNIyBW
	ylC+bMZfSs2leBz1S9dYCffKHGZCwAEYD1d6VOF7emekAnTzK4ydNSyNkoq5Q/Fx42l/sK/PjRb
	blM7MQi2oe3Ke7vsyIDtjyq9hpxa/hWNnxdqb8Zp6n13O4Fk+XxO7afqbhj90bw06JhsxQyLpbQ
	A+cFzJt8YdIF+8WBtzbIKScytkpNtMewtB4EY1zAVWo7fhMoCAj632Vb9AmReix+ZfW/huHb
X-Google-Smtp-Source: AGHT+IEIXidh/WytIqsVeM73H2bfcV0T/EuPMcTn2oTZb/fVqTSwur1YIJZD8NROyg3NAghPl0x8VQ==
X-Received: by 2002:a17:903:228f:b0:220:bcc5:2845 with SMTP id d9443c01a7336-22bea49548fmr180452435ad.7.1744685172229;
        Mon, 14 Apr 2025 19:46:12 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.46.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:11 -0700 (PDT)
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
Subject: [PATCH RFC 03/28] mm: workingset: use folio_lruvec() in workingset_refault()
Date: Tue, 15 Apr 2025 10:45:07 +0800
Message-Id: <20250415024532.26632-4-songmuchun@bytedance.com>
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

Use folio_lruvec() to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/workingset.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/mm/workingset.c b/mm/workingset.c
index 4841ae8af411..ebafc0eaafba 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -534,8 +534,6 @@ bool workingset_test_recent(void *shadow, bool file, bool *workingset,
 void workingset_refault(struct folio *folio, void *shadow)
 {
 	bool file = folio_is_file_lru(folio);
-	struct pglist_data *pgdat;
-	struct mem_cgroup *memcg;
 	struct lruvec *lruvec;
 	bool workingset;
 	long nr;
@@ -557,10 +555,7 @@ void workingset_refault(struct folio *folio, void *shadow)
 	 * locked to guarantee folio_memcg() stability throughout.
 	 */
 	nr = folio_nr_pages(folio);
-	memcg = folio_memcg(folio);
-	pgdat = folio_pgdat(folio);
-	lruvec = mem_cgroup_lruvec(memcg, pgdat);
-
+	lruvec = folio_lruvec(folio);
 	mod_lruvec_state(lruvec, WORKINGSET_REFAULT_BASE + file, nr);
 
 	if (!workingset_test_recent(shadow, file, &workingset, true))
-- 
2.20.1

