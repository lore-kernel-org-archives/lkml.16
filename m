Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D71E1A20
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344103; cv=none; b=juS15MlyQ+WUnsbomCB8tFN1Ub+MRS2b9j/kU2fjf4XB0QQ/Op825EjSCis1PIbyK1gZkTdLz7Pl2TkP7bxlPFaAIuczS3V5jdJFypzIQpuZCwQEB7ab+rdghKkThqnNv/wURwRy+0enadlLO5CxIuqpmWkXu8rPpih6nnYcUtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344103; c=relaxed/simple;
	bh=EKhkJxS5sxvvyjsqt1qE8UI8vfJjRKlTWu5FU+p35x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXOtt+GXOxVo6MgoKCRhDKsDeolRAAwL33v5ITvLQYq4dCQujfMx+ON+W+FhnLMMISx36wK6fdNKcePZQeqBGofUehC5ptoEISN/U6ZsN8P+d49j4jLRpZpWjEDMNMBbd+A4t6Gsmnu3/fAV+eBO6jimDi7k9gOhsIYA21FiHDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vll48Wki; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vll48Wki"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745344098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WYSPz7L9vzvUPBLf1S2L+o4oz/bB8vL10hN5EymzT1w=;
	b=vll48WkiKVmtAfAFtgNO06a0TR057oCTAYgkQv21a9TfZ50PuxdiQt4SOIlScjzT/mgshg
	7QWia0KaMiRJT6/IzGiujyfTzE3gIJJXj8kX8snDkqiAdKe0sUHWQu8dm1nDG6VcZcI17m
	QPl5/NUiaJny6KYhY5mqKJ4E5DJioUg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ubifs: Fix grammar in error message
Date: Tue, 22 Apr 2025 19:47:57 +0200
Message-ID: <20250422174758.27483-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/much/many/

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ubifs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index ee954e64ce7f..e28ab4395e5c 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -985,7 +985,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
 
 	if (kill_xattrs && ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
-		ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
+		ubifs_err(c, "Cannot delete inode, it has too many xattrs!");
 		err = -EPERM;
 		ubifs_ro_mode(c, err);
 		return err;
-- 
2.49.0

