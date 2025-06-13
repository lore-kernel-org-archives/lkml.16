Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA55220F47
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793875; cv=none; b=gzCrbKQHevu4VfbTDRAsKCRzMhSN/4DdHgPIYXusUMnDj+NPwQOymGxLL8KPjaM6WQVIg7Y91Hp2khIw76kHA4AYXESpj+IcuCMce6RF35BJ7JW7DkhsUHTE/9JOkvshq2idxr7t4ITMbbDbe8B/BaxJXcgCIyji5QVkVQsiyEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793875; c=relaxed/simple;
	bh=KRqlg4gXsASPE1ojCNZ9bKXs5qtVRlaikINe1tozUSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TN9CWPAlXK2U0nGW3zS0EU1pwj5sB7jfSUhvWBCLyODnmkVRme3TxJnryhb5EdTTmwipMgTA9eeAWO8D+4Jb9EOfmIBjqW/4NNfKKlgp8NX3sqO07bKj2CrMH0izw6HByRoAySHodLYG1P18463rSOo0995K54S05oJTcflX+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TweeflZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TweeflZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8720CC4CEE3;
	Fri, 13 Jun 2025 05:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749793874;
	bh=KRqlg4gXsASPE1ojCNZ9bKXs5qtVRlaikINe1tozUSM=;
	h=From:To:Cc:Subject:Date:From;
	b=TweeflZXYV+3wWq9a1bm/ghWAbK31EjDAGur8bZZcdSbXVsfjCV8YQ9H+xcJwge16
	 hV7Nf7GR+zT9j3LZTk14gj7ZalL6/J2Uzf3KJv9LIu+AuCeGgL2z/tkBw7T+IkRj03
	 YWHV9aO6X/o15NEzi+nnPkEwiCYQhX8p2QdIYRcmfLMHtPJ1PwpzJICvK5uQ3gfbrJ
	 zVoLj1rrSX1j4deGYL2QfEdg2UE7vnZoCclXTj2g0R6YUga3/uLZOgAG8x4SRJ4J22
	 qndFn76Do3YcRdE04+UNCb+x2koZ8xIkLj4tf5VrmNV1HMWEXoO82KaB0DwTYI19Vi
	 B3LPanFOS/bRA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2] f2fs: introduce reserved_pin_section sysfs entry
Date: Fri, 13 Jun 2025 13:51:09 +0800
Message-Id: <20250613055109.2335-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section for tuning
@needed parameter of has_not_enough_free_secs(), if we configure it w/
zero, it can avoid f2fs_gc() as much as possible while fallocating on
pinned file.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- assign SM_I(sbi)->ovp_segments after f2fs_build_segment_manager()
 Documentation/ABI/testing/sysfs-fs-f2fs | 9 +++++++++
 fs/f2fs/f2fs.h                          | 3 +++
 fs/f2fs/file.c                          | 5 ++---
 fs/f2fs/super.c                         | 4 ++++
 fs/f2fs/sysfs.c                         | 9 +++++++++
 5 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bf03263b9f46..c2a233f2a085 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -861,3 +861,12 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
 		SB_ENC_STRICT_MODE_FL            0x00000001
 		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
 		============================     ==========
+
+What:		/sys/fs/f2fs/<disk>/reserved_pin_section
+Date:		June 2025
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This threshold is used to control triggering garbage collection while
+		fallocating on pinned file, so, it can guarantee there is enough free
+		reserved section before preallocating on pinned file.
+		By default, the value is ovp_sections, especially, for zoned ufs, the
+		value is 1.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01..fa27498202a3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1724,6 +1724,9 @@ struct f2fs_sb_info {
 	/* for skip statistic */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
 
+	/* free sections reserved for pinned file */
+	unsigned int reserved_pin_section;
+
 	/* threshold for gc trials on pinned files */
 	unsigned short gc_pin_file_threshold;
 	struct f2fs_rwsem pin_sem;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..a909f79db178 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 			}
 		}
 
-		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
-			ZONED_PIN_SEC_REQUIRED_COUNT :
-			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
+		if (has_not_enough_free_secs(sbi, 0,
+				sbi->reserved_pin_section)) {
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 57adeff5ef25..e0ecc341f1d3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5017,6 +5017,10 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* get segno of first zoned block device */
 	sbi->first_seq_zone_segno = get_first_seq_zone_segno(sbi);
 
+	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
+			ZONED_PIN_SEC_REQUIRED_COUNT :
+			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
+
 	/* Read accumulated write IO statistics if exists */
 	seg_i = CURSEG_I(sbi, CURSEG_HOT_NODE);
 	if (__exist_node_summaries(sbi))
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..51be7ffb38c5 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "reserved_pin_section")) {
+		if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
+F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(last_age_weight),
 	ATTR_LIST(max_read_extent_count),
 	ATTR_LIST(carve_out),
+	ATTR_LIST(reserved_pin_section),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.40.1

