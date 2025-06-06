Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B4C6A8D2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749237343; cv=none; b=ZuWf+4JfErdn3SJHfshCrtfjZ04IPLXAjpl/riY05zUojb/mXRzK4I3AkkQyeBjRN+CJfw07oE48a6hCQTjNwiQ6YJJsCP/N7daexI5EOk+lmPwY4w33MF29+QpszH3NlQtlLa4i7tCzC9Pz/9ueR6BSLoFqBbSGugqn+DGXfx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749237343; c=relaxed/simple;
	bh=jeXHvArMrM9neq3TGbvo4e760e3EC3o7dW/X/6sAqfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWV14t1In07SZrkiTZXOdXCywpM1MfD8QS74D7fNJ/P4UL2i3zL30l5540O7H2REMb1VMrbJkW0VOOw8OUCioIC10lXSgmoaEjyAGCSKPqY0r88Nx9UUpwPwhInCaMoricwfdmAI43ukJ6rQY+lhIODjeAFR+4h/9Ai0hmSDv6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeIwKAme; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeIwKAme"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1941539b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 12:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237341; x=1749842141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wjMIOt/LXFQebzmgX0Ga8a/wOAlhCkmqYvTYDXKBEUY=;
        b=CeIwKAmeloG1FDVj+xd4nLOB8Lo/7NdAelMJ2FG1Xi1pwhQMDlt1I17pgrkFpnbhGY
         WwL06NR57qc+QIIA3I0TWqxRilDQHT1ewHWPuQsg1oFErSh7vVO5hSlMQ1gBwFnlcd2u
         V9yHA91wDLsbR7bIdkOSesHNVuKlJZpZnqhjdTLS+zCFRbaZ6oiNsoSvbShaXrP5TAzz
         hGa8KfWmFGubdT5mUUg8j4QEoDd3X46C+qc+uqQ/yxKze/bIORXBXxTqdLg4DgDdiPPp
         h1RSOh6ygvFOIiSfVbj2zR6Tq+Byd/hPNHScuYDsccfN+UUdmg1wkOtcBEGUCDuas/kV
         tkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237341; x=1749842141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjMIOt/LXFQebzmgX0Ga8a/wOAlhCkmqYvTYDXKBEUY=;
        b=NekMF7H2rlxvJTLHSZrVWUGoUGmmHpLUkUg1CIJrGNyMVTZq2jjrE1DMbmtXYOs9sS
         vm7knKaS3kOwsGTDgzeTI7zstJe+jYn6u2j7JCyb3vm09CApPdQbQmmTiXcKWIuApSMT
         boO5wAkGCkaXRVzuCNoEbDjYfyrUipAZKhdCrAa0rz7NsIa5Bcvi3J9/m93s/TkqbUy6
         c3cpTV+P1uT100PcYXiLXNWwlzGMT9SbL2+TfTGZ63sW6c1YjPAKxoKZksZhzUtn1PLD
         5ItYNDHjOdkH7Btrja3S3uzrC4ffWViYydSIgOK07eDqhMFgVL7PMNpNCGDsEWeKHZHo
         +jDg==
X-Gm-Message-State: AOJu0YzZhZtVr7yF4lE8kqXMFBcWkItgVAc5lMMBHUrJESQuJLwNNGXd
	PGz1LKhE3sPH6EcxyHlmDEEcujgpzMzJmI1N7+WoHk6jXizJkdXPl2vs+IYUpw==
X-Gm-Gg: ASbGncu7GsPxdNjHYt/VDccHq12UBZd5SakIHZ+o9JZAb9mMcAuh1xd1pxd6lqNlcqA
	jQLdJjy1g1wnXADd+yMlhA2xl+ewN9oVbZiRS+ibQjKPJcdUpfxFgwPE9S+uBDNYmwtDQE1enTC
	vEMNGwZgLFfMEr7XPDJIy7tcvxtKF+xAZ0N+d7JJwdX4824whxMj1V09fSBCvVjinWBh9nLGSLi
	2K9Lsw2KKFxQ/o1utSRcsxEx0nLhXMznQK2oWAR7+oN2iIaVdy5ddpe6NkWXmB0VLC4FiLqyXIN
	nuVNIkWMvPT5/Xj99p/numOho1+XcJ++PjRq5Y/kBjWRX1McwZMbMMpr7Uxn/6Lw46ICK6UzKA0
	TMkPqoRRSCsX0veZdIUJy1O71PM5jyNhaIUJDmRyn1att8yA3jgnI
X-Google-Smtp-Source: AGHT+IHsnz+YKTH4F0OOvHcKBTY/iymvbEjaxdXetM6ww7FFyxe3sRF6r6KB+AZkKu0uhD4foJUewQ==
X-Received: by 2002:a05:6a21:b8f:b0:218:bb70:bd23 with SMTP id adf61e73a8af0-21ee31c1655mr5218493637.42.1749237340835;
        Fri, 06 Jun 2025 12:15:40 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:d02c:e22:e5a4:2f84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b606sm1680804b3a.67.2025.06.06.12.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:15:40 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: add gc_boost_gc_multiple sysfs node
Date: Fri,  6 Jun 2025 12:15:34 -0700
Message-ID: <20250606191534.438670-1-daeho43@gmail.com>
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
 Documentation/ABI/testing/sysfs-fs-f2fs | 7 +++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 2 ++
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bf03263b9f46..0f343cb5cc17 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -861,3 +861,10 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
 		SB_ENC_STRICT_MODE_FL            0x00000001
 		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
 		============================     ==========
+
+What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
+Date:		June 2025
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Set a multiplier for the background GC migration window when F2FS GC is
+		boosted.
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

