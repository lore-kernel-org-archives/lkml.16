Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141E4B1E4F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747281945; cv=none; b=UkyAOyeDy7hUsqvHh+RyXn5bJ0AIkXaQZKOM1krW/BsLz2ej4jy0cDj+Al0TvBj7fyNO2/luZYXe7Kf7OS4x/k/XmKX/HBdLO9sa6ZdrrLOhA2EdThTyRJXi92Z+Ec3StHIp9UTXyQHzZ1G+lI/FJlinykcB4SryWwp4S86fssI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747281945; c=relaxed/simple;
	bh=4BrBtZ2F1ecLOcCh0xCoTuqU15CYRmOnEkYROeguuYI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ckDQkNf9Y/ubr+dU02rwkigvHfv5U2mjGIyUpcQLFio3KO8qjVvQj6SxRDnAsK8A65IrglW+T/VIqjJHU9KrD70XBr/nKXf8he2E/xkVk7IdpvNBuIcHqdIvsk8V3m4QKUe5znKj4A7cFNXDZIKSCWCkWqgEgAre4zUYK2NBSgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MRLd47WZ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MRLd47WZ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7411f65811cso535055b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747281943; x=1747886743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PK1RN466vWHMmTxKr5nOsDNGYJ0uWoOdFWw3uonOjaU=;
        b=MRLd47WZBbreavzuhzH6ei6kzBbtusCBbTZoxCntuQr5a9R/N16ngqz5ut8tt11KBR
         d1DPU3M8zs9KJgb32RvRcRWwYfQKuf7imfZtqfu0Q8hMqVQAi2xNpEXH7t9q7Nfq63eh
         1iAz2ajVnrjrOMrUPEVlmYjXtmxB5ym1O06bjM0QMz5p0MFUaLowTnnGVyf5JxwDsNwz
         c4UE0DUJmgTG3J7bbJuu2R880mlayjQI9/RUuU5XhsYH9hZqQOtPdL7UF8Szh6Ij3qUJ
         UF6W7VAP1bIUjrbwiz1AUHQyKs8sEFqnU8MKANzHIaFhSpiiCmyEhAEg9qfV+YeNvu0F
         KI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747281943; x=1747886743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK1RN466vWHMmTxKr5nOsDNGYJ0uWoOdFWw3uonOjaU=;
        b=ukpxCq53fkZmC9haOMOzfeNSLvrz0WdiFwJIe+YjxmV+q+UyJJ9svisIwZvXjTCRXC
         zgtUT3LQvOXteX+x8L1UPozs33eZ/yvix1kYuZpDjPAmrdMmDT3013zSDhhOYPm6mO0c
         lJOdSGieCMkpsr3M5MqCl90l8OT39OckJAPs5j4Wrkh6Xuja/ai1EDWjYTW1KIso6A3V
         dfDv4CR1lsI3Wcyl1QzFeq55UaesZi7MTX0lP5mATMDmZBqPFukpnrd7s8Z5OnhAlpE3
         ZAVjHQRF1tuWoqkLnGusGyqtejjnfCkcOMNgvqSsRxPGxxn/sVSvYrkjFDFGEympNHtF
         0S0Q==
X-Gm-Message-State: AOJu0Ywe1fTSD2UkF7LfBo64OiWYIXyoHaRTiYB+WtEHxbHYUZh4Oby7
	QraMOH7osOHrL8HQ7MlkDgXHjCSPwjyEzTvC0xcaNJtV9HjDkyyU8seekwRT7d0=
X-Gm-Gg: ASbGncvWY9HjBmsNOuXctGTkPZJ51cxoF4FRYbePRqZeDSWSLr26th5y3j68edkb90L
	cjfG3vXrSQgVZHjz4S2Z5I4qGhYHWQrnYv9CLztKCxTqap44i8xQbb+Iwxgqjj/QRTz0d1K+hAI
	ESnpiLzR4uL1MMA/qp23V4c6cF8FR0SZoHF7niVk3fDioISupmTmqPuTeWgpUipBKqFzV1SkKP/
	qWR47bOYbX2gQAVLbGZrSpfAazGA8wocA3Mt0rJCl1h6ykzVLwUtUPgyupEFKuovx10nZFkG4x7
	UMWwoTyyg5v6F0X9uxgHZYPoEl7ah+q/4ADVsuG6ngloLv4Vrwvj6/n+7q3k+0rlT3oEOZc=
X-Google-Smtp-Source: AGHT+IGRwO82Idquls1uiuElruqIR6Bjili+nFRMaupvyS6khLTUGskU4C0v+Cv+/zG+gY5fH5J5DQ==
X-Received: by 2002:a05:6a00:2294:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-74298545429mr1702048b3a.16.1747281942570;
        Wed, 14 May 2025 21:05:42 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.131.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a405c4sm10326785b3a.154.2025.05.14.21.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 21:05:41 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: tj@kernel.org,
	jiangshanlai@gmail.com
Cc: linux-kernel@vger.kernel.org,
	muchun.song@linux.dev,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH] workqueue: show the latest function name in /proc/PID/{comm,stat,status}
Date: Thu, 15 May 2025 12:05:23 +0800
Message-Id: <20250515040523.430181-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Workqueues, such as system_unbound_wq, are shared across the system,
making it difficult to determine which tasks are being executed by
each worker. This patch improves clarity by displaying the latest
function name associated with each workqueue worker in the
/proc/PID/{comm,stat,status}. For example:

Before:
  # ps 64 67 68
  PID TTY STAT TIME COMMAND
  64  ?   I    0:00 [kworker/u34:0-events_unbound]
  67  ?   I    0:00 [kworker/u33:1-events_unbound]
  68  ?   I    0:00 [kworker/u33:2-events_unbound]

After:
  # ps 64 67 68
  PID TTY STAT TIME COMMAND
  64  ?   I    0:00 [kworker/u34:0-events_unbound:flush_memcg_stats_dwork]
  67  ?   I    0:00 [kworker/u33:1-events_unbound:flush_to_ldisc]
  68  ?   I    0:00 [kworker/u33:2-events_unbound:idle_cull_fn]

This change provides a clearer view of the tasks being performed by
each worker, enhancing system monitoring and debugging.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 kernel/workqueue.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 3bef0754cf73..6d4ca373b980 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6475,9 +6475,12 @@ void wq_worker_comm(char *buf, size_t size, struct task_struct *task)
 			 * current, prepend '+', otherwise '-'.
 			 */
 			if (worker->desc[0] != '\0') {
-				if (worker->current_work)
-					scnprintf(buf + off, size - off, "+%s",
-						  worker->desc);
+				if (worker->current_func)
+					scnprintf(buf + off, size - off, "+%s:%ps",
+						  worker->desc, worker->current_func);
+				else if (worker->last_func)
+					scnprintf(buf + off, size - off, "-%s:%ps",
+						  worker->desc, worker->last_func);
 				else
 					scnprintf(buf + off, size - off, "-%s",
 						  worker->desc);
-- 
2.20.1

