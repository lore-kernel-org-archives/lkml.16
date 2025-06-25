Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5100A3093BC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893573; cv=none; b=jMVTmMLk6NjIABBKrtIRzFFr0/O88NfRH8Z+jQKzdPCvDF8CP+Qr7vHaM0KRl+zXrdO0SqumuGd/T4/Xdwp9Wp218EN7A0gaS9XQgImIX26bRF73Xn87UCVGGwbszO11ajENz6eXxYchAWEyYzdBNLiM5nRIxbD4IQKbX5XKdzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893573; c=relaxed/simple;
	bh=rOKb5+BagbcTuwgLuWWQhxdztCUhJ4cU96gHLwWmcIg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xl78WnHDCYFL2su0THw5ibU1yiGg9h+QY0/Wr80YaXR0f3FzcQgFUerzJqhcX6S4XVHXEiqawA3TwmvFIIIVncaOVxRiJ4earCdOngNDIiQu/IbA32H+hyb27Cb8QF+RG4Bh5pmZbl/ZczQmjiuAsfrMnwa0HJS4P0SK3Ex8Nms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=oVBHKn2c; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="oVBHKn2c"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e81826d5b72so297586276.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893570; x=1751498370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY4/VNSyW9YlnxXNwTl0Byyb+JX9t6CMuRa83xOM3rg=;
        b=oVBHKn2cRAoN/aMCcBAlVdvcThXOVeaxrjZGLJBbr/+i6wKYbOv6VXKqB5DryqXkCq
         nOkDhnP/NuM7MjqaIwPkdisn7ZC5OfWFnHQYgDLb1jfGm4XkdLBvrvQatPSDB40CUJFG
         6Gz4vpK8mFUZY6y2Kd0aEmqODot5YL8kOJBZj//ggAvYzN6mdWsVOlVSW+8jZvJYMedk
         e6JdJV6hOXdwHR8PZdrosr/CzIyL62UGpV0jxfmxrjWvxXZDA3h0r1JwykmHfE9f46cR
         1/licXWeOY9bUgx1pfvsCgNPAyaMTblGL3B4IDUw0AgY4nH7KTTed1Bfe5uCPLIPTrRK
         U6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893570; x=1751498370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NY4/VNSyW9YlnxXNwTl0Byyb+JX9t6CMuRa83xOM3rg=;
        b=o2YiWSlO2oF4QVwTJRFXP6myVMRbHEFLr/qEPC/YBQRheQCrRbZVrXBszYXOLVVVaJ
         GuR2VRcuAV776Hm8FCZ3KI4BZOUrpgrZeWJjbVVK2zzsu/0GO3ezjpwmXHdxAEiFIIOo
         vBVtZSGbyrWVJl3fSAbo0BJN1Cvr9YxCb2VH2z7MCJ1450kwbKp/KdZn9hWV8c5q24cN
         qcnDf8yCdR9LREaV6GsA4cbmRlLvjsNDbRVH1g2bTgEqxAm0JBIkYerOHQUrFsr54PpM
         hP9gQfQ+xa/zPOgsJFs2NNn89t4dnRLClgMUuiKXtRWd6LL+CrVbKuR28+ZVyYqlE9CB
         3GqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxyviCU0/XLLIfiiRmGE6W87MrAks0myw3T4+RpQgUQpjwp9upI52I0Ey/gSglUY65PrQf+hum0IxQMLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfweOohf3axXpaeO6jD08Ss1BTLSLJmduUxNuIAhhSM7r35w1q
	47RKeC0G+GyNIM4MBg1JdH002COqs2x/KHM9ynL9lgZiPelxQGQjE9MBicOkOvfMNyA=
X-Gm-Gg: ASbGnctxpMGCs8g4y47GBZapEjwLv+mm9EWd/8s2x6q9NnQSXHRiQBSm3NBZL6RGu9U
	/Ao4vkifIl4tkhLwFDh3ZenOJ4kHpUezYnnzh9Oxq5o8//eAEyGJM+dxw5sYgKooxWr8jMQ6OAG
	gvaQVJKx61bqQr7q+vj+V6PEyv0AzISp+kYx/jsF0h13m07LaKXlIS4o7+1OpMyF32YF1fPsO5/
	veKEfqqnJ73h8LZ855A1rUpb7QCM7ehQUoW6ZApHhIZmmvdzbL0o5hR2oIo4EiIh78OcuOLjDKA
	lFKqcnUMyaOwg6dG+BSswwhghzZwgSFHoUIiJPLmB9TtBbiTk0zUvX5xJSQv21wuCqBtgNhbXAM
	+/HdzumXIXahIqXYqDCWVX+wnw6H48GF/jShUP61Paa7tbNHJ2opN
X-Google-Smtp-Source: AGHT+IGdHj0p3bmRxWLsDFiXYVaVe2cuSu6WHMbrQ2HB2wcjVrL2gKyMQpNe1r2lroh5MvOICjseMg==
X-Received: by 2002:a05:6902:907:b0:e7d:ce24:636e with SMTP id 3f1490d57ef6-e860176598bmr6101524276.31.1750893570357;
        Wed, 25 Jun 2025 16:19:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:29 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 27/32] mm: shmem: export some functions to internal.h
Date: Wed, 25 Jun 2025 23:18:14 +0000
Message-ID: <20250625231838.1897085-28-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

shmem_inode_acct_blocks(), shmem_recalc_inode(), and
shmem_add_to_page_cache() are used by shmem_alloc_and_add_folio(). This
functionality will also be used in the future by Live Update
Orchestrator (LUO) to recreate memfd files after a live update.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/internal.h |  6 ++++++
 mm/shmem.c    | 10 +++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 6b8ed2017743..991917a8ae23 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1535,6 +1535,12 @@ void __meminit __init_page_from_nid(unsigned long pfn, int nid);
 unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 			  int priority);
 
+int shmem_add_to_page_cache(struct folio *folio,
+			    struct address_space *mapping,
+			    pgoff_t index, void *expected, gfp_t gfp);
+int shmem_inode_acct_blocks(struct inode *inode, long pages);
+void shmem_recalc_inode(struct inode *inode, long alloced, long swapped);
+
 #ifdef CONFIG_SHRINKER_DEBUG
 static inline __printf(2, 0) int shrinker_debugfs_name_alloc(
 			struct shrinker *shrinker, const char *fmt, va_list ap)
diff --git a/mm/shmem.c b/mm/shmem.c
index bd54300be9df..5fd0fb214a78 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -219,7 +219,7 @@ static inline void shmem_unacct_blocks(unsigned long flags, long pages)
 		vm_unacct_memory(pages * VM_ACCT(PAGE_SIZE));
 }
 
-static int shmem_inode_acct_blocks(struct inode *inode, long pages)
+int shmem_inode_acct_blocks(struct inode *inode, long pages)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
@@ -433,7 +433,7 @@ static void shmem_free_inode(struct super_block *sb, size_t freed_ispace)
  * But normally   info->alloced == inode->i_mapping->nrpages + info->swapped
  * So mm freed is info->alloced - (inode->i_mapping->nrpages + info->swapped)
  */
-static void shmem_recalc_inode(struct inode *inode, long alloced, long swapped)
+void shmem_recalc_inode(struct inode *inode, long alloced, long swapped)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	long freed;
@@ -879,9 +879,9 @@ static void shmem_update_stats(struct folio *folio, int nr_pages)
 /*
  * Somewhat like filemap_add_folio, but error if expected item has gone.
  */
-static int shmem_add_to_page_cache(struct folio *folio,
-				   struct address_space *mapping,
-				   pgoff_t index, void *expected, gfp_t gfp)
+int shmem_add_to_page_cache(struct folio *folio,
+			    struct address_space *mapping,
+			    pgoff_t index, void *expected, gfp_t gfp)
 {
 	XA_STATE_ORDER(xas, &mapping->i_pages, index, folio_order(folio));
 	long nr = folio_nr_pages(folio);
-- 
2.50.0.727.gbf7dc18ff4-goog

