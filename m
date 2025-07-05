Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969FA20B800
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751738008; cv=none; b=XtF7ECMRmBakcYIolwubrqaGBLRkHqXzfw2o1TcMOmyKpO0kLJcLgJ+c8EpOyqqNwOv/xKGq60ArfvQSH8jfOPszlOoiH3k6DFzVLZwGrrGbUMzOabFYcaQvK5sumhf3LsONTTxyfLTYE8YAfHIwd2VVIi+YMUrnz7yZxou7GF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751738008; c=relaxed/simple;
	bh=TEejV14HsRC5fLEWgeIeilpSyWrV9Qx84J/4EhI6W64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EgFvydGPCfTBbp4k7WL8RepOYtRuPKi8WBxfgdWFx3G+G2VFeE98Rooz/GRMIjh9K318ha+d2G35T6hXIa8KoZudo2pWf2bmCVZA/Yq0I71CWV1la8Li7dpK/ZDfZkqPoNRH7i/oximGkwX1Ja8TB1UEJIHkzPl4CrEAynW2Ogs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU+RM9N6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU+RM9N6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748e81d37a7so1092247b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751738006; x=1752342806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NRnHRIkvKPiGwHQ/DdC9lszMjv0qPduuNx1iD3B8GN0=;
        b=TU+RM9N6dL/02L7uCqfRzOhqzW5K5i0w+wd4S6V88iqRRsfD0RlbDvjX38nBqmzvXS
         rNIpcGD/qXU69eBQm6baWXkhQJh8qvgO2cSr5MRr0Mj20dmQf4FHwfNVUMadFRYsHb3b
         x1gB5/K8BHO3cknrc4WpnHxMOoCjzDYnjllChWOYmlRg7S1LAoj6+P1O1pEw3jiixDAE
         mVc+/q4S5zkSLwZTsEHibfG9F7btK1oFevl+DZKny8A+KC3OzHM1tlbbemz9MNuy1fhd
         4SqjLV//+v0VOHjDb2JSUH5ZcVAuJwly2vhZmS61/VPdMUnSYwLDvhfBbvZ57D9qU3Ue
         hgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751738006; x=1752342806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRnHRIkvKPiGwHQ/DdC9lszMjv0qPduuNx1iD3B8GN0=;
        b=snjMTKn3Ia4BGv4s2IhCQMpAbqZenSGoH24Wd5xdc+3pD7s20OcDPYEO/aFVGyur7j
         rv1txIod6+7Ysz1iAaKLn5C40VSa40/ogwt4rXIJ5Q1aXMdkogmDSC/xc7EE0mrZHd08
         CoS2y7bCM8MEqRjaoQG5N+9PPzejt0ugCJ7qWmLIfYDseF1uRIE7HReFPKGcwCSqRpse
         pNph0r43rjIgZSqRBqVAJnRtz2a6omN6L8MB+QIflL9jbV6gLNtWQvrHXhbPbFY+Fttg
         wj2Ly3p8L5hAjncnVjhoTC004EGqeXydrOjcZApiOzXxiGWChhnBk4hhSYHiTf/ihmZ1
         +B/A==
X-Forwarded-Encrypted: i=1; AJvYcCWYV3RJcGt+9kORq5hPR98CWWV+AABhOXzT7R6V/sBX/3ie+z3zqTPoe3/Y1xd3PxqZchpAED1N6LV9Itw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtMv43uaSp92GLxZF8LCh1AV24xrH+GiHAR5u/QeEFY3F/U25I
	JmZ87d8uaC1ZGGHhxlX1jMjGOV6PnUE90Gak1JTwX96uyi1OaaVLWveg
X-Gm-Gg: ASbGncs+RxpQn/GDPoUYzkz/SksvSGJ46i+EE+CMg54aZzrEk5azy0bAn1I3Wubq1bJ
	h9BJKiTfWBkyCPeiUYx79uhksiTd71PzNWJiR8IUAQuCqJv/lD7+95m4Rfz+kjUlYrWXUWlZTXp
	G6DlrfxuSnNC8N628Bq3XsuLYNtqu9HQ6+fSVE+Tr3YdpE7BrN6S+RzFG/Q8TfSSXEJjnj+f5wo
	q6uXeP2Ca/asOQL29ISCchtL1ChTkBQC8YyfKL9yRX6Iv6xOJYG2aCpmnjBTYQ6gAAO1DH9kWDr
	jh55axig2QYeQbD3qdb52Dd7mDyEmGnABI1guvzAI7yQKtFX21iODEalEPNAh5RgD+Indu3z1VA
	8d7bBOW6BCr9JD/KHfUORVjuywNd349EDVVVFxrs=
X-Google-Smtp-Source: AGHT+IHznKRnwTVFc0Lh48sxul6MzHr+FNSwk4CN2E/eToBZhWqZxMcHqv67W99+dssKncSnR7ihSA==
X-Received: by 2002:a05:6a21:2d8c:b0:225:ed50:2278 with SMTP id adf61e73a8af0-22721e6fe99mr5061569637.32.1751738005718;
        Sat, 05 Jul 2025 10:53:25 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55.hsd1.ca.comcast.net ([2601:646:a000:5fc0:224a:13ba:b5c6:4ebf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359e90asm4596710b3a.6.2025.07.05.10.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 10:53:25 -0700 (PDT)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Ivan Pravdin <ipravdin.official@gmail.com>,
	syzbot+6bf948e47f9bac7aacfa@syzkaller.appspotmail.com
Subject: [PATCH] ocfs2: avoid potential ABBA deadlock by reordering tl_inode lock
Date: Sat,  5 Jul 2025 13:53:15 -0400
Message-ID: <20250705175315.225246-1-ipravdin.official@gmail.com>
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
 fs/ocfs2/move_extents.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/move_extents.c b/fs/ocfs2/move_extents.c
index 369c7d27befd..ab460cb2c9c8 100644
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
@@ -637,8 +639,6 @@ static int ocfs2_move_extent(struct ocfs2_move_extents_context *context,
 		goto out_unlock_gb_mutex;
 	}
 
-	inode_lock(tl_inode);
-
 	handle = ocfs2_start_trans(osb, credits);
 	if (IS_ERR(handle)) {
 		ret = PTR_ERR(handle);
-- 
2.45.2

