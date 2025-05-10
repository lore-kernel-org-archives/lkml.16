Received: from mxde.zte.com.cn (mxde.zte.com.cn [209.9.37.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5331E5B8E
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.9.37.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863676; cv=none; b=AQLDbNYiEK9qPeFr+x9scNvZX0w6QD+t5t4wQM082Up7OdG/bGkhZ6AzTDgd2syAvEG35uKBjQQ4tM8t8qDA/NmKvEkudGrKU26w1CupHEn75wPlz4IyE7illDTYN9N6jAzdLtxdIJjnsrb762SAfX0ZR1a3ne8H79zH+KH+EIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863676; c=relaxed/simple;
	bh=6b+vaPueMRajE3Tuy1r6/D5913dB3IboB/1OEJgWe2U=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=c/Moy8O4pWO6B3X8ZBrXypMeM1glNB+m9vh2XKlSZAT54SCoLtnRwd5+aW1NljOOJfqwVoUzqOJNh1TChuTFDkttLcM6+wlGAiZCfp+g6yEckR5+y1Oy0tD1SDp/pvmtGyg1TVJ3Hp+Z/OeUooEN8k+mQW9befwhoiiR24D8UjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=209.9.37.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZvdS05y3zzBRHKJ
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 15:54:24 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZvdRr3gNRz5B1KS;
	Sat, 10 May 2025 15:54:16 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl2.zte.com.cn with SMTP id 54A7sBao093307;
	Sat, 10 May 2025 15:54:11 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Sat, 10 May 2025 15:54:13 +0800 (CST)
Date: Sat, 10 May 2025 15:54:13 +0800 (CST)
X-Zmail-TransId: 2aff681f06255ed-230ed
X-Mailer: Zmail v1.0
Message-ID: <20250510155413259V4JNRXxukdDgzsaL0Fo6a@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <bbonev@devuan.org>, <linux-kernel@vger.kernel.org>
Cc: <bsingharora@gmail.com>, <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>,
        <jiang.kun2@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <akpm@linux-foundation.org>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHRdIHRhc2tzdGF0czogZml4IHN0cnVjdCB0YXNrc3RhdHMgYnJlYWtzIGJhY2t3YXJkCiBjb21wYXRpYmlsaXR5IHNpbmNlIHZlcnNpb24gMTU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 54A7sBao093307
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 681F062F.001/4ZvdS05y3zzBRHKJ

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Problem
========
commit 658eb5ab916d ("delayacct: add delay max to record
 delay peak") - adding more fields
commit f65c64f311ee ("delayacct: add delay min to record
 delay peak") - adding more fields
commit b016d0873777 ("taskstats: modify taskstats version")
 - version bump to 15

Since version 15 (TASKSTATS_VERSION=15) the new layout of the
structure adds fields in the middle of the structure, rendering
all old software incompatible with newer kernels and software
compiled against the new kernel headers incompatible with older
kernels.

Solution
=========
move delay max and delay min to the end of taskstat, and bump
the version to 16 after the change

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
Signed-off-by: Kun Jiang <jiang.kun2@zte.com.cn>
---
 include/uapi/linux/taskstats.h | 43 +++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)
diff --git a/include/uapi/linux/taskstats.h b/include/uapi/linux/taskstats.h
index 95762232e018..d71aa022b2ef 100644
--- a/include/uapi/linux/taskstats.h
+++ b/include/uapi/linux/taskstats.h
@@ -34,7 +34,7 @@
  */


-#define TASKSTATS_VERSION	15
+#define TASKSTATS_VERSION	16
 #define TS_COMM_LEN		32	/* should be >= TASK_COMM_LEN
 					 * in linux/sched.h */

@@ -72,8 +72,6 @@ struct taskstats {
 	 */
 	__u64	cpu_count __attribute__((aligned(8)));
 	__u64	cpu_delay_total;
-	__u64	cpu_delay_max;
-	__u64	cpu_delay_min;

 	/* Following four fields atomically updated using task->delays->lock */

@@ -82,14 +80,10 @@ struct taskstats {
 	 */
 	__u64	blkio_count;
 	__u64	blkio_delay_total;
-	__u64	blkio_delay_max;
-	__u64	blkio_delay_min;

 	/* Delay waiting for page fault I/O (swap in only) */
 	__u64	swapin_count;
 	__u64	swapin_delay_total;
-	__u64	swapin_delay_max;
-	__u64	swapin_delay_min;

 	/* cpu "wall-clock" running time
 	 * On some architectures, value will adjust for cpu time stolen
@@ -172,14 +166,11 @@ struct taskstats {
 	/* Delay waiting for memory reclaim */
 	__u64	freepages_count;
 	__u64	freepages_delay_total;
-	__u64	freepages_delay_max;
-	__u64	freepages_delay_min;
+

 	/* Delay waiting for thrashing page */
 	__u64	thrashing_count;
 	__u64	thrashing_delay_total;
-	__u64	thrashing_delay_max;
-	__u64	thrashing_delay_min;

 	/* v10: 64-bit btime to avoid overflow */
 	__u64	ac_btime64;		/* 64-bit begin time */
@@ -187,8 +178,6 @@ struct taskstats {
 	/* v11: Delay waiting for memory compact */
 	__u64	compact_count;
 	__u64	compact_delay_total;
-	__u64	compact_delay_max;
-	__u64	compact_delay_min;

 	/* v12 begin */
 	__u32   ac_tgid;	/* thread group ID */
@@ -210,15 +199,37 @@ struct taskstats {
 	/* v13: Delay waiting for write-protect copy */
 	__u64    wpcopy_count;
 	__u64    wpcopy_delay_total;
-	__u64    wpcopy_delay_max;
-	__u64    wpcopy_delay_min;

 	/* v14: Delay waiting for IRQ/SOFTIRQ */
 	__u64    irq_count;
 	__u64    irq_delay_total;
+
+	/* v15: add Delay max and Delay min */
+
+	/* v16: move Delay max and Delay min to the end of taskstat */
+	__u64	cpu_delay_max;
+	__u64	cpu_delay_min;
+
+	__u64	blkio_delay_max;
+	__u64	blkio_delay_min;
+
+	__u64	swapin_delay_max;
+	__u64	swapin_delay_min;
+
+	__u64	freepages_delay_max;
+	__u64	freepages_delay_min;
+
+	__u64	thrashing_delay_max;
+	__u64	thrashing_delay_min;
+
+	__u64	compact_delay_max;
+	__u64	compact_delay_min;
+
+	__u64    wpcopy_delay_max;
+	__u64    wpcopy_delay_min;
+
 	__u64    irq_delay_max;
 	__u64    irq_delay_min;
-	/* v15: add Delay max */
 };


-- 
2.25.1
