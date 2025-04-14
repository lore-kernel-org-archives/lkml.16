Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE81A705C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612371; cv=none; b=hDn02McR0tcKy4HhR8NtJGzVU19zi05v8Mh8D2Yxv4ET6VgQvHrd8HjzPltoE7cDNfriPcHiT5JzBiMQyipBuciiok7pcs8/w1pYJq1FdMZdqeo2dkw2YIiyBUl2Rvk9eCInI9Rn7RGXhQR/hc1eame8KoPUBo2Z8F+2bSKAzak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612371; c=relaxed/simple;
	bh=nLEN0mRQBU98GL722Rm2InfoZ9yQqHM2A2cCHIcGfuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dMw4hcPAeinTJdbIfI09mLChZKk2Ok65HwGU0XgAwYNKUxfMpglZkrSOv+lO3JF9Z6+syTcNzfVJ6YEQwv6Ma+j/N8/iigrAJsZP1+BeotEQl1/t3JDdd1GzsiHmymH/GO6FdCewjOMTICLPBqG+QVs6tGXBwrePkDWIDsf/AhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BhzCTthy; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BhzCTthy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744612365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RJYZL5y1/cpavQ/FXHXrZFP+mwIePZYZLUGgRKwzPYk=;
	b=BhzCTthyr3n5/G9dSoxdKtW5flcdSqN4H63wXyg/EOCyaHm+XFEBOxKQrEej41SePNlxiR
	43cgczI4W+mpf8GMxnajAir6QMTofeJUCHt5CUCuJPqtCQ6csipvNIIg7vFCrc1I8TBJxd
	FAAzWwi7Dph2jFp3Clb3NUTjJjWS+PY=
From: Ye Liu <ye.liu@linux.dev>
To: bsingharora@gmail.com,
	yang.yang29@zte.com.cn
Cc: linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>
Subject: [PATCH] delayacct: use macro to simplify delayacct_end calls
Date: Mon, 14 Apr 2025 14:32:27 +0800
Message-Id: <20250414063227.97035-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Replace repetitive calls to delayacct_end() with a new macro
DELAYACCT_END to reduce code duplication.
No functional changes.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 kernel/delayacct.c | 50 +++++++++++++---------------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/kernel/delayacct.c b/kernel/delayacct.c
index eb63a021ac04..3d7ca3928be2 100644
--- a/kernel/delayacct.c
+++ b/kernel/delayacct.c
@@ -18,6 +18,14 @@ DEFINE_STATIC_KEY_FALSE(delayacct_key);
 int delayacct_on __read_mostly;	/* Delay accounting turned on/off */
 struct kmem_cache *delayacct_cache;
 
+#define DELAYACCT_END(task, type) \
+	delayacct_end(&(task)->delays->lock, \
+		      &(task)->delays->type##_start, \
+		      &(task)->delays->type##_delay, \
+		      &(task)->delays->type##_count, \
+		      &(task)->delays->type##_delay_max, \
+		      &(task)->delays->type##_delay_min)
+
 static void set_delayacct(bool enabled)
 {
 	if (enabled) {
@@ -123,12 +131,7 @@ void __delayacct_blkio_start(void)
  */
 void __delayacct_blkio_end(struct task_struct *p)
 {
-	delayacct_end(&p->delays->lock,
-		      &p->delays->blkio_start,
-		      &p->delays->blkio_delay,
-		      &p->delays->blkio_count,
-		      &p->delays->blkio_delay_max,
-		      &p->delays->blkio_delay_min);
+	DELAYACCT_END(p, blkio);
 }
 
 int delayacct_add_tsk(struct taskstats *d, struct task_struct *tsk)
@@ -231,12 +234,7 @@ void __delayacct_freepages_start(void)
 
 void __delayacct_freepages_end(void)
 {
-	delayacct_end(&current->delays->lock,
-		      &current->delays->freepages_start,
-		      &current->delays->freepages_delay,
-		      &current->delays->freepages_count,
-		      &current->delays->freepages_delay_max,
-		      &current->delays->freepages_delay_min);
+	DELAYACCT_END(current, freepages);
 }
 
 void __delayacct_thrashing_start(bool *in_thrashing)
@@ -255,12 +253,7 @@ void __delayacct_thrashing_end(bool *in_thrashing)
 		return;
 
 	current->in_thrashing = 0;
-	delayacct_end(&current->delays->lock,
-		      &current->delays->thrashing_start,
-		      &current->delays->thrashing_delay,
-		      &current->delays->thrashing_count,
-		      &current->delays->thrashing_delay_max,
-		      &current->delays->thrashing_delay_min);
+	DELAYACCT_END(current, thrashing);
 }
 
 void __delayacct_swapin_start(void)
@@ -270,12 +263,7 @@ void __delayacct_swapin_start(void)
 
 void __delayacct_swapin_end(void)
 {
-	delayacct_end(&current->delays->lock,
-		      &current->delays->swapin_start,
-		      &current->delays->swapin_delay,
-		      &current->delays->swapin_count,
-		      &current->delays->swapin_delay_max,
-		      &current->delays->swapin_delay_min);
+	DELAYACCT_END(current, swapin);
 }
 
 void __delayacct_compact_start(void)
@@ -285,12 +273,7 @@ void __delayacct_compact_start(void)
 
 void __delayacct_compact_end(void)
 {
-	delayacct_end(&current->delays->lock,
-		      &current->delays->compact_start,
-		      &current->delays->compact_delay,
-		      &current->delays->compact_count,
-		      &current->delays->compact_delay_max,
-		      &current->delays->compact_delay_min);
+	DELAYACCT_END(current, compact);
 }
 
 void __delayacct_wpcopy_start(void)
@@ -300,12 +283,7 @@ void __delayacct_wpcopy_start(void)
 
 void __delayacct_wpcopy_end(void)
 {
-	delayacct_end(&current->delays->lock,
-		      &current->delays->wpcopy_start,
-		      &current->delays->wpcopy_delay,
-		      &current->delays->wpcopy_count,
-		      &current->delays->wpcopy_delay_max,
-		      &current->delays->wpcopy_delay_min);
+	DELAYACCT_END(current, wpcopy);
 }
 
 void __delayacct_irq(struct task_struct *task, u32 delta)
-- 
2.25.1

