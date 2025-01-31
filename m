Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294751547E4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362306; cv=none; b=js1eu2DbGSiPv4uDSONj/RvZ6MFmPzKwPQyfimOT/JH2Cy+EgMHe9ZkqmOHcdMm2Rt2lmjBYeSFHt+tEzExzRMeiBaT/jtmUQ3v+OlM2nSJ0UT+02oDg9mA/B1UivztIbfShPuAAWeSIzwTwYgGnwAi43chRYiAWNvddhBeOTdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362306; c=relaxed/simple;
	bh=sFFU7C1MzuogcM5wOGc++NVm3alLfLou2/czRdP08Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4VsgPGBOiwss7mJ+AjJlDr4DZp8F3Pcs+8hLPHWYXU57OrdkOo/9WZlIzW2z1u16BEMSKLTadHkOzAuYW54q+pFSWu7HD8NbEDtUwqBFO3yv7PGoaTjtPaMGToC/IlA0wBrU/W9wjGJfbmDFS1741IQBpacam5ODBfbzLwqSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdjLNYDu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdjLNYDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE22BC4CED1;
	Fri, 31 Jan 2025 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738362306;
	bh=sFFU7C1MzuogcM5wOGc++NVm3alLfLou2/czRdP08Bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MdjLNYDuy3w5w8H4jJ9Smxyk/5V98BhSy0J9Go5yG4129fsJ8zOPbFf4D/8o8d7U8
	 1Tzd36ACHEXN2XtmG1YNMjr4/pwI4PaQAyWlfVWHftip9WEHywVmXmHkVtmKLkHS7/
	 /dYzpcw5QFVTQqxhfIkTFdX8URo/HDqCflvOBAvD2iznulDiBNdPfaihEpzQGU09Af
	 TvDR4oGOPqx3zlkDk5yUt0hdHW4xR9acsHpZWRJcH3uZLMlN3Y4sVeEsWUPf19dwfF
	 s7kLP9ovHILbEqlidpTZA7ST+YnL1ZdqwP37NJovSNKJ3eI1aH+0n0UAJwB1rHrm6j
	 hPZg9zbuDbC3A==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH 2/2] f2fs: introduce f2fs_base_attr for global sysfs entries
Date: Fri, 31 Jan 2025 22:24:57 +0000
Message-ID: <20250131222457.1634039-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250131222457.1634039-1-jaegeuk@kernel.org>
References: <20250131222457.1634039-1-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In /sys/fs/f2fs/features, there's no f2fs_sb_info, so let's avoid to get
the pointer.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 74 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 001e97cd0a96..4bd7b17a20c8 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -61,6 +61,12 @@ struct f2fs_attr {
 	int id;
 };
 
+struct f2fs_base_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct f2fs_base_attr *a, char *buf);
+	ssize_t (*store)(struct f2fs_base_attr *a, const char *buf, size_t len);
+};
+
 static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 			     struct f2fs_sb_info *sbi, char *buf);
 
@@ -862,6 +868,25 @@ static void f2fs_sb_release(struct kobject *kobj)
 	complete(&sbi->s_kobj_unregister);
 }
 
+static ssize_t f2fs_base_attr_show(struct kobject *kobj,
+				struct attribute *attr, char *buf)
+{
+	struct f2fs_base_attr *a = container_of(attr,
+				struct f2fs_base_attr, attr);
+
+	return a->show ? a->show(a, buf) : 0;
+}
+
+static ssize_t f2fs_base_attr_store(struct kobject *kobj,
+				struct attribute *attr,
+				const char *buf, size_t len)
+{
+	struct f2fs_base_attr *a = container_of(attr,
+				struct f2fs_base_attr, attr);
+
+	return a->store ? a->store(a, buf, len) : 0;
+}
+
 /*
  * Note that there are three feature list entries:
  * 1) /sys/fs/f2fs/features
@@ -880,14 +905,13 @@ static void f2fs_sb_release(struct kobject *kobj)
  *     please add new on-disk feature in this list only.
  *     - ref. F2FS_SB_FEATURE_RO_ATTR()
  */
-static ssize_t f2fs_feature_show(struct f2fs_attr *a,
-		struct f2fs_sb_info *sbi, char *buf)
+static ssize_t f2fs_feature_show(struct f2fs_base_attr *a, char *buf)
 {
 	return sysfs_emit(buf, "supported\n");
 }
 
 #define F2FS_FEATURE_RO_ATTR(_name)				\
-static struct f2fs_attr f2fs_attr_##_name = {			\
+static struct f2fs_base_attr f2fs_base_attr_##_name = {		\
 	.attr = {.name = __stringify(_name), .mode = 0444 },	\
 	.show	= f2fs_feature_show,				\
 }
@@ -1256,37 +1280,38 @@ static struct attribute *f2fs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs);
 
+#define BASE_ATTR_LIST(name) (&f2fs_base_attr_##name.attr)
 static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_FS_ENCRYPTION
-	ATTR_LIST(encryption),
-	ATTR_LIST(test_dummy_encryption_v2),
+	BASE_ATTR_LIST(encryption),
+	BASE_ATTR_LIST(test_dummy_encryption_v2),
 #if IS_ENABLED(CONFIG_UNICODE)
-	ATTR_LIST(encrypted_casefold),
+	BASE_ATTR_LIST(encrypted_casefold),
 #endif
 #endif /* CONFIG_FS_ENCRYPTION */
 #ifdef CONFIG_BLK_DEV_ZONED
-	ATTR_LIST(block_zoned),
+	BASE_ATTR_LIST(block_zoned),
 #endif
-	ATTR_LIST(atomic_write),
-	ATTR_LIST(extra_attr),
-	ATTR_LIST(project_quota),
-	ATTR_LIST(inode_checksum),
-	ATTR_LIST(flexible_inline_xattr),
-	ATTR_LIST(quota_ino),
-	ATTR_LIST(inode_crtime),
-	ATTR_LIST(lost_found),
+	BASE_ATTR_LIST(atomic_write),
+	BASE_ATTR_LIST(extra_attr),
+	BASE_ATTR_LIST(project_quota),
+	BASE_ATTR_LIST(inode_checksum),
+	BASE_ATTR_LIST(flexible_inline_xattr),
+	BASE_ATTR_LIST(quota_ino),
+	BASE_ATTR_LIST(inode_crtime),
+	BASE_ATTR_LIST(lost_found),
 #ifdef CONFIG_FS_VERITY
-	ATTR_LIST(verity),
+	BASE_ATTR_LIST(verity),
 #endif
-	ATTR_LIST(sb_checksum),
+	BASE_ATTR_LIST(sb_checksum),
 #if IS_ENABLED(CONFIG_UNICODE)
-	ATTR_LIST(casefold),
+	BASE_ATTR_LIST(casefold),
 #endif
-	ATTR_LIST(readonly),
+	BASE_ATTR_LIST(readonly),
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	ATTR_LIST(compression),
+	BASE_ATTR_LIST(compression),
 #endif
-	ATTR_LIST(pin_file),
+	BASE_ATTR_LIST(pin_file),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
@@ -1362,9 +1387,14 @@ static struct kset f2fs_kset = {
 	.kobj	= {.ktype = &f2fs_ktype},
 };
 
+static const struct sysfs_ops f2fs_feat_attr_ops = {
+	.show	= f2fs_base_attr_show,
+	.store	= f2fs_base_attr_store,
+};
+
 static const struct kobj_type f2fs_feat_ktype = {
 	.default_groups = f2fs_feat_groups,
-	.sysfs_ops	= &f2fs_attr_ops,
+	.sysfs_ops	= &f2fs_feat_attr_ops,
 };
 
 static struct kobject f2fs_feat = {
-- 
2.48.1.362.g079036d154-goog

