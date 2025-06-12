Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07F810957
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749698875; cv=none; b=laI0xF1IKCrJ8JbHaMRbMqrU7Md47JVJimRZ5aOXyn1sTbXm1BRo+p+74iJ8u2PN/itNmKoIiB9XDgFVJzAXdki0Mokx3BV/zDNNI43Xk8j2xIQsEBA0AJBCGTcwWgf7P9/g5qV5GwSNzxc5R8RZCTU2ODzOQQrk672M258EoII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749698875; c=relaxed/simple;
	bh=pyP3LKjBqTJk80HIkrc7Hx5rUDUcxph2kmtJfcFzh5U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fedQ46mHoXkRsfMxLu27TdBXj5QmpvYq40nR1ePw8g9qXEqqkI/NcQ810sFHpy4eAZOOha+PCUOIaOaThw+8G3QABSUWmV3bHWGl3HW/rwKcpomRUTWIH+/gJJSMK1KFCxZNCrr/xqZXJJxr6GI8lhNfUybKMf9oqoSPYC6BHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bHnwp3n60zYlZl1;
	Thu, 12 Jun 2025 11:25:46 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Jun
 2025 11:27:45 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Jun
 2025 11:27:45 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <bo.wu@vivo.com>, <linux-f2fs-devel@lists.sourceforge.net>,
	<linux-kernel@vger.kernel.org>, wangzijie <wangzijie1@honor.com>
Subject: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section when gc happens EAGAIN
Date: Thu, 12 Jun 2025 11:27:42 +0800
Message-ID: <20250612032742.1734852-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)

Wu Bo once mentioned a fallocate fail scenario in this link[1].
After commit 3fdd89b452c2("f2fs: prevent writing without fallocate()
for pinned files"), we cannot directly generate 4K size file and
pin it, but we can still generate non-segment aligned pinned file:

touch test_file
./f2fs_io pinfile set test_file
./f2fs_io fallocate 0 0 8192 test_file
truncate -s 4096 test_file

By doing this, pin+fallocate failure(gc happens EAGAIN but f2fs shows
enough spare space) may occurs.

From message in commit 2e42b7f817ac("f2fs: stop allocating pinned sections
if EAGAIN happens"), gc EAGAIN doesn't guarantee a free section, so we stop
allocating. But after commit 48ea8b200414 ("f2fs: fix to avoid panic once 
fallocation fails for pinfile"), we have a way to avoid panic caused by
concurrent pinfile allocation run out of free section, so I think that we 
can continue to allocate pinned section when gc happens EAGAIN. Even if we
don't have free section, f2fs_allocate_pinning_section() can fail with ENOSPC.

[1] https://lore.kernel.org/linux-f2fs-devel/20231030094024.263707-1-bo.wu@vivo.com/t/#u

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f..05c80d2b5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1859,7 +1859,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
-			if (err && err != -ENODATA) {
+			if (err && err != -ENODATA && err != -EAGAIN) {
 				f2fs_up_write(&sbi->pin_sem);
 				goto out_err;
 			}
-- 
2.25.1

