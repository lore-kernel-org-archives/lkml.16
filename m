Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA8C27BF6F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744337891; cv=none; b=ugrThvCHeKWFBjwzPBDned/4p0t1v0STXIjnvlICVHTTLd+8lWn+q5Am3uq7crRfbrFV+QEtUFnMaZyBviThSW5RgL+DRh0sj8TVH714o0iG1cNUmyGjh6g72enW0Xm0BF61uATRD6LlxIKY8JZ0pTxz5+Mqu9YHLNjidOJe+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744337891; c=relaxed/simple;
	bh=CD5/5S1yECFCux0a82qfh21clt3HqOT9UKhKnAukZek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hNBH1HzEKMXx1lMx3sKDisa46SgENrZmpQkmY/3Po44aMyMO3mugt9IqnuharRBg4h15ec5/IdQkXJ+lG2JFz5EqTMQDPuOQ4kPTcGhdknCGfKvn7ebkhkCZXc6xJ4gHMcQzQaA7HxQ0lTZVPZXwzN4U51qUmvLLtgzYMSnCAxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vGZUMMjY; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vGZUMMjY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744337880; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=BdLZmdV+hwJS8JC30tpB+FUcf/zAetbbZwWetwKbEfU=;
	b=vGZUMMjYVrMEXkRt9umlpPwu3EROvdx3g7+qYrgi0SDnlkLg1xFafVoi1e5vhl0vbxLnwyDyQBX2oAZoA21ciWePSHfCwVseILADWY8X0RMil9S2HnDs15ggwwzkDJPzp0XWIFTHUS5c9tZftWlU1R+cwDbtG1PT2IyWxuvmkqo=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WWRB-R7_1744337873 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Apr 2025 10:18:00 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: matthew.brost@intel.com
Cc: dakr@kernel.org,
	phasta@kernel.org,
	ckoenig.leichtzumerken@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/sched: Remove duplicate linux/atomic.h header
Date: Fri, 11 Apr 2025 10:17:50 +0800
Message-Id: <20250411021750.64839-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/gpu/drm/scheduler/tests/sched_tests.h: linux/atomic.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=20293
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/scheduler/tests/sched_tests.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index 27caf8285fb7..690a892ed659 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -11,7 +11,6 @@
 #include <linux/hrtimer.h>
 #include <linux/ktime.h>
 #include <linux/list.h>
-#include <linux/atomic.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 
-- 
2.32.0.3.g01195cf9f

