Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C80C2F2A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749237624; cv=none; b=JMDTs9YFzVsbFhpW+qbvkx/bs2J3ua/tEhf51+C/IR0SL6JpmF715wGiqT0zBTdOnMbvMfYgH2hFc8QJawccsdRT69PscaQz5yHAeo9Oru0I9JRl5TTwoiZoPmiu7tDLUD7SscwOPUOPVWifsskv46XloLuouT1XPlOhnkTyap4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749237624; c=relaxed/simple;
	bh=UxlEV2+Ek+wwbNisCpAZHs6Be8d51hLCM4MxS5EM8aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qq4gFfDq2Ab9iMH/r7IMrasHB1etuc5J1URmKmGwzdlPR4KwSgoWpJVhuHQVugTUJODF8O6Me5sY0UoL8pyWRh+v+3/0is9FlRERxXeS/KK27pcQeQ5GlAzN8AmGFbRi9dmqQBia3OHJoE8Ax1ALp6o3s29qNkVCPnMTWqOOLZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ51CBgX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ51CBgX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235a3dd4f0dso17926175ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237622; x=1749842422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UTDZ1/hHZs0bK8G0qVizEGkzLroiiZ6qFk6RdyLfRk=;
        b=gJ51CBgXdAInQp9XWLzoBJ8RSo9FLQZK2EbPOnq9jrNr4wD2YYZ/7psF49QEJ6WAkl
         OfkZwhL+fcmETop/KmSZM/7VtBD3XwgiHwscOlSWdNPOWWJ+erXjs4LcJqRvWMnoTrxl
         pEDiBAFJXPhP80Ve9IpyrsROK7nDYP05PiXYCNZYH/XrvsAdcl6v2W9FdF9d5Z8Xa9s8
         +ovx759HCaBaGlTEcKIYEPyIHr2ZTaJil65AMg2VB3JSzGyA1IemwxJFshSdrpY3654x
         h7yEKTO4ej/YDH4Mt/4/ie6xIoXmYj3rsNsEzpJBZIOKGvHXHLjeD7PRZhKDoQqU1Pp3
         mwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237622; x=1749842422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UTDZ1/hHZs0bK8G0qVizEGkzLroiiZ6qFk6RdyLfRk=;
        b=iQ6nUd1055DXewj9ZhayIeSus/HzYn/BY2rGvFsgdk8dK84fXOKS3kryjxE3P9GvmC
         tJ2iw+vkqZVV1W3tiGdLb1UQbNy7aCRcPytGTXG6+/W7VMgYpNCJSaqIsrASPzPFUaXW
         Azn84ilRMQhsO2BlZ/v+gRFDSQVx6kpDCfymlqwas3Pvb21tDVYAU1W+rzdrth5jnj47
         5X/4Zfm95YiM8VskCnQ7Xdy7s53Hjq20K8LUKif2R1uTmAD9GnLtG96N09vzJx2Y1tm2
         MX3akQR+IUHRgiIeKCJojWXmE7UvnxgxXS4KldwyoTTesvQ0N+2aUP2OlMswZiOWiApg
         RLjw==
X-Gm-Message-State: AOJu0YzXV1iPldyO5tE5tsyq203mcX6FDxoVUFKjU6iimxhu3LVVSmJZ
	/dmaNfATT4B8GlPWk3JZ6xBlQwoFetCxcjql3RwqhRwNF8o5iMmicTBtIF5KJQ==
X-Gm-Gg: ASbGncso2x6fyq7sP/8Weha2qJuqgOswl512tG5VWbjFWvM9NgVLL19hvp6kud1EJZ8
	Cz8GoO6ROexe/slYvHiUD2JJUhbPC595Hg646NI9Ad2EziITxhxL00w9nlv7XI0nWrJfJVW8VdQ
	DKRTiY2vTO083QFASs267QtbdFKTO3+HiBNBRnmgx5UGIoOzEHYJJMfjv0dn7bFRMdnrST5qH4c
	TdRsF5x9I+J3cN0cpLLb65dyYxxKg3OTyEcR5eSuGD+/7gwwK3b++YkWyboByfuJHzvuD1KvHer
	Iw8F+wSUB9AWdsB3q+oKiTXYO2yb7ZqpTj9GrrqbhgWOttLUKI9eYxhgTKjdDWOD6qaDE/zJrEh
	8Sy5Zji6CDSL31arfuZbRMCiQqcL5DP1l4pn6CSy/EQ==
X-Google-Smtp-Source: AGHT+IH5bV7+H+EmGUIjzHVg3caXPHPiAR5sjZ1TOPIyhwE5ycPXN4xBytDNmBZxOwGLuFBA5Haj8Q==
X-Received: by 2002:a17:902:f603:b0:235:f298:cbbe with SMTP id d9443c01a7336-23601e44b41mr70110995ad.12.1749237622054;
        Fri, 06 Jun 2025 12:20:22 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:d02c:e22:e5a4:2f84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132ad9a4aasm2962217a91.1.2025.06.06.12.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:20:21 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: add gc_boost_gc_multiple sysfs node
Date: Fri,  6 Jun 2025 12:20:17 -0700
Message-ID: <20250606192017.439733-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Add a sysfs knob to set a multiplier for the background GC migration
window when F2FS Garbage Collection is boosted.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 2 ++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bf03263b9f46..931c1f63aa2e 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -861,3 +861,11 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
 		SB_ENC_STRICT_MODE_FL            0x00000001
 		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
 		============================     ==========
+
+What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
+Date:		June 2025
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Set a multiplier for the background GC migration window when F2FS GC is
+		boosted.
+		Default: 5
+
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3cb5242f4ddf..de7e59bc0906 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -197,6 +197,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
+	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
 
 	if (f2fs_sb_has_blkzoned(sbi)) {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
@@ -1749,7 +1750,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					!has_enough_free_blocks(sbi,
 					sbi->gc_thread->boost_zoned_gc_percent))
 				window_granularity *=
-					BOOST_GC_MULTIPLE;
+					sbi->gc_thread->boost_gc_multiple;
 
 			end_segno = start_segno + window_granularity;
 		}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..efa1968810a0 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -68,6 +68,7 @@ struct f2fs_gc_kthread {
 	unsigned int no_zoned_gc_percent;
 	unsigned int boost_zoned_gc_percent;
 	unsigned int valid_thresh_ratio;
+	unsigned int boost_gc_multiple;
 };
 
 struct gc_inode_list {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..b0270b1c939c 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1050,6 +1050,7 @@ GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
+GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1220,6 +1221,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_no_zoned_gc_percent),
 	ATTR_LIST(gc_boost_zoned_gc_percent),
 	ATTR_LIST(gc_valid_thresh_ratio),
+	ATTR_LIST(gc_boost_gc_multiple),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

