Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EF23C01
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750991975; cv=none; b=H0YYF1NE6S2Q7ynVU/7B/kaFodNmxqDkQ8UCNLqZZ3hNwueJ+W6ruBiVB0rCAtMuXSRBlgYNqkysXoKjRMUbapaGbd2CHPyrGhzsy0TbuzS/GsYaFHsAz1BdXD2xsSCy1ozZKwlCaSap8Ihegngse2Yi2C6gn+WPvjy95VRoFz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750991975; c=relaxed/simple;
	bh=vvXfD1IfkO52OboqRZXTZrSZOnFkJz+wyFRQ1bQn7AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAfoidvX5WFO+o9c7TW/TQSM6bbZnICy+vlKSt9oztpuv64vKfBycpHaSBt0vILOx8DrKHj4L9rZXB7e0p1W7M9rzA98pxxztj58x0TVz3ofRjvMLsXFsP0EeLoIeQLFJgOUK6lIWUGxe3XgX1wd/8xEpFxuUZHg4BdyHiyD6/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGvuTDS/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGvuTDS/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235f9e87f78so21505935ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750991973; x=1751596773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+Xmpn0m1NNRLGqOUCu2eX/6jrBk9qwF49IxfMBhpEU=;
        b=TGvuTDS/0uxFbVg7HA5nPq9CLc/BGFF4X+mIOWkUwneNqsw3kDoeVmVNTj04ez7iuI
         zaC3VZHX3LQ8r23v0bF2A5ZJHeQPs/4gTol9lB08MwyulufMAhKsU69y6FATZR4Oz1XG
         u9o3y3g+IDXuDWghLmpL8Ej5fHchofBVAzan9f1uNK9NUW4ExCKSNvSDjT/9WlmfsMlm
         NU8v4XtV5iBPnZYwyZ8615u2QqhbwufHULkWjFoTwOj5DRRAP/3FcJBr2sC9fNAMAxG8
         KR9M0YS1Fn2j4Uk5AlfnK6Ib0wHi0f6MPIR3glMWdRRPOp8B/3f5015qECtR5eI2svZf
         FcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750991973; x=1751596773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+Xmpn0m1NNRLGqOUCu2eX/6jrBk9qwF49IxfMBhpEU=;
        b=jAoja0IWV/FmgzExQxjz/Aoz2S1rFxatlhbi871Vh0get5wSxzmqNjCDy2pJQpRMzg
         7cw1+y0SOlnoO3I0pX1UVt7NSMi61cZ6nr8XvJ4poMc8U0ZCTDUFqDKlOBLGsQDCo8sY
         9++HUMqtEdRCvYoaG7zBpmI3/hPlck9YdRxhP8bAdiMbW3LhlfNd+3tq/Uj/SK4vQoAS
         VectO8RiFgQH2v+vvR8cdWcOdxAwfP+d054I7oku8ls7T+Nxb9jsdhacLXo2e5VLGzpp
         KsAoLMqJ7GTaQ3SxXEtInhUPQpBrkXaFRGvzuijuH+45mDivckQaeevMUTQUS/MZSOj3
         PF4g==
X-Forwarded-Encrypted: i=1; AJvYcCVfGCZvhXQtePvtutccWUDsGkZozW/2SmOuZLGfYSclq1occ8q0Xr3Mcl04sRZeFDWbp0R6y+j4x4uHCXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKEUhiuikvcRfbqgKT811Gq/+rwy0K1p9BhXLn7HNmwycxcRkL
	nS8GoEygii7TwGjUnuMBu/Aoa595s8DgohdP8XcWlZdq/j4VNvNRHd+d
X-Gm-Gg: ASbGnctW30ziCOgobdJTRwVP/8tC80NIv2qB1sE397iB8BvymaEz3l2SSBDvX0PljPK
	P5mo4AE6Wx3Yin1pjmoXW9YeTltauwMvGPjCExy9AvRxwxDYzirkAR14tjpXFWAjuxo/TGCzB8f
	mUKMWgZBqE3QV8l9v/jE9UzIk+tjXjqqv/Jv3KNghjPPw/3N+xqvZzAfakiX2Sh7xTeBNlwypth
	Kuw6fiHltTmGUcMNgQaQ8bFIPj4DZkOgr2PllSpWAtVdrTHF+Ydwh5TaFuRDG4k1wSfpT5mJ+vS
	vqZUpds+3i9BO/28zSTi/K89i9GAYZxSE1GyV/UEFKqU5xYlI4dHr06l6t+4uTiZTZYUWRy4Rwd
	GrymJ//kF4tTG2GuWjrkZs6HkaG7/Wz9wFAnEBQ==
X-Google-Smtp-Source: AGHT+IGT6mSXkMoZBI9eS+i+6n5dkAlAiLro6eu3jOH5Rab/6j/ltru+m7KO0gmlC0KataXVrNbGHA==
X-Received: by 2002:a17:903:2f4c:b0:234:eb6:a35d with SMTP id d9443c01a7336-23ac4606503mr22426855ad.27.1750991972966;
        Thu, 26 Jun 2025 19:39:32 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55.hsd1.ca.comcast.net ([2601:646:a000:5fc0:ac9:41cf:eabf:a84b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c5bc7sm4037755ad.221.2025.06.26.19.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 19:39:32 -0700 (PDT)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Ivan Pravdin <ipravdin.official@gmail.com>,
	syzbot+20282c1b2184a857ac4c@syzkaller.appspotmail.com
Subject: [PATCH] ocfs2: Avoid NULL pointer dereference in dx_dir_lookup_rec()
Date: Thu, 26 Jun 2025 22:38:30 -0400
Message-ID: <20250627023830.150291-1-ipravdin.official@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a directory entry is not found, ocfs2_dx_dir_lookup_rec() prints an
error message that unconditionally dereferences the 'rec' pointer.
However, if 'rec' is NULL, this leads to a NULL pointer dereference and
a kernel panic.

Add an explicit check for a NULL 'rec' and use an alternate error
message in that case to avoid unsafe access.

Reported-by: syzbot+20282c1b2184a857ac4c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67483b75.050a0220.253251.007c.GAE@google.com/T/
Signed-off-by: Ivan Pravdin <ipravdin.official@gmail.com>
---
 fs/ocfs2/dir.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
index 7799f4d16ce9..dccf0349e523 100644
--- a/fs/ocfs2/dir.c
+++ b/fs/ocfs2/dir.c
@@ -809,11 +809,17 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 	}
 
 	if (!found) {
-		ret = ocfs2_error(inode->i_sb,
-				  "Inode %lu has bad extent record (%u, %u, 0) in btree\n",
-				  inode->i_ino,
-				  le32_to_cpu(rec->e_cpos),
-				  ocfs2_rec_clusters(el, rec));
+		if (rec) {
+			ret = ocfs2_error(inode->i_sb,
+					"Inode %lu has bad extent record (%u, %u, 0) in btree\n",
+					inode->i_ino,
+					le32_to_cpu(rec->e_cpos),
+					ocfs2_rec_clusters(el, rec));
+		} else {
+			ret = ocfs2_error(inode->i_sb,
+					"Inode %lu has no extent records in btree\n",
+					inode->i_ino);
+		}
 		goto out;
 	}
 
-- 
2.45.2

