Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4EE28936A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512214; cv=none; b=LXjbqPWqSNIc71MHWGJHZbxQQfiY7Zn91d5cFMOThSg8bJyfOH4mkFGlDnyW2Ufc61Knln62F+wxgs4DAllLNHXn5uBSPQDAzFJiXJFVfrJMFBOHRXWFdjT0pEWTN0fopHbQxdb+mCeRRyIrAnvgaUHYBF0EdO5Uied/Jar3lpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512214; c=relaxed/simple;
	bh=JJZdea62+qDixd1wjQBZlt7O6LaJyF5R3D6HeNaAYlM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aO6eYeNHF6eOVXJzX+NsCN9821Lhg1bXSh3i1vJBf3axK/8YcYFpH7G1YwOz7czytXVzBzgsO6QXabx6H+TYih/kDj+bzCofDvoZpIJM9IJ0Oc3eLj14AaUGFD7y3/liB3G9Y7TR8YrVr6PdtEhOidHwVKWfxoCoTe9l9WDIOy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW4j305w; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW4j305w"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0b2ce7cc81so1178310a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745512212; x=1746117012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rnYu8oXqkrED+USHfXzllDeNP8BZXlteEK0vrpIinxU=;
        b=QW4j305w7H48kgn6vTpBTRiv9q6bIC68QPVNr8b5ovyA1IaV+IoFAXGwz8UhHpY54w
         UcNd2404WhHYWEhwnMyaf9z1SMjwypNw4NyaA+ez3MUudZca5bRUMQspQVX+W67cwzPa
         aRlPHCWvY+anAKCGXkb/yO0QAF4NMEO3ISUFijKFaiqTZAxdWDaygfG5MrYYc3QGe9HF
         sFVich86SBs8apMmF30s4XNzjrh2llkKeue1XawS/6JdNRT5yX/7IKDVdLArtIaf/BMk
         wa7pD7mbqf/cFWgtiZFcUNCv69SA2uMGxJy5uDTRdAhzHnvzJmHWxVMTSlgAkyh4sC7A
         bKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512212; x=1746117012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnYu8oXqkrED+USHfXzllDeNP8BZXlteEK0vrpIinxU=;
        b=XcVZ+0+7T6stYej+fNZysVlOhV796TDaxVlKAb2zq7PO0dwILRl2UVPbuq12BQFBJS
         cA2A/ne5AREt3VbniddHf2KBrmlsXejBuqbiYjYxNYtaDu6eZi4ArIjJtN1dx373XV/5
         iwfm2M0WIPrUb4dW41Bv/JGrwOKhx7bz+bmpb8coJvedpgB4eKVP8tPz4wi8EfXqB8sv
         DsPjhV+GHDoBdMiv3SO6wxmScobJnbGlGTJ6gBX4HUByvFmpydvybRtCod3TRB3f4GSp
         O1KRjX+yx34m6yC3C0pThE7CKlrHxQhfsRgvUQun1AWb7N10M5+Qx+8aa2TX6/wvKED+
         Zm9g==
X-Forwarded-Encrypted: i=1; AJvYcCWEjq7nEFhWOtUNSbJWHNaXJgpCAQiYKW0shCuZrNnrK9nwK2LzPpRQ/WisrGy0kfR/FsBgUEkARkf/2Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKu7eHAPwv/Af9tBrU7pOP8EzmM8+2JWh4lliqh0O/vIB7bVxR
	G8JhhMSLjW//UjTRFZP0lIQt7DBIutwOkTnpk2pND7f2OP9DZB5l
X-Gm-Gg: ASbGncuDwefLhLWaMpKo2parB/4XbtaC6BKSzfW9bTpaCXc1cam6q7maNk2G+I22uMo
	JwicdxNGtbLiXR/ij+vaW/x9rZAocKF+I1JDhhwtxJiZDqSdSvGzzj3sDnmVo9MTjuiwBgtpV8Q
	ThWNJtbMH59+4TN+utOnLwXk5H06ytXarM0wDvxjlLxjkjPuezWlE/j5n9cpslKPTpvWMOYIfWu
	zQ7Pp2a2EMEj3lgvFx569kr43jA3J7BgKVy1RBdf79VrEGDWYKoJCkhzaNisQspBhnbXtLhMfVh
	TyAMK9rI/+aOKWUalSQQjJPgnundwpDqYpHz/+sQuD2HtmDMaIJ/FWGswuOB
X-Google-Smtp-Source: AGHT+IGYph1SNjwma0hVJDpnZpc4EAmA2vohPxjOCmeCZtX7T7ijJ8j8mo/0PwoMkxiHPvgCy1FkZw==
X-Received: by 2002:a05:6a20:cd92:b0:1f5:7eee:bb10 with SMTP id adf61e73a8af0-20444e7ab23mr5763937637.8.1745512211729;
        Thu, 24 Apr 2025 09:30:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c408:a0b5:82a7:fae4:9cf0:3b75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a995edsm1650876b3a.130.2025.04.24.09.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:30:11 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	ocfs2-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Cc: kevinpaul468@gmail.com
Subject: [PATCH] ocfs2: fix deadlock in ocfs2_get_system_file_inode
Date: Thu, 24 Apr 2025 21:59:11 +0530
Message-Id: <20250424162911.51413-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit: 7bf1823e010e8db2fb649c790bd1b449a75f52d8 upstream

syzbot has found a possible deadlock in ocfs2_get_system_file_inode [1].

The scenario is depicted here,

	CPU0					CPU1
lock(&ocfs2_file_ip_alloc_sem_key);
                               lock(&osb->system_file_mutex);
                               lock(&ocfs2_file_ip_alloc_sem_key);
lock(&osb->system_file_mutex);

The function calls which could lead to this are:

CPU0
ocfs2_mknod - lock(&ocfs2_file_ip_alloc_sem_key);
.
.
.
ocfs2_get_system_file_inode - lock(&osb->system_file_mutex);

CPU1 -
ocfs2_fill_super - lock(&osb->system_file_mutex);
.
.
.
ocfs2_read_virt_blocks - lock(&ocfs2_file_ip_alloc_sem_key);

This issue can be resolved by making the down_read -> down_read_try
in the ocfs2_read_virt_blocks.

[1] https://syzkaller.appspot.com/bug?extid=e0055ea09f1f5e6fabdd

Link: https://lkml.kernel.org/r/20240924093257.7181-1-pvmohammedanees2003@gmail.com
Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 fs/ocfs2/extent_map.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/extent_map.c b/fs/ocfs2/extent_map.c
index 70a768b623cf..f7672472fa82 100644
--- a/fs/ocfs2/extent_map.c
+++ b/fs/ocfs2/extent_map.c
@@ -973,7 +973,13 @@ int ocfs2_read_virt_blocks(struct inode *inode, u64 v_block, int nr,
 	}
 
 	while (done < nr) {
-		down_read(&OCFS2_I(inode)->ip_alloc_sem);
+		if (!down_read_trylock(&OCFS2_I(inode)->ip_alloc_sem)) {
+			rc = -EAGAIN;
+			mlog(ML_ERROR,
+				 "Inode #%llu ip_alloc_sem is temporarily unavailable\n",
+				 (unsigned long long)OCFS2_I(inode)->ip_blkno);
+			break;
+		}
 		rc = ocfs2_extent_map_get_blocks(inode, v_block + done,
 						 &p_block, &p_count, NULL);
 		up_read(&OCFS2_I(inode)->ip_alloc_sem);
-- 
2.39.5

