Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B189211A39
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075754; cv=none; b=tElf6NODkJP1lpfDivwNeKIUrgFjuUjAZDvczScaxewQJ7Ytc1fb47ShBeGJ5NCYX0c0KxqLlJKQBQQjTw2TYqOP5rgzEIun8boTm+Ser+rYwr175qEKyOKibH27yITeyp0sa4lIIKhhRai1FSNl8Ddo3QOTdALCTkFpzjNTEAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075754; c=relaxed/simple;
	bh=KALfclt2c3dAW1AKyOrZ1tv8gBSfmDEQVOWa5sKhm4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8OuaB+myuJ4vqrUb+yXSsowx8U5PNSafmIKGNPgsRJRueucG/Bcgwp+7JTCICG/Vs82uypgOpunS1bwrVdokz9btQQBEQqkXaHVlpfJAHWjhbGKfq5VpYelmDTDsCJnah2k/LdFJVwcPbnFhxZjan0WHaWdnd/yRTwq6bnAstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dsQJtQf1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dsQJtQf1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224171d6826so22005405ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743075752; x=1743680552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrPxuKonSwXBeNfuEkYWsadcWWgtM4GwjCPebsFmDtE=;
        b=dsQJtQf1hRShhsTtF5ahf/rbHtupLeZoiU8HW7uQAx3UBr+gTg2LvQvdR+JAAJXstn
         Nd9wb61XUaMqaJLXq20vGmmFSxSaGl8dsXuNp6hqheGEGdeiCNb+IOFUyeGdA129zpg3
         kBjf2iB6HeIESdRZP30weDLvweilB/1Nmv6K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075752; x=1743680552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrPxuKonSwXBeNfuEkYWsadcWWgtM4GwjCPebsFmDtE=;
        b=J7TX1EWqrC8pbV1bckiwkushNKdLECtZPwnSehl2mbGL/UWkqdXcEKWHwnQWCin/Bt
         scq85WRXQaJ7d7TEXA0J5uPGcK7spLiLXMEJzVmY12LEBCMR5Mu2Bu1F97VPjAH/lhHo
         akETveIk2vOZO/wJtsgq31Bd8cB4Yhn0WV2OIYZDgPqas134ua/fhFIrtbzcOLBmYTK+
         lX+bZq8S1SkXzsHygoistW3Af6xF/7gc9rgYWnyCZ05tuXWL6FYyQFGZwNyCjrk3BwHs
         7RxT6TXgig3nADD/zkenPD7/DjejKm+Wy4jjRre5z12TJOq9EeMls98az3Llmh3+gEq1
         2QYA==
X-Forwarded-Encrypted: i=1; AJvYcCVz0r7Nqs362G+z+ELI3RvUDKi8UZH9qgj0PzprJRStIyOTQBqn7swyekfq3SVtVnwyQlpuuOQ33+6AVpo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsr6cE6EfxqAdQAtY7wNB/1WGKlEvNFAr5MVO9Ciqtg/neL+XO
	Fw2JZWR4yTenA14dHZ0G5hM4hx6fef/xKRCxzRhJjDy77h9gB6/Xz2tvvny5Og==
X-Gm-Gg: ASbGncs6oh7X35hPPA0WRtM7TjhayfP+2JwY4IG0jFt5g24vXNrpY7eh8msO0/W5Knb
	56d8ZnA0NuNLlY8DfL7bJRd0v1gNnHtmhtdyBwrPqdue1NZ7XZA8GSrcKbmnFeMfpTaXD2rS1Sb
	UQcOpbzRVrCdQnt8VsY1Y2/+7Ga1gDmeveEBMD+fBcockRrxczcH0csfziAy9Gx1XBfp0YykBQ4
	m/Nh53YBg8zFPecObDGOlQyDPdaxbTMPX4Pc2BFYk7GkZB8jXk11BfdyIAIjFQLvsbRYDjTCdor
	tCJYHN7dHA0XI2nVdkJSeQkZ+vWnJksIafSlKvs2XAJzjesMh1efhokcw5XnLh5mmXNPUw==
X-Google-Smtp-Source: AGHT+IHD4RukqotroNphP3/o3sXCpK8buz0Wp92d9oz/6cijSteH6HLjiZHwSaZwk29Uog5iWFoLHA==
X-Received: by 2002:a05:6a21:168d:b0:1f5:a3e8:64c8 with SMTP id adf61e73a8af0-1fea2f8094bmr6354759637.36.1743075751546;
        Thu, 27 Mar 2025 04:42:31 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a479c1sm12652606a12.70.2025.03.27.04.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 04:42:30 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCHv2] thunderbolt: do not double dequeue a request
Date: Thu, 27 Mar 2025 20:41:21 +0900
Message-ID: <20250327114222.100293-1-senozhatsky@chromium.org>
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

 CPU: 6 PID: 91007 Comm: kworker/6:2 Tainted: G U W 6.6.65)
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

Another possibility can be tb_cfg_request_sync():

tb_cfg_request_sync()
 tb_cfg_request()
  schedule_work(&req->work) -> tb_cfg_request_dequeue()
 tb_cfg_request_cancel()
  schedule_work(&req->work) -> tb_cfg_request_dequeue()

To address the issue, do not dequeue requests that don't
have TB_CFG_REQUEST_ACTIVE bit set.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: stable@vger.kernel.org
---

v2: updated commit message, kept list_del()

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

