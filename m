Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98850236429
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749579416; cv=none; b=OnTca/4mxEz3/Sp31GpL95LizjrZeGnQhXVyj7C+vst+MQU5MkW+Tp3NBhVk35OMEamZttLJXfbQBAcJVZc94uNkpzLLtnIbkAz1rCIeKloEOtVd9AEMa6mvencKMzZVex3aSPne+p/Nt2MqsiiYf/i+GpGsqve2VoLf6h95ENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749579416; c=relaxed/simple;
	bh=QyksRAC+GP5Nw9IMTue9HAksp35Uzu5WlRtEeJZMqJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rBrsOhHmPGNShkzSp9mWbNZCNAL6BuPrMOgOFigbtOIPc01h6EoQTQ9Kf+9kYZOeRJvTACSOisA3Y7Uhr2zePnQyy9+ZtvA+o82V1gX68QXM1SZUmcQF2Asegv9dw9kOnOFryu5W5uez/22Mt5wIbOLqYMtZN/zhGaVU0c4NO70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXEeS/ZK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXEeS/ZK"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso4337715b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749579414; x=1750184214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DduieBxwKYFUWaIYXduFYzsh5Cay+ey5g9zc90whlU4=;
        b=cXEeS/ZKMww5EOMTklFvT7odO7P2bhnQsm/wa0ZYxRcFd5OU7qLXNzcw1zqH+cGv+8
         S5GFE6oLTjcfNdFZ3ZOW95vzbQW2ie9Kh2bdiEFGJE2RQbQRd0C9H7BOmy5l4EhHfTq9
         PhOiJBU8SkxPayJs03G5Ijj0ZdOnur2sWEEixyiy1GCp4Ow5Obs1B+7M7aP9P1JF4lmu
         Vx17a+83q2fYXtrQw3Q3fnd0iFNKCXkGd1RtbPxzhrTAhyY0LrqdvVvP8sHUsPCAMHvm
         vpBK1b7dLwLdMSkqNlrc70du7yd0X7LoB7PxNeynoIFOr+IKpoJp/eWZ6hPh1hvqwput
         9pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749579414; x=1750184214;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DduieBxwKYFUWaIYXduFYzsh5Cay+ey5g9zc90whlU4=;
        b=oI4tTPbKRVZEsMZdbToe6vIorSOTRSFLqxza++QRtK1DlLrENGipVxerTkj3RxArUE
         pIZXNomcTNY23q+NHmnfYK1pVNs/BAPVQ2bJ58QnJuBxIs92ihVWh6kbGWiZ8rs2ytKa
         IYQSW9UBIUIDRK9AphVLz6P73/bsNxwU/4s3u2bhHPXEohN+L1P3lpch84EzWk4XXLpt
         panOnagMWCmjFKIanCDq09/mPBBm78sO4B7XJi7MC5uvlylAFMcYLWg9nXBJ+nSn1PT9
         UXcQ8Zj486iMawDXTkz1YzESkeqJHz5kmqah0FLCk2iyzitVRI49tM8usmnJKnUhAi7M
         xSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGVs3cwjYVbaoWnL/L6xkR5DJuFt5/LA/3MdUiKkQKDG/lWkGm/2m1sSiy9mxp55DabLKIum3p+/oQqUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy40rK4C9s2pIKZx+54A6YqHxkPED7T3u4fJb1sDdrhoOUkqhDJ
	VF0gCtFzkQNd9oXCJBR2Sm6v8+Y9NyzghHuJgUrKmG884QkHE0V0VZn1
X-Gm-Gg: ASbGncsdP/+Q8PMHXwbO6ZIfM7eHactzR4ChsaoDoiWROKNpCHMUyymY+A/f0IhGoek
	7oTnX1QHyGSyyuDg8RS1joLhqGzXZyiAzPqsMqqQBvLC9PagR+og2nY9FUGr+bYnZKcFbKHo6I0
	I9rnUxodhXGVZ/hKzFO4JqryaZ3oiTXYpz+3QPsA/u3sN0xcoWFYuA+m5ZdHA4Wes6DS88sQjuL
	zTBE1XwNGt67R+vcXGGE4lEsnqyR0SwTahDE1FpaUPj/MEPg6V/34qvCrA2gDD54+m084LLzLSb
	vGq6+lWKGWFobZpG7arksSkqdtLXRbZGXaCRuC41ib4V3vlAUc0EI5gOS3sSnjjNyq9ZcDlxItX
	I4avbxcg=
X-Google-Smtp-Source: AGHT+IFRb5pPmXpQFPdoAC7qoXDoCFxLUXqFm0RRzubQmJUoqejBxmqSt7jX4eHk0+tpsHj5WvN8Zw==
X-Received: by 2002:a05:6a20:918b:b0:1ee:dcd3:80d7 with SMTP id adf61e73a8af0-21f863a0fd3mr859577637.0.1749579413830;
        Tue, 10 Jun 2025 11:16:53 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c0138sm7705822b3a.110.2025.06.10.11.16.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jun 2025 11:16:53 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Usama Arif <usamaarif642@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3] mm/shmem, swap: fix softlockup with mTHP swapin
Date: Wed, 11 Jun 2025 02:16:45 +0800
Message-ID: <20250610181645.45922-1-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Following softlockup can be easily reproduced on my test machine with:

echo always > /sys/kernel/mm/transparent_hugepage/hugepages-64kB/enabled
swapon /dev/zram0 # zram0 is a 48G swap device
mkdir -p /sys/fs/cgroup/memory/test
echo 1G > /sys/fs/cgroup/test/memory.max
echo $BASHPID > /sys/fs/cgroup/test/cgroup.procs
while true; do
    dd if=/dev/zero of=/tmp/test.img bs=1M count=5120
    cat /tmp/test.img > /dev/null
    rm /tmp/test.img
done

Then after a while:
watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
Modules linked in: zram virtiofs
CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G             L      6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)·
Tainted: [L]=SOFTLOCKUP
Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f 48 85 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f03f98f1000 CR3: 0000000144626004 CR4: 0000000000770eb0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <TASK>
 shmem_alloc_folio+0x31/0xc0
 shmem_swapin_folio+0x309/0xcf0
 ? filemap_get_entry+0x117/0x1e0
 ? xas_load+0xd/0xb0
 ? filemap_get_entry+0x101/0x1e0
 shmem_get_folio_gfp+0x2ed/0x5b0
 shmem_file_read_iter+0x7f/0x2e0
 vfs_read+0x252/0x330
 ksys_read+0x68/0xf0
 do_syscall_64+0x4c/0x1c0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7f03f9a46991
Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e8 20 ad 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
 </TASK>

The reason is simple, readahead brought some order 0 folio in swap cache,
and the swapin mTHP folio being allocated is in confict with it, so
swapcache_prepare fails and causes shmem_swap_alloc_folio to return
-EEXIST, and shmem simply retries again and again causing this loop.

Fix it by applying a similar fix for anon mTHP swapin.

The performance change is very slight, time of swapin 10g zero folios
with shmem (test for 12 times):
Before:  2.47s
After:   2.48s

Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchronous swap device")
Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Acked-by: Nhat Pham <nphamcs@gmail.com>

---

V1: https://lore.kernel.org/linux-mm/20250608192713.95875-1-ryncsn@gmail.com/
Updates:
- Move non_swapcache_batch check before swapcache_prepare, I was
  expecting this could improve the performance, turns out it barely
  helps and may even cause more overhead in some cases. [ Barry Song ]
- Remove zero map check, no need to do that for shmem [ Barry Song,
  Baolin Wang ]
- Fix build bot error.

V2: https://lore.kernel.org/linux-mm/20250609171751.36305-1-ryncsn@gmail.com/
Updates:
- Minor comment adjustment [ Nhat Pham ]

 mm/memory.c | 20 --------------------
 mm/shmem.c  |  6 +++++-
 mm/swap.h   | 23 +++++++++++++++++++++++
 3 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8eba595056fe..b0cda5aab398 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4315,26 +4315,6 @@ static struct folio *__alloc_swap_folio(struct vm_fault *vmf)
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
-{
-	struct swap_info_struct *si = swp_swap_info(entry);
-	pgoff_t offset = swp_offset(entry);
-	int i;
-
-	/*
-	 * While allocating a large folio and doing swap_read_folio, which is
-	 * the case the being faulted pte doesn't have swapcache. We need to
-	 * ensure all PTEs have no cache as well, otherwise, we might go to
-	 * swap devices while the content is in swapcache.
-	 */
-	for (i = 0; i < max_nr; i++) {
-		if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
-			return i;
-	}
-
-	return i;
-}
-
 /*
  * Check if the PTEs within a range are contiguous swap entries
  * and have consistent swapcache, zeromap.
diff --git a/mm/shmem.c b/mm/shmem.c
index 0c5fb4ffa03a..3a5a65b1f41a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2259,6 +2259,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	order = xa_get_order(&mapping->i_pages, index);
 	if (!folio) {
+		int nr_pages = 1 << order;
 		bool fallback_order0 = false;
 
 		/* Or update major stats only when swapin succeeds?? */
@@ -2272,9 +2273,12 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		 * If uffd is active for the vma, we need per-page fault
 		 * fidelity to maintain the uffd semantics, then fallback
 		 * to swapin order-0 folio, as well as for zswap case.
+		 * Any existing sub folio in the swap cache also blocks
+		 * mTHP swapin.
 		 */
 		if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma))) ||
-				  !zswap_never_enabled()))
+				  !zswap_never_enabled() ||
+				  non_swapcache_batch(swap, nr_pages) != nr_pages))
 			fallback_order0 = true;
 
 		/* Skip swapcache for synchronous device. */
diff --git a/mm/swap.h b/mm/swap.h
index 2269eb9df0af..9096082a915e 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -106,6 +106,25 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
 		return find_next_bit(sis->zeromap, end, start) - start;
 }
 
+static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
+{
+	struct swap_info_struct *si = swp_swap_info(entry);
+	pgoff_t offset = swp_offset(entry);
+	int i;
+
+	/*
+	 * While allocating a large folio and doing mTHP swapin, we need to
+	 * ensure all entries are not cached, otherwise, the mTHP folio will
+	 * be in conflict with the folio in swap cache.
+	 */
+	for (i = 0; i < max_nr; i++) {
+		if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
+			return i;
+	}
+
+	return i;
+}
+
 #else /* CONFIG_SWAP */
 struct swap_iocb;
 static inline void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
@@ -199,6 +218,10 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
 	return 0;
 }
 
+static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
+{
+	return 0;
+}
 #endif /* CONFIG_SWAP */
 
 /**
-- 
2.49.0

