Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF8288CA1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513439; cv=none; b=ExuSpUqUBETJNuVDB1n76DQBltQP3uuonySmFEr+CKqcQ64PUD93uIJC7mF4ACAk5HFsAtUeyKMBRJe8xnFT6Ti5Ht4czmahsw9bCmBm9cU9U+b2fiVJQ+5h4DgNAtnKoec3f44bDx4asho5wfgCVu+gKacx+86g+L5eEDO6u8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513439; c=relaxed/simple;
	bh=KUifTsl6uYWPkVN/kw6Cc33Z7cdDir1H9t3W+GvVit0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MevJhWanKCDJ+BJ02hADQ7WdxtRO3sbN7g33QhVBQyehQBek7f2fJ5BulAyjuetI7uq+dlBXNECloj9Xl9rNraeiD742RNj7HFwxpRQLOdV0Ts4k1iXHjrg2MPf0s6A8f11ulzN9F7w6UR7mheBG5DnIipdpu4YT/RQPk7hwBM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=Hl33PXVT; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="Hl33PXVT"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-604ad6c4cf1so478046eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513436; x=1746118236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZCnXReemUxFfOn+5GlvXuuUi6hFy4IX7Q4LFZGGFqo=;
        b=Hl33PXVTvXnk+kJHgV9X1ViKtgO1fAUq8IkgQXoNb5PTzZQQQekAzQLumYxoiKPDe5
         +AaLqQe3wyv4ZfiaMJ4ATtcG7a9755LJpYMu3sx+m1Xqkye0ZZg2OqElfJrYAns6shOp
         Q64BKnpxm4IM3/QFiF7YI3GQUIH4HAcNk6FWVoY7jhgdMIgAmsEQ1VqBpCEumYDuBYFK
         J9eyE7o/HQoavBVdCSQyOpkzcuG4dWvVUPgOAniV6QrpIso+fMSe+DzJfn+a9PhcMnPn
         WNFSKIIDfA7xt1466Y15j8OaVppRbL1iOqEuPChQHtTp/LqeGgZlzE1VJdhG9aJSks1S
         3pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513436; x=1746118236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZCnXReemUxFfOn+5GlvXuuUi6hFy4IX7Q4LFZGGFqo=;
        b=KQ3Kfm8rigtYMmsEbYyGi8M0RGQ02PDWmUpAn95SctP0z/pvtp4maCyexUH0N91HTL
         kXziDTEukPFcqKzNWnD8ZUctvUK0kRC+RAQrm+OZGynhHP2NQld3RwoXZkLxTiXe2g3Q
         Ri7anGjrsI5fouUxq5OV41uLDeRNUYnHOABZPggtRu78p0MAT9VgSZjXgqFuCWxLcRxH
         Ij5Wz5KNu7cI1UrpnQ4ZkG9uCykRZeasVuUUeStrnarW4dnA/7mLllnJpU7ytRl1mrAp
         XDEs1LJqN7CQ6AtoXnADWO7Pz1vnMxk7sv1QMBTT63dNeP3sGO0bBlW+xVDgibPBWSw7
         Ztzw==
X-Gm-Message-State: AOJu0YyCRk2fd+hWkCy7kpoZ/SoNAayOlvYMTY58BBlb/kga06l2EOfr
	tG3OHtHnYbnzDrkvEtM5q0JYlLK1KUV32VdXap1Vc9MajiX1gtBxZ0c1lc9a234yBbJqV1STrid
	d
X-Gm-Gg: ASbGncsDBfFi+p63/89yDjoabqWZQGNgNiaLC2GN/lG2xb1ijMVY88AD49ZvNOP14N4
	M2kxkcfwGUoA7VOiobkf8+QBubIbhOSNF4w65CLPjo8BaG0vftR3xDDV1eQGequtjuV/5hgdHQv
	fLeWXiHRKWLoCs3quvAhRePbnJDPY0q4l0BpYr4Wb0miF3J4cyOHpnxrI4lp8I5xxaExnp3tqWG
	EeEAqjUpYXcb/F9agpNney15vxFhxPA8tLoQVCd7XRbiL9oHf3yMT3gTm9xzGWLchxLkQ0Vldkf
	EjlJ2+2KYD+ceRhsX4Ncs2q7dQ7cp+w5tqQ=
X-Google-Smtp-Source: AGHT+IGc6CxvVncjGX9yYC21KFrqVXSC+mtv5R2uoUCopPdPsclItA9g8NY1N3XeTKAv8V27mY7Pfw==
X-Received: by 2002:a05:6820:1e04:b0:603:f777:980a with SMTP id 006d021491bc7-6064fd81116mr123021eaf.7.1745513436253;
        Thu, 24 Apr 2025 09:50:36 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-60646863e7dsm324897eaf.6.2025.04.24.09.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:34 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 04/23] ipmi:msghandler: Deliver user messages in a work queue
Date: Thu, 24 Apr 2025 11:49:41 -0500
Message-ID: <20250424165020.627193-5-corey@minyard.net>
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

This simplifies the locking and lets us remove some weird event
handling code.  deliver_response() and friends can now be called
from an atomic context.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 41 ++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index e08ec9918a32..fc939b5bb7f8 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -495,6 +495,12 @@ struct ipmi_smi {
 	struct seq_table seq_table[IPMI_IPMB_NUM_SEQ];
 	int curr_seq;
 
+	/*
+	 * Messages queued for deliver to the user.
+	 */
+	struct mutex user_msgs_mutex;
+	struct list_head user_msgs;
+
 	/*
 	 * Messages queued for delivery.  If delivery fails (out of memory
 	 * for instance), They will stay in here to be processed later in a
@@ -525,7 +531,6 @@ struct ipmi_smi {
 	spinlock_t       events_lock; /* For dealing with event stuff. */
 	struct list_head waiting_events;
 	unsigned int     waiting_events_count; /* How many events in queue? */
-	char             delivering_events;
 	char             event_msg_printed;
 
 	/* How many users are waiting for events? */
@@ -945,9 +950,13 @@ static int deliver_response(struct ipmi_smi *intf, struct ipmi_recv_msg *msg)
 		struct ipmi_user *user = acquire_ipmi_user(msg->user, &index);
 
 		if (user) {
-			atomic_dec(&user->nr_msgs);
-			user->handler->ipmi_recv_hndl(msg, user->handler_data);
+			/* Deliver it in smi_work. */
+			kref_get(&user->refcount);
+			mutex_lock(&intf->user_msgs_mutex);
+			list_add_tail(&msg->link, &intf->user_msgs);
+			mutex_unlock(&intf->user_msgs_mutex);
 			release_ipmi_user(user, index);
+			queue_work(system_bh_wq, &intf->smi_work);
 		} else {
 			/* User went away, give up. */
 			ipmi_free_recv_msg(msg);
@@ -1610,13 +1619,6 @@ int ipmi_set_gets_events(struct ipmi_user *user, bool val)
 		atomic_dec(&intf->event_waiters);
 	}
 
-	if (intf->delivering_events)
-		/*
-		 * Another thread is delivering events for this, so
-		 * let it handle any new events.
-		 */
-		goto out;
-
 	/* Deliver any queued events. */
 	while (user->gets_events && !list_empty(&intf->waiting_events)) {
 		list_for_each_entry_safe(msg, msg2, &intf->waiting_events, link)
@@ -1627,17 +1629,11 @@ int ipmi_set_gets_events(struct ipmi_user *user, bool val)
 			intf->event_msg_printed = 0;
 		}
 
-		intf->delivering_events = 1;
-		spin_unlock_irqrestore(&intf->events_lock, flags);
-
 		list_for_each_entry_safe(msg, msg2, &msgs, link) {
 			msg->user = user;
 			kref_get(&user->refcount);
 			deliver_local_response(intf, msg);
 		}
-
-		spin_lock_irqsave(&intf->events_lock, flags);
-		intf->delivering_events = 0;
 	}
 
  out:
@@ -3590,6 +3586,8 @@ int ipmi_add_smi(struct module         *owner,
 	}
 	if (slave_addr != 0)
 		intf->addrinfo[0].address = slave_addr;
+	INIT_LIST_HEAD(&intf->user_msgs);
+	mutex_init(&intf->user_msgs_mutex);
 	INIT_LIST_HEAD(&intf->users);
 	atomic_set(&intf->nr_users, 0);
 	intf->handlers = handlers;
@@ -4814,6 +4812,7 @@ static void smi_work(struct work_struct *t)
 	struct ipmi_smi *intf = from_work(intf, t, smi_work);
 	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	struct ipmi_smi_msg *newmsg = NULL;
+	struct ipmi_recv_msg *msg, *msg2;
 
 	/*
 	 * Start the next message if available.
@@ -4851,6 +4850,16 @@ static void smi_work(struct work_struct *t)
 	rcu_read_unlock();
 
 	handle_new_recv_msgs(intf);
+
+	mutex_lock(&intf->user_msgs_mutex);
+	list_for_each_entry_safe(msg, msg2, &intf->user_msgs, link) {
+		struct ipmi_user *user = msg->user;
+
+		atomic_dec(&user->nr_msgs);
+		user->handler->ipmi_recv_hndl(msg, user->handler_data);
+		kref_put(&user->refcount, free_user);
+	}
+	mutex_unlock(&intf->user_msgs_mutex);
 }
 
 /* Handle a new message from the lower layer. */
-- 
2.43.0

