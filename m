Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED62155326
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749998568; cv=none; b=tsbr97+UCJ9u5ejHMbuiAF6oofUjprjlpZLUdlSaSUK8V/b5ccoFHJI6HW/KYwoqSdesGu7l9OY2D6FkWgZ8gUTwqvme1jOjFQXCaz9ORB5Felg7ZA36B39OWr7HOnER473UMzpf9JGV5jQuVd/8sGz5pKaCqAToBK3obG3Z6EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749998568; c=relaxed/simple;
	bh=Jng+g8ztoIetD9iBZDKFygVqjhAs2D0eICPof3vwvCk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WhnTQ41+rpYWSMcf/hibBi+Jt0KTIz43T3PcRaI069KPNK88mJb11AGDBAljf/emZuN07fI1d7/ovTAVIUXA9QSUX19eT+IMLgbPHuHQtly229JwdDYh6f3P2ivD9gFKPDHWLGIwu5XiP37Wk5FwU5D/y9MzhVLazNDWCXWJF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3wF0Ptyn; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3wF0Ptyn"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so2417094a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749998566; x=1750603366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BYrmpF/Q6roI8L6nTRyQRvZjOfZjRGnDoVWGywhO7no=;
        b=3wF0PtynMTBdlMhI5E8a4vVcQxiPkLwhGcE8oGBpPAOj/OtWOfpL9XFYuuZAa4DnK2
         En3Yd9GI2InTsF0qq5iLouOSTdpQ3ynblMoTwv0SCNMesPfMRAXVc07Hn8+CFYjCKzvT
         b0RKlNBpg3TC0XwhpkVgiIFzHJS8h+0id21EcNC9Qyy1Zc/J4DatmkJ0jS1ybrG1U8QF
         ANzhLT5TwLP89k2RlcE1lSXntqiitD3F5+NDP9yq/Rhtxe4uZ34URW4imXpOCLt6MMR9
         HFOzSxCMIvXrAjsnMPiDDIvqW16FOTe+ogf+iJpK135WS2V2fou9LcP817gGFh/E1VXn
         8d3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749998566; x=1750603366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYrmpF/Q6roI8L6nTRyQRvZjOfZjRGnDoVWGywhO7no=;
        b=XMsDtH62HodYPuKRTqqIX4EmHVqp3RABn1NcD8zon4xrh7DiyGw//vu/43KxQPD3IG
         lwW7+PAqTMvKvy/QBwbr0oPtGZIOZZlhs+TY6Yx/YCZt23ukQ/E1CJ/qCOA0JBW3Xxnf
         VzBNJvmol0N+KVJKFtJaNUQZlUJR3xDFcrhhgfX5jurzyk7uuR5LebUU7wQwqcfuYylG
         Nbxnsnu0glyocpTNjmnBz22oLfQSUavaNlFDitI0kQC4yb8MGnfHip6dLbdbSkSljUrR
         2AmkMB0ymuAnKC5mEoU9lpBtr+qTh4npsKLGy5XTEq9l0XF77AeupfgIoFEVKrLbRPV2
         btEA==
X-Forwarded-Encrypted: i=1; AJvYcCX5WGwZgG9CyaZgpxq0M1b8ag7MROgHbXxmq4Cch95arys88anp/UHOIKoERGCSN3KbcxlkuTf1RMlnwaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmlVUX3sm1OpPeSBTH8RmfRFz8SdrT9Z4zaeEWeXtervx2uvDq
	8PnNR3aOAN/osrhEju+tXvlYbf7jFhMV4k8gYlHz1d+4KnML8BJjyjVHO5YvLYD9LhyFhGfgVr2
	AcKW229Tm1Q==
X-Google-Smtp-Source: AGHT+IFt++TjvatBBJIzcufhdDysgmNuitmX6MQe3gnXirWSE2I2TvPCnUxSEDsAPYWrjK1ujziE4tc4e6Uw
X-Received: from pfkq14.prod.google.com ([2002:a05:6a00:84e:b0:747:a8ac:ca05])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9006:b0:21f:545e:84f0
 with SMTP id adf61e73a8af0-21fbd5e0e49mr9384276637.40.1749998566653; Sun, 15
 Jun 2025 07:42:46 -0700 (PDT)
Date: Sun, 15 Jun 2025 07:42:35 -0700
In-Reply-To: <20250615144235.1836469-1-chullee@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250615144235.1836469-1-chullee@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250615144235.1836469-3-chullee@google.com>
Subject: [PATCH v2 2/2] f2fs: use ioprio hint for hot and pinned files
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
 fs/f2fs/f2fs.h  | 19 +++++++++++++++++++
 fs/f2fs/file.c  |  3 +++
 fs/f2fs/namei.c | 11 +++++++----
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3e02687c1b58..0c4f52892ff7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3440,6 +3440,25 @@ static inline void set_file(struct inode *inode, int type)
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
+}
+
+static inline void clear_ioprio(struct inode *inode)
+{
+	if (get_ioprio(inode) == 0)
+		return;
+	F2FS_I(inode)->ioprio_hint = 0;
+}
+
 static inline void clear_file(struct inode *inode, int type)
 {
 	if (!is_file(inode, type))
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3eb40d7bf602..a18fb7f3d019 100644
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

