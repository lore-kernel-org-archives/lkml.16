Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044721D5BA
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748557541; cv=none; b=JE3mVYjZlxUvBWmCkYlAucD/GqRgp/J9FCmfE+rO66AtQkqOOX/42NiCkPYXwqtfUe/nb5aGdKyiLJ3E1h+F+h2sHk9IvH5V4dknYaFmRXsON6K4MuiE495UWDbyK04TB7kVC4/LGsAUtrxIE1q+vX/Zb/B9SyIgVG8gwyMC0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748557541; c=relaxed/simple;
	bh=9fHccOzCoT3PXuJMnHBxoEcOvKmcudsQQ0DLMoG/Xgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yo9lWOBl6eNdgzI5VUzqttS1TcjnXA+eXyjv3bBY2wTSoKNjCnE0LbsLdbGrkKsERkad7Osnn9yCbeaJ3yLllHgXFdBgnuXSqp1v6rfMceWpCHPgqI0yZfP6+J7hAbmXvOaF+Pwu5ItMM5VpZRbuia/KKtzCzHI5ZH7daGnfmFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fg1iDOf1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fg1iDOf1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73712952e1cso1082415b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748557538; x=1749162338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=drHrrRT39Op87szRQpY/iTZqFXixV7SuUvHON4DmPJk=;
        b=fg1iDOf1f1JG+haM8R/s0LwWADElYhhBg1q9YbqtW1putPlQ5xlBFkukHNmd2lk6xN
         mIoc91sfXc6eu96Q08TgcL0YLWHQuY1MzCtE6MLJcQsNX3k+lSn11wxIwqrfVn1Wl4TL
         pmvt8Lu4OIn/ylafo8CSYcGpBwtIQclwSfrFYgdvFqIoICidcGw04mXUJH4itviR4t0G
         3PPaCYSxmx5OhH5OYJdZPmUzsAACz8XS7wmtSPGI+OsHdZ/B/imbmHS75or6mLMDkCdg
         ir4LTBqnBJJZ8uT1USKlTclyFrKMJtTzBMGiD+PLM+CQ9VnNhNsDckqz5U+fcGjXCprm
         bNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557538; x=1749162338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drHrrRT39Op87szRQpY/iTZqFXixV7SuUvHON4DmPJk=;
        b=XWPxrJ7sflg04GFGaZKYjyMT6OlGZhE0TXrFKHT7VkTsh6dCxa/wAd1pdCefWTN9UK
         oA4cUoyO79HqjGemRHT4smJxTeQzs/yBw+tQHIJ9hV6Wxo4HzWKDb68nC+R39RFoShE3
         MOmo+ZBAd0Uq2aiYhEGWU0l5zqyw4WCadeMWZb0ZpYzoeBNkt7nJkytmxLR4sM+D35cv
         TACxjMFSFBnteeMHn1S/p1ZSkRx6pj8dpPy9ugLvcobChFYeCjhfqd6HgPnGURhB2HqI
         2TWVvdGKDgpm248VxcDyHaVsybtmQU707FFpFWyRkVnbebcgP3KmirL8+DZN5tYXZSON
         ByAw==
X-Gm-Message-State: AOJu0YzeeDKuU6geShk0EdNbiiIkjlSv9VIu5Pe0uyEv+JhpWzqMFJZg
	jVipbv232V2u6Ejl1aGI8mf5OYJutPLh6L+dsctZePyWvC6CJjTTFinfeagwAg==
X-Gm-Gg: ASbGncuIxxnskvGfb+JWvJT5imfYi7jSBl0X/smTHjiG5aGClnGrjnGMfDSM14InWoE
	HBn2ZqyfbNPsBxsX7VrFDXLvOyGfY4ejO81aeuoKEuBhYarLk5EXoe15CTnO3X9aQkMg2L3UfJq
	T97qL1rYUp4z2CGKPNOI18UuF8fUeK2E1U5W8++tUkP6v+W77k14jYS/M/gM7Zs4iNiC69GxCOW
	2c7Q9RTKOqdhxBWMijldJNFHxdbC26PA4VlU4S1hJ1UkLotzOj/or02M+5DAT79XbhsgeLy4772
	Q1lx8mJHljc3KMnGJ4SJpyHZIeo4mbxvM8F/rBKE8isb/L5ZEK9ULF2xRl+Y08HEk8m2wLTZ7Oz
	Q4HIZ52FV/2j6jK2gVpPXAj6opLYjozr/pmlMkRQUkYHZN1ki4bY7CA==
X-Google-Smtp-Source: AGHT+IHlBHPluOs//bqnUjchs07T0PB+X5G4b+ihLaWDzs+KYZzqJ2rb5/G1M4hLSxKiNhQG9WzP+A==
X-Received: by 2002:a05:6a00:4f8b:b0:734:b136:9c39 with SMTP id d2e1a72fcca58-747bd9f148emr1247882b3a.19.1748557538421;
        Thu, 29 May 2025 15:25:38 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:a46d:d724:4557:2a3e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf25fsm1802750b3a.121.2025.05.29.15.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 15:25:38 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: make sure zoned device GC to use FG_GC in shortage of free section
Date: Thu, 29 May 2025 15:25:32 -0700
Message-ID: <20250529222532.1088106-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

We already use FG_GC when we have free sections under
gc_boost_zoned_gc_percent. So, let's make it consistent.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c      | 2 +-
 fs/f2fs/segment.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f752dec71e45..cd13a642055b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -144,7 +144,7 @@ static int gc_thread_func(void *data)
 				gc_control.one_time;
 
 		/* foreground GC was been triggered via f2fs_balance_fs() */
-		if (foreground)
+		if (foreground && !f2fs_sb_has_blkzoned(sbi))
 			sync_mode = false;
 
 		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 396ef71f41e3..030540df3550 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -446,7 +446,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	} else {
 		struct f2fs_gc_control gc_control = {
 			.victim_segno = NULL_SEGNO,
-			.init_gc_type = BG_GC,
+			.init_gc_type = f2fs_sb_has_blkzoned(sbi) ?
+				FG_GC : BG_GC,
 			.no_bg_gc = true,
 			.should_migrate_blocks = false,
 			.err_gc_skipped = false,
-- 
2.49.0.1204.g71687c7c1d-goog

