Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12A13085D5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303735; cv=none; b=dpdE5e01vnJ2Y488rUqnRmudhuAEGdz4v6Oedub4M1CjIa4B9Xvzc1tF/MNllwlRDHml5VSGSsSuSkYdQ/yOVMfCzQMZXkVJuWpYXkxkDk7rDCXWVc6OFAd61h/B7JMUmsCqD3/5UA5NtyEyfVznImlEf3N23fvMepZLFFMdPWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303735; c=relaxed/simple;
	bh=vClzqtkDF9WhvsO4Rd7kzELqTG+56HOEa3ir7Hzp3Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgYzH76UO0LGtVqSHpi87y5TN8w0NaYk4nWEg3dmSlv7/T9OwtveJTItxme9pB/3qKotS24ChpfEGBe/8xLnKNkMc5hC2PIDhqcSn9DKrHQxobD+p/B5nQ+roPZQkFD9QHYZn7jv/EiNErhQm8+GVqgUp4h5wNcFh12PXaH9uxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=x1W8JfQv; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="x1W8JfQv"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750303725; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=O8Rp7wzUVaBQXbrLptrr+W6uUV9/YYR6SXF+ORLk/V0=;
	b=x1W8JfQvoAT5zN67uuZ7ROwdH+CbgtVFr6RBr4izvB9KpQx9yoVYOv3x5nGrY2M5+mN24ZbamgMZSkf6SJD1ys1IEjwQ4Nv5k32vHdGEiA8sWhi1l00lNr4O0+Y7vROBOQK4a36mz0h/bA2L8vy04hLoOBdweO4InIOIZCquqec=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WeFn9H3_1750303720 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Jun 2025 11:28:44 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Subject: [PATCH] erofs: refuse crafted out-of-file-range encoded extents
Date: Thu, 19 Jun 2025 11:28:39 +0800
Message-ID: <20250619032839.2642193-1-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <684cb499.a00a0220.c6bd7.0010.GAE@google.com>
References: <684cb499.a00a0220.c6bd7.0010.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crafted encoded extents could record out-of-range `lstart`, which should
not happen in normal cases.

It caused an iomap_iter_done() complaint [1] reported by syzbot.

[1] https://lore.kernel.org/r/684cb499.a00a0220.c6bd7.0010.GAE@google.com
Fixes: 1d191b4ca51d ("erofs: implement encoded extent metadata")
Reported-by: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d8f000c609f05f52d9b5
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/zmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 14ea47f954f5..6afcb054780d 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -597,6 +597,10 @@ static int z_erofs_map_blocks_ext(struct inode *inode,
 
 			if (la > map->m_la) {
 				r = mid;
+				if (la > lend) {
+					DBG_BUGON(1);
+					return -EFSCORRUPTED;
+				}
 				lend = la;
 			} else {
 				l = mid + 1;
-- 
2.43.5

