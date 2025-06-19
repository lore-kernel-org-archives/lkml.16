Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171DE3085B2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335084; cv=none; b=Qk/XtZ3GF9ouIm2om3f6Zpm7zzFdqbM4v5qgpKqnk2nVVoKBjteLCNKcbDT3RkaxtldAawZdrEo0aKzFJErV7LgMbnLkvIyaacuXQaVOUUPT5NOPAi7lz9ZQBavDRPElhGyqW1CzHjLn/UFb5W+y2KaDa9uTso/KikW2JWz1rc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335084; c=relaxed/simple;
	bh=qiFBnZVbAiJvu7b4n8rdFDeLFoqy++xZOtXNBg1wSIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMtLYpO/XoAdEbzIpmAAF7nD9JiM08LbsLVRKzpjdkTYIATUVVRTlRKtYq4CtWrM+RIz3gfUxo+pcjZeAXXmlYnDrdJyEj3LIo37smYs8L+gtut6yyCPIai+1hSRhuJ9sDaTMLYtbUuSaX5YcQrIvz4UsYDbS3ZVdNOZctQCM6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLsvr03h; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLsvr03h"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23636167b30so7154345ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335082; x=1750939882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6SRE6bIgx60Vh2G3cKWwxWXV0k70mmpyo5f1tTADIM=;
        b=PLsvr03h+3OvpTYJyin++GsZh321HA3LpQM2UuPCsxBBrDh3/286tAWmi4C0ZKgs2P
         4+4BqJhhD14Gs/hFlLzXERDzcqV7k06hkbP4GDSE4Y5nVP0Hyiz2tGxju26IsrLW6ilc
         D3HcHhIQh+ZynVIh9Xulrx2NEK3+KhOuG7+PLoyGBLAAPczvbrclJmkVX1X+a8nR2VC3
         3ZnUvSOrKgC5n/61SHAqXD6MPsf5ffMt66nwoUm2q4eDrFc8PAN6Jt1XsWc9oxqBXApF
         KYYg9UHTTgoXBlfqtE1HgN2sB8r4Gq0533q2JhKA4U5gmpmZGKL7i1h2E0BpoiZjbOYE
         h5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335082; x=1750939882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6SRE6bIgx60Vh2G3cKWwxWXV0k70mmpyo5f1tTADIM=;
        b=XOlDFzi67TNss4LhGtmG9kgy+tYPDCauJydd8HKWt/EOnt5ENZvAtzficAAock5/xw
         0vVmzapvyTK+NaaHlG4bd2RzXOd4OmHE4aVcXY0g1g97c+5S9ooH+0bkOGwmaR3Ls2j7
         bWIc3MoeJlRynQQLxO9/XauLTTie/Fz8auD2IdBcBY4Jq49XDtB5y2L1jBIJpLvPuhEZ
         GKp6cTdUWpp2v9B+uTW7dXJHFixRxpKq0deIyqZ8bLEpS3TOob4EWbvL+CmMJHqg0zYh
         jEe+3/u8OzS0Cttjb5/CFfidS4BVfxA5YigLSW9T+AfBhRcsZMwsLovdOPc/wIKX30lg
         RuhA==
X-Forwarded-Encrypted: i=1; AJvYcCWXlA0io21keNRBV8t/XBTL1QOTRrWG7pWcm+jPCbqpvfVbSYfZLgJo7+EB3cHVxwSibqcDQQe8QP22iX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDotuGMWw+Gua7FaSThykOlHJmrcC4oshiaAf5jWboyk6MhQhm
	eoxp+YDQ4aTsa57WI6legYg7tzaxRUP+vFGZYMP4g7/hf1xF+bdwIzHs
X-Gm-Gg: ASbGncsVWZCHWTGCGx+28smxQvVNH80b1yhxPQI3FRImB4tdP8jgz/4HTUowk4NXkVR
	APs76L4klP14jczycKB8y/Q5Jvy/JawyhXzjAROdWTRXDIfwVBF9oENWR9N2LbhTqLXIy80BC8m
	yybg0UQr4zKlTcIXSbfz+7OePSWdLLYu3jIbyrCcl8QQqmxtTOK00zDjYDZ2ngJOJfpMGW/6feY
	B+qwN/P4klMVO8lQUpSAcshZRoSTeYqQGuFnMZzE1z2S2kppkIbf9joUhvhq+nrphx7V+VZDzP5
	tZZRc4WKJ+JH7+PrTnQzSwbkPiiHgQZzrE1foQuhsYE2xHkojIXDkbUmSDYJTriP9UmJVrNTrSw
	kNGxZMoPJsgnmfmq5L6lg
X-Google-Smtp-Source: AGHT+IEvdlhLCL59c6evd8bLKO2An1ebnECP+2K1HLQSf5MX8fOY246UKB0mn7G4ZlsL4wRrKX7v2A==
X-Received: by 2002:a17:902:ecce:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-2366b32e726mr366200805ad.10.1750335082365;
        Thu, 19 Jun 2025 05:11:22 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:88e2:4433:2a7d:bb88:9d3c:be74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca2dasm119088105ad.206.2025.06.19.05.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:11:21 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org,
	Abinash Singh <abinashsinghlalotra@gmail.com>,
	syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Subject: [PATCH v2] f2fs: fix KMSAN uninit-value in extent_info usage
Date: Thu, 19 Jun 2025 17:39:33 +0530
Message-ID: <20250619120933.125932-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reported a use of uninitialized value in `__is_extent_mergeable()` and
`__is_back_mergeable()` via the read extent tree path.

The root cause is that `get_read_extent_info()` only initializes three fields
(`fofs`, `blk`, `len`) of `struct extent_info`, leaving the remaining fields
uninitialized. This leads to undefined behavior when those fields are accessed
later, especially during extent merging.

Fix it by zero-initializing the `extent_info` struct before population.

Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>

---
v2 : Corrected Author name
---
 fs/f2fs/extent_cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index cfe925a3d555..4ce19a310f38 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
 	struct extent_tree *et;
 	struct extent_node *en;
-	struct extent_info ei;
+	struct extent_info ei = {0};
 
 	if (!__may_extent_tree(inode, EX_READ)) {
 		/* drop largest read extent */
-- 
2.43.0

