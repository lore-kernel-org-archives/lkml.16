Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAE1E25FA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409933; cv=none; b=ABA3HT4lOrxYeW/6c6jf2iSG9xStBU92EmQhpWIfRysjZDlVSpvofU9bmI6KfzBxskIRU2dQcKknyRV8kd9MBgQR+tuO5YXHMmjLXqIJ8XGXDAV01LzXoYC9rf2m4IkiHGVT+TRJYfVc+rKBXY31KeG0CUjrTo60WjlIYauyx0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409933; c=relaxed/simple;
	bh=teJLxYycI0zXLPTmB13xMHCoEl1UawMH+6dJgIVfFEU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MijxDlHoQIqd1cxXwf0RQFLpbl+sKMCMcpItV55ZTFYGCrKUR4F0jJJaiYhoF46/+228R2MqrwjiJ0tnCl4zccyYsZPK7BZdnVgmeU935fsMCR5svZ2kPOF9/+5xN6I0/T7EtdMQa/ZL47K1+ky2ZYVuwVIUVikBd9nRraVqgiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cfL3JBdE; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cfL3JBdE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743409922; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=EySq0RpGRnjPjfZiO1DIFrP4JjQDtf0CP/IzZpcVHto=;
	b=cfL3JBdEVgtpXnXYd7X7i40hzvS7Ogz1gZlEpHaFomwWL9YWrRXa4DkLML04nXMilRilbo+G8OFqacunAYoJmWnl5RrHy4BoznPDG0/C6LPmn1p7kCAkTv5Z7tdHYdByHUU4agXZ2d5T70ZbxRSrLb9RmHzf57DbIqTlIiiDJqY=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WTVlcrf_1743409912 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 16:32:01 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: richard@nod.at
Cc: anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] um: Remove duplicate arch.h header
Date: Mon, 31 Mar 2025 16:31:50 +0800
Message-Id: <20250331083150.72598-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./arch/um/kernel/trap.c: arch.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19877
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/um/kernel/trap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index ce073150dc20..39820bde49e6 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -16,7 +16,6 @@
 #include <kern_util.h>
 #include <os.h>
 #include <skas.h>
-#include <arch.h>
 
 /*
  * Note this is constrained to return 0, -EFAULT, -EACCES, -ENOMEM by
-- 
2.32.0.3.g01195cf9f

