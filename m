Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CCF7260D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521349; cv=none; b=GM7H0eioazg8ZBmU25QN0AO8MS+D2anDiKSmTpH55U9HGcbH+Le42ZnaSTK4IRho7mB+1OgZ2sFwaDIavksFQsmhv6ubuESfxgfiFgYKhJeoH9kQVvNIjGJRCqTud7piES5BDy1rkjwgFKyL/qBzKthusRPgqVCbCMwTWoidGWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521349; c=relaxed/simple;
	bh=sO3XYb3gf+ICEOeAQkWr8anDFJq9z5MkqR98xG0MSIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ssmebnQsKYR0OyoZRYsA5J3wt9I6wHPYmfy2U/8Kn1o5tTPmlgoziU1URFRLDY1r+j4SfEL0K98LzX6r6RuLgRblROI4luMNnnBTGPp+EaW1RCEslRjcEHHLiqNJwdz9Jw9x9h0iSTrjXEoTfzq6/0RfdXXeKuNk8F8lhuoXd8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbU/mhxl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbU/mhxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899C7C4CEE4;
	Tue,  6 May 2025 08:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746521348;
	bh=sO3XYb3gf+ICEOeAQkWr8anDFJq9z5MkqR98xG0MSIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=BbU/mhxlIgECerDtCHPYRzBs1dV8YYilW33RsWFedw5bO7aKVak1IAzWOMFgbNVw2
	 PzRZJl3I+SUMGC0LjP1ukg7hNDxW5pNm9AT06C/kmGiTrLLPzgnpusn5XJPhf+lFIY
	 52Q0ibu3nRHhjDu7tJnMaItEgtJYceT7hsw8DAqVmKd9H39A6U5LvxF2cQ+ODkUPpx
	 OzySxsOuXzvJDeWuvVPZ33zSQlMKkrroKgakfKGy9XGDz5ZTkes9gnmHDCx8txJkWb
	 fE9IST6CmTontFixXlLGfGioX7qvI1oZvu1u98Iqw5WZ6Ml/HywCnUsyiWVMJPTvzR
	 Equ32FL5fV6RQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2 1/2] f2fs: sysfs: add encoding_flags entry
Date: Tue,  6 May 2025 15:47:25 +0800
Message-Id: <20250506074725.12315-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
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

============================     ==========
Flag_Name                        Flag_Value
============================     ==========
SB_ENC_STRICT_MODE_FL            0x00000001
SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
============================     ==========

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
v2:
- fix compile warning of htmldocs
 Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
 fs/f2fs/sysfs.c                         |  9 +++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 59adb7dc6f9e..1fa140da5a1a 100644
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
+		============================     ==========
+		Flag_Name                        Flag_Value
+		============================     ==========
+		SB_ENC_STRICT_MODE_FL            0x00000001
+		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
+		============================     ==========
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
2.40.1

