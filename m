Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BF226861
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024017; cv=none; b=OWR10KzaibmnSW2tztM99TNFZocMUUMEIDv00ZrJJY2yTEOuYqbUbqi26a7DBtAL+Mm6d/gphnqj/EcTfmOhMe0IBBX2Et2BHjEgdmhh3tF4XFU0b5xMpxCtfdmHsFxX0EiWLstKcFj35ijazkdmvCQ7KcxTMQlyFIzXG5elHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024017; c=relaxed/simple;
	bh=jG8CqV3hPIBQ0Uf5FIqMeh+6Ze34guG0EgnMdTaWVSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyAxGeswRKy2pTa79IknQbchYsZ18TfEyCuOTz8aZfL2NOShJXsdjyX1NxvczyX6VzpTsIcASwPB3GLRDnTTIZGDZ++WdZZp32iwiZ4uY+OmEsgnJvj99kbBrKNV5KlEQLnUdujj5K3KU9ZBQbC7GvtlzQvJGV1RQlJqdrBmqJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IglR0klx; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IglR0klx"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30572effb26so3645120a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744024015; x=1744628815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzKmZuYPn0pUxFB9FJAdoZX8qB0+HOaGeZ4/x0ViQnM=;
        b=IglR0klxaezQftz3lf1Tw2EZFSNO6ClWoJbjDBiFPpv6AHap2iLAQ75tcadHjZmALF
         +Hc5NiGRn1ySWQ0jomWlHBUAahq7DQCLotMsr2vv7zAMwfXv7GrC4lta0q6i+xa3QkM1
         sGNEj1zEefUxC/2wguFXQvYlrgmc5QpMUoa079euccZaJYP8gJo/d9oA4ckPrmq8ABzA
         gZVgHdosSzrIbeJt23pUllUy/+ICsWdxh7Y4N3iIZC0x011/Ql+Wsd903B83RoJBCDOI
         oWXoAPChw51IP99gWytUeB9QRzw5wJaw9vI9hFLYsFRIxyGzyuCw10P3yUlzKI9V3KFQ
         msoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024015; x=1744628815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzKmZuYPn0pUxFB9FJAdoZX8qB0+HOaGeZ4/x0ViQnM=;
        b=OkKV8t4H8dnU7Ss94MGcr1H9pHi5Ul1pWfyRI32T5yhPt+cWW3lGSbPbRUiqBeok0X
         kuAn2xYm22XwL3bqjvy/E2sN+p6SA2wGBJurMZKOhmliOKVFeDscaYNhncImoF58Vsm5
         /NHXRJenhXV3VOoXaHdwmFovbWS0O38PksmL0n13sM+tBul8tew4kIkXGqaNYZ6p3s0I
         KsitiuHWw22srSYAzqvJwJ9wmCBmJbRid8yPhvjjCeFnmKUpj84Wn8Bd5olAaD4XWhwC
         25iJB0CXzZSsnxulcbwc6v71IsgjfUA8m4B8ogPHDTapNVIJG5AGJPe9rAAfuuPJj+qR
         ElbA==
X-Forwarded-Encrypted: i=1; AJvYcCV5QYfuIaeW93CKn5y6VDjJhW+6hUruYTR1OMipHf9PBaxlFfE2ZefO5JFYeWGB2y0UIuTjl5nceyTfIUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbcDdaXGEmQ3CHS8gwjiX8DUQ5aZVUud0qdAWaSnqK2UkyV18O
	PqR5urSPU4uBPWg5IuZJzdcVYBImF5na8vrmmUOWe+CbEVw4tVNz
X-Gm-Gg: ASbGnct5Ga9wxkHBqjqBfEDM0G4lgMJICFGm2jQTFPkGQOInNdZjuthklMR61vdFmuk
	bIVdZM7MXPElG999MeP9aqIpTTCs8liFEXfTjxdt6CJYzyWSENcAwXfYJoNq7BfICTIm6hf/KU5
	JhJxi1iMlD7ypRUf9QQSBidBj9lgvRbwIqsMOSUyPGPAf84PJ1N2mrClDJ8yHkDGsjc/EcQL+Ff
	urIz1Kq4eMM4q4FlDhV9tx1+UJYActbYzI8RGA69CH8Du6ke/HGsVOOf69pfvLTC7FDngT168U4
	7AZ4072EV4htx6D4TpRY+DHeApD7GaGjJKLUkC/5G7ljQUG3wRU=
X-Google-Smtp-Source: AGHT+IEFUT2afZfFzltBDlWTMxjermADofrbcz2LpbaWF7nQH4GJjL2VuVjpVpe1ZFmIbvBgXYtxuA==
X-Received: by 2002:a17:90a:e18f:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-306a4b7101fmr15875558a91.27.1744024014859;
        Mon, 07 Apr 2025 04:06:54 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d672sm8783946a91.31.2025.04.07.04.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:06:54 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: xiang@kernel.org,
	hsiangkao@linux.alibaba.com,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Sheng Yong <shengyong1@xiaomi.com>,
	Wang Shuai <wangshuai12@xiaomi.com>
Subject: [PATCH v3 2/2] erofs: add 'offset' mount option for file-backed & bdev-based mounts
Date: Mon,  7 Apr 2025 19:05:51 +0800
Message-ID: <20250407110551.1538457-2-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407110551.1538457-1-shengyong1@xiaomi.com>
References: <20250407110551.1538457-1-shengyong1@xiaomi.com>
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

To address this issue, this patch adds a new mount option `offset=x'
to accept a start offset for both file-backed and bdev-based mounts.
The offset should be aligned to block size. EROFS will add this offset
before performing read requests.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>
---
 Documentation/filesystems/erofs.rst |  1 +
 fs/erofs/data.c                     |  8 ++++++--
 fs/erofs/fileio.c                   |  4 +++-
 fs/erofs/internal.h                 |  2 ++
 fs/erofs/super.c                    | 24 +++++++++++++++++++++++-
 fs/erofs/zdata.c                    | 22 ++++++++++++++--------
 6 files changed, 49 insertions(+), 12 deletions(-)
---
v3: * rename `offs' to `off'
    * parse offset using fsparam_u64 and validate it in fill_super
    * update bi_sector inline

v2: * add a new mount option `offset=X' for start offset, and offset
       should be aligned to PAGE_SIZE
    * add start offset for both file-backed and bdev-based mounts
    https://lore.kernel.org/linux-erofs/0725c2ec-528c-42a8-9557-4713e7e35153@linux.alibaba.com

v1: https://lore.kernel.org/all/20250324022849.2715578-1-shengyong1@xiaomi.com/

diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index c293f8e37468..44dbfa6cffb1 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -128,6 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
 fsid=%s                Specify a filesystem image ID for Fscache back-end.
 domain_id=%s           Specify a domain ID in fscache mode so that different images
                        with the same blobs under a given domain ID can share storage.
+offset=%s              Specify image offset for file-backed or bdev-based mounts.
 ===================    =========================================================
 
 Sysfs Entries
diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 2409d2ab0c28..7da503480f4d 100644
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
+		iomap->addr = EROFS_SB(sb)->dif0.off + mdev.m_pa;
 		if (flags & IOMAP_DAX)
 			iomap->addr += mdev.m_dif->dax_part_off;
 	}
diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 4fa0a0121288..2c003cbb0fbb 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -52,7 +52,9 @@ static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
 
 	if (!rq)
 		return;
-	rq->iocb.ki_pos = rq->bio.bi_iter.bi_sector << SECTOR_SHIFT;
+
+	rq->iocb.ki_pos = EROFS_SB(rq->sb)->dif0.off +
+				(rq->bio.bi_iter.bi_sector << SECTOR_SHIFT);
 	rq->iocb.ki_ioprio = get_current_ioprio();
 	rq->iocb.ki_complete = erofs_fileio_ki_complete;
 	if (test_opt(&EROFS_SB(rq->sb)->opt, DIRECT_IO) &&
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
index cadec6b1b554..bd2a2c634f1d 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -356,7 +356,7 @@ static void erofs_default_options(struct erofs_sb_info *sbi)
 
 enum {
 	Opt_user_xattr, Opt_acl, Opt_cache_strategy, Opt_dax, Opt_dax_enum,
-	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio,
+	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio, Opt_offset,
 	Opt_err
 };
 
@@ -384,6 +384,7 @@ static const struct fs_parameter_spec erofs_fs_parameters[] = {
 	fsparam_string("fsid",		Opt_fsid),
 	fsparam_string("domain_id",	Opt_domain_id),
 	fsparam_flag_no("directio",	Opt_directio),
+	fsparam_u64("offset",		Opt_offset),
 	{}
 };
 
@@ -507,6 +508,9 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 		errorfc(fc, "%s option not supported", erofs_fs_parameters[opt].name);
 #endif
 		break;
+	case Opt_offset:
+		sbi->dif0.off = result.uint_64;
+		break;
 	}
 	return 0;
 }
@@ -600,6 +604,22 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 				&sbi->dif0.dax_part_off, NULL, NULL);
 	}
 
+	if (sbi->dif0.off) {
+		loff_t devsz;
+
+		if (sbi->dif0.off & ((1 << sbi->blkszbits) - 1))
+			return invalfc(fc, "offset %lld not aligned to block size",
+				       sbi->dif0.off);
+		if (sb->s_bdev)
+			devsz = bdev_nr_bytes(sb->s_bdev);
+		else if (erofs_is_fileio_mode(sbi))
+			devsz = i_size_read(file_inode(sbi->dif0.file));
+		else
+			return invalfc(fc, "offset only supports file or bdev backing");
+		if (sbi->dif0.off + (1 << sbi->blkszbits) > devsz)
+			return invalfc(fc, "offset exceeds device size");
+	}
+
 	err = erofs_read_superblock(sb);
 	if (err)
 		return err;
@@ -948,6 +968,8 @@ static int erofs_show_options(struct seq_file *seq, struct dentry *root)
 	if (sbi->domain_id)
 		seq_printf(seq, ",domain_id=%s", sbi->domain_id);
 #endif
+	if (sbi->dif0.off)
+		seq_printf(seq, ",offset=%lld", sbi->dif0.off);
 	return 0;
 }
 
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..671527b63c6d 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1624,7 +1624,8 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 				 bool *force_fg, bool readahead)
 {
 	struct super_block *sb = f->inode->i_sb;
-	struct address_space *mc = MNGD_MAPPING(EROFS_SB(sb));
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
+	struct address_space *mc = MNGD_MAPPING(sbi);
 	struct z_erofs_pcluster **qtail[NR_JOBQUEUES];
 	struct z_erofs_decompressqueue *q[NR_JOBQUEUES];
 	struct z_erofs_pcluster *pcl, *next;
@@ -1673,12 +1674,15 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 			if (bio && (cur != last_pa ||
 				    bio->bi_bdev != mdev.m_bdev)) {
 drain_io:
-				if (erofs_is_fileio_mode(EROFS_SB(sb)))
+				if (erofs_is_fileio_mode(sbi)) {
 					erofs_fileio_submit_bio(bio);
-				else if (erofs_is_fscache_mode(sb))
+				} else if (erofs_is_fscache_mode(sb)) {
 					erofs_fscache_submit_bio(bio);
-				else
+				} else {
+					bio->bi_iter.bi_sector +=
+						sbi->dif0.off >> SECTOR_SHIFT;
 					submit_bio(bio);
+				}
 
 				if (memstall) {
 					psi_memstall_leave(&pflags);
@@ -1703,7 +1707,7 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 			}
 
 			if (!bio) {
-				if (erofs_is_fileio_mode(EROFS_SB(sb)))
+				if (erofs_is_fileio_mode(sbi))
 					bio = erofs_fileio_bio_alloc(&mdev);
 				else if (erofs_is_fscache_mode(sb))
 					bio = erofs_fscache_bio_alloc(&mdev);
@@ -1732,12 +1736,14 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 	} while (next != Z_EROFS_PCLUSTER_TAIL);
 
 	if (bio) {
-		if (erofs_is_fileio_mode(EROFS_SB(sb)))
+		if (erofs_is_fileio_mode(sbi)) {
 			erofs_fileio_submit_bio(bio);
-		else if (erofs_is_fscache_mode(sb))
+		} else if (erofs_is_fscache_mode(sb)) {
 			erofs_fscache_submit_bio(bio);
-		else
+		} else {
+			bio->bi_iter.bi_sector += sbi->dif0.off >> SECTOR_SHIFT;
 			submit_bio(bio);
+		}
 	}
 	if (memstall)
 		psi_memstall_leave(&pflags);
-- 
2.43.0

