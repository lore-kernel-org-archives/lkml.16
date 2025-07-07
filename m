Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D241C5496
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859071; cv=none; b=QjHH0xr8i/ouL08RCG9Y9WNyRWaaXaOKlrlUTftW1QxjH/l78im81nskkeI7cklO/w3VGaFM6dFIICiLASS1uOP8uPdPomu/7rPhLOibVYLVfUpS+5IBypem5MR3nA5ML+AIkAENbOeyb/B9lHXnzPHDGxOMCh55ZUq3ElyV6m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859071; c=relaxed/simple;
	bh=5bGLlcz2LNZcz7V3A8E5z8rSY2F/sUreYHn4QIcKulI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Be7EfUCX2Vflz4IB+6w8ThNJWJJD4+or9fmCShzsnOuSRwbANjLcQXQm9qfPPyunPp2dERvUg4S8x8hDcPU1DvwrYuQVLedMuDL0u4XkFQyDgNDKz6F3iObWlCM91Cq97YKL4xFzsy8X+9iysPawBLO2tL7pHdFOJzSjwQxSSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcTtXg57; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcTtXg57"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23649faf69fso21782515ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751859069; x=1752463869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6D4FNc+ZPSxMXR0yzDGObqB7ha5/gNIAEBywyOv4ZVY=;
        b=LcTtXg578i992XbUZWtRG7EYYzL7uFwH5IWxnn+avTbqCw7+pQZRzEdD/Y3qmMR7L0
         2oJH8okPQn7Tr+ow8kW/ymNtJCThYlnvI9d1gmi5LHUtcVSmFU/qSdoCz1hjxE1ry48/
         +0V9N+nNzxlqLbA1g2u7QxmUIw6gNutYDlTMIZHJzhJvdU7cATF1GyhiXk5W8A2W25oC
         yKaXwFuZ94LH/XxzIaxecaQ7Uk43eZpa5itZAK1zM66Epxn/X/7uo72bqMePdpr+Entv
         80GxeJzOuaVmKrikCrIr6K+ELkFMb+8eWvRc2pg3W6Uw+bLqrybAis4w+eWPTn/jMnPH
         bqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751859069; x=1752463869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6D4FNc+ZPSxMXR0yzDGObqB7ha5/gNIAEBywyOv4ZVY=;
        b=pjrn8x+mXqXcnG7p/Hmo3Lf9TMpB5Aae8q/lxeMMcobLge0mGdBBMlVJn48t5KdP4J
         j5Loyi3G64BO8V9M1G1I7uD9SDhpxSG0B06/y08JvSGuBMU4iyuDwu/flgpRSBPhjNZ+
         7W5vztIqQAPGSIPBbUDca9XVOL+YzOy8BLGMdjHlsRb7X8SqURgA95mZE1sqgAHQBKTw
         IjHiLte1/M6H+Wm+CJ20JwbLHAjMYhdPQbf/ToUsuCmDx6Hd7E2ODxTWd5xmZZ/MUplY
         UOlb6V8d1LAFWULjCQtM8ynaQGQw94klpR8TJIII80VsY4SbxHwiRLF7ofKDBVxef4Go
         evNA==
X-Forwarded-Encrypted: i=1; AJvYcCVzqpz4q1x+IEH7DvQ20mtOSJS0piDK4otb49wRzehCuj/XhKQeB1zHE+YPLNb7E8zOeg9zOoTz/GCOG5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YypjtFIkbNYR/Mgpc9e0P6R2/pVwAgo1NEvtnz9fGzXwKSn2cen
	aKct7q6nXEEtDIugo6nUaNlXnoUcDZyRP9uMIvj7CQXQ/5jIk3Ikhv+v
X-Gm-Gg: ASbGnct7o4uY/sgwO8BkyVZM6MWi9t4EXjfFHLrDUM5pKvKV0kYwc9RU7D5iA8H3d6t
	3xRLfPgN/Fkvkij71dARoXv5crL9lznImIISy0tzV6Wyfm7rqFMqn4R1efIvdqFn2a2aYDBG/WX
	P1CbiLLraDCHNqngrjUQoSmSixRhSprpzoOIumrYaUi1xEEyjMOEOE9fi5rqz6DYXEHMlA4gyEA
	Q4fovnmvkMYJ3c72FmcjFlexEJkLGpJQ2+gn5JV1JQQKVbocn6EgB7zL0epTz9fygYjaliL+Qpt
	NmeLnpoE3DafgFcftJt4K8xvKomhhLq32YphAGJmNI/OdTVgbk6/n0wG+1hr6spDbmiIpInV/8W
	8VdxH1vMbdGIWPGbm/Kz9tCL4ZAw3skv4CuyJiXKoH7HWJkZURw==
X-Google-Smtp-Source: AGHT+IEVYxAqKEVcCfg4J8NqSrjAG5zg58gwvdEAbHHYEWOVkuup7CGKWYMfT6CQpOy35AnTNXLlXA==
X-Received: by 2002:a17:902:ce89:b0:234:d7b2:2ab9 with SMTP id d9443c01a7336-23c87472898mr163559135ad.12.1751859068755;
        Sun, 06 Jul 2025 20:31:08 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55.hsd1.ca.comcast.net ([2601:646:a000:5fc0:5e93:4ea0:4954:ef6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8fcf6715sm48359415ad.51.2025.07.06.20.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:31:08 -0700 (PDT)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Ivan Pravdin <ipravdin.official@gmail.com>,
	syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com
Subject: [PATCH v2] ocfs2: avoid potential ABBA deadlock by reordering tl_inode lock
Date: Sun,  6 Jul 2025 23:29:51 -0400
Message-ID: <20250707032951.361331-1-ipravdin.official@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ocfs2_move_extent(), tl_inode is currently locked after the global
bitmap inode. However, in ocfs2_flush_truncate_log(), the lock order
is reversed: tl_inode is locked first, followed by the global bitmap
inode.

This creates a classic ABBA deadlock scenario if two threads attempt
these operations concurrently and acquire the locks in different orders.

To prevent this, move the tl_inode locking earlier in
ocfs2_move_extent(), so that it always precedes the global bitmap
inode lock.

No functional changes beyond lock ordering.

Reported-by: syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67d5645c.050a0220.1dc86f.0004.GAE@google.com/
Signed-off-by: Ivan Pravdin <ipravdin.official@gmail.com>
---
v1 -> v2: Fixed unlocking order in ocfs2_move_extent.

 fs/ocfs2/move_extents.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/ocfs2/move_extents.c b/fs/ocfs2/move_extents.c
index 369c7d27befd..aaf8eb2693a4 100644
--- a/fs/ocfs2/move_extents.c
+++ b/fs/ocfs2/move_extents.c
@@ -617,6 +617,8 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
 	 */
 	credits += OCFS2_INODE_UPDATE_CREDITS + 1;
 
+	inode_lock(tl_inode);
+
 	/*
 	 * ocfs2_move_extent() didn't reserve any clusters in lock_allocators()
 	 * logic, while we still need to lock the global_bitmap.
@@ -637,13 +639,11 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
 		goto out_unlock_gb_mutex;
 	}
 
-	inode_lock(tl_inode);
-
 	handle = ocfs2_start_trans(osb, credits);
 	if (IS_ERR(handle)) {
 		ret = PTR_ERR(handle);
 		mlog_errno(ret);
-		goto out_unlock_tl_inode;
+		goto out_unlock_gb_inode;
 	}
 
 	new_phys_blkno = ocfs2_clusters_to_blocks(inode->i_sb, *new_phys_cpos);
@@ -704,12 +704,13 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
 	ocfs2_commit_trans(osb, handle);
 	brelse(gd_bh);
 
-out_unlock_tl_inode:
-	inode_unlock(tl_inode);
-
+out_unlock_gb_inode:
 	ocfs2_inode_unlock(gb_inode, 1);
+
 out_unlock_gb_mutex:
 	inode_unlock(gb_inode);
+
+	inode_unlock(tl_inode);
 	brelse(gb_bh);
 	iput(gb_inode);
 
-- 
2.45.2

