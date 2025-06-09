Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91328F1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749489486; cv=none; b=L5jzpBv/7xLfBi7fjfSClVgo+m5qyWfgDiFA9qR+AgFBLWxE+XYfCP6BlDKmy1JoCq6CsTcksOtObw2QHzXAlmDyqvaiiQ4eoS1Zfpo15DVSR4RUqxZnwPeMOsO4B1WAVHu0J4pkrjunZh+yQEND7RdmjBz8uxesbHGjXWMSjtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749489486; c=relaxed/simple;
	bh=s6NOV/mhpV2LMJfm5N2WTi3a4AVJpusZgJsdYvuDioE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pRMREki2/oeb7QE60m0BkGypFg2Jc3bhYuBMFx+GoCQR+6W1glpXJDdCh7AKfaYo/etAVajJ1KH+yXJent3Ft2F9im+us9OgLxYJunSdVZz45vuLgQ79CvpaCN52J0bU5T4CwVm6gb3DOjkiDIXEiu72kpqquAuC5bk/2A290hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOA2tUbb; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOA2tUbb"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d0a47f6692so472427885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749489484; x=1750094284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TuBH0kW1mGv5AvaA37P6jbIihS1u1hg1W3AQWK2Hcgg=;
        b=BOA2tUbb+Y57Z8vHtH7oB4j03GZa/hi0Je2KxDUOxpo6DmeO86uHrRsA1mQ3QF8vHO
         pPAMHeoWstMfGyYIIn1KRqbdmgGbBVYwam13zcR1Nm8nHPtFyYzw+wHtQ9zbtSfCnZBz
         rAq2pUo0ns9NrRbG/wCwj0hQxiUrP1rA5hkfKR8wW1z8OXU8ZXM+5BmyLktqFuKVwWA7
         JPLYZQxW7u71VScuQ9uhIXVmhXH3w9VgRJPqsCvpNrSsvEE9KCaneM9Jf6+GSlN0y98U
         svEtuYn3fpxn5sR5UP5KAwKaTPE2FUBv6ONMqhxCFHsD3p9Bat7LavyYvsNjvoXTakry
         lM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749489484; x=1750094284;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuBH0kW1mGv5AvaA37P6jbIihS1u1hg1W3AQWK2Hcgg=;
        b=VWtcGORFai7Eqo0cD7plqF6ur3Y5wZ0HJ6dz1WQrBlUwtBgAhj5x0WsgWzv6SXeuHI
         8SnNVDHaBc4kFzhU6JaSR3lZPYPxa7jRGKqhRhPPcnAEsRb2naBD5cQbih317pGpUTrb
         RvLVI0Frq3aYAJP2itPPKYs8ixEDwMj49v/u134+FzwEdPvtwEz2w/UT2S+SnzFh7/Kb
         bN/HI7FTu42P/QXfK/HkvB+ZPDYGy3WiuugPax2afYAdplt4KoFWNGRyGKDXxvFPz17H
         aN+w4aihUqMDxn1igD/Q1rfZJmlSVpyGAEQJzyXHD+I22w7QWAo7bGdfILXvsj15dNBb
         sx0A==
X-Forwarded-Encrypted: i=1; AJvYcCVS6yVbfQySpMsIo0kQGxSF7o0ky0IETyPfP+CVX4mKogHhzk9VDOu/Ljk7+I/cKrAcOW+NTBaA50Y8qjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7YbxuxxqeMAEdvaC01wZIUDvEPHNgXb7JXJu+nvZ6nyQuVCw
	Aspj4kQBnavxCrG/tHXfGjwq1oZEbQTgWWYGQhvHhoiqBym3LhmsPowV
X-Gm-Gg: ASbGncufDBqBTR3NL6uS7MTX2kwXRULnHp0mf5u47NfmYDJqKUTlO55Y8x+32snF0zO
	BJIjb9af0Wu3Vh7shQrO0qyN92JG/K+PBztqxwDVeXo9dG1DOlh8aw4XXmT5O6bcFRxug+fq6vL
	WXatfMbQ/2z/mPOcY3Zm22JB+ZWHdwWgm5tRQxhQOEgSdiQV/e9GYBS83UnN2PDK4pfmql/WZ7C
	JcE8QxG2aSN75/kpskSJYsnTbbB27LwmgaMVbAMQvaXX/L4tEYsx8mPR4jr1zfgzEd90GbDWAXM
	6VbBGbC11e96/+NxX5PkVfU7v+5+Kv8eIFx+8tTIJIGUdJ2vaGy0/OiH2gU0L2VuJ/SpCPF3DLy
	svyP8Auc=
X-Google-Smtp-Source: AGHT+IGfJeq3h8K7rlOuPYAtly/3iJyNvT88y7dQq80574EeG6/ODFgxUyIVyxX17BKFV4lIfvOcKQ==
X-Received: by 2002:a05:620a:2411:b0:7c5:5585:6c8b with SMTP id af79cd13be357-7d2298eb361mr2005674685a.50.1749489483575;
        Mon, 09 Jun 2025 10:18:03 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d390d4115asm240821785a.95.2025.06.09.10.17.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Jun 2025 10:18:02 -0700 (PDT)
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
Subject: [PATCH v2] mm/shmem, swap: fix softlockup with mTHP swapin
Date: Tue, 10 Jun 2025 01:17:51 +0800
Message-ID: <20250609171751.36305-1-ryncsn@gmail.com>
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

The reason is simple, readahead brought some order 0 folio in swap
cache, and the swapin mTHP folio being allocated is in confict with it,
so swapcache_prepare fails and causes shmem_swap_alloc_folio to return
-EEXIST, and shmem simply retries again and again causing this loop.

Fix it by applying a similar fix for anon mTHP swapin.

The performance change is very slight, time of swapin 10g zero folios
with shmem (test for 12 times):
Before:  2.47s
After:   2.48s

Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchronous swap device")
Signed-off-by: Kairui Song <kasong@tencent.com>

---

V1: https://lore.kernel.org/linux-mm/20250608192713.95875-1-ryncsn@gmail.com/
Updates:
- Move non_swapcache_batch check before swapcache_prepare, I was
  expecting this could improve the performance, turns out it barely
  helps and may even cause more overhead in some cases. [ Barry Song ]
- Remove zero map check, no need to do that for shmem [ Barry Song,
  Baolin Wang ]
- Fix build bot error.

 mm/memory.c | 20 --------------------
 mm/shmem.c  |  4 +++-
 mm/swap.h   | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 9ead7ab07e8e..3845ed068d74 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4313,26 +4313,6 @@ static struct folio *__alloc_swap_folio(struct vm_fault *vmf)
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
index 73182e904f9c..a4fdfbd086f1 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2256,6 +2256,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	order = xa_get_order(&mapping->i_pages, index);
 	if (!folio) {
+		int nr_pages = 1 << order;
 		bool fallback_order0 = false;
 
 		/* Or update major stats only when swapin succeeds?? */
@@ -2271,7 +2272,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		 * to swapin order-0 folio, as well as for zswap case.
 		 */
 		if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma))) ||
-				  !zswap_never_enabled()))
+				  !zswap_never_enabled() ||
+				  non_swapcache_batch(swap, nr_pages) != nr_pages))
 			fallback_order0 = true;
 
 		/* Skip swapcache for synchronous device. */
diff --git a/mm/swap.h b/mm/swap.h
index e87a0f19a0ee..911ad5ff0f89 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -108,6 +108,25 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
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
@@ -202,6 +221,10 @@ static inline int swap_zeromap_batch(swp_entry_t entry, int max_nr,
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

