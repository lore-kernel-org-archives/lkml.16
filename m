Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A04628D836
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513443; cv=none; b=D444Dr1yBWFdmScUxXYzNn0OzGbl3uxY9Okoz+cNrMKZ+7MFMlC4bhDAaGsUtQA09vg41JVV9lvkyzkb9FS1kZ2gSHRpUgvT6hjNnYXuFvOtvUeiPQe2jk3uBpdW4NMlKCrjQHTMGI8CAX59lfN/M9MPJn8+lDPHXAgYS+xD+yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513443; c=relaxed/simple;
	bh=++osSHXvTmPVe9md2OTag6QoCHA/mLsZUu+Mt6oJKxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jiDceogrOltSQ0qvWo5mPiO/jTDAS892Esdj9yBmtbUpZ5P65X2gXlOrrD3YDfB2aSD+1TLHYt3MVFaxiTNJoMElO/t4XLELzpTdmb7chUt+pd+E00ajGNd8w1W2WN0hq2Ndb4U84Rzq+s9kDX2V0NX+p0ZeRjw+GWHEgR3CKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=Ec4vgdbq; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="Ec4vgdbq"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72bc3987a05so758702a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513440; x=1746118240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GnhQTtfP1kbpsamg0T3MymU+hfTFmTPAkbgLQlgvws=;
        b=Ec4vgdbqbf3zsHiX3LEXgJ0fEQAZ+iual/BUNJoz7vzwTZbpTy2pdelsGfHEByQ29/
         7G9+Gn1r77yyFpFa4b8/sLnrPYyU6LObcir6F7AFboGJHySQRdJeMzg9p4QwwtLOj3gx
         tNR4hz2Sk79GQJVm7DgdmhWvu+u7sUgxiOyXRb2DUl+pTkWps5me1GdxMyfClxvrKFlB
         a+bcaqPYsc1Jyc4SkGgU9z25IgW8umn9bYeNIF+QswJviYV3L9pd1nMq/tWWkOlp+3Wl
         QakdGQJaz8K9OFqg3O4JM/R3g1+k1XE9kodJHtoicr/5K0SLgHbAIjqgQ/m6BsAMcJbr
         He/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513440; x=1746118240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GnhQTtfP1kbpsamg0T3MymU+hfTFmTPAkbgLQlgvws=;
        b=N/tllpayZAOY+W8BOMMicZ6EphSwmG8kA5afBJ+Nl3z15ufwR72YU8CApwKHHeiBGw
         xMnibZGuyWKVRH00pYzpBmIwrUu03JUo5UGsMTZHRF5CnDH1IYGfARQkOJGk0bKUcVMR
         tsKOZJMvolK1P1jcbnZHyLdt8dQJsuMntmlru/4wrvCr+Vu95sndxhj52r3zA881W7hT
         wI6AZFgwJMYzKMUuw702Ymvt+Eif6CKHTpV6dl2vK5mT+rqD3HmzAhx+Eq62BHgN5YE1
         3BDZG3K5ANkz//FDp7im+z4pweuIsGKZd/laI4CLH2CLppcmgxOXu8mXIsw4Ll/OhBV7
         JQVw==
X-Gm-Message-State: AOJu0Yzcej0UKMyMtSwpJK4PwpgXupdZv3HNFaJ2Cv70dlUAHkx2O3R8
	pDAawHUMFyorZN0RBQSchq9hIE7KTvymjpPmBueFxk6kkXDpBjaetRxcUfjqqt3UtFdYCZT0nlg
	b
X-Gm-Gg: ASbGncuy0y+49BfEwGN2h7MwnC9P9xMT3sHgg9ebvjSvGsrzjoQ46BBeImjlXhUZuNH
	4acxVPRhmEdcRB+2oENmzoqPHAvYjOI8PrtCTrFNTiziGRfzming/9Dd4zGvGxnrdVA7WaRQQoo
	47L5lX/k7RYgE8eL9s5IECoYKVvomeFTKqN+XP4OgDeBpJiZqf2vuGZCy83wdlXlWSO/EPx/V8P
	uOIWa+fa7rOJJx/QFmQxUrd4gNpuT2BteYj35HRTtgsP4Mlat2SaHdnKmYO/uQXKvn4CJoMPidT
	XMOnu6DF8ZBgJJ2m4RkwTKiqmaXUatDvDeE=
X-Google-Smtp-Source: AGHT+IEY44KBD1aFubYN6jTShqSmWRM3+Po/JZz2E+Ydlym6ZuKZazjnHqe3n1F3LmG4zH6CwubL5Q==
X-Received: by 2002:a9d:7093:0:b0:72e:c42a:1797 with SMTP id 46e09a7af769-7304fb1402amr1617165a34.13.1745513439712;
        Thu, 24 Apr 2025 09:50:39 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7304f1a1b8dsm301061a34.17.2025.04.24.09.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:39 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 06/23] ipmi:msghandler: Use the system_wq, not system_bh_wq
Date: Thu, 24 Apr 2025 11:49:43 -0500
Message-ID: <20250424165020.627193-7-corey@minyard.net>
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

Everything can be run in thread context now, don't use the bh one.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 09e56e4141b7..c060be93562d 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -956,7 +956,7 @@ static int deliver_response(struct ipmi_smi *intf, struct ipmi_recv_msg *msg)
 			list_add_tail(&msg->link, &intf->user_msgs);
 			mutex_unlock(&intf->user_msgs_mutex);
 			release_ipmi_user(user, index);
-			queue_work(system_bh_wq, &intf->smi_work);
+			queue_work(system_wq, &intf->smi_work);
 		} else {
 			/* User went away, give up. */
 			ipmi_free_recv_msg(msg);
@@ -4892,7 +4892,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
 	if (run_to_completion)
 		smi_work(&intf->smi_work);
 	else
-		queue_work(system_bh_wq, &intf->smi_work);
+		queue_work(system_wq, &intf->smi_work);
 }
 EXPORT_SYMBOL(ipmi_smi_msg_received);
 
@@ -4902,7 +4902,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
 		return;
 
 	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
-	queue_work(system_bh_wq, &intf->smi_work);
+	queue_work(system_wq, &intf->smi_work);
 }
 EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
 
@@ -5071,7 +5071,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
 				       flags);
 	}
 
-	queue_work(system_bh_wq, &intf->smi_work);
+	queue_work(system_wq, &intf->smi_work);
 
 	return need_timer;
 }
@@ -5128,7 +5128,7 @@ static void ipmi_timeout(struct timer_list *unused)
 	if (atomic_read(&stop_operation))
 		return;
 
-	queue_work(system_bh_wq, &ipmi_timer_work);
+	queue_work(system_wq, &ipmi_timer_work);
 }
 
 static void need_waiter(struct ipmi_smi *intf)
-- 
2.43.0

