Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AAD248F6F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749795853; cv=none; b=RJzCt0fcxZ9sZ5to1M/e9IqYMJ2HzFQPN5JUTfoHvlLOmxGVfiDejC2DEjEjhk8oHlK5pwnv+0DARxHc+f3qHgs+y34NU1YIGn5O5gJyxlqN8DvNpcwPEKVu/aydlOkCid3kz23rVaV08DffRxJTuHSf618orOCK5sizmGPGvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749795853; c=relaxed/simple;
	bh=ZwLyMbFgl7i2Kx2DXmciCKeqLlae832p1KK6uaUwtCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uauD4SZBaqDPKOy5pMmsbUYU73hab30jDsnKvOmbkLW0fymZKXbatYeuHnXTb/od5e3KMEQSVeZP3nkfqIxlI1cFNv9S5T5cfwtiiORrOezmEHJo6t/YXH0GrSMV58YtJsET2dniW/wWrs2Jq2tLmi8/IE2Nh0PzHkoDs2qgpto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hg2qBBx1; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hg2qBBx1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749795837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0aYlKxSANiSaLWP3mh2iKPUZWQAYGC8F8HQLXkO62Pw=;
	b=hg2qBBx1ypTJXAcCs5Ymywztcg7ASaejVJZvyZZNeSWfKzOkrAfffILMCkcOHmMlOzHhx2
	skPQtJXItjDUnMBJHOI6TQ0hbYaIJFUS3DZQjKCmdPlaVd/DuEtoTgXamIkwb/zwP1RF7Q
	6/6gMKDa/EJHaarhVE0Vtf+7YHSwpI8=
From: Cixi Geng <cixi.geng@linux.dev>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhengxu.zhang@unisoc.com
Subject: [PATCH] exfat: fdatasync flag should be same like generic_write_sync()
Date: Fri, 13 Jun 2025 14:23:39 +0800
Message-ID: <20250613062339.27763-1-cixi.geng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Zhengxu Zhang <zhengxu.zhang@unisoc.com>

Test: androbench by default setting, use 64GB sdcard.
 the random write speed:
	without this patch 3.5MB/s
	with this patch 7MB/s

After patch "11a347fb6cef", the random write speed decreased significantly.
the .write_iter() interface had been modified, and check the differences with
generic_file_write_iter(), when calling generic_rite_sync() and
exfat_file_write_iter() to call vfs_fsync_range(), the fdatasync flag is wrong,
and make not use the fdatasync mode, and make random write speed decreased.

so make the fdatasync flag like generic_write_sync().

Fixes: 11a347fb6cef ("exfat: change to get file size from DataLength")

Signed-off-by: Zhengxu Zhang <zhengxu.zhang@unisoc.com>
---
 fs/exfat/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 841a5b18e3df..01d983fa7f55 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -625,7 +625,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 
 	if (iocb_is_dsync(iocb) && iocb->ki_pos > pos) {
 		ssize_t err = vfs_fsync_range(file, pos, iocb->ki_pos - 1,
-				iocb->ki_flags & IOCB_SYNC);
+				(iocb->ki_flags & IOCB_SYNC) ? 0 : 1);
 		if (err < 0)
 			return err;
 	}
-- 
2.25.1

