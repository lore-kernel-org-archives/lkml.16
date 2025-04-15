Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0A2248B9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685216; cv=none; b=OMh/OPweoCqmX/mY9bBpYCsCZ1BMygxeJK3Du+S5TEzFUjtf1C1Rvy2FHWZvTsV4xHCn229iLjnx5lHv7Y/qIBJ4PPJoG/E9jeV6PifOAwnJDdSb7MVXBIetbD5HqVaaqNyynJ86hfQ4k0uFfpYx3rWeevKBhNlayY+blCf9Fqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685216; c=relaxed/simple;
	bh=zozmMIIkyQB7vfg2WW3vcLqWkxJHli/zl3aRM3CRPPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YEZ68d2ar9+vS/Vn6u6JkBTyGqt6OEu1jrC/GJTUI+iMMJy8B4m5Yu5IUisoDOvaQT70Xmt5lv0GhO8jSEsfUHFo2WVrhkOHj3E7U3lFrxbJtiTnJmIH/Y52TEF0c2by1868ndTJ5SPC7ZkQ0pIDjlMETNwDW2A4E+Od7r1FrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=izAJHX7h; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="izAJHX7h"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2240b4de12bso68175175ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685214; x=1745290014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDFiTtsYE3vsXL9LKCv2J9wFa6MHITbi7MDnimw67RY=;
        b=izAJHX7htiBVyb8xAlCgBvEPj9eNwRXIty0+c3vv6IRU0PDTSTRs2NV8dsNzx3CwCC
         m2X2OOXjuq6jLVgJaIgxhsk3VvBvIzVAmrxaTqFpCdX/D55HKLkNLtYJ+dBalryk75Qs
         SXca/VIquUgJOsSwJXVA5fR4vws1DaciGlcPgS01T4U1F9RuFXVJCs7rhqmvT4QWR3Gr
         bRKuhrAvnD/FSSQxY8NaZmevRQcXPcozOJ1woSPEgszqE7gkLq0iLYs0E934Dhj1vtnQ
         it6wlms5CnZQmya22svuodlg4tt7CEaLxf0EFktqox/Y1dq88etZOfbHeHxJw4VjHuM5
         o/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685214; x=1745290014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDFiTtsYE3vsXL9LKCv2J9wFa6MHITbi7MDnimw67RY=;
        b=wW+HMd2IMzw1oIqDryGCmGa7cJwIhnCWHb1/QH9M43/yrmzd+2ePjA2KlqkIzj6fCd
         EWJl3COjnr/t6DrtGe0paDHlvbsVfSy/a7297pfPwFaha188KjJEdPt+6CZ7KC1rVQS9
         tV/+CjHs4WBI277mlDp0j1Sp5AxmEvbhg8Ud2o0q6s6SIIgklBTGC1w8PT6H5edCLAGl
         x3OmmhejxJPA23KoRq2PPcT8bdSva3BYlZC02ZKSitDt05eJ3StAWpyNEkncdwBiA1UA
         +r8/Mj0ayKxX0SqhhwRy4xuQWAMuoXI+BcgxVkwqudPIcMZCiTZDXfTddoam539u/y+X
         g0uQ==
X-Gm-Message-State: AOJu0YzNEWMxg3835G6R+aT2CSmzutW+xbYFPG/1bfUcscKGiXz+oZaf
	rOG6TXld0aTlCLZHdWM1p3yBJaAXxl6kOcEBu0JhtTgZnWeg342GBDwA+kLnmb8=
X-Gm-Gg: ASbGnctFbIDAj375D9ojJCqMNVD4o8gOBJCaP40bbjjDudOUpkalu/KxUTcYoFKLYw9
	IVKgUDdT6dM86dNzzmN4bs0299tGU74b5OSNOPLHYGO7s9Zd4NKsEJ8QbKF90iNIATx93I0lki5
	V5IRccBCdpywHG+6045yxXcmMU05ztuROJci69j1GkiQPFsq6QCB3yESf95yC22z7UsIR1nqXwM
	EUT+oOUeFGxkTpWqzzbWjjqKvJ8tv0TxPYZjyRrzGsGA18WeABQRKofX6372zvdxxWFro8mVTkA
	7d8hw+SwALxLJJoAqeMdeP8HRUaS0YD+TCykO+CuP+LLH6Pae9MQ7m7CHh8wVm+Qed4UgW/ovcw
	sozWVD+c=
X-Google-Smtp-Source: AGHT+IFH7dR3wBmfihakVorT6Qxxwq/ncIuMTxmwaVROxMgkaq6cZIV7iNxi0oFb9UgfVvElafvYJA==
X-Received: by 2002:a17:902:eb8a:b0:21f:6c81:f63 with SMTP id d9443c01a7336-22bea4b6141mr200724475ad.16.1744685213756;
        Mon, 14 Apr 2025 19:46:53 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.46.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:53 -0700 (PDT)
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
Subject: [PATCH RFC 11/28] mm: memcontrol: prevent memory cgroup release in get_mem_cgroup_from_folio()
Date: Tue, 15 Apr 2025 10:45:15 +0800
Message-Id: <20250415024532.26632-12-songmuchun@bytedance.com>
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
against the release of the memory cgroup in get_mem_cgroup_from_folio().

This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/memcontrol.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 4aadc1b87db3..4802ce1f49a4 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -983,14 +983,19 @@ struct mem_cgroup *get_mem_cgroup_from_current(void)
  */
 struct mem_cgroup *get_mem_cgroup_from_folio(struct folio *folio)
 {
-	struct mem_cgroup *memcg = folio_memcg(folio);
+	struct mem_cgroup *memcg;
 
 	if (mem_cgroup_disabled())
 		return NULL;
 
+	if (!folio_memcg_charged(folio))
+		return root_mem_cgroup;
+
 	rcu_read_lock();
-	if (!memcg || WARN_ON_ONCE(!css_tryget(&memcg->css)))
-		memcg = root_mem_cgroup;
+retry:
+	memcg = folio_memcg(folio);
+	if (unlikely(!css_tryget(&memcg->css)))
+		goto retry;
 	rcu_read_unlock();
 	return memcg;
 }
-- 
2.20.1

