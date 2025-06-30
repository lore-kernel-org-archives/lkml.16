Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7549128DEE5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299722; cv=none; b=cebMHjDZf6sL2xeaEP5Y7rRxE2wEqhE1az0qVWYGjQMLQwW3UzzwVMVAeGiyuyY/dxq0LCjhoZlJg5uHVM+y8w/zfkz8IijSMvkkfwD0EVhglS7ZB8gwUwoCv56BeNbddDMuQbHQtIXWE00T07JZ7KBFot7wt/u5XS10eEmWhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299722; c=relaxed/simple;
	bh=6aZ6RrcZTZwQoW5ivL50ynDXvw/g7SfaRb+9dlOqfpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrP6tubG8LPiPoLJjfAvMaOhxMMbsUOkEPrnzoUc1CwD4zB+kysqanMTz0jaAeTEfdZsnficFoDJyX5FbTpaVOI/UMia57XuWTqkdJy0xonNJHazybu0T0vJzKoX6uL9MORlAXcAUZyM+xdb5VNPJlnDRs6xI104c1/XV2GpEbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPljEV38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPljEV38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE91C4CEE3;
	Mon, 30 Jun 2025 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299721;
	bh=6aZ6RrcZTZwQoW5ivL50ynDXvw/g7SfaRb+9dlOqfpc=;
	h=From:To:Cc:Subject:Date:From;
	b=XPljEV38kuR3dBAxZXLsOowg833OEWE64z1v3LWtHuIHSQplNC57ZKbr6RIcRaBtf
	 /hU7sBAAmbrmiWTdH91GNFjVZ5WoO6nz7ajvh9sWEtiDhnFuZ0Xj59WpkqZQqY/HU6
	 umKopUpan3FF/aomxcesf6yjyeYJeZAO5UG6QGi/sCM1CJp70qC8KQm3ltfEOyfyxk
	 QiEE2BiRs49/WPU+TJ7KcmzQDjZ7QZChndlQQC1mE7sozs6bXGDMf1avRD7EwhXKU6
	 zM1k5WWHl7uFEPXjCpDES5bbIugGZ4eKKrHQQy87iud+gi4K0Mf1j7JP7p7gIcfW2N
	 WyWwdx2y3sjdg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH] f2fs: check the generic conditions first
Date: Mon, 30 Jun 2025 16:08:38 +0000
Message-ID: <20250630160839.1142073-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's return errors caught by the generic checks. This fixes generic/494 where
it expects to see EBUSY by setattr_prepare instead of EINVAL by f2fs for active
swapfile.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index bc0ca697e064..bd835c4f874a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1048,6 +1048,18 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
+	err = setattr_prepare(idmap, dentry, attr);
+	if (err)
+		return err;
+
+	err = fscrypt_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
+
+	err = fsverity_prepare_setattr(dentry, attr);
+	if (err)
+		return err;
+
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
@@ -1077,18 +1089,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			return -EINVAL;
 	}
 
-	err = setattr_prepare(idmap, dentry, attr);
-	if (err)
-		return err;
-
-	err = fscrypt_prepare_setattr(dentry, attr);
-	if (err)
-		return err;
-
-	err = fsverity_prepare_setattr(dentry, attr);
-	if (err)
-		return err;
-
 	if (is_quota_modification(idmap, inode, attr)) {
 		err = f2fs_dquot_initialize(inode);
 		if (err)
-- 
2.50.0.727.gbf7dc18ff4-goog

