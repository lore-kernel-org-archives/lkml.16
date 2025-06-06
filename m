Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9099D1A9B3D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749247181; cv=none; b=uQd9RnG0SiIk3+WJoxQzRaGUsisz00jTrSuBgtRTrZBxgtkFpEoPJwJYrgZ+Md0gqoAvb0vp077pUx88bamiYzWmRnKZjPW/tkxZm5gSpft6aagMIYj0CbgFcEodNCDzvMsAOJWeljqF/OxLkt5lQbns7Z9ossZHckh16iI498E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749247181; c=relaxed/simple;
	bh=YiTEgPLwch4Bs+k/s9/DVupdd2uxEJ58BERhALJ2HC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MJLt6eWiXTUbB4iug0XFI1btNa+9EjW7qi1q/lVpFYzLFh7van2hJjoBoicHocV6sefLLCexGy5sSSJI6EmUk+mIYFuZ8TKDLXJEIEJuGFommThA2Hcp54dHcJ8DczCqzFpPmRgRlLLYZmHeqyb6knHtd4t3hFjVKrnT8WjIjEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0xdaHdP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0xdaHdP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234b440afa7so26629305ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 14:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749247179; x=1749851979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3zZWlbsZsWBDzSGqtGht4OhBTNgnXf0xW+1Vj0/hhfI=;
        b=C0xdaHdPcddW+fLPxMFpdAVqDtK4Y1Rq/43t7+xAl5YSKMrEktt5GZ3F7ieccADSN0
         zqPTbmiAsx5oNABK+94anlWqWWgQRBULpWSvx/PV6hqP10NfX4+uxCy7NuAy42OD4OKe
         tMcyI16JU2Yw5cIgFeJv575SEJADsX1sc7n5yDPMgaTjFfhpZQJEggbw6hgePrTK8XZB
         u2XMEyH8iQj2FqSuzfNNEYc3qnfu1TDeL70lqeZuFTxmNi8EG5gOfUyNA68NRfZNDhwZ
         sYNR26RdfoU4yovCoQZ/dlrEKMrlWi+1l2L/nvYEIFGqTbw2mps+heAiOpL10KKv8Oa7
         Pz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749247179; x=1749851979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zZWlbsZsWBDzSGqtGht4OhBTNgnXf0xW+1Vj0/hhfI=;
        b=v6qwvMpP0FVPOQkK/7DE0hPCwoe9NsuPOVCLqt6pqyRXYEX4Yxv5X7XW5wE+2jdoeD
         3itPLxZylvDWRCyIAt2cKsxCdDlBqJLX7O9xMXr0PsltXssRxlPfUVMUMf/tzqFjmxSb
         24y0JREOI68q1ZTsZ2OilnM/0CoLAZ0yDf/h15y3CPGXc88HjIR+t++krjsjcalxIzlp
         PBpvf4DvvIUgVI8wJ3WRVydbGjoH6OB72Hc7QGXtNTUXmEWxV/3SWdg/84k6xdK4+ENY
         fmlnenr8U0FYai8mhhrFxJSvQ877ZxE0yLDOq131WsO5XR2HnKkB8suTbFNt/Awyosr/
         iDxw==
X-Gm-Message-State: AOJu0YzH4pz1j84SvrD3My/9+zIkVW2AhhDh3nZ0B500KLNT1XN3w/+9
	QT1ObvFRAZKa+9BcAOZbF7oSClP449ASW0uEdFu5EOhPvz1o4PfuCi+dMjwnXg==
X-Gm-Gg: ASbGncvRnDqhhTM+3h6vgMGC7yTMBs1l7oIPN6imdhv4bOlEo6xs/85iYvTO82+QzAF
	ZWUwpNSfSH+q969TGUPZ/4kGnsXfY7en55Do9wcldbmtdydLG7ZNtv9SdtGqRC7z9A3g/xjph5M
	upafrjUZSSXcdlR3I4xu6jOnjHfZkwEgsOeA1uT2tOnibb79RY3tLEyUr2KIP8YkAcs5iDUYKkB
	/5jr/Y9ksJ5EPwzT+jgpkGcUaTyuR8EWjVInk+3ZAUs3pcFhB0yaVpFefcFK5lzUiyViUB4ztMA
	7VcChmL/l8mIYiXOniYBBCySXEb6KJbpenlhlslqeETwkD0N7H4PkKQnTugW5FSr3TAERfS9pXo
	sWwd8iVVcA6vY99xduBaezrus/DeGKGZhQtrCzLGn2lHd869L+agU
X-Google-Smtp-Source: AGHT+IGRsYTvhTtG9mBhuM8Z3ZXSmPKu2CNyDifUVuE0zlVIJSCgJ202lfmjd43VebliOXdmMiIbnA==
X-Received: by 2002:a17:902:e80e:b0:235:c9ef:c9e1 with SMTP id d9443c01a7336-23601cf0b28mr76283335ad.5.1749247178611;
        Fri, 06 Jun 2025 14:59:38 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:d02c:e22:e5a4:2f84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236035068f3sm16963425ad.236.2025.06.06.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 14:59:38 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: add gc_boost_gc_greedy sysfs node
Date: Fri,  6 Jun 2025 14:59:32 -0700
Message-ID: <20250606215932.1226604-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Add this to control GC algorithm for boost GC.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 7 +++++++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 931c1f63aa2e..b978d183f5b1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -869,3 +869,9 @@ Description:	Set a multiplier for the background GC migration window when F2FS G
 		boosted.
 		Default: 5
 
+What:		/sys/fs/f2fs/<disk>/gc_boost_gc_greedy
+Date:		June 2025
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
+		Default: 1
+
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index de7e59bc0906..31afee3af1a0 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -141,7 +141,7 @@ static int gc_thread_func(void *data)
 					FOREGROUND : BACKGROUND);
 
 		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
-				gc_control.one_time;
+			(gc_control.one_time && gc_th->boost_gc_greedy);
 
 		/* foreground GC was been triggered via f2fs_balance_fs() */
 		if (foreground)
@@ -198,6 +198,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
 	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
+	gc_th->boost_gc_greedy = 1;
 
 	if (f2fs_sb_has_blkzoned(sbi)) {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index efa1968810a0..1a2e7a84b59f 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -69,6 +69,7 @@ struct f2fs_gc_kthread {
 	unsigned int boost_zoned_gc_percent;
 	unsigned int valid_thresh_ratio;
 	unsigned int boost_gc_multiple;
+	unsigned int boost_gc_greedy;
 };
 
 struct gc_inode_list {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index b0270b1c939c..5de7cd5c4fd8 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -824,6 +824,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
+		if (t > 1)
+			return -EINVAL;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1051,6 +1056,7 @@ GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
 GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
+GC_THREAD_RW_ATTR(gc_boost_gc_greedy, boost_gc_greedy);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1222,6 +1228,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_boost_zoned_gc_percent),
 	ATTR_LIST(gc_valid_thresh_ratio),
 	ATTR_LIST(gc_boost_gc_multiple),
+	ATTR_LIST(gc_boost_gc_greedy),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

