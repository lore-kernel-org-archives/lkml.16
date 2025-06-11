Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333182C3255
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749685143; cv=none; b=WU8FzBJZspwA/Qua+K0x+YgsCBafuG2fdfHgFSv55LrHfm/21aGSrbF02hbO+vvHavQOsI3A0c0hFOHU4Fds8gAGMCU3CD5CIlaLAvokufRVUWhorhiCL0xTcPKvMp/O/qpQv4wDyfjuUBOEysc5+e9ve4IYO6+QZ3BJ+GMQZVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749685143; c=relaxed/simple;
	bh=fUO0Pir8A25PL+mB49RfS2HoZ0HGrF8+mnwHkgy8bsQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q+iP1H/Lbt+wf5rlN5DTHdbWtTFoRvdHfEu0dIdwW6h2G+EuUWzxCXjn+192QmA+YBKszaDtUgQodQNWk8SMu1MYJjtprtW7v2gSn+UfudwLKEojZo6iqDbjPBh3pZ6FxYacQr15E+ZsRdtOIKq9tTrOr5h+D6dAfQHH27OmpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rdCmoyl8; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rdCmoyl8"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2f02cd1daeso169330a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749685141; x=1750289941; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mKx7Yg2jyt4RiAGTCJpC9bEvueSIsR5D/X+k7Jjceso=;
        b=rdCmoyl8fdwCy2pfL8RhxMAeX4vQZOx9ljS6aNdz8eQ0DQJSQGyALlugeWRPoInXbj
         6KhxOpdFcrFpmktUvJ40v/XktK14SzcLufX9R6uj5BKTmGiOQL3TjC0igPySoCusX23u
         h6zzmgSyGu3oZMJB3jyKXnO5V5ihDEGvYcN51hSzeHTbVQmwM7BTnaqcylSJsrPNIL3f
         +Yfwakq1yyxUwuYUz4xaaJJGgSKev1lwtn4REx/pX1wTAq1WGwduuvQGClNb2FtEvHQI
         LUTvPi+AvCJ2n7B4m5iYurUcND6Cj7NKs9U12KZxBXytq38AUdynZs4ju1kE2j2Lzq1F
         Ocqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685141; x=1750289941;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKx7Yg2jyt4RiAGTCJpC9bEvueSIsR5D/X+k7Jjceso=;
        b=RFvJxdyCYcxaaahU+v5rqsszw8qIgMXuS1xTO817o0XChG0Gk3IiDkpMSQfUySy7wV
         Q1770s5D+9708/Ug36Ep1+r0LEjtwN6c8EFSYa3fhZztAjkOt4DTB4EtKmB6l4JQpg0Q
         aYHblloukwtf5fvSLTMVCy0s93Ylt54v8gmaKjVcvsCFu1qJCRx5FHmrHcRmNAp10bz4
         dP43xpI1lgdd7bTDSznXYvLmO4IRTTumzlCHLmvIFfTd/SYv5tMVIDNMlnUYog5+d837
         y43yVLdR3hCDpx84AACVG+X6fsQdDqLxb93KE9cfgW694M44memCmYqnsU5IyfJ6FIHo
         x4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5pOzwEoGh6a2F7/nZYYsaha/IaMta7xcIGYd8hwW6KKU1KsFL4t0YD8Mn92ni4tVJQ6SfdTw7qwrJPX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRPupZJG3wMoslt0L7wNb8hCCj2QeYLmhCwgdGMNUI14sei2+i
	Pjs4hguAj75PeijNHbx0UjT6m7I5eHKi2m57qsNn28fb3iYHNCH3lcT6eiFuzrDsDo2z/uZTrTy
	kP++I9vhhbw==
X-Google-Smtp-Source: AGHT+IExOy2ZqSqSTK/clN9/wYzarZU68QG4F25PAWsHxKFVOwclfiyTYH7HAxonpwyrzvA47ScUnqZ0Yswr
X-Received: from pga1.prod.google.com ([2002:a05:6a02:4f81:b0:b2f:a31c:f7bc])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7283:b0:216:1ea0:a526
 with SMTP id adf61e73a8af0-21f9bc097f1mr981622637.40.1749685141492; Wed, 11
 Jun 2025 16:39:01 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:37:06 -0700
In-Reply-To: <20250611233706.572784-1-chullee@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611233706.572784-1-chullee@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611233706.572784-3-chullee@google.com>
Subject: [PATCH 2/2] f2fs: use ioprio hint for hot and pinned files
From: Daniel Lee <chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Daniel Lee <chullee@google.com>
Content-Type: text/plain; charset="UTF-8"

Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
on files identified as "hot" at creation and on files that are
pinned via ioctl.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 fs/f2fs/f2fs.h  | 21 +++++++++++++++++++++
 fs/f2fs/file.c  |  3 +++
 fs/f2fs/namei.c | 11 +++++++----
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 162d79a3c1a5..0b05b3b6386b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3441,6 +3441,27 @@ static inline void set_file(struct inode *inode, int type)
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
+static inline int get_ioprio(struct inode *inode)
+{
+	return F2FS_I(inode)->ioprio_hint;
+}
+
+static inline void set_ioprio(struct inode *inode, int level)
+{
+	if (get_ioprio(inode) == level)
+		return;
+	F2FS_I(inode)->ioprio_hint = level;
+	f2fs_mark_inode_dirty_sync(inode, true);
+}
+
+static inline void clear_ioprio(struct inode *inode)
+{
+	if (get_ioprio(inode) == 0)
+		return;
+	F2FS_I(inode)->ioprio_hint = 0;
+	f2fs_mark_inode_dirty_sync(inode, true);
+}
+
 static inline void clear_file(struct inode *inode, int type)
 {
 	if (!is_file(inode, type))
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4fd45e94661a..95a3b4b59dd1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3496,6 +3496,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 
 	if (!pin) {
 		clear_inode_flag(inode, FI_PIN_FILE);
+		clear_ioprio(inode);
 		f2fs_i_gc_failures_write(inode, 0);
 		goto done;
 	} else if (f2fs_is_pinned_file(inode)) {
@@ -3529,6 +3530,8 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	}
 
 	set_inode_flag(inode, FI_PIN_FILE);
+	file_set_hot(inode);
+	set_ioprio(inode, F2FS_IOPRIO_WRITE);
 	ret = F2FS_I(inode)->i_gc_failures;
 done:
 	f2fs_update_time(sbi, REQ_TIME);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 07e333ee21b7..0f96a0b86c40 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -191,9 +191,10 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
 }
 
 /*
- * Set file's temperature for hot/cold data separation
+ * Set file's temperature (for hot/cold data separation) and
+ * I/O priority, based on filename extension
  */
-static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
+static void set_file_temp_prio(struct f2fs_sb_info *sbi, struct inode *inode,
 		const unsigned char *name)
 {
 	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
@@ -212,8 +213,10 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	if (i < cold_count)
 		file_set_cold(inode);
-	else
+	else {
 		file_set_hot(inode);
+		set_ioprio(inode, F2FS_IOPRIO_WRITE);
+	}
 }
 
 static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
@@ -317,7 +320,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 		set_inode_flag(inode, FI_INLINE_DATA);
 
 	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
-		set_file_temperature(sbi, inode, name);
+		set_file_temp_prio(sbi, inode, name);
 
 	stat_inc_inline_xattr(inode);
 	stat_inc_inline_inode(inode);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

