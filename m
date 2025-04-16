Received: from out30-74.freemail.mail.aliyun.com (out30-74.freemail.mail.aliyun.com [115.124.30.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84132356C1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796570; cv=none; b=SHR8c4hzfqT6L9nYHl7Jbsfm1gEHsE0MlhOf4Dhe5nYsyvf3anKkHfO2+1IgsYSh1HnbDudJ3yfak00AwXV729On8LIR0jUNl7/TLdU5XZdN4sz2tTvwFCax1Q430+kiHFERhOSoJKepFgEq050nsfZlkuCnJZbwK0EOWtDoCVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796570; c=relaxed/simple;
	bh=cIxR7mlL4f7IcMYxI4wejilqLoq5spt4Y9IgqlFlcfI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HlyCp1bCAV6L02By3gNZmDQ3j3teVHDMClnKbEcGBZN3qeBu6oMBx3x5QY/EgR54e36PcT9m3TiWu0qbE9U1FXbfFGULPFQVpNmQJYC6h582nsS3+lPVmdyArq9/rz6XamQs6s50azeX4K4zYjdRuOs/yxJNCRmZTH2g/8lr80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliyun.com; spf=pass smtp.mailfrom=aliyun.com; dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b=AmipTCNq; arc=none smtp.client-ip=115.124.30.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliyun.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliyun.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b="AmipTCNq"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aliyun.com; s=s1024;
	t=1744796566; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=8mIO6PvtKTK7TNYX/aaB7cMx6KDyExUJbOx7yKzWTFQ=;
	b=AmipTCNqy6e/odsdkFuf5fc4wD8wUn7M7pprdhDSV7dx5ZsSVRJXDtUiLpKb+elsqO4OQ12yMMlQyMYip++pwqaHyNxbHoyx5ic+q9cfsri6HJNmfky3y5B31igl5voV+SNYNcRAnWei63a0hKg5V/sb/kbn7oIwzO6ORK25AiI=
Received: from wdhh6.sugon.cn(mailfrom:wdhh6@aliyun.com fp:SMTPD_---0WX8aFjt_1744796565 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Apr 2025 17:42:45 +0800
From: Chaohai Chen <wdhh6@aliyun.com>
To: agruenba@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaohai Chen <wdhh6@aliyun.com>
Subject: [PATCH] fs: gfs: Delete duplicate function generic_update_time calls
Date: Wed, 16 Apr 2025 17:42:40 +0800
Message-Id: <20250416094240.206847-1-wdhh6@aliyun.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

generic_update_time is called by inode_update_time after
processing gfs2_update_time function, gfs2_update_time do not
need call the generic_update_time again.

Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
---
 fs/gfs2/inode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 6fbbaaad1cd0..05fc363bd6e7 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -2171,7 +2171,6 @@ static int gfs2_update_time(struct inode *inode, int flags)
 		if (error)
 			return error;
 	}
-	generic_update_time(inode, flags);
 	return 0;
 }
 
-- 
2.34.1

