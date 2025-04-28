Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17796270ED8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850885; cv=none; b=DE1vnyvD9T+XgdDY2Xglj3hMjaDhj+5+1a7hMQEVU0mCvFDAY5cmANcRKVCNVxoxfNwNzRXqDdD4dZ0WWXYw+s3hYaYuKVVvrBCiCaMLnDQY0H6gX7XSlEwsfRj8Y4edbAqEW3ieJbNdNDvj8ymUbInQ0YCjRIn1xpRIBoOFKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850885; c=relaxed/simple;
	bh=bmwb7cewTerrBzFLMN7pn3EOi/tKb10E+NJyhlKmUqE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h+uPhG1jcgtAIMwX8b6UcEkgurnx9exVzFO3CWM7M5cO+bOSgUwbzg0FZyE9DBx2FxlkU7KmR442vIuyOOp6faHaxwQI8QJ+0SAOgV2uMrv63UoiRZGPfApwFj2H7QLaKdT+tupydG1b5tORlEnkqYdeHCiMqY/fc8wMcM+wRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZmQt00Zd7z13L3c;
	Mon, 28 Apr 2025 22:33:28 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id C8F291402C1;
	Mon, 28 Apr 2025 22:34:33 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Apr
 2025 22:34:33 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <zbestahu@gmail.com>,
	<jefflexu@linux.alibaba.com>
CC: <dhavale@google.com>, <linux-erofs@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH] erofs: reject unknown option if it is not supported
Date: Mon, 28 Apr 2025 14:25:45 +0000
Message-ID: <20250428142545.484818-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemo500009.china.huawei.com (7.202.194.199)

Some options are supported depending on different compiling config,
and these option will not fail during mount if they are not
supported. This is very weird, so we can reject them if they are
not supported.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/erofs/super.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index cadec6b1b554..c1c350c6fbf4 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -374,16 +374,26 @@ static const struct constant_table erofs_dax_param_enums[] = {
 };
 
 static const struct fs_parameter_spec erofs_fs_parameters[] = {
+#ifdef CONFIG_EROFS_FS_XATTR
 	fsparam_flag_no("user_xattr",	Opt_user_xattr),
+#endif
+#ifdef CONFIG_EROFS_FS_POSIX_ACL
 	fsparam_flag_no("acl",		Opt_acl),
+#endif
+#ifdef CONFIG_EROFS_FS_ZIP
 	fsparam_enum("cache_strategy",	Opt_cache_strategy,
 		     erofs_param_cache_strategy),
+#endif
 	fsparam_flag("dax",             Opt_dax),
 	fsparam_enum("dax",		Opt_dax_enum, erofs_dax_param_enums),
 	fsparam_string("device",	Opt_device),
+#ifdef CONFIG_EROFS_FS_ONDEMAND
 	fsparam_string("fsid",		Opt_fsid),
 	fsparam_string("domain_id",	Opt_domain_id),
+#endif
+#ifdef CONFIG_EROFS_FS_BACKED_BY_FILE
 	fsparam_flag_no("directio",	Opt_directio),
+#endif
 	{}
 };
 
@@ -424,33 +434,27 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 		return opt;
 
 	switch (opt) {
-	case Opt_user_xattr:
 #ifdef CONFIG_EROFS_FS_XATTR
+	case Opt_user_xattr:
 		if (result.boolean)
 			set_opt(&sbi->opt, XATTR_USER);
 		else
 			clear_opt(&sbi->opt, XATTR_USER);
-#else
-		errorfc(fc, "{,no}user_xattr options not supported");
-#endif
 		break;
-	case Opt_acl:
+#endif
 #ifdef CONFIG_EROFS_FS_POSIX_ACL
+	case Opt_acl:
 		if (result.boolean)
 			set_opt(&sbi->opt, POSIX_ACL);
 		else
 			clear_opt(&sbi->opt, POSIX_ACL);
-#else
-		errorfc(fc, "{,no}acl options not supported");
-#endif
 		break;
-	case Opt_cache_strategy:
+#endif
 #ifdef CONFIG_EROFS_FS_ZIP
+	case Opt_cache_strategy:
 		sbi->opt.cache_strategy = result.uint_32;
-#else
-		errorfc(fc, "compression not supported, cache_strategy ignored");
-#endif
 		break;
+#endif
 	case Opt_dax:
 		if (!erofs_fc_set_dax_mode(fc, EROFS_MOUNT_DAX_ALWAYS))
 			return -EINVAL;
@@ -491,22 +495,15 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 		if (!sbi->domain_id)
 			return -ENOMEM;
 		break;
-#else
-	case Opt_fsid:
-	case Opt_domain_id:
-		errorfc(fc, "%s option not supported", erofs_fs_parameters[opt].name);
-		break;
 #endif
-	case Opt_directio:
 #ifdef CONFIG_EROFS_FS_BACKED_BY_FILE
+	case Opt_directio:
 		if (result.boolean)
 			set_opt(&sbi->opt, DIRECT_IO);
 		else
 			clear_opt(&sbi->opt, DIRECT_IO);
-#else
-		errorfc(fc, "%s option not supported", erofs_fs_parameters[opt].name);
-#endif
 		break;
+#endif
 	}
 	return 0;
 }
-- 
2.22.0

