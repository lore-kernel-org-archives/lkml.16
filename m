Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAEE28D83E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513443; cv=none; b=cV/Dx7A7A0lDplzXtQv0e47TkDqKCNVuhmnmrbi1gLtJ7ubLNIAlekxGEII0dcFo0AHu/i1SsG8mxz0peCU/zDweO7/r0KC8ozxMzJvJeg74Tm+BD41yAuhxK1DQCu4UNh6b9D4wPG87Zly/Dg0s3c2sE+CvPRLJtGFgybS+44s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513443; c=relaxed/simple;
	bh=Ujjkg59SLEcKdjGn52vwG7qL/p3T6kELYMLWOGS0suQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpmUpsFEy3Klf+fhAK/PJnqM410zifUPDd9rhXOYD17QP1p3cZU9hThC1KgfA4wDA+P+NGltF+yRoKjCbaHuOWsNM2zGfoHjOx2b1cssfhLaltX/YfEtEWFK0duiBmIs+lPQWTUdsmQUANEGu0e06USZgdjCrP+iTdaM7CawDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=sFoih8ON; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="sFoih8ON"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72bb9725de1so325560a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513438; x=1746118238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mt9MAvn/ACFqWqqnCeEAAT+y/0Ha6ZnHJ12VSLv/cA=;
        b=sFoih8ONcN4IN3GdMO4JRPoLB8yo5SBYrZMMs8s+5l9SwX8x17+5P1sksV2XtfbLx/
         w+pf8DypEpdRxpWfsy4Gc4lrJsyLAoL8pNtvvuJO5m98f1nmWp4tPkAW5HKB6xrMqHXj
         I7Nv4O04qab0w+OyYriaX1VFCad8A0kLuUGfZoS57vCUxJTSpkWg5DxaQ8HrsnjBPCBY
         Cr4f8LtjHFRPe+ACuPr03TJo9aP39SM55oeWCBzbYdWbir4k8MoIaFlvG9sVrQZzrqmW
         n+A9LgzaTxhdDTIdGBB6eHQIJvFdKYu2kQnxTY+ZsSVTkn94KiBSuqsSQcOP5avgmojU
         /5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513438; x=1746118238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mt9MAvn/ACFqWqqnCeEAAT+y/0Ha6ZnHJ12VSLv/cA=;
        b=XOr3UUdt5l5IBXP9c4v1kWgUE9gsB2dXlb5BFTWSPoQly7fDE6qXtMF7hj6pOODF3+
         H/E43Gy13zgszo5VV2fS2+F2GRC5osr4pfunM1Ng4rsRMVmSy2Y6vMDHj999Uexsamw+
         QGevRvXroHy/IbU1OZjzrPoXXnvxhn9LDyJ0UCPJXaoxPRmIrjHkESW0g6RpTcNjV//b
         LLPlkQKTov7HVptJbX0xrogHXLyDT84XyNii3gd1oKFFvXbBaPniAdXGvSnnMWpimfTA
         ZRGU4KQoRD7uL35lRcYpStOBSgbkMAtfx38N3TV0fCLWJ8ESubRstnGqz7vnU09uHmTC
         41SA==
X-Gm-Message-State: AOJu0YzTcsAjx519NUicgyrKlETM/cTTk/LVGSY23ioLl4/gNTMZt7JG
	n4dGFQHwmHsWRqAhNpPpMg8QjzSXT2I3noQEu0Wb3Pq3U5Ool5KlcpIV3p3nV633DBpxmH+QiDU
	l
X-Gm-Gg: ASbGncu7t+YeHoaZggaOwTrjUY0RwdKPCFftIimFs6vNFPLcSBg1iz8Um5K26XaGPCK
	28vnea0YvO18r7l+zArA2L+eFWzgtd96TPzCVj4a+aMIkJ0zg+jTxSEEjCPRoMXVmskMTtptDZf
	9PlhHgPTmpW8ORsoX6H/m4YOl65yeI3T7/MKs1deFaACoEVzQyF4KIbrOWpRCxx1lMm2rCkQGw+
	suxUQzDv9K6gpkZ6f6M2lUexXFZV3cZ/Cb+AsFNogx3696GssW/JslUz5SfN5wMPyUQkuXx5jQR
	kFeS/z4aUYcBJTdVO1ymk9qp0pRRtkpV8Cw=
X-Google-Smtp-Source: AGHT+IHUBeiQqvCVK5Iwa41pbqkYZJ4oWj+0zn9TgmVdUvQdRn9eq8bIm2wn5C6jA0S/xoOjLt70Kg==
X-Received: by 2002:a05:6830:6086:b0:72b:943f:dda8 with SMTP id 46e09a7af769-73059def7bamr397812a34.26.1745513438494;
        Thu, 24 Apr 2025 09:50:38 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7304f37b12fsm297025a34.43.2025.04.24.09.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:38 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 05/23] ipmi_msghandler: Change the events lock to a mutex
Date: Thu, 24 Apr 2025 11:49:42 -0500
Message-ID: <20250424165020.627193-6-corey@minyard.net>
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

It can only be called from thread context now.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index fc939b5bb7f8..09e56e4141b7 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -528,7 +528,7 @@ struct ipmi_smi {
 	 * Events that were queues because no one was there to receive
 	 * them.
 	 */
-	spinlock_t       events_lock; /* For dealing with event stuff. */
+	struct mutex     events_mutex; /* For dealing with event stuff. */
 	struct list_head waiting_events;
 	unsigned int     waiting_events_count; /* How many events in queue? */
 	char             event_msg_printed;
@@ -1594,7 +1594,6 @@ EXPORT_SYMBOL(ipmi_set_maintenance_mode);
 
 int ipmi_set_gets_events(struct ipmi_user *user, bool val)
 {
-	unsigned long        flags;
 	struct ipmi_smi      *intf = user->intf;
 	struct ipmi_recv_msg *msg, *msg2;
 	struct list_head     msgs;
@@ -1606,7 +1605,7 @@ int ipmi_set_gets_events(struct ipmi_user *user, bool val)
 
 	INIT_LIST_HEAD(&msgs);
 
-	spin_lock_irqsave(&intf->events_lock, flags);
+	mutex_lock(&intf->events_mutex);
 	if (user->gets_events == val)
 		goto out;
 
@@ -1637,7 +1636,7 @@ int ipmi_set_gets_events(struct ipmi_user *user, bool val)
 	}
 
  out:
-	spin_unlock_irqrestore(&intf->events_lock, flags);
+	mutex_unlock(&intf->events_mutex);
 	release_ipmi_user(user, index);
 
 	return 0;
@@ -3605,7 +3604,7 @@ int ipmi_add_smi(struct module         *owner,
 	spin_lock_init(&intf->xmit_msgs_lock);
 	INIT_LIST_HEAD(&intf->xmit_msgs);
 	INIT_LIST_HEAD(&intf->hp_xmit_msgs);
-	spin_lock_init(&intf->events_lock);
+	mutex_init(&intf->events_mutex);
 	spin_lock_init(&intf->watch_lock);
 	atomic_set(&intf->event_waiters, 0);
 	intf->ticks_to_req_ev = IPMI_REQUEST_EV_TIME;
@@ -4391,7 +4390,6 @@ static int handle_read_event_rsp(struct ipmi_smi *intf,
 	struct list_head     msgs;
 	struct ipmi_user     *user;
 	int rv = 0, deliver_count = 0, index;
-	unsigned long        flags;
 
 	if (msg->rsp_size < 19) {
 		/* Message is too small to be an IPMB event. */
@@ -4406,7 +4404,7 @@ static int handle_read_event_rsp(struct ipmi_smi *intf,
 
 	INIT_LIST_HEAD(&msgs);
 
-	spin_lock_irqsave(&intf->events_lock, flags);
+	mutex_lock(&intf->events_mutex);
 
 	ipmi_inc_stat(intf, events);
 
@@ -4481,7 +4479,7 @@ static int handle_read_event_rsp(struct ipmi_smi *intf,
 	}
 
  out:
-	spin_unlock_irqrestore(&intf->events_lock, flags);
+	mutex_unlock(&intf->events_mutex);
 
 	return rv;
 }
-- 
2.43.0

