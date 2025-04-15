Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7CD21D5B3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685282; cv=none; b=NSBlJbkUf1ka5tgDwBZOq7G8Qih+3In0I/V3pOL8aLn9/hwIouPFXypAXKrmHVMhoSpxIR/vnUnMIeq525iIA20aujDEeS+sP1YIrDLbYevsF4v+r1XhHixX2SZGZGV1HobXVrPRSzCQVLC6nFbmU7BGLKiJQhCfxVeihWe9gYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685282; c=relaxed/simple;
	bh=hwnyuwbVRBFAA56pD1wDk9t8QUtkgrEJu4P2YyCqkrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nOq9khp9z3vfkPdrfYK3PvRUh5++b6OR5qfY+7CCG7yMxuohDd26+9t8rBBv39ZyfNIXsbiF6UNYnQgjRaUU/97qJFrShpkbE/LsA6QO+uhAXf8QVcX1jP8TGqg10HPFdvbX6YHDiigTpCL53FJlrSyGZa1d5cf1fG4N6gtPszY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=icfJr1De; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="icfJr1De"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22423adf751so45815345ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685280; x=1745290080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUs32dtFutsOKBw24WRLrtykUD+fXNK5AQbCBXYyH+U=;
        b=icfJr1De56/vcTa7+gUpdgphPSQa1E/gQI2fjVNw0kcGTsds1P9wtpQlbJupMPay9t
         mYGk33QtWk/T+PKgnt6VFyIRPqaJzPprjoIbq/RIOfxmZNeTG/9k9ELI8Dm3dHfsvlmc
         l1oFbmS0qPvowHqVkahE10TO0ABgwzjiq+uDnawxGZ0s4TFEYlHhb4FKaKfbWIqthtV8
         2/71Xg7JthTfU0KWaS2pUDr5g0enmzFiGvNO6+nFrwqJes/CLxDfM2C5+s05W2YVL45q
         5nfn/JQ5hUICwiBesTDtZUdRSsj1VghkzZZYYbGxQd8+kKZLgx+Nit5W4KP7LxO/6Tin
         g8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685280; x=1745290080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUs32dtFutsOKBw24WRLrtykUD+fXNK5AQbCBXYyH+U=;
        b=pMg/aaexCid1Lu65vH4OhQba6H13/OgMaP6w9sJkJuWh4pZyOGN0XtudxaKFzt0Rw4
         HT2OUJjzX8alj0/hgYOFvaMbIWxdheGjwLlglElOILgwlNq8cyB+PhFdv7r0A6tbh+2N
         Kl3LnU3m8oSFCJ8G1XrBAdXbAweF2KxeXAni41KTJETffzHvBGuSqZpZBFiAHZjNr+uK
         uW+VXd9fKy4fyyTGd91nLXzZE6GIHxz4K4PI6lpXjyGkX2qIufVeivi2DsWD5OWJFaVM
         +hxt9ePF4SJCcqSpJTdLs6aRNhJHAGgjXXK4aLOC5rdQpMTmVc//bO2xhuQAyQg5l/5V
         ps2g==
X-Gm-Message-State: AOJu0YwxKgTZkY4Xgw+ZRgR7F5u/X9yImKbEPTm8O3TbO4DXj9YtZQdL
	uzVDgnVO6VhIO14GGMc8hdg2r0dPAcRR0gYDAK4V4fivj3g97fNwJDJzmq5Kzgs=
X-Gm-Gg: ASbGnctLEyMt7o8yR8fn5rOVfYZ9g+LkRWKDZi/OtKtWpGw7PrPvVT1gQIQZF5hMWO7
	LJWcEucfOAZEmtpozlaSQSJ7YmxvHInzmTqWmQEfveCnHQgOLP/YMvgE8zUY9eRmpfS0XdgT5Vp
	rE7ucQ20NsDuENAPP3GYtdlsFcY3IPxqyAovYV0etVis8JrU1cwB5qqTRL16QBeDF8iSQUu4uzc
	Im9MhiA+a76UvDsslkljrpTrOY3w7gWhnSgVwxk5vtJinqjqfBrysIn/2qs6jsoM4os0Vg0W0nG
	2kLIL2HYt+iKb5baKoObyeWBO1VZxgdxPk6LdvsqQmE5uW4EiTX9NG1GYlHeOhIMbPklVqtl
X-Google-Smtp-Source: AGHT+IEtjVtnb1BSndquKXoPm2m8j71DYv9c3rLhXw+JhVIvJMgE2spfc/6lyYJ7b6Mu11ismWhvkw==
X-Received: by 2002:a17:902:e547:b0:220:c911:3f60 with SMTP id d9443c01a7336-22bea4fd182mr195573825ad.47.1744685280634;
        Mon, 14 Apr 2025 19:48:00 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.47.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:48:00 -0700 (PDT)
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
Subject: [PATCH RFC 23/28] mm: workingset: prevent lruvec release in workingset_activation()
Date: Tue, 15 Apr 2025 10:45:27 +0800
Message-Id: <20250415024532.26632-24-songmuchun@bytedance.com>
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
against the release of the lruvec in workingset_activation().

This serves as a preparatory measure for the reparenting of the
LRU pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/workingset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/workingset.c b/mm/workingset.c
index ef89d18cb8cf..ec625eb7db69 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -595,8 +595,11 @@ void workingset_activation(struct folio *folio)
 	 * Filter non-memcg pages here, e.g. unmap can call
 	 * mark_page_accessed() on VDSO pages.
 	 */
-	if (mem_cgroup_disabled() || folio_memcg_charged(folio))
+	if (mem_cgroup_disabled() || folio_memcg_charged(folio)) {
+		rcu_read_lock();
 		workingset_age_nonresident(folio_lruvec(folio), folio_nr_pages(folio));
+		rcu_read_unlock();
+	}
 }
 
 /*
-- 
2.20.1

