Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F1381A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521391; cv=none; b=X8g7aCPcuZNRYUHQnINTKP5hPP850XXcUOnbbus/mumESJQk8eUTjWIITuIJ2EkcG9Zg+ayRYHAuNI5NCtApYdKDCkIg1vAbVYzrCtS3a4ZJp6PxdrPqS6rwSSNiJoWIja+VwxfWmC0UU2n7OGjc7W6h3mw6wGQxpL8+GamTwDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521391; c=relaxed/simple;
	bh=5/nslLODj2vZJkViJjsPxLNg0iwKhOfjrM1t4Q4wrac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sec8uWlyjIjFhePkVbLljqxzTwRvmELlSnbdlfI2iaX6x8yOfDC1ZPqhFJyER8ztxHj9EEScNxKak8pfh26SmnDsGbhYDoFvEDzZ9kfsr/3JnYl6NlFUf+1okMVqAklBw52aGPGSAo76DZ0SeImfMeQ1XV3RA2so0f3r71jUNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY429Nl4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY429Nl4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30362ee1312so10035028a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743521389; x=1744126189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN9EoU3NOIXLHMOmv53dJjYHmNGZXjtjYsDTIPQ6mb8=;
        b=hY429Nl4pM1AB1wrl052HPThogHC4cPdFq4p9CKJCH1RnPvysLyvGWApPSXf7Wg8YO
         VySxYm1Dl2juIfm1fvDQPP8ZhyAOAM/U0BTbj+xu7ltVR/YxdzQcXMNiYktwjH6ZNLrd
         f9ZzThgxIrwz7A5df8egLuVl5edhVXlLlZvbmhqMojhTerCpp7CWiAcZIAbQ4u62WnZv
         vHLIo18GI0eFaoj3lITGYN/5sO2/wasNeK6fW+s1UK73ZW+lFKUutpOlWxjMybCWByiP
         qfJQpEEHgk6uloCSU7Ijlr7XIu75Q3tSBlBrI2Ub24s8HQRLEa+Fe1Vq6eX+0tD/W4qK
         i3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521389; x=1744126189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN9EoU3NOIXLHMOmv53dJjYHmNGZXjtjYsDTIPQ6mb8=;
        b=lHvPxx3Y99tgfavJnxNmoeVSLcP17fyJ0aInYkXzgiooe5Wx/pJpWn7qatS5AWsusT
         XmXSKDQWE3beYorg2tD4k84p3EfKeRP0m3OGTh2TQ4nYhHJUgMXyvfrrLSiwPGlxZFJw
         hutbdNJ37WHpCKEyydSnRAgKbk1PmZX03AkaxOhsvoLaw9iJXuhAKv8Fm9HcZvJn8o7x
         ZMy5VRqTxoMQ/ApaNEB4XlHZjq2Y4hQGy1dmY33xqLM7t+wQ++pzuAVEzMPD9k13YcB/
         mpUxaQOT7oi9XDwuXyaIUOFRfSXrvjmDQYQeCWWgxdyZkbS330WIe0vdmYlY7faL6Fxk
         MPCw==
X-Forwarded-Encrypted: i=1; AJvYcCVrvhKMC118HBG/2QSxsIwBjpFnOZPNu/ZVK7APOUKCU113s/224P7HXK5m4TG8b6Bfng2c/4+x7m7V1Rs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrzuz2ZMyEIZ2x1DOs6VKLFFl+p0q7l3z9w6778Zd6Wb80tM8R
	4C2zmLKfJycx9NendHptwMXXIm83FFPj0+QoEJ75ETY06gjQRwQ+
X-Gm-Gg: ASbGncsRrFX0TtXiUPxXYFcL+UEsBkyIk2fp9Rt8ykJzlGguiZGJ6vwvkbKC/dsG9aM
	cQblmwnwH+730pag2c3OAvoEr6nYgrV34qIE/QneQxqWH3xVic4or3vDUm9CwoYOe55YeEdVqeF
	9A3ry4aWViDwar6ZzHXjFRc6js8Xx0x/Pz6xRJuhdUgK6Ow+dW7NURJ1YNarlXnBrMSjIiDFgx3
	3P8Ejl/+wlXrk2YtL1MmImeVjYO32FqVVnQQn/CfZP4tUXxDp/9HFj4Zz0bR3eqlsN3RICbfxMc
	UzNYZTkTCMhV8N1Pe09TuqGIy44gKYw7FjC4T8Cd4er6
X-Google-Smtp-Source: AGHT+IHbLzLyxoXgCDQb88U11Dt/J3tK3R1kD5HUq7qdWDEwGWlrdnlTlmhdMwaV2IS/+9lAfTNmDw==
X-Received: by 2002:a17:90b:4b06:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-30531f7a6cemr15420719a91.6.1743521388814;
        Tue, 01 Apr 2025 08:29:48 -0700 (PDT)
Received: from pop-os.. ([49.207.199.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d430asm11795912a91.35.2025.04.01.08.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:29:48 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	Roman Smirnov <r.smirnov@omp.ru>,
	Edward Adam Davis <eadavis@qq.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	jfs-discussion@lists.sourceforge.net,
	syzbot+b974bd41515f770c608b@syzkaller.appspotmail.com
Subject: [PATCH RESEND] jfs: fix array-index-out-of-bounds read in add_missing_indices
Date: Tue,  1 Apr 2025 20:59:16 +0530
Message-Id: <20250401152916.618963-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stbl is s8 but it must contain offsets into slot which can go from 0 to
127.

Added a bound check for that error and return -EIO if the check fails.
Also make jfs_readdir return with error if add_missing_indices returns
with an error.

Reported-by: syzbot+b974bd41515f770c608b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com./bug?extid=b974bd41515f770c608b
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---
 fs/jfs/jfs_dtree.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 93db6eec4465..de33026d18d2 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2613,7 +2613,7 @@ void dtInitRoot(tid_t tid, struct inode *ip, u32 idotdot)
  *	     fsck.jfs should really fix this, but it currently does not.
  *	     Called from jfs_readdir when bad index is detected.
  */
-static void add_missing_indices(struct inode *inode, s64 bn)
+static int add_missing_indices(struct inode *inode, s64 bn)
 {
 	struct ldtentry *d;
 	struct dt_lock *dtlck;
@@ -2622,7 +2622,7 @@ static void add_missing_indices(struct inode *inode, s64 bn)
 	struct lv *lv;
 	struct metapage *mp;
 	dtpage_t *p;
-	int rc;
+	int rc = 0;
 	s8 *stbl;
 	tid_t tid;
 	struct tlock *tlck;
@@ -2647,6 +2647,16 @@ static void add_missing_indices(struct inode *inode, s64 bn)
 
 	stbl = DT_GETSTBL(p);
 	for (i = 0; i < p->header.nextindex; i++) {
+		if (stbl[i] < 0) {
+			jfs_err("jfs: add_missing_indices: Invalid stbl[%d] = %d for inode %ld, block = %lld",
+				i, stbl[i], (long)inode->i_ino, (long long)bn);
+			rc = -EIO;
+
+			DT_PUTPAGE(mp);
+			txAbort(tid, 0);
+			goto end;
+		}
+
 		d = (struct ldtentry *) &p->slot[stbl[i]];
 		index = le32_to_cpu(d->index);
 		if ((index < 2) || (index >= JFS_IP(inode)->next_index)) {
@@ -2664,6 +2674,7 @@ static void add_missing_indices(struct inode *inode, s64 bn)
 	(void) txCommit(tid, 1, &inode, 0);
 end:
 	txEnd(tid);
+	return rc;
 }
 
 /*
@@ -3017,7 +3028,10 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 		}
 
 		if (fix_page) {
-			add_missing_indices(ip, bn);
+			if ((rc = add_missing_indices(ip, bn))) {
+				jfs_err("jfs_readdir: add_missing_indices returned %d", rc);
+				goto out;
+			}
 			page_fixed = 1;
 		}
 

base-commit: a8dfb2168906944ea61acfc87846b816eeab882d
-- 
2.34.1

