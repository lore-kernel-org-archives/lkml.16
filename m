Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E50292935
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513472; cv=none; b=sj4y2n+zAjfMH79zCmzmKr148YnDKb4yTLvJzfqytejGjQLMvTrXbZPfiZ8B3cQLVNicSeUjUcbq9v+BNSa7m0qOTWj8LASxKvda2HcdWFrjQGqdq/LlKpQyIDEW+YAvvgXqVmxb2fhnsV7GVHsXkaCS4UOQqBP5DuNLKMTtwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513472; c=relaxed/simple;
	bh=iQPTdaZWNg+8X577i1OFWCdJ6F6xxtIPE7Njwp4JyD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIn+REjGcrtIn3bIEMBSG4GaVwACQ/F5hSIlQ+xOFYIjSF/KGltzWNba7NXqORmhi054t6QJ9uapZJJVpWEhKgTdDjtMEGpdvPuPNf//wFJFIh5cwXbnxS+uJvG9V/8E0lT1NRehhZ5TVILbCTEHJC/4WxQZg/6Jjm0HRn7SPmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=SAOuPtHX; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="SAOuPtHX"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3fe83c8cbdbso433104b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513468; x=1746118268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmKp2gCwW8Wb1KK3JuJ2jc0+NeIFs1EM3vsXyT2a46o=;
        b=SAOuPtHXuEftEts3cLdNiuSrLM0P3bwuMkNrdCJkqwXzcJQ12dXW6+n0VG0zztJPWm
         c4azEl6k34dUVEgXu8nIaaacYlZekVbpywp+UHvyBgcCMnbPlcBic4cNWhIYW5JbTbSM
         YoxGZM7cB8EwEQuG4g01vRyIyQ3zaMiITA+Q5rjMwzp47SKlekyVtbtH7Sxa/JWzANxn
         6G5a9u7tBuF5m1vGGts9jMQE5a+qLSD4NNTK/BdYYaUdcKpzQy2aRWFDSLPPnKnIfV9S
         pqFhJ56fk5I7Igajd7m8BKUtvxX76hTrAJB6Fth2HQFfbdKCERkKIKJcHycQdUZ0Q4M5
         tk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513468; x=1746118268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmKp2gCwW8Wb1KK3JuJ2jc0+NeIFs1EM3vsXyT2a46o=;
        b=BZC2QPNG/NhJYI2uMIAaVXDJ/AknnpkKFyxNHlkNzC/sE11JDestTEVsuQP6RMok57
         JKnyXnrpX0BHXUIcqex/p6hMLWYfCgXbJYMCzDT6HaA8NDp89oMS32IuOZZO2ut5j8fj
         PF4lUBD/hYLPR4eahbeiBb98y9BqSCPmA1OnpZ4Kvy28HhYLLg4T7O+k20jxcM0f5lPN
         MW0pCZgsZOU665Q6se1wReq7VI3+uN4Y1NVOjbtEoIaAFGO0Zn3JjPbf3URhW0M9jkKq
         PJLvuPv7Ba+kvdYGVNuvFLxCIojNFphdqVyI6Nar9p8ilTEQo2ANI02urltiPvOQk7bC
         3SoA==
X-Gm-Message-State: AOJu0YxWoScdAj+jT35xy9cqHxL7bclEQrLIl3Xi8RIeAbxzDE48APcD
	c/o1W2dPhNZritnprFXxF8b/I0F1oHvjifDtziWPbMKjuNee1TTP6XrWWh1SLvF/2ogTM/f2rfY
	7
X-Gm-Gg: ASbGncs0OvJ02qmRhafWv/xgMlPZ7LG8a5q/SqXvpy7BquT8kporwQ/xk6JUWtSLpdc
	SCjnsWFTxhDqap0o1TiTZf9a6mkDjvo849vpff3jl20ia8ti2/j9kKvowYH356yQO782Rn03IJo
	LH1EWHRFIdRX0uciT/uceOO198F01kzgHMyaWICpxQZx5MC0PJJ5Vo0B5a7q9p0DPx96B91RWSQ
	bF3Xb3fkAFCVnzFMbgoT1m9qG2pE8HugDjf2Qh2CGH6LTeEnlOSnvzyHfD5d98lT8iW4bPfTn2q
	1khSG0WMR+V8+HWOyAbPplK20KtWNf5FbPw=
X-Google-Smtp-Source: AGHT+IF5B0qmEp1jWeDZ0WSSiqcMbFmxpjThGtl9WBQObpHvxiMrF90DVkEM+mFolA8xXV0TFK/4Fg==
X-Received: by 2002:a05:6808:398d:b0:400:b701:33ce with SMTP id 5614622812f47-401f118fe02mr109617b6e.13.1745513468479;
        Thu, 24 Apr 2025 09:51:08 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6064690dd44sm328697eaf.28.2025.04.24.09.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:51:07 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 22/23] ipmi:msghandler: Export and fix panic messaging capability
Date: Thu, 24 Apr 2025 11:49:59 -0500
Message-ID: <20250424165020.627193-23-corey@minyard.net>
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

Don't have the other users that do things at panic time (the watchdog)
do all this themselves, provide a function to do it.

Also, with the new design where most stuff happens at thread context,
a few things needed to be fixed to avoid doing locking in a panic
context.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 50 ++++++++++++++++++-----------
 include/linux/ipmi.h                | 10 ++++++
 2 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 938c566624d9..ece6aa95fbb5 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -2284,6 +2284,7 @@ static int i_ipmi_request(struct ipmi_user     *user,
 {
 	struct ipmi_smi_msg *smi_msg;
 	struct ipmi_recv_msg *recv_msg;
+	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	int rv = 0;
 
 	if (user) {
@@ -2317,7 +2318,8 @@ static int i_ipmi_request(struct ipmi_user     *user,
 		}
 	}
 
-	mutex_lock(&intf->users_mutex);
+	if (!run_to_completion)
+		mutex_lock(&intf->users_mutex);
 	if (intf->in_shutdown) {
 		rv = -ENODEV;
 		goto out_err;
@@ -2363,7 +2365,8 @@ static int i_ipmi_request(struct ipmi_user     *user,
 
 		smi_send(intf, intf->handlers, smi_msg, priority);
 	}
-	mutex_unlock(&intf->users_mutex);
+	if (!run_to_completion)
+		mutex_unlock(&intf->users_mutex);
 
 out:
 	if (rv && user)
@@ -4559,7 +4562,7 @@ static int handle_one_recv_msg(struct ipmi_smi *intf,
 	    && (msg->data[1] == IPMI_SEND_MSG_CMD)
 	    && (msg->user_data == NULL)) {
 
-		if (intf->in_shutdown)
+		if (intf->in_shutdown || intf->run_to_completion)
 			goto out;
 
 		/*
@@ -4631,6 +4634,9 @@ static int handle_one_recv_msg(struct ipmi_smi *intf,
 		 */
 		struct ipmi_recv_msg *recv_msg;
 
+		if (intf->run_to_completion)
+			goto out;
+
 		chan = msg->data[2] & 0x0f;
 		if (chan >= IPMI_MAX_CHANNELS)
 			/* Invalid channel number */
@@ -4653,6 +4659,9 @@ static int handle_one_recv_msg(struct ipmi_smi *intf,
 		   && (msg->rsp[1] == IPMI_GET_MSG_CMD)) {
 		struct ipmi_channel   *chans;
 
+		if (intf->run_to_completion)
+			goto out;
+
 		/* It's from the receive queue. */
 		chan = msg->rsp[3] & 0xf;
 		if (chan >= IPMI_MAX_CHANNELS) {
@@ -4727,6 +4736,9 @@ static int handle_one_recv_msg(struct ipmi_smi *intf,
 	} else if ((msg->rsp[0] == ((IPMI_NETFN_APP_REQUEST|1) << 2))
 		   && (msg->rsp[1] == IPMI_READ_EVENT_MSG_BUFFER_CMD)) {
 		/* It's an asynchronous event. */
+		if (intf->run_to_completion)
+			goto out;
+
 		requeue = handle_read_event_rsp(intf, msg);
 	} else {
 		/* It's a response from the local BMC. */
@@ -4855,15 +4867,6 @@ static void smi_work(struct work_struct *t)
 
 		list_del(&msg->link);
 
-		/*
-		 * I would like for this check (and user->destroyed)
-		 * to go away, but it's possible that an interface is
-		 * processing a message that belongs to the user while
-		 * the user is being deleted.  When that response
-		 * comes back, it could be queued after the user is
-		 * destroyed.  This is simpler than handling it in the
-		 * interface.
-		 */
 		if (refcount_read(&user->destroyed) == 0) {
 			ipmi_free_recv_msg(msg);
 		} else {
@@ -5222,9 +5225,9 @@ static void dummy_recv_done_handler(struct ipmi_recv_msg *msg)
 /*
  * Inside a panic, send a message and wait for a response.
  */
-static void ipmi_panic_request_and_wait(struct ipmi_smi *intf,
-					struct ipmi_addr *addr,
-					struct kernel_ipmi_msg *msg)
+static void _ipmi_panic_request_and_wait(struct ipmi_smi *intf,
+					 struct ipmi_addr *addr,
+					 struct kernel_ipmi_msg *msg)
 {
 	struct ipmi_smi_msg  smi_msg;
 	struct ipmi_recv_msg recv_msg;
@@ -5254,6 +5257,15 @@ static void ipmi_panic_request_and_wait(struct ipmi_smi *intf,
 		ipmi_poll(intf);
 }
 
+void ipmi_panic_request_and_wait(struct ipmi_user *user,
+				 struct ipmi_addr *addr,
+				 struct kernel_ipmi_msg *msg)
+{
+	user->intf->run_to_completion = 1;
+	_ipmi_panic_request_and_wait(user->intf, addr, msg);
+}
+EXPORT_SYMBOL(ipmi_panic_request_and_wait);
+
 static void event_receiver_fetcher(struct ipmi_smi *intf,
 				   struct ipmi_recv_msg *msg)
 {
@@ -5322,7 +5334,7 @@ static void send_panic_events(struct ipmi_smi *intf, char *str)
 	}
 
 	/* Send the event announcing the panic. */
-	ipmi_panic_request_and_wait(intf, &addr, &msg);
+	_ipmi_panic_request_and_wait(intf, &addr, &msg);
 
 	/*
 	 * On every interface, dump a bunch of OEM event holding the
@@ -5358,7 +5370,7 @@ static void send_panic_events(struct ipmi_smi *intf, char *str)
 	msg.data = NULL;
 	msg.data_len = 0;
 	intf->null_user_handler = device_id_fetcher;
-	ipmi_panic_request_and_wait(intf, &addr, &msg);
+	_ipmi_panic_request_and_wait(intf, &addr, &msg);
 
 	if (intf->local_event_generator) {
 		/* Request the event receiver from the local MC. */
@@ -5367,7 +5379,7 @@ static void send_panic_events(struct ipmi_smi *intf, char *str)
 		msg.data = NULL;
 		msg.data_len = 0;
 		intf->null_user_handler = event_receiver_fetcher;
-		ipmi_panic_request_and_wait(intf, &addr, &msg);
+		_ipmi_panic_request_and_wait(intf, &addr, &msg);
 	}
 	intf->null_user_handler = NULL;
 
@@ -5419,7 +5431,7 @@ static void send_panic_events(struct ipmi_smi *intf, char *str)
 		memcpy_and_pad(data+5, 11, p, size, '\0');
 		p += size;
 
-		ipmi_panic_request_and_wait(intf, &addr, &msg);
+		_ipmi_panic_request_and_wait(intf, &addr, &msg);
 	}
 }
 
diff --git a/include/linux/ipmi.h b/include/linux/ipmi.h
index 27cd5980bb27..7da6602eab71 100644
--- a/include/linux/ipmi.h
+++ b/include/linux/ipmi.h
@@ -344,4 +344,14 @@ extern int ipmi_get_smi_info(int if_num, struct ipmi_smi_info *data);
 /* Helper function for computing the IPMB checksum of some data. */
 unsigned char ipmb_checksum(unsigned char *data, int size);
 
+/*
+ * For things that must send messages at panic time, like the IPMI watchdog
+ * driver that extends the reset time on a panic, use this to send messages
+ * from panic context.  Note that this puts the driver into a mode that
+ * only works at panic time, so only use it then.
+ */
+void ipmi_panic_request_and_wait(struct ipmi_user *user,
+				 struct ipmi_addr *addr,
+				 struct kernel_ipmi_msg *msg);
+
 #endif /* __LINUX_IPMI_H */
-- 
2.43.0

