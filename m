Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7792110
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749410843; cv=none; b=CqNURgCDgjJMHIPC8vg5r/xEP1Giq/2d94BBjbUn5LQ+hJx2bdExaFgzsycN4wSYLEOGnaJfpIfhRDnhgyu8boGD2i4/7y5swR3AIF2VMPFffOnGeFbCEFfiqSY9Dnh2WXxQsE3nHDP5nAM+ClTaXCMjmaTyakicx7Ny0MybL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749410843; c=relaxed/simple;
	bh=QdjV4ifHDfBr4nqUyQRIzOrBiBd5MgNdangccSvIyKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XifgtlqweJxM6au3HWEJ8TiBEp4Y4WUgenJhA75Q0VS6JsqOLacImjfKueowDMcqPHALggdsJcmUdcG/a++qphz/znyyTdPjlQywS+cLwVN4tyRV/x50KNMqDeSLBlMZuZGuTbJk2zFp4nfk76TKd3Pmu8lY9HjifspeCqhpPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkZyUXC8; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkZyUXC8"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747fba9f962so3045156b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749410841; x=1750015641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Umc3XJ8UA6r3DJfGKEnxONQj6IfWcR7nebw8X04cSMk=;
        b=gkZyUXC8OfDb/Jkv36OECvZAuLGxEYYAc83TOT1gyblg2yygWiZFkCYazgkqS9pmJt
         kUM/zsaSnK7k2qI59M1D6Vt7hygU6DW+H0iOXza7HF/1wUUAUR/OiBtJo62BmJ9/FBS1
         FKnrwzndclSPeOEsvUo6t/OSYZSUdP6Yb1+THF1byFSN/m0t7vfbTdX5JOgy5GOPuqUh
         2jM/Hfq+PoSt7R2m2CI9yn9WqeQWb5ndep2y0uDmG9x7XybtAPw9TxPmht25C/3c9rrY
         l3Xsqi4/htVZGSdoQNYrW94hAxDY+dnedE+vwly6UkOrW0wteVwcmGDd1j5TqBNLjSP7
         rwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749410841; x=1750015641;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Umc3XJ8UA6r3DJfGKEnxONQj6IfWcR7nebw8X04cSMk=;
        b=cSsCbSpRyLF1+dvAbqyiKo3F9mTUjHV/H3xE279/HFjRMFSnaesukNvNheb+W8Bu/r
         WEy7pdaPrIw9loDCOScl98Mje/5DUcRIj//5CKUgVnlHz55ARha1UR1fIM5wohT5ufDV
         ncs4e1U0UbxsNVw0kLghEqjAk3KATQkaJNXFrcaBVfEXniZHw+Fw6sDjGD0064udzdAz
         4jHctUHzrOlLJ8s0GSZ010SCSCZibipE3c/lZxZbHrIMQ0LHQ/012IMHj9QPhvzKa4OA
         PUimzG9hpBPzytOgkNrsrIkwtZxEU0e8tiAgLu2YOYBsHYDEqdo/JUMekY9l5LFJLnpS
         g6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVpk+2dzW8WOPV53S9T6p8fCb9zNKBXW/o4aloEtndMSEr5d/Vh3MQL8GvBLvE9pbbeyLrouDEV9WUbnyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6ApntI9zHLRxmrs7UIln3PK/L/tkP4V2xZp7EkOwi2EltF5X
	cDd35JjT/dlG4Ku2srG4DINujZfQrLVx2+dxA6JnShroeJigjpv+3qQd
X-Gm-Gg: ASbGncvFaSUyBsLuWl7Yaa9MO5PrJ/jJ15QzGsKyxUdWOA5DxmOrKA+iTo9nmQTK/T4
	yGEpV9To6ut/uQ7wj8VXLwnLWTJIWjEkUcMLmxyFMdSpHa5XhEaqs5+ukI5lVDtu5922QJrD6UV
	iV1U4TZ5Ke1v2O9BNdVbhV2PL+3IGtmgIa5ih6eSiEO+6aqhQlQCLlGFlxi2e59X1M2K/Te2H1n
	8PvjkqS8sInTH99CukmmQa5fzvk4uW/lHz4dsCY/FursIiaQifTMNhyLIkdvt2bDlOFhWZqjD4r
	WfHG01WOWMZ6IvphfJ76PdYQuAQ9z6g+mWXb+pArrm+bI4zAWB5vm5EOkRw3poZN50GqD8QoKWb
	P2Y/f
X-Google-Smtp-Source: AGHT+IFrR29IeMa9z8t6h/YKdzb/OpTgDOF5+AG5muZffHW8pGxLe5Jf+1ISSr+3bItufYcqY48ARw==
X-Received: by 2002:a05:6a00:b42:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-74839ddbc39mr7007399b3a.9.1749410840780;
        Sun, 08 Jun 2025 12:27:20 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([1.203.117.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7ad57sm4437091b3a.65.2025.06.08.12.27.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Jun 2025 12:27:20 -0700 (PDT)
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
Subject: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
Date: Mon,  9 Jun 2025 03:27:13 +0800
Message-ID: <20250608192713.95875-1-ryncsn@gmail.com>
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
(test for 12 times):
Before:  2.49s
After:   2.52s

Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchronous swap device")
Signed-off-by: Kairui Song <kasong@tencent.com>

---

I found this issue while doing a performance comparing of mm-new with
swap table series [1] on top of mm-new. This issue no longer exists
if the swap table series is applied, because it elimated both
SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO swapin completely while improving
the performance and simplify the code, and the race swapin is solved
differently by then.

(The zero map fix might still need to stay for a while, but could be
optimized too later with swap table).

It will be good if the swap table series could get reviewed and merged
to avoid more fixes like this. SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO has
a history of causing many issues. I'll do a swap table rebase on top of
this fix, if this one is accepted.

And for a comparision, swap in 10G into shmem:

Before this patch:  2.49s
After this patch:   2.52s
After swap table:   2.37s (Removing SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO,
                           still not in the best shape but looking good)

Link: https://lore.kernel.org/linux-mm/20250514201729.48420-1-ryncsn@gmail.com/ [1]

 mm/memory.c | 20 --------------------
 mm/shmem.c  | 12 +++++++++++-
 mm/swap.h   | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 21 deletions(-)

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
index 73182e904f9c..484cd3043a78 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1995,6 +1995,14 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 	 */
 	if (swapcache_prepare(entry, nr_pages)) {
 		folio_put(new);
+
+		/*
+		 * A smaller folio is in the swap cache, mTHP swapin will always fail
+		 * until it's gone. Return -EINVAL to fallback to order 0.
+		 */
+		if (non_swapcache_batch(entry, nr_pages) != nr_pages)
+			return ERR_PTR(-EINVAL);
+
 		return ERR_PTR(-EEXIST);
 	}
 
@@ -2256,6 +2264,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	order = xa_get_order(&mapping->i_pages, index);
 	if (!folio) {
+		int nr_pages = 1 << order;
 		bool fallback_order0 = false;
 
 		/* Or update major stats only when swapin succeeds?? */
@@ -2271,7 +2280,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		 * to swapin order-0 folio, as well as for zswap case.
 		 */
 		if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma))) ||
-				  !zswap_never_enabled()))
+				  !zswap_never_enabled() ||
+				  nr_pages != swap_zeromap_batch(swap, nr_pages, NULL)))
 			fallback_order0 = true;
 
 		/* Skip swapcache for synchronous device. */
diff --git a/mm/swap.h b/mm/swap.h
index e87a0f19a0ee..2d8ce1102153 100644
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
-- 
2.49.0

