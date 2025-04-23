Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387D269AFA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441383; cv=none; b=KLMyKhVOiAmL4rDJ5MLU0GLUOy6VjiaNbFFzlYe6SrRJbzr1CoVcxWQjfospR4twj2JCvnazLXLMue1A/dZVel/0oq+LPPRcygLDBdOuuMVtidHmYi6TjG47QRKNYT7dH1RgFCYMLmtRH9/72NG+lepv9lgJfX0tbjYkrXwKetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441383; c=relaxed/simple;
	bh=KCpUHCyh4WTX+8nH73ERBVg00vbmAwZ3SP/sw6+aJfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VS9vX1D9IhOFjCFP31FA9i7BV/DIhzUr2o/BCFKVJur/9ycyP4L/qcbIgx+qY5CK0g38BE2VBITP50Q/bnkU498aWtOk7KtlBxnqecESarAQfozYXQhcLJ350aaHBcSXsREYXiHVr4qC7DD7Nxkgvhagn8mh8t/kTB3pLHVmYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebUOZiLR; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebUOZiLR"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso242441b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745441381; x=1746046181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFkkPBXFFdFSrV74lL2RXijCFkxgTbW7EfheadDhMlM=;
        b=ebUOZiLRl7NtMlUT6/XdWOo2Kx0AtoSTrcr8QXx9U+nLgQu7ZrKI9otRNUP18xQNoR
         xOri4/3K2ooKjyaKu+irVIfJ76rm2RpMXeT7RxO7ITCPEZ9v4GnLOkZgbbtl44LaYowg
         Aq5iLMF4rVktjA5HP7cWnLZav4rnGFcnr4DPm5a3V0lYvecgwk6C689YEPQbZnWKDz0C
         R/NNsYkEsfjAuTGPQPW5yVIVdhCBIL1q5pRWY8nGIMChww0ELMg5l6Wk2vGabRx+CJag
         bDtkJrYUxd05qH6O8iZKBbwvp9BNAmXwAvWadVj1okuqm5eXZcIAQV+VbL16K5pT2bex
         SIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745441381; x=1746046181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFkkPBXFFdFSrV74lL2RXijCFkxgTbW7EfheadDhMlM=;
        b=SwRQAxPL4n6rXzWdXK+4mm6dEL5DRXFxQLkzLAgH5df8tNm0VF3/jNJABU8Kf/NPDM
         IguquisSaTWyAn/IpSHZ9jvb5G3DUwABQMueaTn1pFN3VqTiYx5Fuo4h/ntYE9TbWEHI
         6eeLEDnNIjL4pmKqBfTj3qjQipFpxT/08C70c6ZEKmcpGSSlsKGhjYf7iDxrTZ/L+Zpw
         8wHPIkHWqCZY6iVApTFNj29NpN/KhSfFSofqW95tHwQwlzyxSHpbK9NfOC6dh54NB4FF
         KubxzMu2MzR4TATdcVcQ8LFJJM/tkpK8YKa8/lsmQLSdB9ecWNTcUjT5igFFtIseyZFa
         Zaiw==
X-Gm-Message-State: AOJu0YzVlwvAn+bi9vkmx+3fXpG5e87oPcv4wfQK78X3LlnpC12NvGqL
	JPKPw2E2KwfZtoWfbVOLCUnSDxHG+qFNVRSdhJKC2f90QbC0UfRe17Samg==
X-Gm-Gg: ASbGncuPmcl0IbMLXH6xywh+iL6qK/0LWaTljosqAjMFQ1rWqhQzrGk7x+lDCPIAPxd
	CJGd82EVh67JGP++aemVzYwLnn/KSl3FNNHRa0BSKO8ARaSZqSxQqKFiMzeUEWlrEMGtS8/0ANe
	mhxZI1lKWxMZK40yFs3rhEdQIdwOfu3HNQKIf8wmLzb/aNmT+G6fsJuyC0/2XY8TaGjmDiVuMm3
	evp0ToupWv3IBpKHlgRm2mJV4QrtgNeDp1gv8HweFDhKmLIeROxP9bywlwsgPEkeYF1nVYADQbb
	I7gT+MxrPruXY6bKGgU1AGPuY5ip7bsn4oMnC/XUNilJ2tbCnJtqrTq1KCKqRflHhVwDfFw8Hjo
	e3ArVX9rvymk2zgr0B3vUnMGglgbtTulj
X-Google-Smtp-Source: AGHT+IFwjUzOpbdI9GzZmAWxW0GeyrpeovFKMtz9ez3tSWXCTpH3YxHA3i6KQYceOr19FwuIGctLFw==
X-Received: by 2002:a05:6a00:3406:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-73e24606fedmr251754b3a.9.1745441380729;
        Wed, 23 Apr 2025 13:49:40 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:7dbc:3d73:1245:bd40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acaba0sm825b3a.169.2025.04.23.13.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 13:49:40 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2] f2fs: handle error cases of memory donation
Date: Wed, 23 Apr 2025 13:49:34 -0700
Message-ID: <20250423204935.2335000-1-daeho43@gmail.com>
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
v2: use proper error code
    rename FI_DONATE_FINISHED and use it to fix race conditions
---
 fs/f2fs/f2fs.h     |  1 +
 fs/f2fs/file.c     | 23 ++++++++++++++++-------
 fs/f2fs/shrinker.c | 13 ++++++++++---
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1576dc6ec67..01ee8bbb5c84 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -821,6 +821,7 @@ enum {
 	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_OPENED_FILE,		/* indicate file has been opened */
+	FI_DONATE_FINISHED,	/* indicate page donation of file has been finished */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index abbcbb5865a3..61b88431fd43 100644
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
@@ -2493,7 +2494,12 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 		if (!list_empty(&F2FS_I(inode)->gdonate_list)) {
 			list_del_init(&F2FS_I(inode)->gdonate_list);
 			sbi->donate_files--;
-		}
+			if (is_inode_flag_set(inode, FI_DONATE_FINISHED))
+				ret = -EALREADY;
+			else
+				set_inode_flag(inode, FI_DONATE_FINISHED);
+		} else
+			ret = -ENOENT;
 	} else {
 		if (list_empty(&F2FS_I(inode)->gdonate_list)) {
 			list_add_tail(&F2FS_I(inode)->gdonate_list,
@@ -2505,9 +2511,12 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 		}
 		F2FS_I(inode)->donate_start = start;
 		F2FS_I(inode)->donate_end = end - 1;
+		clear_inode_flag(inode, FI_DONATE_FINISHED);
 	}
 	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
 	inode_unlock(inode);
+
+	return ret;
 }
 
 static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
@@ -5236,8 +5245,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
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
index 9c8d3aee89af..b88babcf6ab4 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -184,10 +184,17 @@ static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
 		if (!inode)
 			continue;
 
-		len = fi->donate_end - fi->donate_start + 1;
-		npages = npages < len ? 0 : npages - len;
-		invalidate_inode_pages2_range(inode->i_mapping,
+		inode_lock(inode);
+		if (!is_inode_flag_set(inode, FI_DONATE_FINISHED)) {
+			len = fi->donate_end - fi->donate_start + 1;
+			npages = npages < len ? 0 : npages - len;
+
+			invalidate_inode_pages2_range(inode->i_mapping,
 					fi->donate_start, fi->donate_end);
+			set_inode_flag(inode, FI_DONATE_FINISHED);
+		}
+		inode_unlock(inode);
+
 		iput(inode);
 		cond_resched();
 	}
-- 
2.49.0.805.g082f7c87e0-goog

