Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494912E11CC
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749998567; cv=none; b=ad2vE0Nz3iJF5aWif1T+55YgPBg2TOvu5FYVF8ONXINzefOzNBte2n10usd7tNLGrOKlBoQO6Psdu+K/vkuR86Th/6+xHrmPtWByl1Bpl55F3owqzR43NgQMurVBSmnut/VwUeg/uPUvCKkf6pDjXp59ZgYKW2K8yNRRKmacoKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749998567; c=relaxed/simple;
	bh=h+2Vul6P6VLZ7sx+lkBAUQJ1X2LZKStD+mU6cdUi06E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cH/Gp/tRDJPaezWAmioUTajpeD7t07DBcw8J/NUo8soMgJ8Wp1mfKpkvnANW2L36OXT1w2E14AC7BAvIq4KqylAzrGC3eZmUnEfUVrhvRLL9dNdvOQ093+EXSC8oKSMq3LiEwjjrntOm0Sj4ER//tJvmPYV8XCB8jP7ngc7nLVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I7m327UY; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I7m327UY"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-747d143117eso2933024b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 07:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749998563; x=1750603363; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FP1lr7F8Nfg636WYePAdThDfLRPJuPcNEgEc6zg7pA=;
        b=I7m327UY+LZaWeS4fGjSSdpcXohGH21ojE089Vu4fzcl8Vb9bqSIskY0z0htrw9NkF
         5IVcCp4zjEmadmep6CHXWZU7tPVu4fJdgwq19K4FdUXBQvLe9WQAEfMjhh3tH/EK70mG
         9vlqTORG8X9kToG1CPWL1fKXoF66S+5GaR0h3+ShJ8+b6EL2itOG7Ywz6xvX/P21Jl21
         U+v5g54iBZuKWxbAMEUVilVR/ecaSywp2sPCrHlFBqFa9T5hH8L22Tux5us/1vox/YmO
         lUEhk+EcUolrhHrXBWBS3wUlNh5RTXQwmk0YZ2vZgNXE/6OSmKHLvILcZu81ZA9M2S3E
         WJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749998563; x=1750603363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FP1lr7F8Nfg636WYePAdThDfLRPJuPcNEgEc6zg7pA=;
        b=AAId80n9EwehgtuH3pwCcqlBJ6PdI41l1LOXAs2MzP80Crc49Sb5msklyb0rgtbSb4
         3IRVoSYUuEsvv95PgZBKHCYHX9Jsa6lK2kYlDFZ4LJ9KiRpHIqNOYGrF+MIDZlSlRcYL
         JyFgSnRNIIzor4ysXrtXx8UlDAVxAMwSdDPvJZdQ0DJVSvsExLS2AdT1yXXDYq/GdFGg
         +Rnsf8hT7Nz2vRfw05Lw16sCQ9hnuFG7ekD03KWmU35G7sAv0AJQCMMp823kk5pzQmr6
         DAGh2xp47s69JIPSCk7PgDdVHzG9u2k+1F9TE9A7WiRb3mlWBKyeaigwHjD7+soC+DAL
         Bl5A==
X-Forwarded-Encrypted: i=1; AJvYcCWXWOEnr4tZghMKaf2GHV8sdAsimEOdrVEikhn9Xd2803Mgv+mmqBEiiU9lMfJ3HPU0xBQtr2MqPWU1gmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWj+IQxNIkdMe+g4xC50Y5Fj7MWOtKjSSXt0IgA77FMEJ1bRgi
	rOOPDPtnMR0xn5IuPcDK7vJl+AMTbqj2Hh3ULEzEdHaSlEpgDlyi7HSUqF+kfnbHN989AX6eDDW
	QbUV0S6Turw==
X-Google-Smtp-Source: AGHT+IHzP7AUKodFfcUQEoSRgZ1jidwGwp2ewdXVIHXUuxsVHg64QnNNcwNp4YCCkeylIh30mSg5nKzfGvto
X-Received: from pfjc11.prod.google.com ([2002:a05:6a00:8b:b0:746:2e25:5c93])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:10c9:b0:748:2d1d:f7b3
 with SMTP id d2e1a72fcca58-7489d008a33mr7049901b3a.22.1749998563600; Sun, 15
 Jun 2025 07:42:43 -0700 (PDT)
Date: Sun, 15 Jun 2025 07:42:34 -0700
In-Reply-To: <20250615144235.1836469-1-chullee@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250615144235.1836469-1-chullee@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250615144235.1836469-2-chullee@google.com>
Subject: [PATCH v2 1/2] f2fs: Apply bio flags to direct I/O
From: Daniel Lee <chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Daniel Lee <chullee@google.com>
Content-Type: text/plain; charset="UTF-8"

Bio flags like REQ_PRIO, REQ_META, and REQ_FUA, determined by
f2fs_io_flags(), were not being applied to direct I/O (DIO) writes.
This meant that DIO writes would not respect filesystem-level hints
(for REQ_META/FUA) or inode-level hints (like F2FS_IOPRIO_WRITE).

This patch refactors f2fs_io_flags() to use a direct inode pointer
instead of deriving it from a page. The function is then called from
the DIO write path, ensuring that bio flags are handled consistently
for both buffered and DIO writes.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 fs/f2fs/data.c | 10 +++++-----
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c | 11 +++++++++++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..71dde494b892 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 	return 0;
 }
 
-static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
+blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode)
 {
 	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
-	struct folio *fio_folio = page_folio(fio->page);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
@@ -446,8 +445,8 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 	if (BIT(fio->temp) & fua_flag)
 		op_flags |= REQ_FUA;
 
-	if (fio->type == DATA &&
-	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
+	if (inode && fio->type == DATA &&
+	    F2FS_I(inode)->ioprio_hint == F2FS_IOPRIO_WRITE)
 		op_flags |= REQ_PRIO;
 
 	return op_flags;
@@ -459,10 +458,11 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	struct block_device *bdev;
 	sector_t sector;
 	struct bio *bio;
+	struct inode *inode = fio->page ? fio->page->mapping->host : NULL;
 
 	bdev = f2fs_target_device(sbi, fio->new_blkaddr, &sector);
 	bio = bio_alloc_bioset(bdev, npages,
-				fio->op | fio->op_flags | f2fs_io_flags(fio),
+				fio->op | fio->op_flags | f2fs_io_flags(fio, inode),
 				GFP_NOIO, &f2fs_bioset);
 	bio->bi_iter.bi_sector = sector;
 	if (is_read_io(fio->op)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01..3e02687c1b58 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3972,6 +3972,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 		block_t blk_addr, sector_t *sector);
 int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
+blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode);
 void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..3eb40d7bf602 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5015,6 +5015,17 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
 	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
 
+	/* if fadvise set to hot, override the temperature */
+	struct f2fs_io_info fio = {
+		.sbi = sbi,
+		.type = DATA,
+		.op = REQ_OP_WRITE,
+		.temp = file_is_hot(inode) ? HOT : temp,
+		.op_flags = bio->bi_opf,
+		.page = NULL,
+	};
+	bio->bi_opf |= f2fs_io_flags(&fio, inode);
+
 	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
 	submit_bio(bio);
 }
-- 
2.50.0.rc1.591.g9c95f17f64-goog

