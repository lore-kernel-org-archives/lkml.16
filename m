Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5183FD1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750810455; cv=none; b=gAKc6JdQ0bQZYuaR1eA70nfb/WZsSqgDo/VpN60VyMH8aH0cn1GSUUxr7WXnvhQV52u2cJG/WbUAhXm9c73YFOtwCCdgoisQpHjuXB0MEyqZT8UeycCjki4UfAZRm2TEoj9x6d02UjnkCz7bMJO1v7pRvaO/bgOCWrUeD56YWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750810455; c=relaxed/simple;
	bh=I5hT9bSgM768qYEaX8cM5IKm62/bwzl9Nbnq/XIq7yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkSIwfKP2+n2ZNbScc0bTub9vAiuluvUWv6eRSPQSgSVHb223CznMMj79lJpxncJtZ/zMmMhhOCS5YDm5sj4NawRHDcMWhYHNdwhTCYHnZqB2d4m1C0Yc9uuzjrav7SFru7NvYAh04FhWx+8LzaIxjZUJLvjXS7btL0tJCs8JYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-9e-685b3f52cc9f
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH] f2fs: fix to check upper boundary for value of gc_boost_zoned_gc_percent
Date: Wed, 25 Jun 2025 09:14:07 +0900
Message-ID: <20250625001408.1961-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LhesuzUDfYPjrD4PUFZovTU88yWTxZP4vZ
	4tIid4vLu+awObB4bFrVyeaxe8FnJo/Pm+QCmKO4bFJSczLLUov07RK4Mq6t3sNcsJ214s9K
	9gbGLSxdjJwcEgImErd6HjDD2LP2NbGD2GwCGhJ/envB4iICmhJHOmcCxbk4mAXaGCXajzax
	djFycAgLREocfFgMUsMioCpxb+tSsJm8AmYSy/c9Z4eYqSmx48t5Joi4oMTJmU/AapgF5CWa
	t86G2nuXVeLkRU8IW1Li4IobLBMYeWchaZmFpGUBI9MqRpHMvLLcxMwcY73i7IzKvMwKveT8
	3E2MwFBaVvsncgfjtwvBhxgFOBiVeHgNWqMyhFgTy4orcw8xSnAwK4nwTjMHCvGmJFZWpRbl
	xxeV5qQWH2KU5mBREuc1+laeIiSQnliSmp2aWpBaBJNl4uCUamAsnKga0Veye9JW61kFr2x3
	5lvPaN3L4Lfo9pxi06Q5Jt0pGjpvi+0XpfUW7YhnCQs1nPJh45ciu4v6EgZ3/p253n6mNYLJ
	kdH+cKPr85DGI6uEGu3d1cusLCOZLDJS9czsamI/1Uw4FFnU5WGaPHVBvlv6Q5V75iomll1l
	S1LMrGq+8jbOUmIpzkg01GIuKk4EAAOOVCAhAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBJMWRmVeSWpSXmKPExsXCNUNljm6QfXSGwaFpVhanp55lsniyfhaz
	xaVF7haXd81hs5gw9yqTxfut9xgd2Dw2repk89i94DOTx7fbHh6fN8kFsERx2aSk5mSWpRbp
	2yVwZVxbvYe5YDtrxZ+V7A2MW1i6GDk5JARMJGbta2IHsdkENCT+9PYyg9giApoSRzpnAsW5
	OJgF2hgl2o82sXYxcnAIC0RKHHxYDFLDIqAqcW/rUrA5vAJmEsv3PWeHmKkpsePLeSaIuKDE
	yZlPwGqYBeQlmrfOZp7AyDULSWoWktQCRqZVjCKZeWW5iZk5ZnrF2RmVeZkVesn5uZsYgeGx
	rPbPpB2M3y67H2IU4GBU4uGNWBGVIcSaWFZcmXuIUYKDWUmEd5o5UIg3JbGyKrUoP76oNCe1
	+BCjNAeLkjivV3hqgpBAemJJanZqakFqEUyWiYNTChggN7J4FvqcjBWK2D+lP6wtSLfNf8Xu
	J6JGs2UOr1r2UmKr65uegzYVIWdyxO+p3l5RmsdkxrL/2QO3uYdL2msmH5i0Tej4g6niOsK3
	7hRkb/4vxxuSPH9C8+ZjFutVXYXmGTtPmPTgV9Xn/f/fLY85KhRjVpiw75k569bpsxYZ3WtJ
	rU/+6H5SiaU4I9FQi7moOBEABodZnwsCAAA=
X-CFilter-Loop: Reflected

to check the upper boundary when setting gc_boost_zoned_gc_percent

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/sysfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 51be7ffb38c5..2b5c35ce7b8c 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -628,6 +628,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
-- 
2.33.0

