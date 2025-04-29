Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6322D79D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913551; cv=none; b=dPAWR17iKoiDTjE4U7ciXxZgjg2HNaHdC9mUxnABpxXRiXKS+4udRZpYX48DcDc34qMosRii6HqxnTJx45oouzxnVj7j/7qqWs6lIwCFAJOzC5i2Axu1tjtxiVhlV0zS2tVh28QFfqDSWqYNQ3JNNHMvRReDp0Hfn7lxpFKMpkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913551; c=relaxed/simple;
	bh=swxCFukqVYL++kIfVuki+6plLSjpjK3xthD6yhAzAPE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yz2v2BuaNCs+BYQQi8MoDB4uoO8eBpkXZvotP3ENhbdqsvthS3EpLMpeSGZOugJqsgDiyz1bdznZVmJQtko1bP/0TB15EHknbFobWpL/heT0zHxaflgl2KWtNL9ggA9jur3DW3IIDKLiHLbq2LgaRk1lMu/ZCsbQgICQVlJss9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Zmt291m0hz1R7cm;
	Tue, 29 Apr 2025 15:57:05 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 9653E1A0188;
	Tue, 29 Apr 2025 15:59:07 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 29 Apr
 2025 15:59:07 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <zbestahu@gmail.com>,
	<jefflexu@linux.alibaba.com>
CC: <dhavale@google.com>, <linux-erofs@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH v2] erofs: reject unknown option if it is not supported
Date: Tue, 29 Apr 2025 07:50:29 +0000
Message-ID: <20250429075029.689511-1-lihongbo22@huawei.com>
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

For (no)acl, (no)user_xattr and dax related option, these are common
option in other fses, so we keep them in the old way (e.g.: will error
out the log if they are not supported).

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
v1: https://lore.kernel.org/all/20250428142545.484818-1-lihongbo22@huawei.com/
  - Keep (no)acl and (no)user_xattr in old way.
---
 fs/erofs/super.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index cadec6b1b554..45038981ea12 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -376,14 +376,20 @@ static const struct constant_table erofs_dax_param_enums[] = {
 static const struct fs_parameter_spec erofs_fs_parameters[] = {
 	fsparam_flag_no("user_xattr",	Opt_user_xattr),
 	fsparam_flag_no("acl",		Opt_acl),
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
 
@@ -444,13 +450,11 @@ static int erofs_fc_parse_param(struct fs_context *fc,
 		errorfc(fc, "{,no}acl options not supported");
 #endif
 		break;
-	case Opt_cache_strategy:
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

