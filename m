Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11208136347
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748320922; cv=none; b=bwr7Wg97h17Y8b/ONOKf3BRuoNol6J5a3krFRL2TafVS+FHBEe0ZoyMAgOnCuFdQqiE6eiZ40zaXikwzA3/cvm8Rw/r16WByP3XuZPJn/yHgpofNID0ZUS5B1l9zdUhfVYLWbBLGfM9LoA9Us35hZImWkqJEcgR1nFgaUxPu1P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748320922; c=relaxed/simple;
	bh=kGt06zomdqqK5S1a91V1cT1ydjwhTf5qetKiVc1iBew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rUBQbD5wj8DnZiy32xGAMEQZz5AEERzEKicSadlfpgENKMr1Q1v53XV3hXpU2uat/3mhTXJsMtdolP35sZi0uAze8NwRzewkrexGElwS9+Exw3Pvl+kA+/ZtaEKAYiNxTt268zDi5Cxx90vmXb/uF0ERv6Yb9rm/Fi1EkBIAbW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+ZTJPKO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+ZTJPKO"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234593b0613so14643805ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 21:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748320920; x=1748925720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBD30Q/JjAMR8KKPVHJYGARQR1sJnroWjbTCKT2rt1w=;
        b=a+ZTJPKOlrtNlPQzdsjOx6lfiyDdBG/7Qn8fLG/6VWWedSN3WePoQITioZfK8I1Z50
         WHWMQNhzxE+3QS/gK2axxgHX7IvFNSQj078EQmMn36GjybE85gN6YueVYJJyQgIHq/6B
         S4XP3EtNyergL7cnw0B/7Po+sHy8TDH1sWGrHkFhs0FqN9NBE1N88x6G5+lparaN1sS8
         iopc/37m+MP0sVjXA5h+DeWtUyhZBrwoA8yBR5mp9wv/b6Mpj6O3clqq2eq4YenBpCvI
         xOOxIopF1CV7CIHrj1g1JGwt/HqjjTXGq39XNWG3Nk9gX5ALOvNRub1diJORpS/WhP/E
         MjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748320920; x=1748925720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBD30Q/JjAMR8KKPVHJYGARQR1sJnroWjbTCKT2rt1w=;
        b=a/bdzb0lffDNazc+JavMN8xd0TCzavwdPFTSow/RBPPAdTz7tdNgSMQI2CiEVdjcUc
         eOil4Zzh5wV7GpZi6dpTzBwxLFndYfDZfUwY1wnMmrR8uMnIolb/LiG8Z//oZSeR6foG
         8x+XFAyXkCPg05kvhot6DVQZ/DOL0nFVrvZ5W5yKTvISq/VYPYiFazWYBDvkVRxpvB1O
         O3BmSnr4H4eyYeKMKB2qjgHLgEjYMwCv6dZTLLl9wN+kS2Or8bkiVuz3k3EAkyxxAUmv
         yAd77UW3Bl70wPDxZtb5jDEf6XgWTXkq2+qGDMBOWAmIg8wGIUsYpe5uZ9C66khUMXhU
         1XPA==
X-Gm-Message-State: AOJu0YykwsEp67cxlfEAh3XGbwM9YlfDPmEJFbttvVi/PNPWzEM67/KF
	pSCszSglAiTwam/Ondk3EDewCZgi+ClbmBCj1q+hnZayIM48W3V+p7CFLEeIPQ==
X-Gm-Gg: ASbGncveWC8B3ya87P9UxBYpl1s1MTHN+x+lMDV3VI/hI+dKHCXLiXqmUZ8ClfXV57w
	GGhl8nCpM4ifgQ5208s1z8dPzwOkAtqkQhuhXumHNA6jvWWUY7m62f4EDGnrYzxcfjaNWuYUukG
	7CrIqOXJ+7YiWmYOV1hLD63eqnNHijfM3Ak/QjCBrORmVfS+dxK4QLJweGjrRsqSRSM6Gie7wxp
	1Lp+xwDdkTC4V5rt6vj130t0eJalY0GFvw9ars6rcBE8HKED3k3HbqQTp3XT3M6e5I58q+VFsOe
	gW4HZO9/5wgXzqMJMtD05ZUiCQzkqBDrSvI8/YfibFwj49AgGEOILeW8K4MwqMVI0Rfm
X-Google-Smtp-Source: AGHT+IE5YXFNlnd4ARuct0pbKVfz2NokbalEcri/Tip5cXml99M51xAmj2w4aUX6A6oLslapmD3TAQ==
X-Received: by 2002:a17:902:fc50:b0:234:6d06:b3eb with SMTP id d9443c01a7336-2346d06b6cbmr85838185ad.41.1748320920156;
        Mon, 26 May 2025 21:42:00 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97886sm176247835ad.146.2025.05.26.21.41.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 21:41:59 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH RFC] mm: use per_vma lock for MADV_DONTNEED
Date: Tue, 27 May 2025 16:41:45 +1200
Message-Id: <20250527044145.13153-1-21cnbao@gmail.com>
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

Certain madvise operations, especially MADV_DONTNEED, occur far more
frequently than other madvise options, particularly in native and Java
heaps for dynamic memory management.

Currently, the mmap_lock is always held during these operations, even when
unnecessary. This causes lock contention and can lead to severe priority
inversion, where low-priority threads—such as Android's HeapTaskDaemon—
hold the lock and block higher-priority threads.

This patch enables the use of per-VMA locks when the advised range lies
entirely within a single VMA, avoiding the need for full VMA traversal. In
practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.

Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
benefits from this per-VMA lock optimization. After extended runtime,
217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
only 1,231 fell back to mmap_lock.

To simplify handling, the implementation falls back to the standard
mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
userfaultfd_remove().

Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/madvise.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index 8433ac9b27e0..da016a1d0434 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1817,6 +1817,39 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 
 	if (madvise_should_skip(start, len_in, behavior, &error))
 		return error;
+
+	/*
+	 * MADV_DONTNEED is commonly used with userspace heaps and most often
+	 * affects a single VMA. In these cases, we can use per-VMA locks to
+	 * reduce contention on the mmap_lock.
+	 */
+	if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED) {
+		struct vm_area_struct *prev, *vma;
+		unsigned long untagged_start, end;
+
+		untagged_start = untagged_addr(start);
+		end = untagged_start + len_in;
+		vma = lock_vma_under_rcu(mm, untagged_start);
+		if (!vma)
+			goto lock;
+		if (end > vma->vm_end || userfaultfd_armed(vma)) {
+			vma_end_read(vma);
+			goto lock;
+		}
+		if (unlikely(!can_modify_vma_madv(vma, behavior))) {
+			error = -EPERM;
+			vma_end_read(vma);
+			goto out;
+		}
+		madvise_init_tlb(&madv_behavior, mm);
+		error = madvise_dontneed_free(vma, &prev, untagged_start,
+				end, &madv_behavior);
+		madvise_finish_tlb(&madv_behavior);
+		vma_end_read(vma);
+		goto out;
+	}
+
+lock:
 	error = madvise_lock(mm, behavior);
 	if (error)
 		return error;
@@ -1825,6 +1858,7 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 	madvise_finish_tlb(&madv_behavior);
 	madvise_unlock(mm, behavior);
 
+out:
 	return error;
 }
 
-- 
2.39.3 (Apple Git-146)

