Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791CC28D8C2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136111; cv=none; b=CYhlfs/yy6PHxy5mOL6M1XYnTcBye7urC4wT50lAk3HN3bgifa46ngP5vFh6/CFGq7UA51Nv3kj57bgpgo+p3kAQDsnpWDmZpa5hzNT6+sI9JnjrDYGUugFiw7MiHvNXRZhPCMRDKewcRd2W5UtC7LIY7y21iGDzPNo/824kZOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136111; c=relaxed/simple;
	bh=G2b+DMO/M/S4nP+Aul2qQMnUUr5rWUgBK8x8B2DE5Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adETGm8vDbmxKxUx3DB0uZFxY4iWWii8nWyRVv3x775wtN9315zF4E5DxrjO04qNfmMGJxGzdu9FuTnyVTq0AThpLzLF+bRSykNy7pSKQ/QWTzPk9dHwr5QVDUKcHmkYLyC8XjfI8hZFo9sOHXn6buEzYG4r3z+pkJGOohuY9l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiQNE0WN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiQNE0WN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e730c05ddso49967415ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747136110; x=1747740910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jba4DpUGCtISxLwKnUHXPhnIZ5zAXzmBV6eVilHhqeM=;
        b=SiQNE0WNo+U7+bZBkPfXCX1ZoC0eFJ3QEjfxT70ZnGLhWbRpOz9fmxwOlwf1g6y4td
         Bf1PTqe8hdhaOV68rLU60YxSdLmt26fzOQgpL24/6DEPd9qToTEWCrOqGEeLDRLuA34y
         DX13qCddQ3PzovK6wU0H76MvRlLsBd/GV/W4IV/+fz4o82Mt43vLqI52zlBV2RQ7Nm/K
         XhGAAGKFYTxSxdhf+js5YuXKL54Sq0RiAWbYX4ifkgal/9rub/WmRu7Rs0pHW37OwYAn
         X7AR9TS30sG0b6Iui1TyWvyqUmKS0yopDU2zajyY/KhCvKJX1EkQtzGnFSKcq3vKgnjX
         eQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747136110; x=1747740910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jba4DpUGCtISxLwKnUHXPhnIZ5zAXzmBV6eVilHhqeM=;
        b=nYdYQlgxFQHIwWt283t3lhUrEnHi7v1d2p28M8JfZfibpuJxkkI5LwI29r5GZHCiW1
         LXkomKv3XIWsq+tc7fACxIwLg8BZaFDoA24sJkZvB5MOmIcaIy9M8+r0ObCfonuXcmLm
         VOf16oG6AKS5GFHijgISz8w7JCSnEJcmdF+rvUH55mesqKRrz4GYBBC5Yo0Bfg4BR06b
         kaaHIsm9AD4fA+3zMeYeFaMKhgb7LxbJyunSpAMmZd7tRoyVOKvfkhQ3e7Vo2BWtXxeu
         C7hQ0+N8sV9yWCOL2UmugemhvnBp8iPLJorRI6PbDMqAfi94VbWVBoBhQp3bg6UxBCBa
         RAtA==
X-Forwarded-Encrypted: i=1; AJvYcCVtT3ZxqY0H2p0bNBy1Q8y00ZPO5l0EW0v9pSYgCiI7lCsJnzY1Ld7GuXw+XXmMFrOTDNacoBc6EvIxY3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YywxJU+WwVdhntb2V1SVUbz7sc+1TVFmApVvnSfYDSsFXZzE7fS
	/vSYl6yZT2qwaSHmDVgXy1Fq4Lb9cdbjsR2ApewYKAqFPrUk6+9Q
X-Gm-Gg: ASbGncs6qiWm7uXTLlHCt0qqQj4hQ7ny+yjrdypOUcPhY9HtmbYspiV6ZCC63hrABW2
	uCMRB9jAj1rC+AMnK6iZ6YqULAFfoXHA/s3rZT7a9Ba+0h5+vRYl98wFiRJk23bMvs3DPEPtUS5
	eDXP4rZ1gCpS8++2puRU3S4G5csn8nitoaFdhGGAQJYjzxcEADo1PkQgGteezm7qShMpAM26lDv
	s4BxnASxR/fbPNAXZl/ROzgKLHRPf4VsRL4eXB0biPV/cbp67VuMduGBBkGdoQ7N9UL0MSbpQDb
	JvvSgG+/qTXxZgFytC54l6PeIkR0HaSYqd1W0kobPnMYgrzvZq7ptzW50NnkxUHpoNb3
X-Google-Smtp-Source: AGHT+IHCdscBhOcXBsxUDhzRpJcREkLLsgdZWgL+Nr1JdGlZsYaJTVL+8tpiLRbSQ+rssLLKgUJr5w==
X-Received: by 2002:a17:903:2443:b0:224:2a6d:55ae with SMTP id d9443c01a7336-22fc9185f7amr277714725ad.48.1747136109644;
        Tue, 13 May 2025 04:35:09 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829f349sm78509185ad.217.2025.05.13.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:35:09 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: xiang@kernel.org,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	lihongbo22@huawei.com,
	dhavale@google.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH 2/2] erofs: avoid using multiple devices with different type
Date: Tue, 13 May 2025 19:34:18 +0800
Message-ID: <20250513113418.249798-2-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513113418.249798-1-shengyong1@xiaomi.com>
References: <20250513113418.249798-1-shengyong1@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng Yong <shengyong1@xiaomi.com>

For multiple devices, both primary and extra devices should be the
same type. `erofs_init_device` has already guaranteed that if the
primary is a file-backed device, extra devices should also be
regular files.

However, if the primary is a block device while the extra device
is a file-backed device, `erofs_init_device` will get an ENOTBLK,
which is not treated as an error in `erofs_fc_get_tree`, and that
leads to an UAF:

  erofs_fc_get_tree
    get_tree_bdev_flags(erofs_fc_fill_super)
      erofs_read_superblock
        erofs_init_device  // sbi->dif0 is not inited yet,
                           // return -ENOTBLK
      deactivate_locked_super
        free(sbi)
    if (err is -ENOTBLK)
      sbi->dif0.file = filp_open()  // sbi UAF

So if -ENOTBLK is hitted in `erofs_init_device`, it means the
primary device must be a block device, and the extra device
is not a block device. The error can be converted to -EINVAL.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fs/erofs/super.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 512877d7d855..16b5b1f66584 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -165,8 +165,11 @@ static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
 				filp_open(dif->path, O_RDONLY | O_LARGEFILE, 0) :
 				bdev_file_open_by_path(dif->path,
 						BLK_OPEN_READ, sb->s_type, NULL);
-		if (IS_ERR(file))
+		if (IS_ERR(file)) {
+			if (PTR_ERR(file) == -ENOTBLK)
+				file = ERR_PTR(-EINVAL);
 			return PTR_ERR(file);
+		}
 
 		if (!erofs_is_fileio_mode(sbi)) {
 			dif->dax_dev = fs_dax_get_by_bdev(file_bdev(file),
-- 
2.43.0

