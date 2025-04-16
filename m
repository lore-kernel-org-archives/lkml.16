Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52931D6AA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744782491; cv=none; b=M2TNGpFG7uh8a1V/G+L0ixF9AXY+AUU+qruykIZ1u6XjzDuctLuiKrohbjIhLyeAEjOfks0GpR3srlMVtnJWqfGIUwQmIHoli9tc7XDa4wRKzvBU0EBwH1IWJ+IHS8KcAXZUFDMp71oO5jkDB5TFdE37YGt2GBoRLCN7XY+5HDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744782491; c=relaxed/simple;
	bh=UCyiDm2TjAms0gkzQqN29nR6SyF2kYY1rrXuh5bVPl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiwWoF2ERr32jymie7tAlEXWZ5x9WIMpzxG1P0B+Sz6uR5ymsBXP0SoNnnA/qawk959BKSnSQmprpQ5cA2NcflGjcbwmRds6wI5mlFXQi9XgvZSxxbnY1K7YvKcU58vyFRQ+JHvPnQzhwxvrnUgcZwMTH6o7ZsxUIrem0n118/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rb6zamL7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rb6zamL7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FEBC4CEE2;
	Wed, 16 Apr 2025 05:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744782491;
	bh=UCyiDm2TjAms0gkzQqN29nR6SyF2kYY1rrXuh5bVPl4=;
	h=From:To:Cc:Subject:Date:From;
	b=rb6zamL73hlRkYjswss586a+WyYKWcZA+Al7696J2ed8vVoxj0/81ZZKv7ne4iG8S
	 IMjjKc+voKz7sAHYEkI9fbvXRGSDHtIk/0FGUv1hzYaflh+gjN6sq1iWSFeUOLK+C3
	 yT9otbXfui49oq5Gi5gFY58kjjp9UM3i8qfCaYyUSDL5hwQqmG6r7PS7SCmBO2ZNJK
	 eiaXm1mgWkKEUCai9Nz9CP7twwvuoqh70XecPNWe5dPKBUnvHlQ73e+NkIKR+4S2n1
	 piWh1SijtvMPZ4hIveHFp+yZ/WYTw5npdGSj2AAWhOGdqz4uHdJb+/cpFaaA/93lhr
	 fo5I+ZXpXGn+w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 1/2] f2fs: sysfs: add encoding_flags entry
Date: Wed, 16 Apr 2025 13:48:04 +0800
Message-ID: <20250416054805.1416834-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a new sysfs entry /sys/fs/f2fs/<disk>/encoding_flags,
it is a read-only entry to show the value of sb.s_encoding_flags, the
value is hexadecimal.

===========================      ==========
Flag_Name                        Flag_Value
===========================      ==========
SB_ENC_STRICT_MODE_FL            0x00000001
SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
===========================      ==========

case#1
mkfs.f2fs -f -O casefold -C utf8:strict /dev/vda
mount /dev/vda /mnt/f2fs
cat /sys/fs/f2fs/vda/encoding_flags
1

case#2
mkfs.f2fs -f -O casefold -C utf8 /dev/vda
fsck.f2fs --nolinear-lookup=1 /dev/vda
mount /dev/vda /mnt/f2fs
cat /sys/fs/f2fs/vda/encoding_flags
2

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
 fs/f2fs/sysfs.c                         |  9 +++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 59adb7dc6f9e..0dbe6813b709 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -846,3 +846,16 @@ Description:	For several zoned storage devices, vendors will provide extra space
 		reserved_blocks. However, it is not enough, since this extra space should
 		not be shown to users. So, with this new sysfs node, we can hide the space
 		by substracting reserved_blocks from total bytes.
+
+What:		/sys/fs/f2fs/<disk>/encoding_flags
+Date:		April 2025
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This is a read-only entry to show the value of sb.s_encoding_flags, the
+		value is hexadecimal.
+
+		===========================      ==========
+		Flag_Name                        Flag_Value
+		===========================      ==========
+		SB_ENC_STRICT_MODE_FL            0x00000001
+		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
+		===========================      ==========
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3a3485622691..cf98c5cbb98a 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -274,6 +274,13 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 	return sysfs_emit(buf, "(none)\n");
 }
 
+static ssize_t encoding_flags_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sysfs_emit(buf, "%x\n",
+		le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_encoding_flags));
+}
+
 static ssize_t mounted_time_sec_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1158,6 +1165,7 @@ F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
 F2FS_GENERAL_RO_ATTR(encoding);
+F2FS_GENERAL_RO_ATTR(encoding_flags);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
@@ -1270,6 +1278,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reserved_blocks),
 	ATTR_LIST(current_reserved_blocks),
 	ATTR_LIST(encoding),
+	ATTR_LIST(encoding_flags),
 	ATTR_LIST(mounted_time_sec),
 #ifdef CONFIG_F2FS_STAT_FS
 	ATTR_LIST(cp_foreground_calls),
-- 
2.49.0

