Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1C21CEADB
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608644; cv=none; b=d/EQoz6rmMH0QgID8cLJqPoN2LWDySw0oyMjUkva7UfrcDg7Hx45sd+OW/AJQN50Q7b6RA/CtyV3fTEnAIxgNsEyhem9lSd6Cjl68ysA/zpn2/R0m3Vjnq6EmKMXhciyqCK3lJma7EzpYeDhPFmPMf1kRwP5KL1iG/3e8ZWQLxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608644; c=relaxed/simple;
	bh=YYkciApprTBW61Xe2c/9f1R4usCCh7pTaYq7TehA6mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fiSVqHBsGS2viezsruFeMWJ0weiSITOo2ZAmOGD8vPpCW+qD3htn5udWOCvpQIbF2B427MYcATtCWYrHq/6Vc88/f8z7Hz1CQbaLwKoEttQBqBX+Fs29KTbWD/vd4OMNUxIJMx+wSHk1JNo3Gl1pZbsnOYdT9LALZQakG0p8d8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMYmab5X; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMYmab5X"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-b26f5cd984cso2029256a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747608642; x=1748213442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tifdmFQDJps1lChYSd+EGnHuJQb6A1Xc67Aae2G0Ozs=;
        b=cMYmab5Xdd/Adbgznhw8YIFsURPpQzQD/OJMIMKh9OvtAI2GXbNX1ckA1+sr9XQ1cY
         QoSo478EMqTZWznVqekKd5GRee80A2sLD6+m+dJRPT2iyiUJf73e2kCjIprO0WGYNXl6
         An8Ar8s8TKWIcfvrBnvFnIk3JvRivMAwJElqyjMpN8tMqS3oaj2HZK9nqLEKDXWmPyfZ
         tyB/nBifYGOgbk9P/TMJo1tPiTU3nu44PFwUlW4d767J96v/2dvRiGcvdiHLqioVPstV
         W/3f1R3WsGvfmUaBsWq6iaqT07zHbA/3Qxv3ZJixDCpqkatjpmwKrRsSLsyn4TOwCJDz
         SiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747608642; x=1748213442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tifdmFQDJps1lChYSd+EGnHuJQb6A1Xc67Aae2G0Ozs=;
        b=mTpJWGjF/MTvQRvliep92YFD9MgB6MPGgDFUSypJU6oP2MoDxpCshsLSgOtiv5uWHs
         a0HeceuH9HzQTAal+GXAuO2YSd/qrLsRS0KJaYePzv3oFkVBj1YIdq7rOyRyPfBwHbYW
         U3rSlDB4DOzJyIK1o9uWtY038qtvyZQGlpSVmYmLdJF2/XCRQuQzJPhDCAKtsleuqIxr
         W7wFW68TiOJ79cBPMEP1fgnPi+lr+ff2Dx/w1Im2bJmux0OkxfCeJ18dk49VSdAR6KOI
         NesE7Xlud+Lq3nZW6UaKGmSws4Jl4y1qdnaodVsN4oJl7kPSfu6GTVn0ZIcQ/rSfBcm4
         W4ng==
X-Forwarded-Encrypted: i=1; AJvYcCUD2GmNDXdaa8KGvqghGsDTML/b5iLKSIr7JKpGBppjb4mzSLu3pcqZ+EGiwnoG6iG0cuenI+iY33syhmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOgPGL7Ccp7PBc5vjkwfNuY034CTsmZNjqQycp06xqUc69q9Q
	PLM8uRxDbNqkVoMcS+RgBMm7/m3K/odUYTp8D4fWvse2Df5OO/0647Ax
X-Gm-Gg: ASbGncszGcesu2iXnvbYny5WCsvbmNkbMxxRq3/ST9riDc/O3RZaK2qfl7cevRh6bYo
	rdj8u8feXmTCkjQ+GGgVL7Ajz0JTjCQTqJXxsULY3MyUk/lkyyVnNdPJGukKsLEejnRY2BoE0Zz
	8qNdfOAHcLlNbjIBJjV8NADehrSOnZ4kg2C7KLM1fpZOSYY8n11M+u/BpDjJzd3SZ27h7YDUBts
	hFZd4iAYyH4KHV98I5187glkxKOM0dlj/BMQeq4naQ/v0mG8TcjJ01qoRNSKxwnmdm5XqVkw9qO
	VyGYfqImv78LAQ4O4utx9ZboyrXQKvHagj2q8qjBq0DkZ8ERdknniSuzBZJTZrU8NYfNPkw=
X-Google-Smtp-Source: AGHT+IFDVyQnFmoqqGPJkqxSu2Pdvvb212In1H9P8PzfsGFz4fbsCW0TSpcfHw5lbipt/B2UA9BEsQ==
X-Received: by 2002:a17:902:d4c2:b0:232:11e7:47bb with SMTP id d9443c01a7336-23211e75f95mr71816695ad.43.1747608641831;
        Sun, 18 May 2025 15:50:41 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.228.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb157sm47616605ad.176.2025.05.18.15.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 15:50:41 -0700 (PDT)
From: Siddarth Gundu <siddarthsgml@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	elder@ieee.org,
	Siddarth Gundu <siddarthsgml@gmail.com>
Subject: [PATCH v2] rbd: replace strcpy() with strscpy()
Date: Mon, 19 May 2025 04:20:35 +0530
Message-ID: <20250518225035.227880-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() is deprecated; use strscpy() instead.

Both the destination and source buffer are of fixed length
so strscpy with 2-arguments is used.

Introduce a typedef for cookie array to improve code clarity.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
---
changes since v1
- added a typedef for cookie arrays

About the typedef: I was a bit hesitant to add it since the kernel
style guide is against adding new typedef but I wanted to follow 
the review feedback for this.

 drivers/block/rbd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index faafd7ff43d6..863d9c591aa5 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -46,11 +46,14 @@
 #include <linux/slab.h>
 #include <linux/idr.h>
 #include <linux/workqueue.h>
+#include <linux/string.h>
 
 #include "rbd_types.h"
 
 #define RBD_DEBUG	/* Activate rbd_assert() calls */
 
+typedef char rbd_cookie_t[32];
+
 /*
  * Increment the given counter and return its updated value.
  * If the counter is already 0 it will not be incremented.
@@ -411,7 +414,7 @@ struct rbd_device {
 
 	struct rw_semaphore	lock_rwsem;
 	enum rbd_lock_state	lock_state;
-	char			lock_cookie[32];
+	rbd_cookie_t		lock_cookie;
 	struct rbd_client_id	owner_cid;
 	struct work_struct	acquired_lock_work;
 	struct work_struct	released_lock_work;
@@ -3649,12 +3652,12 @@ static void format_lock_cookie(struct rbd_device *rbd_dev, char *buf)
 	mutex_unlock(&rbd_dev->watch_mutex);
 }
 
-static void __rbd_lock(struct rbd_device *rbd_dev, const char *cookie)
+static void __rbd_lock(struct rbd_device *rbd_dev, const rbd_cookie_t cookie)
 {
 	struct rbd_client_id cid = rbd_get_cid(rbd_dev);
 
 	rbd_dev->lock_state = RBD_LOCK_STATE_LOCKED;
-	strcpy(rbd_dev->lock_cookie, cookie);
+	strscpy(rbd_dev->lock_cookie, cookie);
 	rbd_set_owner_cid(rbd_dev, &cid);
 	queue_work(rbd_dev->task_wq, &rbd_dev->acquired_lock_work);
 }
@@ -3665,7 +3668,7 @@ static void __rbd_lock(struct rbd_device *rbd_dev, const char *cookie)
 static int rbd_lock(struct rbd_device *rbd_dev)
 {
 	struct ceph_osd_client *osdc = &rbd_dev->rbd_client->client->osdc;
-	char cookie[32];
+	rbd_cookie_t cookie;
 	int ret;
 
 	WARN_ON(__rbd_is_lock_owner(rbd_dev) ||
@@ -4581,7 +4584,7 @@ static void rbd_unregister_watch(struct rbd_device *rbd_dev)
 static void rbd_reacquire_lock(struct rbd_device *rbd_dev)
 {
 	struct ceph_osd_client *osdc = &rbd_dev->rbd_client->client->osdc;
-	char cookie[32];
+	rbd_cookie_t cookie;
 	int ret;
 
 	if (!rbd_quiesce_lock(rbd_dev))
-- 
2.43.0

