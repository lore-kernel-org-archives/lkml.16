Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4AF1A76BB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349097; cv=none; b=s2g5ZCoZLXv0N2NgUD38SYrvtJcu8oxW2fP2FtFpbUvmuZL4+MaCQ974HbZykpLOXy7PVURcAvpKl6SgfNzDmKVO9hp882nAu1bAvOK6AQsKTqc7iL0kkXiw61oI/IYahVzRO3tSYc+ukIQgeTiw5FAn3pYXy+Xi/kHwp4v5BrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349097; c=relaxed/simple;
	bh=5XPctuWNebdP84Ia6t9RRx9Mez7WNt3sIk55SG+PIA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjDi3kXb8zrHhMK/6E2h/CAT2/+2uPFLMUpspNRdeIu+bjg6LF8OFk7WitUWlSadKs1txBrKimIQcRPfI6pkVlsiGkT7hPmZ1AVYrWNvCay81+bZWW3R1nGbywIQ26Ddzh7/IF1KdrmtW7zE2BmSBPZVdLFg+dc5epkKYl/Ha0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8NaYJJ5; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8NaYJJ5"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736b98acaadso5336394b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745349095; x=1745953895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKTihN516LJ0PJ64bQu6hhA9LAhCer0ZXXVQAo8No4Q=;
        b=I8NaYJJ5J0ve37FEcHFc3kNrPdMr5BAj4U4LMqKAgIEYJFRJG79bH5AETOjBcxtSyI
         dPVXE+IwRKGL4cpI1nvVZ0kg2Lrr6EEImZvbvHtrDnztgyD+9IW3Gt/fSQBOE+x9p4YK
         PeL+uRZCy1HrOqkaymUtHrMae4AyLF2QZntHDE++O9apW4aFlk0KbA+h0RC4Ks3S10no
         ZGJ0CrfPJ9LUaCMKArp1e1ynOEgay0/4WiOb04TKF8dVn6xhtLVjsG6XQz7uuLhVXieY
         wzcDdSin9rDh3ZFD5/opJgetU5oSYYr73FLKxQQVrLjLNeV4LGC+vRTeahfq2+weJvsX
         28fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349095; x=1745953895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKTihN516LJ0PJ64bQu6hhA9LAhCer0ZXXVQAo8No4Q=;
        b=B8M1TT1/UvomJJugRqSOvv1FYaSgqWdXVTLR9wnARQEo5PAj0dKIKSIPKRDviztXX2
         kxbcluJRuibxB4MDevfSvWmRqhARxbKs516v40xDBFYxfoHYSUmQKe6EUuRv2jMRjS8U
         WbOFeYvyt8gVKPb8LcpWQhNHB0a8fCeqHTeJZ0RX4ZTnIdiqFz6EJj8WJTQdBnVNUryt
         kkYtonpS2OSHCf4ODqzwCAuwnn41rOw5Wxp8K8dD/yPbaVCNRNti8VvWBqzPjmDju8ab
         0tbAixxWwO10X7i6w0zjK8sJGh2tKIGbPNqFAI3gQFQPXpfxnkz69eLEj34R3z3q7M/P
         v6TQ==
X-Gm-Message-State: AOJu0YzxOY6fDQxamjMQRIf/Fxi7W/70TdDyqYXWEg8k22pVqfUAaaW5
	MaV6kzp+XfUchbGTw3cIPjjc9nhhawzWTQKzeaNgInzh166M0mI8NhDgOw==
X-Gm-Gg: ASbGncs2RrriVNAMMgFa3qS1tTxdowPGPag4yBjzKKN+mWkeCHC3k3MbicJfb7Pn/c6
	lB/bqaa1IGbB6kflKJPC7nNHFOstjPA4HR33MWDn3CsgpYcl0QPukzV9kZwcLwNH1TnD7WGMBA8
	uMGn433t+iVCmsmkf7jk9OIBzPfwwi0jtrOVEUBG9xiDBVqjBQQfhrlStuF60rjpRW9s1Pjbeuk
	Cyltd+lvr7MyfQGOlECumZVKc7sWFW+TqRt6gRpuTTaIjRAF4iDnvlBSRKGJiYOa7Obny4ZOsGh
	3AfLgxpAPnZTDX8Mar6T9xpxoozN6SQrt4Cc6yaXl4WwV8gknQ0XLmc8U9G4Zntj9qhGqSCIK0H
	vYv9ENrIlTqg3A6Yx1yRBPRfENkhNeiqAKnlF9Vae
X-Google-Smtp-Source: AGHT+IELeYCox8pUMEvgPe7KvcZ5qh9tJ4MSDEqFRxHZRuMrXgnFrTLQ5vsxj1wEndQsJ2TPwFBM5A==
X-Received: by 2002:a05:6a00:e05:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-73dc15d6751mr20881055b3a.22.1745349094784;
        Tue, 22 Apr 2025 12:11:34 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:d927:9b9c:264:e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c1c40sm6150317a12.33.2025.04.22.12.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:11:34 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: handle error cases of memory donation
Date: Tue, 22 Apr 2025 12:11:28 -0700
Message-ID: <20250422191128.1346260-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

In cases of removing memory donation, we need to handle some error cases
like ENOENT and EACCES (indicating the range already has been donated).

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h     |  1 +
 fs/f2fs/file.c     | 21 ++++++++++++++-------
 fs/f2fs/shrinker.c |  5 +++++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1576dc6ec67..e4b39550f380 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -821,6 +821,7 @@ enum {
 	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_OPENED_FILE,		/* indicate file has been opened */
+	FI_PAGE_DONATED,	/* indicate pages of file has been donated */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index abbcbb5865a3..0807f8e97492 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2464,19 +2464,20 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static void f2fs_keep_noreuse_range(struct inode *inode,
+static int f2fs_keep_noreuse_range(struct inode *inode,
 				loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	u64 max_bytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
 	u64 start, end;
+	int ret = 0;
 
 	if (!S_ISREG(inode->i_mode))
-		return;
+		return 0;
 
 	if (offset >= max_bytes || len > max_bytes ||
 	    (offset + len) > max_bytes)
-		return;
+		return 0;
 
 	start = offset >> PAGE_SHIFT;
 	end = DIV_ROUND_UP(offset + len, PAGE_SIZE);
@@ -2484,7 +2485,7 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 	inode_lock(inode);
 	if (f2fs_is_atomic_file(inode)) {
 		inode_unlock(inode);
-		return;
+		return 0;
 	}
 
 	spin_lock(&sbi->inode_lock[DONATE_INODE]);
@@ -2493,7 +2494,10 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 		if (!list_empty(&F2FS_I(inode)->gdonate_list)) {
 			list_del_init(&F2FS_I(inode)->gdonate_list);
 			sbi->donate_files--;
-		}
+			if (is_inode_flag_set(inode, FI_PAGE_DONATED))
+				ret = -EACCES;
+		} else
+			ret = -ENOENT;
 	} else {
 		if (list_empty(&F2FS_I(inode)->gdonate_list)) {
 			list_add_tail(&F2FS_I(inode)->gdonate_list,
@@ -2505,9 +2509,12 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 		}
 		F2FS_I(inode)->donate_start = start;
 		F2FS_I(inode)->donate_end = end - 1;
+		clear_inode_flag(inode, FI_PAGE_DONATED);
 	}
 	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
 	inode_unlock(inode);
+
+	return ret;
 }
 
 static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
@@ -5236,8 +5243,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 	     f2fs_compressed_file(inode)))
 		f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
 	else if (advice == POSIX_FADV_NOREUSE)
-		f2fs_keep_noreuse_range(inode, offset, len);
-	return 0;
+		err = f2fs_keep_noreuse_range(inode, offset, len);
+	return err;
 }
 
 #ifdef CONFIG_COMPAT
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 9c8d3aee89af..1fa6619db40f 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -186,8 +186,13 @@ static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
 
 		len = fi->donate_end - fi->donate_start + 1;
 		npages = npages < len ? 0 : npages - len;
+
+		inode_lock(inode);
 		invalidate_inode_pages2_range(inode->i_mapping,
 					fi->donate_start, fi->donate_end);
+		set_inode_flag(inode, FI_PAGE_DONATED);
+		inode_unlock(inode);
+
 		iput(inode);
 		cond_resched();
 	}
-- 
2.49.0.805.g082f7c87e0-goog

