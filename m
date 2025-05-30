Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ADB194137
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577813; cv=none; b=TQYMzSWxNm7mCcuCWt2h0+NgKPjybX8VAXqWYHv96F2dwTAsi1TQSbq0Y41OgmrCI8ahEJMuDgKZQNqdvguwwus2m4NH0ewiejkxFBZZQRH1Xj9j4zo6EEmTYLJyZWmQyb4MjUIxjXR/4mrWAQawi5UfrFlLwNLlCNIs4UP/g5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577813; c=relaxed/simple;
	bh=vJfQr+x8KcSc0cwW5bUrVaygxzJThrqrxrjFIPXKgkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKb3cqcMbjubGfQmFY5fXgi2zYiWjZxaQYCfQb3om0Lx5bmiYKkiJBwxjXQBjKTu0MAg3HAApkU9AshuPA/7+o2PtA2VX7YAeEkXVi2wZzxUEJzOlYvQuA0rqeF73OCZcBVzX9PM+S+1kJIferPQADYT1Vyfz/7TNf/o8Tg9hcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SIRUBz6B; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SIRUBz6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1748577803;
	bh=vJfQr+x8KcSc0cwW5bUrVaygxzJThrqrxrjFIPXKgkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SIRUBz6BQRzKn0XO05bD+SQWeHSfPAqSbtuYbPXXby2Jik2w0qU7QZZhbGsNmV4OS
	 ECsxvIx9o4BE7U4lHxpMkMf4fqfc0Hv9eAibCoopM1UlBco64U9v5noLuPFXH5uin1
	 YyXic3843BDOchC6Q2b5RjaMRz48tAkIf5ah6Il0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 30 May 2025 05:54:36 +0200
Subject: [PATCH v3 2/6] sysfs: constify internal references to 'struct
 bin_attribute'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sysfs-const-bin_attr-final-v3-2-724bfcf05b99@weissschuh.net>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
In-Reply-To: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577802; l=2344;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vJfQr+x8KcSc0cwW5bUrVaygxzJThrqrxrjFIPXKgkA=;
 b=CjPIeKpuE00zzKB+nwSGb7i3uE0PTHxaEc5MA8+SsTIKiqe7dk71caaDWJLq0ESMnhprXwRF7
 IHEabwIjrIXDSYE8WaSnY++Xxu+RxedV65uAdHzalsR1EaIg7lov8wO
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core handles 'const struct bin_attribute *'.

Adapt the internal references.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 fs/sysfs/file.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index c3d3b079aedde7ca5318328fe853ccf891d663e9..1ca143d2f22ad2d6b0b74b261514f8bc3cb5153c 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -83,7 +83,7 @@ static int sysfs_kf_seq_show(struct seq_file *sf, void *v)
 static ssize_t sysfs_kf_bin_read(struct kernfs_open_file *of, char *buf,
 				 size_t count, loff_t pos)
 {
-	struct bin_attribute *battr = of->kn->priv;
+	const struct bin_attribute *battr = of->kn->priv;
 	struct kobject *kobj = sysfs_file_kobj(of->kn);
 	loff_t size = file_inode(of->file)->i_size;
 
@@ -149,7 +149,7 @@ static ssize_t sysfs_kf_write(struct kernfs_open_file *of, char *buf,
 static ssize_t sysfs_kf_bin_write(struct kernfs_open_file *of, char *buf,
 				  size_t count, loff_t pos)
 {
-	struct bin_attribute *battr = of->kn->priv;
+	const struct bin_attribute *battr = of->kn->priv;
 	struct kobject *kobj = sysfs_file_kobj(of->kn);
 	loff_t size = file_inode(of->file)->i_size;
 
@@ -173,7 +173,7 @@ static ssize_t sysfs_kf_bin_write(struct kernfs_open_file *of, char *buf,
 static int sysfs_kf_bin_mmap(struct kernfs_open_file *of,
 			     struct vm_area_struct *vma)
 {
-	struct bin_attribute *battr = of->kn->priv;
+	const struct bin_attribute *battr = of->kn->priv;
 	struct kobject *kobj = sysfs_file_kobj(of->kn);
 
 	return battr->mmap(of->file, kobj, battr, vma);
@@ -182,7 +182,7 @@ static int sysfs_kf_bin_mmap(struct kernfs_open_file *of,
 static loff_t sysfs_kf_bin_llseek(struct kernfs_open_file *of, loff_t offset,
 				  int whence)
 {
-	struct bin_attribute *battr = of->kn->priv;
+	const struct bin_attribute *battr = of->kn->priv;
 	struct kobject *kobj = sysfs_file_kobj(of->kn);
 
 	if (battr->llseek)
@@ -193,7 +193,7 @@ static loff_t sysfs_kf_bin_llseek(struct kernfs_open_file *of, loff_t offset,
 
 static int sysfs_kf_bin_open(struct kernfs_open_file *of)
 {
-	struct bin_attribute *battr = of->kn->priv;
+	const struct bin_attribute *battr = of->kn->priv;
 
 	if (battr->f_mapping)
 		of->file->f_mapping = battr->f_mapping();

-- 
2.49.0

