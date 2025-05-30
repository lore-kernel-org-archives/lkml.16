Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB551DF72C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595879; cv=none; b=pqYZSe1jrTiefpC0Py8dW2pdzPz0lg6pIr1pgvrsdpkUZCsRPUzugtDuDkg9XEaK6mMRb/ZXSno26Ak3VSyNOYBQygStGd9+7J/boOcWVRz+/FGDlTO0cRpOD5nqIPL92MMCLwhfyrUTKEJNyxaOgSwLVf1spcWp9RH9iBP5tR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595879; c=relaxed/simple;
	bh=lisLegOy+6lXxdxDg5/m1b7CL468MwUWemew7FNpzIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WtQyhlUBkuVXXdn3PINgkbelfkQp5gAKJnAqWN+l/N5oTPCPC7ty/a/eTc6T72Cyj2j1iRNV3qap0TspvxWRD//jUv2MTCjkSC5lAZ/Um6xZI7Du6JFvhjYWv0io07gt/ZspoqUrBHvocUxUszD9AGx9kBJFwS7f3olqIdcfozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 919E116F8;
	Fri, 30 May 2025 02:04:20 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3C603F5A1;
	Fri, 30 May 2025 02:04:31 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 1/3] mm: Allow pagewalk without locks
Date: Fri, 30 May 2025 14:34:05 +0530
Message-Id: <20250530090407.19237-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250530090407.19237-1-dev.jain@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
This being a non-sleepable context, we cannot take the init_mm mmap lock.
Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
locks.

[1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/pagewalk.h |  2 ++
 mm/pagewalk.c            | 12 ++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 9700a29f8afb..9bc8853ed3de 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -14,6 +14,8 @@ enum page_walk_lock {
 	PGWALK_WRLOCK = 1,
 	/* vma is expected to be already write-locked during the walk */
 	PGWALK_WRLOCK_VERIFY = 2,
+	/* no lock is needed */
+	PGWALK_NOLOCK = 3,
 };
 
 /**
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index e478777c86e1..9657cf4664b2 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -440,6 +440,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
 	case PGWALK_RDLOCK:
 		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
 		break;
+	default:
+		break;
 	}
 #endif
 }
@@ -640,10 +642,12 @@ int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
 	 * specified address range from being freed. The caller should take
 	 * other actions to prevent this race.
 	 */
-	if (mm == &init_mm)
-		mmap_assert_locked(walk.mm);
-	else
-		mmap_assert_write_locked(walk.mm);
+	if (ops->walk_lock != PGWALK_NOLOCK) {
+		if (mm == &init_mm)
+			mmap_assert_locked(walk.mm);
+		else
+			mmap_assert_write_locked(walk.mm);
+	}
 
 	return walk_pgd_range(start, end, &walk);
 }
-- 
2.30.2

