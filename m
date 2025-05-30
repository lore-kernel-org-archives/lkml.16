Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7520E034
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577817; cv=none; b=bKp7UUTJFVNt0CqKiutp370WNTyadK3ke1IBjXc10SLZd+2i6UX2mHCnVuC7YWEopcoaVw+X0YWqqwYkPd+0apHujlHKe9+FNRzHuELHB/Kbzdv3Mj85dLMCWbCeyp4u+Dk2wL+lcpkt8pbFeLkGtXDFvyuYGeEp54HThrDyUrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577817; c=relaxed/simple;
	bh=Q2OPQrIO/jaDN/2l0DiXXRSCwM0map7oHs8r7qRwFLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NLEHfGazyr+mmw4pRd5PuL/Rvb4zbuhDr22R7i0tHctuGeOeKXYQmT35FsRYeh0kWIWrxbfzz1OM9hpO8fvJQ6uiSkHBCIk+a5yd6mtA+FVvHlQMUrBYWNrA4hP3Gh6C7zfGV+yIzfjdQQlMl3gPGYc+TALSetsD0TsoU7SyPl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=U4/fsWOc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="U4/fsWOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1748577803;
	bh=Q2OPQrIO/jaDN/2l0DiXXRSCwM0map7oHs8r7qRwFLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U4/fsWOcAsjK4CsteBhwYSWaHqzVlTN5nTuc66M8Liau+sQaodRhfNSB23Bdqs6kv
	 PhtDElCE+KvI6CBU7UkyfHUy8xMTAUa5hyxbwzZdFoixdCivFVluBfLypZINlaNQ9O
	 nYiEZO29mJzTqmVFtkvFk8KQLs1jKtuVELcvbYsk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 30 May 2025 05:54:39 +0200
Subject: [PATCH v3 5/6] sysfs: remove bin_attribute::read_new/write_new()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sysfs-const-bin_attr-final-v3-5-724bfcf05b99@weissschuh.net>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
In-Reply-To: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577802; l=2951;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Q2OPQrIO/jaDN/2l0DiXXRSCwM0map7oHs8r7qRwFLo=;
 b=P8NiIQRawpWpqqIkYyXt/8HbuNbrgXEp831Da1FmsNAsDiUm2gkQQZo6GeNsWF71PUdVH4ONU
 3jpR4BqP8wHD14Mv+0HvZKCV3qtPGUkU9xd7nFEXqU3X5kel82S4p0f
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

These transitional fields are unnecessary und unused.
Remove them and their logic in the sysfs core.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 fs/sysfs/file.c       | 22 +++++-----------------
 include/linux/sysfs.h |  4 ----
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 1ca143d2f22ad2d6b0b74b261514f8bc3cb5153c..3825e780cc580df4a1a511d12b3ee3fa2e6bdb37 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -97,12 +97,9 @@ static ssize_t sysfs_kf_bin_read(struct kernfs_open_file *of, char *buf,
 			count = size - pos;
 	}
 
-	if (!battr->read && !battr->read_new)
+	if (!battr->read)
 		return -EIO;
 
-	if (battr->read_new)
-		return battr->read_new(of->file, kobj, battr, buf, pos, count);
-
 	return battr->read(of->file, kobj, battr, buf, pos, count);
 }
 
@@ -161,12 +158,9 @@ static ssize_t sysfs_kf_bin_write(struct kernfs_open_file *of, char *buf,
 	if (!count)
 		return 0;
 
-	if (!battr->write && !battr->write_new)
+	if (!battr->write)
 		return -EIO;
 
-	if (battr->write_new)
-		return battr->write_new(of->file, kobj, battr, buf, pos, count);
-
 	return battr->write(of->file, kobj, battr, buf, pos, count);
 }
 
@@ -335,19 +329,13 @@ int sysfs_add_bin_file_mode_ns(struct kernfs_node *parent,
 	const struct kernfs_ops *ops;
 	struct kernfs_node *kn;
 
-	if (battr->read && battr->read_new)
-		return -EINVAL;
-
-	if (battr->write && battr->write_new)
-		return -EINVAL;
-
 	if (battr->mmap)
 		ops = &sysfs_bin_kfops_mmap;
-	else if ((battr->read || battr->read_new) && (battr->write || battr->write_new))
+	else if (battr->read && battr->write)
 		ops = &sysfs_bin_kfops_rw;
-	else if (battr->read || battr->read_new)
+	else if (battr->read)
 		ops = &sysfs_bin_kfops_ro;
-	else if (battr->write || battr->write_new)
+	else if (battr->write)
 		ops = &sysfs_bin_kfops_wo;
 	else
 		ops = &sysfs_file_kfops_empty;
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index f418aae4f1134f8126783d9e8eb575ba4278e927..7544f6d81c05982b5d168624f376cd647127ab51 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -308,12 +308,8 @@ struct bin_attribute {
 	struct address_space *(*f_mapping)(void);
 	ssize_t (*read)(struct file *, struct kobject *, const struct bin_attribute *,
 			char *, loff_t, size_t);
-	ssize_t (*read_new)(struct file *, struct kobject *, const struct bin_attribute *,
-			    char *, loff_t, size_t);
 	ssize_t (*write)(struct file *, struct kobject *, const struct bin_attribute *,
 			 char *, loff_t, size_t);
-	ssize_t (*write_new)(struct file *, struct kobject *,
-			     const struct bin_attribute *, char *, loff_t, size_t);
 	loff_t (*llseek)(struct file *, struct kobject *, const struct bin_attribute *,
 			 loff_t, int);
 	int (*mmap)(struct file *, struct kobject *, const struct bin_attribute *attr,

-- 
2.49.0

