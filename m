Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1321474B8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087859; cv=none; b=qazrwtE1KVcgU80a9q5vbKmqGnWdhuX/Fg93WqUJKRuwOUtYgPOX5tEUwJAwngEEeQCCI7kM2g9TUlTZpvoyL3+qwUI4Pzv9eiONT3vaNCCrCppW99OqxN/bJ/SoXfgpZ6sWiVfuNsjMcLL57c4sq03Zew57m45m9VNbHmA+u3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087859; c=relaxed/simple;
	bh=hTh/cfVgLHrPOGu6GYfIXW4bOU+Eq28EHmrYsiW2aWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBY281m0oAE6JVoVdYL0EcUsSRvf5HFAuLjsFd+Hz8CDqKKrfCnI6xK08HOPzRIYm3scOWPQhJZCVc8XBrIKP4EjPid2Fovn68D0KGd9RlU+fO7XejEGDyVwvdng1Km5PG8SlSzrGNWDki0bOlPrh7YInnIk5O5q+gPS8W+TcQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kbF/Fw9M; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kbF/Fw9M"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2240b4de12bso32122045ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743087857; x=1743692657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dzn/q3DwJwUQakeNgiZfS0yjXlYy1cHDyYLgM2hgUc=;
        b=kbF/Fw9MBisX2Nd+N1XCOWW4BNOdcPuWdY/X1h4czHDt63O1ELouX1qamvPp7ZmqY/
         P9QL4FSdWBbeQrmTo2rTG8o/RQ+2AnW8Cy6RuIR9vumG4dN4PlvDb9P3ub3BnG+YBp7R
         obrEjGz2Sj7Ux5o+3km31lHIumfwOFwGI5t7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087857; x=1743692657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dzn/q3DwJwUQakeNgiZfS0yjXlYy1cHDyYLgM2hgUc=;
        b=WNLNnKnlYqdo12lEfuMMrrdaUyMC1UScRKRDWZPEYV/mRvXClgTuORvoUK2FA/VfGo
         McaTanAiBzh+T7nWmF51kW5+9ieBfy+dk2oOBFqVPowUrKJZLegPBCn0tb31FJywOP7A
         pzV2WZNx+NUpQJJ3s47vi9pNV+FRx/F3YHR58lihNR8kBrqBS0AtJfeS5Gw5jLz15hg+
         K+7p3o2GqBJeExttJMw+5P0Fvjh+8/9e6lcpPxRd0vxTLAwcO26lyuKXxE11xpxu4NEH
         Yg21+2dMbFRcFcYKGcctDZQkj05khBjVmCGo21snGnDn1HK9e4oPlx8TS+Ke2bGl1+Do
         xEbA==
X-Forwarded-Encrypted: i=1; AJvYcCWtPpEZcCXGkvEMl42OXSMA0wcFlCLt49mQNxoeAttHPGcuNoGiMU1isxmL10jkJt8nJvuwxMnjJibF9Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygk486B4M4aPJBWYwraqHQiof2L5/GcnxOXRmmQPoEBY3ee7Hz
	H3F9Y7qSGhk2Lp1uLFYldsKZ4sfNgq0klBeB8Q23Oiyeoi2Epbo3hfcwhHFkoQ==
X-Gm-Gg: ASbGncuNFkC4VzOQeKYv7CLine6xwGz3k5hA5a9zmCQiH/gV+CYgFHafZLkvvVeqYca
	9LbAYadGNva8UCe8ZatsvbcI5sYQUMoc1NzwWTisrQOaxxAnrYJTOs20rDC435hNhLVoO/72KB6
	Z6AN53vLDOfaNU2QCgHIUjmYg33dZ4qOZaWOC6hjPxN9mfheT20cBoWvtJieKPmaL9wwylOOrVo
	U2Zkef3LK6eJ0wZZB+07ztVqsDn1uqQ11DC+CWl6ypnlqEsC+WcLYfwtaqjdkNsiz7SLKNd4Tmx
	TApzV+b7+98HocFLB9ngdRa6+FBfVL8Rjq5feKYt3Efm3ZCx2cPUSCUEULKJxLPoqA1A2Q==
X-Google-Smtp-Source: AGHT+IEVqGTm9SnJQYYYVq75N+ryfrvO/8a+zp+Bo8G0CL6FxM48RSgxG269/Ff2pGWCEpMLTxoWGQ==
X-Received: by 2002:a17:902:ef4d:b0:224:1ef:1e00 with SMTP id d9443c01a7336-2280485782emr63449195ad.19.1743087856578;
        Thu, 27 Mar 2025 08:04:16 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0bafsm619715ad.90.2025.03.27.08.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:04:15 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCHv3] thunderbolt: do not double dequeue a request
Date: Fri, 28 Mar 2025 00:03:50 +0900
Message-ID: <20250327150406.138736-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of our devices crash in tb_cfg_request_dequeue():

 general protection fault, probably for non-canonical address 0xdead000000000122

 CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65
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
Cc: stable@vger.kernel.org
---

v3: tweaked commit message

 drivers/thunderbolt/ctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index cd15e84c47f4..1db2e951b53f 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -151,6 +151,11 @@ static void tb_cfg_request_dequeue(struct tb_cfg_request *req)
 	struct tb_ctl *ctl = req->ctl;
 
 	mutex_lock(&ctl->request_queue_lock);
+	if (!test_bit(TB_CFG_REQUEST_ACTIVE, &req->flags)) {
+		mutex_unlock(&ctl->request_queue_lock);
+		return;
+	}
+
 	list_del(&req->list);
 	clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
 	if (test_bit(TB_CFG_REQUEST_CANCELED, &req->flags))
-- 
2.49.0.395.g12beb8f557-goog

