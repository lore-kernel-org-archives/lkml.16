Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54BE291174
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513461; cv=none; b=TBFM4pUFy9t+THB8xAWsRn6x1KBm5QjYFpsZff4+wleXjmO/UMNbadFMDAo631JyMIntWOeu5n98B/UeLtzbN9M8CTJpCeSb3VcAk9O+b5xzsX7GatuZA6mK4d4gHPe/OZEaD+PkVx0M4Zuaewi5NGNJM8lon0gjrWNhVf7PDUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513461; c=relaxed/simple;
	bh=zR4tniuAE0duovzeQicTC51tNkBhS7PwXVSnhERFhn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYXCDYuvSGcnosTPkfftuhDRC1BP3SCSfE3RqebYNMlZxSmCrHd82Cq/NK3psgFZbYxkmzUVhnJdtmEBrMwyqxRvesIxq98kAa7DXg0S1Yr06F2oDugaPWo+giL/xFxqVSvETvByInfSZ4etlcRmqOjX0Z7sZMi6ffy/G41vIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=dRb/LbNp; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="dRb/LbNp"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3fbc00143d6so1041239b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513458; x=1746118258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qepDoEK7fQtEFFNDVuX8GV694aIjiKgLyArjf+63mRk=;
        b=dRb/LbNpXZKvNJTLQuZSnol4/Wk2VYddhYo76A7ouUkeU7v+yeQ4C5Wo5WPiU1TV2F
         6OeN+73etG6mO+0WNMPTPVtmvGtHKjnH5CVvOyseGArAWDRPFQh4h7Qk2Z/+wBEuCEkm
         er8D7SmEBhMjy57jkoCpV0fOsTucZdBDilOHbNCyjIgAhLKG2Oms+7Jha81WBGhQAoU3
         tQhwg3+rh3zEIQv94TIwPRZOGoEUx98DfTBh74OnT1D6tEbXqPHtPkiJkbqpDo67BjUa
         +jtDbETHGGTLYOmUj8zHAbPGvVBFLBT52Lqr3UGIcYJbzWd7ismuCgq7fltb/wmJO43e
         R10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513458; x=1746118258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qepDoEK7fQtEFFNDVuX8GV694aIjiKgLyArjf+63mRk=;
        b=ISurC+HUoIZIRVxuI/JOGDx2Iqa9Zd7f9PNuRbR8DDr5N6asmg90w/c7B745yypzHA
         CbH5yjpIdrS5ufGM1ZfJJpmFAENY9Q+f/qwExE00aEPA4/0aBy4HRZBN4u4Ixw4U8s7N
         dPg7MCP9bu8PdoRnrfWM4+OKRXD70p4aB59aNe/PskIfSoVwTRoFGu0dMFFl/pChcWZ2
         TSpPdbiKp8yesdk+IX8fl5DBv6oMsOQpMLjTJg9+vXsoQngixYSvwWZYn8+95PQZt+4m
         3WMUlG0pxAoKUQpzqHVUsYVbATB5kTQuBQ4T9rO6hmUuolKDSYlSmEaAxslhEIP3pHvb
         1msw==
X-Gm-Message-State: AOJu0YylNUniioYf1yJ8GnrhVhLCCMQC1ZJR3/h6UvYw3iZzqzPPPQ9F
	7KlhggewL3HmyOTP4qHFn++jPyH5tqT3zcyw7H8zAJ40JRLfgXJpxoeROBXIBu2AVFn4aG86PaD
	w
X-Gm-Gg: ASbGnctWtLsWJH6GaEC2H4i7A2N/dueX0LUdY8oG3/pwocTpbcBCgJDASR9JuiN6n5M
	An52cgrcG66KBzY+an8leO8HtuPOv2Ihp1dydaKulJ4vptE/pgUYGRh9KPOXCRCmVZqTiukP0cr
	YkGBBLg4l5aETmgDmAjJyyvuCpsBGuwQkpPrmcELJRBGO58WwsiTiIoyPx3hiuPD6IUa90IZIPc
	9tXgP9le+cZnRyG4eQYR9f3jT6hVWqnSC+T73R2eU1NGCjS0ukE4mUPQyWOA0Udz8RV5DrWSvJP
	BRiMl8ziFFROVs0t8hNktd8YC4iX2u6Yel9Ht7bcrTvK0w==
X-Google-Smtp-Source: AGHT+IEfVULpCholq3S/L81RHTmf54TB5BR0x2l2mjKQ8FChlydz7ZqUdy/hNLvgRVxIzVFkC8/dEw==
X-Received: by 2002:a05:6870:30e:b0:296:bbc8:4a82 with SMTP id 586e51a60fabf-2d9944a6db9mr284312fac.27.1745513458491;
        Thu, 24 Apr 2025 09:50:58 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2d973c18da5sm365930fac.47.2025.04.24.09.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:58 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 17/23] ipmi:msghandler: Add a error return from unhandle LAN cmds
Date: Thu, 24 Apr 2025 11:49:54 -0500
Message-ID: <20250424165020.627193-18-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we get a command from a LAN channel, return an error instead of just
throwing it away.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 56654a9c5cf7..c72ff523216c 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -4165,14 +4165,33 @@ static int handle_lan_get_msg_cmd(struct ipmi_smi *intf,
 	rcu_read_unlock();
 
 	if (user == NULL) {
-		/* We didn't find a user, just give up. */
+		/* We didn't find a user, just give up and return an error. */
 		ipmi_inc_stat(intf, unhandled_commands);
 
+		msg->data[0] = (IPMI_NETFN_APP_REQUEST << 2);
+		msg->data[1] = IPMI_SEND_MSG_CMD;
+		msg->data[2] = chan;
+		msg->data[3] = msg->rsp[4]; /* handle */
+		msg->data[4] = msg->rsp[8]; /* rsSWID */
+		msg->data[5] = ((netfn + 1) << 2) | (msg->rsp[9] & 0x3);
+		msg->data[6] = ipmb_checksum(&msg->data[3], 3);
+		msg->data[7] = msg->rsp[5]; /* rqSWID */
+		/* rqseq/lun */
+		msg->data[8] = (msg->rsp[9] & 0xfc) | (msg->rsp[6] & 0x3);
+		msg->data[9] = cmd;
+		msg->data[10] = IPMI_INVALID_CMD_COMPLETION_CODE;
+		msg->data[11] = ipmb_checksum(&msg->data[7], 4);
+		msg->data_size = 12;
+
+		dev_dbg(intf->si_dev, "Invalid command: %*ph\n",
+			msg->data_size, msg->data);
+
+		smi_send(intf, intf->handlers, msg, 0);
 		/*
-		 * Don't do anything with these messages, just allow
-		 * them to be freed.
+		 * We used the message, so return the value that
+		 * causes it to not be freed or queued.
 		 */
-		rv = 0;
+		rv = -1;
 	} else {
 		recv_msg = ipmi_alloc_recv_msg();
 		if (!recv_msg) {
-- 
2.43.0

