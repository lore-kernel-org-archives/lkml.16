Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C714E2C2
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945733; cv=none; b=Uw3bz0xjuc+1VBY+j45u4+XllEy/j3fjossunbCckZb+ULb/3rzXe+LFzBgoLfF/w3nkki85rbu4HeOlNk4PL1jcn09H8A0h1yB8eRZYMmJ3dTTFA9WCb35w9CKI+D9p8JXHHnZnm6VOeZmYYAWtQ2CvROYli2f3bejH3DDcYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945733; c=relaxed/simple;
	bh=LSY31goj1tYIw1e01CJVdsNoPnEqJ5sTGIfGWCrlWrE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGhuL/rIi7gPh3GgKMwJW7NlFxDDe9i3Za7qjj5YnGXiUPnQQVShFTcVXyp/MqC32oIP4RWk8F4ByesQbu8ZH9lyIKVg9NY3fUAhDIezlI1wHsp8VKIXoj5kbxWUL7jsfP423an+nxqa8DVgkj7k5+/GXZhi3qqF4A62HY5zv9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbxrziWT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbxrziWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DFFC4CEE2;
	Fri,  7 Feb 2025 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738945733;
	bh=LSY31goj1tYIw1e01CJVdsNoPnEqJ5sTGIfGWCrlWrE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=cbxrziWTlTlGhAGQmI/kht7rEIJzB93kJ8HAWJKJZ3Tgb4QE+kJFt/pBnUFgaq365
	 8iJ6kWRaFqB2NF43Q/mCmiuDC+UOgnUt9i4ffMwtJIa2OhCxhCtTiJGM2H8meb6JUg
	 ntHFS5Fo2uN2dcuiXvpepei67Ybio+LWixuRqK22UTaLqsMrLnZZf8YoQhZn3R+ksh
	 THzMo+nXsxXBdt5nTMy3ZUFwHbyJqZMwIc0G12FNLWDMTDcbtNKpw5oL0xFN9ay3VF
	 cRKGaHqiJ7CYuc8RA0bnHr5NTHr1ivHPIcLJ1fewvItoNFCc5PPKN2o1/vw1rADuUS
	 3Ny6jRY75LFNw==
Date: Fri, 7 Feb 2025 16:28:51 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH 2/2 v2] f2fs: add a sysfs entry to request donate
 file-backed pages
Message-ID: <Z6Y0w1iALudX9GA7@google.com>
References: <20250131222914.1634961-1-jaegeuk@kernel.org>
 <20250131222914.1634961-3-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131222914.1634961-3-jaegeuk@kernel.org>

1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2});
3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
4. echo 1024 > /sys/fs/f2fs/tuning/reclaim_caches_kb

This gives a way to reclaim file-backed pages by iterating all f2fs mounts until
reclaiming 1MB page cache ranges, registered by #1, #2, and #3.

5. cat /sys/fs/f2fs/tuning/reclaim_caches_kb
-> gives total number of registered file ranges.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 From v1:
   - Minor revision to clean up the flow.

 Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
 fs/f2fs/f2fs.h                          |  2 +
 fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
 4 files changed, 162 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..81deae2af84d 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -828,3 +828,10 @@ Date:		November 2024
 Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It controls max read extent count for per-inode, the value of threshold
 		is 10240 by default.
+
+What:		/sys/fs/f2fs/tuning/reclaim_caches_kb
+Date:		February 2025
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	It reclaims the given KBs of file-backed pages registered by
+		ioctl(F2FS_IOC_DONATE_RANGE).
+		For example, writing N tries to drop N KBs spaces in LRU.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 805585a7d2b6..bd0d8138b71d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4241,6 +4241,8 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 			struct shrink_control *sc);
 unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 			struct shrink_control *sc);
+unsigned int f2fs_donate_files(void);
+void f2fs_reclaim_caches(unsigned int reclaim_caches_kb);
 void f2fs_join_shrinker(struct f2fs_sb_info *sbi);
 void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
 
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 83d6fb97dcae..45efff635d8e 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -130,6 +130,96 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 	return freed;
 }
 
+unsigned int f2fs_donate_files(void)
+{
+	struct f2fs_sb_info *sbi;
+	struct list_head *p;
+	unsigned int donate_files = 0;
+
+	spin_lock(&f2fs_list_lock);
+	p = f2fs_list.next;
+	while (p != &f2fs_list) {
+		sbi = list_entry(p, struct f2fs_sb_info, s_list);
+
+		/* stop f2fs_put_super */
+		if (!mutex_trylock(&sbi->umount_mutex)) {
+			p = p->next;
+			continue;
+		}
+		spin_unlock(&f2fs_list_lock);
+
+		donate_files += sbi->donate_files;
+
+		spin_lock(&f2fs_list_lock);
+		p = p->next;
+		mutex_unlock(&sbi->umount_mutex);
+	}
+	spin_unlock(&f2fs_list_lock);
+
+	return donate_files;
+}
+
+static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
+				unsigned int reclaim_caches_kb)
+{
+	struct inode *inode;
+	struct f2fs_inode_info *fi;
+	unsigned int nfiles = sbi->donate_files;
+	pgoff_t npages = reclaim_caches_kb >> (PAGE_SHIFT - 10);
+
+	while (npages && nfiles--) {
+		pgoff_t len;
+
+		spin_lock(&sbi->inode_lock[DONATE_INODE]);
+		if (list_empty(&sbi->inode_list[DONATE_INODE])) {
+			spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+			break;
+		}
+		fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
+					struct f2fs_inode_info, gdonate_list);
+		list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
+		inode = igrab(&fi->vfs_inode);
+		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
+
+		if (!inode)
+			continue;
+
+		len = fi->donate_end - fi->donate_start + 1;
+		npages = npages < len ? 0 : npages - len;
+		invalidate_inode_pages2_range(inode->i_mapping,
+					fi->donate_start, fi->donate_end);
+		iput(inode);
+		cond_resched();
+	}
+	return npages << (PAGE_SHIFT - 10);
+}
+
+void f2fs_reclaim_caches(unsigned int reclaim_caches_kb)
+{
+	struct f2fs_sb_info *sbi;
+	struct list_head *p;
+
+	spin_lock(&f2fs_list_lock);
+	p = f2fs_list.next;
+	while (p != &f2fs_list && reclaim_caches_kb) {
+		sbi = list_entry(p, struct f2fs_sb_info, s_list);
+
+		/* stop f2fs_put_super */
+		if (!mutex_trylock(&sbi->umount_mutex)) {
+			p = p->next;
+			continue;
+		}
+		spin_unlock(&f2fs_list_lock);
+
+		reclaim_caches_kb = do_reclaim_caches(sbi, reclaim_caches_kb);
+
+		spin_lock(&f2fs_list_lock);
+		p = p->next;
+		mutex_unlock(&sbi->umount_mutex);
+	}
+	spin_unlock(&f2fs_list_lock);
+}
+
 void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
 {
 	spin_lock(&f2fs_list_lock);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index b419555e1ea7..b27336acf519 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -916,6 +916,39 @@ static struct f2fs_base_attr f2fs_base_attr_##_name = {		\
 	.show	= f2fs_feature_show,				\
 }
 
+static ssize_t f2fs_tune_show(struct f2fs_base_attr *a, char *buf)
+{
+	unsigned int res = 0;
+
+	if (!strcmp(a->attr.name, "reclaim_caches_kb"))
+		res = f2fs_donate_files();
+
+	return sysfs_emit(buf, "%u\n", res);
+}
+
+static ssize_t f2fs_tune_store(struct f2fs_base_attr *a,
+			const char *buf, size_t count)
+{
+	unsigned long t;
+	int ret;
+
+	ret = kstrtoul(skip_spaces(buf), 0, &t);
+	if (ret)
+		return ret;
+
+	if (!strcmp(a->attr.name, "reclaim_caches_kb"))
+		f2fs_reclaim_caches(t);
+
+	return count;
+}
+
+#define F2FS_TUNE_RW_ATTR(_name)				\
+static struct f2fs_base_attr f2fs_base_attr_##_name = {		\
+	.attr = {.name = __stringify(_name), .mode = 0644 },	\
+	.show	= f2fs_tune_show,				\
+	.store	= f2fs_tune_store,				\
+}
+
 static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1368,6 +1401,14 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs_sb_feat);
 
+F2FS_TUNE_RW_ATTR(reclaim_caches_kb);
+
+static struct attribute *f2fs_tune_attrs[] = {
+	BASE_ATTR_LIST(reclaim_caches_kb),
+	NULL,
+};
+ATTRIBUTE_GROUPS(f2fs_tune);
+
 static const struct sysfs_ops f2fs_attr_ops = {
 	.show	= f2fs_attr_show,
 	.store	= f2fs_attr_store,
@@ -1401,6 +1442,20 @@ static struct kobject f2fs_feat = {
 	.kset	= &f2fs_kset,
 };
 
+static const struct sysfs_ops f2fs_tune_attr_ops = {
+	.show	= f2fs_base_attr_show,
+	.store	= f2fs_base_attr_store,
+};
+
+static const struct kobj_type f2fs_tune_ktype = {
+	.default_groups = f2fs_tune_groups,
+	.sysfs_ops	= &f2fs_tune_attr_ops,
+};
+
+static struct kobject f2fs_tune = {
+	.kset	= &f2fs_kset,
+};
+
 static ssize_t f2fs_stat_attr_show(struct kobject *kobj,
 				struct attribute *attr, char *buf)
 {
@@ -1637,6 +1692,11 @@ int __init f2fs_init_sysfs(void)
 	if (ret)
 		goto put_kobject;
 
+	ret = kobject_init_and_add(&f2fs_tune, &f2fs_tune_ktype,
+				   NULL, "tuning");
+	if (ret)
+		goto put_kobject;
+
 	f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
 	if (!f2fs_proc_root) {
 		ret = -ENOMEM;
@@ -1644,7 +1704,9 @@ int __init f2fs_init_sysfs(void)
 	}
 
 	return 0;
+
 put_kobject:
+	kobject_put(&f2fs_tune);
 	kobject_put(&f2fs_feat);
 	kset_unregister(&f2fs_kset);
 	return ret;
@@ -1652,6 +1714,7 @@ int __init f2fs_init_sysfs(void)
 
 void f2fs_exit_sysfs(void)
 {
+	kobject_put(&f2fs_tune);
 	kobject_put(&f2fs_feat);
 	kset_unregister(&f2fs_kset);
 	remove_proc_entry("fs/f2fs", NULL);
-- 
2.48.1.502.g6dc24dfdaf-goog

