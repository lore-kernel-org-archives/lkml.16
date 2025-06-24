Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD2D1F9F70
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750737593; cv=none; b=WWq4iuw4B/AvR1nWbOWqUEbzziQiTeE1jav2PUQnZto0i1RGJfS3Z+E4RpoAvyL4vcFyyzDCUVmyg0b+gMWFVR/cEc0ifmfh52JDX0w164kPfGVk8wc8G0OQMGsyuYp6V5pejpMOh8DNYacnXpfneIaXIByIAnvpP0zUk6rMI1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750737593; c=relaxed/simple;
	bh=+6Dyf3XGuCDAA3JKX/DQd6p1/tGUqomzIOmx8gtbUmU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZXBxxv99dsCMeDuyOTaBlFLSCvJsoExutsgSpjo28xRLdwqkuk6wU+9yDO2dYzzvZhlxDVkRkVOnK7pPp7ndlZyuXNLRpnufw3FJcMHIO8blpB1TWdqKXLeJOQW8qsOXJFps1dxvnKHrtCruwTgYw1Z4Hw2qW6WoJFLVlh4XO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bRB3n0cNCzYkxsh;
	Tue, 24 Jun 2025 11:57:25 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Jun
 2025 11:59:41 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Jun
 2025 11:59:41 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <feng.han@honor.com>, <niuzhiguo84@gmail.com>,
	wangzijie <wangzijie1@honor.com>
Subject: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned truncation to smaller/equal size on pinned file
Date: Tue, 24 Jun 2025 11:59:38 +0800
Message-ID: <20250624035938.3176350-2-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250624035938.3176350-1-wangzijie1@honor.com>
References: <20250624035938.3176350-1-wangzijie1@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)

To prevent scattered pin block generation, don't allow non-section aligned truncation
to smaller or equal size on pinned file. But for truncation to larger size, after
commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
we only support overwrite IO to pinned file, so we don't need to consider
attr->ia_size > i_size case.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
v4:
- convert sbi first and apply change
---
 fs/f2fs/file.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 209f43653..4809f0fd6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1048,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			!IS_ALIGNED(attr->ia_size,
 			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
+		/*
+		 * To prevent scattered pin block generation, we don't allow
+		 * smaller/equal size unaligned truncation for pinned file.
+		 * We only support overwrite IO to pinned file, so don't
+		 * care about larger size truncation.
+		 */
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size <= i_size_read(inode) &&
+			!IS_ALIGNED(attr->ia_size,
+			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+			return -EINVAL;
 	}
 
 	err = setattr_prepare(idmap, dentry, attr);
-- 
2.25.1

