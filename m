Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB841126BF7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743388226; cv=none; b=C/zwJRlOv8gOLEtfjh/TOGY4R4WvLarIf+3953FNY4k5Jt9VB1xQbV+HZbWw8w/TpSKLG8x+px/ourSHLo3Y563hIQJwnXhwZWIXCFUXc/TLP4vY3GmRjAZUFsyODoALEy44mEK+m5zg3SXnp4NzmxBDtU//auWOWG5swOjjHdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743388226; c=relaxed/simple;
	bh=dItJ5RHUWEnSfQpUUAbZoL4eOymyndXizKKDWe3bJQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJTrYAW57LqCC+39oB9L+/rWIQNgNLHFRkQ4A00iUS3C8nwHdnd6Yea5IdXZbwg4ZoxfT6mOvpjZ2MvTGMe1sAKUmiR5WQok6dcF8EFwJiWwnEMwxa1mhZOxhgUPTQqXR4fYszoU3DQoj5P6AeIT5926pMc5bboatp6DxaISnAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwmTpWg9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwmTpWg9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22622ddcc35so48890115ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743388224; x=1743993024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTyyxUYhwq66mIAa/IvJoiVtxddqgIA29vA5Ht3bWBs=;
        b=AwmTpWg9D0k6scYuDIl0V7A70R5Fo8HoODXwfFF6j7vjHQxVN4vYO4bCmYJukKiTjQ
         y/PZ/FIzlvoKTnqIw5YZjnumsv2nb5tdBHyzMWlHfj9UxO+kyosnA4mx8euDN9C79Bc1
         OzefC56vbgC+ZIFvHT5HyATARCR6GVnSitYV+yJyr++CY8LTxV8dJqvsvBcOYhO4HuoV
         svknn8ipxwAbfi6vJDLkZABjLkp77Z+8kUDODxrI4iNijyvIqWA6b1ZQQlIgy77VJU+P
         gBjPecgwtNkZ1pZ4+69nZYvNXiD1+n09TvRzBDXEundoJnU+VfnK1bj8vQN5X/uXRqHN
         h/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743388224; x=1743993024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTyyxUYhwq66mIAa/IvJoiVtxddqgIA29vA5Ht3bWBs=;
        b=Jow986xW/fH8KIScehi6FO3zL0LSr/kK80IrTikQ2ShBEdE5k+PuIbKgi4FzMAgCd5
         mPDz3XaXVnZgm9iH6JaSMVIfhJbHBckfX9KOZS55OBIAU23q1OIkp14PBPymgmpkhZ4Q
         sk7Zhk1YGxIKg0BVkSg190ZNWt6KNBfL+ILFigtvd15ds5jhbBOOQtQqhRlgYFce5pDT
         4jDiMSwfhEaE9eqFjBWj4osCQezq365ZpuYZizqV87Fl34QOz9g8fDqw4iJ6t9KsPaWF
         5HFzkx9cvjek6ofZnh6bZdtUHCrDx9TyVvn5ILht1b8kaY9uEtEmaBPuwoFwMcCQTDgf
         nxiw==
X-Gm-Message-State: AOJu0YyQ6yF+SFjtvD2NzIiY2bg6U2nxm4PmSUanCLdNOUepDgM/3q3M
	YYtu9zofJixA3n5PbmyEeAkbllQYJ0MqA10wUrk+DOiRIDQxA1uU
X-Gm-Gg: ASbGncs+RYh4+Kmj0ByR6WboIqLXzosz3KB2wktzjsS928gxic/YmKuxUIe8GdRj2Uz
	CO8Z0kYlmEtUN5YudRWErGpHyIxPdaJvLgAQQinHPd3UfDAoxJWupxW4z9fFcaOhk3/sCuhRSyV
	xK1ejTMZyRKVCUcsxBg1ZIJmv4xBJdz2cBcBsRzW+IFzZ/tPHeF21jwPJnq2ogMJD6W7M2AVagz
	1xUnoWwzZzuvy2LE5zZUZ4BwfnbKlNm4nLABzwkQ+AAj/b9kKNwSO9nmSkWjy9DR+gTU03PcpTa
	6hUyLcTpOCI+tVvkWHBhHunDuXADjqoFmF1rFUXoZ0amC9UEivQ=
X-Google-Smtp-Source: AGHT+IFdVAOcjpPWTnV2jnq2FgWj09+eoRXi3nsOYDw3M7f9um2NA4qJCbc4nLo5pBc3+wO+IwMz7A==
X-Received: by 2002:a17:902:e946:b0:21f:52e:939e with SMTP id d9443c01a7336-2292f974bbbmr153092155ad.28.1743388223967;
        Sun, 30 Mar 2025 19:30:23 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec71cfsm59455955ad.45.2025.03.30.19.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 19:30:23 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: xiang@kernel.org,
	hsiangkao@linux.alibaba.com,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com,
	linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	wangshuai12@xiaomi.com,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v2 2/2] erofs: add 'offset' mount option for file-backed & bdev-based mounts
Date: Mon, 31 Mar 2025 10:29:38 +0800
Message-ID: <20250331022938.4090283-2-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331022938.4090283-1-shengyong1@xiaomi.com>
References: <20250331022938.4090283-1-shengyong1@xiaomi.com>
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
The offset should be aligned to PAGE_SIZE. EROFS will add this offset
before performing read requests.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>
---
 Documentation/filesystems/erofs.rst |  1 +
 fs/erofs/data.c                     |  8 ++++++--
 fs/erofs/fileio.c                   |  8 ++++++--
 fs/erofs/internal.h                 |  2 ++
 fs/erofs/super.c                    | 29 ++++++++++++++++++++++++++++-
 fs/erofs/zdata.c                    | 13 +++++++++++--
 6 files changed, 54 insertions(+), 7 deletions(-)
---
Hi, all

Sorry for late :-(

v2: * add a new mount option `offset=X' for start offset, and offset
      should be aligned to PAGE_SIZE
    * add start offset for both file-backed and bdev-based mounts
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
index 2409d2ab0c28..8dfdd0352c79 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -27,9 +27,12 @@ void erofs_put_metabuf(struct erofs_buf *buf)
 
 void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
 {
-	pgoff_t index = offset >> PAGE_SHIFT;
+	pgoff_t index;
 	struct folio *folio = NULL;
 
+	offset += buf->offs;
+	index = offset >> PAGE_SHIFT;
+
 	if (buf->page) {
 		folio = page_folio(buf->page);
 		if (folio_file_page(folio, index) != buf->page)
@@ -54,6 +57,7 @@ void erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb)
 	struct erofs_sb_info *sbi = EROFS_SB(sb);
 
 	buf->file = NULL;
+	buf->offs = sbi->dif0.offs;
 	if (erofs_is_fileio_mode(sbi)) {
 		buf->file = sbi->dif0.file;	/* some fs like FUSE needs it */
 		buf->mapping = buf->file->f_mapping;
@@ -299,7 +303,7 @@ static int erofs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		iomap->private = buf.base;
 	} else {
 		iomap->type = IOMAP_MAPPED;
-		iomap->addr = mdev.m_pa;
+		iomap->addr = EROFS_SB(sb)->dif0.offs + mdev.m_pa;
 		if (flags & IOMAP_DAX)
 			iomap->addr += mdev.m_dif->dax_part_off;
 	}
diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 4fa0a0121288..d213bcb8c6c2 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -47,15 +47,19 @@ static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
 
 static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
 {
+	struct erofs_sb_info *sbi;
 	struct iov_iter iter;
 	int ret;
 
 	if (!rq)
 		return;
-	rq->iocb.ki_pos = rq->bio.bi_iter.bi_sector << SECTOR_SHIFT;
+
+	sbi = EROFS_SB(rq->sb);
+	rq->iocb.ki_pos = sbi->dif0.offs +
+				(rq->bio.bi_iter.bi_sector << SECTOR_SHIFT);
 	rq->iocb.ki_ioprio = get_current_ioprio();
 	rq->iocb.ki_complete = erofs_fileio_ki_complete;
-	if (test_opt(&EROFS_SB(rq->sb)->opt, DIRECT_IO) &&
+	if (test_opt(&sbi->opt, DIRECT_IO) &&
 	    rq->iocb.ki_filp->f_mode & FMODE_CAN_ODIRECT)
 		rq->iocb.ki_flags = IOCB_DIRECT;
 	iov_iter_bvec(&iter, ITER_DEST, rq->bvecs, rq->bio.bi_vcnt,
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 4ac188d5d894..93fc111fa675 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -43,6 +43,7 @@ struct erofs_device_info {
 	char *path;
 	struct erofs_fscache *fscache;
 	struct file *file;
+	loff_t offs;
 	struct dax_device *dax_dev;
 	u64 dax_part_off;
 
@@ -199,6 +200,7 @@ enum {
 struct erofs_buf {
 	struct address_space *mapping;
 	struct file *file;
+	loff_t offs;
 	struct page *page;
 	void *base;
 };
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index cadec6b1b554..0569f62a76a8 100644
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
+	fsparam_string("offset",	Opt_offset),
 	{}
 };
 
@@ -411,6 +412,22 @@ static bool erofs_fc_set_dax_mode(struct fs_context *fc, unsigned int mode)
 #endif
 }
 
+static bool erofs_fc_set_offset(struct fs_context *fc,
+				struct fs_parameter *param)
+{
+	struct erofs_sb_info *sbi = fc->s_fs_info;
+	loff_t offs;
+
+	if (kstrtoll(param->string, 0, &offs) < 0 ||
+	    offs < 0 || offs & ~PAGE_MASK) {
+		errorfc(fc, "Invalid offset %s", param->string);
+		return false;
+	}
+	sbi->dif0.offs = offs;
+
+	return true;
+}
+
 static int erofs_fc_parse_param(struct fs_context *fc,
 				struct fs_parameter *param)
 {
@@ -507,6 +524,10 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 		errorfc(fc, "%s option not supported", erofs_fs_parameters[opt].name);
 #endif
 		break;
+	case Opt_offset:
+		if (!erofs_fc_set_offset(fc, param))
+			return -EINVAL;
+		break;
 	}
 	return 0;
 }
@@ -697,6 +718,10 @@ static int erofs_fc_get_tree(struct fs_context *fc)
 		file = filp_open(fc->source, O_RDONLY | O_LARGEFILE, 0);
 		if (IS_ERR(file))
 			return PTR_ERR(file);
+		if (sbi->dif0.offs + PAGE_SIZE >= i_size_read(file_inode(file))) {
+			fput(file);
+			return invalf(fc, "Start offset too large");
+		}
 		sbi->dif0.file = file;
 
 		if (S_ISREG(file_inode(sbi->dif0.file)->i_mode) &&
@@ -948,6 +973,8 @@ static int erofs_show_options(struct seq_file *seq, struct dentry *root)
 	if (sbi->domain_id)
 		seq_printf(seq, ",domain_id=%s", sbi->domain_id);
 #endif
+	if (sbi->dif0.offs)
+		seq_printf(seq, ",offset=%lld", sbi->dif0.offs);
 	return 0;
 }
 
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..dc2aa3418094 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1619,6 +1619,15 @@ static void z_erofs_endio(struct bio *bio)
 		bio_put(bio);
 }
 
+static void z_erofs_submit_bio(struct bio *bio)
+{
+	struct z_erofs_decompressqueue *q = bio->bi_private;
+	struct erofs_sb_info *sbi = EROFS_SB(q->sb);
+
+	bio->bi_iter.bi_sector += sbi->dif0.offs >> SECTOR_SHIFT;
+	submit_bio(bio);
+}
+
 static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 				 struct z_erofs_decompressqueue *fgq,
 				 bool *force_fg, bool readahead)
@@ -1678,7 +1687,7 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 				else if (erofs_is_fscache_mode(sb))
 					erofs_fscache_submit_bio(bio);
 				else
-					submit_bio(bio);
+					z_erofs_submit_bio(bio);
 
 				if (memstall) {
 					psi_memstall_leave(&pflags);
@@ -1737,7 +1746,7 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 		else if (erofs_is_fscache_mode(sb))
 			erofs_fscache_submit_bio(bio);
 		else
-			submit_bio(bio);
+			z_erofs_submit_bio(bio);
 	}
 	if (memstall)
 		psi_memstall_leave(&pflags);
-- 
2.43.0

