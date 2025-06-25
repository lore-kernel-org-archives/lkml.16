Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C127C7F9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750810433; cv=none; b=NDYRJcYLVUBvQYUOl2klYdN2lUxSmRqQ+/F3rQNqkDgoePZ5Z7tg8vHAQfDrUnFzGSSfPtskQZnz76bTLntGe4o44ccpLvKleFUM/xb0CpG7BMkT5dbK9MCI3MDKQGfDt9dqoRhHSG+aZ0Da7K6MDBRTWUsM+0PXfQrl2AKCVok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750810433; c=relaxed/simple;
	bh=NEQM9xuqMINt671Yit5PJJpVCuKBuDsqTDV8sdTXOuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l6ZeZ7Axmx2/cisaSNfqJ5ejFAgo6Z1QlKcpXhGag0NVg1AqXgnCsSXmbcAQIUbM6V2CVlvTAvzChNqDd5geyca1rcI/c8ayTMQlpIJcuvyw3tVUyRo2kOLenR/pME0xt5B+Tb5pgr2eN0ehrB6VAbtfXuxOIiZQIJ+/9Ptjj2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-03-685b3f33380d
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v4] f2fs: enable tuning of boost_zoned_gc_percent via sysfs
Date: Wed, 25 Jun 2025 09:13:35 +0900
Message-ID: <20250625001336.1937-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprILMWRmVeSWpSXmKPExsXC9ZZnka6xfXSGQe9EDovTU88yWTxZP4vZ
	4tIid4vLu+awObB4bFrVyeaxe8FnJo/Pm+QCmKO4bFJSczLLUov07RK4MlpOXWUvuMNacfvm
	R8YGxncsXYycHBICJhI/Fm1lgrEbr31nBbHZBDQk/vT2MoPYIgKaEkc6Z7J3MXJxMAu0MUq0
	H20CKxIW8JZ4f+0rI4jNIqAqMXnlcTYQm1fATOJJ012oBZoSO76cZ4KIC0qcnPkELM4sIC/R
	vHU2M8hQCYG7rBK/D61hhmiQlDi44gbLBEbeWUh6ZiHpWcDItIpRJDOvLDcxM8dYrzg7ozIv
	s0IvOT93EyMwoJbV/oncwfjtQvAhRgEORiUeXoPWqAwh1sSy4srcQ4wSHMxKIrzTzIFCvCmJ
	lVWpRfnxRaU5qcWHGKU5WJTEeY2+lacICaQnlqRmp6YWpBbBZJk4OKUaGC2aMn9NmFRczbtA
	ca5ZtUJL+bndjYz77HZOcT7zv6n+5NUZVdf5t+1b3sDnfTrYn6uxN7b6TdfEhuaVH3TcQvJK
	6j3CnziruPps7jrnO+nmgkUmZ9PLxTZnWzx0O1ipaOLi433+uJf1/jYt71aNz3xv49pnTP1Y
	UFLHnRx+/uaiEuPJB1dEKLEUZyQaajEXFScCAIhC9pMkAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFJMWRmVeSWpSXmKPExsXCNUNljq6RfXSGwY7P1hanp55lsniyfhaz
	xaVF7haXd81hs5gw9yqTxfut9xgd2Dw2repk89i94DOTx7fbHh6fN8kFsERx2aSk5mSWpRbp
	2yVwZbScuspecIe14vbNj4wNjO9Yuhg5OSQETCQar31nBbHZBDQk/vT2MoPYIgKaEkc6Z7J3
	MXJxMAu0MUq0H20CKxIW8JZ4f+0rI4jNIqAqMXnlcTYQm1fATOJJ012ooZoSO76cZ4KIC0qc
	nPkELM4sIC/RvHU28wRGrllIUrOQpBYwMq1iFMnMK8tNzMwx0yvOzqjMy6zQS87P3cQIDJFl
	tX8m7WD8dtn9EKMAB6MSD2/EiqgMIdbEsuLK3EOMEhzMSiK808yBQrwpiZVVqUX58UWlOanF
	hxilOViUxHm9wlMThATSE0tSs1NTC1KLYLJMHJxSDYyTbsUXem5c8KPV6xPbr56I+4tSr6UV
	mkrNXLtJLejJpUZ1P7u2aZP7Zkey3DjKMsPgeotRUff+IO5y9/43hy8d1VLnPdV322r7sVdp
	jSvK3ELqhM7MK3CW/1e14Z0Xy9lVCunvrW13Cf5ILtyQFBe8LUnPeYqK+CFfK8v3XT+fJjzZ
	udjiMrsSS3FGoqEWc1FxIgDXfW8GDQIAAA==
X-CFilter-Loop: Reflected

to allow users to dynamically tune
the boost_zoned_gc_percent parameter

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/gc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..11fba7636af7 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -194,6 +194,7 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
-		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
+		return !has_enough_free_blocks(sbi,
+				sbi->gc_thread->boost_zoned_gc_percent);
 	return has_enough_invalid_blocks(sbi);
 }
-- 
2.33.0

