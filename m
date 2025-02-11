Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A45230D0E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282064; cv=none; b=K0bggqK81EuF8SwyFHgLK1YKH55iIIZxqyWARVga7CqYOMNPlnNrvUtFBBLceMNYNGDTiBdIpZQ0IGnX+SnH7uCj2EXba1WxJcWdE7oLpGiXw82LfI1PtH3GzBw8HZHPKnGKAoYxAT99nwrTsRZW8FAEdsO5S+jiw4685AL8m6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282064; c=relaxed/simple;
	bh=yLAlqWBH9VMvr25WNBDwbIjRTIp1f0MU97u0uNuvZuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0jfuiFJDHMGvvgC2FbmeGGlqdkXSThPBfls7kC7LsfKdeWHP+CdQ4b8IE7O4TEzMhdvR/hRTCWprJiAoukufPV5sScwfHvWNmlAWj+72O0QnlWliMhpb+4WqqYqujmm2wiGDVzHcJjrLaP6cntB1brA7UsFw+iyeVpiLrdPp0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YsjZF4QWTz1JJm2;
	Tue, 11 Feb 2025 21:52:53 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id BD3FF14010D;
	Tue, 11 Feb 2025 21:54:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 11 Feb
 2025 21:54:15 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>
CC: <zbestahu@gmail.com>, <jefflexu@linux.alibaba.com>, <dhavale@google.com>,
	<linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH v2 4/4] erofs: file-backed mount supports direct io
Date: Tue, 11 Feb 2025 21:53:31 +0800
Message-ID: <20250211135331.933681-5-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211135331.933681-1-lihongbo22@huawei.com>
References: <20250211135331.933681-1-lihongbo22@huawei.com>
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

After .direct_IO is hooked, so it is easy to handle direct io in fileio
mount case.

We conduct the basic test on direct io and normal io, the fio is used in
the test, the results show it can decrease the memory overhead. It slower
than normal io in seq read due to erofs page cache and readahead, uut in
rand read direct io is similar than buffer io. The results are reasonable.

```
- buffer io
           total      used        free      shared  buff/cache   available
Mem:        54Gi     2.4Gi        52Gi        11Mi       254Mi        51Gi
Swap:      4.0Gi        0B       4.0Gi

after read

             total    used        free      shared  buff/cache   available
Mem:        54Gi     2.5Gi        50Gi        11Mi       2.3Gi        51Gi
Swap:      4.0Gi        0B       4.0Gi

cost 2GB memory (the test file is 1GB)

- direct io

           total      used        free      shared  buff/cache   available
Mem:        54Gi     2.4Gi        52Gi        11Mi       280Mi        51Gi
Swap:      4.0Gi        0B       4.0Gi

after read

           total      used        free      shared  buff/cache   available
Mem:        54Gi     2.6Gi        51Gi        11Mi       1.2Gi        51Gi
Swap:      4.0Gi        0B       4.0Gi

only cost 1GB memory (the test file is 1GB)

buffer io: 96.6k (seq read), 4245 (rand read)
direct io: 21.6k (seq read), 4187 (rand read)
```

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/erofs/data.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 0cd6b5c4df98..d58496225381 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -395,9 +395,13 @@ static ssize_t erofs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	if (IS_DAX(inode))
 		return dax_iomap_rw(iocb, to, &erofs_iomap_ops);
 #endif
-	if ((iocb->ki_flags & IOCB_DIRECT) && inode->i_sb->s_bdev)
-		return iomap_dio_rw(iocb, to, &erofs_iomap_ops,
-				    NULL, 0, NULL, 0);
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		if (inode->i_sb->s_bdev)
+			return iomap_dio_rw(iocb, to, &erofs_iomap_ops,
+					    NULL, 0, NULL, 0);
+		if (erofs_is_fileio_mode(EROFS_SB(inode->i_sb)))
+			return generic_file_read_iter(iocb, to);
+	}
 	return filemap_read(iocb, to, 0);
 }
 
-- 
2.34.1

