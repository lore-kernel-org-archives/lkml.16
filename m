Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3592628682
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747791129; cv=none; b=Gt88anscBfcVPgN3FDATsPJqIP24Ao5lwaOYMwj/Salrp9FjxNBY+VkvOBJcK/QuX62G+XzjBwFIUrYV1TspW4k+FWkHx/Yy4zRnbYl5y3rPf+X2d77AJ6MQVkZSOsq5OrGrMpcwlNO8ZrNoosp04DljgQHFGVI1YpK0tEYd6Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747791129; c=relaxed/simple;
	bh=sa0nmMui7F09VxhrE4hk+fX5oghcvqnZGgKzKGwEJH8=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=tXnm5CMAlVCEep/+rhRwtHaAIm7+yVVYNlhvBioaE3+bb88E55efKYawLMUJJQSyZP3PQBkvTyrJ0oguNfmo8YsSDnckJ3ryfN6EonEZsAc3bHUTPIxnGNlPZW9zLmtKHykmueyYF06WkNPSjswHTkEZlpsWHxizFhxvcljs+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b2DRh2wgWz51SYK;
	Wed, 21 May 2025 09:32:00 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl1.zte.com.cn with SMTP id 54L1Vumx043334;
	Wed, 21 May 2025 09:31:56 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app08[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 21 May 2025 09:31:57 +0800 (CST)
Date: Wed, 21 May 2025 09:31:57 +0800 (CST)
X-Zmail-TransId: 2b00682d2d0dffffffffcfd-3192a
X-Mailer: Zmail v1.0
Message-ID: <20250521093157668iQrhhcMjA-th5LQf4-A3c@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <yang.yang29@zte.com.cn>, <akpm@linux-foundation.org>,
        <xu.xin16@zte.com.cn>
Cc: <bbonev@devuan.org>, <linux-kernel@vger.kernel.org>,
        <bsingharora@gmail.com>, <jiang.kun2@zte.com.cn>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHQgdjNdIGRlbGF5YWNjdDogcmVtb3ZlIHJlZHVuZGFudCBjb2RlIGFuZAogYWRqdXN0IGluZGVudGF0aW9u?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54L1Vumx043334
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 682D2D10.001/4b2DRh2wgWz51SYK

From: Wang Yaxin <wang.yaxin@zte.com.cn>

remove redundant code and adjust indentation of xxx_delay_max/min

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
---
v2->v3:
https://lore.kernel.org/all/20250519223244317Gbg_lRkV5N9i15dnPMo63@zte.com.cn/
1. remove redundant code in delayacct

 include/uapi/linux/taskstats.h |  8 +++---
 kernel/delayacct.c             | 51 +++++++++++-----------------------
 2 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstats.h
index d71aa022b2ef..5929030d4e8b 100644
--- a/include/uapi/linux/taskstats.h
+++ b/include/uapi/linux/taskstats.h
@@ -225,11 +225,11 @@ struct taskstats {
 	__u64	compact_delay_max;
 	__u64	compact_delay_min;

-	__u64    wpcopy_delay_max;
-	__u64    wpcopy_delay_min;
+	__u64	wpcopy_delay_max;
+	__u64	wpcopy_delay_min;

-	__u64    irq_delay_max;
-	__u64    irq_delay_min;
+	__u64	irq_delay_max;
+	__u64	irq_delay_min;
 };


diff --git a/kernel/delayacct.c b/kernel/delayacct.c
index eb63a021ac04..30e7912ebb0d 100644
--- a/kernel/delayacct.c
+++ b/kernel/delayacct.c
@@ -14,6 +14,15 @@
 #include <linux/delayacct.h>
 #include <linux/module.h>

+#define UPDATE_DELAY(type) \
+do { \
+	d->type##_delay_max = tsk->delays->type##_delay_max; \
+	d->type##_delay_min = tsk->delays->type##_delay_min; \
+	tmp = d->type##_delay_total + tsk->delays->type##_delay; \
+	d->type##_delay_total = (tmp < d->type##_delay_total) ? 0 : tmp; \
+	d->type##_count += tsk->delays->type##_count; \
+} while (0)
+
 DEFINE_STATIC_KEY_FALSE(delayacct_key);
 int delayacct_on __read_mostly;	/* Delay accounting turned on/off */
 struct kmem_cache *delayacct_cache;
@@ -173,41 +182,13 @@ int delayacct_add_tsk(struct taskstats *d, struct task_struct *tsk)

 	/* zero XXX_total, non-zero XXX_count implies XXX stat overflowed */
 	raw_spin_lock_irqsave(&tsk->delays->lock, flags);
-	d->blkio_delay_max = tsk->delays->blkio_delay_max;
-	d->blkio_delay_min = tsk->delays->blkio_delay_min;
-	tmp = d->blkio_delay_total + tsk->delays->blkio_delay;
-	d->blkio_delay_total = (tmp < d->blkio_delay_total) ? 0 : tmp;
-	d->swapin_delay_max = tsk->delays->swapin_delay_max;
-	d->swapin_delay_min = tsk->delays->swapin_delay_min;
-	tmp = d->swapin_delay_total + tsk->delays->swapin_delay;
-	d->swapin_delay_total = (tmp < d->swapin_delay_total) ? 0 : tmp;
-	d->freepages_delay_max = tsk->delays->freepages_delay_max;
-	d->freepages_delay_min = tsk->delays->freepages_delay_min;
-	tmp = d->freepages_delay_total + tsk->delays->freepages_delay;
-	d->freepages_delay_total = (tmp < d->freepages_delay_total) ? 0 : tmp;
-	d->thrashing_delay_max = tsk->delays->thrashing_delay_max;
-	d->thrashing_delay_min = tsk->delays->thrashing_delay_min;
-	tmp = d->thrashing_delay_total + tsk->delays->thrashing_delay;
-	d->thrashing_delay_total = (tmp < d->thrashing_delay_total) ? 0 : tmp;
-	d->compact_delay_max = tsk->delays->compact_delay_max;
-	d->compact_delay_min = tsk->delays->compact_delay_min;
-	tmp = d->compact_delay_total + tsk->delays->compact_delay;
-	d->compact_delay_total = (tmp < d->compact_delay_total) ? 0 : tmp;
-	d->wpcopy_delay_max = tsk->delays->wpcopy_delay_max;
-	d->wpcopy_delay_min = tsk->delays->wpcopy_delay_min;
-	tmp = d->wpcopy_delay_total + tsk->delays->wpcopy_delay;
-	d->wpcopy_delay_total = (tmp < d->wpcopy_delay_total) ? 0 : tmp;
-	d->irq_delay_max = tsk->delays->irq_delay_max;
-	d->irq_delay_min = tsk->delays->irq_delay_min;
-	tmp = d->irq_delay_total + tsk->delays->irq_delay;
-	d->irq_delay_total = (tmp < d->irq_delay_total) ? 0 : tmp;
-	d->blkio_count += tsk->delays->blkio_count;
-	d->swapin_count += tsk->delays->swapin_count;
-	d->freepages_count += tsk->delays->freepages_count;
-	d->thrashing_count += tsk->delays->thrashing_count;
-	d->compact_count += tsk->delays->compact_count;
-	d->wpcopy_count += tsk->delays->wpcopy_count;
-	d->irq_count += tsk->delays->irq_count;
+	UPDATE_DELAY(blkio);
+	UPDATE_DELAY(swapin);
+	UPDATE_DELAY(freepages);
+	UPDATE_DELAY(thrashing);
+	UPDATE_DELAY(compact);
+	UPDATE_DELAY(wpcopy);
+	UPDATE_DELAY(irq);
 	raw_spin_unlock_irqrestore(&tsk->delays->lock, flags);

 	return 0;
-- 
2.25.1
