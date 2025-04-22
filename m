Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB651F09B1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325924; cv=none; b=UuDF7pvOlL4sXirvWLjMLTegWwqAFsCTIvVmCLctOLgKZsMfR05zOwBXjUfnUummOl4FbJUDod+60uEeWFlmdEEIacRBPuVHTH+0Xa5p6LkNKS4qH8vewdocqdoutg59NRfxvvdvrFYa3Gq0Aw4+kn+yCLDQ+yN6/t31eKBzBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325924; c=relaxed/simple;
	bh=9bfL59daWQ36pOhEeHm0n2djklcS+CRCtrfj8OoE1f4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HHcOo4EgBJBEqoC9Anj3pLlUl46I3/wayvnZdLOE8xUP3GreFUF0s1Hp+RTNqq6TPRGdpiUfWyXOXPLWlsXq/f9R1lG5Aqf1VD8jEnLXNHGB5+yA5PO9wt7aIK9n90RKyPm1TWQ0sg39xzs4Yy2/cLieGFD7NC2aGtR255ICb1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZhhgB046hzvWrn;
	Tue, 22 Apr 2025 20:41:10 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id C2017180080;
	Tue, 22 Apr 2025 20:45:18 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Apr
 2025 20:45:18 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <huyue2@coolpad.com>,
	<jefflexu@linux.alibaba.com>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH RFC 1/4] erofs-utils: lib: introduce --meta_fix format option
Date: Tue, 22 Apr 2025 12:36:09 +0000
Message-ID: <20250422123612.261764-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250422123612.261764-1-lihongbo22@huawei.com>
References: <20250422123612.261764-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemo500009.china.huawei.com (7.202.194.199)

The option --meta_fix format option allow the mkfs.erofs
can fix the metadata area at the front of the image file.
It makes the disk format easier.

Now we only allow to fix the metadata area at the front
in EROFS_INODE_FLAG_PLAIN layout.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 include/erofs/config.h |  1 +
 mkfs/main.c            | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/erofs/config.h b/include/erofs/config.h
index 92c1467..ac6dd9b 100644
--- a/include/erofs/config.h
+++ b/include/erofs/config.h
@@ -66,6 +66,7 @@ struct erofs_configure {
 	bool c_xattr_name_filter;
 	bool c_ovlfs_strip;
 	bool c_hard_dereference;
+	bool c_meta_fix;
 
 #ifdef HAVE_LIBSELINUX
 	struct selabel_handle *sehnd;
diff --git a/mkfs/main.c b/mkfs/main.c
index 6d1a2de..42635c6 100644
--- a/mkfs/main.c
+++ b/mkfs/main.c
@@ -87,6 +87,7 @@ static struct option long_options[] = {
 	{"sort", required_argument, NULL, 527},
 	{"hard-dereference", no_argument, NULL, 528},
 	{"dsunit", required_argument, NULL, 529},
+	{"meta_fix", no_argument, NULL, 530},
 	{0, 0, 0, 0},
 };
 
@@ -191,6 +192,7 @@ static void usage(int argc, char **argv)
 		"                                            headerball=file data is omited in the source stream)\n"
 		" --ovlfs-strip=<0,1>   strip overlayfs metadata in the target image (e.g. whiteouts)\n"
 		" --quiet               quiet execution (do not write anything to standard output.)\n"
+		" --meta_fix            make metadata area fixed at the front of the image file\n"
 #ifndef NDEBUG
 		" --random-pclusterblks randomize pclusterblks for big pcluster (debugging only)\n"
 		" --random-algorithms   randomize per-file algorithms (debugging only)\n"
@@ -886,6 +888,9 @@ static int mkfs_parse_options_cfg(int argc, char *argv[])
 				return -EINVAL;
 			}
 			break;
+		case 530:
+			cfg.c_meta_fix = true;
+			break;
 		case 'V':
 			version();
 			exit(0);
@@ -903,6 +908,23 @@ static int mkfs_parse_options_cfg(int argc, char *argv[])
 		return -EINVAL;
 	}
 
+	if (cfg.c_meta_fix) {
+		if (cfg.c_compr_opts[0].alg) {
+			erofs_err("--meta_fix cannot be used with compress case");
+			return -EINVAL;
+		}
+
+		if (cfg.c_chunkbits) {
+			erofs_err("--meta_fix cannot be used with --chunksize");
+			return -EINVAL;
+		}
+
+		if (cfg.c_inline_data) {
+			erofs_info("--meta_fix force to turn off the inline_data");
+			cfg.c_inline_data = false;
+		}
+	}
+
 	/* TODO: can be implemented with (deviceslot) mapped_blkaddr */
 	if (cfg.c_blobdev_path &&
 	    cfg.c_force_chunkformat == FORCE_INODE_BLOCK_MAP) {
-- 
2.22.0

