Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC95155743
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744465381; cv=none; b=sEPXSEkGs/mE5r44rB7rVOIoTK5gw1NcTkhn3mtCftifELdEKowJEZos/d1SbIqhoa1wGGgQf7sO3rZIcoronKoa8HB3JhHr80ybZTdvVwYomB2YrNcqzv3Gp307j1H4gskejgNhpTGIXDC+tD9dCU8gYBeXX0Je4Hy3wdNED+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744465381; c=relaxed/simple;
	bh=ci1UI0K8vQvMeDw2JhjC7yr+FfjiXL5HO3d2eJ4CIXs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pvxt6O4DTjkc1jympQaAysOoLBsc7ClhDqTF26K275n3v1p3q7Xh2h/lzejseYH+MJrfZoZ/sNb+JiCkcitsrtSE4fxUm2ZX3pW6MiKyKLihXFvZ2Btg/M5+zi9VkntZmxGPHNsADhLLNtbFXL55JOFUTW9IN0jBpRFQWvL/Jqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43d333855so23851035ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744465379; x=1745070179;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dgrj22FMucO6JEKzfQPOXOiUPjRrG05W8vEI0nrv7/4=;
        b=bksSrAYgir/InE7tfbv0at3gEiUSrYs9jM/XbmizrB7n/rQjH2IQ7ek8/ykgdrSOBS
         hAXD4LU3X9ttWTN8jlvbe4OtgeOKxL6wP/roTiHqJSnwiJnB22D4T4rDqNpTP1UuQfHc
         N1dpZHvcejaJrhFE7OKQgDbZkEDjljUwJoAEsK0xGEND1OLXkfMg3uFtgh61TQ6Mi9Oe
         RyTRJeFR/AK0ed7hsKdbCABZ/6aoI5CllV9zkm3ZLpR6BGNPyid8qw8tbdyKaEHNdxyU
         jnGseB/A1AcAaNgFj5R204lOeb2VhIHwhHLs2xd9Yjf3Jl1C8bcDj3yJ7sHxI9ZzOdp1
         NqjA==
X-Gm-Message-State: AOJu0Yx1S66FgGsRNkdNaoOwq37gnQEQmiVsKn3EcfDU3THVGN61cafd
	UMyhBMy7R/uBVNOeVP9oq9WXu8DMJd1KT3CHNyhMW3OS7cQ1I8WdRunhs+FTgQJYbydTjpaXE1W
	7QYbwuty9zBC93NuocuiPc+h7BmgQKtl6GA71LJPEHXycTPjr4/fokBY=
X-Google-Smtp-Source: AGHT+IG24htJ4blzBQVwrqoDpClFPDhO2LcrsyJQ2+B7wkqPeMsanlCKawzM6vNRpdA8t7p3xBHlrKArAJAh4PLXB9D2S6i+nUQY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c245:0:b0:3d0:235b:4810 with SMTP id
 e9e14a558f8ab-3d7ec1d9acdmr63167865ab.2.1744465378969; Sat, 12 Apr 2025
 06:42:58 -0700 (PDT)
Date: Sat, 12 Apr 2025 06:42:58 -0700
In-Reply-To: <00000000000023a79f05f5c4ac51@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fa6de2.050a0220.379d84.000c.GAE@google.com>
Subject: Re: [syzbot] Re: WARNING in __folio_mark_dirty (2)
From: syzbot <syzbot+e14d6cd6ec241f507ba7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: WARNING in __folio_mark_dirty (2)
Author: penguin-kernel@i-love.sakura.ne.jp

Patch from Andreas Gruenbacher <agruenba@redhat.com> and Jan Kara <jack@suse.cz>

#syz test

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d7220a6fe8f5..ba25b884169e 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1166,7 +1166,6 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 		   const struct gfs2_glock_operations *glops, int create,
 		   struct gfs2_glock **glp)
 {
-	struct super_block *s = sdp->sd_vfs;
 	struct lm_lockname name = { .ln_number = number,
 				    .ln_type = glops->go_type,
 				    .ln_sbd = sdp };
@@ -1229,7 +1228,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 	mapping = gfs2_glock2aspace(gl);
 	if (mapping) {
                 mapping->a_ops = &gfs2_meta_aops;
-		mapping->host = s->s_bdev->bd_mapping->host;
+		mapping->host = sdp->sd_inode;
 		mapping->flags = 0;
 		mapping_set_gfp_mask(mapping, GFP_NOFS);
 		mapping->i_private_data = NULL;
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index eb4714f299ef..116efe335c32 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -168,7 +168,7 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
 static int gfs2_rgrp_metasync(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	struct address_space *metamapping = &sdp->sd_aspace;
+	struct address_space *metamapping = gfs2_aspace(sdp);
 	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
 	const unsigned bsize = sdp->sd_sb.sb_bsize;
 	loff_t start = (rgd->rd_addr * bsize) & PAGE_MASK;
@@ -225,7 +225,7 @@ static int rgrp_go_sync(struct gfs2_glock *gl)
 static void rgrp_go_inval(struct gfs2_glock *gl, int flags)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
-	struct address_space *mapping = &sdp->sd_aspace;
+	struct address_space *mapping = gfs2_aspace(sdp);
 	struct gfs2_rgrpd *rgd = gfs2_glock2rgrp(gl);
 	const unsigned bsize = sdp->sd_sb.sb_bsize;
 	loff_t start, end;
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 74abbd4970f8..0a41c4e76b32 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -795,7 +795,7 @@ struct gfs2_sbd {
 
 	/* Log stuff */
 
-	struct address_space sd_aspace;
+	struct inode *sd_inode;
 
 	spinlock_t sd_log_lock;
 
@@ -851,6 +851,13 @@ struct gfs2_sbd {
 	unsigned long sd_glock_dqs_held;
 };
 
+#define GFS2_BAD_INO 1
+
+static inline struct address_space *gfs2_aspace(struct gfs2_sbd *sdp)
+{
+	return sdp->sd_inode->i_mapping;
+}
+
 static inline void gfs2_glstats_inc(struct gfs2_glock *gl, int which)
 {
 	gl->gl_stats.stats[which]++;
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 198cc7056637..9dc8885c95d0 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -132,7 +132,7 @@ struct buffer_head *gfs2_getbuf(struct gfs2_glock *gl, u64 blkno, int create)
 	unsigned int bufnum;
 
 	if (mapping == NULL)
-		mapping = &sdp->sd_aspace;
+		mapping = gfs2_aspace(sdp);
 
 	shift = PAGE_SHIFT - sdp->sd_sb.sb_bsize_shift;
 	index = blkno >> shift;             /* convert block to page */
diff --git a/fs/gfs2/meta_io.h b/fs/gfs2/meta_io.h
index 831d988c2ceb..b7c8a6684d02 100644
--- a/fs/gfs2/meta_io.h
+++ b/fs/gfs2/meta_io.h
@@ -44,9 +44,7 @@ static inline struct gfs2_sbd *gfs2_mapping2sbd(struct address_space *mapping)
 		struct gfs2_glock_aspace *gla =
 			container_of(mapping, struct gfs2_glock_aspace, mapping);
 		return gla->glock.gl_name.ln_sbd;
-	} else if (mapping->a_ops == &gfs2_rgrp_aops)
-		return container_of(mapping, struct gfs2_sbd, sd_aspace);
-	else
+	} else
 		return inode->i_sb->s_fs_info;
 }
 
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index e83d293c3614..dbd6f76bfa2b 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -72,7 +72,6 @@ void free_sbd(struct gfs2_sbd *sdp)
 static struct gfs2_sbd *init_sbd(struct super_block *sb)
 {
 	struct gfs2_sbd *sdp;
-	struct address_space *mapping;
 
 	sdp = kzalloc(sizeof(struct gfs2_sbd), GFP_KERNEL);
 	if (!sdp)
@@ -109,16 +108,6 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 
 	INIT_LIST_HEAD(&sdp->sd_sc_inodes_list);
 
-	mapping = &sdp->sd_aspace;
-
-	address_space_init_once(mapping);
-	mapping->a_ops = &gfs2_rgrp_aops;
-	mapping->host = sb->s_bdev->bd_mapping->host;
-	mapping->flags = 0;
-	mapping_set_gfp_mask(mapping, GFP_NOFS);
-	mapping->i_private_data = NULL;
-	mapping->writeback_index = 0;
-
 	spin_lock_init(&sdp->sd_log_lock);
 	atomic_set(&sdp->sd_log_pinned, 0);
 	INIT_LIST_HEAD(&sdp->sd_log_revokes);
@@ -1135,6 +1124,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	int silent = fc->sb_flags & SB_SILENT;
 	struct gfs2_sbd *sdp;
 	struct gfs2_holder mount_gh;
+	struct address_space *mapping;
 	int error;
 
 	sdp = init_sbd(sb);
@@ -1156,6 +1146,19 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_flags |= SB_NOSEC;
 	sb->s_magic = GFS2_MAGIC;
 	sb->s_op = &gfs2_super_ops;
+
+	/* Set up an address space for metadata writes */
+	sdp->sd_inode = new_inode(sb);
+	error = -ENOMEM;
+	if (!sdp->sd_inode)
+		goto fail_free;
+	sdp->sd_inode->i_ino = GFS2_BAD_INO;
+	sdp->sd_inode->i_size = OFFSET_MAX;
+
+	mapping = gfs2_aspace(sdp);
+	mapping->a_ops = &gfs2_rgrp_aops;
+	mapping_set_gfp_mask(mapping, GFP_NOFS);
+
 	sb->s_d_op = &gfs2_dops;
 	sb->s_export_op = &gfs2_export_ops;
 	sb->s_qcop = &gfs2_quotactl_ops;
@@ -1183,7 +1186,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	error = init_names(sdp, silent);
 	if (error)
-		goto fail_free;
+		goto fail_iput;
 
 	snprintf(sdp->sd_fsname, sizeof(sdp->sd_fsname), "%s", sdp->sd_table_name);
 
@@ -1192,7 +1195,7 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 			WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_FREEZABLE, 0,
 			sdp->sd_fsname);
 	if (!sdp->sd_glock_wq)
-		goto fail_free;
+		goto fail_iput;
 
 	sdp->sd_delete_wq = alloc_workqueue("gfs2-delete/%s",
 			WQ_MEM_RECLAIM | WQ_FREEZABLE, 0, sdp->sd_fsname);
@@ -1309,6 +1312,8 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 fail_glock_wq:
 	if (sdp->sd_glock_wq)
 		destroy_workqueue(sdp->sd_glock_wq);
+fail_iput:
+	iput(sdp->sd_inode);
 fail_free:
 	free_sbd(sdp);
 	sb->s_fs_info = NULL;
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 44e5658b896c..4529b7dda8ca 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -648,7 +648,7 @@ static void gfs2_put_super(struct super_block *sb)
 	gfs2_jindex_free(sdp);
 	/*  Take apart glock structures and buffer lists  */
 	gfs2_gl_hash_clear(sdp);
-	truncate_inode_pages_final(&sdp->sd_aspace);
+	iput(sdp->sd_inode);
 	gfs2_delete_debugfs_file(sdp);
 
 	gfs2_sys_fs_del(sdp);
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 8e7af9a03b41..b503a9a4fa65 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -245,10 +245,11 @@ wb_get_create_current(struct backing_dev_info *bdi, gfp_t gfp)
  * holding either @inode->i_lock, the i_pages lock, or the
  * associated wb's list_lock.
  */
-static inline struct bdi_writeback *inode_to_wb(const struct inode *inode)
+static inline struct bdi_writeback *inode_to_wb(struct inode *inode)
 {
 #ifdef CONFIG_LOCKDEP
 	WARN_ON_ONCE(debug_locks &&
+		     (inode->i_sb->s_iflags & SB_I_CGROUPWB) &&
 		     (!lockdep_is_held(&inode->i_lock) &&
 		      !lockdep_is_held(&inode->i_mapping->i_pages.xa_lock) &&
 		      !lockdep_is_held(&inode->i_wb->list_lock)));
