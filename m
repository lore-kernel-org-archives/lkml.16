Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7299C293476
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513474; cv=none; b=jHEw5ogavuCAZcdrZN4Js3ZHVBeMVHyKIDH6nCsw1HHqGYXvhQPFZSOXEkuOiIzlfTgoAR/CsuCYzulcCZpnopAUqIi9sYWIQGkFHdqR4M0C44y/P7Eo3VJg3M8CG1a/NxAewM2m+dYX2Zb8ZEG55BX1A8zt9yR5rkuef1BmUd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513474; c=relaxed/simple;
	bh=gDye0TlyhUI7D6/X2UpFJ0FpYsClsGf08yxjJi6IYlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmY3oxgjY+KXuQ8mUs4nmHGq99q/JptBO/WYURPfgiDIiLFrHIFFuoHBomglX/Rw/yU85iXlwecm9BG+zZlxE3P/ZGRib1Mwn9aAX3cvwUJw4kKHVP3dMkee7847VwBZUMeEsIzH/uXF+ukulbXRJpikW8HUHHRiKTIDZQwWqbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=uBp3OmG4; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="uBp3OmG4"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f9a7cbc8f1so438433b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513471; x=1746118271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DtP54tyqxFhFBILx2kDBmZqGd2mYL3dx6NE92iFW4Q=;
        b=uBp3OmG4H5wx+EV/d8H7DpJB6bD3AWX+UuoAj7CA5rPJriD5AtuY+QkRaYBKbKTHaV
         3trxzJB29joFOTggWK7ntK7C6GxJpY3SdKlRiWYnz06Nc1mlDj/Dde6JUpyJXYpLNh7x
         RbuPGbhOS/tlqeYHQvC5Zf3aqE/kV/igDQNS8Lxy6o5ZBMvC5GUH5GcQyRumS9X1KiFM
         hlF7s98qZy2rZGqfZFXULm24+nEH7wRMwjVwOSUdx0wSsflTF32G+cKORwqYPLPuJt4/
         NAXNTHuSGqL+orjke8a/lY75oziFaEMaYXDu9m/GEdlhDVFjsxH3co3UNmJ6/7zDwofo
         IH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513471; x=1746118271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DtP54tyqxFhFBILx2kDBmZqGd2mYL3dx6NE92iFW4Q=;
        b=wDJJhKMHo6onlaqQtgM3AMbfd67LsIRXGG2gleXl/lbZSt1JMLF0yNYSa77Ipc698Z
         FrOQ3QJianG11aiwoLA1WxMWl/Q53ZP6/KdvnwLCjVaLLUoA2NeIFasREjpID25uEFQj
         zBB57VGPjXQ4o2U+f+c35q8eHYaAIpLIAekiUhLB4njFYRx5FYjqz9EvYCjtzKnppyhl
         lUeJsA3hqQ8+N/h5TuCF7/yI9VEOeD0FfS/crpNntF6To7DD9hSWjDyFc1Xe1OqK48uV
         msQvZFu7ceso4aS12nDw1Ir4H89P4JSCvE4tZMmSvQvB49i8cmNUJK2EIODzwTIjmkh4
         RksA==
X-Gm-Message-State: AOJu0Yyn+0eDd+XsFn9BthKs11/Ss+HfsneI2UMC/q2Yfd+5aDoNJfuX
	oQ8O94jBCYESegF0jvHrak0ZUeXthLWMHxGmdohPCneGHh6ZWO6aYIXdcLwdJQm+lmw2Xsic/LA
	c
X-Gm-Gg: ASbGncu146AaOz41l+xaUW5Ftj5RS3XJlz7G31wU34PHgtqYYIXTfFX26wr6Ig65b47
	G6CyOyG1s0VtA5R3mymqFyNUWnpxPI9hojAaj27B4AValwKQdpYKHcyug2gQnlm1/smbVE4JNM7
	itq6Q7DExOoqpeyfw+V1CG5Ciu8nie+qLCnxcGhkZvuwm4D6hRgFxK0eHqHC19V3CXrC0tH1WOC
	z6SFZOuZ2KyMt/aw5o2pi7wwTs1dWkxXuOKCJOruYZD0cfWhrM96aYicg8o0dHgqK+5iBE/K7SC
	d/z+153fu8jdcs0A6fqRj/gjBKfMIWdfkN8=
X-Google-Smtp-Source: AGHT+IHZgD6N5Ydm2i854rDOI9bgjRs+sNeoNUESxEFdm0GMfAu3nWPsdoBeLj7XFF1Qh0xyiRdviA==
X-Received: by 2002:a05:6808:6c8e:b0:3f6:7832:77f1 with SMTP id 5614622812f47-401eb3cf753mr1932722b6e.33.1745513470904;
        Thu, 24 Apr 2025 09:51:10 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec8c9dd3sm308524b6e.11.2025.04.24.09.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:51:10 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 23/23] ipmi:watchdog: Use the new interface for panic messages
Date: Thu, 24 Apr 2025 11:50:00 -0500
Message-ID: <20250424165020.627193-24-corey@minyard.net>
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

It's available, remove all the duplicate code.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_watchdog.c | 72 ++++++++-----------------------
 1 file changed, 17 insertions(+), 55 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
index 01c10bd5f099..ab759b492fdd 100644
--- a/drivers/char/ipmi/ipmi_watchdog.c
+++ b/drivers/char/ipmi/ipmi_watchdog.c
@@ -363,7 +363,7 @@ static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
 {
 	struct kernel_ipmi_msg            msg;
 	unsigned char                     data[6];
-	int                               rv;
+	int                               rv = 0;
 	struct ipmi_system_interface_addr addr;
 	int                               hbnow = 0;
 
@@ -405,14 +405,18 @@ static int __ipmi_set_timeout(struct ipmi_smi_msg  *smi_msg,
 	msg.cmd = IPMI_WDOG_SET_TIMER;
 	msg.data = data;
 	msg.data_len = sizeof(data);
-	rv = ipmi_request_supply_msgs(watchdog_user,
-				      (struct ipmi_addr *) &addr,
-				      0,
-				      &msg,
-				      NULL,
-				      smi_msg,
-				      recv_msg,
-				      1);
+	if (smi_msg)
+		rv = ipmi_request_supply_msgs(watchdog_user,
+					      (struct ipmi_addr *) &addr,
+					      0,
+					      &msg,
+					      NULL,
+					      smi_msg,
+					      recv_msg,
+					      1);
+	else
+		ipmi_panic_request_and_wait(watchdog_user,
+					    (struct ipmi_addr *) &addr, &msg);
 	if (rv)
 		pr_warn("set timeout error: %d\n", rv);
 	else if (send_heartbeat_now)
@@ -431,9 +435,7 @@ static int _ipmi_set_timeout(int do_heartbeat)
 
 	atomic_set(&msg_tofree, 2);
 
-	rv = __ipmi_set_timeout(&smi_msg,
-				&recv_msg,
-				&send_heartbeat_now);
+	rv = __ipmi_set_timeout(&smi_msg, &recv_msg, &send_heartbeat_now);
 	if (rv) {
 		atomic_set(&msg_tofree, 0);
 		return rv;
@@ -460,27 +462,10 @@ static int ipmi_set_timeout(int do_heartbeat)
 	return rv;
 }
 
-static atomic_t panic_done_count = ATOMIC_INIT(0);
-
-static void panic_smi_free(struct ipmi_smi_msg *msg)
-{
-	atomic_dec(&panic_done_count);
-}
-static void panic_recv_free(struct ipmi_recv_msg *msg)
-{
-	atomic_dec(&panic_done_count);
-}
-
-static struct ipmi_smi_msg panic_halt_heartbeat_smi_msg =
-	INIT_IPMI_SMI_MSG(panic_smi_free);
-static struct ipmi_recv_msg panic_halt_heartbeat_recv_msg =
-	INIT_IPMI_RECV_MSG(panic_recv_free);
-
 static void panic_halt_ipmi_heartbeat(void)
 {
 	struct kernel_ipmi_msg             msg;
 	struct ipmi_system_interface_addr addr;
-	int rv;
 
 	/*
 	 * Don't reset the timer if we have the timer turned off, that
@@ -497,24 +482,10 @@ static void panic_halt_ipmi_heartbeat(void)
 	msg.cmd = IPMI_WDOG_RESET_TIMER;
 	msg.data = NULL;
 	msg.data_len = 0;
-	atomic_add(2, &panic_done_count);
-	rv = ipmi_request_supply_msgs(watchdog_user,
-				      (struct ipmi_addr *) &addr,
-				      0,
-				      &msg,
-				      NULL,
-				      &panic_halt_heartbeat_smi_msg,
-				      &panic_halt_heartbeat_recv_msg,
-				      1);
-	if (rv)
-		atomic_sub(2, &panic_done_count);
+	ipmi_panic_request_and_wait(watchdog_user, (struct ipmi_addr *) &addr,
+				    &msg);
 }
 
-static struct ipmi_smi_msg panic_halt_smi_msg =
-	INIT_IPMI_SMI_MSG(panic_smi_free);
-static struct ipmi_recv_msg panic_halt_recv_msg =
-	INIT_IPMI_RECV_MSG(panic_recv_free);
-
 /*
  * Special call, doesn't claim any locks.  This is only to be called
  * at panic or halt time, in run-to-completion mode, when the caller
@@ -526,22 +497,13 @@ static void panic_halt_ipmi_set_timeout(void)
 	int send_heartbeat_now;
 	int rv;
 
-	/* Wait for the messages to be free. */
-	while (atomic_read(&panic_done_count) != 0)
-		ipmi_poll_interface(watchdog_user);
-	atomic_add(2, &panic_done_count);
-	rv = __ipmi_set_timeout(&panic_halt_smi_msg,
-				&panic_halt_recv_msg,
-				&send_heartbeat_now);
+	rv = __ipmi_set_timeout(NULL, NULL, &send_heartbeat_now);
 	if (rv) {
-		atomic_sub(2, &panic_done_count);
 		pr_warn("Unable to extend the watchdog timeout\n");
 	} else {
 		if (send_heartbeat_now)
 			panic_halt_ipmi_heartbeat();
 	}
-	while (atomic_read(&panic_done_count) != 0)
-		ipmi_poll_interface(watchdog_user);
 }
 
 static int __ipmi_heartbeat(void)
-- 
2.43.0

