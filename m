Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADD1E3DD3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903811; cv=none; b=HU53E0hAJESZq1v0eMu2S8J8DzrLKc5ziK047esET3PWUMHi00F8708w74s2v1fLGko0ChNbmnyw+GO/a//h7haaYWxHlBJb/yrxHxPj8dPZosAs4xvtgvvA3wyE/KNLRmi5YwkJf90Ej0IPZfVMbnpFTjm7J4rdOTX6xt39eGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903811; c=relaxed/simple;
	bh=2xPNFd0KhJ0783Njs5NDKUzVGIaB8+LzqtKz79gU8Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nu5UDOoZNVH1NwdLM65FNIWRaxYJtSFfkhxVzb560rdzbNBuygn4Kt3TROQe2WZ6qsD2BsONrRAdVmhMmzUsW4vNQBbDKOn8oblfPpASJY4dbS8f3wQ5tmZKxC9445NLxdWl8deOQDFd7Eng0GJ/DLFB744mnemYZtbrGh5S1Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UINuOyPt; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UINuOyPt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747903799; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=XsgZbeTYJ1De+zCUdNxTFPv+ZFEa7d4CVAY3g5Aq4SU=;
	b=UINuOyPtafvOAEKwxArjhJ3DjN9qtJMFF+Xefe/ZwbrOlNeOIu6zClE+SGmg/H6nXdIB7zq+jmhiwMdKbMe7cKogxb7RvHjR/id67y0PSxMPehbId9eW4t60GRSTVquC2bg6+aLFyg+QMmVP+6EGEY2xloX2JONj2YBlQoLCyqk=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WbVHIyW_1747903794 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 May 2025 16:49:59 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH] erofs: clean up erofs_{init,exit}_sysfs()
Date: Thu, 22 May 2025 16:49:53 +0800
Message-ID: <20250522084953.412096-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of useless `goto`s.  No logic changes.

Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/sysfs.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/fs/erofs/sysfs.c b/fs/erofs/sysfs.c
index dad4e6c6c155..c6650350c4cd 100644
--- a/fs/erofs/sysfs.c
+++ b/fs/erofs/sysfs.c
@@ -248,6 +248,12 @@ void erofs_unregister_sysfs(struct super_block *sb)
 	}
 }
 
+void erofs_exit_sysfs(void)
+{
+	kobject_put(&erofs_feat);
+	kset_unregister(&erofs_root);
+}
+
 int __init erofs_init_sysfs(void)
 {
 	int ret;
@@ -255,24 +261,12 @@ int __init erofs_init_sysfs(void)
 	kobject_set_name(&erofs_root.kobj, "erofs");
 	erofs_root.kobj.parent = fs_kobj;
 	ret = kset_register(&erofs_root);
-	if (ret)
-		goto root_err;
-
-	ret = kobject_init_and_add(&erofs_feat, &erofs_feat_ktype,
-				   NULL, "features");
-	if (ret)
-		goto feat_err;
-	return ret;
-
-feat_err:
-	kobject_put(&erofs_feat);
-	kset_unregister(&erofs_root);
-root_err:
+	if (!ret) {
+		ret = kobject_init_and_add(&erofs_feat, &erofs_feat_ktype,
+					   NULL, "features");
+		if (!ret)
+			return 0;
+		erofs_exit_sysfs();
+	}
 	return ret;
 }
-
-void erofs_exit_sysfs(void)
-{
-	kobject_put(&erofs_feat);
-	kset_unregister(&erofs_root);
-}
-- 
2.43.5

