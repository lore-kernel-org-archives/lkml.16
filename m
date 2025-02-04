Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902172139D2
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680304; cv=none; b=Nc2a4FuO/EYREOS7Pt8TtagogzGz4HS8D7z0HgKhBSn7h9JQ9eFff1WSIXNcp0ni96CB+X7aLtraE40DEKq1y6mxXJUdN19Da/doYBnCHls2Dc7G8aVSu++gwfCO4irfguMKYWYQ95hqAIHZSlONGuHP5GVe7G6qsrekToi9Wkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680304; c=relaxed/simple;
	bh=KIX3TwRLxYtFkZjDaZ8C+2k2oYRqaUHDzb3xK5t6zJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a5J/jDN0PcvWjJiSdVNiUrMhIpFuwiYi9HN5WCaYRhL38CqmKHa8GhVVxt4SsltvqlJUzT2hPnagPMkKZ5YSF2FhzsWkKuTN/s5mSle3A45IPTO84xnD78zzerbnsEsVYvYPC3Zs08/gUTYW6Ml4wAFX5VzpcAUE3fI6yChcQfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crJayInO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crJayInO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161eb94cceso71106725ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738680302; x=1739285102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSGeoKPogDK2+Dcry6JtEMxeM1/AHJMA9LHzIxtXejE=;
        b=crJayInOdHVBZubtcLT777vmpg//3sZRgj9kSQXB9uYf/0QSJV9AnkTsGXXC74+ZPA
         bwE43Xs5hoaXF6MBnjtqGoFHq44Gty5FbMqagKXBE3wb8f5DfnD0gz4mV4Xg6oa+zoLn
         xVcyiacMtPgrRQCOFMEcBuFM+rTgrtU9C/yhM2zGdZJ6FBRkp9BnKx20SGiXBq8gyPm1
         ZKWBA/eyFC1CLoiMnKR9MGu0SW8LUuisizCgcNf3gb11e3gcQbW9XclT0YdshuQlEhIN
         kFTrdJaNQHTIguMFofaMb8thDD1qSZ09vs14AMu6ww/z6Js9MJ3bXlDI/kA0mkFEnM4I
         NxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680302; x=1739285102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSGeoKPogDK2+Dcry6JtEMxeM1/AHJMA9LHzIxtXejE=;
        b=bRoIFJEU/RhAZLjRfl/BzkLjFCeXeeExOJWpqYg/szAbsHNlxtr1vHwV7WYf2UqGbd
         0vIhX0DVdjogPhUhBFVN/gLpSf0+NunX6C4DqhPHgDwX1rqHLPIuZlpZ8fNAUtAXxm+Y
         Z0ARxhhnkAAG2g6QnaeHReysIBfNNhqWZEzBke8H0A7ndMPSZci18lK2MIXLryE3Sd9Z
         c714s9SZrgESYvjAhc8WNK4I+Z/o0GVTkg/EIhA1oVfn1BtUaJcinScGz/2vayIZSaee
         tnlvKFj/QSXEOFv4ZdF4feKZqarJEWvkgOoZiKgQc4UGWQoyZvX0DUqyWXj2+ejfHuTY
         ouqw==
X-Forwarded-Encrypted: i=1; AJvYcCWqa95UWsHi4pSZb7YN6FyaNwbUO80NTEd/GoHrNZCduS+z2vI1j3XLP3y0suHZxYmDhOfcI58bmma3XXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK0jNkEjHbBJjBa8m79YIJaHnLJPcvPLebGn22q6eQZztkpSoS
	UYXRZqd/Pg7R8OgySJEcYlDX/5Kz6W8O19fBXMAKnFJZ+A8G1fOC
X-Gm-Gg: ASbGncvz706o1eU/uV44RzbX6wCNZgUs6aw8bMlFxt4DkLPxK7SwyC2Z3t4KOqvA7dD
	MZS/s+XY2nCxSQPewUDg00hCiqrwhzkID4xWDe0FFc3+8HrLu7LhUXsm0lmN/tKjilfeAS0jeZX
	w+BMVUVkISNJ+aZ04phyB6URDj68EDC2sPGD7ZvnHswfCWIRcXKBjHMFjV7Qt6rK/nU+nokpug2
	JE7kdyckP/jH6Zx8j3ZR8hDXCtp7jYfISZth57x1WEVC03rb46LkGfzE4iwknwRWICt7kSLPLOz
	PrNc7KbfW3oIRAyN2CghC6xC2+439oWX/axPCDiMelJC
X-Google-Smtp-Source: AGHT+IH49mXcq79A3PaAW55Foprl6imsisqBeFob8nMXBnLPq6AAz4svlOy2jJJqR2RlcNUdKrMcIA==
X-Received: by 2002:a17:902:ce09:b0:217:9172:2ce1 with SMTP id d9443c01a7336-21dd7d64c77mr460371755ad.22.1738680301702;
        Tue, 04 Feb 2025 06:45:01 -0800 (PST)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f086ff35csm12607495ad.118.2025.02.04.06.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:45:01 -0800 (PST)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Yohan Joung <yohan.joung@sk.com>
Subject: [PATCH] f2fs: fix to ensure queued discard commands are properly issued
Date: Tue,  4 Feb 2025 23:44:52 +0900
Message-Id: <20250204144452.1333-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F2FS zone storage requires discard and reset zone for each conventional,
zoned device.
In the current configuration, Discard granularity is set to the zone
size but queuing is inserted into the pend list with a maximum size of the
segment size As a result queued commands cannot be issued.
so we are restorting discard granularity to its original state

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c282e8a0a2ec..03ef835588cf 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2320,10 +2320,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	dcc->discard_io_aware = DPOLICY_IO_AWARE_ENABLE;
-	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
-		dcc->discard_granularity = BLKS_PER_SEG(sbi);
-	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
-		dcc->discard_granularity = BLKS_PER_SEC(sbi);
+	dcc->discard_granularity = BLKS_PER_SEG(sbi);
 
 	INIT_LIST_HEAD(&dcc->entry_list);
 	for (i = 0; i < MAX_PLIST_NUM; i++)
-- 
2.25.1

