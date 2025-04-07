Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAA422154E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022756; cv=none; b=H2PnG87k7VqtEMqU4ziP14pdG+OJCHrMuwlqJAyih8uV2vTi0c5PEL1wyQq86CW82JWRsufsR8LGLRoOWirlqmdrhOe9LKuiyXJOjOUxzFrYgXkMDa4flqQX1n4FZn6VilwKk/3kalnfaU+z08qn7LbD9Ud/jK+M8WNsL+WPITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022756; c=relaxed/simple;
	bh=0WsTxfKgBn2Fxbs/Iu9xwBYHLwxUtl0do/GjGIjRm7g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qQMLIGifcVSerzhvGJy72p1rlwsCMr7v3Fxvw3zBAIeAEdod+dDV1O6iHmDdJhDg13Ce8SgWDAjnsFsNNYxixKxkFVlANDWaBp0xo5NxHMQ7DgoGkiPHAsdK0lD6+CC+8b+YvmlKQSTnhYQcQrEFPsxdUJ5IG/+7EO7PZT6nT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hTsvqKF9; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hTsvqKF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KmG6p
	1xV+apQErcjVNyl7l7EgSjrZ9GSAY/E01bksuw=; b=hTsvqKF9mxaXqdV3xFoft
	uTu6Kh1UwA5DFVpOL0oi6CE9kLYpm2LMUJ4dS/i+U1lDMoVYmREcsM6pZH8PqfPV
	3z1zM7NgZPXeOgDDq+7RpxR+5/Hm/CO4JL5O5oXRe4mqgfM4xo9j7CGzHmCD6slr
	KD1S4ic6ohgW2K8RR/cxpU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDHuTk7qfNns8RHEg--.10758S2;
	Mon, 07 Apr 2025 18:30:20 +0800 (CST)
From: 18810879172@163.com
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	wangxuewen <wangxuewen@kylinos.cn>
Subject: [PATCH] mm/hugetlb: Add a line break at the end of the format string
Date: Mon,  7 Apr 2025 18:30:17 +0800
Message-Id: <20250407103017.2979821-1-18810879172@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHuTk7qfNns8RHEg--.10758S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur47Ww48KFy8Ar4fJry3CFg_yoWxCwc_Wr
	y5Kw1ktr1UWw1a9F42kws3t3W8K39a9Fs3XrWxCFy3tayjqa18CayUWr4j9w4a9FW8WFnx
	urnxu34UCr15KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU88pnPUUUUU==
X-CM-SenderInfo: rprymiyqyxmiixs6il2tof0z/1tbiShwo9WfzpDWp5wAAsA

From: wangxuewen <wangxuewen@kylinos.cn>

Missing line break at the end of the format string.

Signed-off-by: wangxuewen <wangxuewen@kylinos.cn>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 39f92aad7bd1..3e0d361fd299 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4630,7 +4630,7 @@ static void __init hugetlb_sysfs_init(void)
 		err = hugetlb_sysfs_add_hstate(h, hugepages_kobj,
 					 hstate_kobjs, &hstate_attr_group);
 		if (err)
-			pr_err("HugeTLB: Unable to add hstate %s", h->name);
+			pr_err("HugeTLB: Unable to add hstate %s\n", h->name);
 	}
 
 #ifdef CONFIG_NUMA
-- 
2.34.1

