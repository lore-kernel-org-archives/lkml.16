Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ABC28FFD5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513455; cv=none; b=mHMa311qSBVlrxMP6VXts7aCyhmg7yVG6sIV39mpQvuvOL9JLS1ADzEawSNzAtJWoX8U8tkkG8Tyx0RQ/l/nlFcutvin5OjWnT6RCA7YMnpbKTH+wfqfgrXYn2O/TtPRfP6RlZzOOYHJBZ+E0ZrFXOiSu2a1sw/Qgg64hbBN8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513455; c=relaxed/simple;
	bh=ev2+REOh6JLHQHzx1pYRwJ6ml+j1MT8Bi19AvQ0dFFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOkzI5AQobLwl9l8Dokn2WcOEiKjvbWi73uFEwjGaBw4iHQsFlESEauIiu/qedbCRVHZeItnfIPL9zgtSZ8naND/5KYP5S8n5RSc0AJh+jpue1dv9rxtmS5ICpvwv33ducvc3KGttanHY6J6q4h6vCKOGHRV/pCtOqcabIHRKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=U6YETpto; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="U6YETpto"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fe83c8cbdbso432984b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513452; x=1746118252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34wiUQ0AMJfn+ReOObF+ZTxikTeHpyAO2TM1tGanBH4=;
        b=U6YETptoca6tPk02lp6sBNlYHDOjLyL7YmVejd+N1JcGHttLxkKltDwKyGuZBjpbJv
         zpWW4YmJfw4qF6bjUz6Bh20F+x8WqTo/o82VlkhiITQPegGk6h66aXdK+y9O3cOL43ey
         hXYOKnhaehPhfMTcv8vpG+PPi1SK4uzYAJ0MS1osqobNBGfTbuPOymFYlHM3GGJGhiA2
         xm6YC66xir2yu3/xJ2vNQYdqasuIN6dQ7xIOKp2OMS9MUgzHZ6y6nW5lL43UvSnsV9jj
         HAsO6Gb8TysTpBNTVca36sH+sO/DjBnJus0CeNFW7uXE42IYRoZ4XmZQYiFLJwSSbzxF
         iE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513452; x=1746118252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34wiUQ0AMJfn+ReOObF+ZTxikTeHpyAO2TM1tGanBH4=;
        b=f0y/zTVmyeM/4elg8zXv/wtuxmsFvArkB6m/2ij3ZV7Hd3cHObYdX0Hsbfq6WL6Gc3
         VV46DqwqGdX+lE9MUy4dm3G7WAbTTam3tVg5b3jdsyqntCiLPDqYxvcqtn1N9YgVwmxI
         KFzB1kcEJJYCqGA0PIBpnu+aCevK9NBVRc+FjHC5jrJx+MOtUzxLSQz2hGf/x/hiFE7m
         0iSXJ7JRJtIdF8GibJPtBBXmZjsJU6VOpMIxG84rtwwSx0sn8yRdSL7K3H9MD2//UPl/
         02V+jEnwzWq4rA1WAr+EC//F5hVIXe8F9vmjA8gir0JdFtfyyYxrWiNf1qmCVsfLtCTj
         NrwA==
X-Gm-Message-State: AOJu0YyrMypqBh3pcidB5eC+DgPhXHnhkL2/57HGuPjLn1oZf2fyGkvi
	NTqRJdtOZJLAOwSs1R4vJaySINezCOzg8nK/SxuyPGq0UQZ3EkJwT1zncyB4rpvAi2uMRzNDqzr
	/
X-Gm-Gg: ASbGncs+z/ICCaJ/5jC4RqYzbEDCLAzSjwoaE3eEh68MzU/zoD0MBO4hmEMlXxmF01n
	K87ZKO9Kr+ugh/MVEjgr2Q5ggXAX/Q3MBNhcb+bDVyh+07jHrJ5Fb1Vm0NXk3qSoZcaKeOINQZ6
	4mkHDrCrnF5vOG+rYHO7P5/42wP2kbU8tkMoG0g8jc+uT3Oj6ebawtTMRIuYlpPzrAsMuH54LaC
	kke/60wTem+BCza3IZEJ3ISUqM3YubCLd2G4PpV87O5stnz+wyLiex6XdtkvLyAJDjvvBMKJdzb
	ERptU16zsAcSynZUiFXjVoD//B/kj/RlxQ8=
X-Google-Smtp-Source: AGHT+IEHlDIf7ClF9R8piHibOkiklRbxXeeireMCw2PHSCOxkSCPjQvlyS1JVQbFyT1Sumg6jwuxWw==
X-Received: by 2002:a05:6808:3308:b0:400:a250:9819 with SMTP id 5614622812f47-401f1180586mr101396b6e.12.1745513451973;
        Thu, 24 Apr 2025 09:50:51 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec8e2808sm312067b6e.21.2025.04.24.09.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:51 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 14/23] ipmi:msghandler: Don't check for shutdown when returning responses
Date: Thu, 24 Apr 2025 11:49:51 -0500
Message-ID: <20250424165020.627193-15-corey@minyard.net>
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

The lower level interface shouldn't attempt to unregister if it has a
callback in the pending queue.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 34 ++++++++++-------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index edc53c22ca84..74a84eeeed9c 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -3893,17 +3893,12 @@ static int handle_ipmb_get_msg_cmd(struct ipmi_smi *intf,
 		dev_dbg(intf->si_dev, "Invalid command: %*ph\n",
 			msg->data_size, msg->data);
 
-		mutex_lock(&ipmi_interfaces_mutex);
-		if (!intf->in_shutdown) {
-			smi_send(intf, intf->handlers, msg, 0);
-			/*
-			 * We used the message, so return the value
-			 * that causes it to not be freed or
-			 * queued.
-			 */
-			rv = -1;
-		}
-		mutex_unlock(&ipmi_interfaces_mutex);
+		smi_send(intf, intf->handlers, msg, 0);
+		/*
+		 * We used the message, so return the value that
+		 * causes it to not be freed or queued.
+		 */
+		rv = -1;
 	} else {
 		recv_msg = ipmi_alloc_recv_msg();
 		if (!recv_msg) {
@@ -3984,17 +3979,12 @@ static int handle_ipmb_direct_rcv_cmd(struct ipmi_smi *intf,
 		msg->data[4] = IPMI_INVALID_CMD_COMPLETION_CODE;
 		msg->data_size = 5;
 
-		mutex_lock(&ipmi_interfaces_mutex);
-		if (!intf->in_shutdown) {
-			smi_send(intf, intf->handlers, msg, 0);
-			/*
-			 * We used the message, so return the value
-			 * that causes it to not be freed or
-			 * queued.
-			 */
-			rv = -1;
-		}
-		mutex_unlock(&ipmi_interfaces_mutex);
+		smi_send(intf, intf->handlers, msg, 0);
+		/*
+		 * We used the message, so return the value that
+		 * causes it to not be freed or queued.
+		 */
+		rv = -1;
 	} else {
 		recv_msg = ipmi_alloc_recv_msg();
 		if (!recv_msg) {
-- 
2.43.0

