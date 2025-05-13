Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87BC120
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136109; cv=none; b=Hkjjuy/gWy7dxBC26KbuhrjnHV2j8tLYceajD4xgnxQtOPlggpUGgOyrsJc70CDORC04pF8koExpTM9saXZzU4heyqE5oW77rR5pnHJoE7XAco0FL3Ao66gED46ZharnS/MK9Ls5d9moO7qxwz6C2XdUUAsO/TsWbpGi8+SuIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136109; c=relaxed/simple;
	bh=jA/bO+A3eXaKSwDUgxqd8WCBzqfOLlSpBPXj9Xe4Bfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPlgTSDSP1tlo+bYZnmnCaXfsTkg07iJ3DM+gXDthOSWn4Bm/Xl4E+G2sQcxGrnD0dxED6r1nR24P670RzU/lIXK8jLpcG6LfD4+rBNxoByU9TCEecQODPllnRgrYoqUZpFF3dbk3wDx1I4M0rE4zZ/3rZocHaTQZVlS1p2xhIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo8y2pXI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo8y2pXI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22e730c05ddso49967145ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747136107; x=1747740907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i303ni/AutIBcG+kKeKejVPACdAC0+SjuJ7S0N7DlL4=;
        b=Vo8y2pXIozGzdpNDbI1Ay5OHRLg7kvmTAMJmY2nZEJo4cs3aDeJIY9LOcKoqeQeaQb
         FQE5j1kmaVHL3KwCOt+0sjXmayIpY4poR4XvUqiy+OO+l87JUBezaVMA0nFGpQDYHfuQ
         PCh4ZppsDnB66WtCtk6h8nR6DK8wNylA8b3QJCArUg+k5bL2F4LAEky3gbmgmx75ggLb
         JQ9aIjy4UQjReO0UUB2jpNLp65/UOdEGqpym8vC2H6xr9cdF+Hm9GF+aIU7xPsnRwn2E
         lF7pUrEHYnRfhrf9H0FTwyyOm6eoH4Vo4rwwRtMK952GQ2+L8X4OHnTXEkPh1eVLLgKw
         hO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747136107; x=1747740907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i303ni/AutIBcG+kKeKejVPACdAC0+SjuJ7S0N7DlL4=;
        b=NuXwqRX7ob+oPJwwIL2KV66hmBLx82rOKVitLVKAB0TBDZ3ZXfcRr8vgK+bVJWUd3a
         VY8f5kIjB2S8wH7WLhSiblvzycspSltQBSnDqUHB5pDmmyThjSGLJDxNREvx2jzlxKbo
         +1L44zTAFPpWNexD4E7JABfwBjRsRzTR/vQ2/cmYV5Edc7Djqb3OiXhwoUgiLGeHBQRw
         3gPtEAKhEQS8gOYz63BQbWGcccohX0aTG9MOcmH+3Z2kyxYt4EyPJfRPDnttHOVYFGWy
         /hf7xuNUtW+SKkYzy+j75zTS6M/NGVqY+KvzNBwTLcmiNPb+AEouD355gV+Nj5mMUWBc
         lZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCWij2S1KGLEqrTyWU+l2/uIhg1ILH11fvuWh9O1vaTD0TUV6XulkZfzAcmhkPaHhWn40dPPJzCpgsuEV8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJbs48cT9XLEMCZ66hKij06a+lO1ZwT0y63UBkI40Zps7qQMc+
	A+/2Hyf1YbBrDunHB7f9GBv4u9qF7Jukz11pHOmY2PY+i6A8s41J
X-Gm-Gg: ASbGncuV5k98QjMSqUczj1rP8K8ZEuZlXq7n7JBrENMBmMYMeyb2ntXtEd74AlsUHSo
	4a9To4JC4AKN3lVZt/+ZqUyhHHjN3J82Gd0ZE5NYDPYAI1gib+MEBWe+MuuWmO7l0ig18Uot9Im
	gAEMgjZoB77P8VQV7ocJm111hFbsPZBgusUl5rIHJFOwozSnFsaLd2j7a5t0+/Wtfi3+qIlX1JQ
	K2vFUoA7CX9ByFWVvKUAfEP0QIi5YNCe5q0GCZ6WObtOM2R6XwgkgVavq4NAOnUVHU9Pg/dah2G
	QtR5VraZ29aXyIFnpRfu5A5BBFmF2dLkDb8WcHDe4TCf1q/k3oWIi2srYg==
X-Google-Smtp-Source: AGHT+IEZ6uhxJoSQjtezZ1EGnoLmBU7rGvVvMw9O6F4tO0bJno62UOeduJ2saEv4mahxAg88/WVjfw==
X-Received: by 2002:a17:902:ccc8:b0:22e:50e1:73e with SMTP id d9443c01a7336-22fc8b3b3aamr242332625ad.14.1747136106999;
        Tue, 13 May 2025 04:35:06 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829f349sm78509185ad.217.2025.05.13.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:35:06 -0700 (PDT)
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
	Sheng Yong <shengyong1@xiaomi.com>,
	Wang Shuai <wangshuai12@xiaomi.com>
Subject: [PATCH v5 1/2] erofs: add 'fsoffset' mount option for file-backed & bdev-based mounts
Date: Tue, 13 May 2025 19:34:17 +0800
Message-ID: <20250513113418.249798-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng Yong <shengyong1@xiaomi.com>

When attempting to use an archive file, such as APEX on android,
as a file-backed mount source, it fails because EROFS image within
the archive file does not start at offset 0. As a result, a loop
device is still needed to attach the image file at an appropriate
offset first. Similarly, if an EROFS image within a block device
does not start at offset 0, it cannot be mounted directly either.

To address this issue, this patch adds a new mount option `fsoffset=x'
to accept a start offset for both file-backed and bdev-based mounts.
The offset should be aligned to block size. EROFS will add this offset
before performing read requests.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>
---
 Documentation/filesystems/erofs.rst |  1 +
 fs/erofs/data.c                     |  8 ++++++--
 fs/erofs/fileio.c                   |  3 ++-
 fs/erofs/internal.h                 |  2 ++
 fs/erofs/super.c                    | 12 +++++++++++-
 fs/erofs/zdata.c                    |  3 ++-
 6 files changed, 24 insertions(+), 5 deletions(-)
---
v5: * fix fsoffset on multiple device by adding off when creating io
      request, erofs_map_device selects the target device an only
      primary device has an off
    * remove unnecessary checks of fsoffset value
    * try to combine off and dax_part_off, but it is not easy to do
      that, because dax_part_off is not needed when reading metadata

v4: * change mount option `offset=x' to `fsoffset=x'
https://lore.kernel.org/linux-erofs/c5110e03-90ea-40be-b05f-bc920332a1e1@linux.alibaba.com

v3: * rename `offs' to `off'
    * parse offset using fsparam_u64 and validate it in fill_super
    * update bi_sector inline
    https://lore.kernel.org/linux-erofs/98585dd8-d0b6-4000-b46d-a08c64eae44d@linux.alibaba.com

v2: * add a new mount option `offset=X' for start offset, and offset
       should be aligned to PAGE_SIZE
    * add start offset for both file-backed and bdev-based mounts
    https://lore.kernel.org/linux-erofs/0725c2ec-528c-42a8-9557-4713e7e35153@linux.alibaba.com

v1: https://lore.kernel.org/all/20250324022849.2715578-1-shengyong1@xiaomi.com/

diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index c293f8e37468..0fa4c7826203 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -128,6 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
 fsid=%s                Specify a filesystem image ID for Fscache back-end.
 domain_id=%s           Specify a domain ID in fscache mode so that different images
                        with the same blobs under a given domain ID can share storage.
+fsoffset=%s            Specify image offset for file-backed or bdev-based mounts.
 ===================    =========================================================
 
 Sysfs Entries
diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 2409d2ab0c28..599a44d5d782 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -27,9 +27,12 @@ void erofs_put_metabuf(struct erofs_buf *buf)
 
 void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
 {
-	pgoff_t index = offset >> PAGE_SHIFT;
+	pgoff_t index;
 	struct folio *folio = NULL;
 
+	offset += buf->off;
+	index = offset >> PAGE_SHIFT;
+
 	if (buf->page) {
 		folio = page_folio(buf->page);
 		if (folio_file_page(folio, index) != buf->page)
@@ -54,6 +57,7 @@ void erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb)
 	struct erofs_sb_info *sbi = EROFS_SB(sb);
 
 	buf->file = NULL;
+	buf->off = sbi->dif0.off;
 	if (erofs_is_fileio_mode(sbi)) {
 		buf->file = sbi->dif0.file;	/* some fs like FUSE needs it */
 		buf->mapping = buf->file->f_mapping;
@@ -299,7 +303,7 @@ static int erofs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		iomap->private = buf.base;
 	} else {
 		iomap->type = IOMAP_MAPPED;
-		iomap->addr = mdev.m_pa;
+		iomap->addr = mdev.m_dif->off + mdev.m_pa;
 		if (flags & IOMAP_DAX)
 			iomap->addr += mdev.m_dif->dax_part_off;
 	}
diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 60c7cc4c105c..a2c7001ff789 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -147,7 +147,8 @@ static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
 				if (err)
 					break;
 				io->rq = erofs_fileio_rq_alloc(&io->dev);
-				io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
+				io->rq->bio.bi_iter.bi_sector =
+					(io->dev.m_dif->off + io->dev.m_pa) >> 9;
 				attached = 0;
 			}
 			if (!bio_add_folio(&io->rq->bio, folio, len, cur))
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 4ac188d5d894..10656bd986bd 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -43,6 +43,7 @@ struct erofs_device_info {
 	char *path;
 	struct erofs_fscache *fscache;
 	struct file *file;
+	loff_t off;
 	struct dax_device *dax_dev;
 	u64 dax_part_off;
 
@@ -199,6 +200,7 @@ enum {
 struct erofs_buf {
 	struct address_space *mapping;
 	struct file *file;
+	loff_t off;
 	struct page *page;
 	void *base;
 };
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index da6ee7c39290..512877d7d855 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -356,7 +356,7 @@ static void erofs_default_options(struct erofs_sb_info *sbi)
 
 enum {
 	Opt_user_xattr, Opt_acl, Opt_cache_strategy, Opt_dax, Opt_dax_enum,
-	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio,
+	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio, Opt_fsoffset,
 };
 
 static const struct constant_table erofs_param_cache_strategy[] = {
@@ -383,6 +383,7 @@ static const struct fs_parameter_spec erofs_fs_parameters[] = {
 	fsparam_string("fsid",		Opt_fsid),
 	fsparam_string("domain_id",	Opt_domain_id),
 	fsparam_flag_no("directio",	Opt_directio),
+	fsparam_u64("fsoffset",		Opt_fsoffset),
 	{}
 };
 
@@ -506,6 +507,9 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 		errorfc(fc, "%s option not supported", erofs_fs_parameters[opt].name);
 #endif
 		break;
+	case Opt_fsoffset:
+		sbi->dif0.off = result.uint_64;
+		break;
 	}
 	return 0;
 }
@@ -599,6 +603,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 				&sbi->dif0.dax_part_off, NULL, NULL);
 	}
 
+	if (sbi->dif0.off & ((1 << sbi->blkszbits) - 1))
+		return invalfc(fc, "fsoffset %lld not aligned to block size",
+			       sbi->dif0.off);
+
 	err = erofs_read_superblock(sb);
 	if (err)
 		return err;
@@ -947,6 +955,8 @@ static int erofs_show_options(struct seq_file *seq, struct dentry *root)
 	if (sbi->domain_id)
 		seq_printf(seq, ",domain_id=%s", sbi->domain_id);
 #endif
+	if (sbi->dif0.off)
+		seq_printf(seq, ",fsoffset=%lld", sbi->dif0.off);
 	return 0;
 }
 
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index b8e6b76c23d5..4f910d7ffb2f 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1707,7 +1707,8 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 					bio = bio_alloc(mdev.m_bdev, BIO_MAX_VECS,
 							REQ_OP_READ, GFP_NOIO);
 				bio->bi_end_io = z_erofs_endio;
-				bio->bi_iter.bi_sector = cur >> 9;
+				bio->bi_iter.bi_sector =
+						(mdev.m_dif->off + cur) >> 9;
 				bio->bi_private = q[JQ_SUBMIT];
 				if (readahead)
 					bio->bi_opf |= REQ_RAHEAD;
-- 
2.43.0

