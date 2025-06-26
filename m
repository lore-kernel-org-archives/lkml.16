Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [178.154.239.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464C1192B90
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750923115; cv=none; b=DxA8tCsOZfNWuwKMQHkqT+IrkbxDFCu4CkyyiMQu1pw9Mrk+KzM1MZwL5dkdy/SPHk4zhJvN90VeX1sfskk8osTkBKZwBkhAyc9ZS7tZR2lu4iZp/822RkeF7ZXdYhyRRV7TqTdwK8T5gygMm+Xg90sW8zjNCW6mIjYUAd6wDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750923115; c=relaxed/simple;
	bh=DzShWGsiCFTrhG795YY2CzC9oV+TFQYhXZg84VvmGYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3qFYMJdUQKkXmVlUAZjIavj4C9AJVT6bQmVkHib+uvpZNol06ll3ONeUcMkBGJMpwCOC2elkntn9UejpA1svIo/khm/X4E18lqhLJBCDxO++5nNyPCtarMD0uEYnI2NV9Nto0NTeQulJPLxYtBfoRTOCqMrMyVtXnH5Oov7l2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=oUfsYCq9; arc=none smtp.client-ip=178.154.239.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="oUfsYCq9"
Received: from mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0d:4d14:0:640:55f0:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id C37E160E57;
	Thu, 26 Jun 2025 10:31:42 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id fVPJVTiLeeA0-5UqhBIxu;
	Thu, 26 Jun 2025 10:31:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1750923102; bh=QZ/6fF8uaLS8LItjh0X1JxYDuz3QBRHtBeKdW7mgNSY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=oUfsYCq9wYFyFUsF2XGsKlwquJpoVuMhxGh76I0NzYQRL/nyuaMxi67bJ6k+5kMvn
	 U1XDEH0Y/SUTHP1XWrsPuZ7+4ShLa6IItR2wPwUaRaOjflqqWwg45gwHWmXKMkb+CV
	 vxFZvJDuk8Y+pAYgb03tlh9I0vOMYomynBG2WVNs=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	"Tiffany Y . Yang" <ynaffit@google.com>,
	linux-kernel@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/2] binder: use kstrdup() in binderfs_binder_device_create()
Date: Thu, 26 Jun 2025 10:30:53 +0300
Message-ID: <20250626073054.7706-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'binderfs_binder_device_create()', use 'kstrdup()' to copy the
newly created device's name, thus making the former a bit simpler.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/android/binderfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 024275dbfdd8..4f827152d18e 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -117,7 +117,6 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
 	struct dentry *dentry, *root;
 	struct binder_device *device;
 	char *name = NULL;
-	size_t name_len;
 	struct inode *inode = NULL;
 	struct super_block *sb = ref_inode->i_sb;
 	struct binderfs_info *info = sb->s_fs_info;
@@ -161,9 +160,7 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
 	inode->i_gid = info->root_gid;
 
 	req->name[BINDERFS_MAX_NAME] = '\0'; /* NUL-terminate */
-	name_len = strlen(req->name);
-	/* Make sure to include terminating NUL byte */
-	name = kmemdup(req->name, name_len + 1, GFP_KERNEL);
+	name = kstrdup(req->name, GFP_KERNEL);
 	if (!name)
 		goto err;
 
-- 
2.50.0

