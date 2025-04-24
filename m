Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF9628D85D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513445; cv=none; b=lZQiGtc00pLc2MSa9Mbm45D0VCs0UVQo7fOydb/sABlsoGXyXTyvLesUgbMbGNLVbB04u064uVEHNksgN80qaV9rG3y8QLCBJOsar1fH4k34DKLMdr4JW43aCapERKgUzfcFwGWPwbFlq3YZ80okrlCUBWG/eB2Dg2x0bO1KRjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513445; c=relaxed/simple;
	bh=LuMR+H1QwXKPEi9lGgEokcwglpP+bKoRaOXMJ8W3UrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnVnHq/MoJsEL/LYQSeeiHFFDCnpWC+1BA+hZAE9FzsfwFJKfVsGPUbhI6fmP0EpAJJ3HT55KpAVIksSvwcye+thsBjA4iU2U1NxUQsv8neF0C7F+jocL3aJwm5c38l8pFVgKX/mOTjL8vUEaMqKZWoOQwEG/Qtv0sQXWlVXa+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=mA+zQ8ji; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="mA+zQ8ji"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so12704476d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513442; x=1746118242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGfTJWj47CpXpT8PeT3U1Li99hkB5HE31d++OSuIbAk=;
        b=mA+zQ8jibdXbTTq2T/YwSjPcK8iwwA4QWmOdgbVPeW5bE+z85Chyb19MxGedehmg+X
         /IK55zBK254nf3eoJyLYWfrhOOZIC3KD6kba5sZVOlSXdb6otq9cKKuOd7RdcL+ia1WA
         cgjgTyrOFLhb22ODzMvq67eLR4AE5JH6QDRVJmjmKwLNxZKULUKJnqQp3kqYJGN73ZS0
         0V6+AyR7LQJ3+rwxR44x0uZ1kG0ZoinJ7OevvfVDbAGd6LKXy5GZ8r798XQuoJKyjlx3
         kHCvY/vCK7r3zmqiATUqNK6DkSJMmBfDAeXIx4R6g2TyDhtac+5pbgQ9pKS1EanPEkja
         trOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513442; x=1746118242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGfTJWj47CpXpT8PeT3U1Li99hkB5HE31d++OSuIbAk=;
        b=HrgeWpRVDwD+oRlw9R8iEeZBp4LwM1gFjSoxcUkfP1UFd2Mll0R3+NXXTURNiimJfU
         nsQTm18JvWjE9Sil4bYC6kLEFdvDYoWjrHe8X8PAIc0oku2kg4OIcpPHLXj9VAxjoi5G
         DU3jr+kdRWGIwxVBW76ka1acLUdz8zq9bUbuCK31uTQEzE/xvL5tcTUXYWw0e2S7d2sb
         ZWOutU7t3lLj/DO0/iKb95U6Rn65PN2vy2GbsaqYSzssOZFG+n0/trO8L/EVGW/1Udu4
         tYSM2r5Lm7gPG10vC5QBjPY0KbVH9/9dYkbRXRyBVTnk0FRKUkYVtPEQfViiGHsXpCP6
         TDpQ==
X-Gm-Message-State: AOJu0YzKo+hHwQVytDhdwJ7iiDL2tKukNU47r38oLfFr7OqwTDV6S8N8
	CF1ZMXscLKR7Sni1Q7kzvcRcfGriPwIDZIz7C1XOjfiR64gI/AGqetJ76cSFRcC21UjHA/zfcnB
	W
X-Gm-Gg: ASbGncuzlZLai01GWFzS69p1yjKEk846KLXsqA4Uh+GbTJSX4dg1urlB/XoQ/AJ1I2o
	MoqYThIJF6d7cAD+HrgSWA9HGSmHTpMLP2DySKCTM1n461zJrhWXKUbvmmqgDOH6Vu2fK+0IWSb
	eRLKCeV19ZxAShgurJ30B9JML7BqlZ6Na9CkO9XbXsbPVyTJRW0owt5Nrfg+sFVfQncifDSJ1Rf
	w5tS982PCCfELAeJtK6FolufmWypnRF0iQFv4wPO+pU7mElf9h7cq4GYltc3WmYrTSSATcWRI+W
	omvRbGi52u6vQJq6R9tN7Fu3o2wrC0Gu5Ig=
X-Google-Smtp-Source: AGHT+IFHp8n/VJuzX+UYnhpiqIQJQ9HAOKQP+infmIEinGOQzRk0Z/D3wAFlyPekPIZHnbzLJIOztA==
X-Received: by 2002:a05:6808:6c85:b0:401:e5d6:31cd with SMTP id 5614622812f47-401eb23932fmr2137283b6e.3.1745513430870;
        Thu, 24 Apr 2025 09:50:30 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec8cce07sm311510b6e.20.2025.04.24.09.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:30 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 02/23] ipmi:msghandler: Rename recv_work to smi_work
Date: Thu, 24 Apr 2025 11:49:39 -0500
Message-ID: <20250424165020.627193-3-corey@minyard.net>
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

It handles both receive and transmit functions, make the name generic.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 77f0f41f2e3d..22813b1598b0 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -41,7 +41,7 @@
 
 static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
 static int ipmi_init_msghandler(void);
-static void smi_recv_work(struct work_struct *t);
+static void smi_work(struct work_struct *t);
 static void handle_new_recv_msgs(struct ipmi_smi *intf);
 static void need_waiter(struct ipmi_smi *intf);
 static int handle_one_recv_msg(struct ipmi_smi *intf,
@@ -504,7 +504,7 @@ struct ipmi_smi {
 	spinlock_t       waiting_rcv_msgs_lock;
 	struct list_head waiting_rcv_msgs;
 	atomic_t	 watchdog_pretimeouts_to_deliver;
-	struct work_struct recv_work;
+	struct work_struct smi_work;
 
 	spinlock_t             xmit_msgs_lock;
 	struct list_head       xmit_msgs;
@@ -704,7 +704,7 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
 	struct cmd_rcvr  *rcvr, *rcvr2;
 	struct list_head list;
 
-	cancel_work_sync(&intf->recv_work);
+	cancel_work_sync(&intf->smi_work);
 
 	free_smi_msg_list(&intf->waiting_rcv_msgs);
 	free_recv_msg_list(&intf->waiting_events);
@@ -3602,7 +3602,7 @@ int ipmi_add_smi(struct module         *owner,
 	intf->curr_seq = 0;
 	spin_lock_init(&intf->waiting_rcv_msgs_lock);
 	INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
-	INIT_WORK(&intf->recv_work, smi_recv_work);
+	INIT_WORK(&intf->smi_work, smi_work);
 	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
 	spin_lock_init(&intf->xmit_msgs_lock);
 	INIT_LIST_HEAD(&intf->xmit_msgs);
@@ -4808,10 +4808,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
 	}
 }
 
-static void smi_recv_work(struct work_struct *t)
+static void smi_work(struct work_struct *t)
 {
 	unsigned long flags = 0; /* keep us warning-free. */
-	struct ipmi_smi *intf = from_work(intf, t, recv_work);
+	struct ipmi_smi *intf = from_work(intf, t, smi_work);
 	int run_to_completion = READ_ONCE(intf->run_to_completion);
 	struct ipmi_smi_msg *newmsg = NULL;
 
@@ -4883,9 +4883,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
 		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
 
 	if (run_to_completion)
-		smi_recv_work(&intf->recv_work);
+		smi_work(&intf->smi_work);
 	else
-		queue_work(system_bh_wq, &intf->recv_work);
+		queue_work(system_bh_wq, &intf->smi_work);
 }
 EXPORT_SYMBOL(ipmi_smi_msg_received);
 
@@ -4895,7 +4895,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
 		return;
 
 	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
-	queue_work(system_bh_wq, &intf->recv_work);
+	queue_work(system_bh_wq, &intf->smi_work);
 }
 EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
 
@@ -5064,7 +5064,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
 				       flags);
 	}
 
-	queue_work(system_bh_wq, &intf->recv_work);
+	queue_work(system_bh_wq, &intf->smi_work);
 
 	return need_timer;
 }
-- 
2.43.0

