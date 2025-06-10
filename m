Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9325F7B2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749535174; cv=none; b=nOH1LAAQDq9mCFKzT6mt5gwFHhUuAMenNNeMrxU5dznZB3ZrdSBdoWdpsCkMhpAFKIG4U7lQBQs6mcqImp0jnN9uWQvuHwaKG5y7lX+lpgbITc8jY7J1ACOE/WzJ/kfHnrVozWRN4iTenQmSPOLrFWEHmk87JnCV9i+T6VmG0Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749535174; c=relaxed/simple;
	bh=tBeO556y82ud3EBcMDK6ZJNN5GK1Ey0BbUH6DULTNpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fDq3ce7MlYlW+WOrpKwJF+hS+adkkpvhRilEcXFOo7YMJeKRNuMf+/mKHDBBb0hE7q8cSuBSYmRnwkMrlDrm+MeqIQZCyW1kLkovrYUK42VjuyBiaka4w9p0eQtN5sYMDGq+NIcV/KkVkC9caiQd7sQV1mVFOa0E/9QQkSEwTKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8gkgUYu; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8gkgUYu"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3780705b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 22:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749535172; x=1750139972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMGllP0kHtqQgBWxobNAgqAN07VXjKAKrzg9IPnrFtA=;
        b=B8gkgUYu6FBcf0Yv9wumFVPDk9rYK65TUrJAlukfG7tKRZw+iiRP2ekbovWx7Ea78M
         aKSCTB3AaPY9WZX7gk8BAJoaNpUEJZ9nGB6N6pZHPeofNxD0KjaQ8OFzcosAmv/i/euD
         67u/GlHQT6wFSWt5LyEKS9NdncfjifJBPoRWzY+BwQQE6MjEtwFUrXdbn7ULeTZ2RA8Z
         PCqPCtBBb8gMVOJ3eAwAo3QFFKO3nXdLwrVwPzkFuYFR0KC1ll60Q6+KOYj17OpL2GQv
         6xgiYrU3PilguxvUohi1b7sW1L85Pblzc21B5XYhNTZD5WXmoX4ItWrZuEusFja5scON
         rwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749535172; x=1750139972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMGllP0kHtqQgBWxobNAgqAN07VXjKAKrzg9IPnrFtA=;
        b=QxZR8LRa/ogZ2JVtHihMVhVMqxVnF1M+gKcbyTPfbWdVPeshLZ5vI8YSsvmoEKvEwq
         v2yUn/MakxvC5/ZW7HeYT8aOQDdXPcwM4fZ7eHqaEzei/rrvKdakt3U/mlR+b9O3F7qE
         MKY59up06CaR4zjAf4D/VlKtwybzTAToCgXx/rxPWOuRpMM7cMfKA45Az0h13BnAxu3p
         ni0M7p1pDsPefIpvm41woQ+7zFrNzPVWAUK5eLiAiWya2C/+Eh92rhm4r6D1KWMPshxi
         u+2LmI5vrG+dAuNeGVTAezwKPCK5f021S4WMRs5AYXPLn+9FEdjrT6XfZI8Cadv4jhkM
         1NoA==
X-Gm-Message-State: AOJu0YwXhsCyXNWrSuLV4k3GA0lkhqCxBBx1FJB57zat4sjWGPBr2f48
	xMw1KFf4oNfOhs947u9P0E+VhUwm5Jgvk5e0MsfMbxDG61ixXPJQlTeZ
X-Gm-Gg: ASbGncsNCg4NOa42VnsyGyQNuJUrrN9mCdMK0Q/0Xq1n5n4sMGv+de6Y8X73OmIhPrS
	940gqfLDRX2jbGsZVihQuPo6QXca1kizovat9KzQCYN1IrzEfDpcWVoAtqdM/B8r2sG7RBfNomV
	VylzUKWzM06sWv6fgCPL0Q//FaHmfo2dtP0+vl2TjuhCfifs1T5T7Vy/cKGPXKJjWtqkfXa6hHJ
	dnwfqdOZDDykAerksk+Wdg3vxf+FTH0fH71mUJBAixIaX5OMoBNZVQp4YXYu9OFqzZEeqT6ZA/w
	VVsSermxl1mcJ+tpr5qAX1CD5sUEfVKpgzVKlE2SRXxvmVFaOjh6hH1o4iPCk4j7vyMVVyzZTW+
	07nGEfum58wE26Eo=
X-Google-Smtp-Source: AGHT+IEAcEs3T8PPYHuPGihjJG7CmDR9TSUX/bdswV8JxA1i4kvPMQcC7N7Q+Baxtj7fUMX8e+g4oQ==
X-Received: by 2002:a05:6a00:4607:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-74827f33090mr20226636b3a.23.1749535171847;
        Mon, 09 Jun 2025 22:59:31 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b4b9sm6708007b3a.71.2025.06.09.22.59.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Jun 2025 22:59:30 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH RFC] mm: madvise: use per_vma lock for MADV_FREE
Date: Tue, 10 Jun 2025 17:59:20 +1200
Message-Id: <20250610055920.21323-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

MADV_FREE is another option, besides MADV_DONTNEED, for dynamic memory
freeing in user-space native or Java heap memory management. For example,
jemalloc can be configured to use MADV_FREE, and recent versions of the
Android Java heap have also increasingly adopted MADV_FREE. Supporting
per-VMA locking for MADV_FREE thus appears increasingly necessary.

We have replaced walk_page_range() with walk_page_range_vma(). Along with
the proposed madvise_lock_mode by Lorenzo, the necessary infrastructure is
now in place to begin exploring per-VMA locking support for MADV_FREE and
potentially other madvise using walk_page_range_vma().

This patch adds support for the PGWALK_VMA_RDLOCK walk_lock mode in
walk_page_range_vma(), and leverages madvise_lock_mode from
madv_behavior to select the appropriate walk_lock—either mmap_lock or
per-VMA lock—based on the context.

To ensure thread safety, madvise_free_walk_ops is now defined as a stack
variable instead of a global constant.

Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 include/linux/pagewalk.h |  2 ++
 mm/madvise.c             | 20 ++++++++++++++------
 mm/pagewalk.c            |  6 ++++++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 9700a29f8afb..a4afa64ef0ab 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -14,6 +14,8 @@ enum page_walk_lock {
 	PGWALK_WRLOCK = 1,
 	/* vma is expected to be already write-locked during the walk */
 	PGWALK_WRLOCK_VERIFY = 2,
+	/* vma is expected to be already read-locked during the walk */
+	PGWALK_VMA_RDLOCK_VERIFY = 3,
 };
 
 /**
diff --git a/mm/madvise.c b/mm/madvise.c
index 381eedde8f6d..23d58eb31c8f 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -775,10 +775,14 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 	return 0;
 }
 
-static const struct mm_walk_ops madvise_free_walk_ops = {
-	.pmd_entry		= madvise_free_pte_range,
-	.walk_lock		= PGWALK_RDLOCK,
-};
+static inline enum page_walk_lock get_walk_lock(enum madvise_lock_mode mode)
+{
+	/* Other modes don't require fixing up the walk_lock. */
+	VM_WARN_ON_ONCE(mode != MADVISE_VMA_READ_LOCK &&
+			mode != MADVISE_MMAP_READ_LOCK);
+	return mode == MADVISE_VMA_READ_LOCK ?
+			PGWALK_VMA_RDLOCK_VERIFY : PGWALK_RDLOCK;
+}
 
 static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
 			struct vm_area_struct *vma,
@@ -787,6 +791,9 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
 	struct mm_struct *mm = vma->vm_mm;
 	struct mmu_notifier_range range;
 	struct mmu_gather *tlb = madv_behavior->tlb;
+	struct mm_walk_ops walk_ops = {
+		.pmd_entry		= madvise_free_pte_range,
+	};
 
 	/* MADV_FREE works for only anon vma at the moment */
 	if (!vma_is_anonymous(vma))
@@ -806,8 +813,9 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
 
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_start_vma(tlb, vma);
+	walk_ops.walk_lock = get_walk_lock(madv_behavior->lock_mode);
 	walk_page_range_vma(vma, range.start, range.end,
-			&madvise_free_walk_ops, tlb);
+			&walk_ops, tlb);
 	tlb_end_vma(tlb, vma);
 	mmu_notifier_invalidate_range_end(&range);
 	return 0;
@@ -1653,7 +1661,6 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
 	case MADV_WILLNEED:
 	case MADV_COLD:
 	case MADV_PAGEOUT:
-	case MADV_FREE:
 	case MADV_POPULATE_READ:
 	case MADV_POPULATE_WRITE:
 	case MADV_COLLAPSE:
@@ -1662,6 +1669,7 @@ static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavi
 		return MADVISE_MMAP_READ_LOCK;
 	case MADV_DONTNEED:
 	case MADV_DONTNEED_LOCKED:
+	case MADV_FREE:
 		return MADVISE_VMA_READ_LOCK;
 	default:
 		return MADVISE_MMAP_WRITE_LOCK;
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index e478777c86e1..c984aacc5552 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -420,6 +420,9 @@ static int __walk_page_range(unsigned long start, unsigned long end,
 static inline void process_mm_walk_lock(struct mm_struct *mm,
 					enum page_walk_lock walk_lock)
 {
+	if (walk_lock == PGWALK_VMA_RDLOCK_VERIFY)
+		return;
+
 	if (walk_lock == PGWALK_RDLOCK)
 		mmap_assert_locked(mm);
 	else
@@ -437,6 +440,9 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
 	case PGWALK_WRLOCK_VERIFY:
 		vma_assert_write_locked(vma);
 		break;
+	case PGWALK_VMA_RDLOCK_VERIFY:
+		vma_assert_locked(vma);
+		break;
 	case PGWALK_RDLOCK:
 		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
 		break;
-- 
2.39.3 (Apple Git-146)

