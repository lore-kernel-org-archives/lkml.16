Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D5B19F104
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739022864; cv=none; b=NgJX74VZYtCybEMPwM3XV7mcqu1eSClXV/7BvmVdeDakZZX1DYbnKKsefzuo9sbCVplrphopLVzfd7OLURm3VS3O94wfS1siK4cSfekLqHWdJtIBclqpyis87qNUOZjqJ9The8N0g5mCmIdcjv40CzDLUO5r8IKfe1dqVNo9eKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739022864; c=relaxed/simple;
	bh=+Yi54ZaTbBcDjbBofrc3cZJQT2QMn9kkopggaeEsbes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NY0wKmhGes8anVmw+b22LpwGnQ9+SMxB5EBQxHSAQMbOLTIJZNaB5kxpL529Go6R4Nx0W0+/LJTkAEKHCKTW6+uXxEl9YRf5ZjPu+YFSwwX+AZHPYW3KahPT1R8DlKrDTyxHmx7Ai/GmnyqpFpF9Lzlut8yUtPf+uS/WNe9wFwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0hjpo7O; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0hjpo7O"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f0444b478so43952355ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 05:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739022862; x=1739627662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFnScfrb4FHKoOTGmqlb5WR9qT5yGH/QUW4XVtfAjOc=;
        b=m0hjpo7O26rhUa7BAnDeOVUWmz29DusUn8U8HOGgkbtHGzK5sQhxHh5dMXlDtkI+wt
         nJknUHlNy3SaHos06ZjK/2/HL8pvCUHDUJtWi7qZHCJfxDJzLqHfDHM/0N04WYPsWOMO
         FdgKaYI/063nsuTHVoJ4umQ4NA4tzfNHPNLDfZeRn3H7NAKSVBjxV74+cQiKnUDcI5PA
         nDNxyJp7YZrEC/LTQOh3U2TJYi6KghiCb5hKM5oll4fJ+1zaiTradrZEAs/s+MGhPvIX
         T6Y25w8WNQb0XHKOptwEc1E2z0xbm5GUDFZldtOCkvz5uhZYiGHq9lipGUmWYK0h2ytI
         B28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739022862; x=1739627662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFnScfrb4FHKoOTGmqlb5WR9qT5yGH/QUW4XVtfAjOc=;
        b=jSkIgmnWIO3Hl+ZG7vMQ9uYBpkuMdz415faD3Ok0o5eoX7mexZbB+u6FhiATKnPtA+
         yDGh/TcUnTm1d2UawR9Fq5p5unUe5IvzHIDfvgQNAqHsfyMcbGKKl55ECjB4tZcNCowB
         bK6GYVmS31XjQUPyWXaI8PUlmFAsncFF7inWeepoCh+0jtCwYANw/3WPAl7kZNeldWXu
         BRQc6MhqhR7ZKvSbFg2ehPLdcHzfpV4Ih6sXcZCWjjlqLLIYrfizTgV0DzzYJVQgWcfh
         Q1ravb/vromUP2zOiLuvHRtTqy0u/2R48blk5D12M2pkPzDJBvIjHkRJUxHRAxRtxRix
         NnYg==
X-Forwarded-Encrypted: i=1; AJvYcCXdGR0MCc8QgZ0l88dJI2EnRUD7yteLbR4pQuY9Oyu3unnk8DIZavAu1vOuxTJxcQVUAulfCXLTX5o0W1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YznWWAf3EycZ0RT4Mn5BZDwcSjGSraZytDMslImcxTukvFRkjuD
	b+gkZ4G6xNpuJ7Bz+0IYCwN29txHHpWdNZeqX2y+0Ee4cFs31VMm
X-Gm-Gg: ASbGncs2WegxIE9D/5g1zb8+cZSAq3xt3mkQCg7xJAOJHsVo2N33qxzIQqNyvz5+h+C
	0KfW2Lrul21EAPlH8xydEDHpV7UeuYZzG+0rTSJw8oC2pMq0kVwdYM9RWXPCEL7f+Xbhut9zSGn
	9OOsWB4MeBXDy1P7he9V5ZtM5HcodgHCaMyfC2dihXKp69qAbIox7B8Z4VIzTE1k1tX6Wy8ZE7U
	mdohy0v+zGQVthLGugZGzdlpnD0XMpzTCTKL36YTkQ8d2fABsRWw9TIctFwoX5VUVUtNEvsm+7U
	Gitm3q7mH8rdmoJ6282mh4aTDE7aamnlhLLaHc0Ae5N5
X-Google-Smtp-Source: AGHT+IFbxc3GAXDoXKJ5rW0syHVzL3E4LhgGQxe7npP3vn/vPOBix39tigacRyRjZC1ZeMRoWdpayA==
X-Received: by 2002:a05:6a00:1acc:b0:725:e015:9082 with SMTP id d2e1a72fcca58-7305d421bf5mr10321913b3a.5.1739022862027;
        Sat, 08 Feb 2025 05:54:22 -0800 (PST)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ad292dsm4749597b3a.61.2025.02.08.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 05:54:21 -0800 (PST)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Yohan Joung <yohan.joung@sk.com>
Subject: [PATCH v1] f2fs: separate discard and zone reset command from pend list
Date: Sat,  8 Feb 2025 22:54:14 +0900
Message-Id: <20250208135414.417-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

currently, zone reset only occurs when there is urgent utilization and
when pending blocks are reallocated. this causes performance
degradation, so we are modifying it to allow pending reset zones to be
issued.

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/f2fs.h    |  3 ++-
 fs/f2fs/segment.c | 21 +++++++++++++++------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1afa7be16e7d..09a7e13c0d00 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -349,6 +349,7 @@ struct discard_entry {
 
 /* max discard pend list number */
 #define MAX_PLIST_NUM		512
+#define ZONE_PLIST_NUM		1
 #define plist_idx(blk_num)	((blk_num) >= MAX_PLIST_NUM ?		\
 					(MAX_PLIST_NUM - 1) : ((blk_num) - 1))
 
@@ -410,7 +411,7 @@ struct discard_policy {
 struct discard_cmd_control {
 	struct task_struct *f2fs_issue_discard;	/* discard thread */
 	struct list_head entry_list;		/* 4KB discard entry list */
-	struct list_head pend_list[MAX_PLIST_NUM];/* store pending entries */
+	struct list_head pend_list[MAX_PLIST_NUM + ZONE_PLIST_NUM];/* store pending entries */
 	struct list_head wait_list;		/* store on-flushing entries */
 	struct list_head fstrim_list;		/* in-flight discard from fstrim */
 	wait_queue_head_t discard_wait_queue;	/* waiting queue for wake-up */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c282e8a0a2ec..1c32252db525 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -962,7 +962,10 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 
 	f2fs_bug_on(sbi, !len);
 
-	pend_list = &dcc->pend_list[plist_idx(len)];
+	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev))
+		pend_list = &dcc->pend_list[MAX_PLIST_NUM];
+	else
+		pend_list = &dcc->pend_list[plist_idx(len)];
 
 	dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS, true, NULL);
 	INIT_LIST_HEAD(&dc->list);
@@ -1649,6 +1652,8 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 	struct discard_cmd *dc, *tmp;
 	struct blk_plug plug;
 	int i, issued;
+	int plist_num = f2fs_sb_has_blkzoned(sbi) ?
+		MAX_PLIST_NUM + ZONE_PLIST_NUM : MAX_PLIST_NUM;
 	bool io_interrupted = false;
 
 	if (dpolicy->timeout)
@@ -1656,12 +1661,12 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 
 retry:
 	issued = 0;
-	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
+	for (i = plist_num - 1; i >= 0; i--) {
 		if (dpolicy->timeout &&
 				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
 			break;
 
-		if (i + 1 < dpolicy->granularity)
+		if (i + 1 < dpolicy->granularity && i + 1 != plist_num)
 			break;
 
 		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered) {
@@ -1720,6 +1725,8 @@ static bool __drop_discard_cmd(struct f2fs_sb_info *sbi)
 	struct list_head *pend_list;
 	struct discard_cmd *dc, *tmp;
 	int i;
+	int plist_num = f2fs_sb_has_blkzoned(sbi) ?
+		MAX_PLIST_NUM + ZONE_PLIST_NUM : MAX_PLIST_NUM;
 	bool dropped = false;
 
 	mutex_lock(&dcc->cmd_lock);
@@ -2305,7 +2312,7 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 {
 	struct discard_cmd_control *dcc;
-	int err = 0, i;
+	int err = 0, i, plist_num;
 
 	if (SM_I(sbi)->dcc_info) {
 		dcc = SM_I(sbi)->dcc_info;
@@ -2316,7 +2323,9 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	if (!dcc)
 		return -ENOMEM;
 
-	dcc->discard_io_aware_gran = MAX_PLIST_NUM;
+	plist_num = f2fs_sb_has_blkzoned(sbi) ?
+		MAX_PLIST_NUM + ZONE_PLIST_NUM : MAX_PLIST_NUM;
+	dcc->discard_io_aware_gran = plist_num;
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	dcc->discard_io_aware = DPOLICY_IO_AWARE_ENABLE;
@@ -2326,7 +2335,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 		dcc->discard_granularity = BLKS_PER_SEC(sbi);
 
 	INIT_LIST_HEAD(&dcc->entry_list);
-	for (i = 0; i < MAX_PLIST_NUM; i++)
+	for (i = 0; i < plist_num; i++)
 		INIT_LIST_HEAD(&dcc->pend_list[i]);
 	INIT_LIST_HEAD(&dcc->wait_list);
 	INIT_LIST_HEAD(&dcc->fstrim_list);
-- 
2.25.1

