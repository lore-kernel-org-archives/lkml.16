Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DEC4B1E6A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747273738; cv=none; b=i3N+HklJdmwqQEg8P940N+yKXZ+FWnHDBjwawOHRE5A+udJoNTrFzimbfGULqQ0YfnvO+6PShDCUTvLnXHDI/l6zO1TLCqYjfGA4Ohrt8mnpZcgGeA/rFU+TOz21JgwE/sDxt2/83MgxRSqb8kR1VfrwzGu42ATB/vY9QZGFRe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747273738; c=relaxed/simple;
	bh=KiR8YbpKmTMr2x69SUwQJPdzWTL9nSX+JSmjJuCOWqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hFZmPEaxxd9V2wRcRYcvGp8bGpgTbBP/8LAxWeP6km3eOTK4x0CaZcARRtfqeTA1CAdB8L4+Fmk48/T3qOuPKLAyISKC7fGKfM8ZtcJqiu0XkQPGtJ1GC/Z3QXw5Fs8RD8/gjtunfNpKxtT0bepbnPUi8gpt6/tVTy19GQlbMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiPauSWQ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiPauSWQ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30a8c929220so433485a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747273735; x=1747878535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOEnV/2KMJC3wgwepaDuF55brmVsBP86jOYmmGA/5KU=;
        b=RiPauSWQiWIjgn2rqtXtA9oLTPBXGj2f2rZJUlwyMj7VOK/hcPDEInlE0oTXq72KDY
         fknKeWSZ0DbaXMhwQMw7U9w98g7FglE8WUecWQ3cE/HF7YlepMEef9fmP1nF5cO2Tof7
         v5piOm8x/4OgtU4vECTVcg4MXNf5zgzWze4KC0V+XDnth6HwtsetxcvO9M/mxibroLy8
         WKq6ZrslZGrlbSw7u72RJ7TSTva0YCjVStoxps1KZThgh43ADOxIpfmARWWk2PLGzmU6
         hMK9ZpxqPfl8TrBk8F/Q6wh48+XNlDB6JQjRXdDuQjK6hyDi5PBFLU02wdjhynoYSsw6
         l3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747273735; x=1747878535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOEnV/2KMJC3wgwepaDuF55brmVsBP86jOYmmGA/5KU=;
        b=F8Tpv69lr6fAdWQSlDPG2AN7Log7lHAimAdj844itj6Gjb1V9WstoEdBAQ08q9T3/n
         TqhyuCLUIS/4LoKxSrBut/BFPqUMph/Ne2X0hR/SwmsuameQz7K1r6dNk9A4T4fS+JL6
         6P9vCaUswp4zxpJSOWvauQIxy66EQ3H7jgYMSwjfIBPcWsjoJAYDLJ/euhmPK/3WOVAJ
         dFk9i/+FkIRxFI12zWIJwB3GPwVo1Ep7Bc2ZuB9Ng5nqpg2LWV2Wsaq8Ysr4HDCsMFaJ
         AuMF+hhI6FLtTuJ5tXe7Ezdjr93MeJlq4NBPXMSuR2Ntfq0fFoG8a6KU1tL+4Xszsmlj
         8u2w==
X-Forwarded-Encrypted: i=1; AJvYcCVG7rqtIEfQHktHatdpmHJ9Y4gbHAtHGj0tfkd3vR2vnw80ijerZ+pxGKOsyNerMFhfT9xN/Qr1Dpxs6Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YziRThZyaPG2g088mAbmFz96ulvGv2q5gwtPJoL8SJ2H2ak3Due
	LGjm8qjMPHjzmGwIOapD7+6hFZc+kbaJqY5aaDg2jN7Yh5+dRJUX
X-Gm-Gg: ASbGncspSsHp3S1W/hwLz0yfRncZAvhxaCzqSRs4iXgtQqM4cYz/vJemgY5LaJyzI0C
	+ibkWrgPSXMnxcJYKg/hlrwqQlI9oKCafGz9CNzf80acMJfAVcsUWVi0U2JAHiSf3aGk+8IEtLK
	1jYckjPImL9Xy2qKhLWWZmY6T2V//mrGhofdvFX3AmNSPw53J4cINf2yTyzYm6nJnbppFJ7KzMW
	mpkU7Tcu6z2hGBPwDC41LxKf5Eg4TO2VYuEghNnLZx+898vPfXwnvOpzzWcuuac8TIS8S8mpvP5
	lL4ryaIq/6uibgLsyqbpoEH5jTVspF3fITngt0gQy7fPH0QKmyXEydyC2w==
X-Google-Smtp-Source: AGHT+IHDMnY/v97x5w5dxSCupgCGTWPSnEAHWOQ8uK2Hd+mELF4fFkK2eG87nVkTfnkhyBrcXM+YWA==
X-Received: by 2002:a17:90b:4a85:b0:305:2d28:e435 with SMTP id 98e67ed59e1d1-30e2e59bcf2mr8591859a91.7.1747273734936;
        Wed, 14 May 2025 18:48:54 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33460e16sm2292606a91.30.2025.05.14.18.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 18:48:54 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: xiang@kernel.org,
	hsiangkao@linux.alibaba.com,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com,
	lihongbo22@huawei.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v2] erofs: avoid using multiple devices with different type
Date: Thu, 15 May 2025 09:48:37 +0800
Message-ID: <20250515014837.3315886-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
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

Fixes: fb176750266a ("erofs: add file-backed mount support")
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fs/erofs/super.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 512877d7d855..6b998a49b61e 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -165,8 +165,11 @@ static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
 				filp_open(dif->path, O_RDONLY | O_LARGEFILE, 0) :
 				bdev_file_open_by_path(dif->path,
 						BLK_OPEN_READ, sb->s_type, NULL);
-		if (IS_ERR(file))
+		if (IS_ERR(file)) {
+			if (file == ERR_PTR(-ENOTBLK))
+				return -EINVAL;
 			return PTR_ERR(file);
+		}
 
 		if (!erofs_is_fileio_mode(sbi)) {
 			dif->dax_dev = fs_dax_get_by_bdev(file_bdev(file),
-- 
2.43.0

