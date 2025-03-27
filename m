Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462D27E9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743054806; cv=none; b=dNFpC7SV+Ia9NhfeWDQPvg4599uNt5CJgVl/CxLvZs4HWmrodKrXrz5IyLWIDzL16zJ9SCVuQOi1W3eXioBdqIHhsGHStUvdtlYwpbo8xkJ0uhmvtXFK/+7OdgogJBJP975FNlgASzklYk9Xy6LvZNQk19g0UpgY9FpOLhCi1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743054806; c=relaxed/simple;
	bh=rznbL18y9IMwzhAgZyFgFLaEm0xCxFnERqTOdx4jyqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1947JAQsP982pzsTyRi0Jk0WaXG4eeLAYJk/ieOdhGs45NzeVwVbnKzKY1aPaeMeb6DoeOLZAb+9oRGGHlsI50AhP32qmBcIYflJY+IybxEI9evaYglIS2SOAuY9+mzxhST7eEIozF9USlBJyK43RmGZBMbeH193PO1GbbDfwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FoQODwgx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FoQODwgx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22548a28d0cso17887185ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743054804; x=1743659604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3UderlRrJePl4t1rg1R3vPXIXNH/vlUA1XtTo4Gz7Pw=;
        b=FoQODwgx4KzNE8GKrQKXIXPa5aGkwhXU9U87uDU60NC8wBRk7j4Lh+xQR4SCRrPz1/
         ndYICIaaQh7Gv5WmTsyiz16hxQkQp1N6XCZCK5KdDX6/zczLeq1gmnEOkwxP2PTkdm/J
         GCHHkurN/vB3czyDPInRTASs0d+zSEWnYSLHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743054804; x=1743659604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UderlRrJePl4t1rg1R3vPXIXNH/vlUA1XtTo4Gz7Pw=;
        b=YUGD9cj2p5bJO4PLlJJTUHjvknmIoXYZq73zwr0oFRv8HjFb/pRwirfntEPHokDNhl
         Vg96jJINaqS3UDpiWqkMVRV8y5F2yCQ+W6VBfPRYWaKqmDL6IE7kXzzgioEh7MQHZBMF
         nYcyr3ibLmur4f5eIkPmpLv/Uimoi27F2eSznuHwHKqad3c+BUCp39UHJ7jB/ktyOSoi
         1yhP3uxJ1+hFxDza5U3oQak2R+tsvkBz7Q7EmnE2/LAaU8aXbFzriDWK4btAeZiBz+83
         6gZwEPk05ZU+ACu8rRNa8Dy2QqLuWZlBh55DiROLIvzaIkQX4S0K88EAnQIlrmi466kh
         +16w==
X-Forwarded-Encrypted: i=1; AJvYcCUNl57Y5Z7L7N4ALxEQ1jieB3YpoDk3P1to5hk29ph4lyc/jEXjTZEOkbbVN/32yCeqUHNnXyPn4FiYKMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIM14tGgN50nAUElQtcgiYqB7db5RqkVQRioKimW+Lc75bR9h
	6BKKqIizAl+YMQmBYaq0ycqwqTva+ZTAjnqWpZbcXJew/zDB5syxA1DNzKWuvA==
X-Gm-Gg: ASbGncuTwdqUzCUdS6m1GaTPcQ/2r060tyyadFjVFJ5TlDlYsB1C80lzqggLQ491fb1
	R2xevIjxOFE4F2H29wverInotux0pAtg2dPAE+IiVsiDXQX9OMamS1l1NsIr0PEohiM4ML4KZwF
	7gWThSv2kVg/mEH6LNW0d7ogzx+2izIaM3wvbi+D+KQT6M6tDEE+NieWKG7i+VbUsej59SGu55C
	qrbkOixYbUzo5UkAOu5fRdLh2zZl5miVaTzd28R4+oeAxSU/Q5Rtr3b6qqmJnpNq6WgT8rkcB1Z
	1Opn4r4oQDwug4Grf0kXm8Be7ZPTsoZbSHjJ1UMBOzTyytLXW4r3PST+JTklooPPnq6DiA==
X-Google-Smtp-Source: AGHT+IFpjNx2vf5Uw9iOk+GGsojnR+9RmcUUXRHFfAjLIxgQPIYbIRiQwhFBTqSYmMKbIAD9zM0Xlw==
X-Received: by 2002:a05:6a20:9193:b0:1f5:9431:46e7 with SMTP id adf61e73a8af0-1fea2f94eb7mr4396039637.42.1743054804386;
        Wed, 26 Mar 2025 22:53:24 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a652a2sm12008359a12.76.2025.03.26.22.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 22:53:23 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC PATCH] thunderbolt: do not double dequeue a request
Date: Thu, 27 Mar 2025 14:52:54 +0900
Message-ID: <20250327055314.8679-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of our devices crash in tb_cfg_request_dequeue():

 general protection fault, probably for non-canonical address 0xdead000000000122: 0000 [#1] PREEMPT SMP NOPTI

 CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65-06391-gbdec63d10750 #1 (HASH:cf42 1)
 RIP: 0010:tb_cfg_request_dequeue+0x2d/0xa0
 Call Trace:
 <TASK>
 ? tb_cfg_request_dequeue+0x2d/0xa0
 tb_cfg_request_work+0x33/0x80
 worker_thread+0x386/0x8f0
 kthread+0xed/0x110
 ret_from_fork+0x38/0x50
 ret_from_fork_asm+0x1b/0x30

The circumstances are unclear, however, the theory is that
tb_cfg_request_work() can be scheduled twice for a request:
first time via frame.callback from ring_work() and second
time from tb_cfg_request().  Both times kworkers will execute
tb_cfg_request_dequeue(), which results in double list_del()
from the ctl->request_queue (the list poison deference hints
at it: 0xdead000000000122).

Do not dequeue requests that don't have TB_CFG_REQUEST_ACTIVE
bit set.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/thunderbolt/ctl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index cd15e84c47f4..3ad15febc7df 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -151,7 +151,12 @@ static void tb_cfg_request_dequeue(struct tb_cfg_request *req)
 	struct tb_ctl *ctl = req->ctl;
 
 	mutex_lock(&ctl->request_queue_lock);
-	list_del(&req->list);
+	if (!test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags)) {
+		mutex_unlock(&ctl->request_queue_lock);
+		return;
+	}
+
+	list_del_init(&req->list);
 	clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
 	if (test_bit(TB_CFG_REQUEST_CANCELED, &req->flags))
 		wake_up(&tb_cfg_request_cancel_queue);
-- 
2.49.0.395.g12beb8f557-goog

