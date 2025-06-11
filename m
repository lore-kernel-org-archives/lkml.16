Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C608223715
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749685137; cv=none; b=Qw8qlKFeEuPeLL+5tXG8qR8avoYY4Cby/iUNQfIpuVHLDZL6ck//GfFpUPpjfh/8DpUaFyXxuPVHRMDfiAzhZnI4dd8zBy+W6r7Y+uqsA9Nmb6WcW31LPu743Vu//Es89+zN7y/xWaO/6CbvCNXKsM8GflAeW46w4AXtHAifCzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749685137; c=relaxed/simple;
	bh=9lLLxZV8Xo6ExW4GDvXchayh1GsEYMbQlCQwCUJ3jSc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iNpJYlxsmYzdTwkpL7Tvkl8F7R8PP6LZbMe/uGgJqUcdAjF6vhtQHCycS8kerg3gq6Hf7hcf7Q1C37M02ojcEHhBsyKmtq7b7Yi7q7Bfgx5AYmcgWVplOvaaQKTL9f7m2rJuLADpcflxDZfim8RWeklzUJ2vn1NtA5KkFx4ezV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gT+v2b64; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chullee.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gT+v2b64"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235e3f93687so4065705ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749685134; x=1750289934; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Rt56V0aUE684gaj8nRV8+O9M+E+heo09h4VQz5fyeg=;
        b=gT+v2b64JH1Y9rueufC877wSsUhWQNqMW4Fbcxf1CH9dI3C5IiRXsbz/en7kszD2mR
         rZ1uOjf8zOTrorxE3F3QnTdqMk8Ja957s/dmqmuXQLcIWrkKtElr4/zoVD55BwlvWDcK
         dzbfbSWC2pOk/U6ZXwTM80ne0C1dDQ2/rRRE9lsVksVWUEyoGDhuaT1SCbLthOcr7Lyr
         ELkvmWdCrLe5VIdQxrMLOf9psKcGkIXxWoPHOt58M70dRmMUlBPAQX5GFHfZGJ+0fk08
         ET2rz8g0CeeGHgaqNbWWpeVB4eKHWlJezkQ7eS2fXuNLmoTgBVTPfCTiC7iwOrbxvhbS
         98UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685134; x=1750289934;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Rt56V0aUE684gaj8nRV8+O9M+E+heo09h4VQz5fyeg=;
        b=iOUHN5jz5hDUVeIkKivazMJPgvzllLDOdvf846X9B8vbsMXia5Bh/cZIoqcriBS2hD
         TJeiOfHPhRG3PmbIdYXsR9yyKzjPjMu+K3S3bHtp6GbxmbuDd+xuIubTBPOF0LdrdrNc
         iFPEellhUpw8WtzSh/wtpGl5Hm12lNfFcfjxhPt9lgG/K9wxZfNvhLSKnsp1Wj4d3TBo
         5+8LpnI3PMueOyoZ5HZ5QQ6yjEe3HPgsyuYvMtynbPOiMAwPSm0MjaOAt8fuMscI+J1I
         t8f1B0NzaTCLQWwwx/5CaRd/tklk6NVI11OBkyJ4BSZDlWeuPCxhGOtxa8MRy1m2xjH5
         dpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvx8ec9CjLq+Qe/vAvLnZYGdxL47fIToyQ971t0HEAeflnDh4t26rRJlKrBFNAepCanQipdpbkFaIHG8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1I+elIxTclEdQ2SlUu+HexU8pHLTk4AbEJWFGaxLU1CxrNBPv
	2ffysaJcqomMZu5AhUjanmKFEpp4Oiy80sQWQ75eDNnfxAtj+xWXYFnME9L1FWGE/HRwe3Q/ybV
	9zngEk8eqvA==
X-Google-Smtp-Source: AGHT+IH525RHk7TKEj1hUHKOafM1gtCu87+O6jYclIwLkjc6aiNko3Kn8b5jCg8kjhrgWjnMnklTsPnuEiJg
X-Received: from plbmn13.prod.google.com ([2002:a17:903:a4d:b0:231:cb69:764d])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:a509:b0:235:ea29:28da
 with SMTP id d9443c01a7336-2364c8d0c21mr12020205ad.17.1749685133982; Wed, 11
 Jun 2025 16:38:53 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:37:05 -0700
In-Reply-To: <20250611233706.572784-1-chullee@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611233706.572784-1-chullee@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611233706.572784-2-chullee@google.com>
Subject: [PATCH 1/2] f2fs: Apply bio flags to direct I/O
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
 fs/f2fs/data.c |  8 ++++----
 fs/f2fs/f2fs.h |  2 ++
 fs/f2fs/file.c | 12 ++++++++++++
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..966cea75874c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 	return 0;
 }
 
-static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
+blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
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
+	if (fio->inode && fio->type == DATA &&
+	    F2FS_I(fio->inode)->ioprio_hint == F2FS_IOPRIO_WRITE)
 		op_flags |= REQ_PRIO;
 
 	return op_flags;
@@ -2783,6 +2782,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	int err = 0;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
+		.inode = inode,
 		.ino = inode->i_ino,
 		.type = DATA,
 		.op = REQ_OP_WRITE,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01..162d79a3c1a5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1233,6 +1233,7 @@ enum iostat_type {
 
 struct f2fs_io_info {
 	struct f2fs_sb_info *sbi;	/* f2fs_sb_info pointer */
+	struct inode *inode;
 	nid_t ino;		/* inode number */
 	enum page_type type;	/* contains DATA/NODE/META/META_FLUSH */
 	enum temp_type temp;	/* contains HOT/WARM/COLD */
@@ -3972,6 +3973,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 		block_t blk_addr, sector_t *sector);
 int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
+blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio);
 void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..4fd45e94661a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5015,6 +5015,18 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
 	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
 
+	/* if fadvise set to hot, override the temperature */
+	struct f2fs_io_info fio = {
+		.sbi = sbi,
+		.inode = inode,
+		.type = DATA,
+		.op = REQ_OP_WRITE,
+		.temp = file_is_hot(inode) ? HOT : temp,
+		.op_flags = bio->bi_opf,
+		.page = NULL,
+	};
+	bio->bi_opf |= f2fs_io_flags(&fio);
+
 	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
 	submit_bio(bio);
 }
-- 
2.50.0.rc1.591.g9c95f17f64-goog

