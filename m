Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CC230BDC
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386069; cv=none; b=tZI2R6L6YtA/GN2ZaD/Yxj+UObTHggB02g2Yvb5DcnY9sXPWgSZq8iyqDvtVxtcI8fMh/7iBuUuvIqP3RsFoBE4lgVggFJ1h7CJkzwwcokuvowNtAVDGWRfOKz3F0YOjILwdHoEobZBHjsKVlNyyDbQfBEJEiwXMAUL9URM8JIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386069; c=relaxed/simple;
	bh=ZbPxXtCPwmWQcmOtwDbmwXuuweRUuckOL3a9tn9T7cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ma8lZWlQjyep+9JMkJE/OuCgQftXdFUcejRpU8UjzMp8sB7uTZ0yd6IegasRWv/S0b62MxLgDlmhwkEtRne2UOscqVDLe1f0XwSgYZCxqTxv2Br7p18c1Hr33BxvoOhbUD7lMrj/0Zqc3BtZxLwyQ5//u0w+iblWnTOvCjzDgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMjntPLU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMjntPLU"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742596d8b95so2504792b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747386067; x=1747990867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkthQPsz64TyOCZT4K9/BOr4xyvnTi+7/s58T/M8D44=;
        b=iMjntPLUkMvygnfWoPiiQJFzKtJ3unpkDi7KX0q+nJYvEQvmK7Tv9BxdpFYB0ZWYsa
         OAN8WZBRlykg5blUrgxJ1vBU7aDOWP02O95jBDW1HucTJldx8hBDU0gpLujaVeOHT70S
         +MPV098wmqXjhhIPa2rKPYeF0gnrkFJ3+l6t/IMX8z4JkkmZGDPDRpB8i0MxnPdFH/1L
         IpE+bTLNqVDWI95eSNPOSDSZFCOO6Y9fP2JAN9oID/2HwXldE1GQD51iiktKGX5yaf3/
         6ELXarUSjlhEvg1mX173YOx011QF+aQck5hD/kAA6uQrLEtHH5zXhWQyW9BeS22cF/O5
         gkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386067; x=1747990867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkthQPsz64TyOCZT4K9/BOr4xyvnTi+7/s58T/M8D44=;
        b=jYZVp1tfTZWIATE0YTYu0IlxbFB3YYZCWBWeBJC085poA2H7NGkX707QBiYjWI8OKs
         ZP0yrc3+E7Op/ZnHIhYZJZBJmQfrXOdHfSekNijh2ka8kdHxhM2eXGkHpp+BwhbuiAlD
         wjOiF8nax7UDMQIMbY6+NeAIGAZKxy2o4mQQD9Qk0r1MFK6hV3kojqMT75XwCpl5PBs2
         1wws2vMue+SjgFXbkkkBaOk1iaH7jyDSc1KnD4dAZfErzFP5TbNOa8YYu3MjQ1Uv8G2M
         NMY+Cw20k9Whzs/qreIOBbHBIZiY6wasEtPKGgNJ3ItjAwaNzvJ2nJYdjHiTW6gTXQt0
         s5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU5i6XciiNSYgEnBI6AAz9blw6rt9on6hR+YT2OLV5W+BmaOgnrUcTKCS3UqXKgykmkyeGLQulKegFboA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMASceKvKFalZ5+jOwRu2Z7bvg/OQVj5WVthnKAm/FXPHHZhQG
	gNG4Ht3GMIAoJ3ZxYNL0hDsnci79bc8gPe4Zk68sMKUrWpnrhxdiWWQi
X-Gm-Gg: ASbGncvbp9suM7p1N56Tr1xfgZ/wu66hB9jAO/5RLyz48peOGs6DoFDf4QENrz9+Osb
	JBpL8T+/vSSvupdOZYntGBe+oZEvIMW7AV3m9CUsfFuXLyZxvwSkJPeaE80z6wYZnGiy1l9aSlh
	Cnevx7VdpR2e0yaTM10tgn0vGRcBHfrEI9mgttwsk19Ewe6jyJhaJxxGCRSMNDWKnnWBQ/fSwSd
	HdN4Ahl9A9WZganW4SZURiqeShJ9KSJ4sJDSTb6vSMIIuZAd4U9/AeBH0wBgq6GOu7n409v5Cr9
	s2UigRYqKevMDB7X64y+WkZnb0mY4SZ8gXffkwzI0SfSOBEabANX4JvXkLss+pSClvkD
X-Google-Smtp-Source: AGHT+IGajjN7pnf+hHSGHrxpstiUL1UW4ewfRZKOSQkXmuUgiVPDQ3ZQIP4+oKjUfkNL2UV5TS1YLw==
X-Received: by 2002:a05:6a20:3d11:b0:1f5:7d57:830f with SMTP id adf61e73a8af0-216219c83a3mr3041893637.33.1747386067028;
        Fri, 16 May 2025 02:01:07 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb084428sm1133402a12.57.2025.05.16.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:01:06 -0700 (PDT)
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
	Sheng Yong <shengyong1@xiaomi.com>,
	Wang Shuai <wangshuai12@xiaomi.com>
Subject: [PATCH v6] erofs: add 'fsoffset' mount option for file-backed & bdev-based mounts
Date: Fri, 16 May 2025 17:00:55 +0800
Message-ID: <20250516090055.3343777-1-shengyong1@xiaomi.com>
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
v6: * fix fsoffset value type in documentation
    * change `off' type to u64

v5: * fix fsoffset on multiple device by adding off when creating io
      request, erofs_map_device selects the target device an only
      primary device has an off
    * remove unnecessary checks of fsoffset value
    * try to combine off and dax_part_off, but it is not easy to do
      that, because dax_part_off is not needed when reading metadata
    https://lore.kernel.org/linux-erofs/f62b0d18-f5af-4063-b644-f6b8069ca200@gmail.com

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
index c293f8e37468..b24cb0d5d4d6 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -128,6 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
 fsid=%s                Specify a filesystem image ID for Fscache back-end.
 domain_id=%s           Specify a domain ID in fscache mode so that different images
                        with the same blobs under a given domain ID can share storage.
+fsoffset=%lu           Specify image offset for file-backed or bdev-based mounts.
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
index 4ac188d5d894..cd8c738f5eb8 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -43,6 +43,7 @@ struct erofs_device_info {
 	char *path;
 	struct erofs_fscache *fscache;
 	struct file *file;
+	u64 off;
 	struct dax_device *dax_dev;
 	u64 dax_part_off;
 
@@ -199,6 +200,7 @@ enum {
 struct erofs_buf {
 	struct address_space *mapping;
 	struct file *file;
+	u64 off;
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

