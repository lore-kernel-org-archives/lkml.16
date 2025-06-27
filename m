Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9F33F6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751008734; cv=none; b=U7fBE87+3ACfJMemUvgdivPgs5DR3h9tWhFVRqoMtpRRjPPIbwNC1D2V6dZgJv4C89HEUY/eaq9ZPK7ExBKuzJgB+9rkA3H/mQ/UoY7kvEYePYsFl3Wmz9S7A0giJ0E428uX1HGl07JLjJxRsGcJaNHkjLxcb4zqEOwCNmJoNQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751008734; c=relaxed/simple;
	bh=s0MKz0LYCUSl+PREsipx69b8MkTSre17kmQ/gXk2iMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsnABAeA5bIE1YyJwmYnjRisxQDOoLWyERwV9Rjvm8+RC17uPVxoXut+felOfoiIiODfmxf8/fcppgEH+jmpcM++dj61qOUvOK+tzicCs19Am/szikNR3QUVAOcRswcidwnkEbxDJKgjWQMtE3cWKu8QDkTQlwAuVIMvHVWu5Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WK1Ktqc1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WK1Ktqc1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-236377f00easo24451985ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751008732; x=1751613532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB+J0JTiaeKcpjtbE/NJOgrsuv9/ekzaPkYkdAHom5w=;
        b=WK1Ktqc1LhT832huhg+VSXhfAXseGg++wsouBjz8FdjZhsQN54Vs8af0FTDoBde9B3
         /xEjAYSjCLhafeJmmdtWstN14sLWs5BxrFhE+pql10Gr/EXF04jPc2656vmY3DpbTra7
         SiChav3ZQUVkmBsGiYczLTHgG7BMmGGW6kMKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751008732; x=1751613532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EB+J0JTiaeKcpjtbE/NJOgrsuv9/ekzaPkYkdAHom5w=;
        b=hDqZPktMkhPm1NB5AW1dXkDECcIYu6KFs9I/9d/pnMVeQhKr9JXGVMqY9Gq9eXULr7
         TapH/YLzJj7qtEu0RqBJhEYLImis01OV3zgB/H6fN+WeiUrIkx9CgNtuOL+U9qplZBdp
         vT+DQ+/RLrQsC/F/gC02XnQkG59lmADva7jDm6RI5M6j7WJ3W2ec7LHzIz91DXJFvyoF
         4BldK76OLTKY80gZg7kPXmlKYJ3zOFJhARtqNuWrk4X/GosbySBgKhEfiXtxA18izRTR
         ngM89rm0txxiXJVjFyYQ5eMPUgFp7xMbT8iJfZ2lJdf8Pu5q2d7CW7NEtx3e0XUQrIl8
         pw8g==
X-Forwarded-Encrypted: i=1; AJvYcCUNXzG5fR3pgGl5nmOqF3ZNhPCR4FCeDEeYmPXeqLlBk0vRLjmqjT6dcORg8y1+i/fzx4hz1tkiZzIjev4=@vger.kernel.org
X-Gm-Message-State: AOJu0YykU7IucbYzmclVcp1jT0zRLSk1OxdY4WNXognAg0g+XM1RPA+J
	lOvCkDYC81zxofqicjWa1NRXJfmlMG1p2UQM0+HPnBCCXHQJVdMm5atk0OC7Uv72zg==
X-Gm-Gg: ASbGncs0BfRIieoCSTfJzVfJLIk9R8ldyiH7kmyd3WYGGVs6/U4Npe15reOufAZE+Vw
	EJztqsjq9Ly7/9QReMl6YSvgu+Z+2mfxf0v37bxkaFD3SO5hJPNqzjEmoD4Z6SGf5vXdiMAK/kk
	sHHj4lbo/36ePTHn5B7S143e7rXoFN8Lme1AN49W1gPnWeFMnGpNphgwscN8mIRfuRuqcDJSLcV
	/9ctBsUdfVH0j8hPU/Y5qxfOLhebJbiJcMSHBA3xtLAz86ZUKzCQg3GwQzuNDQvbSppK9pJI9ig
	7FODRRwKqQG+6aCg+YqeKaBzxLg174yt553E07isVjWAKndWqXh4rezRSb8O/fzW5wazfqIgL6v
	F6bProo2Om7Sd
X-Google-Smtp-Source: AGHT+IEniPdeUaDBJqW2J9JxlFM3DDSGnoXCNLODgE1sh4luqIQPy073VHyEhRaenz6+Ej5gQQv+EQ==
X-Received: by 2002:a17:903:2451:b0:235:5a9:9769 with SMTP id d9443c01a7336-23ac4605d87mr31453005ad.25.1751008732349;
        Fri, 27 Jun 2025 00:18:52 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:de1c:e88f:de93:cd95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1814sm9316095ad.57.2025.06.27.00.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:18:51 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Minchan Kim <minchan@kernel.org>,
	Rahul Kumar <rk0006818@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] zram: pass buffer offset to zcomp_available_show()
Date: Fri, 27 Jun 2025 16:18:21 +0900
Message-ID: <20250627071840.1394242-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250627035256.1120740-1-rk0006818@gmail.com>
References: <20250627035256.1120740-1-rk0006818@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In most cases zcomp_available_show() is the only emitting
function that is called from sysfs read() handler, so it
assumes that there is a whole PAGE_SIZE buffer to work with.
There is an exception, however: recomp_algorithm_show().

In recomp_algorithm_show() we prepend the buffer with
priority number before we pass it to zcomp_available_show(),
so it cannot assume PAGE_SIZE anymore and must take
recomp_algorithm_show() modifications into consideration.
Therefore we need to pass buffer offset to zcomp_available_show().

Also convert it to use sysfs_emit_at(), to stay aligned
with the rest of zram's sysfs read() handlers.

On practice we are never even close to using the whole PAGE_SIZE
buffer, so that's not a critical bug, but still.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 15 +++++++--------
 drivers/block/zram/zcomp.h    |  2 +-
 drivers/block/zram/zram_drv.c |  9 +++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index d26a58c67e95..b1bd1daa0060 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -8,6 +8,7 @@
 #include <linux/sched.h>
 #include <linux/cpuhotplug.h>
 #include <linux/vmalloc.h>
+#include <linux/sysfs.h>
 
 #include "zcomp.h"
 
@@ -89,23 +90,21 @@ bool zcomp_available_algorithm(const char *comp)
 }
 
 /* show available compressors */
-ssize_t zcomp_available_show(const char *comp, char *buf)
+ssize_t zcomp_available_show(const char *comp, char *buf, ssize_t at)
 {
-	ssize_t sz = 0;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(backends) - 1; i++) {
 		if (!strcmp(comp, backends[i]->name)) {
-			sz += scnprintf(buf + sz, PAGE_SIZE - sz - 2,
-					"[%s] ", backends[i]->name);
+			at += sysfs_emit_at(buf, at, "[%s] ",
+					    backends[i]->name);
 		} else {
-			sz += scnprintf(buf + sz, PAGE_SIZE - sz - 2,
-					"%s ", backends[i]->name);
+			at += sysfs_emit_at(buf, at, "%s ", backends[i]->name);
 		}
 	}
 
-	sz += scnprintf(buf + sz, PAGE_SIZE - sz, "\n");
-	return sz;
+	at += sysfs_emit_at(buf, at, "\n");
+	return at;
 }
 
 struct zcomp_strm *zcomp_stream_get(struct zcomp *comp)
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index 4acffe671a5e..eacfd3f7d61d 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -79,7 +79,7 @@ struct zcomp {
 
 int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node);
 int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node);
-ssize_t zcomp_available_show(const char *comp, char *buf);
+ssize_t zcomp_available_show(const char *comp, char *buf, ssize_t at);
 bool zcomp_available_algorithm(const char *comp);
 
 struct zcomp *zcomp_create(const char *alg, struct zcomp_params *params);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 385aaaa2531b..8acad3cc6e6e 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1225,12 +1225,13 @@ static void comp_algorithm_set(struct zram *zram, u32 prio, const char *alg)
 	zram->comp_algs[prio] = alg;
 }
 
-static ssize_t __comp_algorithm_show(struct zram *zram, u32 prio, char *buf)
+static ssize_t __comp_algorithm_show(struct zram *zram, u32 prio,
+				     char *buf, ssize_t at)
 {
 	ssize_t sz;
 
 	down_read(&zram->init_lock);
-	sz = zcomp_available_show(zram->comp_algs[prio], buf);
+	sz = zcomp_available_show(zram->comp_algs[prio], buf, at);
 	up_read(&zram->init_lock);
 
 	return sz;
@@ -1387,7 +1388,7 @@ static ssize_t comp_algorithm_show(struct device *dev,
 {
 	struct zram *zram = dev_to_zram(dev);
 
-	return __comp_algorithm_show(zram, ZRAM_PRIMARY_COMP, buf);
+	return __comp_algorithm_show(zram, ZRAM_PRIMARY_COMP, buf, 0);
 }
 
 static ssize_t comp_algorithm_store(struct device *dev,
@@ -1416,7 +1417,7 @@ static ssize_t recomp_algorithm_show(struct device *dev,
 			continue;
 
 		sz += sysfs_emit_at(buf, sz, "#%d: ", prio);
-		sz += __comp_algorithm_show(zram, prio, buf + sz);
+		sz += __comp_algorithm_show(zram, prio, buf, sz);
 	}
 
 	return sz;
-- 
2.50.0.727.gbf7dc18ff4-goog

