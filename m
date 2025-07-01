Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FB6140E34
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751337461; cv=none; b=aRoaDjq4VXb4wCH7QUHSW9B+oLrrszXhXk8/HLKPVIFvDaiMr1sZUsOT/Ni4bLrx8vpeqsqOUOpIrzqx9oE2RMtTVzJACoLtUM47X3qXqDPuhQBxJhq+psGuvrZ2OwmT7W+ISfgeRvtT1aOleGoSAnw3QT5iZ4FJ2nLrWp5ifN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751337461; c=relaxed/simple;
	bh=zv8H/ueXxWC5DLY5dbZxw8M8pOFqP7G7c0K9+DxAf18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IH7BhRpYV8Bq5+ctqn52cup4Ba+sm86uRQg8PbxwntEyffY01a219orIKNeQfXTUCqIfzq85bXrmADBEeNHMvEfJ/XMF4xkL2reUZpoi0LqQwd+Ma0DXNhZgtdx4Wq6xLbvRZ+RSGV4582cyU1DR2T42BHMx2DUrNaO2G6a0djo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpMmAtnr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpMmAtnr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235d6de331fso34014895ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751337459; x=1751942259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HUEbK//prruDZHN241dDRLIKIkZ6TnXwENFQ7i5Q1V0=;
        b=hpMmAtnrB/5bmy3ENTirxvGwaOdINxAkxWCC5ePaij8s/47dLRpNizimK+7gMQnslE
         A5G/+FQ+pIjCfy8P23w9hfpPwvNOxSKzfINhiuwnOhQfdNH6MsDnEf+Um/4HwAvVRhHO
         KIo9lhDh5gQ8ZGFV1Gvh36lXFf+8Al74XU5nAYrdW64LDSV4rR611zBL9ltsg64CUGhO
         N67fhXlYDrJ4Rmhu+aEDyGKvrqbxXPGozaHDhf4BSeEtBLzHbVu25pHEE51mWNUQVRY1
         Qu4F/cvrtUfWCHxoNNSStPe2yNlKUNB3qUZE4C1kC5ctghfUIZCZe/2m6XLax0RkPi91
         cbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751337459; x=1751942259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUEbK//prruDZHN241dDRLIKIkZ6TnXwENFQ7i5Q1V0=;
        b=Pac8VRNfMQumgQMEJuzYrj9+BCFBmr/SzXhYZd1HAjKkEW5o+PnKio0dmxL4bR6KjH
         V6+LyTj1TrAllPTW+Ij6kPt+ohZ5Al5mIGCRS0DgJGeO2u7yQIIqy1Nj8SfFRoiQLtvW
         UHHCDOtv7exAG6iBA1rv3AQsNCORy9Sm8p3dRipwdCWNiOLR+oyC2RqWeuNcTUFFhm4W
         yxV+tyVh4uAn9xIN7b5zI4/30YhMrwwkNC5MyApoF2LGUvaN5DsLpS5t0sJBc9tjbeCV
         sVWih30H06bsKULV8mbuoL6XKHrJfkLhqvIEnFP04jNvrKt37gS6UA3W+4tqglr8Zxn1
         at9g==
X-Forwarded-Encrypted: i=1; AJvYcCXYRvnYMjuGTlcurkhbOMgw4RKszA6oikpkj4ZNQhGmP9nUuatbvZ05OnWcjEc8nIJ0XO0tD/eT/fQpwPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIRdam3YWliMH/pvPz0Da2/cd9KjhEnJ154zAIyjoi6FYsK1hM
	UWSBO4K3rOyQ3TnDZZj3vUJNg18FjRawD30SMGCnrYORz2aICZvqTdXk
X-Gm-Gg: ASbGnctxGGLIWt2kLb1rluSpsGNABBE5uyGUK0gMrpv0l5+eAlTL4/1h/SsQ31Brroi
	Nzi844Q6FLajh3/nNHfDQ29UYarxsmwBqPYFQNbWeRGIhEAef/jF9SR9bf55kFGOSnkOW2oIM2Q
	nU0KGvCpGuJK0Fhp4vz27UOLMIDu97XT2x8BkojoihfIp5rdXtl3Ae25GgQP1EeeLXQkceaFZFA
	azYhJqNSveVn/YhA1jJfm5UCMkNa4J9fSisYhYB0PT+ilv+WbJTkq0s3SEZWeIie/TnEou7srdQ
	RpnnvOpVgsRqHBEVsFRwcj9hCWBbqitcL5l6Gdv3mLiIjCxijyKePZKVIvLcpicauznm55RIvs5
	RFYoQql1urznqHHSq/xK/L/V6jLq6V/gN7BrG4L5oi3Dfh3AY
X-Google-Smtp-Source: AGHT+IHyuRcYmYE04g95LBJExejQ8LrpV+fanzEQ2/mJIcpOF7EtQio0DMLDMxrMqUaUoP91ln/zVg==
X-Received: by 2002:a17:903:1988:b0:234:bef7:e227 with SMTP id d9443c01a7336-23ac3dec2ccmr188501485ad.18.1751337459451;
        Mon, 30 Jun 2025 19:37:39 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55.hsd1.ca.comcast.net ([2601:646:a000:5fc0:185e:4baa:85df:637])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31db000sm9017202a12.65.2025.06.30.19.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 19:37:39 -0700 (PDT)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Ivan Pravdin <ipravdin.official@gmail.com>,
	syzbot+20282c1b2184a857ac4c@syzkaller.appspotmail.com
Subject: [PATCH v2] ocfs2: Avoid NULL pointer dereference in dx_dir_lookup_rec()
Date: Mon, 30 Jun 2025 22:37:17 -0400
Message-ID: <20250701023717.543972-1-ipravdin.official@gmail.com>
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
Closes: https://lore.kernel.org/all/67cd7e29.050a0220.e1a89.0007.GAE@google.com/
Signed-off-by: Ivan Pravdin <ipravdin.official@gmail.com>
---
v1 -> v2: Changed 'Closes:' tag to point to the correct bug report.

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

