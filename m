Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929A4431
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747472781; cv=none; b=IXqkqktwMP/EO9c8W00TwYVaCaYLPUx1B5v6xPrNxeWVHlc/omptbl9VYPBiP+e6yQQafGSj9vf7nQSWnDsDqUuY3OmaPsLj1qwK/sEPxyY68KmbglYSTcp6hMy/0KuSrjg8blhKrZhQ+0Xnbpss3hdsAP8MEFgdzacYoFUJmlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747472781; c=relaxed/simple;
	bh=dw1OCwKJqF5FWMsvGJBBkVa6lpZd0kwQ6qw1cXs+Aq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bc0+1ecRq7kMFVq/UNsOznKbUMaKwF5V+hgBBUAvnDBYTBMQz0KLZKJQbtNQXisGdsDxyTJ5+f0Ehfk49C2jHF5HsZh55MMreZufZuzGs8AlHjwapCpqNMOIGZi38kYE548sx9pmLO9aFbCtTF57wiZcMpZHN7hm3GD6EDjuATE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6AolJcF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6AolJcF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7423df563d6so3180779b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747472779; x=1748077579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVp51yXafG+7fe/QPMMIq7tCbx1VLjBBBUO0ljfEjpI=;
        b=K6AolJcF0IEpyzeHHbaXyyQdh/hMOLlUBWvx8wHNAJK/MAnv8ChWlypHu9kKXlaODB
         3oePOY9Q3NzkiCkT0dq3kosOpSlmoMb5u5mKqvgDpRncoUuTVztpu1Th/+r+DS5lkNaq
         duMzyFF8LbdXCuONxe+gyRPyOGT/Nq7beN7gg+NrZsOvf5+QBzv5m+/v4dZffu6j12cZ
         1kb5PQvbctH6eEZPOovgbSW2eZOzv95fZgJ47XLXh0JoFpKkVEVHrGdgM9MfYb+zMfY2
         0QoyWfEQUIrrq5CpHffOFGEFbPxtrzG81oEWh+9+rz4BFRoETVB1lYfaSecNX1l7jfy8
         JnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747472779; x=1748077579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVp51yXafG+7fe/QPMMIq7tCbx1VLjBBBUO0ljfEjpI=;
        b=Uf42Y9SLEG6r30F2gIol06xUfXiuTuXGBwZ5F8wYl3VyIk30tCBVClQ+Cz1vsP0qKL
         Hhd8Qrp8KKFDYiYR2dsw9p8lf8FTBL4OEUtIr8QZ738wD1rMsQTeG3pVMETV4mC6fHw/
         ADdfdV+Sn/m5QsuO2EgRFbjZvf0hzlLxiHs4gyyDBtVxPIEdCKvTyvYP3Ft4FU+b023O
         Hf+fpSTSgzCiAme9Q5O2IkC2TSSwCAb+z0GOnJhIST/HAVZ1ox0lnq0/P6m2t+p6bOU7
         OgbjlYdSesEdzbE4hdBeXjqiPI7AJUddUM1B2Xe+NGmg65JCQh952mAOA1wuFprmWYqz
         veXw==
X-Forwarded-Encrypted: i=1; AJvYcCUkz1bHgieDFzSTA7tlVjjR0m1ow9HykIJ7xgaC5KF7jyFhuejgSY7JEH8sttR77Pr1+BpRhTHtoDNXUYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Qph4Jt/jel/CWH+BNULdwHD2TfoEOr+wgfzADm/P2wK9fBy2
	Y/KC/oSlLXGhmZ0eTnDfzy9BZewME05QU1yZ06lsL6+D/D4ZPINDanAY
X-Gm-Gg: ASbGncuApIcEGPnfsSVa6Wv1bgOoaphBn/xDM8EF79M2pqL1jRRnQATDa9S6TWn6jw4
	9p/DsEaiY+eXbFb0HdOvc5oTjo6/v42TmCokUuUrrHr2RbnVysFvUb/cL9nDDn92zwFdh//WPL0
	GF09Cq86jp6uSwkhH0B++3Hliy07LvQiKyI9dCrfJg0gzrRlS7XSsnT4Wtsv9jxeyc5yJ/UwIE1
	tcz302FiuUWqjudl9t8CDj3W7qG1VJm4umFVhc0jWgLog9aW/tZYbkltVJFJPPGk/y0x+AfOPeZ
	K5Bi5+Xs/ySnBqad7jeFzxAqrNV3Ztryz5m22uZWwk9kwTlJIRIUFdQkXg==
X-Google-Smtp-Source: AGHT+IEGm9Ou7Njj34BQFaZU42QOdBG6+5MtDk9k+e468axCOUto579Gbzympt7eZB66Y/44TUGKcQ==
X-Received: by 2002:a05:6a00:9464:b0:740:b5f9:90b4 with SMTP id d2e1a72fcca58-742a988b38amr7388205b3a.17.1747472778492;
        Sat, 17 May 2025 02:06:18 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm2784020b3a.78.2025.05.17.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 02:06:18 -0700 (PDT)
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
Subject: [PATCH v7] erofs: add 'fsoffset' mount option to specify filesystem offset
Date: Sat, 17 May 2025 17:05:43 +0800
Message-ID: <20250517090544.2687651-1-shengyong1@xiaomi.com>
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
or a dm device is still needed to attach the image file at an
appropriate offset first. Similarly, if an EROFS image within a
block device does not start at offset 0, it cannot be mounted
directly either.

To address this issue, this patch adds a new mount option `fsoffset=x'
to accept a start offset for the primary device. The offset should be
aligned to the block size. EROFS will add this offset before performing
read requests.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>
---
 Documentation/filesystems/erofs.rst |  1 +
 fs/erofs/data.c                     |  5 +++--
 fs/erofs/fileio.c                   |  3 ++-
 fs/erofs/internal.h                 |  3 ++-
 fs/erofs/super.c                    | 16 +++++++++++++++-
 fs/erofs/zdata.c                    |  3 ++-
 6 files changed, 25 insertions(+), 6 deletions(-)
---
v7: * fix documentation and some codin style
    * check alignment after erofs_read_superblock and return error in
      fscache mode
    * update commit message

v6: * fix fsoffset value type in documentation
    * change `off' type to u64
    https://lore.kernel.org/linux-erofs/6b456e0d-04cf-4ecd-a23a-e91c7d58b592@linux.alibaba.com

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
index c293f8e37468..11b0f8635f04 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -128,6 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
 fsid=%s                Specify a filesystem image ID for Fscache back-end.
 domain_id=%s           Specify a domain ID in fscache mode so that different images
                        with the same blobs under a given domain ID can share storage.
+fsoffset=%lu           Specify image offset for the primary device.
 ===================    =========================================================
 
 Sysfs Entries
diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 2409d2ab0c28..6a329c329f43 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -27,7 +27,7 @@ void erofs_put_metabuf(struct erofs_buf *buf)
 
 void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
 {
-	pgoff_t index = offset >> PAGE_SHIFT;
+	pgoff_t index = (buf->off + offset) >> PAGE_SHIFT;
 	struct folio *folio = NULL;
 
 	if (buf->page) {
@@ -54,6 +54,7 @@ void erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb)
 	struct erofs_sb_info *sbi = EROFS_SB(sb);
 
 	buf->file = NULL;
+	buf->off = sbi->dif0.fsoff;
 	if (erofs_is_fileio_mode(sbi)) {
 		buf->file = sbi->dif0.file;	/* some fs like FUSE needs it */
 		buf->mapping = buf->file->f_mapping;
@@ -299,7 +300,7 @@ static int erofs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		iomap->private = buf.base;
 	} else {
 		iomap->type = IOMAP_MAPPED;
-		iomap->addr = mdev.m_pa;
+		iomap->addr = mdev.m_dif->fsoff + mdev.m_pa;
 		if (flags & IOMAP_DAX)
 			iomap->addr += mdev.m_dif->dax_part_off;
 	}
diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 60c7cc4c105c..fb1a01198fde 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -147,7 +147,8 @@ static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
 				if (err)
 					break;
 				io->rq = erofs_fileio_rq_alloc(&io->dev);
-				io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
+				io->rq->bio.bi_iter.bi_sector =
+					(io->dev.m_dif->fsoff + io->dev.m_pa) >> 9;
 				attached = 0;
 			}
 			if (!bio_add_folio(&io->rq->bio, folio, len, cur))
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 4ac188d5d894..a32c03a80c70 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -44,7 +44,7 @@ struct erofs_device_info {
 	struct erofs_fscache *fscache;
 	struct file *file;
 	struct dax_device *dax_dev;
-	u64 dax_part_off;
+	u64 fsoff, dax_part_off;
 
 	erofs_blk_t blocks;
 	erofs_blk_t uniaddr;
@@ -199,6 +199,7 @@ enum {
 struct erofs_buf {
 	struct address_space *mapping;
 	struct file *file;
+	u64 off;
 	struct page *page;
 	void *base;
 };
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 79ab268fa57a..8dd57c272014 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -359,7 +359,7 @@ static void erofs_default_options(struct erofs_sb_info *sbi)
 
 enum {
 	Opt_user_xattr, Opt_acl, Opt_cache_strategy, Opt_dax, Opt_dax_enum,
-	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio,
+	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio, Opt_fsoffset,
 };
 
 static const struct constant_table erofs_param_cache_strategy[] = {
@@ -386,6 +386,7 @@ static const struct fs_parameter_spec erofs_fs_parameters[] = {
 	fsparam_string("fsid",		Opt_fsid),
 	fsparam_string("domain_id",	Opt_domain_id),
 	fsparam_flag_no("directio",	Opt_directio),
+	fsparam_u64("fsoffset",		Opt_fsoffset),
 	{}
 };
 
@@ -509,6 +510,9 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 		errorfc(fc, "%s option not supported", erofs_fs_parameters[opt].name);
 #endif
 		break;
+	case Opt_fsoffset:
+		sbi->dif0.fsoff = result.uint_64;
+		break;
 	}
 	return 0;
 }
@@ -621,6 +625,14 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 		}
 	}
 
+	if (sbi->dif0.fsoff) {
+		if (sbi->dif0.fsoff & ((1 << sbi->blkszbits) - 1))
+			return invalfc(fc, "fsoffset %llu not aligned to block size",
+				       sbi->dif0.fsoff);
+		if (erofs_is_fscache_mode(sb))
+			return invalfc(fc, "cannot use fsoffset in fscache mode");
+	}
+
 	if (test_opt(&sbi->opt, DAX_ALWAYS)) {
 		if (!sbi->dif0.dax_dev) {
 			errorfc(fc, "DAX unsupported by block device. Turning off DAX.");
@@ -950,6 +962,8 @@ static int erofs_show_options(struct seq_file *seq, struct dentry *root)
 	if (sbi->domain_id)
 		seq_printf(seq, ",domain_id=%s", sbi->domain_id);
 #endif
+	if (sbi->dif0.fsoff)
+		seq_printf(seq, ",fsoffset=%llu", sbi->dif0.fsoff);
 	return 0;
 }
 
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index b8e6b76c23d5..4f34b63d026e 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1707,7 +1707,8 @@ static void z_erofs_submit_queue(struct z_erofs_frontend *f,
 					bio = bio_alloc(mdev.m_bdev, BIO_MAX_VECS,
 							REQ_OP_READ, GFP_NOIO);
 				bio->bi_end_io = z_erofs_endio;
-				bio->bi_iter.bi_sector = cur >> 9;
+				bio->bi_iter.bi_sector =
+						(mdev.m_dif->fsoff + cur) >> 9;
 				bio->bi_private = q[JQ_SUBMIT];
 				if (readahead)
 					bio->bi_opf |= REQ_RAHEAD;
-- 
2.43.0

