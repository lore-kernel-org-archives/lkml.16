Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D7849659
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751593966; cv=none; b=iL9kRPYpGeV93brtE3PPnWIxJN+s/GlcD4lkfqSw7NVt5bLVuizW38rnGfGjLdfzDOdXm+TVrGDDqMMJ7YILpouVPEcbyybzkz5ykEwokA1m4GG6ljJ+6GhqtiKYWZXtOAtdxLTWhjpyWaQJOSJlDsYr1VR/1QD+RNsJe6RP20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751593966; c=relaxed/simple;
	bh=naZ1Wb5M4QpsPJRJ/74tIV4S6gR8fo6DimjgFgewQRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEd7+YgwyiT6y0qWkixhCoBXGEJdwgTu8OXZwTo2QBmya0a6C+FOT4x3CmrKH/HZTgqI4x0miQhJ3H2HRe/JQMv/BIEzbKPu8hdIc2DzOfqcN/ovycMwJI7o75/vxOfJ6O1GiPwYeeZrx1l0lB1xtvvclOiDo0yXVAcw/xTbVcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Gn7F0Ju7; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Gn7F0Ju7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ik
	EhAVjSVURgSYmY6Bi3dWU9f3AgGAeD0rRfayq1CpA=; b=Gn7F0Ju7DgfZiRmHTd
	Qywre9m0yK9dgdQKNtmuQDCzavJeZN8rwMtpoqlL8+7BjKatbJUu9a9mjoaho130
	I2l3dJR1FNhXtYEqGbpz10dITX8hoCP8w3RLNDYoMvgVs/GkrrBCcn5y3epmVAAN
	rA3Hk6O5pHteKNA1KMxJ1uPFw=
Received: from ubuntu24-z.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB34lHUM2dopWkHAA--.1033S2;
	Fri, 04 Jul 2025 09:52:20 +0800 (CST)
From: ranxiaokai627@163.com
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com
Cc: linux-kernel@vger.kernel.org,
	ran.xiaokai@zte.com.cn
Subject: [PATCH] locking/mutex: remove redundant ifdef
Date: Fri,  4 Jul 2025 01:52:18 +0000
Message-ID: <20250704015218.359754-1-ranxiaokai627@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB34lHUM2dopWkHAA--.1033S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFyxWr18urykZw47uw18AFb_yoWkAFb_Gr
	WIvF129rWjkFs5Wrn7Ca1Fgr1Ut34xuF4IkF1vvF48Ja4kK3Z8AwnFyrySvrZ8XFZ7Wasx
	JrZ3WFZ8trsYyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1J73JUUUUU==
X-CM-SenderInfo: xudq5x5drntxqwsxqiywtou0bp/xtbBkB6ATGhnLvuPmAAAsP

From: Ran Xiaokai <ran.xiaokai@zte.com.cn>

hung_task_set/clear_blocker() is already guarded by
CONFIG_DETECT_HUNG_TASK_BLOCKER in hung_task.h, So remove
the redudant check of #ifdef.

Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
---
 kernel/locking/mutex.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index a39ecccbd106..d4210dc97b6a 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -191,9 +191,7 @@ static void
 __mutex_add_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 		   struct list_head *list)
 {
-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
 	hung_task_set_blocker(lock, BLOCKER_TYPE_MUTEX);
-#endif
 	debug_mutex_add_waiter(lock, waiter, current);
 
 	list_add_tail(&waiter->list, list);
@@ -209,9 +207,7 @@ __mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter)
 		__mutex_clear_flag(lock, MUTEX_FLAGS);
 
 	debug_mutex_remove_waiter(lock, waiter, current);
-#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
 	hung_task_clear_blocker();
-#endif
 }
 
 /*
-- 
2.25.1

