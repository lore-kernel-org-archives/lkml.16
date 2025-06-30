Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D923F27B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277352; cv=none; b=qQP4FVGM4/3jgr3rbg3RmRj6tssJFLstex7f9kCG5xi7NcfCgz0IB+QEsEjnmwgGjmh3MV0xx+afUnp7CnxUuwnYCa0jeN39nUL3cyn8RHxHsPcYho8MTIKsjrjfE/MOhDcni4NauTOVBKL1dVnhtsco9SqblEY6xxBfEwKyEm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277352; c=relaxed/simple;
	bh=4BnsVX8Oyd3x53/cVomKMe10uKarAX3HLQc6pOmJmZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOyl+yTZhBRLwptAZmWyhD0+COlNJreiyQKE/93jBtnxutFdlKm6PBDUgjEuBDiWUnr9gX6JDIawKe0IC1B2ygsb0EIZVdtQcPZkBXzNG4FiBItC+WQwz8oHPL019ByOKiTEU0SXjMZ9xGV07Tq5JK6ghl41ssrQP1+CBsD3usk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bW1fZ2zjvzYmN1Q;
	Mon, 30 Jun 2025 17:52:22 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 17:54:58 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 17:54:57 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<bintian.wang@honor.com>, <feng.han@honor.com>, <niuzhiguo84@gmail.com>,
	wangzijie <wangzijie1@honor.com>
Subject: [f2fs-dev] [PATCH v5 2/2] f2fs: don't allow unaligned truncation to smaller/equal size on pinned file
Date: Mon, 30 Jun 2025 17:54:54 +0800
Message-ID: <20250630095454.3912441-2-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630095454.3912441-1-wangzijie1@honor.com>
References: <20250630095454.3912441-1-wangzijie1@honor.com>
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
In addition, xfstests #494 assumes truncation on active swapfile(pinned) will return
ETXTBSY by setattr_prepare() -> inode_newsize_ok(), so we relocate this check after
setattr_prepare().

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
v5:
- fix xfstests #494 fail
---
 fs/f2fs/file.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 78368b793..d4feea44b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1070,6 +1070,23 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (err)
 		return err;
 
+	/*
+	 * To prevent scattered pin block generation, we don't allow
+	 * smaller/equal size unaligned truncation for pinned file.
+	 * We only support overwrite IO to pinned file, so don't
+	 * care about larger size truncation.
+	 * We need to check this after setattr_prepare() because xfstests
+	 * #494 assumes truncation on active swapfile(pinned) will
+	 * return ETXTBSY by setattr_prepare() -> inode_newsize_ok().
+	 */
+	if (attr->ia_valid & ATTR_SIZE) {
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size <= i_size_read(inode) &&
+			!IS_ALIGNED(attr->ia_size,
+			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+			return -EINVAL;
+	}
+
 	err = fscrypt_prepare_setattr(dentry, attr);
 	if (err)
 		return err;
-- 
2.25.1

